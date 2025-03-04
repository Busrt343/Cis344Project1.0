-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Photography_portifolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Photography_portifolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Photography_portifolio` DEFAULT CHARACTER SET utf8mb3 ;
USE `Photography_portifolio` ;

-- -----------------------------------------------------
-- Table `Photography_portifolio`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Photography_portifolio`.`order` (
  `Order_ID` INT NOT NULL,
  `order_date` VARCHAR(45) NULL,
  `Order_cost` VARCHAR(45) NULL,
  PRIMARY KEY (`Order_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Photography_portifolio`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Photography_portifolio`.`Client` (
  `Client_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL,
  `Phone_Num` VARCHAR(45) NULL,
  `order_Order_ID` INT NOT NULL,
  PRIMARY KEY (`Client_ID`, `order_Order_ID`),
  INDEX `fk_Client_order_idx` (`order_Order_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Client_order`
    FOREIGN KEY (`order_Order_ID`)
    REFERENCES `Photography_portifolio`.`order` (`Order_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Photography_portifolio`.`photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Photography_portifolio`.`photo` (
  `Photo_ID` INT NOT NULL,
  `Title` VARCHAR(45) NULL,
  `Date_Taken` VARCHAR(45) NULL,
  `Dimesions` VARCHAR(45) NULL,
  `Format` VARCHAR(45) NULL,
  PRIMARY KEY (`Photo_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Photography_portifolio`.`Photographer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Photography_portifolio`.`Photographer` (
  `Website` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `PhoneNum` VARCHAR(45) NULL,
  `social_medias` VARCHAR(45) NULL,
  `photo_Photo_ID` INT NOT NULL,
  PRIMARY KEY (`Website`, `photo_Photo_ID`),
  INDEX `fk_Photographer_photo1_idx` (`photo_Photo_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Photographer_photo1`
    FOREIGN KEY (`photo_Photo_ID`)
    REFERENCES `Photography_portifolio`.`photo` (`Photo_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Photography_portifolio`.`Album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Photography_portifolio`.`Album` (
  `Album_ID` INT NOT NULL,
  `Title` VARCHAR(45) NULL,
  `Date_Created` VARCHAR(45) NULL,
  PRIMARY KEY (`Album_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Photography_portifolio`.`INCLUDES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Photography_portifolio`.`INCLUDES` (
  `photo_Photo_ID` INT NOT NULL,
  `order_Order_ID` INT NOT NULL,
  PRIMARY KEY (`photo_Photo_ID`, `order_Order_ID`),
  INDEX `fk_photo_has_order_order1_idx` (`order_Order_ID` ASC) VISIBLE,
  INDEX `fk_photo_has_order_photo1_idx` (`photo_Photo_ID` ASC) VISIBLE,
  CONSTRAINT `fk_photo_has_order_photo1`
    FOREIGN KEY (`photo_Photo_ID`)
    REFERENCES `Photography_portifolio`.`photo` (`Photo_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_photo_has_order_order1`
    FOREIGN KEY (`order_Order_ID`)
    REFERENCES `Photography_portifolio`.`order` (`Order_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Photography_portifolio`.`BELONGS TO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Photography_portifolio`.`BELONGS TO` (
  `photo_Photo_ID` INT NOT NULL,
  `Album_Album_ID` INT NOT NULL,
  PRIMARY KEY (`photo_Photo_ID`, `Album_Album_ID`),
  INDEX `fk_photo_has_Album_Album1_idx` (`Album_Album_ID` ASC) VISIBLE,
  INDEX `fk_photo_has_Album_photo1_idx` (`photo_Photo_ID` ASC) VISIBLE,
  CONSTRAINT `fk_photo_has_Album_photo1`
    FOREIGN KEY (`photo_Photo_ID`)
    REFERENCES `Photography_portifolio`.`photo` (`Photo_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_photo_has_Album_Album1`
    FOREIGN KEY (`Album_Album_ID`)
    REFERENCES `Photography_portifolio`.`Album` (`Album_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
