use rocket::{
  form::{Errors, FromFormField},
  http::Status,
};
use rocket_db_pools::Connection;
use serde::{Deserialize, Serialize};
use sqlx::{Acquire, MySql, Row, Transaction};
use std::io::Write;
use strum_macros::{self, IntoStaticStr};

use crate::{authentication::{AuthSession, empoyee::AuthAccountEmployee}, data::ApiResponse, database::Db};

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

#[get("/account")]
pub async fn get_account_implicit(mut db: Connection<Db>, auth_session: AuthSession) -> ApiResponse {
  let Ok(account) = get_account(auth_session.session.account_id, &mut db).await else {
    return ApiResponse::WithoutBody { status: Status::InternalServerError };
  };

  println!("{:?}", serde_json::to_string(&account));
  ApiResponse::WithBody {
    json: serde_json::to_string(&account).unwrap(),
    status: Status::Ok,
  }
}

#[get("/accounts/<id>")]
pub async fn get_account_from_id(
  id: u64,
  mut db: Connection<Db>,
  _auth_session: AuthAccountEmployee,
) -> ApiResponse {
  let Ok(account) = get_account(id, &mut db).await else {
    return ApiResponse::WithoutBody { status: Status::InternalServerError };
  };

  println!("{:?}", serde_json::to_string(&account));
  ApiResponse::WithBody {
    json: serde_json::to_string(&account).unwrap(),
    status: Status::Ok,
  }
}

#[derive(Serialize, Deserialize, Clone)]
#[serde(rename_all = "camelCase")]
pub struct AccountUpdate {
  email: UpdateType<String>,
  preferred_name: UpdateType<String>,
  legal_name: UpdateType<String>,
  phones: Vec<UpdateType<DataMaybeId<Phone>>>,
  addresses: Vec<UpdateType<DataMaybeId<Address>>>,
}

async fn delete_phone_relation(
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

async fn put_phone(
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

async fn delete_address_relation(
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

async fn put_address(
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

#[put("/account", format = "json", data = "<account_update>")]
pub async fn put_account_implicit(
  mut db: Connection<Db>,
  account_update: rocket::serde::json::Json<AccountUpdate>,
  auth_session: AuthSession,
) -> ApiResponse {
  println!("{}", serde_json::to_string(&account_update.0).unwrap());
  let Ok(mut tx) = db.begin().await else {
    return ApiResponse::WithoutBody { status: Status::InternalServerError };
  };

  let account_update_result = match &account_update.preferred_name {
    UpdateType::Put { item } => {
      println!("{}, {}", item, auth_session.session.account_id);
      sqlx::query!(
        r#"
        UPDATE `Account`
        SET `preferred_name` = ?
        WHERE `account_id` = ?;
      "#,
        item,
        auth_session.session.account_id,
      )
      .execute(&mut tx)
      .await
      .err()
    }
    UpdateType::Delete { id: _ } => {
      _ = tx.rollback().await;
      return ApiResponse::WithoutBody {
        status: Status::UnprocessableEntity,
      };
    }
    UpdateType::Ignore => None,
  };

  if account_update_result.is_some() {
    _ = tx.rollback().await;
    return ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    };
  }

  for phone_update in account_update.phones.iter() {
    let phone_update_result = match phone_update {
      UpdateType::Put { item } => {
        put_phone(&mut tx, auth_session.session.account_id, item.clone()).await
      }
      UpdateType::Delete { id } => {
        delete_phone_relation(&mut tx, auth_session.session.account_id, *id).await
      }
      UpdateType::Ignore => todo!(),
    };
    if phone_update_result.is_err() {
      _ = tx.rollback().await;
      return ApiResponse::WithoutBody {
        status: Status::InternalServerError,
      };
    }
  }

  for address_update in account_update.addresses.iter() {
    let address_update_result = match address_update {
      UpdateType::Put { item } => {
        put_address(&mut tx, auth_session.session.account_id, item.clone()).await
      }
      UpdateType::Delete { id } => {
        delete_address_relation(&mut tx, auth_session.session.account_id, *id).await
      }
      UpdateType::Ignore => todo!(),
    };
    if address_update_result.is_err() {
      _ = tx.rollback().await;
      return ApiResponse::WithoutBody {
        status: Status::InternalServerError,
      };
    }
  }

  match tx.commit().await {
    Ok(_) => ApiResponse::WithoutBody {
      status: Status::Created,
    },
    Err(_) => ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    },
  }
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

#[get("/accounts?<id>&<email>&<name>&<phonenumber>&<street>&<city>&<state>&<zip>&<matchtype>")]
pub async fn search_account(
  id: Option<u64>,
  email: Option<&str>,
  name: Option<&str>,
  phonenumber: Option<&str>,
  street: Option<&str>,
  city: Option<&str>,
  state: Option<&str>,
  zip: Option<&str>,
  matchtype: Option<MatchType>,
  mut db: Connection<Db>,
) -> ApiResponse {
  let mut where_conditions = Vec::new();

  if let Some(id) = id {
    where_conditions.push(format!("`account_id = {}", id));
  }
  if let Some(email) = email {
    where_conditions.push(format!(
      "UPPER(`email`) LIKE \"%{}%\"",
      email.to_uppercase(),
    ));
  }
  if let Some(name) = name {
    where_conditions.push(format!(
      "UPPER(`legal_name`) LIKE \"%{}%\" \nOR UPPER(`preferred_name`) LIKE \"%{}%\"",
      name.to_uppercase(),
      name.to_uppercase(),
    ));
  }
  if let Some(street) = street {
    where_conditions.push(format!(
      "UPPER(`Address`.`street`) LIKE \"%{}%\"",
      street.to_uppercase(),
    ));
  }
  if let Some(city) = city {
    where_conditions.push(format!(
      "UPPER(`Address`.`city`) LIKE \"%{}%\"",
      city.to_uppercase(),
    ));
  }
  if let Some(state) = state {
    where_conditions.push(format!(
      "UPPER(`Address`.`state`) LIKE \"%{}%\"",
      state.to_uppercase(),
    ));
  }
  if let Some(zip) = zip {
    where_conditions.push(format!(
      "UPPER(`Address`.`zip`) LIKE \"%{}%\"",
      zip.to_uppercase(),
    ));
  }
  if let Some(phonenumber) = phonenumber {
    where_conditions.push(format!(
      "UPPER(`Phone`.`number`) LIKE \"%{}%\"",
      phonenumber.to_uppercase(),
    ));
  }

  if where_conditions.is_empty() {
    return ApiResponse::WithBody {
      status: Status::UnprocessableEntity,
      json: "Empty search".to_owned(),
    };
  }

  let match_str = match matchtype {
    Some(match_type) => match_type.into(),
    None => "OR",
  };

  let Ok(where_statement) = String::from_utf8(where_conditions.into_iter().fold(Vec::new(), |mut acc, condition| {_ = write!(acc, "\n{} {}", match_str, condition); acc})) else {
    return ApiResponse::WithBody {
      status: Status::InternalServerError,
      json: "Search condition creation failure".to_owned(),
    };
  };

  let account_id_query = sqlx::query(&format!(
    r#"
      SELECT
        DISTINCT `Account`.`account_id`
      FROM
        `Account`
        INNER JOIN `AccountAddress` USING(account_id) 
        INNER JOIN `Address` USING(address_id) 
        INNER JOIN `AccountPhone` USING(account_id) 
        INNER JOIN `Phone` USING(phone_id)
      WHERE
        true = true
        {};
    "#,
    where_statement,
  ))
  .fetch_all(&mut **db)
  .await;

  let account_id_query = match account_id_query {
    Err(err) => {
      println!("{:?}", err);
      return ApiResponse::WithBody {
        status: Status::NoContent,
        json: "No content which matches search".to_owned(),
      };
    }
    Ok(ok) => ok,
  };

  let mut accounts = Vec::new();
  for id in account_id_query
    .into_iter()
    .filter_map(|row| row.try_get("account_id").ok())
  {
    let Ok(account) = get_account(id, &mut db).await else {
      println!("no account with id \"{}\"", id);
      continue;
    };
    accounts.push(DataWithId { data: account, id });
  }

  match serde_json::to_string(&accounts) {
    Ok(json) => ApiResponse::WithBody {
      status: Status::Ok,
      json,
    },
    Err(_) => ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    },
  }
}
