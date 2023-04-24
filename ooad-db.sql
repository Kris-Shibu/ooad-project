-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2023 at 02:57 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `complaints`
--

-- --------------------------------------------------------

--
-- Table structure for table `alertdev`
--

CREATE TABLE `alertdev` (
  `messageID` varchar(20) NOT NULL,
  `message` varchar(100) NOT NULL,
  `toDepartment` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `complaintID` int(20) NOT NULL,
  `complaintTitle` varchar(100) NOT NULL,
  `complaintType` varchar(20) NOT NULL DEFAULT 'unsolved',
  `description` varchar(100) NOT NULL,
  `responseHistory` varchar(50) NOT NULL DEFAULT 'new',
  `complaintAuthor` varchar(100) NOT NULL,
  `response` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`complaintID`, `complaintTitle`, `complaintType`, `description`, `responseHistory`, `complaintAuthor`, `response`) VALUES
(16, 'this is a test', 'solved', 'please work', 'new', 'example@gmail.com', 'pls pls work'),
(17, 'test 2 ', 'solved', 'please work pt 2', 'new', 'example@gmail.com', 'kamal was here'),
(18, 'This is a test ', 'unsolved', 'Testing ', 'new', 'ranga@example.com', ''),
(19, 'why pAncada dont miss', 'solved', 'tenz >>>>>>>', 'new', 'marved@sen.com', 'faxxxxx'),
(20, 'final test', 'solved', 'final test', 'new', 'kris.shibu@gmail.com', 'this is the response'),
(21, 'Report TEST', 'solved', 'This a the desc for report', 'new', 'test@example.com', 'this is the response of the complaint');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `customerID` int(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `Uname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Fname`, `Lname`, `customerID`, `email`, `Uname`, `password`) VALUES
('kris', 'shibu', 1, 'example@gmail.com', 'john', 'doe'),
('Ranga ', 'LN', 2, 'ranga@example.com', 'Master Oogway', '123'),
('Ice', 'Man', 3, 'marved@sen.com', 'ice_in_my_veins', 'ice'),
('Kris', 'Shibu', 4, 'kris.shibu@gmail.com', 'Admin', '123'),
('Test', 'Test', 5, 'test@exmaple.com', 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `EID` int(100) NOT NULL,
  `support_email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `support`
--

INSERT INTO `support` (`fname`, `lname`, `EID`, `support_email`, `password`) VALUES
('Kamalesh', 'S', 1, 'kamal@support.com', 'pass123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`complaintID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`EID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `complaintID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `EID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
