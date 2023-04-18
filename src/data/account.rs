use std::io::Cursor;

use rocket::{response::{Responder, self}, http::{ContentType, Status}, Response};
use rocket_db_pools::Connection;
use serde::{Serialize, Deserialize};

use crate::{authentication::AuthSession, database::Db};

use super::{
  basic_data::{address::Address, phone::Phone},
  DataError, DataWithId, UpdateType,
};

#[derive(Serialize, Clone)]
#[serde(rename_all = "camelCase")]
pub struct AccountPublicData {
  pub email: String,
  pub preferred_name: String,
  pub legal_name: String,
}

#[derive(Serialize, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Account {
  pub data: AccountPublicData,
  pub phones: Vec<DataWithId<Phone>>,
  pub addresses: Vec<DataWithId<Address>>,
}

#[derive(Serialize)]
#[serde(tag = "Type")]
pub enum AccountResult {
  #[serde(rename_all = "camelCase")]
  Err { err: DataError },
  #[serde(rename_all = "camelCase")]
  Ok { account: Account },
}

pub enum ApiResponse {
  WithBody{
    json: String,
    status: Status,
  },
  WithoutBody{
    status: Status,
  },
}

impl ApiResponse {
  fn status(&self) -> Status {
    match self {
      ApiResponse::WithBody { json: _, status } => *status,
      ApiResponse::WithoutBody { status } => *status,
    }
  }
  
  fn json(&self) -> String {
    match self {
      ApiResponse::WithBody { json, status: _ } => json.to_owned(),
      ApiResponse::WithoutBody { status: _ } => "".to_owned(),
    }
  }
}

impl<'r> Responder<'r, 'static> for ApiResponse {
  fn respond_to(self, _: &'r rocket::Request<'_>) -> response::Result<'static> {
    let json = self.json();
    Response::build()
      .status(self.status())
      .header(ContentType::JSON)
      .sized_body(json.len(), Cursor::new(json))
      .ok()
  }
}

#[get("/")]
pub async fn get_account_info(
  mut db: Connection<Db>,
  _auth_session: AuthSession,
) -> ApiResponse {
  let account_query: Result<AccountPublicData, sqlx::Error> = sqlx::query_as!(
    AccountPublicData,
    r#"
        SELECT
          `email`,
          `preferred_name`,
          `legal_name`
        FROM 
          `Account`
        WHERE `account_id` = ?;
      "#,
    _auth_session.session.account_id,
  )
  .fetch_one(&mut **db)
  .await;

  let address_query = sqlx::query_as::<_, DataWithId<Address>>(&format!(
    r#"
      SELECT
        `address_id`,
        `street`,
        `city`,
        `state`,
        `zip`
      FROM 
        `Address`
        INNER JOIN `AccountAddress` USING(address_id)
      WHERE `account_id` = {};
    "#,
    _auth_session.session.account_id,
  ))
  .fetch_all(&mut **db)
  .await;

  let phone_query = sqlx::query_as::<_, DataWithId<Phone>>(&format!(
    r#"
    SELECT
      `Phone`.`phone_id`,
      `Phone`.`number`,
      `PhoneType`.`phone_type_id` AS "phone_type"
    FROM 
      `Phone`
      INNER JOIN `PhoneType` USING(phone_type_id)
      INNER JOIN `AccountPhone` USING(phone_id)
    WHERE `account_id` = {};
    "#,
    _auth_session.session.account_id,
  ))
  .fetch_all(&mut **db)
  .await;

  let Ok(account_data) = account_query else {
    return ApiResponse::WithoutBody { status: Status::InternalServerError };
  };

  let Ok(address_data) = address_query else {
    return ApiResponse::WithoutBody { status: Status::InternalServerError };
  };

  let Ok(phone_data) = phone_query else {
    return ApiResponse::WithoutBody { status: Status::InternalServerError };
  };

  println!(
    "{:?}",
    serde_json::to_string(
      &Account {
        data: account_data.clone(),
        phones: phone_data.clone(),
        addresses: address_data.clone(),
      }
    )
  );
  ApiResponse::WithBody { json: serde_json::to_string(
    &Account {
      data: account_data.clone(),
      phones: phone_data.clone(),
      addresses: address_data.clone(),
    }
  ).unwrap(), status: Status::Ok, }
}

#[derive(Deserialize, Clone)]
#[serde(rename_all = "camelCase")]
pub struct AccountUpdate {
  email: UpdateType<String>,
  preferred_name: UpdateType<String>,
  legal_name: UpdateType<String>,
  phones: UpdateType<Vec<Phone>>,
  addresses: UpdateType<Vec<Address>>,
}
