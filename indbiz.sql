SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `indbiz`.`transaction_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `indbiz`.`transaction_types` ;

CREATE  TABLE IF NOT EXISTS `indbiz`.`transaction_types` (
  `transaction_type_id` INT NOT NULL AUTO_INCREMENT ,
  `transaction_type_name` VARCHAR(255) NOT NULL ,
  `transaction_type_description` VARCHAR(255) NOT NULL ,
  `transaction_type_details` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`transaction_type_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `indbiz`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `indbiz`.`users` ;

CREATE  TABLE IF NOT EXISTS `indbiz`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(255) NOT NULL ,
  `second_name` VARCHAR(255) NOT NULL ,
  `email` VARCHAR(255) NOT NULL ,
  `password` VARCHAR(255) NOT NULL ,
  `active` TINYINT(1) NOT NULL DEFAULT false ,
  `deleted` TINYINT(1) NOT NULL DEFAULT false ,
  `is_email_verified` TINYINT(1) NOT NULL DEFAULT false ,
  PRIMARY KEY (`user_id`, `email`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `indbiz`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `indbiz`.`roles` ;

CREATE  TABLE IF NOT EXISTS `indbiz`.`roles` (
  `role_id` INT NOT NULL AUTO_INCREMENT ,
  `role_name` VARCHAR(255) NOT NULL ,
  `role_description` VARCHAR(255) NOT NULL ,
  `active` TINYINT(1) NOT NULL DEFAULT true ,
  `deleted` TINYINT(1) NOT NULL DEFAULT false ,
  PRIMARY KEY (`role_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `indbiz`.`permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `indbiz`.`permissions` ;

CREATE  TABLE IF NOT EXISTS `indbiz`.`permissions` (
  `permission_id` INT NOT NULL AUTO_INCREMENT ,
  `permission_name` VARCHAR(255) NOT NULL ,
  `permission_description` VARCHAR(255) NOT NULL ,
  `active` TINYINT(1) NOT NULL DEFAULT true ,
  `deleted` TINYINT(1) NOT NULL DEFAULT true ,
  PRIMARY KEY (`permission_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `indbiz`.`role_permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `indbiz`.`role_permissions` ;

CREATE  TABLE IF NOT EXISTS `indbiz`.`role_permissions` (
  `role_permission_id` INT NOT NULL AUTO_INCREMENT ,
  `role_id` INT NOT NULL ,
  `permission_id` INT NOT NULL ,
  `active` TINYINT(1) NOT NULL DEFAULT true ,
  PRIMARY KEY (`role_permission_id`) ,
  INDEX `role_id_idx` (`role_id` ASC) ,
  INDEX `permission_id_idx` (`permission_id` ASC) ,
  CONSTRAINT `role_id`
    FOREIGN KEY (`role_id` )
    REFERENCES `indbiz`.`roles` (`role_id` )
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `permission_id`
    FOREIGN KEY (`permission_id` )
    REFERENCES `indbiz`.`permissions` (`permission_id` )
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `indbiz`.`user_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `indbiz`.`user_roles` ;

CREATE  TABLE IF NOT EXISTS `indbiz`.`user_roles` (
  `user_role_id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` INT NOT NULL ,
  `role_id` INT NOT NULL ,
  `active` TINYINT(1) NOT NULL DEFAULT true ,
  PRIMARY KEY (`user_role_id`) ,
  INDEX `user_id_idx` (`user_id` ASC) ,
  INDEX `role_id_idx` (`role_id` ASC) ,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id` )
    REFERENCES `indbiz`.`users` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `role_id`
    FOREIGN KEY (`role_id` )
    REFERENCES `indbiz`.`roles` (`role_id` )
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `indbiz`.`businesses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `indbiz`.`businesses` ;

CREATE  TABLE IF NOT EXISTS `indbiz`.`businesses` (
  `business_id` INT NOT NULL AUTO_INCREMENT ,
  `business_name` VARCHAR(255) NOT NULL ,
  `business_size` VARCHAR(255) NOT NULL ,
  `business_sector` VARCHAR(255) NOT NULL ,
  `business_description` VARCHAR(255) NOT NULL ,
  `business_details` MEDIUMTEXT NOT NULL ,
  `business_contact_details` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`business_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `indbiz`.`user_business_transactions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `indbiz`.`user_business_transactions` ;

CREATE  TABLE IF NOT EXISTS `indbiz`.`user_business_transactions` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` INT NOT NULL ,
  `business_id` INT NOT NULL ,
  `transaction_type_id` INT NOT NULL ,
  `active` TINYINT(1) NOT NULL DEFAULT true ,
  `deleted` TINYINT(1) NOT NULL DEFAULT false ,
  PRIMARY KEY (`transaction_id`) ,
  INDEX `user_id_idx` (`user_id` ASC) ,
  INDEX `business_id_idx` (`business_id` ASC) ,
  INDEX `transaction_type_id_idx` (`transaction_type_id` ASC) ,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id` )
    REFERENCES `indbiz`.`users` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `business_id`
    FOREIGN KEY (`business_id` )
    REFERENCES `indbiz`.`businesses` (`business_id` )
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `transaction_type_id`
    FOREIGN KEY (`transaction_type_id` )
    REFERENCES `indbiz`.`transaction_types` (`transaction_type_id` )
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
