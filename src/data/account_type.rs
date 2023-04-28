use rocket::http::Status;
use rocket_db_pools::Connection;
use serde::Serialize;
use sqlx::Acquire;

use crate::database::Db;

use super::ApiResponse;

#[derive(Serialize, Clone)]
#[serde(rename_all = "camelCase")]
pub struct AccountType {
  pub account_type_id: u64,
  pub name: String,
}

pub async fn get_types_for_account<'a>(mut db: Connection<Db>, account_id: u64) -> ApiResponse<'a> {
  let account_types = sqlx::query_as!(
    AccountType,
    r#"
      SELECT 
        `AccountType`.`account_type_id`,
        `AccountType`.`name`
      FROM 
        `AccountType`
        INNER JOIN `AccountTypeRecord` USING(`account_type_id`)
      WHERE `AccountTypeRecord`.`account_id` = ?;
    "#,
    account_id,
  )
  .fetch_all(&mut **db)
  .await;

  match account_types {
    Ok(account_types) => match serde_json::to_string(&account_types) {
      Ok(json) => ApiResponse::json_success(json),
      Err(_) => ApiResponse::status(Status::InternalServerError),
    },
    Err(_) => ApiResponse::status(Status::InternalServerError),
  }
}

pub async fn post_account_type<'a>(
  mut db: Connection<Db>,
  account_id: u64,
  account_type_id: u64,
) -> ApiResponse<'a> {
  let account_types = sqlx::query!(
    r#"
      INSERT IGNORE INTO `AccountTypeRecord`(
        `account_id`,
        `account_type_id`
      )
      VALUES ( 
        ?,
        ?
      );    
    "#,
    account_id,
    account_type_id,
  )
  .execute(&mut **db)
  .await;

  match account_types {
    Ok(_) => ApiResponse::status(Status::Ok),
    Err(_) => ApiResponse::status(Status::InternalServerError),
  }
}

pub async fn delete_account_type<'a>(
  mut db: Connection<Db>,
  account_id: u64,
  account_type_id: u64,
) -> ApiResponse<'a> {
  let Ok(mut tx) = db.begin().await else {
    return ApiResponse::status(Status::InternalServerError);
  };

  let account_types = sqlx::query!(
    r#"
      DELETE FROM `AccountTypeRecord`
      WHERE 
        `AccountTypeRecord`.`account_id` = ?
        AND `AccountTypeRecord`.`account_type_id` = ?;
    "#,
    account_id,
    account_type_id,
  )
  .execute(&mut *tx)
  .await;

  match account_types {
    Ok(result) => {
      if result.rows_affected() == 1 {
        _ = tx.commit().await;
        ApiResponse::status(Status::Ok)
      } else {
        _ = tx.rollback().await;
        ApiResponse::status(Status::InternalServerError)
      }
    }
    Err(_) => ApiResponse::status(Status::InternalServerError),
  }
}
