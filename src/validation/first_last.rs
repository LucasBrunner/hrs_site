use std::borrow::Cow;
use validator::ValidationError;

pub trait FirstCharacter {
  fn first_character(&self) -> Option<char>;
}

impl FirstCharacter for str {
  fn first_character(&self) -> Option<char> {
    self.chars().next()
  }
}

impl FirstCharacter for String {
  fn first_character(&self) -> Option<char> {
    self.chars().next()
  }
}

pub trait LastCharacter {
  fn last_character(&self) -> Option<char>;
}

impl LastCharacter for str {
  fn last_character(&self) -> Option<char> {
    self.chars().rev().next()
  }
}

impl LastCharacter for String {
  fn last_character(&self) -> Option<char> {
    self.chars().rev().next()
  }
}

pub fn starts_with<T: FirstCharacter + ?Sized>(
  value: &T,
  arg: &str,
) -> Result<(), ValidationError> {
  let Some(c) = value.first_character() else {
    return Err(ValidationError::new("no_first_character"));
  };
  return if arg.chars().any(|arg_char| arg_char == c) {
    Ok(())
  } else {
    let mut err = ValidationError::new("invalid_first_character");
    err.add_param(Cow::Borrowed("character"), &c);
    Err(err)
  };
}

pub fn does_not_start_with<T: FirstCharacter + ?Sized>(
  value: &T,
  arg: &str,
) -> Result<(), ValidationError> {
  let Some(c) = value.first_character() else {
    return Err(ValidationError::new("no_first_character"));
  };
  return if arg.chars().any(|arg_char| arg_char == c) {
    let mut err = ValidationError::new("invalid_first_character");
    err.add_param(Cow::Borrowed("character"), &c);
    Err(err)
  } else {
    Ok(())
  };
}

pub fn ends_with<T: LastCharacter + ?Sized>(value: &T, arg: &str) -> Result<(), ValidationError> {
  let Some(c) = value.last_character() else {
    return Err(ValidationError::new("no_last_character"));
  };
  return if arg.chars().any(|arg_char| arg_char == c) {
    Ok(())
  } else {
    let mut err = ValidationError::new("invalid_last_character");
    err.add_param(Cow::Borrowed("character"), &c);
    Err(err)
  };
}

pub fn does_not_end_with<T: LastCharacter + ?Sized>(
  value: &T,
  arg: &str,
) -> Result<(), ValidationError> {
  let Some(c) = value.last_character() else {
    return Err(ValidationError::new("no_last_character"));
  };
  return if arg.chars().any(|arg_char| arg_char == c) {
    let mut err = ValidationError::new("invalid_last_character");
    err.add_param(Cow::Borrowed("character"), &c);
    Err(err)
  } else {
    Ok(())
  };
}

const INVALID_FIRST_LAST_CHARCTERS: &str = " _-";

pub fn non_space_first_last_characters<T: FirstCharacter + LastCharacter + ?Sized>(
  item: &T,
) -> Result<(), ValidationError> {
  does_not_end_with(item, INVALID_FIRST_LAST_CHARCTERS)?;
  does_not_start_with(item, INVALID_FIRST_LAST_CHARCTERS)?;
  Ok(())
}
