-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2020 at 03:39 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `onlineshopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
`id` int(11) NOT NULL,
  `address_line_one` varchar(255) DEFAULT NULL,
  `address_line_two` varchar(255) DEFAULT NULL,
  `billing` bit(1) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `shipping` bit(1) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `address_line_one`, `address_line_two`, `billing`, `city`, `country`, `postal_code`, `shipping`, `state`, `user_id`) VALUES
(1, 'Sonargaon,Narayanganj', 'Dhaka, Bangladesh', b'1', 'Sonargaon', 'Bangladesh', '1441', b'0', 'Mograpara', 1),
(2, 'Sonargaon,Narayanganj', 'Dhaka, Bangladesh', b'0', 'Sonargaon', 'Bangladesh', '1441', b'1', 'Mograpara', 1),
(3, 'Shibganj,Chapainawabganj', 'Rajshahi, Bangladesh', b'0', 'Shibganj', 'Bangladesh', '6341', b'1', 'Chandpur', 1),
(4, 'Chadpur Azmatpur', 'Shipganj', b'1', 'Chapainawabganj', 'Bangladesh', '6341', b'0', 'Rajshahi', 3),
(5, 'Chadpur Azmatpur', 'Shipganj', b'1', 'Chapainawabganj', 'Bangladesh', '6341', b'0', 'Rajshahi', 4),
(6, 'Sonaragon', 'Baranagar', b'1', 'Narayanganj', 'Bangladesh', '1441', b'0', 'Dhaka', 5),
(7, 'Sonaragon', 'Baranagar', b'1', 'Narayanganj', 'Bangladesh', '1441', b'0', 'Dhaka', 6);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
`id` int(11) NOT NULL,
  `cart_lines` int(11) DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `cart_lines`, `grand_total`, `user_id`) VALUES
(1, 0, 0, 3),
(2, 0, 0, 4),
(3, 0, 0, 5),
(4, 0, 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `cart_line`
--

CREATE TABLE IF NOT EXISTS `cart_line` (
`id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_count` int(11) NOT NULL,
  `buying_price` decimal(10,2) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`id` int(11) NOT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `is_active`, `description`, `image_url`, `name`) VALUES
(3, b'1', 'This is description for Laptop category!', 'CAT_1.png', 'Laptops'),
(4, b'1', 'This is description for Television category!', 'CAT_2.png', 'Televisions'),
(5, b'1', 'This is description for Mobile category!', 'CAT_3.png', 'Mobiles'),
(6, b'1', 'Only Mobile Accessories is here', NULL, 'Mobile Accessories'),
(7, b'1', ' only camera are allow', NULL, 'Cameras');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_total` decimal(10,2) DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  `shipping_id` int(11) DEFAULT NULL,
  `billing_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `user_id`, `order_total`, `order_count`, `shipping_id`, `billing_id`, `order_date`) VALUES
(1, 4, '95000.00', 3, 4, 5, '2020-05-31'),
(2, 5, '18000.00', 1, 5, 6, '2020-06-01'),
(3, 5, '18000.00', 1, 5, 6, '2020-06-01'),
(4, 4, '18000.00', 1, 4, 5, '2020-06-01'),
(5, 4, '65999.00', 3, 4, 5, '2020-06-11'),
(6, 6, '163199.00', 3, 6, 7, '2020-06-12');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE IF NOT EXISTS `order_item` (
`id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL,
  `buying_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`id`, `order_id`, `total`, `product_id`, `product_count`, `buying_price`) VALUES
(1, 1, '5000.00', 6, 1, '5000.00'),
(2, 1, '54000.00', 4, 1, '54000.00'),
(3, 1, '36000.00', 1, 2, '18000.00'),
(4, 2, '18000.00', 1, 1, '18000.00'),
(5, 3, '18000.00', 1, 1, '18000.00'),
(6, 4, '18000.00', 1, 1, '18000.00'),
(7, 5, '18000.00', 1, 1, '18000.00'),
(8, 5, '32000.00', 2, 1, '32000.00'),
(9, 5, '15999.00', 20, 1, '15999.00'),
(10, 6, '27999.00', 21, 1, '27999.00'),
(11, 6, '54000.00', 4, 1, '54000.00'),
(12, 6, '81200.00', 29, 1, '81200.00');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
`id` int(11) NOT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `purchases` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `unit_price` double DEFAULT NULL,
  `views` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `is_active`, `brand`, `category_id`, `code`, `description`, `name`, `purchases`, `quantity`, `supplier_id`, `unit_price`, `views`) VALUES
(1, b'0', 'apple', 5, 'PRDABC123DEFX', 'This is one of the best phone available in the market right now!', 'iPhone 5s', 1, 2, 2, 18000, 5),
(2, b'0', 'samsung', 5, 'PRDDEF123DEFX', 'A smart phone by samsung!', 'Samsung s7', 1, 1, 3, 32000, 2),
(3, b'0', 'google', 5, 'PRDPQR123WGTX', 'This is one of the best android smart phone available in the market right now!', 'Google Pixel', 0, 5, 2, 57000, 0),
(4, b'1', 'apple', 1, 'PRDMNO123PQRX', 'This is one of the best laptops available in the market right now!', ' Macbook Pro', 2, 1, 2, 54000, 1),
(5, b'1', 'dell', 1, 'PRDABCXYZDEFX', 'This is one of the best laptop series from dell that can be used!', 'Dell Latitude E6510', 0, 5, 3, 48000, 2),
(6, b'1', 'Asus', 3, 'PRD62DAED0833', 'ASUS X509FA Core i3 8th Gen 15.6 FHD Laptop with Genuine Windows 10', 'ASUS X509FA ', 0, 7, 0, 48500, 0),
(7, b'1', 'Asus', 3, 'PRD898C43B4A6', 'Asus ZenBook UX433FN Core i5 8th Gen 14 Full HD Ultra-Slim Laptop With Genuine Windows 10', 'Asus ZenBook UX433FN', 0, 7, 1, 97200, 2),
(8, b'1', 'Asus', 3, 'PRD16D7DFD80C', 'Asus ASUSPRO P1440FA 8th Gen Core i3 15.6 HD Laptop', ' Asus ASUSPRO P1440FA', 0, 4, 1, 46510, 0),
(9, b'1', 'Asus', 3, 'PRD6C0CD642B0', 'Asus ROG Strix G531GT Core i5 9th Gen NVIDIA GeForce GTX 1650 Graphics 15.6 Full HD Gaming Laptop With Genuine Win 10', 'Asus ROG Strix G531GT', 0, 5, 1, 117500, 0),
(10, b'1', 'Asus', 3, 'PRD02589CF3E9', 'Asus VivoBook X402YA AMD Dual Core 14 HD Laptop With Genuine Windows 10', 'Asus VivoBook ', 0, 12, 1, 29520, 0),
(11, b'1', 'Asus', 3, 'PRDC1E610DD7C', 'Asus ASUSPRO P1440FA 8th Gen Core i3 15.6 HD Laptop', 'Asus ASUSPRO ', 0, 9, 1, 46510, 0),
(12, b'1', 'DELL', 3, 'PRDCE6E9B697C', 'Dell Inspiron 15-3552 Intel CDC N3060 (1.60GHz, 4GB, 500GB) 15.6 Inch HD (1366X768) Display, Black Notebook (2 Yr Warranty)', 'Dell Inspiron ', 0, 12, 1, 26900, 0),
(13, b'1', 'DELL', 3, 'PRD7D0D87EE55', 'DELL INSPIRON 14 3480 INTEL Pentium Gold 5405U 2.3 GHz', 'DELL INSPIRON 14 ', 0, 9, 1, 33000, 0),
(14, b'1', 'DELL', 3, 'PRDBCA1E306F3', 'Dell Inspiron 13 7370 Core i5 8th Gen 13.3 Full HD Laptop', 'Dell Inspiron 13 7370 ', 0, 4, 1, 103407, 0),
(15, b'1', 'Acer', 3, 'PRD40149F1F0B', 'Acer Aspire E5-476 Core i3 8th Gen 14 HD Laptop', 'Acer Aspire E5-476', 0, 4, 1, 45120, 0),
(16, b'1', 'Acer', 3, 'PRD7E2DFFB32B', 'Acer Nitro AN515-52 Core i7 15.6 Full HD Gaming Laptop With Graphics', 'Acer Nitro AN515-52 ', 0, 6, 1, 102600, 0),
(17, b'1', 'Apple', 3, 'PRD3EEC7C8D1D', 'Apple MacBook Pro 13" Retina (MPXQ2) 2.3GHz Dual Core Intel Core I5 128GB 2017', 'MacBook Pro', 0, 3, 1, 125000, 0),
(18, b'1', 'Apple', 3, 'PRDB01ED654F1', 'Apple MacBook Pro Core i7 2018 Graphics AMD Radeon Pro 555X 4GB 15.4 Inch Display MacBook\r\ni7 Six Core 2.2-4.1GHz\r\n15.4 InchDisplay\r\n16GB DDR4 2400MHz RAM\r\n256GB SSD', 'Apple MacBook ', 0, 3, 1, 207000, 0),
(19, b'1', 'HP', 3, 'PRDB03BE682EA', 'HP 14-BS732TU 7th Gen Intel Core i3 7020U (2.3GHz, 1x4GB 2133MHz, 1TB 5400rpm, DVD-RW) 14.1 Inch HD', 'HP 14-BS732TU 7th Gen', 0, 5, 1, 38775, 0),
(20, b'1', 'Xiaomi', 5, 'PRD53B4BBED5B', 'Redmi Y3 Smartphone 6.26" - 3GB RAM - 32GB ROM - 32MP Selfie Camera - Elegant Blue', 'Redmi Y3', 1, 5, 1, 15999, 3),
(21, b'1', 'Xiaomi', 5, 'PRD0EFF9EE0C2', 'Redmi Note 8 Pro - 6.53inches - 6GB RAM - 128GB ROM - 20MP Selfie Camera', 'Redmi Note 8 Pro', 1, 6, 1, 27999, 0),
(22, b'1', 'Xiaomi', 5, 'PRDE9727EA66C', 'Xiaomi Redmi Note 7 - 6.3" - 3GB RAM - 32GB ROM - 48MP + 5MP AI Dual Rear Camera', 'Xiaomi Redmi Note 7', 0, 6, 1, 17999, 0),
(23, b'1', 'Nokia', 5, 'PRD6F19C00105', 'Nokia 6.2 Smartphone - 6.3 inches - 4RAM - 64GB ROM - 16MP Camera - Ceramic Black', 'Nokia 6.2 ', 0, 4, 1, 20999, 0),
(24, b'1', 'Huawei ', 5, 'PRDAF9A042488', 'Huawei P30 Lite - Smartphone - 6.15 - 6GB RAM - 128GB ROM - 24MP Camera', 'Huawei P30 Lite', 0, 4, 1, 23490, 0),
(25, b'1', 'Huawei ', 5, 'PRD85EA601EA2', 'wei Y9s - Smartphone - 6.59 - 6GB RAM - 128GB ROM - 16MP Camera', 'Huawei Y9s', 0, 3, 1, 27490, 0),
(26, b'1', 'Samsung', 5, 'PRD652E3E2398', 'Samsung Galaxy A9 Smartphone - 6.3- 6GB RAM - 128GB ROM - 24MP + 24MP Camera', 'Samsung Galaxy A9 ', 0, 5, 1, 39990, 0),
(27, b'1', 'Samsung', 5, 'PRD7D98517883', 'Samsung Galaxy A30s -Android 9.0 (Pie) - 4GB/128GB - Super AMOLED Display - 4000mAh Fast Charging', 'Samsung Galaxy A30s', 0, 4, 1, 21999, 0),
(28, b'1', 'Vikan', 4, 'PRD720F7A2B07', '40'''' Vikan Smile Android Smart HD LED TV - Black\r\n', '40'''' Vikan Smile Android Smart HD ', 0, 3, 1, 17955, 0),
(29, b'1', 'SONY', 4, 'PRDAE673B11E4', 'Full HD LED Internet TV 43W750E-43" - Black', 'Full HD LED Internet TV', 1, 2, 1, 81200, 0),
(30, b'1', ' Maisha Electronics', 6, 'PRD4DA6C7F2BF', 'Provides waterproof protection for your cell phones, while maintaining full touch screen functionality. ', 'Waterproof Mobile Bag', 0, 6, 1, 190, 0),
(31, b'1', 'Samsung', 6, 'PRDC2FC7BD440', 'Mobile Battery Samsung Galaxy J5, j3, j3 (2016), J2 PRIME, GRAND PEIME, G531, G532, J2 PRO, J2 (2016) - 2600mAh Replacement Battery,\r\n\r\n which features a capacity of around 2600mAh. ', 'SAMSUNG BATTERY EB-BG531BBE Replacement Battery', 0, 9, 1, 550, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE IF NOT EXISTS `user_detail` (
`id` int(11) NOT NULL,
  `contract_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`id`, `contract_number`, `email`, `enabled`, `first_name`, `last_name`, `password`, `role`) VALUES
(1, '01521438923', 'mdnaimurr@gmail.com', b'1', 'Md Naimur', 'Rahman', '$2y$12$OBgUItMxts1ZdJRYhbRCn.TZj4z5IdKG09nZbA7Eda0C186ajkkLC', 'ADMIN'),
(2, '017206462', 'kawsarhossaiont@gmail.com', b'1', 'Md Kawsar', 'Hossain Tuhin', '$2y$12$RDZNSZR4sSjBP4nZXs9Q0uJ8mrFOraulLb0JKBNrAdCX9RbzQHfCq', 'SUPPLIER'),
(3, '0173684216', 'baby.coder.cse@gmail.com', b'1', 'Abdul ', 'Bakir', '123435', 'USER'),
(4, '0135984566', 'masum@gmail.com', b'1', 'Masum', 'Billa', '$2a$10$2gptubp27bZV9Ps7s47L6uFqwc0ceL/451VBoTxFA/VS143zFKsv6', 'USER'),
(5, '0135984566', 'lionfish@gmail.com', b'1', 'Lion', 'Fish', '$2a$10$BeXl60wTjLEq68odvbHLteIyPKZhjK.0cbFIYr9ihzrkNbVr9cq8y', 'USER'),
(6, '0173684216', 'bappy@gmail.com', b'1', 'Bappy', 'Khan', '$2a$10$PuuTjFLUT3KZBfLuXOw/velxElMNzsCSagSW3BdLE9xxqTMRBcWK2', 'USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
 ADD PRIMARY KEY (`id`), ADD KEY `FKla4tbftd6lxqr0bql5w3ipfrx` (`user_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
 ADD PRIMARY KEY (`id`), ADD KEY `FKs0ufxli8yj4umuhu7y54gf07q` (`user_id`);

--
-- Indexes for table `cart_line`
--
ALTER TABLE `cart_line`
 ADD PRIMARY KEY (`id`), ADD KEY `cart_id` (`cart_id`), ADD KEY `FKid6jgprm3g219xpamigbwk97j` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
 ADD PRIMARY KEY (`id`), ADD KEY `FK9efs7c9r198iw0am3lp9gr7pe` (`billing_id`), ADD KEY `FKj50er6n132twdby0r41dd9k52` (`shipping_id`), ADD KEY `FKi3ak21dvyd99avohifylcrtij` (`user_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
 ADD PRIMARY KEY (`id`), ADD KEY `FKtgnxy2ydiugl25vsye22npaxe` (`order_id`), ADD KEY `FK6xyequv6tp9t8c10gi3cxnql1` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cart_line`
--
ALTER TABLE `cart_line`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
ADD CONSTRAINT `FKla4tbftd6lxqr0bql5w3ipfrx` FOREIGN KEY (`user_id`) REFERENCES `user_detail` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
ADD CONSTRAINT `FKs0ufxli8yj4umuhu7y54gf07q` FOREIGN KEY (`user_id`) REFERENCES `user_detail` (`id`);

--
-- Constraints for table `cart_line`
--
ALTER TABLE `cart_line`
ADD CONSTRAINT `FKid6jgprm3g219xpamigbwk97j` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
ADD CONSTRAINT `cart_line_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
ADD CONSTRAINT `cart_line_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
ADD CONSTRAINT `FK9efs7c9r198iw0am3lp9gr7pe` FOREIGN KEY (`billing_id`) REFERENCES `address` (`id`),
ADD CONSTRAINT `FKi3ak21dvyd99avohifylcrtij` FOREIGN KEY (`user_id`) REFERENCES `user_detail` (`id`),
ADD CONSTRAINT `FKj50er6n132twdby0r41dd9k52` FOREIGN KEY (`shipping_id`) REFERENCES `address` (`id`),
ADD CONSTRAINT `fk_order_detail_billing_id` FOREIGN KEY (`billing_id`) REFERENCES `address` (`id`),
ADD CONSTRAINT `fk_order_detail_shipping_id` FOREIGN KEY (`shipping_id`) REFERENCES `address` (`id`),
ADD CONSTRAINT `fk_order_detail_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_detail` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
ADD CONSTRAINT `FK6xyequv6tp9t8c10gi3cxnql1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
ADD CONSTRAINT `FKtgnxy2ydiugl25vsye22npaxe` FOREIGN KEY (`order_id`) REFERENCES `order_detail` (`id`),
ADD CONSTRAINT `fk_order_item_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_detail` (`id`),
ADD CONSTRAINT `fk_order_item_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
