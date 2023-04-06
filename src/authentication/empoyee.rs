use rocket::{request::{FromRequest, Outcome}, Request, http::Status, Route};
use rocket_db_pools::Connection;

use crate::{database::Db, session::LoginSesion, data::{warehouse::warehouses, inventory::{warehouse_inventory, get_inventory_item_data, warehouse_inventory_manual_update}}};

use super::is_account_employee;

pub fn employee_data_routes() -> Vec<Route> {
  routes![warehouses, warehouse_inventory, get_inventory_item_data, warehouse_inventory_manual_update]
}

pub struct AuthAccountEmployee ();

#[rocket::async_trait]
impl<'r> FromRequest<'r> for AuthAccountEmployee {
  type Error = ();

  async fn from_request(req: &'r Request<'_>) -> Outcome<Self, Self::Error> {
    let mut db = match req.guard::<Connection<Db>>().await {
      rocket::outcome::Outcome::Success(db) => db,
      rocket::outcome::Outcome::Failure(_) => return Outcome::Failure((Status::NotFound, ())),
      rocket::outcome::Outcome::Forward(_) => return Outcome::Failure((Status::NotFound, ())),
    };

    let Ok(session) = LoginSesion::get_session_if_valid(&mut db, req.cookies()).await else {
      print!("invalid session!");
      return Outcome::Failure((Status::Forbidden, ()));
    };

    if is_account_employee(session.account_id, &mut db).await {
      Outcome::Success(AuthAccountEmployee())
    } else {
      Outcome::Failure((Status::Forbidden, ()))
    }
  }
}
