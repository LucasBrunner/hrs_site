DROP DATABASE IF EXISTS `hrs_database`;
CREATE DATABASE IF NOT EXISTS `hrs_database`;

USE `hrs_database`;

# enums
CREATE TABLE `OrderState`(
  `order_state_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256) NOT NULL
);

CREATE TABLE `JobState`(
  `job_state_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256) NOT NULL
);

CREATE TABLE `AccountType`(
  `account_type_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256) NOT NULL
);

CREATE TABLE `PhoneType`(
  `phone_type_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256) NOT NULL
);

# item tables
CREATE TABLE `Brand`(
  `brand_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256) NOT NULL
);

CREATE TABLE `InventoryItem`(
  `inventory_item_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `cost` DECIMAL(10, 4) NOT NULL,
  `list_price` DECIMAL(10, 4) NOT NULL,
  `brand_id` BIGINT UNSIGNED NOT NULL,
  `model` TINYTEXT NOT NULL,
  `serial` TINYTEXT,
  `description` TEXT,
    
  FOREIGN KEY (`brand_id`) REFERENCES `Brand` (`brand_id`)
);

# account tables
CREATE TABLE `Account`(
  `account_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `email` VARCHAR(256) UNIQUE NOT NULL,
  `preferred_name` TINYTEXT NOT NULL,
  `legal_name` TINYTEXT NOT NULL,
  `hashed_password` CHAR(43) NOT NULL,
  `salt` CHAR(32) NOT NULL,
  `closed` BOOL NOT NULL DEFAULT FALSE
);

CREATE TABLE `AccountTypeRecord`(
  `account_id` BIGINT UNSIGNED NOT NULL,
  `account_type_id` BIGINT UNSIGNED NOT NULL,

  PRIMARY KEY (`account_id`, `account_type_id`),

  FOREIGN KEY (`account_id`) REFERENCES `Account` (`account_id`),
  FOREIGN KEY (`account_type_id`) REFERENCES `AccountType` (`account_type_id`)
);

# address tables
CREATE TABLE `Address`(
  `address_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `street` TINYTEXT NOT NULL,
  `city` TINYTEXT NOT NULL,
  `state` TINYTEXT NOT NULL,
  `zip` TINYTEXT NOT NULL
);

CREATE TABLE `Phone`(
  `phone_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `phone_type_id` BIGINT UNSIGNED NOT NULL,
  `number` TINYTEXT NOT NULL,

  FOREIGN KEY (`phone_type_id`) REFERENCES `PhoneType` (`phone_type_id`)
);

CREATE TABLE `AccountAddress`(
  `address_id` BIGINT UNSIGNED NOT NULL,
  `account_id` BIGINT UNSIGNED NOT NULL,

  PRIMARY KEY (`address_id`, `account_id`),
    
  FOREIGN KEY (`address_id`) REFERENCES `Address` (`address_id`),
  FOREIGN KEY (`account_id`) REFERENCES `Account` (`account_id`)
);

CREATE TABLE `AccountPhone`(
  `phone_id` BIGINT UNSIGNED NOT NULL,
  `account_id` BIGINT UNSIGNED NOT NULL,

  PRIMARY KEY (`phone_id`, `account_id`),
    
  FOREIGN KEY (`phone_id`) REFERENCES `Phone` (`phone_id`),
  FOREIGN KEY (`account_id`) REFERENCES `Account` (`account_id`)
);

# warehouse tables
CREATE TABLE `Supplier`(
  `supplier_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` TEXT NOT NULL,
  `website` TEXT NOT NULL,
  `phone_id` BIGINT UNSIGNED,
  `address_id` BIGINT UNSIGNED,
  
  FOREIGN KEY (`phone_id`) REFERENCES `Phone` (`phone_id`),
  FOREIGN KEY (`address_id`) REFERENCES `Address` (`address_id`)
);

CREATE TABLE `Warehouse`(
  `warehouse_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256) NOT NULL,
  `address_id` BIGINT UNSIGNED NOT NULL,
  `phone_id` BIGINT UNSIGNED NOT NULL,
    
  FOREIGN KEY (`address_id`) REFERENCES `Address` (`address_id`),
  FOREIGN KEY (`phone_id`) REFERENCES `Phone` (`phone_id`)
);

CREATE TABLE `WarehouseOrder`(
  `warehouse_order_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `warehouse_id` BIGINT UNSIGNED NOT NULL,
  `account_id` BIGINT UNSIGNED NOT NULL,
  `supplier_id` BIGINT UNSIGNED NOT NULL,
  `date` BIGINT NOT NULL,
  `order_state_id` BIGINT UNSIGNED NOT NULL,
    
  FOREIGN KEY (`warehouse_id`) REFERENCES `Warehouse` (`warehouse_id`),
  FOREIGN KEY (`account_id`) REFERENCES `Account` (`account_id`),
  FOREIGN KEY (`supplier_id`) REFERENCES `Supplier` (`supplier_id`),
  FOREIGN KEY (`order_state_id`) REFERENCES `OrderState` (`order_state_id`)
);

CREATE TABLE `WarehouseOrderItem`(
  `warehouse_order_id` BIGINT UNSIGNED NOT NULL,
  `inventory_item_id` BIGINT UNSIGNED NOT NULL,
  `amount` INT UNSIGNED NOT NULL,
  `current_cost` DECIMAL(10, 4) NOT NULL,

  PRIMARY KEY(`warehouse_order_id`, `inventory_item_id`),

  FOREIGN KEY (`warehouse_order_id`) REFERENCES `WarehouseOrder` (`warehouse_order_id`),
  FOREIGN KEY (`inventory_item_id`) REFERENCES `InventoryItem` (`inventory_item_id`)
);

CREATE TABLE `WarehouseItem`(
  `warehouse_id` BIGINT UNSIGNED NOT NULL,
  `inventory_item_id` BIGINT UNSIGNED NOT NULL,
  `amount` INT UNSIGNED NOT NULL,

  PRIMARY KEY(`warehouse_id`, `inventory_item_id`),

  FOREIGN KEY (`warehouse_id`) REFERENCES `Warehouse` (`warehouse_id`),
  FOREIGN KEY (`inventory_item_id`) REFERENCES `InventoryItem` (`inventory_item_id`)
);

# sales tables
CREATE TABLE `SaleOrder`(
  `sale_order_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `account_id` BIGINT UNSIGNED NOT NULL,
  `date_created` BIGINT NOT NULL,
  `address_id` BIGINT UNSIGNED,
  `state_id` BIGINT UNSIGNED NOT NULL,

  FOREIGN KEY (`account_id`) REFERENCES `Account` (`account_id`),
  FOREIGN KEY (`address_id`) REFERENCES `Address` (`address_id`),
  FOREIGN KEY (`state_id`) REFERENCES `OrderState` (`order_state_id`)
);

CREATE TABLE `SaleOrderItem`(
  `sale_order_id` BIGINT UNSIGNED NOT NULL,
  `inventory_item_id` BIGINT UNSIGNED NOT NULL,
  `warehouse_id` BIGINT UNSIGNED NOT NULL,
  `amount` INT UNSIGNED NOT NULL,
  `current_cost` DECIMAL(10, 4) NOT NULL,

  PRIMARY KEY(`sale_order_id`, `inventory_item_id`, `warehouse_id`),
  
  FOREIGN KEY (`sale_order_id`) REFERENCES `SaleOrder` (`sale_order_id`),
  FOREIGN KEY (`inventory_item_id`) REFERENCES `InventoryItem` (`inventory_item_id`),
  FOREIGN KEY (`warehouse_id`) REFERENCES `Warehouse` (`warehouse_id`)
);

# sessions
CREATE TABLE IF NOT EXISTS `Session`(
	`session_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`account_id` BIGINT UNSIGNED NOT NULL,
  `experation_timestamp` BIGINT SIGNED NOT NULL,
  
  FOREIGN KEY (`account_id`) REFERENCES `Account` (`account_id`)
);

CREATE EVENT `end_old_sessions`
	ON SCHEDULE
		EVERY 1 DAY
	COMMENT 'Removes sessions whos experation date has passed'
    DO
		DELETE FROM `Session`
        WHERE `experation_timestamp` < unix_timestamp();