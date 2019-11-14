-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2019 at 07:00 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `bookLounge` (IN `aid` INT, IN `no_of_seats` INT(2))  NO SQL
SELECT (no_of_seats*MIN(D_charges)) as Charges,"Confirmed" as Status,(s_avail-no_of_seats) as remaining_seat,loca
from waiting
where (a_id=aid and s_avail >0)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAirport` (IN `aid` INT)  NO SQL
SELECT a_id,a_name FROM airport where a_id=aid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getlounge` (IN `aid` INT)  NO SQL
select * FROM waiting where a_id =aid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getShops` (IN `aid` INT)  NO SQL
SELECT s_id,s_name FROM shops WHERE a_id=aid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updation_of_seats` (IN `aid` INT, IN `seats_booked` INT(2))  NO SQL
update waiting 
set s_avail = s_avail - seats_booked
where (a_id = aid  and s_avail>0 )$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `a_id` varchar(20) NOT NULL,
  `a_name` varchar(40) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `no_shops` varchar(30) DEFAULT NULL,
  `a_dim` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`a_id`, `a_name`, `city`, `no_shops`, `a_dim`) VALUES
('121', 'Rajeev Gandhi International airport', 'hyderabad', '110', '1900*5000'),
('122', 'Mathura Domestic Airport', 'Mathura', '23', '900*900'),
('123', 'Chandigarh national Airport', 'Chandigarh', '34', '1900*5000'),
('1234', 'Amausi International Airport', 'Lucknow', '100', '900*1800'),
('124', 'Shanmukha Domestic Airport', 'Nagpur', '21', '900*900'),
('125', 'Cyberabad Airport', 'Cyberabad', '23', '900*900'),
('126', 'Varanasi National Airport', 'Varanasi', '23', '900*900'),
('127', 'Mysuru Airport', 'Mysuru', '14', '900*1800'),
('128', 'Chennai International Airport', 'Chennai', '140', '900*5800'),
('129', 'Cochin International Airport', 'kochi', '14', '900*1800'),
('130', 'Vijaywada International Airport', 'Gannavaram', '14', '900*1800'),
('131', 'Goa International Airport', 'GOA', '140', '900*1800'),
('132', 'Lal bahadur Shastri International Airpor', 'babatpur', '140', '900*1800'),
('133', 'Diu National Airport', 'Diu', '12', '900*1800'),
('167', 'Chatrapati shivaji International Airport', 'Mumbai', '110', '5600*9832'),
('404', 'Kempagowda international airport', 'Bengaluru', '155', '1900*5000'),
('5678', 'Netaji subash chandra bose international', 'kolkata', '80', '4000*4000'),
('987', 'IGI International Airport', 'Delhi', '200', '4000*4000'),
('998', 'Jaipur International Airport', 'Jaipur', '56', '900*1800');

--
-- Triggers `airport`
--
DELIMITER $$
CREATE TRIGGER `dele_trigger` BEFORE DELETE ON `airport` FOR EACH ROW Insert into logs VALUES(null,OLD.a_id,OLD.a_name,"Deleted",NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ins_trigger` AFTER INSERT ON `airport` FOR EACH ROW Insert into logs values(null,New.a_id,New.a_name,"INSERTED",NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_trig` AFTER UPDATE ON `airport` FOR EACH ROW Insert into logs VALUES(null, NEW.a_id, NEW.a_name , "Updated", NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `phone_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`c_id`, `c_name`, `username`, `pass`, `phone_no`) VALUES
(1, 'subhransh', 'subh', '1234', 76894365),
(2, 'yugank', 'yug', '1234', 536337),
(3, 'shashank', 'shashank631', '1234', 213331),
(4, 'akshay', 'akkki', '1234', 213331),
(5, 'vishal kumar', 'vish', '1234', 2133313),
(6, 'rajdheer', 'raj', '1234', 2133313),
(7, 'shyam manohar', 'sawq', 'q2345', 2133313),
(8, 'shyam kishor', 'sawq1', '1234', 2133313),
(9, 'rajat m', 'sawq2', '12345', 2133313),
(10, 'prajwal', 'sawq23', '12345', 2133313),
(11, 'vinayak', 'vinay123', '1234', 213331);

-- --------------------------------------------------------

--
-- Table structure for table `customer_backup`
--

CREATE TABLE `customer_backup` (
  `a_id` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `e_name` varchar(20) NOT NULL,
  `salary` int(11) NOT NULL,
  `e_age` int(2) NOT NULL,
  `e_address` varchar(20) NOT NULL,
  `designation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_backup`
--

INSERT INTO `customer_backup` (`a_id`, `username`, `pass`, `e_name`, `salary`, `e_age`, `e_address`, `designation`) VALUES
('123', 'raam12', '1234', 'ramprasad', 14000, 21, 'gomti nagar, lucknow', 'cleaner'),
('123', 'shank', '1234', 'Shasank Tomar', 10000, 60, 'Patna , Bihar', 'security dept'),
('1234', 'shub', '1234', 'ramprasad', 14000, 21, 'gomti nagar, lucknow', 'cleaner'),
('128', 'sow', 'Qwerty', 'sow', 40000, 30, 'JP nagar , Bangalore', 'manager'),
('124', 'sowmiya', '1234', 'sow', 40000, 30, 'JP nagar , Bangalore', 'manager'),
('121', 'subh', '1234', 'Shubhransh Gupta', 40000, 19, 'JP nagar , Bangalore', 'manager'),
('133', 'vabs', '1234', 'vaibhav pratap', 14000, 19, 'Patna , Bihar', 'cleaner'),
('404', 'vasd', '1234', 'vishnu', 40000, 19, 'delhi', 'manager');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `a_id` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `e_name` varchar(20) NOT NULL,
  `e_age` int(2) NOT NULL,
  `e_address` varchar(20) NOT NULL,
  `designation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`a_id`, `username`, `pass`, `e_name`, `e_age`, `e_address`, `designation`) VALUES
('1234', 'akshay', 'Qwerty', 'Akshay Anand', 34, 'Patna , Bihar', ''),
('1234', 'dar23', '1234', 'Darshan raval', 20, 'gomti nagar, lucknow', ''),
('1234', 'gaurav', '1234', 'baburao', 67, 'lucknow', ''),
('404', 'kabir23', '9090', 'kabir singh', 20, 'delhi', ''),
('404', 'nanda101', '1234', 'nandakishor', 21, 'lucknow', ''),
('1234', 'raam1', '1234', 'ramprasad', 21, 'gomti nagar, lucknow', 'cleaner'),
('123', 'raam12', '1234', 'ramprasad', 21, 'gomti nagar, lucknow', 'cleaner'),
('404', 'radha', '1234', 'radha rajkishor', 20, 'JP nagar , Bangalore', ''),
('5678', 'root', '1234', 'admin', 0, 'JP nagar , Bangalore', ''),
('1234', 'shashank631', '9876', 'Shashank', 30, 'kumarswamy layout , ', ''),
('128', 'sow', 'Qwerty', 'sow', 30, 'JP nagar , Bangalore', 'manager'),
('124', 'sowmiya', '1234', 'sow', 30, 'JP nagar , Bangalore', 'manager'),
('1234', 'subh', '1234', 'Shubhransh', 20, 'JP nagar , Bangalore', ''),
('404', 'vasd', '1234', 'vishnu', 19, 'delhi', 'manager'),
('404', 'vish', '1234', 'vishal kumar', 20, 'kumarswamy layout , ', '');

--
-- Triggers `details`
--
DELIMITER $$
CREATE TRIGGER `inserting_backup` AFTER INSERT ON `details` FOR EACH ROW insert into customer_backup values(NEW.a_id,NEW.username,NEW.pass,NEW.e_name,'',NEW.e_age,NEW.e_address,NEW.designation)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatesal1` BEFORE INSERT ON `details` FOR EACH ROW update customer_backup
SET salary=10000
where designation='salesman'
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatesal2` AFTER INSERT ON `details` FOR EACH ROW update customer_backup
SET salary=14000
where designation='cleaner'
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatesal3` AFTER INSERT ON `details` FOR EACH ROW update customer_backup
SET salary=45000
where designation='security dept'
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatesalary` AFTER INSERT ON `details` FOR EACH ROW update customer_backup
SET salary=40000
where designation='manager'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `a_id` varchar(20) NOT NULL,
  `a_name` varchar(40) NOT NULL,
  `action` varchar(20) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `a_id`, `a_name`, `action`, `created_date`) VALUES
(1, '167', 'Chatrapati shivaji International Airport', 'INSERTED', '2019-10-19 11:21:43'),
(2, '167', 'Chatrapati shivaji International Airport', 'Updated', '2019-10-19 11:32:44'),
(3, '998', 'Jaipur International Airport', 'INSERTED', '2019-10-19 11:51:18'),
(4, '5678', 'Netaji subash chandra bose international', 'INSERTED', '2019-11-05 21:33:40'),
(5, '404', 'Kempagowda international airport', 'Updated', '2019-11-05 21:39:40'),
(6, '121', 'Rajeev Gandhi International airport', 'INSERTED', '2019-11-09 11:31:41'),
(7, '122', 'Mathura Domestic Airport', 'INSERTED', '2019-11-09 11:32:21'),
(8, '123', 'Chandigarh national Airport', 'INSERTED', '2019-11-09 11:33:08'),
(9, '124', 'Shanmukha Domestic Airport', 'INSERTED', '2019-11-09 11:34:48'),
(10, '125', 'Cyberabad Airport', 'INSERTED', '2019-11-09 11:35:16'),
(11, '126', 'Varanasi National Airport', 'INSERTED', '2019-11-09 11:36:42'),
(12, '127', 'Mysuru Airport', 'INSERTED', '2019-11-09 11:38:34'),
(13, '128', 'Chennai International Airport', 'INSERTED', '2019-11-09 11:39:21'),
(14, '129', 'Cochin International Airport', 'INSERTED', '2019-11-09 11:39:54'),
(15, '130', 'Vijaywada International Airport', 'INSERTED', '2019-11-09 11:40:29'),
(16, '131', 'Goa International Airport', 'INSERTED', '2019-11-09 11:40:56'),
(17, '132', 'Lal bahadur Shastri International Airpor', 'INSERTED', '2019-11-09 11:41:38'),
(18, '133', 'Diu National Airport', 'INSERTED', '2019-11-10 21:59:36');

-- --------------------------------------------------------

--
-- Table structure for table `moneytransfer`
--

CREATE TABLE `moneytransfer` (
  `a_id` varchar(20) DEFAULT NULL,
  `currency` varchar(30) DEFAULT NULL,
  `loca` varchar(30) DEFAULT NULL,
  `s_id` int(11) NOT NULL,
  `byc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `moneytransfer`
--

INSERT INTO `moneytransfer` (`a_id`, `currency`, `loca`, `s_id`, `byc`) VALUES
('404', 'Dollars,Dinars,Yemen,Rian,Poun', 'near gate 4', 1001, 'Western union'),
('404', 'Dollars,Dinars,Yemen,Rian,Poun', 'near gate 5', 1002, 'Western union'),
('404', 'Dollars,Dinars,Yemen,Rian,Poun', 'near gate 7', 1003, 'Forex'),
('5678', 'Dollars,Dinars,Yemen,Rian,Poun', 'near gate 7', 1004, 'Forex'),
('5678', 'Dollars,Dinars,Yemen,Rian,Poun', 'near gate 2', 1005, 'Forex'),
('1234', 'Dollars,Dinars', 'near gate 9', 1233, 'Forex'),
('1234', 'Dollars,Dinars', 'near gate 4', 1240, 'Western union'),
('987', 'Dollars,Dinars', 'near gate 1', 9000, 'others'),
('123', 'Dollars,Dinars', 'near gate 4', 9001, 'Western union'),
('124', 'Dollars,Dinars', 'near gate 5', 9002, 'Forex'),
('125', 'Dollars,Dinars', 'near gate 5', 9003, 'Forex'),
('126', 'Dollars,Dinars', 'near gate 5', 9004, 'Forex'),
('127', 'Dollars,Dinars', 'near gate 7', 9005, 'Western union'),
('128', 'Dollars,Dinars,Yemen,Rian,Poun', 'near gate 7', 9006, 'Western union'),
('129', 'Dollars,Dinars,Yemen,Rian', 'near gate 7', 9007, 'Western union'),
('129', 'Dollars,Dinars,Yemen,Rian', 'near gate 1', 9008, 'Western union'),
('130', 'Dollars,Dinars,Yemen,Rian', 'near gate 1', 9009, 'Western union'),
('131', 'Dollars,Dinars,Yemen,Rian', 'near gate 1', 9010, 'Western union'),
('132', 'Dollars,Dinars,Yemen,Rian', 'near gate 1', 9011, 'Western union');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `a_id` varchar(20) DEFAULT NULL,
  `s_id` int(11) NOT NULL,
  `s_name` varchar(20) NOT NULL,
  `location` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`a_id`, `s_id`, `s_name`, `location`) VALUES
('1234', 1, 'tanishq', 'near gate 4'),
('1234', 2, 'raymond', 'near gate 4'),
('1234', 3, 'siyarams', 'near gate 9'),
('1234', 4, 'van hieusen', 'near gate 9'),
('1234', 5, 'monte carlo', 'near gate 6'),
('1234', 6, 'geetanjali', 'near gate 5'),
('404', 7, 'razorpay', 'near gate 4'),
('404', 8, 'sweet club', 'near gate 9'),
('1234', 9, 'eateat', 'near gate 1'),
('1234', 10, 'welcome india', 'near gate 1'),
('133', 11, 'raymond', 'near gate 1'),
('133', 12, 'Geetanjali diamonds', 'near gate 1'),
('133', 13, 'Coffee CafeDay', 'near gate 1'),
('133', 14, 'Adidas', 'near gate 1'),
('133', 15, 'Nike', 'near gate 1'),
('131', 16, 'Nike', 'near gate 1'),
('131', 17, 'Adidas', 'near gate 1'),
('131', 18, 'Coffee CafeDay', 'near gate 1');

-- --------------------------------------------------------

--
-- Table structure for table `waiting`
--

CREATE TABLE `waiting` (
  `a_id` varchar(20) DEFAULT NULL,
  `s_avail` varchar(7) DEFAULT NULL,
  `loca` varchar(30) DEFAULT NULL,
  `D_charges` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waiting`
--

INSERT INTO `waiting` (`a_id`, `s_avail`, `loca`, `D_charges`) VALUES
('1234', '89', 'near gate 3', '1000'),
('404', '100', 'near gate 3', '2400'),
('5678', '40', 'near gate 2', '2100'),
('121', '99', 'near gate 4', '1000'),
('121', '76', 'near gate 9', '1000'),
('122', '76', 'near gate 2', '1000'),
('123', '76', 'near gate 2', '2000'),
('124', '76', 'near gate 2', '2000'),
('125', '76', 'near gate 5', '2000'),
('126', '2', 'near gate 5', '2000'),
('127', '87', 'near gate 4', '2000'),
('128', '34', 'near gate 3', '1800'),
('129', '34', 'near gate 1', '1800'),
('130', '34', 'near gate 1', '1800'),
('131', '56', 'near gate 3', '1800'),
('132', '56', 'near gate 3', '1800'),
('133', '99', 'near gate 1', '1000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `customer_backup`
--
ALTER TABLE `customer_backup`
  ADD PRIMARY KEY (`username`),
  ADD KEY `a_id` (`a_id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`username`),
  ADD KEY `a_id` (`a_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a_id` (`a_id`);

--
-- Indexes for table `moneytransfer`
--
ALTER TABLE `moneytransfer`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `a_id` (`a_id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `a_id` (`a_id`);

--
-- Indexes for table `waiting`
--
ALTER TABLE `waiting`
  ADD KEY `a_id` (`a_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `moneytransfer`
--
ALTER TABLE `moneytransfer`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9012;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_backup`
--
ALTER TABLE `customer_backup`
  ADD CONSTRAINT `customer_backup_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`);

--
-- Constraints for table `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `details_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `moneytransfer`
--
ALTER TABLE `moneytransfer`
  ADD CONSTRAINT `moneytransfer_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `waiting`
--
ALTER TABLE `waiting`
  ADD CONSTRAINT `waiting_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `airport` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
