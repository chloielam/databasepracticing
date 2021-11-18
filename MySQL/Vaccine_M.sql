-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Vaccine_management
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Vaccine_management
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Vaccine_management` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
-- -----------------------------------------------------
-- Schema vaccine_management
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vaccine_management
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vaccine_management` ;
USE `Vaccine_management` ;

-- -----------------------------------------------------
-- Table `Vaccine_management`.`Vacxin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vaccine_management`.`Vacxin` (
  `VName` VARCHAR(50) NOT NULL,
  `Developer` VARCHAR(50) NULL DEFAULT NULL,
  `Technology` VARCHAR(50) NULL DEFAULT NULL,
  `Availability_date` VARCHAR(50) NULL DEFAULT NULL,
  `Effectiveness` INT NULL DEFAULT NULL,
  `Min_age` INT NULL DEFAULT NULL,
  `Max_age` INT NULL DEFAULT NULL,
  `Dosage` INT NULL DEFAULT NULL,
  `Time_between_first_and_second_dose_in_week` INT NULL DEFAULT NULL,
  `Time_between_second_and_third_dose_in_week` INT NULL DEFAULT NULL,
  PRIMARY KEY (`VName`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- -----------------------------------------------------
-- Table `Vaccine_management`.`Vacxin_consignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vaccine_management`.`Vacxin_consignment` (
  `VSerial_number` INT NOT NULL,
  `VName` VARCHAR(50) NOT NULL,
  `Manufacturer` VARCHAR(50) NULL DEFAULT NULL,
  `Expire_day` VARCHAR(50) NULL DEFAULT NULL,
  `Available_dose` INT NULL DEFAULT NULL,
  `Imported_date` VARCHAR(50) NULL DEFAULT NULL,
  `Import_company` VARCHAR(50) NULL DEFAULT NULL,
  `Total` INT NULL DEFAULT NULL,
  `Manufactoring_date` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`VSerial_number`, `VName`),
  INDEX `VName` (`VName` ASC) VISIBLE,
  INDEX `idx5` (`Expire_day` ASC) VISIBLE,
  INDEX `idx10` (`Imported_date` ASC) VISIBLE,
  INDEX `idx12` (`Manufactoring_date` ASC) VISIBLE,
  CONSTRAINT `vacxin_consignment_ibfk_1`
    FOREIGN KEY (`VName`)
    REFERENCES `Vaccine_management`.`Vacxin` (`VName`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- -----------------------------------------------------
-- Table `Vaccine_management`.`Distributed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vaccine_management`.`Distributed` (
  `Medical_serial_number` INT NOT NULL,
  `VSerial_number` INT NOT NULL,
  `Distributed_date` VARCHAR(50) NULL DEFAULT NULL,
  `Total` INT NULL DEFAULT NULL,
  `Available_dose` INT NULL DEFAULT NULL,
  PRIMARY KEY (`VSerial_number`, `Medical_serial_number`),
  INDEX `Medical_serial_number` (`Medical_serial_number` ASC) VISIBLE,
  INDEX `id2` (`Distributed_date` ASC) VISIBLE,
  CONSTRAINT `distributed_ibfk_1`
    FOREIGN KEY (`Medical_serial_number`)
    REFERENCES `Vaccine_management`.`medical_center` (`Medical_serial_number`),
  CONSTRAINT `distributed_ibfk_2`
    FOREIGN KEY (`VSerial_number`)
    REFERENCES `Vaccine_management`.`Vacxin_consignment` (`VSerial_number`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- -----------------------------------------------------
-- Table `Vaccine_management`.`District`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vaccine_management`.`District` (
  `Dname` VARCHAR(50) NOT NULL,
  `Population` INT NULL DEFAULT NULL,
  `Fully_vaccinated` INT NULL DEFAULT NULL,
  `Partially_vaccinated` INT NULL DEFAULT NULL,
  `Unvaccinated` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Dname`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- -----------------------------------------------------
-- Table `Vaccine_management`.`Ward`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vaccine_management`.`Ward` (
  `DName` VARCHAR(50) NOT NULL,
  `WName` VARCHAR(50) NOT NULL,
  `Population` INT NULL DEFAULT NULL,
  `Fully_vaccinated` INT NULL DEFAULT NULL,
  `Partially_vaccinated` INT NULL DEFAULT NULL,
  `Unvaccinated` INT NULL DEFAULT NULL,
  PRIMARY KEY (`WName`, `DName`),
  INDEX `DName` (`DName` ASC) VISIBLE,
  CONSTRAINT `ward_ibfk_1`
    FOREIGN KEY (`DName`)
    REFERENCES `Vaccine_management`.`District` (`Dname`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- -----------------------------------------------------
-- Table `Vaccine_management`.`HouseHold`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vaccine_management`.`HouseHold` (
  `HouseHold_serial_number` INT NOT NULL,
  `Population` INT NULL DEFAULT NULL,
  `Fully_vaccinated` INT NULL DEFAULT NULL,
  `Partially_vaccinated` INT NULL DEFAULT NULL,
  `Unvaccinated` INT NULL DEFAULT NULL,
  `District` VARCHAR(50) NOT NULL,
  `Ward` VARCHAR(50) NOT NULL,
  `Street` VARCHAR(50) NULL DEFAULT NULL,
  `H_number` INT NULL DEFAULT NULL,
  PRIMARY KEY (`HouseHold_serial_number`, `District`, `Ward`),
  INDEX `District` (`District` ASC) VISIBLE,
  INDEX `Ward` (`Ward` ASC) VISIBLE,
  INDEX `idx1` (`H_number` ASC, `Street` ASC, `Ward` ASC, `District` ASC) VISIBLE,
  CONSTRAINT `household_ibfk_1`
    FOREIGN KEY (`District`)
    REFERENCES `Vaccine_management`.`Ward` (`DName`),
  CONSTRAINT `household_ibfk_2`
    FOREIGN KEY (`Ward`)
    REFERENCES `Vaccine_management`.`Ward` (`WName`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- -----------------------------------------------------
-- Table `Vaccine_management`.`Medical_center`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vaccine_management`.`Medical_center` (
  `Medical_serial_number` INT NOT NULL,
  `MName` VARCHAR(50) NULL DEFAULT NULL,
  `District` VARCHAR(50) NOT NULL,
  `Ward` VARCHAR(50) NOT NULL,
  `Street` VARCHAR(50) NULL DEFAULT NULL,
  `M_number` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Medical_serial_number`, `District`, `Ward`),
  INDEX `District` (`District` ASC) VISIBLE,
  INDEX `Ward` (`Ward` ASC) VISIBLE,
  INDEX `idx3` (`MName` ASC) VISIBLE,
  CONSTRAINT `medical_center_ibfk_1`
    FOREIGN KEY (`District`)
    REFERENCES `Vaccine_management`.`Ward` (`DName`),
  CONSTRAINT `medical_center_ibfk_2`
    FOREIGN KEY (`Ward`)
    REFERENCES `Vaccine_management`.`Ward` (`WName`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- -----------------------------------------------------
-- Table `Vaccine_management`.`Resident`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vaccine_management`.`Resident` (
  `ID_card_number` INT NOT NULL,
  `HouseHold_serial_number` INT NOT NULL,
  `Birthday` VARCHAR(50) NULL DEFAULT NULL,
  `Vaccination_status` VARCHAR(50) NULL DEFAULT NULL,
  `Full_name` VARCHAR(50) NULL DEFAULT NULL,
  `Gender` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_card_number`, `HouseHold_serial_number`),
  INDEX `HouseHold_serial_number` (`HouseHold_serial_number` ASC) VISIBLE,
  INDEX `idx6` (`Vaccination_status` ASC) VISIBLE,
  INDEX `idx7` (`Birthday` ASC) VISIBLE,
  INDEX `idx4` (`Full_name` ASC) VISIBLE,
  CONSTRAINT `resident_ibfk_1`
    FOREIGN KEY (`HouseHold_serial_number`)
    REFERENCES `Vaccine_management`.`HouseHold` (`HouseHold_serial_number`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- -----------------------------------------------------
-- Table `Vaccine_management`.`Vaccination_record`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vaccine_management`.`Vaccination_record` (
  `ID_card_number` INT NOT NULL,
  `Medical_serial_number` INT NOT NULL,
  `Dose_number` INT NULL DEFAULT NULL,
  `Consignment_serial_number` INT NOT NULL,
  `Vaccinated_date` VARCHAR(50) NULL DEFAULT NULL,
  `Physician` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_card_number`, `Medical_serial_number`, `Consignment_serial_number`),
  INDEX `Medical_serial_number` (`Medical_serial_number` ASC) VISIBLE,
  INDEX `Consignment_serial_number` (`Consignment_serial_number` ASC) VISIBLE,
  INDEX `idx8` (`Physician` ASC) VISIBLE,
  CONSTRAINT `vaccination_record_ibfk_1`
    FOREIGN KEY (`ID_card_number`)
    REFERENCES `Vaccine_management`.`Resident` (`ID_card_number`),
  CONSTRAINT `vaccination_record_ibfk_2`
    FOREIGN KEY (`Medical_serial_number`)
    REFERENCES `Vaccine_management`.`Medical_center` (`Medical_serial_number`),
  CONSTRAINT `vaccination_record_ibfk_3`
    FOREIGN KEY (`Consignment_serial_number`)
    REFERENCES `Vaccine_management`.`Vacxin_consignment` (`VSerial_number`))
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

USE `vaccine_management` ;
USE `vaccine_management` ;

-- -----------------------------------------------------
-- Placeholder table for view `vaccine_management`.`personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vaccine_management`.`personal` (`ID_card_number` INT, `Resident` INT, `Birthday` INT, `Gender` INT, `Vaccination_status` INT, `MName` INT, `Vaccinated_date` INT, `Dose_number` INT, `Physician` INT, `Consignment_serial_number` INT, `VName` INT);

-- -----------------------------------------------------
-- View `vaccine_management`.`personal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vaccine_management`.`personal`;
USE `vaccine_management`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vaccine_management`.`personal` AS select `vaccine_management`.`resident`.`ID_card_number` AS `ID_card_number`,`vaccine_management`.`resident`.`Full_name` AS `Resident`,`vaccine_management`.`resident`.`Birthday` AS `Birthday`,`vaccine_management`.`resident`.`Gender` AS `Gender`,`vaccine_management`.`resident`.`Vaccination_status` AS `Vaccination_status`,`vaccine_management`.`medical_center`.`MName` AS `MName`,`vaccine_management`.`vaccination_record`.`Vaccinated_date` AS `Vaccinated_date`,`vaccine_management`.`vaccination_record`.`Dose_number` AS `Dose_number`,`vaccine_management`.`vaccination_record`.`Physician` AS `Physician`,`vaccine_management`.`vaccination_record`.`Consignment_serial_number` AS `Consignment_serial_number`,`vaccine_management`.`vacxin_consignment`.`VName` AS `VName` from (((`vaccine_management`.`vaccination_record` join `vaccine_management`.`resident` on((`vaccine_management`.`resident`.`ID_card_number` = `vaccine_management`.`vaccination_record`.`ID_card_number`))) join `vaccine_management`.`medical_center` on((`vaccine_management`.`medical_center`.`Medical_serial_number` = `vaccine_management`.`vaccination_record`.`Medical_serial_number`))) join `vaccine_management`.`vacxin_consignment` on((`vaccine_management`.`vaccination_record`.`Consignment_serial_number` = `vaccine_management`.`vacxin_consignment`.`VSerial_number`))) where (`vaccine_management`.`vaccination_record`.`ID_card_number` = substring_index(user(),'@',1));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
