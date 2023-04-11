use rocket::{
  http::{Cookie, CookieJar, Status},
  serde::json::serde_json,
  time::{Duration, OffsetDateTime}, request::{FromRequest, Outcome}, Request,
};
use rocket_db_pools::{sqlx, Connection};
use serde::{Deserialize, Serialize};

use crate::database::Db;

pub static DEFAULT_LOGIN_SESSION_DURATION: Duration = Duration::hours(6);
pub static REMEMBER_LOGIN_SESSION_DURATION: Duration = Duration::days(30);

fn session_experation_date(experation_date: Option<OffsetDateTime>) -> OffsetDateTime {
  match experation_date {
    Some(date) => date,
    None => OffsetDateTime::now_utc() + DEFAULT_LOGIN_SESSION_DURATION,
  }
}

#[derive(Debug, Clone, Copy, Serialize)]
#[serde(tag = "Type")]
pub enum SessionError {
  NoCookie,
  InvalidCookie,
  Expired,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct LoginSesion {
  pub session_id: u64,
  pub experation_date: Option<OffsetDateTime>,
  pub account_id: u64,
}

impl LoginSesion {
  pub async fn new(
    db: &mut Connection<Db>,
    remember_login: bool,
    account_id: u64,
  ) -> Result<LoginSesion, ()> {
    let experation_date = if remember_login {
      Some(OffsetDateTime::now_utc() + REMEMBER_LOGIN_SESSION_DURATION)
    } else {
      None
    };
    let result = sqlx::query!(
      r#"
        INSERT INTO `Session` (
          `account_id`,
          `experation_timestamp`
        )
        VALUES (
          ?,
          ?
        );
        "#,
      account_id,
      session_experation_date(experation_date).unix_timestamp()
    )
    .execute(&mut **db)
    .await;

    match result {
      Ok(query_result) => Ok(LoginSesion {
        session_id: query_result.last_insert_id(),
        experation_date,
        account_id,
      }),
      Err(err) => {
        println!("{:?}", err);
        Err(())
      }
    }
  }

  pub fn cookie(&self) -> Result<Cookie<'static>, ()> {
    let session_string = match serde_json::to_string(&self) {
      Ok(json) => json,
      Err(_) => return Err(()),
    };

    let cookie = Cookie::build("session", session_string)
      .expires(self.experation_date)
      .same_site(rocket::http::SameSite::Strict)
      .http_only(false)
      .secure(false)
      .finish();

    Ok(cookie)
  }

  pub async fn new_cookie(
    db: &mut Connection<Db>,
    remember_login: bool,
    account_id: u64,
  ) -> Result<Cookie<'static>, ()> {
    Self::new(db, remember_login, account_id).await?.cookie()
  }

  pub async fn is_not_expired(&self, db: &mut Connection<Db>) -> bool {
    let query = sqlx::query!(
      r#"
        SELECT `experation_timestamp`
        FROM `Session`
        WHERE `Session`.`session_id` = ?;
        "#,
      self.session_id
    )
    .fetch_one(&mut **db)
    .await;

    let Ok(session) = query else {
      return false;
    };

    session.experation_timestamp > OffsetDateTime::now_utc().unix_timestamp()
  }

  pub async fn is_expired(&self, db: &mut Connection<Db>) -> bool {
    !self.is_not_expired(db).await
  }

  pub async fn get_session_if_valid(
    db: &mut Connection<Db>,
    cookies: &CookieJar<'_>,
  ) -> Result<LoginSesion, SessionError> {
    let Some(session_cookie) = cookies.get_private("session") else {
      return Err(SessionError::NoCookie);
    };

    let Ok(session) = serde_json::from_str::<LoginSesion>(session_cookie.value()) else {
      return Err(SessionError::InvalidCookie);
    };

    if session.is_expired(db).await {
      return Err(SessionError::Expired);
    }

    Ok(session)
  }
}

#[rocket::async_trait]
impl<'r> FromRequest<'r> for LoginSesion {
  type Error = ();

  async fn from_request(req: &'r Request<'_>,) -> Outcome<Self, Self::Error> {
    let mut db = match req.guard::<Connection<Db>>().await {
      rocket::outcome::Outcome::Success(db) => db,
      rocket::outcome::Outcome::Failure(_) => return Outcome::Failure((Status::Forbidden, ())),
      rocket::outcome::Outcome::Forward(_) => return Outcome::Failure((Status::Forbidden, ())),
    };

    match LoginSesion::get_session_if_valid(&mut db, req.cookies()).await {
      Ok(session) => Outcome::Success(session),
      Err(_) => Outcome::Failure((Status::Forbidden, ())),
    }
  }
}