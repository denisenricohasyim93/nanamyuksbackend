-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 03, 2018 at 01:37 AM
-- Server version: 5.7.20
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nanamyuks`
--

-- --------------------------------------------------------

--
-- Table structure for table `pots`
--

CREATE TABLE `pots` (
  `pot_id` int(11) NOT NULL,
  `soil_sensor_value` varchar(100) NOT NULL,
  `temperature` varchar(100) NOT NULL,
  `light_intensity` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pots`
--

INSERT INTO `pots` (`pot_id`, `soil_sensor_value`, `temperature`, `light_intensity`, `user_id`) VALUES
(1, '1', '25', '25', 1),
(2, '2', '25', '25', 1),
(3, '10', '10', '10', 1),
(4, '10', '10', '10', 2),
(5, '13', '13', '13', 2),
(6, '15', '15', '15', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `userpot`
-- (See below for the actual view)
--
CREATE TABLE `userpot` (
`user_id` int(11)
,`name` varchar(100)
,`age` int(3)
,`email` varchar(100)
,`pot_id` int(11)
,`soil_sensor_value` varchar(100)
,`temperature` varchar(100)
,`light_intensity` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(3) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `age`, `email`) VALUES
(1, 'denis', 25, 'denisenricohasyim93@gmail.com'),
(2, 'ramdan', 25, 'ramdan.kurniawan24@gmail.com');

-- --------------------------------------------------------

--
-- Structure for view `userpot`
--
DROP TABLE IF EXISTS `userpot`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userpot`  AS  select `users`.`user_id` AS `user_id`,`users`.`name` AS `name`,`users`.`age` AS `age`,`users`.`email` AS `email`,`pots`.`pot_id` AS `pot_id`,`pots`.`soil_sensor_value` AS `soil_sensor_value`,`pots`.`temperature` AS `temperature`,`pots`.`light_intensity` AS `light_intensity` from (`users` join `pots`) where (`users`.`user_id` = `pots`.`user_id`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pots`
--
ALTER TABLE `pots`
  ADD PRIMARY KEY (`pot_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pots`
--
ALTER TABLE `pots`
  MODIFY `pot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pots`
--
ALTER TABLE `pots`
  ADD CONSTRAINT `pots_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
