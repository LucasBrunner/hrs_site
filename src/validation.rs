use std::{borrow::Cow, collections::HashSet};

use validator::ValidationError;

pub mod first_last;
pub mod password;
pub mod username;

pub fn string_contains_any_invalid_char(check: &str, invalid: &str) -> Result<(), ValidationError> {
  let check_chars: HashSet<_> = check.chars().collect();
  let invalid_chars: HashSet<_> = invalid.chars().collect();
  let intersection: String = check_chars.intersection(&invalid_chars).collect();
  if intersection.len() > 0 {
    let mut val_err = ValidationError::new("contains_invalid_character");
    val_err.add_param(Cow::Borrowed("invalid_chars"), &intersection);
    Err(val_err)
  } else {
    Ok(())
  }
}

pub fn string_contains_only_valid_chars(check: &str, valid: &str) -> Result<(), ValidationError> {
  let check_chars: HashSet<_> = check.chars().collect();
  let valid_chars: HashSet<_> = valid.chars().collect();
  let difference: String = check_chars.difference(&valid_chars).collect();
  if difference.len() > 0 {
    let mut val_err = ValidationError::new("contains_invalid_character");
    val_err.add_param(Cow::Borrowed("invalid_chars"), &difference);
    Err(val_err)
  } else {
    Ok(())
  }
}

const VALID_PASSWORD_CHARACTERS: &str =
  " !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
const VALID_USERNAME_CHARACTERS: &str =
  " _-abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

pub fn string_contains_password_chars(password: &str) -> Result<(), ValidationError> {
  string_contains_only_valid_chars(password, VALID_PASSWORD_CHARACTERS)
}

pub fn string_contains_username_chars(password: &str) -> Result<(), ValidationError> {
  string_contains_only_valid_chars(password, VALID_USERNAME_CHARACTERS)
}

pub mod prelude {
  pub use crate::validation::first_last::non_space_first_last_characters;
  pub use crate::validation::{string_contains_password_chars, string_contains_username_chars};
}
