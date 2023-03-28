#[macro_use]
extern crate rocket;
extern crate rocket_db_pools;

use rocket::fs::FileServer;

#[launch]
fn launch() -> _ {
  rocket::build()
    .mount("/", FileServer::from("./static").rank(12))
}
