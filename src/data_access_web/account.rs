use rocket::http::Status;
use rocket_db_pools::Connection;
use sqlx::Row;
use std::io::Write;

use crate::{
  authentication::{empoyee::AuthAccountEmployee, is_account_employee, AuthSession},
  data::ApiResponse,
  data::{
    account::{self, *}, account_type,
  },
  database::Db,
};

#[get("/account")]
pub async fn get_account_implicit<'a>(
  mut db: Connection<Db>,
  auth_session: AuthSession,
) -> ApiResponse<'a> {
  let Ok(account) = get_account(auth_session.session.account_id, &mut db).await else {
    return ApiResponse::status(Status::InternalServerError);
  };

  ApiResponse::json_success(serde_json::to_string(&account).unwrap())
}

#[get("/accounts/<id>")]
pub async fn get_account_from_id<'a>(
  id: u64,
  mut db: Connection<Db>,
  _auth_session: AuthAccountEmployee,
) -> ApiResponse<'a> {
  let Ok(account) = get_account(id, &mut db).await else {
    return ApiResponse::status(Status::InternalServerError);
  };

  ApiResponse::json_success(serde_json::to_string(&account).unwrap())
}

#[put("/account", format = "json", data = "<account_update>")]
pub async fn put_account_implicit<'a>(
  mut db: Connection<Db>,
  account_update: rocket::serde::json::Json<AccountUpdate>,
  auth_session: AuthSession,
) -> ApiResponse<'a> {
  put_account_update(
    &mut db,
    account_update.0,
    auth_session.session.account_id,
    false,
  )
  .await
}

#[put("/accounts/<account_id>", format = "json", data = "<account_update>")]
pub async fn put_account_id<'a>(
  mut db: Connection<Db>,
  account_id: u64,
  account_update: rocket::serde::json::Json<AccountUpdate>,
  auth_session: AuthSession,
) -> ApiResponse<'a> {
  let is_account_employee = is_account_employee(auth_session.session.account_id, &mut db).await;
  if account_id != auth_session.session.account_id && !is_account_employee {
    return ApiResponse::status(Status::NotFound);
  }

  put_account_update(&mut db, account_update.0, account_id, is_account_employee).await
}

#[get("/accounts?<id>&<email>&<name>&<phonenumber>&<street>&<city>&<state>&<zip>&<matchtype>")]
pub async fn search_account<'a>(
  id: Option<u64>,
  email: Option<&str>,
  name: Option<&str>,
  phonenumber: Option<&str>,
  street: Option<&str>,
  city: Option<&str>,
  state: Option<&str>,
  zip: Option<&str>,
  matchtype: Option<MatchType>,
  mut db: Connection<Db>,
) -> ApiResponse<'a> {
  let mut where_conditions = Vec::new();

  if let Some(id) = id {
    where_conditions.push(format!("`account_id = {}", id));
  }
  if let Some(email) = email {
    where_conditions.push(format!(
      "UPPER(`email`) LIKE \"%{}%\"",
      email.to_uppercase(),
    ));
  }
  if let Some(name) = name {
    where_conditions.push(format!(
      "UPPER(`legal_name`) LIKE \"%{}%\" \nOR UPPER(`preferred_name`) LIKE \"%{}%\"",
      name.to_uppercase(),
      name.to_uppercase(),
    ));
  }
  if let Some(street) = street {
    where_conditions.push(format!(
      "UPPER(`Address`.`street`) LIKE \"%{}%\"",
      street.to_uppercase(),
    ));
  }
  if let Some(city) = city {
    where_conditions.push(format!(
      "UPPER(`Address`.`city`) LIKE \"%{}%\"",
      city.to_uppercase(),
    ));
  }
  if let Some(state) = state {
    where_conditions.push(format!(
      "UPPER(`Address`.`state`) LIKE \"%{}%\"",
      state.to_uppercase(),
    ));
  }
  if let Some(zip) = zip {
    where_conditions.push(format!(
      "UPPER(`Address`.`zip`) LIKE \"%{}%\"",
      zip.to_uppercase(),
    ));
  }
  if let Some(phonenumber) = phonenumber {
    where_conditions.push(format!(
      "UPPER(`Phone`.`number`) LIKE \"%{}%\"",
      phonenumber.to_uppercase(),
    ));
  }

  if where_conditions.is_empty() {
    return ApiResponse::status_with_body(Status::UnprocessableEntity, "Empty search".to_owned());
  }

  let match_str = match matchtype {
    Some(match_type) => match_type.into(),
    None => "OR",
  };

  let Ok(where_statement) = String::from_utf8(where_conditions.into_iter().fold(Vec::new(), |mut acc, condition| {_ = write!(acc, "\n{} {}", match_str, condition); acc})) else {
    return ApiResponse::status_with_body(Status::InternalServerError, "Search condition creation failure".to_owned());
  };

  let account_id_query = sqlx::query(&format!(
    r#"
      SELECT
        DISTINCT `Account`.`account_id`
      FROM
        `Account`
        INNER JOIN `AccountAddress` USING(account_id) 
        INNER JOIN `Address` USING(address_id) 
        INNER JOIN `AccountPhone` USING(account_id) 
        INNER JOIN `Phone` USING(phone_id)
      WHERE
        true = false
        {};
    "#,
    where_statement,
  ))
  .fetch_all(&mut **db)
  .await;

  let account_id_query = match account_id_query {
    Err(_) => {
      return ApiResponse::status_with_body(
        Status::InternalServerError,
        "No content which matches search".to_owned(),
      );
    }
    Ok(ok) => ok,
  };

  let account_ids = account_id_query
    .into_iter()
    .filter_map(|row| row.try_get("account_id").ok());

  match serde_json::to_string(&account::get_accounts(account_ids, &mut db).await) {
    Ok(json) => ApiResponse::json_success(json),
    Err(_) => ApiResponse::status(Status::InternalServerError),
  }
}

#[get("/accounts/<account_id>/account_types")]
pub async fn get_types_for_account<'a>(
  db: Connection<Db>,
  account_id: u64,
  _auth_session: AuthAccountEmployee,
) -> ApiResponse<'a> {
  account_type::get_types_for_account(db, account_id).await
}

#[put("/account/<account_id>/account_types/<account_type_id>")]
pub async fn post_account_type<'a>(
  db: Connection<Db>,
  account_id: u64,
  account_type_id: u64,
  _auth_session: AuthAccountEmployee,
) -> ApiResponse<'a> {
  account_type::post_account_type(db, account_id, account_type_id).await
}

#[delete("/account/<account_id>/account_types/<account_type_id>")]
pub async fn delete_account_type<'a>(
  db: Connection<Db>,
  account_id: u64,
  account_type_id: u64,
  _auth_session: AuthAccountEmployee,
) -> ApiResponse<'a> {
  account_type::delete_account_type(db, account_id, account_type_id).await
}
