use rocket::{
  http::Status,
};
use rocket_db_pools::Connection;
use serde::{Deserialize, Serialize};
use sqlx::{Acquire, MySql, Transaction};

use crate::{authentication::AuthSession, database::Db, data::ApiResponse};

use super::{
  basic_data::{address::Address, phone::Phone}, DataMaybeId, DataWithId, UpdateType,
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

#[get("/")]
pub async fn get_account_info(mut db: Connection<Db>, _auth_session: AuthSession) -> ApiResponse {
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
    serde_json::to_string(&Account {
      data: account_data.clone(),
      phones: phone_data.clone(),
      addresses: address_data.clone(),
    })
  );
  ApiResponse::WithBody {
    json: serde_json::to_string(&Account {
      data: account_data.clone(),
      phones: phone_data.clone(),
      addresses: address_data.clone(),
    })
    .unwrap(),
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

#[put("/", format = "json", data = "<account_update>")]
pub async fn put_account_info(
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

  // let account_update_result = sqlx::query!(
  //   r#"
  //     UPDATE `Account`
  //     SET
  //       `preferred_name` = ?
  //     WHERE 'account_id' = ?;
  //   "#,
  //   preferred_name_input,
  //   auth_session.session.account_id,
  // )
  // .execute(&mut tx)
  // .await;

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
    Ok(_) => ApiResponse::WithoutBody { status: Status::Created },
    Err(_) => ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    },
  }
}
