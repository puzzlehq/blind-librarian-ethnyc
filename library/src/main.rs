use actix_cors::Cors;
use actix_web::{
    get,
    middleware::Logger,
    web::{self, Data},
    App, HttpResponse, HttpServer,
};
use env_logger::Env;
use serde::{Deserialize, Serialize};
use sunscreen::{
    fhe_program,
    types::{bfv::Signed, Cipher},
    Ciphertext, CompiledFheProgram, Compiler, Error, FheProgramInput, FheRuntime, Params,
    PrivateKey, PublicKey,
};

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

struct Server {
    // Compiled database query program
    pub compiled_lookup: CompiledFheProgram,

    // FHE lookup server runtim
    runtime: FheRuntime,
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
    col_query: Ciphertext,
    row_query: Ciphertext,
    public_key: PublicKey,
}

// This handler uses json extractor
async fn index(item: web::Json<MyObj>) -> HttpResponse {
    println!("model: {:?}", &item);
    HttpResponse::Ok().json(item.0) // <- send response
}

// This is the actual api command
async fn grab_book(book: web::Json<BookReq>) -> HttpResponse {
    let req = book.into_inner();
    let col_query = req.col_query;
    let row_query = req.row_query;
    let public_key = req.public_key;


    let res = col_query;
    HttpResponse::Ok().json(res)
}


#[actix_web::main]
async fn main() -> std::io::Result<()> {
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
            .service(web::resource("/").route(web::post().to(index)))
            .service(web::resource("/grab_book").route(web::post().to(grab_book)))

    })
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}
