-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2021 at 01:58 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wom_finance`
--

-- --------------------------------------------------------

--
-- Table structure for table `m_dukcapil_data`
--

CREATE TABLE `m_dukcapil_data` (
  `m_dukcapil_data_id` int(11) NOT NULL,
  `NIK` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `maiden_name` varchar(10) NOT NULL,
  `birth_date` date NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `religion_id` int(11) DEFAULT NULL,
  `marital_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_dukcapil_data`
--

INSERT INTO `m_dukcapil_data` (`m_dukcapil_data_id`, `NIK`, `name`, `maiden_name`, `birth_date`, `gender`, `religion_id`, `marital_status`) VALUES
(1, '1371111011970008', 'Reyhan Alkadri ', 'Reyhan', '1997-11-10', 'M', 1, 1),
(2, '137111101197250', 'Robert Agustin', 'Robert', '1998-06-20', 'M', 2, 1),
(3, '137111101197010', 'Muhammad Salam', 'Salam', '1998-06-20', 'M', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_marital_status`
--

CREATE TABLE `m_marital_status` (
  `m_marital_status_id` int(11) NOT NULL,
  `marital_status_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_marital_status`
--

INSERT INTO `m_marital_status` (`m_marital_status_id`, `marital_status_desc`) VALUES
(1, 'Single'),
(2, 'Widow'),
(3, 'Widower'),
(4, 'Married');

-- --------------------------------------------------------

--
-- Table structure for table `m_religion`
--

CREATE TABLE `m_religion` (
  `religion_id` int(11) NOT NULL,
  `religion_name` varchar(50) NOT NULL,
  `usr_crt` timestamp NOT NULL DEFAULT current_timestamp(),
  `dtm_crt` datetime DEFAULT current_timestamp(),
  `usr_upd` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dtm_upd` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_religion`
--

INSERT INTO `m_religion` (`religion_id`, `religion_name`, `usr_crt`, `dtm_crt`, `usr_upd`, `dtm_upd`) VALUES
(1, 'Islam', '2021-09-23 06:31:34', '2021-09-23 13:31:34', '2021-09-23 06:31:34', '2021-09-23 13:31:34'),
(2, 'Kristen Katolik', '2021-09-23 06:31:34', '2021-09-23 13:31:34', '2021-09-23 06:31:34', '2021-09-23 13:31:34'),
(3, 'Kristen Protestan', '2021-09-23 06:31:34', '2021-09-23 13:31:34', '2021-09-23 06:31:34', '2021-09-23 13:31:34'),
(4, 'Hindu', '2021-09-23 06:31:34', '2021-09-23 13:31:34', '2021-09-23 06:31:34', '2021-09-23 13:31:34'),
(5, 'Budha', '2021-09-23 06:31:34', '2021-09-23 13:31:34', '2021-09-23 06:31:34', '2021-09-23 13:31:34'),
(6, 'Konghucu', '2021-09-23 06:31:34', '2021-09-23 13:31:34', '2021-09-23 06:31:34', '2021-09-23 13:31:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_dukcapil_data`
--
ALTER TABLE `m_dukcapil_data`
  ADD PRIMARY KEY (`m_dukcapil_data_id`),
  ADD KEY `religion_id` (`religion_id`),
  ADD KEY `marital_status` (`marital_status`);

--
-- Indexes for table `m_marital_status`
--
ALTER TABLE `m_marital_status`
  ADD PRIMARY KEY (`m_marital_status_id`);

--
-- Indexes for table `m_religion`
--
ALTER TABLE `m_religion`
  ADD PRIMARY KEY (`religion_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_dukcapil_data`
--
ALTER TABLE `m_dukcapil_data`
  MODIFY `m_dukcapil_data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `m_marital_status`
--
ALTER TABLE `m_marital_status`
  MODIFY `m_marital_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_religion`
--
ALTER TABLE `m_religion`
  MODIFY `religion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `m_dukcapil_data`
--
ALTER TABLE `m_dukcapil_data`
  ADD CONSTRAINT `m_dukcapil_data_ibfk_1` FOREIGN KEY (`religion_id`) REFERENCES `m_religion` (`religion_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `m_dukcapil_data_ibfk_2` FOREIGN KEY (`marital_status`) REFERENCES `m_marital_status` (`m_marital_status_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
