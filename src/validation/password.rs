use serde::{Deserialize, Serialize};
use validator::ValidationError;

use super::first_last::FirstCharacter;

#[derive(Debug, Deserialize, Serialize, Clone)]
#[serde(tag = "Type")]
pub enum InvalidPassword {
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
    password_length: usize,
    limit: u64,
  },
  #[serde(rename_all = "camelCase")]
  MaxLength {
    password_length: usize,
    limit: u64,
  },
  DecodeError,
  UnknownError,
}

impl InvalidPassword {
  pub fn from_validation_error(error: &ValidationError) -> InvalidPassword {
    match error.code.as_ref() {
      "contains_invalid_character" => Self::from_invalid_chars(error),
      "invalid_first_character" => Self::from_first_char(error),
      "invalid_last_character" => Self::from_last_char(error),
      "length" => Self::from_length_error(error),
      _ => InvalidPassword::UnknownError,
    }
  }

  fn from_invalid_chars(error: &ValidationError) -> InvalidPassword {
    let Some(invalid_characters) = error.params.get("invalid_chars") else {
      return InvalidPassword::UnknownError;
    };
    let Some(invalid_characters) = invalid_characters.as_str() else {
      return InvalidPassword::UnknownError;
    };
    InvalidPassword::FilteredCharacters {
      characters: invalid_characters.to_owned(),
    }
  }

  fn from_first_char(error: &ValidationError) -> InvalidPassword {
    let Some(invalid_character) = error.params.get("character") else {
      return InvalidPassword::UnknownError;
    };
    let Some(invalid_character) = invalid_character.as_str() else {
      return InvalidPassword::UnknownError;
    };
    let Some(invalid_character) = invalid_character.first_character() else {
      return InvalidPassword::UnknownError;
    };
    InvalidPassword::FirstCharacter {
      character: invalid_character,
    }
  }

  fn from_last_char(error: &ValidationError) -> InvalidPassword {
    let Some(invalid_character) = error.params.get("character") else {
      return InvalidPassword::UnknownError;
    };
    let Some(invalid_character) = invalid_character.as_str() else {
      return InvalidPassword::UnknownError;
    };
    let Some(invalid_character) = invalid_character.first_character() else {
      return InvalidPassword::UnknownError;
    };
    InvalidPassword::LastCharacter {
      character: invalid_character,
    }
  }

  fn from_length_error(error: &ValidationError) -> InvalidPassword {
    let Some(max) = error.params.get("max") else {
      return InvalidPassword::UnknownError;
    };
    let Some(min) = error.params.get("min") else {
      return InvalidPassword::UnknownError;
    };
    let Some(value) = error.params.get("value") else {
      return InvalidPassword::UnknownError;
    };
    let Some(max) = max.as_u64() else {
      return InvalidPassword::UnknownError;
    };
    let Some(min) = min.as_u64() else {
      return InvalidPassword::UnknownError;
    };
    let Some(value) = value.as_str() else {
      return InvalidPassword::UnknownError;
    };
    if value.len() > max as usize {
      InvalidPassword::MaxLength {
        password_length: value.len(),
        limit: max,
      }
    } else {
      InvalidPassword::MinLength {
        password_length: value.len(),
        limit: min,
      }
    }
  }
}
