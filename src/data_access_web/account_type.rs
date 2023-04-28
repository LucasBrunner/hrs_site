use rocket::http::Status;
use rocket_db_pools::Connection;

use crate::{
  authentication::empoyee::AuthAccountEmployee,
  data::{account_type::{AccountType, self}, ApiResponse},
  database::Db,
};

#[get("/account_types")]
pub async fn get_account_types<'a>(
  mut db: Connection<Db>,
  _auth_session: AuthAccountEmployee,
) -> ApiResponse<'a> {
  let account_types = sqlx::query_as!(
    AccountType,
    r#"
      SELECT 
        `AccountType`.`account_type_id`,
        `AccountType`.`name`
      FROM `hrs_database`.`AccountType`;
    "#,
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

#[put("/account_types/<account_type_id>/accounts/<account_id>")]
pub async fn post_account_type<'a>(
  db: Connection<Db>,
  account_id: u64,
  account_type_id: u64,
  _auth_session: AuthAccountEmployee,
) -> ApiResponse<'a> {
  account_type::post_account_type(db, account_id, account_type_id).await
}

#[delete("/account_types/<account_type_id>/accounts/<account_id>")]
pub async fn delete_account_type<'a>(
  db: Connection<Db>,
  account_id: u64,
  account_type_id: u64,
  _auth_session: AuthAccountEmployee,
) -> ApiResponse<'a> {
  account_type::delete_account_type(db, account_id, account_type_id).await
}
