use serde::{Deserialize, Serialize};
use validator::ValidationError;

use super::first_last::FirstCharacter;

#[derive(Debug, Deserialize, Serialize, Clone)]
#[serde(tag = "Type")]
pub enum InvalidUsername {
  #[serde(rename_all = "camelCase")]
  FilteredCharacters {
    characters: String,
  },
  #[serde(rename_all = "camelCase")]
  FirstCharacter {
    character: char,
  },
  #[serde(rename_all = "camelCase")]
  LastCharacter {
    character: char,
  },
  #[serde(rename_all = "camelCase")]
  MinLength {
    username_length: usize,
    limit: u64,
  },
  #[serde(rename_all = "camelCase")]
  MaxLength {
    username_length: usize,
    limit: u64,
  },
  UnknownError,
}
impl InvalidUsername {
  pub(crate) fn from_validation_error(error: &validator::ValidationError) -> InvalidUsername {
    match error.code.as_ref() {
      "contains_invalid_character" => Self::from_invalid_chars(error),
      "invalid_first_character" => Self::from_first_char(error),
      "invalid_last_character" => Self::from_last_char(error),
      "length" => Self::from_length_error(error),
      _ => InvalidUsername::UnknownError,
    }
  }

  fn from_invalid_chars(error: &ValidationError) -> InvalidUsername {
    let Some(invalid_characters) = error.params.get("invalid_chars") else {
      return InvalidUsername::UnknownError;
    };
    let Some(invalid_characters) = invalid_characters.as_str() else {
      return InvalidUsername::UnknownError;
    };
    InvalidUsername::FilteredCharacters {
      characters: invalid_characters.to_owned(),
    }
  }

  fn from_first_char(error: &ValidationError) -> InvalidUsername {
    let Some(invalid_character) = error.params.get("character") else {
      return InvalidUsername::UnknownError;
    };
    let Some(invalid_character) = invalid_character.as_str() else {
      return InvalidUsername::UnknownError;
    };
    let Some(invalid_character) = invalid_character.first_character() else {
      return InvalidUsername::UnknownError;
    };
    InvalidUsername::FirstCharacter {
      character: invalid_character,
    }
  }

  fn from_last_char(error: &ValidationError) -> InvalidUsername {
    let Some(invalid_character) = error.params.get("character") else {
      return InvalidUsername::UnknownError;
    };
    let Some(invalid_character) = invalid_character.as_str() else {
      return InvalidUsername::UnknownError;
    };
    let Some(invalid_character) = invalid_character.first_character() else {
      return InvalidUsername::UnknownError;
    };
    InvalidUsername::LastCharacter {
      character: invalid_character,
    }
  }

  fn from_length_error(error: &ValidationError) -> InvalidUsername {
    let Some(max) = error.params.get("max") else {
      return InvalidUsername::UnknownError;
    };
    let Some(min) = error.params.get("min") else {
      return InvalidUsername::UnknownError;
    };
    let Some(value) = error.params.get("value") else {
      return InvalidUsername::UnknownError;
    };
    let Some(max) = max.as_u64() else {
      return InvalidUsername::UnknownError;
    };
    let Some(min) = min.as_u64() else {
      return InvalidUsername::UnknownError;
    };
    let Some(value) = value.as_str() else {
      return InvalidUsername::UnknownError;
    };
    if value.len() > max as usize {
      InvalidUsername::MaxLength {
        username_length: value.len(),
        limit: max,
      }
    } else {
      InvalidUsername::MinLength {
        username_length: value.len(),
        limit: min,
      }
    }
  }
}
