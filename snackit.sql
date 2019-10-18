-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 18, 2019 at 11:29 AM
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
  `rating` tinyint(4) DEFAULT 0,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `canteens`
--

INSERT INTO `canteens` (`id`, `name`, `address`, `contact_no`, `image`, `rating`, `description`) VALUES
(1, 'Ten_Bhagyanagar', 'Beside Mechanical Dept. SGGS Nanded', '', 'can.png', 0, 'Specializes in Indian Breakfast and Lunch.Open till late at Night for your cravings with unmatched variety.'),
(2, 'Delhi Juice Center', 'Opposite to SGGS Nanded', '9822242842', 'images.jpg', 0, 'Simply the Best Natural Juice Centre in your vicinity.'),
(3, 'Coffee All Day', 'Behind Auditorium SGGS Nanded', '', 'pizza.jpg', 0, 'Get a sip of your morning caffeine from an outlet who has mastered the Art Of Making Coffee.');

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
  `food_class_id` int(11) NOT NULL DEFAULT 7
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `item`, `half`, `full`, `canteens_id`, `food_class_id`) VALUES
(1, 'Poha', NULL, 15, 1, 1),
(2, 'Upma', NULL, 20, 1, 1),
(3, 'Mataki/Ussal', NULL, 20, 1, 1),
(4, 'Sabudana Khichadi', NULL, 25, 1, 1),
(5, 'Rice Khichadi', NULL, 25, 1, 2),
(6, 'Aloo Paratha', NULL, 25, 1, 2),
(7, 'Maggy Masala', 20, 30, 1, 3),
(8, 'Samosa', NULL, 10, 1, 3),
(9, 'Kachori', NULL, 10, 1, 3),
(10, 'Rice Plate', 40, 60, 1, 2),
(11, 'Tea', NULL, 7, 1, 4),
(12, 'Special Tea', NULL, 10, 1, 4),
(13, 'Milk', NULL, 10, 1, 4),
(14, 'Coffee', NULL, 10, 1, 4),
(15, 'Black Tea', NULL, 5, 1, 4),
(16, 'Mango Mastani', 50, 80, 2, 8),
(17, 'Anjeer Mastani', 50, 80, 2, 8),
(18, 'Apple Mastani', 50, 80, 2, 8),
(19, 'Mango Juice', 30, 50, 2, 7),
(20, 'Anjeer Juice', 30, 50, 2, 7),
(21, 'Apple Juice', 30, 50, 2, 7),
(22, 'Strawberry Juice', 25, 40, 2, 7),
(23, 'Black Grips Juice', 25, 40, 2, 7),
(24, 'Pineapple Juice', 20, 30, 2, 7),
(25, 'Mix Juice', 20, 30, 2, 7),
(26, 'Mosambi Juice', 20, 30, 2, 7),
(27, 'Orange Juice', 20, 30, 2, 7),
(29, 'Chiku Juice', 20, 30, 2, 7),
(30, 'Watermelon Juice', NULL, 15, 2, 7),
(31, 'Muskmelon Juice', 15, 20, 2, 7),
(32, 'Papita Juice', 20, 30, 2, 7),
(33, 'Cold Coffee', NULL, 30, 2, 9),
(34, 'Coffee with Vanila IceCream', NULL, 50, 2, 9),
(35, 'Coffee with Butterscotch Ice Cream', NULL, 50, 2, 9),
(36, 'Amrutulya Tea', NULL, 10, 3, 4),
(37, 'Hot Coffee', NULL, 10, 3, 4),
(38, 'Dark Shot', NULL, 40, 3, 9),
(39, 'White Shot', NULL, 50, 3, 9),
(40, 'Mix Shot', NULL, 50, 3, 9),
(41, 'Ferrera Shot', NULL, 60, 3, 9),
(42, 'Magic Shot', NULL, 60, 3, 9),
(43, 'Brownie', NULL, 120, 3, 13),
(44, 'Manchurian', NULL, 30, 3, 6),
(45, 'Dry Machurian', NULL, 40, 3, 6),
(46, 'Paneer Manchurian', NULL, 50, 3, 6),
(47, 'Paneer 65\r\n', NULL, 50, 3, 6),
(48, 'Paneer Chilly', NULL, 50, 3, 6),
(49, 'Fried Rice', NULL, 40, 3, 6),
(50, 'Paneer Rice', NULL, 50, 3, 6),
(51, 'Machurian Rice', NULL, 50, 3, 6),
(52, 'Veg Hakka Noodle', NULL, 40, 3, 6),
(53, 'Schezwan Noodle', NULL, 40, 3, 6),
(54, 'Manchurian Noodle', NULL, 40, 3, 6),
(55, 'Veg Sandwich', NULL, 45, 3, 5),
(56, 'Veg Cheese Sandwitch', NULL, 60, 3, 5),
(57, 'Veg Cutlet Sandwitch', NULL, 60, 3, 5),
(58, 'Bombay Sandwich', NULL, 45, 3, 5),
(59, 'Red Pasta', NULL, 60, 3, 12),
(60, 'White Pasta', NULL, 60, 3, 12),
(61, 'Allu Tikki Burger', NULL, 35, 3, 12),
(62, 'Veg Burger', NULL, 40, 3, 10),
(63, 'Veg Cheese Burger', NULL, 40, 3, 10),
(64, 'Veg Corn Burger', NULL, 45, 3, 10),
(65, 'Cheese Masala Pizza', NULL, 80, 3, 12),
(66, 'Mix Veg Pizza', NULL, 80, 3, 12),
(67, 'Capsicum Pizza', NULL, 90, 3, 12),
(68, 'Paneer Pizza', NULL, 100, 3, 12),
(69, 'Mexican Pizza', NULL, 110, 3, 12),
(70, 'Bread Pizza', NULL, 120, 3, 12);

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
-- AUTO_INCREMENT for table `food_class`
--
ALTER TABLE `food_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

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
