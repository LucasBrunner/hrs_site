DROP DATABASE IF EXISTS `hrs_database`;
CREATE DATABASE IF NOT EXISTS `hrs_database`;

USE `hrs_database`;

# enums
CREATE TABLE `OrderState`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256) NOT NULL
);

CREATE TABLE `JobState`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256) NOT NULL
);

CREATE TABLE `AccountType`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256) NOT NULL
);

CREATE TABLE `PhoneType`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256) NOT NULL
);

# item tables
CREATE TABLE `Brand`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256) NOT NULL
);

CREATE TABLE `InventoryItem`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `cost` DECIMAL(10, 4) NOT NULL,
  `list_price` DECIMAL(10, 4) NOT NULL,
  `brand_id` BIGINT UNSIGNED NOT NULL,
  `model` TINYTEXT NOT NULL,
  `serial` TINYTEXT,
  `description` TEXT,
    
  FOREIGN KEY (`brand_id`) REFERENCES `Brand` (`id`)
);

# account tables
CREATE TABLE `Account`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `email` VARCHAR(256) UNIQUE NOT NULL,
  `preferred_name` TINYTEXT NOT NULL,
  `legal_name` TINYTEXT NOT NULL,
  `hashed_password` CHAR(43) NOT NULL,
  `salt` CHAR(32) NOT NULL,
  `closed` BOOL NOT NULL DEFAULT FALSE
);

CREATE TABLE `AccountTypeRecord`(
  `account` BIGINT UNSIGNED NOT NULL,
  `account_type` BIGINT UNSIGNED NOT NULL,

  PRIMARY KEY (`account`, `account_type`),

  FOREIGN KEY (`account`) REFERENCES `Account` (`id`),
  FOREIGN KEY (`account_type`) REFERENCES `AccountType` (`id`)
);

# address tables
CREATE TABLE `Address`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `street` TINYTEXT NOT NULL,
  `city` TINYTEXT NOT NULL,
  `state` TINYTEXT NOT NULL,
  `zip` TINYTEXT NOT NULL
);

CREATE TABLE `Phone`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `type_id` BIGINT UNSIGNED NOT NULL,
  `number` TINYTEXT NOT NULL,

  FOREIGN KEY (`type_id`) REFERENCES `PhoneType` (`id`)
);

CREATE TABLE `AccountAdderss`(
  `address_id` BIGINT UNSIGNED NOT NULL,
  `account_id` BIGINT UNSIGNED NOT NULL,

  PRIMARY KEY (`address_id`, `account_id`),
    
  FOREIGN KEY (`address_id`) REFERENCES `Address` (`id`),
  FOREIGN KEY (`account_id`) REFERENCES `Account` (`id`)
);

# warehouse tables
CREATE TABLE `Supplier`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` TEXT NOT NULL,
  `website` TEXT NOT NULL,
  `phone_id` BIGINT UNSIGNED,
  `address_id` BIGINT UNSIGNED,
  
  FOREIGN KEY (`phone_id`) REFERENCES `Phone` (`id`),
  FOREIGN KEY (`address_id`) REFERENCES `Address` (`id`)
);

CREATE TABLE `Warehouse`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256) NOT NULL,
  `address_id` BIGINT UNSIGNED NOT NULL,
    
  FOREIGN KEY (`address_id`) REFERENCES `Address` (`id`)
);

CREATE TABLE `WarehouseOrder`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `warehouse_id` BIGINT UNSIGNED NOT NULL,
  `employee_id` BIGINT UNSIGNED NOT NULL,
  `supplier_id` BIGINT UNSIGNED NOT NULL,
  `date` BIGINT NOT NULL,
  `state_id` BIGINT UNSIGNED NOT NULL,
    
  FOREIGN KEY (`warehouse_id`) REFERENCES `Warehouse` (`id`),
  FOREIGN KEY (`employee_id`) REFERENCES `Account` (`id`),
  FOREIGN KEY (`supplier_id`) REFERENCES `Supplier` (`id`),
  FOREIGN KEY (`state_id`) REFERENCES `OrderState` (`id`)
);

CREATE TABLE `WarehouseOrderItem`(
  `order_id` BIGINT UNSIGNED NOT NULL,
  `item_id` BIGINT UNSIGNED NOT NULL,
  `amount` INT UNSIGNED NOT NULL,
  `current_cost` DECIMAL(10, 4) NOT NULL,

  PRIMARY KEY(`order_id`, `item_id`),

  FOREIGN KEY (`order_id`) REFERENCES `WarehouseOrder` (`id`),
  FOREIGN KEY (`item_id`) REFERENCES `InventoryItem` (`id`)
);

CREATE TABLE `WarehouseItem`(
  `warehouse_id` BIGINT UNSIGNED NOT NULL,
  `item_id` BIGINT UNSIGNED NOT NULL,
  `amount` INT UNSIGNED NOT NULL,

  PRIMARY KEY(`warehouse_id`, `item_id`),

  FOREIGN KEY (`warehouse_id`) REFERENCES `Warehouse` (`id`),
  FOREIGN KEY (`item_id`) REFERENCES `InventoryItem` (`id`)
);

# sales tables
CREATE TABLE `SaleOrder`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `account_id` BIGINT UNSIGNED NOT NULL,
  `date` BIGINT NOT NULL,
  `address_id` BIGINT UNSIGNED NOT NULL,
  `state_id` BIGINT UNSIGNED NOT NULL,

  FOREIGN KEY (`account_id`) REFERENCES `Account` (`id`),
  FOREIGN KEY (`address_id`) REFERENCES `Address` (`id`),
  FOREIGN KEY (`state_id`) REFERENCES `OrderState` (`id`)
);

CREATE TABLE `SaleOrderItem`(
  `order_id` BIGINT UNSIGNED NOT NULL,
  `item_id` BIGINT UNSIGNED NOT NULL,
  `warehouse_id` BIGINT UNSIGNED NOT NULL,
  `amount` INT UNSIGNED NOT NULL,
  `current_cost` DECIMAL(10, 4) NOT NULL,

  PRIMARY KEY(`order_id`, `item_id`, `warehouse_id`),
  
  FOREIGN KEY (`order_id`) REFERENCES `SaleOrder` (`id`),
  FOREIGN KEY (`item_id`) REFERENCES `InventoryItem` (`id`),
  FOREIGN KEY (`warehouse_id`) REFERENCES `Warehouse` (`id`)
);

# sessions
CREATE TABLE IF NOT EXISTS `Session`(
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`account_id` BIGINT UNSIGNED NOT NULL,
  `experation_timestamp` BIGINT SIGNED NOT NULL,
  
  FOREIGN KEY (`account_id`) REFERENCES `Account` (`Id`)
);

CREATE EVENT `end_old_sessions`
	ON SCHEDULE
		EVERY 1 DAY
	COMMENT 'Removes sessions whos experation date has passed'
    DO
		DELETE FROM `Session`
        WHERE `experation_timestamp` < unix_timestamp();