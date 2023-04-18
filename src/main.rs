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

use std::path::{PathBuf, Path};

use authentication::{prelude::*, AuthSession};
use data::{inventory::get_product_page, account::{get_account_info, update_account_info}};
use database::Db;
use rocket::fs::NamedFile;
use rocket_db_pools::Database;

#[rocket::get("/<path..>")]
async fn public_fs(path: PathBuf) -> Option<NamedFile> {
  let mut path = Path::new("./static/public").join(path);
  if path.is_dir() {
    path.push("index.html");
  } else if !path.is_file() {
    if let Some(p) = path.to_str() {
      let new_path = p.to_owned() + ".html";
      path = Path::new(&new_path).to_path_buf();
    }
  } 

  NamedFile::open(path).await.ok()
}

#[rocket::get("/customer/<path..>")]
pub async fn customer_fs(path: PathBuf, _auth: AuthSession) -> Option<NamedFile> {
  let mut path = Path::new("./static/customer").join(path);
  if path.is_dir() {
    path.push("index.html");
  } else if !path.is_file() {
    if let Some(p) = path.to_str() {
      let new_path = p.to_owned() + ".html";
      path = Path::new(&new_path).to_path_buf();
    }
  } 

  NamedFile::open(path).await.ok()
}

#[launch]
fn launch() -> _ {
  rocket::build()
    .attach(Db::init())
    .mount("/data/employee", authentication::empoyee::employee_data_routes())
    .mount("/data/account", routes![get_account_info, update_account_info])
    .mount("/data/public", routes![get_product_page])
    .mount("/", routes![signin, signup])
    .mount("/", routes![authentication::employee_fs])
    .mount("/", routes![customer_fs])
    .mount("/", routes![public_fs])
}
