use argon2::{Argon2, PasswordHasher};
use rocket::{http::CookieJar, serde::json::Json};
use rocket_db_pools::Connection;
use serde::{Deserialize, Serialize};

use crate::{authentication::login_destination, database::Db, session::LoginSesion};

#[derive(Debug, Deserialize, Serialize, Clone)]
#[serde(crate = "rocket::serde")]
#[serde(rename_all = "camelCase")]
pub struct EncodedSigninRequest {
  email: String,
  encoded_password: String,
  remember_login: bool,
}

impl EncodedSigninRequest {
  fn decode(self) -> Result<SigninRequest, SigninFailure> {
    let Ok(password) = urlencoding::decode(&self.encoded_password) else {
      return Err(SigninFailure::DecodeError);
    };
    Ok(SigninRequest {
      email: self.email.to_string(),
      password: password.to_string(),
      remember_login: self.remember_login,
    })
  }
}

pub struct SigninRequest {
  email: String,
  password: String,
  remember_login: bool,
}

#[derive(Debug, Deserialize, Serialize, Clone)]
#[serde(tag = "Type")]
pub enum SigninFailure {
  DecodeError,
  SigninFailure,
  DatabaseError,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(tag = "Type")]
pub enum SigninResult {
  #[serde(rename_all = "camelCase")]
  Ok { next_path: String },
  #[serde(rename_all = "camelCase")]
  Err { signin_failure: SigninFailure },
}

#[post("/signin", format = "json", data = "<signin_form>")]
pub async fn signin(
  cookies: &CookieJar<'_>,
  mut db: Connection<Db>,
  signin_form: rocket::serde::json::Json<EncodedSigninRequest>,
) -> Json<SigninResult> {
  let decoded_signin = match signin_form.into_inner().decode() {
    Ok(ok) => ok,
    Err(err) => {
      println!("could not decode signin");
      return Json(SigninResult::Err {
        signin_failure: err,
      });
    }
  };

  let query = sqlx::query!(
    r#"
      SELECT 
        `account_id`, 
        `hashed_password`, 
        `salt` 
      FROM `Account` 
      WHERE `email` = ?;
    "#,
    decoded_signin.email
  )
  .fetch_one(&mut *db)
  .await;

  let Ok(account) = query else {
    println!("database query failed"); 
    return Json(SigninResult::Err{signin_failure: SigninFailure::DatabaseError});
  };

  let argon2 = Argon2::default();
  let Ok(password_check) = argon2.hash_password(&decoded_signin.password.as_bytes(), &account.salt) else {
    println!("password hash failed, hash failed");
    return Json(SigninResult::Err{signin_failure: SigninFailure::SigninFailure});
  };

  let Some(hash_check) = password_check.hash else {
    println!("password hash failed, no hash");
    return Json(SigninResult::Err{signin_failure: SigninFailure::SigninFailure});
  };

  if hash_check.to_string() != account.hashed_password {
    println!("passwords do not match");
    let out = SigninResult::Err {
      signin_failure: SigninFailure::SigninFailure,
    };
    return Json(out);
  }

  println!("Account logged in! email: {}", decoded_signin.email);
  if let Ok(cookie) =
    LoginSesion::new_cookie(&mut db, decoded_signin.remember_login, account.account_id).await
  {
    println!("add cookie");
    cookies.add_private(cookie);
  }

  Json(SigninResult::Ok {
    next_path: login_destination(account.account_id, &mut db).await.to_owned(),
  })
}
