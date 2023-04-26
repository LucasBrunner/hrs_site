pub mod account;
mod basic_data;
pub mod inventory;
pub mod order;
pub mod warehouse;

use std::{io::Cursor, ops::Range, str::FromStr};

use rocket::{
  async_trait,
  http::{ContentType, Header, Status},
  request::{FromRequest, Outcome},
  response::{self, Responder},
  Request, Response,
};
use serde::{Deserialize, Serialize, Serializer};
use sqlx::{mysql::MySqlRow, FromRow, Row};

pub mod basics {
  pub use super::ApiResponse;
  pub use super::DataWithId;
  pub use super::IdColumnName;
  pub use super::OptionInternallyTagged;
}

pub mod update {
  pub use super::DataMaybeId;
  pub use super::ItemCount;
  pub use super::UpdateType;
}

pub struct ApiResponse<'a> {
  body: String,
  content_type: Option<ContentType>,
  status: Status,
  headers: Vec<Header<'a>>,
}

impl<'a> ApiResponse<'a> {
  pub fn json_success(json: String) -> ApiResponse<'a> {
    ApiResponse {
      body: json,
      content_type: Some(ContentType::JSON),
      status: Status::Ok,
      headers: vec![],
    }
  }

  pub fn status(status: Status) -> ApiResponse<'a> {
    ApiResponse {
      body: String::new(),
      content_type: None,
      status,
      headers: vec![],
    }
  }

  pub fn status_with_body(status: Status, body: String) -> ApiResponse<'a> {
    ApiResponse {
      body,
      content_type: None,
      status,
      headers: vec![],
    }
  }
}

impl<'r> Responder<'r, 'static> for ApiResponse<'static> {
  fn respond_to(self, _: &'r rocket::Request<'_>) -> response::Result<'static> {
    let mut response = Response::build();
    response
      .status(self.status)
      .sized_body(self.body.len(), Cursor::new(self.body));
    if let Some(content_type) = self.content_type {
      response.header(content_type);
    }
    for header in self.headers {
      response.header(header);
    }
    response.ok()
  }
}

#[derive(Clone)]
pub enum RangeEnd<T> {
  Range(Range<T>),
  Suffix(T),
  OpenRange(T),
  None,
}

pub struct RangeHeader<T>
where
  T: FromStr,
{
  unit: String,
  ranges: Vec<Range<T>>,
  range_end: RangeEnd<T>,
}

impl<T> RangeHeader<T>
where
  T: FromStr + Clone,
{
  pub fn get_first(&self) -> RangeEnd<T> {
    if self.ranges.len() > 0 {
      return RangeEnd::Range(self.ranges[0].clone());
    }
    self.range_end.clone()
  }
}

#[async_trait]
impl<'r, T> FromRequest<'r> for RangeHeader<T>
where
  T: FromStr,
{
  type Error = ();

  async fn from_request(req: &'r Request<'_>) -> Outcome<Self, Self::Error> {
    let range_string = match req.headers().get_one("range") {
      None => return Outcome::Failure((Status::RangeNotSatisfiable, ())),
      Some(value) => value,
    };
    let mut range_string = range_string.split('=');

    let Some(unit) = range_string.next() else {
      return Outcome::Failure((Status::RangeNotSatisfiable, ()));
    };

    let Some(ranges) = range_string.next() else {
      return Outcome::Failure((Status::RangeNotSatisfiable, ()));
    };
    let mut ranges = ranges.split(',').peekable();
    let mut parsed_ranges = Vec::new();
    let mut parsed_suffix = RangeEnd::None;

    while ranges.peek().is_some() {
      let range = ranges.next().unwrap();

      if range.starts_with('-') {
        let Ok(suffix) = range.chars().skip(1).collect::<String>().parse() else {
          return Outcome::Failure((Status::RangeNotSatisfiable, ()));
        };
        parsed_suffix = RangeEnd::Suffix(suffix);
        break;
      }
      if range.ends_with('-') {
        let mut range = range.chars();
        _ = range.next_back();
        let Ok(open_range) = range.collect::<String>().parse() else {
          return Outcome::Failure((Status::RangeNotSatisfiable, ()));
        };
        parsed_suffix = RangeEnd::OpenRange(open_range);
        break;
      }
      let mut range = range.split('-');
      let Some(start) = range.next() else {
        return Outcome::Failure((Status::RangeNotSatisfiable, ()));
      };
      let Ok(start) = start.parse() else {
        return Outcome::Failure((Status::RangeNotSatisfiable, ()));
      };

      let Some(end) = range.next() else {
        return Outcome::Failure((Status::RangeNotSatisfiable, ()));
      };
      let Ok(end) = end.parse() else {
        return Outcome::Failure((Status::RangeNotSatisfiable, ()));
      };

      parsed_ranges.push(start..end);
    }

    if ranges.next().is_some() {
      return Outcome::Failure((Status::RangeNotSatisfiable, ()));
    }

    Outcome::Success(RangeHeader {
      unit: unit.to_owned(),
      ranges: parsed_ranges,
      range_end: parsed_suffix,
    })
  }
}

pub trait IdColumnName {
  const ID_COLUMN_NAME: &'static str;
}

pub trait ToSqlxError<T> {
  fn to_boxdyn_error(self) -> Result<T, sqlx::error::BoxDynError>;
  fn to_sql_error(self) -> Result<T, sqlx::Error>;
}

#[derive(Debug, Serialize, Deserialize, Clone)]
#[serde(tag = "type", rename_all = "camelCase")]
pub enum DataMaybeId<T> {
  Id { data: T, id: u64 },
  NoId { data: T },
}

impl<'a, 'r, T> FromRow<'r, MySqlRow> for DataMaybeId<T>
where
  'r: 'a,
  T: FromRow<'a, MySqlRow> + IdColumnName,
{
  fn from_row(row: &'r MySqlRow) -> Result<Self, sqlx::Error> {
    match row.try_get(T::ID_COLUMN_NAME) {
      Ok(id) => Ok(DataMaybeId::Id {
        data: T::from_row(row)?,
        id,
      }),
      Err(_) => Err(sqlx::Error::ColumnNotFound(T::ID_COLUMN_NAME.to_owned())),
    }
  }
}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct DataWithId<T> {
  pub data: T,
  pub id: u64,
}

impl<'a, 'r, T> FromRow<'r, MySqlRow> for DataWithId<T>
where
  'r: 'a,
  T: FromRow<'a, MySqlRow> + IdColumnName,
{
  fn from_row(row: &'r MySqlRow) -> Result<Self, sqlx::Error> {
    match row.try_get(T::ID_COLUMN_NAME) {
      Ok(id) => Ok(DataWithId {
        data: T::from_row(row)?,
        id,
      }),
      Err(_) => Err(sqlx::Error::ColumnNotFound(T::ID_COLUMN_NAME.to_owned())),
    }
  }
}

#[derive(Debug, Serialize, Deserialize, Clone)]
#[serde(tag = "type", rename_all = "camelCase")]
pub enum UpdateType<T> {
  #[serde(rename_all = "camelCase")]
  Put {
    item: T,
  },
  #[serde(rename_all = "camelCase")]
  Delete {
    id: u64,
  },
  Ignore,
}

#[derive(Debug, Serialize, Deserialize, Clone)]
#[serde(tag = "type", rename_all = "camelCase")]
pub enum OptionInternallyTagged<T> {
  Some { data: T },
  None,
}

pub fn option_internally_tagged<S, T>(x: &Option<T>, s: S) -> Result<S::Ok, S::Error>
where
  S: Serializer,
  T: Serialize,
{
  match x {
    Some(data) => OptionInternallyTagged::Some { data: data.clone() },
    None => OptionInternallyTagged::None,
  }
  .serialize(s)
}

#[derive(Debug, Serialize, Deserialize, Clone)]
#[serde(tag = "type", rename_all = "camelCase")]
pub struct UpdateItemCount<T> {
  pub item: T,
  pub count: i64,
}

#[derive(Debug, Serialize, Deserialize, Clone)]
#[serde(tag = "type", rename_all = "camelCase")]
pub struct ItemCount<T> {
  pub item: T,
  pub count: u32,
}

impl<'a, 'r, T> FromRow<'r, MySqlRow> for ItemCount<T>
where
  'r: 'a,
  T: FromRow<'a, MySqlRow>,
{
  fn from_row(row: &'r MySqlRow) -> Result<Self, sqlx::Error> {
    match row.try_get("count") {
      Ok(count) => Ok(ItemCount {
        item: T::from_row(row)?,
        count,
      }),
      Err(_) => Err(sqlx::Error::ColumnNotFound("count".to_owned())),
    }
  }
}

pub trait SortColumn {
  fn sort_column(&self) -> &'static str;
}

pub enum SortOrderDirection {
  Ascending,
  Decending,
}

impl SortOrderDirection {
  fn direction(&self) -> &'static str {
    match self {
      SortOrderDirection::Ascending => "ASC",
      SortOrderDirection::Decending => "DESC",
    }
  }
}

pub struct SortOrder<T>
where
  T: SortColumn,
{
  pub direction: SortOrderDirection,
  pub column: T,
}

impl<T> SortOrder<T>
where
  T: SortColumn,
{
  pub fn get_clause(&self) -> String {
    format!(
      "{} {}",
      self.column.sort_column(),
      self.direction.direction()
    )
  }
}
