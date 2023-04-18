use std::path::{Path, PathBuf};

use rocket::{
  fs::NamedFile,
  http::Status,
  request::{FromRequest, Outcome},
  Request,
};
use rocket_db_pools::Connection;

use crate::{database::Db, session::LoginSesion, authentication::empoyee::AuthAccountEmployee};

pub mod signin;
pub mod signup;
pub mod empoyee;

pub mod prelude {
  pub use super::signin::signin;
  pub use super::signup::signup;
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

#[rocket::get("/employee/<path..>")]
pub async fn employee_fs(path: PathBuf, _auth: AuthAccountEmployee) -> Option<NamedFile> {
  let mut path = Path::new("./static/employee").join(path);
  if path.is_dir() {
    path.push("index.html");
  }

  NamedFile::open(path).await.ok()
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
      Err(_) => Outcome::Failure((Status::Unauthorized, ())),
    }
  }
}
