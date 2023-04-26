use rocket::http::Status;
use rocket_db_pools::Connection;
use sqlx::FromRow;

use crate::{
  authentication::{empoyee::AuthAccountEmployee, is_account_employee, AuthSession},
  data::{
    order::{self, put_order, OrderState, OrderUpdate, SaleOrderSortType, create_order},
    ApiResponse, RangeEnd, RangeHeader, UpdateType, SortOrderDirection, SortOrder
  },
  database::Db,
};

#[get("/account/orders")]
pub async fn get_order_summaries_implicit<'a>(
  mut db: Connection<Db>,
  auth_session: AuthSession,
  range: RangeHeader<u64>,
) -> ApiResponse<'a> {
  let RangeEnd::Range(range) = range.get_first() else {
    return ApiResponse::status(Status::RangeNotSatisfiable);
  };
  match order::get_sale_order_summary_page(
    vec![auth_session.session.account_id],
    None,
    None,
    vec![],
    vec![],
    Some(range),
    &mut db,
  )
  .await
  {
    Ok(result) => match serde_json::to_string(&result) {
      Ok(json) => return ApiResponse::json_success(json),
      Err(_) => return ApiResponse::status(Status::InternalServerError),
    },
    Err(_) => return ApiResponse::status(Status::InternalServerError),
  }
}

#[get("/account/orders/<order_state>")]
pub async fn get_order_summaries_with_state_implicit<'a>(
  mut db: Connection<Db>,
  order_state: String,
  auth_session: AuthSession,
  range: RangeHeader<u64>,
) -> ApiResponse<'a> {
  let RangeEnd::Range(range) = range.get_first() else {
    return ApiResponse::status(Status::RangeNotSatisfiable);
  };
  let Ok(order_state) = OrderState::match_str(&order_state) else {
    return ApiResponse::status(Status::BadRequest);
  };

  match order::get_sale_order_summary_page(
    vec![auth_session.session.account_id],
    None,
    None,
    vec![order_state],
    vec![SortOrder{direction: SortOrderDirection::Decending, column: SaleOrderSortType::Date}],
    Some(range),
    &mut db,
  )
  .await
  {
    Ok(result) => match serde_json::to_string(&result) {
      Ok(json) => return ApiResponse::json_success(json),
      Err(_) => return ApiResponse::status(Status::InternalServerError),
    },
    Err(_) => return ApiResponse::status(Status::InternalServerError),
  }
}

#[get("/accounts/<account_id>/orders")]
pub async fn get_order_summaries_id<'a>(
  mut db: Connection<Db>,
  account_id: u64,
  _auth_employee: AuthAccountEmployee,
  range: RangeHeader<u64>,
) -> ApiResponse<'a> {
  let RangeEnd::Range(range) = range.get_first() else {
    return ApiResponse::status(Status::RangeNotSatisfiable);
  };

  let order_result = order::get_sale_order_summary_page(
    vec![account_id],
    None,
    None,
    vec![],
    vec![],
    Some(range),
    &mut db,
  )
  .await;

  match order_result {
    Ok(result) => match serde_json::to_string(&result) {
      Ok(json) => ApiResponse::json_success(json),
      Err(_) => ApiResponse::status(Status::InternalServerError),
    },
    Err(_) => ApiResponse::status(Status::InternalServerError),
  }
}

#[get("/orders/<order_id>")]
pub async fn get_order<'a>(
  mut db: Connection<Db>,
  order_id: u64,
  auth_session: AuthSession,
) -> ApiResponse<'a> {
  match order::get_sale_order(order_id, &mut db).await {
    Ok(result) => {
      if result.summary.account_id == !auth_session.session.account_id
        && !is_account_employee(auth_session.session.account_id, &mut db).await
      {
        return ApiResponse::status(Status::NotFound);
      };
      match serde_json::to_string(&result) {
        Ok(json) => ApiResponse::json_success(json),
        Err(_) => ApiResponse::status(Status::InternalServerError),
      }
    }
    Err(_) => ApiResponse::status(Status::InternalServerError),
  }
}

#[derive(FromRow)]
struct AccountCheck {
  account_id: u64,
  state: OrderState,
}

#[put("/account/orders/<order_id>", data = "<order_update>")]
pub async fn put_order_implicit<'a>(
  mut db: Connection<Db>,
  order_id: u64,
  order_update: rocket::serde::json::Json<OrderUpdate>,
  auth_session: AuthSession,
) -> ApiResponse<'a> {
  let order_owner = sqlx::query_as::<_, AccountCheck>(&format!(
    r#"
      SELECT 
        `SaleOrder`.`account_id`, 
        `SaleOrder`.`order_state_id` AS "state"
      FROM `SaleOrder`
      WHERE `SaleOrder`.`sale_order_id` = {};
    "#,
    order_id,
  ))
  .fetch_one(&mut **db)
  .await;

  let current_order_data = match order_owner {
    Ok(id) => id,
    Err(err) => {
      println!("{:?}", err);
      return ApiResponse::status(Status::NotFound);
    }
  };

  if auth_session.session.account_id != current_order_data.account_id {
    return ApiResponse::status(Status::Forbidden);
  }

  let mut order_update = order_update.0;
  order_update.state_update = match order_update.state_update {
    UpdateType::Put { item: new_state } => match (current_order_data.state, new_state) {
      (OrderState::Pending, OrderState::Commited) => UpdateType::Put {
        item: OrderState::Commited,
      },
      (OrderState::Pending, OrderState::Canceled) => UpdateType::Put {
        item: OrderState::Canceled,
      },
      _ => UpdateType::Ignore,
    },
    UpdateType::Delete { id: _ } => return ApiResponse::status(Status::UnprocessableEntity),
    UpdateType::Ignore => UpdateType::Ignore,
  };

  put_order(order_id, order_update, db).await
}

#[put("/orders/<order_id>", data = "<order_update>")]
pub async fn put_order_employee<'a>(
  mut db: Connection<Db>,
  order_id: u64,
  order_update: rocket::serde::json::Json<OrderUpdate>,
  _auth_employee_session: AuthAccountEmployee,
) -> ApiResponse<'a> {
  let order_owner = sqlx::query_as::<_, AccountCheck>(&format!(
    r#"
      SELECT 
        `SaleOrder`.`account_id`, 
        `SaleOrder`.`order_state_id` AS "state"
      FROM `SaleOrder`
      WHERE `SaleOrder`.`sale_order_id` = {};
    "#,
    order_id,
  ))
  .fetch_one(&mut **db)
  .await;

  let order_owner_id = match order_owner {
    Ok(id) => id,
    Err(_) => {
      return ApiResponse::status(Status::NotFound);
    }
  };

  let mut order_update = order_update.0;
  order_update.state_update = match order_update.state_update {
    UpdateType::Put { item: new_state } => match (order_owner_id.state, new_state) {
      (OrderState::Pending, OrderState::Commited) => UpdateType::Put {
        item: OrderState::Commited,
      },
      (OrderState::Commited, OrderState::InProgress) => UpdateType::Put {
        item: OrderState::InProgress,
      },
      (OrderState::InProgress, OrderState::Completed) => UpdateType::Put {
        item: OrderState::Completed,
      },
      (_, OrderState::Canceled) => UpdateType::Put {
        item: OrderState::Canceled,
      },
      _ => UpdateType::Ignore,
    },
    UpdateType::Delete { id: _ } => return ApiResponse::status(Status::UnprocessableEntity),
    UpdateType::Ignore => UpdateType::Ignore,
  };

  put_order(order_id, order_update, db).await
}

#[post("/account/orders/<order_name>")]
pub async fn post_order_implicit<'a>(
  db: Connection<Db>,
  order_name: String,
  auth_session: AuthSession,
) -> ApiResponse<'a> {
  create_order(auth_session.session.account_id, order_name, db).await
} 

#[post("/accounts/<account_id>/orders/<order_name>")]
pub async fn post_order_employee<'a>(
  db: Connection<Db>,
  order_name: String,
  account_id: u64,
  _auth_employee_session: AuthAccountEmployee,
) -> ApiResponse<'a> {
  create_order(account_id, order_name, db).await
} 
