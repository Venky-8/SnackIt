-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 16, 2019 at 07:27 AM
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
  `rating` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `canteens`
--

INSERT INTO `canteens` (`id`, `name`, `address`, `contact_no`, `image`, `rating`) VALUES
(1, 'Ten_Bhagyanagar', 'Beside Mechanical Dept. SGGS Nanded', '', '', 0),
(2, 'Delhi Juice Center', 'Opposite to SGGS Nanded', '9822242842', '', 0),
(3, 'Coffee All Day', 'Behind Auditorium SGGS Nanded', '', 'pizza.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `half` int(10) UNSIGNED DEFAULT NULL,
  `full` int(10) UNSIGNED NOT NULL,
  `canteens_id` int(11) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `item`, `half`, `full`, `canteens_id`) VALUES
(1, 'Poha', NULL, 15, 1),
(2, 'Upma', NULL, 20, 1),
(3, 'Mataki/Ussal', NULL, 20, 1),
(4, 'Sabudana Khichadi', NULL, 25, 1),
(5, 'Rice Khichadi', NULL, 25, 1),
(6, 'Aloo Paratha', NULL, 25, 1),
(7, 'Maggy Masala', 20, 30, 1),
(8, 'Samosa', NULL, 10, 1),
(9, 'Kachori', NULL, 10, 1),
(10, 'Rice Plate', 40, 60, 1),
(11, 'Tea', NULL, 7, 1),
(12, 'Special Tea', NULL, 10, 1),
(13, 'Milk', NULL, 10, 1),
(14, 'Coffee', NULL, 10, 1),
(15, 'Black Tea', NULL, 5, 1),
(16, 'Mango Mastani', 50, 80, 2),
(17, 'Anjeer Mastani', 50, 80, 2),
(18, 'Apple Mastani', 50, 80, 2),
(19, 'Mango Juice', 30, 50, 2),
(20, 'Anjeer Juice', 30, 50, 2),
(21, 'Apple Juice', 30, 50, 2),
(22, 'Strawberry Juice', 25, 40, 2),
(23, 'Black Grips Juice', 25, 40, 2),
(24, 'Pineapple Juice', 20, 30, 2),
(25, 'Mix Juice', 20, 30, 2),
(26, 'Mosambi Juice', 20, 30, 2),
(27, 'Orange Juice', 20, 30, 2),
(29, 'Chiku Juice', 20, 30, 2),
(30, 'Watermelon Juice', NULL, 15, 2),
(31, 'Muskmelon Juice', 15, 20, 2),
(32, 'Papita Juice', 20, 30, 2),
(33, 'Cold Coffee', NULL, 30, 2),
(34, 'Coffee with Vanila IceCream', NULL, 50, 2),
(35, 'Coffee with Butterscotch Ice Cream', NULL, 50, 2),
(36, 'Amrutulya Tea', NULL, 10, 3),
(37, 'Hot Coffee', NULL, 10, 3),
(38, 'Dark Shot', NULL, 40, 3),
(39, 'White Shot', NULL, 50, 3),
(40, 'Mix Shot', NULL, 50, 3),
(41, 'Ferrera Shot', NULL, 60, 3),
(42, 'Magic Shot', NULL, 60, 3),
(43, 'Brownie', NULL, 120, 3),
(44, 'Manchurian', NULL, 30, 3),
(45, 'Dry Machurian', NULL, 40, 3),
(46, 'Paneer Manchurian', NULL, 50, 3),
(47, 'Paneer 65\r\n', NULL, 50, 3),
(48, 'Paneer Chilly', NULL, 50, 3),
(49, 'Fried Rice', NULL, 40, 3),
(50, 'Paneer Rice', NULL, 50, 3),
(51, 'Machurian Rice', NULL, 50, 3),
(52, 'Veg Hakka Noodle', NULL, 40, 3),
(53, 'Schezwan Noodle', NULL, 40, 3),
(54, 'Manchurian Noodle', NULL, 40, 3),
(55, 'Veg Sandwich', NULL, 45, 3),
(56, 'Veg Cheese Sandwitch', NULL, 60, 3),
(57, 'Veg Cutlet Sandwitch', NULL, 60, 3),
(58, 'Bombay Sandwich', NULL, 45, 3),
(59, 'Red Pasta', NULL, 60, 3),
(60, 'White Pasta', NULL, 60, 3),
(61, 'Allu Tikki Burger', NULL, 35, 3),
(62, 'Veg Burger', NULL, 40, 3),
(63, 'Veg Cheeze Burger', NULL, 40, 3),
(64, 'Veg Corn Burger', NULL, 45, 3),
(65, 'Cheese Masala Pizza', NULL, 80, 3),
(66, 'Mix Veg Pizza', NULL, 80, 3),
(67, 'Capsicum Pizza', NULL, 90, 3),
(68, 'Paneer Pizza', NULL, 100, 3),
(69, 'Mexican Pizza', NULL, 110, 3),
(70, 'Bread Pizza', NULL, 120, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `canteens`
--
ALTER TABLE `canteens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `canteens_id` (`canteens_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `canteens`
--
ALTER TABLE `canteens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`canteens_id`) REFERENCES `canteens` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
