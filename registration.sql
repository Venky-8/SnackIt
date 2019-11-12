-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 08, 2019 at 06:53 AM
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
-- Database: `registration`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'dipesh', 'dipeshssatav@gmail.com', '3d5c6f2562e4be4d7bec4b3fc0a458fc'),
(2, 'Venky', 'mangnalev.1999@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(3, 'Ashish', 'ashishbodele27@gmail.com', '9db6d47d78744115775fcb8efafe2bf2'),
(4, 'pangya', 'pangya@gmail.com', '813914c77ab839f781f37d1159ecd99d'),
(5, 'harshal', 'harshal@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(6, 'Jaffar', 'jaffar786@gmail.com', 'd3d2217d40aed1a65ac3f0df0b245827'),
(7, 'shruti', 'shruti@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
(8, 'Sam', 'sam@sam.com', '0ef3e419b0bb5196187e01d2b9ba4292'),
(9, 'Shyam', 'sa@sa.com', '7d5c1d907f12ed4442638a61da5ed697'),
(10, 'Dipesh', 'dipeshsatav@gmail.com', '3d5c6f2562e4be4d7bec4b3fc0a458fc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
