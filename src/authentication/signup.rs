use argon2::{password_hash::SaltString, Argon2, PasswordHasher};
use rand::rngs::OsRng;
use rocket::{
  http::CookieJar,
  post,
  serde::{json::Json, *},
};
use rocket_db_pools::{sqlx, Connection};
use validator::{Validate, ValidationError, ValidationErrors};

use crate::{
  database::Db,
  js::uri::decode,
  session::LoginSesion,
  validation::{password::InvalidPassword, prelude::*, username::InvalidUsername},
};

use super::login_destination;

#[derive(Debug, Deserialize, Serialize)]
#[serde(crate = "rocket::serde")]
#[serde(rename_all = "camelCase")]
pub struct EncodedSignupRequest {
  email: String,
  preferred_name: String,
  legal_name: String,
  encoded_password: String,
  remember_login: bool,
}

impl EncodedSignupRequest {
  fn decode(self) -> Result<SignupRequest, SignupFailure> {
    let Ok(decoded_password) = decode(&self.encoded_password, "") else {
      return Err(SignupFailure::DecodeError);
    };

    Ok(SignupRequest {
      email: self.email,
      preferred_name: self.preferred_name,
      legal_name: self.legal_name,
      password: decoded_password,
      remember_login: self.remember_login,
    })
  }
}

#[derive(Debug, Validate)]
struct SignupRequest {
  #[validate(email)]
  email: String,
  preferred_name: String,
  legal_name: String,
  #[validate(
    length(min = 8, max = 256),
    custom = "non_space_first_last_characters",
    custom = "string_contains_password_chars"
  )]
  password: String,
  remember_login: bool,
}

impl SignupRequest {
  async fn validate_signup(&self, db: &mut Connection<Db>) -> Result<(), Vec<SignupFailure>> {
    if let Err(errs) = self.validate() {
      return Err(SignupFailure::from_validation_errors(errs));
    };

    let does_email_exist =
      sqlx::query!("SELECT `account_id` FROM `Account` WHERE `email` = ?;", self.email)
        .fetch_all(&mut **db)
        .await;

    match does_email_exist {
      Ok(results) => {
        if !results.is_empty() {
          return Err(vec![SignupFailure::EmailAlreadyUsed]);
        }
      }
      Err(_) => return Err(vec![SignupFailure::UnknownError]),
    };

    Ok(())
  }

  fn hash(self) -> Result<HashedSignupRequest, SignupFailure> {
    let salt = SaltString::generate(&mut OsRng);
    let argon2 = Argon2::default();

    let Ok(password_hash) = argon2.hash_password(self.password.as_bytes(), &salt) else {
      return Err(SignupFailure::UnknownError);
    };
    println!("{:?}", password_hash);

    let Some(hash) = password_hash.hash else {
      return Err(SignupFailure::UnknownError);
    };

    Ok(HashedSignupRequest {
      email: self.email,
      preferred_name: self.preferred_name,
      legal_name: self.legal_name,
      hashed_password: hash.to_string(),
      salt: salt.to_string(),
      remember_login: self.remember_login,
    })
  }
}

#[derive(Debug)]
pub struct HashedSignupRequest {
  email: String,
  preferred_name: String,
  legal_name: String,
  hashed_password: String,
  salt: String,
  remember_login: bool,
}

impl HashedSignupRequest {
  async fn commit(self, db: &mut Connection<Db>) -> Result<u64, ()> {
    let result = sqlx::query!(
      r#"
        INSERT INTO `Account`(
          `email`,
          `preferred_name`,
          `legal_name`,
          `hashed_password`,
          `salt`,
          `closed`
        )
        VALUES (
          ?,
          ?,
          ?,
          ?,
          ?,
          ?
        );
        "#,
      self.email,
      self.preferred_name,
      self.legal_name,
      self.hashed_password,
      self.salt,
      false
    )
    .execute(&mut **db)
    .await;
    match result {
      Ok(signup_result) => Ok(signup_result.last_insert_id()),
      Err(_) => Err(()),
    }
  }
}

#[derive(Debug, Deserialize, Serialize)]
#[serde(tag = "Type")]
pub enum SignupFailure {
  #[serde(rename_all = "camelCase")]
  InvalidPassword {
    invalid_password: InvalidPassword,
  },
  #[serde(rename_all = "camelCase")]
  InvalidUsername {
    invalid_username: InvalidUsername,
  },
  InvalidEmail,
  DecodeError,
  EmailAlreadyUsed,
  UnknownError,
}

impl SignupFailure {
  pub fn from_validation_error(field: &str, error: &ValidationError) -> SignupFailure {
    println!("{}: {:?}", field, error);
    match field {
      "password" => SignupFailure::InvalidPassword {
        invalid_password: InvalidPassword::from_validation_error(error),
      },
      "username" => SignupFailure::InvalidUsername {
        invalid_username: InvalidUsername::from_validation_error(error),
      },
      "email" => SignupFailure::InvalidEmail,
      _ => SignupFailure::UnknownError,
    }
  }

  pub fn from_validation_errors(validation_errors: ValidationErrors) -> Vec<SignupFailure> {
    validation_errors
      .field_errors()
      .iter()
      .map(|(field, error)| {
        error
          .iter()
          .map(|error| SignupFailure::from_validation_error(field, error))
          .collect::<Vec<_>>()
      })
      .reduce(|mut acc, mut item| {
        acc.append(&mut item);
        acc
      }).unwrap_or_default()
  }

  pub fn json_err_vec(self) -> Json<SignupResult> {
    Json(SignupResult::Err {
      signup_failure: vec![self],
    })
  }
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(tag = "Type")]
pub enum SignupResult {
  #[serde(rename_all = "camelCase")]
  Ok { next_path: String },
  #[serde(rename_all = "camelCase")]
  Err { signup_failure: Vec<SignupFailure> },
}

// https://blog.logrocket.com/rust-web-apps-using-rocket-framework/
#[post("/signup", format = "json", data = "<encoded_signup>")]
pub async fn signup(
  mut db: Connection<Db>,
  cookies: &CookieJar<'_>,
  encoded_signup: rocket::serde::json::Json<EncodedSignupRequest>,
) -> Json<SignupResult> {
  let decoded_signup = match encoded_signup.into_inner().decode() {
    Ok(ok) => ok,
    Err(err) => return err.json_err_vec(),
  };

  if let Err(err) = decoded_signup.validate_signup(&mut db).await {
    let err = SignupResult::Err {
      signup_failure: err,
    };
    return Json(err);
  };

  let hashed_signup = match decoded_signup.hash() {
    Ok(ok) => ok,
    Err(err) => return err.json_err_vec(),
  };

  let remember_login = hashed_signup.remember_login;

  match hashed_signup.commit(&mut db).await {
    Ok(account_id) => {
      if let Ok(cookie) = LoginSesion::new_cookie(&mut db, remember_login, account_id).await {
        cookies.add_private(cookie);
      }

      Json(SignupResult::Ok {
        next_path: login_destination(account_id, &mut db).await.to_owned(),
      })
    }
    Err(_) => SignupFailure::UnknownError.json_err_vec(),
  }
}
