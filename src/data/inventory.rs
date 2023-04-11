use rocket::serde::json::Json;
use rocket_db_pools::Connection;
use serde::Serialize;
use sqlx::types::Decimal;

use crate::{
  authentication::{empoyee::AuthAccountEmployee, AuthSession},
  database::Db,
};

use super::{string_option_internally_tagged, DataError};

#[get("/inventory/search/<item_name>", format = "json")]
pub async fn get_inventory_item_data(
  mut db: Connection<Db>,
  item_name: String,
  _auth_session: AuthSession,
  _auth_employee: AuthAccountEmployee,
) -> Json<InventoryItemResult> {
  let Ok(item_name) = urlencoding::decode(&item_name) else {
    return Json(InventoryItemResult::Err { err: DataError::JsonParseError });
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
  let query = sqlx::query_as::<_, InventoryItem>(&format!(
    r#"
        SELECT
          `inventory_item_id`,
          `cost`,
          `list_price`,
          `brand_id`,
          `Brand`.`name` AS "brand_name",
          `model`,
          `serial`,
          `description`
        FROM 
          `InventoryItem`
          INNER JOIN `Brand` USING(`brand_id`)
        WHERE `InventoryItem`.`inventory_item_id` < 0
          {};
      "#,
    name_conditions,
  ))
  .fetch_all(&mut **db)
  .await;

  match query {
    Ok(items) => Json(InventoryItemResult::Ok { items }),
    Err(err) => {
      println!("{}", err);
      Json(InventoryItemResult::Err {
        err: DataError::DatabaseFailure,
      })
    }
  }
}

#[derive(Debug, Serialize, sqlx::FromRow)]
#[serde(rename_all = "camelCase")]
pub struct InventoryItem {
  inventory_item_id: u64,
  cost: Decimal,
  list_price: Decimal,
  brand_id: u64,
  brand_name: String,
  model: String,
  #[serde(serialize_with = "string_option_internally_tagged")]
  serial: Option<String>,
  #[serde(serialize_with = "string_option_internally_tagged")]
  description: Option<String>,
}

#[derive(Debug, Serialize)]
#[serde(tag = "Type")]
pub enum InventoryItemResult {
  #[serde(rename_all = "camelCase")]
  Err { err: DataError },
  #[serde(rename_all = "camelCase")]
  Ok { items: Vec<InventoryItem> },
}

#[get("/products/<page_number>/<items_per_page>", format = "json")]
pub async fn get_product_page(
  mut db: Connection<Db>,
  mut page_number: u32,
  items_per_page: u32,
) -> Json<InventoryItemResult> {
  page_number = page_number.min(40);
  let query = sqlx::query_as!(
    InventoryItem,
    r#"
      SELECT
        `inventory_item_id`,
        `cost`,
        `list_price`,
        `brand_id`,
        `Brand`.`name` AS "brand_name",
        `model`,
        `serial`,
        `description`
      FROM 
        `InventoryItem`
        INNER JOIN `Brand` USING(`brand_id`)
      LIMIT ?
      OFFSET ?;
      "#,
    items_per_page,
    page_number * items_per_page,
  )
  .fetch_all(&mut **db)
  .await;

  println!("{:?}", query);
  match query {
    Ok(items) => Json(InventoryItemResult::Ok { items }),
    Err(_) => Json(InventoryItemResult::Err {
      err: DataError::DatabaseFailure,
    }),
  }
}
