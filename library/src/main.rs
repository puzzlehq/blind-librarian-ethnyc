use actix_cors::Cors;
use actix_web::{
    get,
    middleware::Logger,
    web::{self, Data},
    App, HttpResponse, HttpServer,
};
use env_logger::Env;

// Healthcheck endpoint
#[get("/healthz")]
async fn healthcheck(_: Data<Context>) -> HttpResponse {
  HttpResponse::Ok().body("healthz")
}

#[tokio::main]
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
            .service(healthcheck)


    })
    .bind(("0.0.0.0", 8080))
    .run()
    .await
}
