-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema MyComputerServices
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MyComputerServices
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MyComputerServices` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `MyComputerServices` ;

-- -----------------------------------------------------
-- Table `MyComputerServices`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyComputerServices`.`Department` (
  `dept_name` VARCHAR(45) NOT NULL,
  `dept_salary` DECIMAL(12,0) NULL DEFAULT NULL,
  PRIMARY KEY (`dept_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `MyComputerServices`.`Karmandan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyComputerServices`.`Karmandan` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `gender` VARCHAR(10) NULL DEFAULT NULL,
  `date_of_birth` DATE NULL DEFAULT NULL,
  `hired_date` DATE NULL DEFAULT NULL,
  `dept_name` VARCHAR(45) NULL DEFAULT NULL,
  `role` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `dept_name2_idx` (`dept_name` ASC) VISIBLE,
  CONSTRAINT `dept_name2`
    FOREIGN KEY (`dept_name`)
    REFERENCES `MyComputerServices`.`Department` (`dept_name`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `MyComputerServices`.`Moshtari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyComputerServices`.`Moshtari` (
  `ID` INT NOT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `payment_bill` DECIMAL(12,2) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `MyComputerServices`.`Moshtari_Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyComputerServices`.`Moshtari_Department` (
  `department_name` VARCHAR(45) NOT NULL,
  `Moshtari_ID` INT NOT NULL,
  PRIMARY KEY (`department_name`, `Moshtari_ID`),
  INDEX `Moshtari_id_idx` (`Moshtari_ID` ASC) VISIBLE,
  CONSTRAINT `departmen_name`
    FOREIGN KEY (`department_name`)
    REFERENCES `MyComputerServices`.`Department` (`dept_name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Moshtari_id`
    FOREIGN KEY (`Moshtari_ID`)
    REFERENCES `MyComputerServices`.`Moshtari` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `MyComputerServices`.`service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyComputerServices`.`service` (
  `ID` INT NOT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  `cost` DECIMAL(12,2) NULL DEFAULT NULL,
  `dept_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_dept_name_idx` (`dept_name` ASC) VISIBLE,
  CONSTRAINT `dept_name`
    FOREIGN KEY (`dept_name`)
    REFERENCES `MyComputerServices`.`Department` (`dept_name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `MyComputerServices`.`Moshtari_service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyComputerServices`.`Moshtari_service` (
  `service_ID` INT NOT NULL,
  `Moshtari_ID` INT NOT NULL,
  PRIMARY KEY (`Moshtari_ID`, `service_ID`),
  INDEX `service_ID_idx` (`service_ID` ASC) VISIBLE,
  CONSTRAINT `Moshtari_ID2`
    FOREIGN KEY (`Moshtari_ID`)
    REFERENCES `MyComputerServices`.`Moshtari` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `service_ID`
    FOREIGN KEY (`service_ID`)
    REFERENCES `MyComputerServices`.`service` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `MyComputerServices`.`Part`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyComputerServices`.`Part` (
  `ID` INT NOT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `MyComputerServices`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyComputerServices`.`addresses` (
  `ID` INT NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `ally` VARCHAR(45) NOT NULL,
  `plaque` SMALLINT NOT NULL,
  PRIMARY KEY (`ID`, `street`, `ally`, `plaque`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `MyComputerServices`.`part_service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyComputerServices`.`part_service` (
  `part_ID` INT NOT NULL,
  `service_ID` INT NOT NULL,
  PRIMARY KEY (`part_ID`, `service_ID`),
  INDEX `service_ID_idx` (`service_ID` ASC) VISIBLE,
  CONSTRAINT `Part_ID`
    FOREIGN KEY (`part_ID`)
    REFERENCES `MyComputerServices`.`Part` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `service_ID2`
    FOREIGN KEY (`service_ID`)
    REFERENCES `MyComputerServices`.`service` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `MyComputerServices`.`phone_numbers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyComputerServices`.`phone_numbers` (
  `ID` INT NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`, `phone_number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
