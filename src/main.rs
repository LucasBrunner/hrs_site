#![allow(dead_code)]

mod authentication;
mod data;
mod database;
mod js;
mod session;
mod validation;

#[macro_use]
extern crate rocket;
extern crate rocket_db_pools;

use authentication::prelude::*;
use database::Db;
use rocket::fs::FileServer;
use rocket_db_pools::Database;

#[launch]
fn launch() -> _ {
  rocket::build()
    .attach(Db::init())
    .mount("/", routes![signin])
    .mount("/", FileServer::from("./static").rank(12))
}
