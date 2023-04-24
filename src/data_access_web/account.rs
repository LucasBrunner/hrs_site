use rocket::http::Status;
use rocket_db_pools::Connection;
use sqlx::{Acquire, Row};
use std::io::Write;

use crate::{
  authentication::{empoyee::AuthAccountEmployee, AuthSession},
  data::ApiResponse,
  data::{account::*, basics::*, update::*},
  database::Db,
};

#[get("/account")]
pub async fn get_account_implicit(
  mut db: Connection<Db>,
  auth_session: AuthSession,
) -> ApiResponse {
  let Ok(account) = get_account(auth_session.session.account_id, &mut db).await else {
    return ApiResponse::WithoutBody { status: Status::InternalServerError };
  };

  ApiResponse::WithBody {
    json: serde_json::to_string(&account).unwrap(),
    status: Status::Ok,
  }
}

#[get("/accounts/<id>")]
pub async fn get_account_from_id(
  id: u64,
  mut db: Connection<Db>,
  _auth_session: AuthAccountEmployee,
) -> ApiResponse {
  let Ok(account) = get_account(id, &mut db).await else {
    return ApiResponse::WithoutBody { status: Status::InternalServerError };
  };

  ApiResponse::WithBody {
    json: serde_json::to_string(&account).unwrap(),
    status: Status::Ok,
  }
}

#[put("/account", format = "json", data = "<account_update>")]
pub async fn put_account_implicit(
  mut db: Connection<Db>,
  account_update: rocket::serde::json::Json<AccountUpdate>,
  auth_session: AuthSession,
) -> ApiResponse {
  let Ok(mut tx) = db.begin().await else {
    return ApiResponse::WithoutBody { status: Status::InternalServerError };
  };

  let account_update_result = match &account_update.preferred_name {
    UpdateType::Put { item } => sqlx::query!(
      r#"
        UPDATE `Account`
        SET `preferred_name` = ?
        WHERE `account_id` = ?;
      "#,
      item,
      auth_session.session.account_id,
    )
    .execute(&mut tx)
    .await
    .err(),
    UpdateType::Delete { id: _ } => {
      _ = tx.rollback().await;
      return ApiResponse::WithoutBody {
        status: Status::UnprocessableEntity,
      };
    }
    UpdateType::Ignore => None,
  };

  if account_update_result.is_some() {
    _ = tx.rollback().await;
    return ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    };
  }

  for phone_update in account_update.phones.iter() {
    let phone_update_result = match phone_update {
      UpdateType::Put { item } => {
        put_phone(&mut tx, auth_session.session.account_id, item.clone()).await
      }
      UpdateType::Delete { id } => {
        delete_phone_relation(&mut tx, auth_session.session.account_id, *id).await
      }
      UpdateType::Ignore => todo!(),
    };
    if phone_update_result.is_err() {
      _ = tx.rollback().await;
      return ApiResponse::WithoutBody {
        status: Status::InternalServerError,
      };
    }
  }

  for address_update in account_update.addresses.iter() {
    let address_update_result = match address_update {
      UpdateType::Put { item } => {
        put_address(&mut tx, auth_session.session.account_id, item.clone()).await
      }
      UpdateType::Delete { id } => {
        delete_address_relation(&mut tx, auth_session.session.account_id, *id).await
      }
      UpdateType::Ignore => todo!(),
    };
    if address_update_result.is_err() {
      _ = tx.rollback().await;
      return ApiResponse::WithoutBody {
        status: Status::InternalServerError,
      };
    }
  }

  match tx.commit().await {
    Ok(_) => ApiResponse::WithoutBody {
      status: Status::Created,
    },
    Err(_) => ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    },
  }
}

#[get("/accounts?<id>&<email>&<name>&<phonenumber>&<street>&<city>&<state>&<zip>&<matchtype>")]
pub async fn search_account(
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
) -> ApiResponse {
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
    return ApiResponse::WithBody {
      status: Status::UnprocessableEntity,
      json: "Empty search".to_owned(),
    };
  }

  let match_str = match matchtype {
    Some(match_type) => match_type.into(),
    None => "OR",
  };

  let Ok(where_statement) = String::from_utf8(where_conditions.into_iter().fold(Vec::new(), |mut acc, condition| {_ = write!(acc, "\n{} {}", match_str, condition); acc})) else {
    return ApiResponse::WithBody {
      status: Status::InternalServerError,
      json: "Search condition creation failure".to_owned(),
    };
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
      return ApiResponse::WithBody {
        status: Status::NoContent,
        json: "No content which matches search".to_owned(),
      };
    }
    Ok(ok) => ok,
  };

  let mut accounts = Vec::new();
  for id in account_id_query
    .into_iter()
    .filter_map(|row| row.try_get("account_id").ok())
  {
    let Ok(account) = get_account(id, &mut db).await else {
      println!("no account with id \"{}\"", id);
      continue;
    };
    accounts.push(DataWithId { data: account, id });
  }

  match serde_json::to_string(&accounts) {
    Ok(json) => ApiResponse::WithBody {
      status: Status::Ok,
      json,
    },
    Err(_) => ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    },
  }
}
