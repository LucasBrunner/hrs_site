use rocket::serde::json::Json;
use rocket_db_pools::Connection;
use serde::Serialize;

use crate::{
  authentication::AuthSession,
  database::Db, data::basic_data::phone::{DbPhoneData, ToPhones},
};

use super::{DataError, basic_data::{phone::Phone, address::Address}};

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
pub struct AccountPublicData {
  pub account_id: u64,
  pub email: String,
  pub preferred_name: String,
  pub legal_name: String,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
pub struct Account {
  pub data: AccountPublicData,
  pub phones: Vec<Phone>,
  pub addresses: Vec<Address>,
}

#[derive(Serialize)]
#[serde(tag = "Type")]
pub enum AccountResult {
  #[serde(rename_all = "camelCase")]
  Err { err: DataError },
  #[serde(rename_all = "camelCase")]
  Ok { account: Account },
}

#[get("/", format = "json")]
pub async fn get_account_info(
  mut db: Connection<Db>,
  _auth_session: AuthSession,
) -> Json<AccountResult> {
  let account_query = sqlx::query_as!(
    AccountPublicData,
    r#"
        SELECT
          `account_id`,
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

  let address_query = sqlx::query_as!(
    Address,
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
        WHERE `account_id` = ?;
      "#,
    _auth_session.session.account_id,
  )
  .fetch_all(&mut **db)
  .await;

  let phone_query = sqlx::query_as!(
    DbPhoneData,
    r#"
        SELECT
          `Phone`.`phone_id`,
          `Phone`.`number`,
          `PhoneType`.`name` AS "phone_type_name"
        FROM 
          `Phone`
          INNER JOIN `PhoneType` USING(phone_type_id)
          INNER JOIN `AccountPhone` USING(phone_id)
        WHERE `account_id` = ?;
      "#,
    _auth_session.session.account_id,
  )
  .fetch_all(&mut **db)
  .await
  .to_phones();

  let Ok(account_data) = account_query else {
    return Json(AccountResult::Err { err: DataError::DatabaseFailure });
  };

  let Ok(address_data) = address_query else {
    return Json(AccountResult::Err { err: DataError::DatabaseFailure });
  };

  let Ok(phone_data) = phone_query else {
    return Json(AccountResult::Err { err: DataError::DatabaseFailure });
  };

  Json(AccountResult::Ok { account: Account { data: account_data, phones: phone_data, addresses: address_data, }})
}