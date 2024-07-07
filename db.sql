-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.29 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for javadb_10
CREATE DATABASE IF NOT EXISTS `javadb_10` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `javadb_10`;

-- Dumping structure for table javadb_10.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table javadb_10.brand: ~3 rows (approximately)
INSERT INTO `brand` (`id`, `name`) VALUES
	(1, 'Apple'),
	(2, 'Samsung'),
	(3, 'Sony');

-- Dumping structure for table javadb_10.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table javadb_10.city: ~3 rows (approximately)
INSERT INTO `city` (`id`, `name`) VALUES
	(1, 'Colombo'),
	(2, 'Kandy'),
	(3, 'Matara');

-- Dumping structure for table javadb_10.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `mobile` varchar(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`mobile`),
  KEY `fk_customer_city1_idx` (`city_id`),
  CONSTRAINT `fk_customer_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table javadb_10.customer: ~6 rows (approximately)
INSERT INTO `customer` (`mobile`, `name`, `email`, `city_id`) VALUES
	('0712345678', 'Thisara', 'thisara@gmail.com', 2),
	('0713923402', 'Hasindu', 'hasindu@gmail.com', 2),
	('0715127402', 'Lakshan', 'lakshan@gmail.com', 1),
	('0771112223', 'Sahan', 'sahan@gmail.com', 1),
	('0779365487', 'Eshara', 'eshara@gmail.com', 1),
	('0782364233', 'Sachira', 'sachira@gmail.com', 3);

-- Dumping structure for table javadb_10.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoiceNumber` int DEFAULT NULL,
  `customer_mobile` varchar(10) NOT NULL,
  `product_id` int NOT NULL,
  `qty` int DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_customer1_idx` (`customer_mobile`),
  KEY `fk_invoice_product1_idx` (`product_id`),
  CONSTRAINT `fk_invoice_customer1` FOREIGN KEY (`customer_mobile`) REFERENCES `customer` (`mobile`),
  CONSTRAINT `fk_invoice_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table javadb_10.invoice: ~0 rows (approximately)

-- Dumping structure for table javadb_10.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_id` int NOT NULL,
  `model` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_brand_idx` (`brand_id`),
  CONSTRAINT `fk_product_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table javadb_10.product: ~4 rows (approximately)
INSERT INTO `product` (`id`, `brand_id`, `model`, `price`, `quantity`) VALUES
	(1, 1, 'IPhone 8', 50000, 10),
	(2, 1, 'IPhone 12', 60000, 8),
	(3, 2, 'S20', 20000, 6),
	(4, 3, 'Mark ll', 15000, 7);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
