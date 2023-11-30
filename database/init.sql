-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Server: 127.0.0.1:3306
-- Version server: 5.7.31
-- Version PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `platepilot`
--
CREATE DATABASE IF NOT EXISTS `platepilot` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `platepilot`;

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
CREATE TABLE IF NOT EXISTS `Categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Data dump for table `Categories`
--

INSERT INTO `Categories` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'NORTH INDIAN', '2023-11-27 14:23:27', '2023-11-27 14:23:27'),
(2, 'SOUTH INDIAN', '2023-11-27 14:23:33', '2023-11-27 14:23:33'),
(3, 'CONTINENTAL', '2023-11-27 14:23:38', '2023-11-27 14:23:38'),
(4, 'CHINESE', '2023-11-27 14:23:45', '2023-11-27 14:23:45');

-- --------------------------------------------------------

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
CREATE TABLE IF NOT EXISTS `Clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL DEFAULT 'Address',
  `phone` varchar(255) NOT NULL DEFAULT '999999999',
  `email` varchar(255) NOT NULL,
  `dni` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Data dump for table `Clients`
--

INSERT INTO `Clients` (`id`, `name`, `address`, `phone`, `email`, `dni`, `createdAt`, `updatedAt`) VALUES
(1, 'Jose Morinho', 'Venice, Italy', '1234567890', 'jose2morinho@example.com', '56754322', '2023-11-27 14:31:19', '2023-11-27 14:31:19'),
(2, 'John Doe', 'Barrio Centro, Rivadavia 1030', '3804123123', 'johndoe@example.com', '40123123', '2023-11-27 14:32:10', '2023-11-27 14:32:10'),
(3, 'Amrinder Singh', 'Patiala, Punjab', '9876543210', 'amrinder.singh@gmail.com', '78754564', '2023-11-27 14:33:20', '2023-11-27 14:33:20');

-- --------------------------------------------------------

--
-- Table structure for table `OrderProducts`
--

DROP TABLE IF EXISTS `OrderProducts`;
CREATE TABLE IF NOT EXISTS `OrderProducts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
CREATE TABLE IF NOT EXISTS `Orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` double NOT NULL,
  `isPaid` tinyint(1) NOT NULL DEFAULT '0',
  `delivery` tinyint(1) NOT NULL DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `tableId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `clientId` (`clientId`),
  KEY `tableId` (`tableId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
CREATE TABLE IF NOT EXISTS `Products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Data dump for table `Products`
--

INSERT INTO `Products` (`id`, `name`, `price`, `stock`, `categoryId`, `createdAt`, `updatedAt`) VALUES
(1, 'DOSA', 80, 100, 2, '2023-11-27 14:26:06', '2023-11-27 14:26:06'),
(2, 'DAL MAKHANI', 120, 150, 1, '2023-11-27 14:26:15', '2023-11-27 14:26:15'),
(3, 'BUTTER ROTI', 15, 1000, 1, '2023-11-27 14:26:20', '2023-11-27 14:26:20'),
(4, 'MARGHERITA PIZZA', 150, 120, 3, '2023-11-27 14:26:30', '2023-11-27 14:26:30'),
(5, 'CHEESEBURGER', 80, 200, 3, '2023-11-27 14:26:34', '2023-11-27 14:26:34'),
(6, 'HAKKA NOODLES', 120, 180, 4, '2023-11-27 14:26:40', '2023-11-27 14:26:40'),
(7, 'CHOWMEIN', 120, 225, 4, '2023-11-27 14:26:45', '2023-11-27 14:26:45');

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

DROP TABLE IF EXISTS `SequelizeMeta`;
CREATE TABLE IF NOT EXISTS `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Data dump for table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('create-table.js'),
('create-client.js'),
('create-user.js'),
('create-category.js'),
('create-product.js'),
('create-order.js'),
('create-order-product.js');

-- --------------------------------------------------------

--
-- Table structure for table `Tables`
--

DROP TABLE IF EXISTS `Tables`;
CREATE TABLE IF NOT EXISTS `Tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `occupied` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Data dump for table `Tables`
--

INSERT INTO `Tables` (`id`, `name`, `occupied`, `createdAt`, `updatedAt`) VALUES
(1, 'PATIO 1', 0, '2023-11-27 19:50:50', '2023-11-27 19:50:50'),
(2, 'PATIO 2', 0, '2023-11-27 19:50:50', '2023-11-27 19:50:50'),
(3, 'PATIO 3', 0, '2023-11-27 19:50:50', '2023-11-27 19:50:50'),
(4, 'INTERIOR 1', 0, '2023-11-27 19:50:50', '2023-11-27 19:50:50'),
(5, 'INTERIOR 2', 0, '2023-11-27 19:50:50', '2023-11-27 19:50:50'),
(6, 'BARRA 1', 0, '2023-11-27 19:50:50', '2023-11-27 19:50:50');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
CREATE TABLE IF NOT EXISTS `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '/avatar.png',
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Data dump for table `Users`
--

INSERT INTO `Users` (`id`, `name`, `email`, `password`, `image`, `isAdmin`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', 'admin@example.com', '$2b$10$Ob28q7LgYBCadB0mgVnPD.u8WtBVVoWs28iZTrxFF8LWuwG7xWiuO', '/avatar.png', 1, '2023-11-27 19:10:00', '2023-11-27 19:10:00'),
(2, 'User', 'user@example.com', '$2b$10$Ob28q7LgYBCadB0mgVnPD.u8WtBVVoWs28iZTrxFF8LWuwG7xWiuO', '/avatar.png', 0, '2023-11-27 19:10:00', '2023-11-27 19:10:00');

--
-- Restrictions for dumped tables
--

--
-- Filters for the table `OrderProducts`
--
ALTER TABLE `OrderProducts`
  ADD CONSTRAINT `orderproducts_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `Orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderproducts_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `Products` (`id`) ON DELETE CASCADE;

--
-- Filters for the table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`clientId`) REFERENCES `Clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`tableId`) REFERENCES `Tables` (`id`) ON DELETE CASCADE;

--
-- Filters for the table `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `Categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
