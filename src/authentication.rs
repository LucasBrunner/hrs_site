use rocket::{
  http::{Status, Cookie},
  request::{FromRequest, Outcome},
  Request, Route,
};
use rocket_db_pools::Connection;

use crate::{database::Db, session::LoginSesion};

pub mod empoyee;
pub mod signin;
pub mod signup;

pub fn authentication_routes() -> Vec<Route> {
  routes![signin::signin, signup::signup, sign_out_everywhere]
}

#[post("/signout_everywhere")]
pub async fn sign_out_everywhere(
  mut db: Connection<Db>,
  auth_session: AuthSession,
) -> Status {
  let session_end_result = sqlx::query!(
    r#"
      DELETE FROM `Session`
      WHERE `account_id` = ?;
    "#,
    auth_session.session.account_id,
  )
  .execute(&mut *db)
  .await;

  match session_end_result {
    Ok(_) => Status::Ok,
    Err(_) => Status::InternalServerError,
  }
}

pub async fn is_account_employee(account_id: u64, db: &mut Connection<Db>) -> bool {
  let query = sqlx::query!(
    r#"
      SELECT `Account`.`account_id`
      FROM 
        `Account`
        INNER JOIN `AccountTypeRecord` USING(`account_id`)
        INNER JOIN `AccountType` USING(`account_type_id`)
      WHERE
        `AccountType`.`name` = "employee"
        AND `Account`.`account_id` = ?;
    "#,
    account_id,
  )
  .fetch_one(&mut **db)
  .await;

  query.is_ok()
}

pub async fn login_destination(account_id: u64, db: &mut Connection<Db>) -> &str {
  if is_account_employee(account_id, db).await {
    "/employee"
  } else {
    "/home.html"
  }
}

pub struct AuthSession {
  pub session: LoginSesion,
}

#[rocket::async_trait]
impl<'r> FromRequest<'r> for AuthSession {
  type Error = ();

  async fn from_request(req: &'r Request<'_>) -> Outcome<Self, Self::Error> {
    let mut db = match req.guard::<Connection<Db>>().await {
      rocket::outcome::Outcome::Success(db) => db,
      rocket::outcome::Outcome::Failure(_) => return Outcome::Failure((Status::NotFound, ())),
      rocket::outcome::Outcome::Forward(_) => return Outcome::Failure((Status::NotFound, ())),
    };

    match LoginSesion::get_session_if_valid(&mut db, req.cookies()).await {
      Ok(session) => Outcome::Success(AuthSession { session }),
      Err(_) => {
        req.cookies().remove_private(Cookie::named("session"));
        Outcome::Failure((Status::Unauthorized, ()))
      },
    }
  }
}
