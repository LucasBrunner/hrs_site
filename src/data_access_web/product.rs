use rocket::http::Status;
use rocket_db_pools::Connection;

use crate::{
  data::{inventory::InventoryItem, ApiResponse, DataWithId, RangeHeader},
  database::Db,
};

#[get("/products")]
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

#[get("/products/<product_id>")]
pub async fn get_inventory_item_data_id<'a>(
  mut db: Connection<Db>,
  product_id: u64,
) -> ApiResponse<'a> {
  let query = sqlx::query_as::<_, InventoryItem>(&format!(
    r#"
        SELECT
          `InventoryItem`.`cost`,
          `InventoryItem`.`list_price`,
          `InventoryItem`.`brand_id`,
          `InventoryItem`.`model`,
          `InventoryItem`.`description`,
          `InventoryItem`.`image_url`,
          `Brand`.`name` AS "brand_name"
        FROM 
          `InventoryItem`
          INNER JOIN `Brand` USING(`brand_id`)
        WHERE 
        `InventoryItem`.`inventory_item_id` = {};
      "#,
    product_id,
  ))
  .fetch_one(&mut **db)
  .await;

  let Ok(item) = query else {
    return ApiResponse::status(Status::InternalServerError);
  };

  match serde_json::to_string(&item) {
    Ok(json) => ApiResponse::json_success(json),
    Err(_) => ApiResponse::status(Status::InternalServerError),
  }
}

#[get("/product/search/<item_name>")]
pub async fn get_inventory_item_search_data<'a>(
  mut db: Connection<Db>,
  item_name: String,
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
