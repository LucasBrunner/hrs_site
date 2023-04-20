use rocket::http::Status;
use rocket_db_pools::Connection;
use serde::Serialize;
use sqlx::FromRow;

use crate::{
  authentication::{empoyee::AuthAccountEmployee, AuthSession},
  database::Db,
};

use super::{ApiResponse, DataWithId, IdColumnName};

#[derive(Serialize, FromRow)]
#[serde(rename_all = "camelCase")]
pub struct Warehouse {
  pub name: String,
  pub phone_type: String,
  pub phone_number: String,
  pub address_street: String,
  pub address_city: String,
  pub address_state: String,
  pub address_zip: String,
}

impl IdColumnName for Warehouse {
  const ID_COLUMN_NAME: &'static str = "warehouse_id";
}

#[get("/warehouse", format = "json")]
pub async fn get_warehouses(
  mut db: Connection<Db>,
  _auth_session: AuthSession,
  _auth_employee: AuthAccountEmployee,
) -> ApiResponse {
  let query = sqlx::query_as::<_, DataWithId<Warehouse>>(
    r#"
      SELECT
        `Warehouse`.`warehouse_id`,
        `Warehouse`.`name`,
        `Phone`.`number` as "phone_number",
        `PhoneType`.`name` AS "phone_type",
        `Address`.`street` AS "address_street",
        `Address`.`city` AS "address_city",
        `Address`.`state` AS "address_state",
        `Address`.`zip` AS "address_zip"
      FROM 
        `Warehouse`
        INNER JOIN `Phone` USING(`phone_id`)
        INNER JOIN `PhoneType` USING(`phone_type_id`)
        INNER JOIN `Address` USING(`address_id`);
    "#,
  )
  .fetch_all(&mut **db)
  .await;

  let warehouses = match query {
    Err(_) => {
      return ApiResponse::WithoutBody {
        status: Status::InternalServerError,
      }
    }
    Ok(warehouses) => warehouses,
  };

  match serde_json::to_string(&warehouses) {
    Err(_) => ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    },
    Ok(json) => ApiResponse::WithBody {
      status: Status::Ok,
      json,
    },
  }
}
