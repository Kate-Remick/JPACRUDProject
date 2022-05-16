-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema familydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `familydb` ;

-- -----------------------------------------------------
-- Schema familydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `familydb` DEFAULT CHARACTER SET utf8 ;
USE `familydb` ;

-- -----------------------------------------------------
-- Table `member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `member` ;

CREATE TABLE IF NOT EXISTS `member` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `birth_date` DATE NULL,
  `death_date` DATE NULL,
  `alive` TINYINT NOT NULL,
  `married` TINYINT NOT NULL,
  `image_path` VARCHAR(200) NULL,
  `mother_id` INT NULL DEFAULT 0,
  `father_id` INT NULL DEFAULT 0,
  `spouse_id` INT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS member@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'member'@'localhost' IDENTIFIED BY 'member';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'member'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `member`
-- -----------------------------------------------------
START TRANSACTION;
USE `familydb`;
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (1, 'Melinda', 'Smith', 'female', '1975-09-03', NULL, TRUE, TRUE, NULL, 10, 9, 2);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (2, 'Trevor', 'Smith', 'Male', '1974-12-03', NULL, TRUE, TRUE, NULL, 27, 26, 1);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (3, 'Micheal', 'Smith', 'Male', '1901-10-03', '1965-09-12', FALSE, TRUE, NULL, NULL, 18, 4);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (4, 'Angie', 'Smith', 'female', '1902-01-07', '1971-11-03', FALSE, TRUE, NULL, NULL, NULL, 3);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (5, 'Christopher', 'Carter', 'Male', '1946-04-17', NULL, FALSE, TRUE, NULL, 6, NULL, 24);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (6, 'Martha', 'Carter', 'female', '1924-08-12', '1989-04-09', FALSE, FALSE, NULL, 21, 22, NULL);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (7, 'Astel', 'Gardener', 'female', '1971-08-23', NULL, TRUE, TRUE, NULL, 24, 5, NULL);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (8, 'Esther', 'Carter', 'female', '1971-08-23', NULL, TRUE, FALSE, NULL, 24, 5, NULL);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (9, 'Wayne', 'Quinn', 'Male', '1950-04-07', '1984-12-25', FALSE, TRUE, NULL, 11, 16, 10);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (10, 'Prarie', 'Quinn', 'female', '1951-02-13', NULL, TRUE, FALSE, NULL, 14, 12, NULL);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (11, 'Cynthia', 'Quinn', 'female', '1930-07-14', '2010-10-15', FALSE, TRUE, NULL, NULL, NULL, 16);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (12, 'Gary', 'Archer', 'Male', '1925-06-09', NULL, TRUE, TRUE, NULL, NULL, NULL, NULL);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (13, 'Noah', 'Archer', 'Male', '1947-12-01', NULL, FALSE, TRUE, NULL, 14, 12, NULL);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (14, 'Babara', 'Archer', 'female', '1930-07-23', '1953-02-02', FALSE, TRUE, NULL, NULL, NULL, 12);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (15, 'Matthew', 'Archer', 'male', '1953-02-02', NULL, FALSE, TRUE, NULL, 14, 12, NULL);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (16, 'Blain', 'Quinn', 'Male', '1927-07-14', '2010-10-16', FALSE, TRUE, NULL, NULL, NULL, 11);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (17, 'Samuel', 'Smith', 'Male', '1922-03-19', '2005-07-19', FALSE, TRUE, NULL, 4, 3, 25);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (18, 'Calligula IIII', 'Ishuman', 'male', '1904-12-27', NULL, TRUE, FALSE, NULL, NULL, NULL, NULL);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (19, 'Martha', 'Gerber', 'female', '1925-03-05', '1999-02-09', FALSE, TRUE, NULL, NULL, NULL, 20);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (20, 'Felix', 'Gerber', 'Male', '1926-12-01', '2001-09-12', FALSE, TRUE, NULL, 21, 22, 19);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (21, 'Laura', 'Gerber', 'female', '1905-10-23', '1978-12-13', FALSE, TRUE, NULL, NULL, NULL, 22);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (22, 'Thomas', 'Gerber', 'Male', '1901-05-30', '1965-11-02', FALSE, TRUE, NULL, NULL, NULL, 21);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (23, 'William', 'Smith', 'Male', '1996-01-11', NULL, TRUE, FALSE, NULL, 1, 2, NULL);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (24, 'Charlotte', 'Carter', 'female', '1946-06-06', NULL, FALSE, TRUE, NULL, NULL, NULL, 5);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (25, 'Linda', 'Smith', 'female', '1922-05-13', '2018-01-03', FALSE, TRUE, NULL, 21, 22, 17);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (26, 'Charles', 'Smith', 'male', '1948-09-21', NULL, TRUE, TRUE, NULL, 25, 17, 27);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (27, 'Patricia', 'Smith', 'femaie', '1950-06-23', NULL, TRUE, TRUE, NULL, NULL, NULL, 26);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (28, 'David', 'Smith', 'male', '1998-04-01', NULL, TRUE, FALSE, NULL, 1, 2, NULL);
INSERT INTO `member` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `alive`, `married`, `image_path`, `mother_id`, `father_id`, `spouse_id`) VALUES (29, 'Grace', 'Smith', 'female', '1923-04-22', '1972-09-23', FALSE, TRUE, NULL, 4, 3, NULL);

COMMIT;

