-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 12, 2019 at 08:46 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `snackit`
--

-- --------------------------------------------------------

--
-- Table structure for table `canteens`
--

CREATE TABLE `canteens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `canteens`
--

INSERT INTO `canteens` (`id`, `name`, `address`, `contact_no`, `image`, `description`) VALUES
(1, 'Ten Bhagyanagar', 'Beside Mechanical Dept. SGGS Nanded', '', 'can.png', 'Specializes in Indian Breakfast and Lunch.Open till late at Night for your cravings with unmatched variety.'),
(2, 'Delhi Juice Center', 'Opposite to SGGS Nanded', '9822242842', 'images.jpg', 'Simply the Best Natural Juice Centre in your vicinity.'),
(3, 'Coffee All Day', 'Behind Auditorium SGGS Nanded', '', 'pizza.jpg', 'Get a sip of your morning caffeine from an outlet who has mastered the Art Of Making Coffee.');

-- --------------------------------------------------------

--
-- Table structure for table `canteen_food_class`
--

CREATE TABLE `canteen_food_class` (
  `canteen_id` int(11) NOT NULL,
  `food_class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `canteen_food_class`
--

INSERT INTO `canteen_food_class` (`canteen_id`, `food_class_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 7),
(2, 8),
(2, 9),
(3, 4),
(3, 5),
(3, 6),
(3, 9),
(3, 10),
(3, 12),
(3, 13);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `message` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `message`) VALUES
(1, 'Venkatesh Mangnale', 'mangnalev.1999@gmail.com', '8788567726', 'Very cool website'),
(2, 'Ashish Bodele', 'ashishbodele27@gmail.com', '1234567890', 'Starrrrrrr'),
(3, 'pavan', 'pavan@gmail.com', '9869454335', 'hi');

-- --------------------------------------------------------

--
-- Table structure for table `food_class`
--

CREATE TABLE `food_class` (
  `id` int(11) NOT NULL,
  `class` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_class`
--

INSERT INTO `food_class` (`id`, `class`) VALUES
(1, 'Breakfast'),
(2, 'Lunch'),
(3, 'Chaat'),
(4, 'Hot Beverages'),
(5, 'Sandwiches'),
(6, 'Chinese'),
(7, 'Juice'),
(8, 'Mastani'),
(9, 'Cold Coffee'),
(10, 'Burger'),
(12, 'Italian'),
(13, 'Dessert');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `half` int(10) UNSIGNED DEFAULT NULL,
  `full` int(10) UNSIGNED NOT NULL,
  `canteens_id` int(11) NOT NULL DEFAULT 3,
  `food_class_id` int(11) NOT NULL DEFAULT 7,
  `code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `item`, `half`, `full`, `canteens_id`, `food_class_id`, `code`) VALUES
(1, 'Poha', NULL, 15, 1, 1, 'Ten_Bhagyanagar_Poha'),
(2, 'Upma', NULL, 20, 1, 1, 'Ten_Bhagyanagar_Upma'),
(3, 'Matki/Ussal', NULL, 20, 1, 1, 'Ten_Bhagyanagar_Matki/Ussal'),
(4, 'Sabudana Khichadi', NULL, 25, 1, 1, 'Ten_Bhagyanagar_Sabudana_Khichadi'),
(5, 'Rice Khichadi', NULL, 25, 1, 2, 'Ten_Bhagyanagar_Rice_Khichadi'),
(6, 'Aloo Paratha', NULL, 25, 1, 2, 'Ten_Bhagyanagar_Aloo_Paratha'),
(7, 'Maggy Masala', 20, 30, 1, 3, 'Ten_Bhagyanagar_Maggy_Masala'),
(8, 'Samosa', NULL, 10, 1, 3, 'Ten_Bhagyanagar_Samosa'),
(9, 'Kachori', NULL, 10, 1, 3, 'Ten_Bhagyanagar_Kachori'),
(10, 'Rice Plate', 40, 60, 1, 2, 'Ten_Bhagyanagar_Rice_Plate'),
(11, 'Tea', NULL, 7, 1, 4, 'Ten_Bhagyanagar_Tea'),
(12, 'Special Tea', NULL, 10, 1, 4, 'Ten_Bhagyanagar_Special_Tea'),
(13, 'Milk', NULL, 10, 1, 4, 'Ten_Bhagyanagar_Milk'),
(14, 'Coffee', NULL, 10, 1, 4, 'Ten_Bhagyanagar_Coffee'),
(15, 'Black Tea', NULL, 5, 1, 4, 'Ten_Bhagyanagar_Black_Tea'),
(16, 'Mango Mastani', 50, 80, 2, 8, 'Delhi_Juice_Center_Mango_Mastani'),
(17, 'Anjeer Mastani', 50, 80, 2, 8, 'Delhi_Juice_Center_Anjeer_Mastani'),
(18, 'Apple Mastani', 50, 80, 2, 8, 'Delhi_Juice_Center_Apple_Mastani'),
(19, 'Mango Juice', 30, 50, 2, 7, 'Delhi_Juice_Center_Mango_Juice'),
(20, 'Anjeer Juice', 30, 50, 2, 7, 'Delhi_Juice_Center_Anjeer_Juice'),
(21, 'Apple Juice', 30, 50, 2, 7, 'Delhi_Juice_Center_Apple_Juice'),
(22, 'Strawberry Juice', 25, 40, 2, 7, 'Delhi_Juice_Center_Strawberry_Juice'),
(23, 'Black Grapes Juice', 25, 40, 2, 7, 'Delhi_Juice_Center_Black_Grapes_Juice'),
(24, 'Pineapple Juice', 20, 30, 2, 7, 'Delhi_Juice_Center_Pineapple_Juice'),
(25, 'Mix Juice', 20, 30, 2, 7, 'Delhi_Juice_Center_Mix_Juice'),
(26, 'Mosambi Juice', 20, 30, 2, 7, 'Delhi_Juice_Center_Mosambi_Juice'),
(27, 'Orange Juice', 20, 30, 2, 7, 'Delhi_Juice_Center_Orange_Juice'),
(29, 'Chiku Juice', 20, 30, 2, 7, 'Delhi_Juice_Center_Chiku_Juice'),
(30, 'Watermelon Juice', NULL, 15, 2, 7, 'Delhi_Juice_Center_Watermelon_Juice'),
(31, 'Muskmelon Juice', 15, 20, 2, 7, 'Delhi_Juice_Center_Muskmelon_Juice'),
(32, 'Papita Juice', 20, 30, 2, 7, 'Delhi_Juice_Center_Papita_Juice'),
(33, 'Cold Coffee', NULL, 30, 2, 9, 'Delhi_Juice_Center_Cold_Coffee'),
(34, 'Coffee with Vanila Ice Cream', NULL, 50, 2, 9, 'Delhi_Juice_Center_Coffee_with_Vanila_Ice_Cream'),
(35, 'Coffee with Butterscotch Ice Cream', NULL, 50, 2, 9, 'Delhi_Juice_Center_Coffee_with_Butterscotch_Ice_Cream'),
(36, 'Amrutulya Tea', NULL, 10, 3, 4, 'Coffee_All_Day_Amrutulya_Tea'),
(37, 'Hot Coffee', NULL, 10, 3, 4, 'Coffee_All_Day_Hot_Coffee'),
(38, 'Dark Shot', NULL, 40, 3, 9, 'Coffee_All_Day_Dark_Shot'),
(39, 'White Shot', NULL, 50, 3, 9, 'Coffee_All_Day_White_Shot'),
(40, 'Mix Shot', NULL, 50, 3, 9, 'Coffee_All_Day_Mix_Shot'),
(41, 'Ferrera Shot', NULL, 60, 3, 9, 'Coffee_All_Day_Ferrera_Shot'),
(42, 'Magic Shot', NULL, 60, 3, 9, 'Coffee_All_Day_Magic_Shot'),
(43, 'Brownie', NULL, 120, 3, 13, 'Coffee_All_Day_Brownie'),
(44, 'Manchurian', NULL, 30, 3, 6, 'Coffee_All_Day_Manchurian'),
(45, 'Dry Machurian', NULL, 40, 3, 6, 'Coffee_All_Day_Dry_Machurian'),
(46, 'Paneer Manchurian', NULL, 50, 3, 6, 'Coffee_All_Day_Paneer_Manchurian'),
(47, 'Paneer 65\r\n', NULL, 50, 3, 6, 'Coffee_All_Day_Paneer_65\r\n'),
(48, 'Paneer Chilly', NULL, 50, 3, 6, 'Coffee_All_Day_Paneer_Chilly'),
(49, 'Fried Rice', NULL, 40, 3, 6, 'Coffee_All_Day_Fried_Rice'),
(50, 'Paneer Rice', NULL, 50, 3, 6, 'Coffee_All_Day_Paneer_Rice'),
(51, 'Machurian Rice', NULL, 50, 3, 6, 'Coffee_All_Day_Machurian_Rice'),
(52, 'Veg Hakka Noodle', NULL, 40, 3, 6, 'Coffee_All_Day_Veg_Hakka_Noodle'),
(53, 'Schezwan Noodle', NULL, 40, 3, 6, 'Coffee_All_Day_Schezwan_Noodle'),
(54, 'Manchurian Noodle', NULL, 40, 3, 6, 'Coffee_All_Day_Manchurian_Noodle'),
(55, 'Veg Sandwich', NULL, 45, 3, 5, 'Coffee_All_Day_Veg_Sandwich'),
(56, 'Veg Cheese Sandwitch', NULL, 60, 3, 5, 'Coffee_All_Day_Veg_Cheese_Sandwitch'),
(57, 'Veg Cutlet Sandwitch', NULL, 60, 3, 5, 'Coffee_All_Day_Veg_Cutlet_Sandwitch'),
(58, 'Bombay Sandwich', NULL, 45, 3, 5, 'Coffee_All_Day_Bombay_Sandwich'),
(59, 'Red Pasta', NULL, 60, 3, 12, 'Coffee_All_Day_Red_Pasta'),
(60, 'White Pasta', NULL, 60, 3, 12, 'Coffee_All_Day_White_Pasta'),
(61, 'Allu Tikki Burger', NULL, 35, 3, 12, 'Coffee_All_Day_Allu_Tikki_Burger'),
(62, 'Veg Burger', NULL, 40, 3, 10, 'Coffee_All_Day_Veg_Burger'),
(63, 'Veg Cheese Burger', NULL, 40, 3, 10, 'Coffee_All_Day_Veg_Cheese_Burger'),
(64, 'Veg Corn Burger', NULL, 45, 3, 10, 'Coffee_All_Day_Veg_Corn_Burger'),
(65, 'Cheese Masala Pizza', NULL, 80, 3, 12, 'Coffee_All_Day_Cheese_Masala_Pizza'),
(66, 'Mix Veg Pizza', NULL, 80, 3, 12, 'Coffee_All_Day_Mix_Veg_Pizza'),
(67, 'Capsicum Pizza', NULL, 90, 3, 12, 'Coffee_All_Day_Capsicum_Pizza'),
(68, 'Paneer Pizza', NULL, 100, 3, 12, 'Coffee_All_Day_Paneer_Pizza'),
(69, 'Mexican Pizza', NULL, 110, 3, 12, 'Coffee_All_Day_Mexican_Pizza'),
(70, 'Bread Pizza', NULL, 120, 3, 12, 'Coffee_All_Day_Bread_Pizza'),
(71, 'Idli-Vada', NULL, 20, 1, 1, 'Ten_Bhagyanagar_Idli-Vada'),
(72, 'Dosa', NULL, 25, 1, 1, 'Ten_Bhagyanagar_Dosa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `canteens`
--
ALTER TABLE `canteens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `canteen_food_class`
--
ALTER TABLE `canteen_food_class`
  ADD KEY `canteen_id` (`canteen_id`,`food_class_id`),
  ADD KEY `food_class_id` (`food_class_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_class`
--
ALTER TABLE `food_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `canteens_id` (`canteens_id`),
  ADD KEY `food_class_id` (`food_class_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `canteens`
--
ALTER TABLE `canteens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `food_class`
--
ALTER TABLE `food_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `canteen_food_class`
--
ALTER TABLE `canteen_food_class`
  ADD CONSTRAINT `canteen_food_class_ibfk_1` FOREIGN KEY (`canteen_id`) REFERENCES `canteens` (`id`),
  ADD CONSTRAINT `canteen_food_class_ibfk_2` FOREIGN KEY (`food_class_id`) REFERENCES `food_class` (`id`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`canteens_id`) REFERENCES `canteens` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
