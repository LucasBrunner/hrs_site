use rocket::http::Status;
use rocket_db_pools::Connection;
use sqlx::Acquire;
use time::OffsetDateTime;

use crate::{
  authentication::{empoyee::AuthAccountEmployee, AuthSession},
  data::{
    basics::*,
    inventory::InventoryItem,
    update::*,
    warehouse::{Warehouse, WarehouseItemManulUpdate},
  },
  database::Db,
};

#[get("/warehouses", format = "json")]
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

#[get("/warehouses/<warehouse_id>", format = "json")]
pub async fn get_warehouse(
  mut db: Connection<Db>,
  warehouse_id: u64,
  _auth_session: AuthSession,
  _auth_employee: AuthAccountEmployee,
) -> ApiResponse {
  let query = sqlx::query_as::<_, Warehouse>(&format!(
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
        INNER JOIN `Address` USING(`address_id`)
      WHERE warehouse_id = {};
    "#,
    warehouse_id,
  ))
  .fetch_one(&mut **db)
  .await;

  let warehouse = match query {
    Err(_) => {
      return ApiResponse::WithoutBody {
        status: Status::InternalServerError,
      }
    }
    Ok(warehouse) => warehouse,
  };

  match serde_json::to_string(&warehouse) {
    Err(_) => ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    },
    Ok(json) => ApiResponse::WithBody {
      status: Status::Ok,
      json,
    },
  }
}

#[get("/warehouses/<warehouse_id>/inventory", format = "json")]
pub async fn get_warehouse_inventory(
  mut db: Connection<Db>,
  warehouse_id: u64,
  _auth_session: AuthSession,
  _auth_employee: AuthAccountEmployee,
) -> ApiResponse {
  let query = sqlx::query_as::<_, ItemCount<DataWithId<InventoryItem>>>(&format!(
    r#"
      SELECT
        `inventory_item_id`,
        `WarehouseItem`.`amount` AS "count",
        `cost`,
        `list_price`,
        `brand_id`,
        `Brand`.`name` AS "brand_name",
        `model`,
        `description`,
        `image_url`
      FROM 
        `WarehouseItem`
        INNER JOIN `InventoryItem` USING(`inventory_item_id`)
        INNER JOIN `Brand` USING(`brand_id`)
      WHERE `WarehouseItem`.`warehouse_id` = {};
    "#,
    warehouse_id,
  ))
  .fetch_all(&mut **db)
  .await;

  let items = match query {
    Err(_) => {
      return ApiResponse::WithoutBody {
        status: Status::InternalServerError,
      }
    }
    Ok(items) => items,
  };

  match serde_json::to_string(&items) {
    Ok(items) => ApiResponse::WithBody {
      json: items,
      status: Status::Ok,
    },
    Err(_) => ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    },
  }
}

#[put(
  "/warehouses/<warehouse_id>/inventory",
  format = "json",
  data = "<item_update>"
)]
pub async fn post_warehouse_inventory(
  mut db: Connection<Db>,
  warehouse_id: u64,
  item_update: rocket::serde::json::Json<WarehouseItemManulUpdate>,
  auth_session: AuthSession,
  _auth_employee: AuthAccountEmployee,
) -> ApiResponse {
  let Ok(mut tx) = db.begin().await else {
    return ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    };
  };
  let order_result = sqlx::query!(
    r#"
    INSERT INTO `WarehouseOrder`(
      `warehouse_id`,
      `account_id`,
      `date`,
      `supplier_id`,
      `order_state_id`
    )
    VALUES(
      ?,
      ?,
      ?,
      (SELECT `supplier_id` FROM `Supplier` WHERE `name` = "HRS"),
      (SELECT `order_state_id` FROM `OrderState` WHERE `name` = "commited")
    );
    "#,
    warehouse_id,
    auth_session.session.account_id,
    OffsetDateTime::now_utc().unix_timestamp(),
  )
  .execute(&mut tx)
  .await;

  let Ok(order) = order_result else {
    _ = tx.rollback().await;
    return ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    };
  };

  _ = sqlx::query!(
    r#"
    INSERT INTO `WarehouseOrderItem`(
      `warehouse_order_id`,
      `inventory_item_id`,
      `amount`,
      `current_cost`
    )
    VALUES(
      ?,
      ?,
      ?,
      0
    );
    "#,
    order.last_insert_id(),
    item_update.inventory_item_id,
    item_update.amount,
  )
  .execute(&mut tx)
  .await;

  _ = sqlx::query!(
    r#"
    INSERT INTO `WarehouseItem`(
      `warehouse_id`,
      `inventory_item_id`,
      `amount`
    )
    VALUES(
      ?,
      ?,
      ?
    )
    ON DUPLICATE KEY UPDATE
    `amount` = `amount` + ?;
    "#,
    warehouse_id,
    item_update.inventory_item_id,
    item_update.amount,
    item_update.amount,
  )
  .execute(&mut tx)
  .await;

  let update = tx.commit().await;

  if update.is_err() {
    return ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    };
  }

  ApiResponse::WithBody {
    status: Status::Created,
    json: String::new(),
  }
}
