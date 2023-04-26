# enum script

USE `hrs_database`;

INSERT INTO `OrderState` (`name`)
VALUES("pending");

INSERT INTO `OrderState` (`name`)
VALUES("commited");

INSERT INTO `OrderState` (`name`)
VALUES("delivered");

INSERT INTO `OrderState` (`name`)
VALUES("arrived");

INSERT INTO `OrderState` (`name`)
VALUES("canceled");


INSERT INTO `JobState` (`name`)
VALUES("pending");

INSERT INTO `JobState` (`name`)
VALUES("commited");

INSERT INTO `JobState` (`name`)
VALUES("completed");


INSERT INTO `PhoneType` (`name`)
VALUES("landline");

INSERT INTO `PhoneType` (`name`)
VALUES("mobile");


INSERT INTO `AccountType` (`name`)
VALUES("employee");

INSERT INTO `AccountType` (`name`)
VALUES("president");

INSERT INTO `AccountType` (`name`)
VALUES("vice president");

INSERT INTO `AccountType` (`name`)
VALUES("cfo");

INSERT INTO `AccountType` (`name`)
VALUES("ceo");

INSERT INTO `AccountType` (`name`)
VALUES("sales manager");

INSERT INTO `AccountType` (`name`)
VALUES("design manager");

INSERT INTO `AccountType` (`name`)
VALUES("sales associate");

INSERT INTO `AccountType` (`name`)
VALUES("design associate");

INSERT INTO `AccountType` (`name`)
VALUES("store manager");

INSERT INTO `AccountType` (`name`)
VALUES("office manager");

INSERT INTO `AccountType` (`name`)
VALUES("warehouse");

INSERT INTO `AccountType` (`name`)
VALUES("deliveries");

INSERT INTO `AccountType` (`name`)
VALUES("installations");

INSERT INTO `AccountType` (`name`)
VALUES("cabinet technician");

INSERT INTO `AccountType` (`name`)
VALUES("appliance technician");

INSERT INTO `AccountType` (`name`)
VALUES("bathroom technician");
