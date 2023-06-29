-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2023 at 02:29 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mental_health_assistant_chatbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `evaluation`
--

CREATE TABLE `evaluation` (
  `userID` int(10) NOT NULL,
  `evaluationID` int(10) NOT NULL,
  `date` varchar(255) NOT NULL,
  `depression_score` int(100) NOT NULL,
  `anxiety_score` int(100) NOT NULL,
  `stress_score` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `evaluation`
--

INSERT INTO `evaluation` (`userID`, `evaluationID`, `date`, `depression_score`, `anxiety_score`, `stress_score`) VALUES
(6, 2, '2023-04-09 \n 14:21:15', 14, 16, 12),
(6, 3, '2023-04-09 \n 14:22:26', 18, 14, 13),
(6, 8, '2023-04-11 \n 12:43:19', 16, 14, 16),
(6, 9, '2023-04-13 \n 11:22:55', 13, 10, 14),
(6, 11, '2023-04-13 \n 12:36:00', 13, 13, 12),
(6, 12, '2023-04-13 \n 21:11:10', 10, 9, 13),
(6, 13, '2023-04-13 \n 21:23:30', 9, 17, 12),
(6, 14, '2023-04-13 \n 21:33:15', 11, 15, 13),
(6, 15, '2023-04-13 \n 21:49:37', 16, 13, 14),
(6, 16, '2023-04-14 \n 10:08:24', 15, 9, 12),
(6, 17, '2023-04-25 \n 22:41:20', 13, 12, 8),
(6, 18, '2023-05-01 \n 12:22:50', 16, 13, 14),
(6, 19, '2023-05-09 \n 14:46:50', 14, 14, 16),
(6, 20, '2023-05-27 \n 20:27:56', 12, 16, 11),
(6, 21, '2023-05-27 \n 20:39:45', 14, 16, 17),
(6, 22, '2023-06-09 \n 12:07:06', 12, 12, 14),
(19, 23, '2023-06-22 \n 11:46:36', 12, 12, 13),
(19, 24, '2023-06-22 \n 11:51:09', 7, 10, 14);

-- --------------------------------------------------------

--
-- Table structure for table `moodtracker`
--

CREATE TABLE `moodtracker` (
  `userID` int(10) NOT NULL,
  `moodTrackerID` int(10) NOT NULL,
  `date` varchar(255) NOT NULL,
  `mood` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `moodtracker`
--

INSERT INTO `moodtracker` (`userID`, `moodTrackerID`, `date`, `mood`, `comment`) VALUES
(6, 31, '2023-03-20 \n 22:03:35', 'Okay', 'Hello'),
(6, 32, '2023-03-20 \n 22:07:14', 'Okay', 'Good'),
(6, 33, '2023-03-20 \n 22:08:20', 'Okay', 'Hello'),
(6, 34, '2023-03-20 \n 22:20:41', 'Okay', 'Good job'),
(16, 36, '2023-03-29 \n 21:37:51', 'Okay', 'Good day! '),
(17, 37, '2023-03-29 \n 21:41:27', 'Okay', 'Good day! '),
(6, 38, '2023-04-11 \n 12:42:14', 'Good', 'Yeahh'),
(6, 39, '2023-04-14 \n 10:10:07', 'Good', 'Hello dear! '),
(6, 40, '2023-04-25 \n 22:36:12', 'Okay', 'I have done! '),
(6, 41, '2023-06-09 \n 12:15:54', 'Okay', 'I finished my homework today. ');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `dateOfBirth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `email`, `password`, `gender`, `dateOfBirth`) VALUES
(6, 'Violin000000@gmail.com', '99l2l7L35396@', 'Female', '2023-03-23'),
(10, 'violavoon000000@gmail.com', 'l999l2l7L35396@', 'Female', '2023-03-26'),
(11, 'hermiliaviola991217@gmail.com', '99l2l7L35396@', 'Female', '2023-03-24'),
(12, 'voonliwei000000@gmail.com', 'l999l2l7L35396@', 'Prefer Not to Say', '2023-03-18'),
(16, 'liwei.telebort@gmail.com', 'l999l2l7L35396@', 'Female', '2023-03-30'),
(17, 'Violavoon991217@gmail.com', '99l2l7L35396@', 'Female', '2023-03-30'),
(18, 'voon000000@gmail.com', '99l2l7L35396@', 'Female', '2023-05-25'),
(19, 'monster1217@gmail.com', 'mOnSt#rl(23)', 'Female', '2023-06-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`evaluationID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `moodtracker`
--
ALTER TABLE `moodtracker`
  ADD PRIMARY KEY (`moodTrackerID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `evaluation`
--
ALTER TABLE `evaluation`
  MODIFY `evaluationID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `moodtracker`
--
ALTER TABLE `moodtracker`
  MODIFY `moodTrackerID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `moodtracker`
--
ALTER TABLE `moodtracker`
  ADD CONSTRAINT `moodtracker_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
