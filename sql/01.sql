# schema script

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

# item tables
CREATE TABLE `Brand`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256) NOT NULL
);

CREATE TABLE `InventoryItem`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `cost` DECIMAL(10, 4) NOT NULL,
  `list_price` DECIMAL(10, 4) NOT NULL,
  `brand` BIGINT UNSIGNED NOT NULL,
  `model` TINYTEXT NOT NULL,
  `serial` TINYTEXT,
  `description` TEXT,
    
  FOREIGN KEY (`brand`) REFERENCES `Brand` (`id`)
);

# account tables
CREATE TABLE `Account`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `email` VARCHAR(256) UNIQUE NOT NULL,
  `preferred_name` TINYTEXT NOT NULL,
  `legal_name` TINYTEXT NOT NULL,
  `HashedPassword` CHAR(43) NOT NULL,
  `Salt` CHAR(32) NOT NULL,
  `Closed` BOOL NOT NULL DEFAULT FALSE
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

CREATE TABLE `AccountAdderss`(
  `address` BIGINT UNSIGNED NOT NULL,
  `account` BIGINT UNSIGNED NOT NULL,

  PRIMARY KEY (`address`, `account`),
    
  FOREIGN KEY (`address`) REFERENCES `Address` (`id`),
  FOREIGN KEY (`account`) REFERENCES `Account` (`id`)
);

# warehouse tables
CREATE TABLE `Supplier`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` TEXT NOT NULL,
  `website` TEXT NOT NULL
);

CREATE TABLE `Warehouse`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256) NOT NULL,
  `address` BIGINT UNSIGNED NOT NULL,
    
  FOREIGN KEY (`address`) REFERENCES `Address` (`id`)
);

CREATE TABLE `WarehouseOrder`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `warehouse` BIGINT UNSIGNED NOT NULL,
  `employee` BIGINT UNSIGNED NOT NULL,
  `supplier` BIGINT UNSIGNED NOT NULL,
  `date` BIGINT NOT NULL,
  `state` BIGINT UNSIGNED NOT NULL,
    
  FOREIGN KEY (`warehouse`) REFERENCES `Warehouse` (`id`),
  FOREIGN KEY (`employee`) REFERENCES `Account` (`id`),
  FOREIGN KEY (`supplier`) REFERENCES `Supplier` (`id`),
  FOREIGN KEY (`state`) REFERENCES `OrderState` (`id`)
);

CREATE TABLE `WarehouseOrderItem`(
  `order` BIGINT UNSIGNED NOT NULL,
  `item` BIGINT UNSIGNED NOT NULL,
  `amount` INT UNSIGNED NOT NULL,
  `current_cost` DECIMAL(10, 4) NOT NULL,

  PRIMARY KEY(`order`, `item`),

  FOREIGN KEY (`order`) REFERENCES `WarehouseOrder` (`id`),
  FOREIGN KEY (`item`) REFERENCES `InventoryItem` (`id`)
);

CREATE TABLE `WarehouseItem`(
  `warehouse` BIGINT UNSIGNED NOT NULL,
  `item` BIGINT UNSIGNED NOT NULL,
  `amount` INT UNSIGNED NOT NULL,

  PRIMARY KEY(`warehouse`, `item`),

  FOREIGN KEY (`warehouse`) REFERENCES `Warehouse` (`id`),
  FOREIGN KEY (`item`) REFERENCES `InventoryItem` (`id`)
);

# sales tables
CREATE TABLE `SaleOrder`(
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `account` BIGINT UNSIGNED NOT NULL,
  `date` BIGINT NOT NULL,
  `address` BIGINT UNSIGNED NOT NULL,
  `state` BIGINT UNSIGNED NOT NULL,

  FOREIGN KEY (`account`) REFERENCES `Account` (`id`),
  FOREIGN KEY (`address`) REFERENCES `Address` (`id`),
  FOREIGN KEY (`state`) REFERENCES `OrderState` (`id`)
);

CREATE TABLE `SaleOrderItem`(
  `order` BIGINT UNSIGNED NOT NULL,
  `item` BIGINT UNSIGNED NOT NULL,
  `warehouse` BIGINT UNSIGNED NOT NULL,
  `amount` INT UNSIGNED NOT NULL,
  `current_cost` DECIMAL(10, 4) NOT NULL,

  PRIMARY KEY(`order`, `item`, `warehouse`),
  
  FOREIGN KEY (`order`) REFERENCES `SaleOrder` (`id`),
  FOREIGN KEY (`item`) REFERENCES `InventoryItem` (`id`),
  FOREIGN KEY (`warehouse`) REFERENCES `Warehouse` (`id`)
);