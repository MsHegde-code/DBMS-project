-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2023 at 09:22 AM
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `cat-med` (IN `getid` INT)   SELECT catId,name,id as MediD,price from inventeries WHERE catId = (SELECT id from categories as c WHERE c.id = getid )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get-med` (IN `mid` INT)   select * from inventeries WHERE mid=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uid` (IN `uid` INT)   SELECT * FROM sold as s WHERE s.userId = uid$$

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
(9, 'others', 'others.jpg', 'other items', '2023-01-22 17:43:26'),
(10, 'drops', 'drops.jpg.png', 'medical drops', '2023-02-01 15:14:16');

--
-- Triggers `categories`
--
DELIMITER $$
CREATE TRIGGER `del-med` AFTER DELETE ON `categories` FOR EACH ROW DELETE FROM inventeries WHERE catId = OLD.id
$$
DELIMITER ;

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
(11, 10, 'suresh', 'otrivin oxy', '19mg', '110', 'drops.jpg', 'used for nasal relief ', 'mankind llc', '2023-02-01 15:06:30'),
(12, 4, 'share Khan', 'monta Lu cast', '15mg', '87', 'fk.jpg', 'these are 15mg disprin for the cure of common cold', 'hyndai', '2023-01-20 06:11:50'),
(17, 6, 'don sha ', 'CalPol ', '500mg', '9', 'fk.jpg', 'these are 2mg disprin for the cure of common flu and fever', 'Calpol llt', '2023-01-21 06:12:14'),
(20, 8, 'mankind', 'ocularis', '25mg', '78', 'inhalers.jpg', 'inhalers for asthama', 'mankind llc', '2023-01-22 13:18:19'),
(21, 1, 'mankind', 'ocularies', '50mg', '90', 'cap.jpg', 'capsule for viral fever', 'mankind', '2023-01-22 13:20:05'),
(22, 7, 'aster', 'glucose', '240mg', '329', 'injection.jpg', 'to get more power', 'mankind', '2023-01-22 13:26:01'),
(23, 9, 'mankind', 'Face mask', '1', '10', '', 'face coverings', 'mankind', '2023-01-22 17:44:03'),
(25, 5, 'himalaya', 'body lotion', '1', '349', 'lotion.jpg', 'body lotion', 'himalaya llc', '2023-01-22 17:46:55'),
(56, 7, 'rnsit', 'med1', '29mg', '190', 'rnsit.jpg', 'cures all cut wounds ', 'mankind', '2023-01-23 14:57:49'),
(98, 8, 'sham medicine', 'asthalin', '230mg', '289', 'inhalers.jpg', 'for asthama ', 'medex', '2023-01-28 09:16:51'),
(102, 9, 'ram medicals', 'surgical tape', '1 piece ', '20', '', 'tape', 'mankind', '2023-02-03 07:55:44');

--
-- Triggers `inventeries`
--
DELIMITER $$
CREATE TRIGGER `deleteLog` BEFORE DELETE ON `inventeries` FOR EACH ROW INSERT into logs VALUES(null,'inventory',OLD.id,'med-deleted',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertLog` AFTER INSERT ON `inventeries` FOR EACH ROW INSERT into logs VALUES (null,'inventory',NEW.id,'med-inserted',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `slno` int(3) NOT NULL,
  `inTable` varchar(15) NOT NULL,
  `id` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `cdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`slno`, `inTable`, `id`, `action`, `cdate`) VALUES
(5, 'inventory', 11, 'med-inserted', '2023-02-01 20:36:30'),
(6, 'orders', 11, 'med-ordered', '2023-02-01 21:03:03'),
(7, 'orders', 12, 'med-ordered', '2023-02-02 16:28:55'),
(8, 'inventory', 99, 'med-inserted', '2023-02-02 16:42:43'),
(9, 'orders', 13, 'med-ordered', '2023-02-02 16:43:24'),
(10, 'inventory', 99, 'med-deleted', '2023-02-02 16:43:50'),
(11, 'orders', 14, 'med-ordered', '2023-02-02 16:48:11'),
(12, 'orders', 15, 'med-ordered', '2023-02-02 16:52:57'),
(13, 'inventory', 100, 'med-inserted', '2023-02-03 12:39:00'),
(14, 'orders', 16, 'med-ordered', '2023-02-03 12:41:02'),
(15, 'inventory', 100, 'med-deleted', '2023-02-03 12:42:35'),
(18, 'inventory', 102, 'med-inserted', '2023-02-03 13:25:44'),
(19, 'orders', 17, 'med-ordered', '2023-02-03 13:28:03'),
(20, 'inventory', 103, 'med-inserted', '2023-02-03 13:31:33'),
(21, 'inventory', 104, 'med-inserted', '2023-02-03 13:34:24'),
(26, 'inventory', 107, 'med-inserted', '2023-02-03 13:43:12'),
(28, 'orders', 18, 'med-ordered', '2023-02-03 13:43:51'),
(29, 'orders', 19, 'med-ordered', '2023-02-03 13:45:31'),
(30, 'inventory', 107, 'med-deleted', '2023-02-03 13:47:03');

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
(1, 'MedEx ', 'MedEx');

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
(9, 'msh msh', '12344', '10', '2', '200', 2, '2023-01-25 06:44:46'),
(10, 'test', '998899', '20', '2', '300', 2, '2023-02-01 15:21:46'),
(11, 'test1', '77887788', '29', '1', '549', 2, '2023-02-01 15:33:03'),
(12, 'test3', '889988', '0', '1', '300', 2, '2023-02-02 10:58:55'),
(13, 'xyz', '889988', '10', '2', '77', 2, '2023-02-02 11:13:24'),
(14, 'test4', '998899', '0', '1', '20', 2, '2023-02-02 11:18:11'),
(15, 'test5', '7766677', '30', '1', '190', 2, '2023-02-02 11:22:57'),
(16, 'admin', '889988', '90', '2', '70', 2, '2023-02-03 07:11:02'),
(17, 'test5', '7788778877', '10', '2', '210', 2, '2023-02-03 07:58:03'),
(18, 'biller', '889988', '0', '1', '16', 2, '2023-02-03 08:13:51'),
(19, 'donsha', '77887788', '0', '1', '7', 2, '2023-02-03 08:15:31');

--
-- Triggers `sold`
--
DELIMITER $$
CREATE TRIGGER `order-logs` AFTER INSERT ON `sold` FOR EACH ROW INSERT into logs VALUES (null,'orders',NEW.id,'med-ordered',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `slno` int(3) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`slno`, `name`) VALUES
(1, 'mankind'),
(2, 'suresh'),
(3, 'aster'),
(4, 'don sha'),
(5, 'shah rukh'),
(6, 'arif khan'),
(7, 'shiv'),
(8, 'rnsit'),
(9, 'ram medicals'),
(10, 'himalaya'),
(11, 'sham medicine');

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
(2, 'shawn@gg', '1234', 'shawn', 'idk.jpg', '9001800121', '2023-01-21 18:02:22');

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
  ADD PRIMARY KEY (`slno`);

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
  ADD PRIMARY KEY (`slno`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `inventeries`
--
ALTER TABLE `inventeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `slno` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sold`
--
ALTER TABLE `sold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `slno` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
