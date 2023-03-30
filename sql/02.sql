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


INSERT INTO `JobState` (`name`)
VALUES("pending");

INSERT INTO `JobState` (`name`)
VALUES("commited");

INSERT INTO `JobState` (`name`)
VALUES("completed");


INSERT INTO `AccountType` (`name`)
VALUES("employee");

INSERT INTO `AccountType` (`name`)
VALUES("manager");