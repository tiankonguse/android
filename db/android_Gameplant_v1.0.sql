SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `android_GamePlatform` ;
CREATE SCHEMA IF NOT EXISTS `android_GamePlatform` DEFAULT CHARACTER SET utf8 ;
USE `android_GamePlatform` ;

-- -----------------------------------------------------
-- Table `android_GamePlatform`.`android_Gameplatform_class`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `android_GamePlatform`.`android_Gameplatform_class` (
  `id` INT(11) NOT NULL ,
  `name` VARCHAR(45) NOT NULL COMMENT 'there is a rank that should be filter.' ,
  `Pagelink` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `android_GamePlatform`.`android_GamePlatform_name`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `android_GamePlatform`.`android_GamePlatform_name` (
  `id` INT(11) NOT NULL ,
  `name` VARCHAR(45) NOT NULL COMMENT 'game name' ,
  `Pagelink` VARCHAR(255) NOT NULL COMMENT 'a page about information of the game ' ,
  `imgLink` VARCHAR(255) NOT NULL COMMENT 'the game image' ,
  `apkLink` VARCHAR(255) NOT NULL COMMENT 'download link' ,
  `star` VARCHAR(45) NOT NULL COMMENT 'star ' ,
  `size` VARCHAR(45) NULL COMMENT 'how byte it is.' ,
  `time` VARCHAR(45) NULL DEFAULT NULL ,
  `introduction` MEDIUMTEXT NULL DEFAULT NULL COMMENT 'introduction' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `android_GamePlatform`.`android_GamePlatform_map`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `android_GamePlatform`.`android_GamePlatform_map` (
  `class_id` INT(11) NOT NULL COMMENT 'rank also in here' ,
  `name_id` INT(11) NOT NULL ,
  PRIMARY KEY (`class_id`, `name_id`) ,
  INDEX `tk_android_class_idx` (`class_id` ASC) ,
  INDEX `tk_android_name_idx` (`name_id` ASC) ,
  CONSTRAINT `tk_android_class`
    FOREIGN KEY (`class_id` )
    REFERENCES `android_GamePlatform`.`android_Gameplatform_class` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `tk_android_name`
    FOREIGN KEY (`name_id` )
    REFERENCES `android_GamePlatform`.`android_GamePlatform_name` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
