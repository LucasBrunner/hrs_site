pub struct Account {
  id: u64,
  email: String,
  preferred_name: String,
  legal_name: String,
  password_hash: String,
  salt: String,
  closed: bool,
}