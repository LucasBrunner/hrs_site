use rocket::http::Status;
use rocket_db_pools::Connection;

use crate::{
  authentication::{empoyee::AuthAccountEmployee, AuthSession},
  data::{inventory::InventoryItem, ApiResponse, DataWithId, RangeHeader},
  database::Db,
};

#[get("/products", format = "json")]
pub async fn get_inventory_item_range<'a>(
  mut db: Connection<Db>,
  range: RangeHeader<u64>,
) -> ApiResponse<'a> {
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
        `description`,
        `image_url`
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
          `description`,
          `image_url`
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
            `description`,
            `image_url`
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
      return ApiResponse::status(Status::RangeNotSatisfiable)
    }
  };

  let Ok(items) = query else {
    return ApiResponse::status(Status::InternalServerError);
  };

  match serde_json::to_string(&items) {
    Ok(json) => ApiResponse::json_success(json),
    Err(_) => ApiResponse::status(Status::InternalServerError),
  }
}

#[get("/product/search/<item_name>", format = "json")]
pub async fn get_inventory_item_data<'a>(
  mut db: Connection<Db>,
  item_name: String,
  _auth_session: AuthSession,
  _auth_employee: AuthAccountEmployee,
) -> ApiResponse<'a> {
  let Ok(item_name) = urlencoding::decode(&item_name) else {
    return ApiResponse::status(Status::InternalServerError);
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
          `description`,
          `image_url`
        FROM 
          `InventoryItem`
          INNER JOIN `Brand` USING(`brand_id`)
        WHERE true = false
          {};
      "#,
    name_conditions,
  ))
  .fetch_all(&mut **db)
  .await;

  let Ok(items) = query else {
    return ApiResponse::status(Status::InternalServerError);
  };

  match serde_json::to_string(&items) {
    Ok(json) => ApiResponse::json_success(json),
    Err(_) => ApiResponse::status(Status::InternalServerError),
  }
}
