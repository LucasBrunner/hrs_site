use rocket::{
  http::{Status, Cookie},
  request::{FromRequest, Outcome},
  Request, Route,
};
use rocket_db_pools::Connection;

use crate::{
  data::{
    inventory::get_inventory_item_data,
    warehouses::get_warehouses,
    warehouse::{get_warehouse_inventory, post_warehouse_inventory}, account::search_account,
  },
  database::Db,
  session::LoginSesion,
};

use super::is_account_employee;

pub fn employee_crud_routes() -> Vec<Route> {
  routes![
    get_warehouses,
    get_warehouse_inventory,
    get_inventory_item_data,
    post_warehouse_inventory,
    search_account,
  ]
}

pub struct AuthAccountEmployee();

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
      req.cookies().remove_private(Cookie::named("session"));
      return Outcome::Failure((Status::Forbidden, ()));
    };

    if is_account_employee(session.account_id, &mut db).await {
      Outcome::Success(AuthAccountEmployee())
    } else {
      Outcome::Failure((Status::Forbidden, ()))
    }
  }
}
