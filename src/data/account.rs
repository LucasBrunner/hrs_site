use rocket::{
  form::{Errors, FromFormField},
  http::Status,
};
use rocket_db_pools::Connection;
use serde::{Deserialize, Serialize};
use sqlx::{Acquire, MySql, Transaction};
use strum_macros::{self, IntoStaticStr};

use crate::database::Db;

use super::{
  basic_data::{address::Address, phone::Phone},
  ApiResponse, DataMaybeId, DataWithId, UpdateType,
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

pub async fn get_account(id: u64, db: &mut Connection<Db>) -> Result<Account, sqlx::Error> {
  let account_data = sqlx::query_as!(
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
    id,
  )
  .fetch_one(&mut ***db)
  .await?;

  let address_data = sqlx::query_as::<_, DataWithId<Address>>(&format!(
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
    id,
  ))
  .fetch_all(&mut **db)
  .await?;

  let phone_data = sqlx::query_as::<_, DataWithId<Phone>>(&format!(
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
    id,
  ))
  .fetch_all(&mut **db)
  .await?;

  Ok(Account {
    data: account_data,
    addresses: address_data,
    phones: phone_data,
  })
}

pub async fn get_accounts<T>(account_ids: T, db: &mut Connection<Db>) -> Vec<DataWithId<Account>>
where
  T: IntoIterator<Item = u64>,
{
  let mut accounts = Vec::new();
  for id in account_ids {
    if let Ok(account) = get_account(id, db).await {
      accounts.push(DataWithId { data: account, id });
    }
  }
  accounts
}

#[derive(Serialize, Deserialize, Clone)]
#[serde(rename_all = "camelCase")]
pub struct AccountUpdate {
  pub email: UpdateType<String>,
  pub preferred_name: UpdateType<String>,
  pub legal_name: UpdateType<String>,
  pub phones: Vec<UpdateType<DataMaybeId<Phone>>>,
  pub addresses: Vec<UpdateType<DataMaybeId<Address>>>,
}

pub async fn delete_phone_relation(
  tx: &mut Transaction<'_, MySql>,
  account_id: u64,
  phone_id: u64,
) -> Result<(), sqlx::Error> {
  let delete_result = sqlx::query!(
    r#"
      DELETE FROM `AccountPhone`
      WHERE 
        `phone_id` = ?
        AND `account_id` = ?;
    "#,
    phone_id,
    account_id,
  )
  .execute(&mut *tx)
  .await;
  match delete_result {
    Ok(_) => Ok(()),
    Err(err) => Err(err),
  }
}

pub async fn put_phone(
  tx: &mut Transaction<'_, MySql>,
  account_id: u64,
  phone_update: DataMaybeId<Phone>,
) -> Result<(), sqlx::Error> {
  let phone_data = match phone_update {
    DataMaybeId::Id { data, id } => {
      delete_phone_relation(tx, account_id, id).await?;
      data
    }
    DataMaybeId::NoId { data } => data,
  };

  let phone_id = sqlx::query!(
    r#"
      INSERT INTO `Phone` (
        `phone_type_id`,
        `number`
      )
      VALUES (
        ?,
        ?
      )
    "#,
    phone_data.phone_type as u64,
    phone_data.number,
  )
  .execute(&mut *tx)
  .await?
  .last_insert_id();

  _ = sqlx::query!(
    r#"
      INSERT INTO `AccountPhone` (
        `phone_id`,
        `account_id`
      )
      VALUES (
        ?,
        ?
      )
    "#,
    phone_id,
    account_id,
  )
  .execute(tx)
  .await?;

  Ok(())
}

pub async fn delete_address_relation(
  tx: &mut Transaction<'_, MySql>,
  account_id: u64,
  address_id: u64,
) -> Result<(), sqlx::Error> {
  let delete_result = sqlx::query!(
    r#"
      DELETE FROM `AccountAddress`
      WHERE 
        `address_id` = ?
        AND `account_id` = ?;
    "#,
    address_id,
    account_id,
  )
  .execute(&mut *tx)
  .await;
  match delete_result {
    Ok(_) => Ok(()),
    Err(err) => Err(err),
  }
}

pub async fn put_address(
  tx: &mut Transaction<'_, MySql>,
  account_id: u64,
  address_update: DataMaybeId<Address>,
) -> Result<(), sqlx::Error> {
  let address_data = match address_update {
    DataMaybeId::Id { data, id } => {
      delete_address_relation(tx, account_id, id).await?;
      data
    }
    DataMaybeId::NoId { data } => data,
  };

  let address_id = sqlx::query!(
    r#"
      INSERT INTO `Address` (
        `street`,
        `city`,
        `state`,
        `zip`
      )
      VALUES (
        ?,
        ?,
        ?,
        ?
      )
    "#,
    address_data.street,
    address_data.city,
    address_data.state,
    address_data.zip,
  )
  .execute(&mut *tx)
  .await?
  .last_insert_id();

  _ = sqlx::query!(
    r#"
      INSERT INTO `AccountAddress` (
        `address_id`,
        `account_id`
      )
      VALUES (
        ?,
        ?
      )
    "#,
    address_id,
    account_id,
  )
  .execute(tx)
  .await?;

  Ok(())
}

#[derive(IntoStaticStr)]
#[strum(serialize_all = "UPPERCASE")]
pub enum MatchType {
  And,
  Or,
}

impl<'v> FromFormField<'v> for MatchType {
  fn from_value(field: rocket::form::ValueField<'v>) -> rocket::form::Result<'v, Self> {
    match field.value.to_lowercase().as_str() {
      "and" => Ok(MatchType::And),
      "or" => Ok(MatchType::Or),
      _ => Err(Errors::new()),
    }
  }
}

pub async fn put_account_update<'a>(
  db: &mut Connection<Db>,
  account_update: AccountUpdate,
  account_id: u64,
  is_account_employee: bool,
) -> ApiResponse<'a> {
  let Ok(mut tx) = db.begin().await else {
    return ApiResponse::status(Status::InternalServerError);
  };

  if is_account_employee {
    let update_email_result = match &account_update.email {
      UpdateType::Put { item } => sqlx::query!(
        r#"
          UPDATE `Account`
          SET `email` = ?
          WHERE `account_id` = ?;
        "#,
        item,
        account_id,
      )
      .execute(&mut tx)
      .await
      .err(),
      UpdateType::Delete { id: _ } => {
        _ = tx.rollback().await;
        return ApiResponse::status(Status::UnprocessableEntity);
      }
      UpdateType::Ignore => None,
    };

    if update_email_result.is_some() {
      _ = tx.rollback().await;
      return ApiResponse::status(Status::InternalServerError);
    }

    let update_legal_name_result = match &account_update.legal_name {
      UpdateType::Put { item } => sqlx::query!(
        r#"
          UPDATE `Account`
          SET `legal_name` = ?
          WHERE `account_id` = ?;
        "#,
        item,
        account_id,
      )
      .execute(&mut tx)
      .await
      .err(),
      UpdateType::Delete { id: _ } => {
        _ = tx.rollback().await;
        return ApiResponse::status(Status::UnprocessableEntity);
      }
      UpdateType::Ignore => None,
    };

    if update_legal_name_result.is_some() {
      _ = tx.rollback().await;
      return ApiResponse::status(Status::InternalServerError);
    }
  }

  let account_update_result = match &account_update.preferred_name {
    UpdateType::Put { item } => sqlx::query!(
      r#"
        UPDATE `Account`
        SET `preferred_name` = ?
        WHERE `account_id` = ?;
      "#,
      item,
      account_id,
    )
    .execute(&mut tx)
    .await
    .err(),
    UpdateType::Delete { id: _ } => {
      _ = tx.rollback().await;
      return ApiResponse::status(Status::UnprocessableEntity);
    }
    UpdateType::Ignore => None,
  };

  if account_update_result.is_some() {
    _ = tx.rollback().await;
    return ApiResponse::status(Status::InternalServerError);
  }

  for phone_update in account_update.phones.iter() {
    let phone_update_result = match phone_update {
      UpdateType::Put { item } => put_phone(&mut tx, account_id, item.clone()).await,
      UpdateType::Delete { id } => delete_phone_relation(&mut tx, account_id, *id).await,
      UpdateType::Ignore => todo!(),
    };
    if phone_update_result.is_err() {
      _ = tx.rollback().await;
      return ApiResponse::status(Status::InternalServerError);
    }
  }

  for address_update in account_update.addresses.iter() {
    let address_update_result = match address_update {
      UpdateType::Put { item } => put_address(&mut tx, account_id, item.clone()).await,
      UpdateType::Delete { id } => delete_address_relation(&mut tx, account_id, *id).await,
      UpdateType::Ignore => todo!(),
    };
    if address_update_result.is_err() {
      _ = tx.rollback().await;
      return ApiResponse::status(Status::InternalServerError);
    }
  }

  match tx.commit().await {
    Ok(_) => ApiResponse::status(Status::Created),
    Err(_) => ApiResponse::status(Status::InternalServerError),
  }
}
