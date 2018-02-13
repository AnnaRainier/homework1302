-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema shop_feb13
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shop_feb13
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shop_feb13` DEFAULT CHARACTER SET utf8mb4 ;
USE `shop_feb13` ;

-- -----------------------------------------------------
-- Table `shop_feb13`.`item_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shop_feb13`.`item_types` ;

CREATE TABLE IF NOT EXISTS `shop_feb13`.`item_types` (
  `type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `item_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`type_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `shop_feb13`.`models`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shop_feb13`.`models` ;

CREATE TABLE IF NOT EXISTS `shop_feb13`.`models` (
  `model_id` INT(11) NOT NULL AUTO_INCREMENT,
  `model_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`model_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `shop_feb13`.`manufacturers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shop_feb13`.`manufacturers` ;

CREATE TABLE IF NOT EXISTS `shop_feb13`.`manufacturers` (
  `manufacturer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`manufacturer_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `shop_feb13`.`items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shop_feb13`.`items` ;

CREATE TABLE IF NOT EXISTS `shop_feb13`.`items` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `manufacturer` INT(11) NOT NULL,
  `type` INT(11) NOT NULL,
  `model` INT(11) NOT NULL,
  `price` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `model`, `manufacturer`, `type`),
  INDEX `fk_items_models_idx` (`model` ASC),
  INDEX `fk_items_manufacturers1_idx` (`manufacturer` ASC),
  INDEX `fk_items_item_types1_idx` (`type` ASC),
  CONSTRAINT `fk_items_models`
    FOREIGN KEY (`model`)
    REFERENCES `shop_feb13`.`models` (`model_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_items_manufacturers1`
    FOREIGN KEY (`manufacturer`)
    REFERENCES `shop_feb13`.`manufacturers` (`manufacturer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_item_types1`
    FOREIGN KEY (`type`)
    REFERENCES `shop_feb13`.`item_types` (`type_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
