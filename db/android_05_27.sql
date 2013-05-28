SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `android_GamePlatform` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

USE `android_GamePlatform`;

CREATE  TABLE IF NOT EXISTS `android_GamePlatform`.`class` (
  `id` INT(11) NOT NULL ,
  `name` VARCHAR(45) NOT NULL COMMENT 'there is a rank that should be filter.' ,
  `page` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `android_GamePlatform`.`map` (
  `class_id` INT(11) NOT NULL COMMENT 'rank also in here' ,
  `game_id` INT(11) NOT NULL ,
  PRIMARY KEY (`class_id`, `game_id`) ,
  INDEX `tk_android_class_idx` (`class_id` ASC) ,
  INDEX `tk_android_name_idx` (`game_id` ASC) ,
  CONSTRAINT `tk_android_class`
    FOREIGN KEY (`class_id` )
    REFERENCES `android_GamePlatform`.`class` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `tk_android_name`
    FOREIGN KEY (`game_id` )
    REFERENCES `android_GamePlatform`.`game` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `android_GamePlatform`.`game` (
  `id` INT(11) NOT NULL ,
  `name` VARCHAR(45) NOT NULL COMMENT 'game name' ,
  `Page` VARCHAR(255) NOT NULL COMMENT 'a page about information of the game ' ,
  `img` VARCHAR(255) NOT NULL COMMENT 'the game image' ,
  `apk` VARCHAR(255) NOT NULL COMMENT 'download link' ,
  `star` VARCHAR(45) NOT NULL COMMENT 'star ' ,
  `size` VARCHAR(45) NULL DEFAULT NULL COMMENT 'how byte it is.' ,
  `time` VARCHAR(45) NULL DEFAULT NULL ,
  `info` MEDIUMTEXT NULL DEFAULT NULL COMMENT 'introduction' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
