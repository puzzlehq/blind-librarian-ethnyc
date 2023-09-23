use actix_cors::Cors;
use actix_web::{
    get,
    middleware::Logger,
    web::{self, Data},
    App, HttpResponse, HttpServer,
};
use env_logger::Env;
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
struct MyObj {
    name: String,
    number: i32,
}

/// This handler uses json extractor
async fn index(item: web::Json<MyObj>) -> HttpResponse {
    println!("model: {:?}", &item);
    HttpResponse::Ok().json(item.0) // <- send response
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

    })
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}
