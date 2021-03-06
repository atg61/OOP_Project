-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.6.7-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- coiffeur için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `coiffeur` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `coiffeur`;

-- tablo yapısı dökülüyor coiffeur.appointment
CREATE TABLE IF NOT EXISTS `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hairdresser_id` int(11) NOT NULL,
  `hairdresser_name` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `app_date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- coiffeur.appointment: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `appointment` (`id`, `hairdresser_id`, `hairdresser_name`, `customer_id`, `customer_name`, `app_date`) VALUES
	(1, 11, 'Muratcan ilhan', 15, 'Ali Batak', '2022-05-29 10:00:00'),
	(2, 11, 'Muratcan ilhan', 15, 'Ali Batak', '2022-05-29 14:00:00');

-- tablo yapısı dökülüyor coiffeur.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- coiffeur.category: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Man Hair'),
	(4, 'Women Hair'),
	(5, 'Women Nail'),
	(6, 'Men\'s skin care'),
	(7, 'Women skin care ');

-- tablo yapısı dökülüyor coiffeur.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identitynum` varchar(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` enum('Customer','Staff','Hairdresser') NOT NULL DEFAULT 'Customer',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- coiffeur.user: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `user` (`id`, `identitynum`, `password`, `name`, `type`) VALUES
	(11, '18182268972', '123', 'Muratcan ilhan', 'Staff'),
	(13, '18182268975', '1234', ' Abdullah Guveli', 'Hairdresser'),
	(14, '18182268976', '123', 'Tarik Yeter', 'Hairdresser'),
	(15, '18265899785', '123', 'Ali Batak', 'Customer');

-- tablo yapısı dökülüyor coiffeur.whour
CREATE TABLE IF NOT EXISTS `whour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hairdresser_id` int(11) NOT NULL,
  `hairdresser_name` varchar(255) NOT NULL DEFAULT '',
  `wdate` varchar(255) NOT NULL DEFAULT '',
  `status` enum('a','p') NOT NULL DEFAULT 'a',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- coiffeur.whour: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `whour` (`id`, `hairdresser_id`, `hairdresser_name`, `wdate`, `status`) VALUES
	(1, 11, 'Muratcan ilhan', '2022-05-28 12:00:00', 'a'),
	(2, 11, 'Muratcan ilhan', '2022-05-29 10:00:00', 'p'),
	(3, 11, 'Muratcan ilhan', '2022-05-29 14:00:00', 'p');

-- tablo yapısı dökülüyor coiffeur.worker
CREATE TABLE IF NOT EXISTS `worker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- coiffeur.worker: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `worker` (`id`, `category_id`, `user_id`) VALUES
	(1, 1, 11),
	(2, 2, 13),
	(3, 1, 14),
	(4, 4, 13);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
