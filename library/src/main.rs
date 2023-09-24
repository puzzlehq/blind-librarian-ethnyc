use std::env;
use actix_cors::Cors;
use actix_web::{
    get,
    middleware::Logger,
    web::{self, Data},
    App, HttpResponse, HttpServer,
};
use env_logger::Env;
use reqwest::Response;
use serde::{Deserialize, Serialize};
use base64::{Engine as _, engine::{self, general_purpose}, alphabet};
use sunscreen::{
    fhe_program,
    types::{bfv::Signed, Cipher},
    Ciphertext, CompiledFheProgram, Compiler, Error, FheProgramInput, FheRuntime, Params,
    PrivateKey, PublicKey,
};
use dotenv::dotenv;
use serde_json;

const SQRT_DATABASE_SIZE: usize = 10;

#[fhe_program(scheme = "bfv")]
// this is purely a lookup server with hardcoded DB in it
// the compiled runtime is based on this lookup program
fn lookup(
    col_query: [Cipher<Signed>; SQRT_DATABASE_SIZE],
    row_query: [Cipher<Signed>; SQRT_DATABASE_SIZE],
    database: [[Signed; SQRT_DATABASE_SIZE]; SQRT_DATABASE_SIZE],
) -> Cipher<Signed> {
    let mut col = [col_query[0]; SQRT_DATABASE_SIZE];

    for i in 0..SQRT_DATABASE_SIZE {
        for j in 0..SQRT_DATABASE_SIZE {
            if j == 0 {
                col[i] = database[i][j] * col_query[j];
            } else {
                col[i] = col[i] + database[i][j] * col_query[j];
            }
        }
    }

    let mut sum = col[0] * row_query[0];

    for i in 1..SQRT_DATABASE_SIZE {
        sum = sum + col[i] * row_query[i];
    }

    sum
}

pub struct Server {
    // Compiled database query program
    pub compiled_lookup: CompiledFheProgram,

    // FHE lookup server runtim
    pub runtime: FheRuntime,
}

impl Server {
    pub fn setup() -> Result<Server, Error> {
        let app = Compiler::new().fhe_program(lookup).compile()?;

        let runtime = FheRuntime::new(app.params())?;

        Ok(Server {
            compiled_lookup: app.get_fhe_program(lookup).unwrap().clone(),
            runtime,
        })
    }

    pub fn run_query(
        &self,
        col_query: Ciphertext,
        row_query: Ciphertext,
        public_key: &PublicKey,
    ) -> Result<Ciphertext, Error> {
        // Lmao just a heads up we are setting up DB here
        let mut database = [[Signed::from(0); SQRT_DATABASE_SIZE]; SQRT_DATABASE_SIZE];
        let mut val = Signed::from(400);

        for row in database.iter_mut() {
            for entry in row.iter_mut() {
                *entry = val;
                val = val + 1;
            }
        }

        let args: Vec<FheProgramInput> = vec![col_query.into(), row_query.into(), database.into()];

        let results = self.runtime.run(&self.compiled_lookup, args, public_key)?;

        Ok(results[0].clone())
    }
}


#[derive(Debug, Serialize, Deserialize)]
struct MyObj {
    name: String,
    number: i32,
}

#[derive(Serialize, Deserialize)]
struct BookReq {
    col_query: String,
    row_query: String,
    public_key: String,
}


pub async fn get_subscribers() -> Result<Vec<String>, Error> {
    let client = reqwest::Client::new();
    let res = client
        .get("https://notify.walletconnect.com/260b4325652ee6fd0b8c4d8ec52e0e16/subscribers")
        .header("Authorization", "Bearer ba74a53b-64a4-4689-bc56-8a872b187ee3")
        .send()
        .await;

    let subs: Vec<String> = res.expect("PASS").json().await.unwrap();

    Ok(subs)
}


pub async fn notify_librarian() -> HttpResponse {
    let subs = get_subscribers().await.unwrap();
    let data = &serde_json::json!({
        "accounts": subs,
        "notification": {
            "title": "GM Hackers!",
            "body": "Enjoy hacking on WalletConnect",
            "icon": "https://avatars.githubusercontent.com/u/37784886?s=48&v=4",
            "url": "https://hackers.gm.walletconnect.com/",
            "type": "promotional",
        },
    });

    let json_data = serde_json::to_string(&data).unwrap();

    let client = reqwest::Client::new();
    let response = client
        .post("https://notify.walletconnect.com/260b4325652ee6fd0b8c4d8ec52e0e16/notify")
        .header("Authorization", "Bearer ba74a53b-64a4-4689-bc56-8a872b187ee3")
        .header("Content-Type", "application/json")
        .body(json_data.to_owned())
        .send()
        .await;
    
    HttpResponse::Ok().into()
}

// This handler uses json extractor
async fn index(item: web::Json<MyObj>) -> HttpResponse {
    println!("model: {:?}", &item);
    // let _result = notify_librarian();
    HttpResponse::Ok().json(item.0) // <- send response
}

// This is the actual api command
async fn grab_book(book: web::Json<BookReq>) -> HttpResponse {

    // Passing Notifications to Librarian that a book has been requested
    let client = reqwest::Client::new();
    let res = client
        .get("https://notify.walletconnect.com/260b4325652ee6fd0b8c4d8ec52e0e16/subscribers")
        .header("Authorization", "Bearer ba74a53b-64a4-4689-bc56-8a872b187ee3")
        .send()
        .await;

    let subs: Vec<String> = res.expect("JSON").json().await.unwrap();
    println!("body text is: {:?}", subs);

    let data = &serde_json::json!({
        "accounts": subs,
        "notification": {
            "title": "GM Hackers!",
            "body": "Enjoy hacking on WalletConnect",
            "icon": "https://avatars.githubusercontent.com/u/37784886?s=48&v=4",
            "url": "https://hackers.gm.walletconnect.com/",
            "type": "promotional",
        },
    });
    println!("Data is {:?}", data);
    let json_data = serde_json::to_string(&data).unwrap();
    println!("Json Data is {:?}", json_data);
    println!("Bopping into the new post");
    
    let client = reqwest::Client::new();
    let response = client
        .post("https://notify.walletconnect.com/260b4325652ee6fd0b8c4d8ec52e0e16/notify")
        .header("Authorization", "Bearer ba74a53b-64a4-4689-bc56-8a872b187ee3")
        .header("Content-Type", "application/json")
        .body(json_data.to_owned())
        .send()
        .await;

    
    let req = book.into_inner();
    let decoded_col_query = general_purpose::STANDARD.decode(&req.col_query).unwrap();
    let col_query = sunscreen::Ciphertext::from(bincode::deserialize(&decoded_col_query).unwrap());
    let decoded_row_query = general_purpose::STANDARD.decode(&req.row_query).unwrap();
    let row_query = sunscreen::Ciphertext::from(bincode::deserialize(&decoded_row_query).unwrap());
    let decoded_public_key = general_purpose::STANDARD.decode(&req.public_key).unwrap();
    let public_key = sunscreen::PublicKey::from(bincode::deserialize(&decoded_public_key).unwrap());

    let server = Server::setup().unwrap();
    let res_ciphertext = server.run_query(col_query, row_query, &public_key).unwrap();

    // transforming result ciphertext into string to send in json
    let encoded = bincode::serialize(&res_ciphertext).unwrap();
    let encoded_arr = &encoded[..];
    let encoded_b64 = general_purpose::STANDARD.encode(encoded_arr);


    // let res = col_query;
    HttpResponse::Ok().json(encoded_b64)
    // match response {
    //     Ok(response) => HttpResponse::Ok().json(encoded_b64),
    //     Err(err) => HttpResponse::InternalServerError().body(err.to_string())
    // }
}


#[tokio::main]
async fn main() -> std::io::Result<()> {
    // Set up the env
    dotenv().ok();


    // Set up the logger
    env_logger::init_from_env(Env::default().default_filter_or("info"));
    
    // Start the server
    HttpServer::new(move || {
        App::new()
            .wrap(
                Cors::default()
                .allow_any_header()
                .allow_any_origin()
                .allowed_methods(vec!["GET", "POST", "PUT"]),
            )
            .wrap(Logger::default())
            .app_data(web::JsonConfig::default().limit(16_777_216))
            .service(web::resource("/")
                .route(web::post().to(notify_librarian))
                .route(web::post().to(index))
            )
            .service(web::resource("/grab_book")
                .route(web::post().to(notify_librarian))
                .route(web::post().to(grab_book)))

    })
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}
