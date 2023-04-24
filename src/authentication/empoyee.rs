use rocket::{
  http::{Status, Cookie},
  request::{FromRequest, Outcome},
  Request,
};
use rocket_db_pools::Connection;

use crate::{
  database::Db,
  session::LoginSesion,
};

use super::is_account_employee;

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

    let Ok(session) = LoginSesion::get_session(req.cookies()).await else {
      print!("invalid session!");
      req.cookies().remove_private(Cookie::named("session"));
      return Outcome::Failure((Status::NotFound, ()));
    };

    if is_account_employee(session.account_id, &mut db).await {
      match session.is_expired(&mut db).await {
        true => Outcome::Failure((Status::Forbidden, ())),
        false => Outcome::Success(AuthAccountEmployee()),
      }
    } else {
      Outcome::Failure((Status::NotFound, ()))
    }
  }
}
