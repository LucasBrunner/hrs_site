#![allow(dead_code)]

mod authentication;
mod data;
mod data_access_web;
mod database;
mod js;
mod session;
mod validation;

#[macro_use]
extern crate rocket;
extern crate rocket_db_pools;

use std::path::{PathBuf, Path};

use authentication::{AuthSession, empoyee::AuthAccountEmployee};
use database::Db;
use rocket::fs::NamedFile;
use rocket_db_pools::Database;

#[rocket::get("/<path..>", rank = 10)]
pub async fn employee_fs(path: PathBuf, _auth: AuthAccountEmployee) -> Option<NamedFile> {
  let mut path = Path::new("./static/employee").join(path);
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

#[rocket::get("/<path..>", rank = 10)]
pub async fn customer_fs(path: PathBuf, _auth: AuthSession) -> Option<NamedFile> {
  let mut path = Path::new("./static/account").join(path);
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

#[rocket::get("/<path..>", rank = 20)]
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

#[launch]
fn launch() -> _ {
  rocket::build()
    .attach(Db::init())
    .mount("/data", data_access_web::data_routes())
    .mount("/", authentication::authentication_routes())
    .mount("/employee", routes![employee_fs])
    .mount("/account", routes![customer_fs])
    .mount("/", routes![public_fs])
}
