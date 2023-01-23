-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2023 at 03:41 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get-med` (IN `mid` INT)   select * from inventeries WHERE mid=id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(222) NOT NULL,
  `pic` varchar(111) NOT NULL,
  `details` varchar(333) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `pic`, `details`, `date`) VALUES
(1, 'Capsule', 'cap.png', 'medicine capsule for viral fever', '2023-01-18 04:58:57'),
(2, 'Tablets', 'tablet.png', 'tablets for common cold and coughs', '2023-01-18 04:58:57'),
(3, 'Syrup', 'syrup.png', 'syrup for throat infection and coughs', '2023-01-19 04:59:24'),
(4, 'Cream', 'cream.png', 'cream for skin allergies ', '2023-01-20 04:59:24'),
(5, 'Lotion', 'lotion.png', 'these are capsules whisd some k dsfksd', '2023-01-20 04:59:59'),
(7, 'Injection', 'injection.jpg', 'these are capsules whisd some k dsfksd', '2023-01-20 05:00:19'),
(8, 'inhalers', 'inhalers.jpg', 'inhalers for asthama', '2022-11-19 05:00:19'),
(9, 'others', 'others.jpg', 'other items', '2023-01-22 17:43:26');

-- --------------------------------------------------------

--
-- Table structure for table `inventeries`
--

CREATE TABLE `inventeries` (
  `id` int(11) NOT NULL,
  `catId` int(11) NOT NULL,
  `supplier` varchar(222) NOT NULL,
  `name` text NOT NULL,
  `unit` text NOT NULL,
  `price` text NOT NULL,
  `pic` text NOT NULL,
  `description` text NOT NULL,
  `company` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inventeries`
--

INSERT INTO `inventeries` (`id`, `catId`, `supplier`, `name`, `unit`, `price`, `pic`, `description`, `company`, `date`) VALUES
(7, 2, 'Arif Khan', 'Disprin', '6mg', '7', 'fk.jpg', 'these are 2mg disprin for the cure of some thing extera', 'mankind', '2023-01-19 06:10:43'),
(8, 8, 'shiv', 'moxifloxacin', '80mg', '100', 'inhalers.jpg', 'inhalers for asthama', 'mahaflox', '2023-01-22 13:15:55'),
(10, 3, 'Arif Khan', 'ebhast', '61mg', '68', 'fk.jpg', 'these are 2mg  for the cure of some itches', 'aster', '2023-01-19 06:11:36'),
(12, 4, 'share Khan', 'monta Lu cast', '15mg', '87', 'fk.jpg', 'these are 15mg disprin for the cure of common cold', 'hyndai', '2023-01-20 06:11:50'),
(17, 6, 'don sha ', 'CalPol ', '500mg', '9', 'fk.jpg', 'these are 2mg disprin for the cure of common flu and fever', 'Calpol llt', '2023-01-21 06:12:14'),
(20, 8, 'mankind', 'ocularis', '25mg', '78', 'inhalers.jpg', 'inhalers for asthama', 'mankind llc', '2023-01-22 13:18:19'),
(21, 1, 'mankind', 'ocularies', '50mg', '90', 'cap.jpg', 'capsule for viral fever', 'mankind', '2023-01-22 13:20:05'),
(22, 7, 'aster', 'glucose', '240mg', '329', 'injection.jpg', 'to get more power', 'mankind', '2023-01-22 13:26:01'),
(23, 9, 'mankind', 'Face mask', '1', '10', '', 'face coverings', 'mankind', '2023-01-22 17:44:03'),
(25, 5, 'himalaya', 'body lotion', '1', '349', 'lotion.jpg', 'body lotion', 'himalaya llc', '2023-01-22 17:46:55');

--
-- Triggers `inventeries`
--
DELIMITER $$
CREATE TRIGGER `deleteLog` BEFORE DELETE ON `inventeries` FOR EACH ROW INSERT into logs VALUES(null,OLD.id,'deleted',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertLog` AFTER INSERT ON `inventeries` FOR EACH ROW INSERT into logs VALUES (null,NEW.id,'inserted',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `cdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `mid`, `action`, `cdate`) VALUES
(1, 55, 'inserted', '2023-01-23 11:54:55'),
(2, 55, 'deleted', '2023-01-23 11:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `title` varchar(222) NOT NULL,
  `name` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`id`, `title`, `name`) VALUES
(1, 'The Med Chain', 'The Med Chain');

-- --------------------------------------------------------

--
-- Table structure for table `sold`
--

CREATE TABLE `sold` (
  `id` int(11) NOT NULL,
  `name` varchar(222) NOT NULL,
  `contact` varchar(222) NOT NULL,
  `discount` varchar(222) NOT NULL,
  `item` varchar(222) NOT NULL,
  `amount` varchar(222) NOT NULL,
  `userId` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sold`
--

INSERT INTO `sold` (`id`, `name`, `contact`, `discount`, `item`, `amount`, `userId`, `date`) VALUES
(2, 'khan Shoaib', '445584686', '10', '2', '3', 1, '2023-01-19 15:44:15'),
(3, 'sdfgsd', '98787655', '10', '3', '25', 1, '2023-01-19 16:47:22'),
(4, 'Younis', '451212345', '21', '4', '35', 1, '2023-01-20 08:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `pic` text NOT NULL,
  `number` text NOT NULL,
  `address` text NOT NULL,
  `cnic` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `pic`, `number`, `address`, `cnic`, `date`) VALUES
(1, 'faisal khan', 'fk.jpg', '32342342', 'no.123 4th main jayanagar', '2342342342423423', '2023-01-19 07:23:49'),
(2, 'faisal khan', 'fk.jpg', '2432342342', 'no.123 4th main jp nagar', '2342342342423423', '2023-01-20 07:23:53'),
(3, 'faisal khan', 'fk.jpg', '2432342342', 'no.123 4th main rr nagar', '2342342342423423', '2023-01-19 07:23:56'),
(4, 'faisal khan', 'fk.jpg', '2432342342', 'no.123 4th main jayanagar', '2342342342423423', '2023-01-20 07:23:59'),
(5, 'faisal khan', 'fk.jpg', '2432342342', 'no.123 4th main rr nagar', '2342342342423423', '2023-01-21 07:24:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `name` varchar(222) NOT NULL,
  `pic` varchar(222) NOT NULL,
  `number` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `pic`, `number`, `date`) VALUES
(2, 'shawn@gg', '1234', 'shawn', 'idk.jpg', '12345', '2023-01-21 18:02:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventeries`
--
ALTER TABLE `inventeries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sold`
--
ALTER TABLE `sold`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `inventeries`
--
ALTER TABLE `inventeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sold`
--
ALTER TABLE `sold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
