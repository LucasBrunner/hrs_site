use rocket::form::{Errors, FromFormField};
use rocket_db_pools::Connection;
use serde::{Deserialize, Serialize};
use sqlx::{MySql, Transaction};
use strum_macros::{self, IntoStaticStr};

use crate::database::Db;

use super::{
  basic_data::{address::Address, phone::Phone},
  DataMaybeId, DataWithId, UpdateType,
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

pub async fn get_accounts<T>(account_ids: T, db: &mut Connection<Db>) -> Vec<Account>
where
  T: IntoIterator<Item = u64>,
{
  let mut accounts = Vec::new();
  for id in account_ids {
    if let Ok(account) = get_account(id, db).await {
      accounts.push(account);
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
