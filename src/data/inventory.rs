use rocket::http::Status;
use rocket_db_pools::Connection;
use serde::Serialize;
use sqlx::types::Decimal;

use crate::{
  authentication::{empoyee::AuthAccountEmployee, AuthSession},
  data::{ApiResponse, RangeHeader},
  database::Db,
};

use super::{option_internally_tagged, DataWithId, IdColumnName};

#[derive(Debug, Serialize, sqlx::FromRow)]
#[serde(rename_all = "camelCase")]
pub struct InventoryItem {
  cost: Decimal,
  list_price: Decimal,
  brand_id: u64,
  brand_name: String,
  model: String,
  #[serde(serialize_with = "option_internally_tagged")]
  description: Option<String>,
}

impl IdColumnName for InventoryItem {
  const ID_COLUMN_NAME: &'static str = "inventory_item_id";
}

#[get("/product", format = "json")]
pub async fn get_product_range(mut db: Connection<Db>, range: RangeHeader<u64>) -> ApiResponse {
  let range = range.get_first();
  let query = match range {
    crate::data::RangeEnd::Range(range) => {
      sqlx::query_as::<_, DataWithId<InventoryItem>>(&format!(
        r#"
      SELECT
        `inventory_item_id`,
        `cost`,
        `list_price`,
        `brand_id`,
        `Brand`.`name` AS "brand_name",
        `model`,
        `description`
      FROM 
        `InventoryItem`
        INNER JOIN `Brand` USING(`brand_id`)
      ORDER BY `inventory_item_id`
      LIMIT {}
      OFFSET {};
      "#,
        40.min(range.end - range.start + 1),
        range.start,
      ))
      .fetch_all(&mut **db)
      .await
    }
    crate::data::RangeEnd::OpenRange(start) => {
      sqlx::query_as::<_, DataWithId<InventoryItem>>(&format!(
        r#"
        SELECT
          `inventory_item_id`,
          `cost`,
          `list_price`,
          `brand_id`,
          `Brand`.`name` AS "brand_name",
          `model`,
          `description`
        FROM 
          `InventoryItem`
          INNER JOIN `Brand` USING(`brand_id`)
        ORDER BY `inventory_item_id`
        LIMIT {}
        OFFSET {};
        "#,
        start + 40,
        start,
      ))
      .fetch_all(&mut **db)
      .await
    }
    crate::data::RangeEnd::Suffix(last_items) => {
      sqlx::query_as::<_, DataWithId<InventoryItem>>(&format!(
        r#"
        SELECT * 
        FROM (
          SELECT
            `inventory_item_id`,
            `cost`,
            `list_price`,
            `brand_id`,
            `Brand`.`name` AS "brand_name",
            `model`,
            `description`
          FROM 
            `InventoryItem`
            INNER JOIN `Brand` USING(`brand_id`)
          ORDER BY `inventory_item_id` desc
          LIMIT {}
        ) as `table`
        ORDER BY `table`.`inventory_item_id`;
        "#,
        last_items,
      ))
      .fetch_all(&mut **db)
      .await
    }
    crate::data::RangeEnd::None => {
      return ApiResponse::WithoutBody {
        status: Status::RangeNotSatisfiable,
      }
    }
  };

  let Ok(items) = query else {
    return ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    };
  };

  match serde_json::to_string(&items) {
    Ok(json) => {
      println!("{}", json);
      ApiResponse::WithBody {
        json,
        status: Status::Ok,
      }
    },
    Err(_) => ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    },
  }
}

#[get("/product/search/<item_name>", format = "json")]
pub async fn get_inventory_item_data(
  mut db: Connection<Db>,
  item_name: String,
  _auth_session: AuthSession,
  _auth_employee: AuthAccountEmployee,
) -> ApiResponse {
  let Ok(item_name) = urlencoding::decode(&item_name) else {
    return ApiResponse::WithoutBody { status: Status::InternalServerError };
  };
  let name_conditions = item_name
    .split_whitespace()
    .fold(String::new(), |mut acc, name_word| {
      acc.push_str(&format!(
        " OR `model` LIKE \"%{}%\" OR `Brand`.`name` LIKE \"%{}%\"",
        name_word, name_word,
      ));
      acc
    });
  let query = sqlx::query_as::<_, DataWithId<InventoryItem>>(&format!(
    r#"
        SELECT
          `inventory_item_id`,
          `cost`,
          `list_price`,
          `brand_id`,
          `Brand`.`name` AS "brand_name",
          `model`,
          `description`
        FROM 
          `InventoryItem`
          INNER JOIN `Brand` USING(`brand_id`)
        WHERE true = true
          {};
      "#,
    name_conditions,
  ))
  .fetch_all(&mut **db)
  .await;

  let Ok(items) = query else {
    return ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    };
  };

  match serde_json::to_string(&items) {
    Ok(json) => {
      println!("{}", json);
      ApiResponse::WithBody {
        json,
        status: Status::Ok,
      }
    },
    Err(_) => ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    },
  }
}
