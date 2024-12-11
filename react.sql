-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2024 at 07:43 AM
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
-- Database: `react`
--

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `patient_id` varchar(255) NOT NULL,
  `prediction` varchar(255) NOT NULL,
  `confidence_score` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image_name`, `image_path`, `patient_id`, `prediction`, `confidence_score`) VALUES
(32, 'df64fdae-0a4d-4198-8347-ca2526b401b2487343046567931715.jpg', 'uploads/df64fdae-0a4d-4198-8347-ca2526b401b2487343046567931715.jpg', '123476', 'Abnormal\n', 0.96),
(33, 'a25e1fb1-8005-43fd-9085-9add8e4843d26705888871686562096.jpg', 'uploads/a25e1fb1-8005-43fd-9085-9add8e4843d26705888871686562096.jpg', '123456', 'Normal\n', 0.86);

-- --------------------------------------------------------

--
-- Table structure for table `login1`
--

CREATE TABLE `login1` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `doctorName` varchar(20) NOT NULL,
  `age` int(10) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `department` varchar(20) NOT NULL,
  `contactNumber` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login1`
--

INSERT INTO `login1` (`id`, `username`, `doctorName`, `age`, `gender`, `department`, `contactNumber`, `password`) VALUES
(6, '1234', 'Jasvanth Ram', 30, 'Male', 'Radiology', '9094774699', '1234'),
(13, '123', ' Swathi', 25, 'Female', 'Pathology ', '9087654321', '123'),
(21, '12345', 'Navya', 25, 'Female', 'Cardiology ', '123456789', '12345'),
(24, '987', 'Sushma', 34, 'Male', 'Neuro', '9638527410', '987'),
(25, '987', 'kavya', 45, 'male', 'cardi', '153949', '987');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login1`
--
ALTER TABLE `login1`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `login1`
--
ALTER TABLE `login1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
