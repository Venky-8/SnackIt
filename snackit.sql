-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2019 at 06:36 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

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
  `rating` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `canteens`
--

INSERT INTO `canteens` (`id`, `name`, `address`, `contact_no`, `image`, `rating`) VALUES
(1, 'Ten_Bhagyanagar', 'Beside Mechanical Dept. SGGS Nanded', '', '', 0),
(2, 'Delhi Juice Center', 'Opposite to SGGS Nanded', '9822242842', '', 0),
(3, 'Coffee All Day', 'Behind Auditorium SGGS Nanded', '', '', 0),
(4, 'Sai', 'Opposite to Textile lawn SGGS Nanded', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `half` int(10) UNSIGNED DEFAULT NULL,
  `full` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `item`, `half`, `full`) VALUES
(1, 'Poha', NULL, 15),
(2, 'Upma', NULL, 20),
(3, 'Mataki/Ussal', NULL, 20),
(4, 'Sabudana Khichadi', NULL, 25),
(5, 'Rice Khichadi', NULL, 25),
(6, 'Aloo Paratha', NULL, 25),
(7, 'Maggy Masala', 20, 30),
(8, 'Samosa', NULL, 10),
(9, 'Kachori', NULL, 10),
(10, 'Rice Plate', 40, 60),
(11, 'Tea', NULL, 7),
(12, 'Special Tea', NULL, 10),
(13, 'Milk', NULL, 10),
(14, 'Coffee', NULL, 10),
(15, 'Black Tea', NULL, 5),
(16, 'Mango Mastani', 50, 80),
(17, 'Anjeer Mastani', 50, 80),
(18, 'Apple Mastani', 50, 80),
(19, 'Mango Juice', 30, 50),
(20, 'Anjeer Juice', 30, 50),
(21, 'Apple Juice', 30, 50),
(22, 'Strawberry Juice', 25, 40),
(23, 'Black Grips Juice', 25, 40),
(24, 'Pineapple Juice', 20, 30),
(25, 'Mix Juice', 20, 30),
(26, 'Mosambi Juice', 20, 30),
(27, 'Orange Juice', 20, 30),
(29, 'Chiku Juice', 20, 30),
(30, 'Watermelon Juice', NULL, 15),
(31, 'Muskmelon Juice', 15, 20),
(32, 'Papita Juice', 20, 30),
(33, 'Cold Coffee', NULL, 30),
(34, 'Coffee with Vanila IceCream', NULL, 50),
(35, 'Coffee with Butterscotch Ice Cream', NULL, 50),
(36, 'Amrutulya Tea', NULL, 10),
(37, 'Hot Coffee', NULL, 10),
(38, 'Dark Shot', NULL, 40),
(39, 'White Shot', NULL, 50),
(40, 'Mix Shot', NULL, 50),
(41, 'Ferrera Shot', NULL, 60),
(42, 'Magic Shot', NULL, 60),
(43, 'Brownie', NULL, 120),
(44, 'Manchurian', NULL, 30),
(45, 'Dry Machurian', NULL, 40),
(46, 'Paneer Manchurian', NULL, 50),
(47, 'Paneer 65\r\n', NULL, 50),
(48, 'Paneer Chilly', NULL, 50),
(49, 'Fried Rice', NULL, 40),
(50, 'Paneer Rice', NULL, 50),
(51, 'Machurian Rice', NULL, 50),
(52, 'Veg Hakka Noodle', NULL, 40),
(53, 'Schezwan Noodle', NULL, 40),
(54, 'Manchurian Noodle', NULL, 40),
(55, 'Veg Sandwich', NULL, 45),
(56, 'Veg Cheese Sandwitch', NULL, 60),
(57, 'Veg Cutlet Sandwitch', NULL, 60),
(58, 'Bombay Sandwich', NULL, 45),
(59, 'Red Pasta', NULL, 60),
(60, 'White Pasta', NULL, 60),
(61, 'Allu Tikki Burger', NULL, 35),
(62, 'Veg Burger', NULL, 40),
(63, 'Veg Cheeze Burger', NULL, 40),
(64, 'Veg Corn Burger', NULL, 45),
(65, 'Cheese Masala Pizza', NULL, 80),
(66, 'Mix Veg Pizza', NULL, 80),
(67, 'Capsicum Pizza', NULL, 90),
(68, 'Paneer Pizza', NULL, 100),
(69, 'Mexican Pizza', NULL, 110),
(70, 'Bread Pizza', NULL, 120);

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
  ADD PRIMARY KEY (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
