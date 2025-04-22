-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2018 at 02:43 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblbid`
--

CREATE TABLE `tblbid` (
  `bidID` int(11) NOT NULL,
  `bidderID` int(11) NOT NULL,
  `prodID` int(11) NOT NULL,
  `bidAmount` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbid`
--

INSERT INTO `tblbid` (`bidID`, `bidderID`, `prodID`, `bidAmount`, `date`, `time`) VALUES
(1, 8, 2, 4001, '2018-09-24', '13:14:32'),
(2, 4, 13, 21000, '2018-09-24', '21:53:31'),
(3, 8, 10, 2147483647, '2018-09-24', '23:00:00'),
(4, 8, 2, 40002, '2018-09-24', '23:04:06'),
(5, 4, 13, 22000, '2018-09-25', '10:04:07'),
(6, 4, 13, 25000, '2018-09-25', '10:06:28');

-- --------------------------------------------------------

--
-- Table structure for table `tblbidder`
--

CREATE TABLE `tblbidder` (
  `bidderID` int(11) NOT NULL,
  `bidderName` varchar(100) NOT NULL,
  `bidderEmail` varchar(100) NOT NULL,
  `bidderPassword` varchar(50) NOT NULL,
  `bidderPhone` varchar(15) NOT NULL,
  `bidderGender` varchar(20) NOT NULL,
  `bidderCity` varchar(20) NOT NULL,
  `bidderAddress` text NOT NULL,
  `bidderPhoto` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `emailStatus` tinyint(1) NOT NULL,
  `codeStatus` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbidder`
--

INSERT INTO `tblbidder` (`bidderID`, `bidderName`, `bidderEmail`, `bidderPassword`, `bidderPhone`, `bidderGender`, `bidderCity`, `bidderAddress`, `bidderPhoto`, `status`, `emailStatus`, `codeStatus`) VALUES
(2, 'Bidder', 'ahmed12@gmail.com', '140b543013d988f4767277b6f45ba542', '03332323455', 'male', 'ryk', 'ryk', 'BeautyPlus_20170725190457_save.jpg', 1, 1, 'b3507ec9867deecd3ee5438eb32be6d3'),
(3, 'Nayer', 'nayer@gmail.com', 'nn', '000009', 'Male', 'BK', 'BKKKKKK', 'nayer.jpg', 1, 1, '0'),
(4, 'Asad', 'asadit2014@gmail.com', '140b543013d988f4767277b6f45ba542', '03445678655', 'Male', 'Khanpur', 'Street No 1 Model Town Khanpur', '26169632_762846553908975_3732719890151878234_n.jpg', 1, 1, '6428ae8ac7833497a02376e3c27ce3b3'),
(5, 'ali', 'ali@gmail.com', '86318e52f5ed4801abe1d13d509443de', '03456767876', 'male', 'ryk', 'ryk', 'Contacccct.jpg', 1, 1, ''),
(6, 'Ali', 'ali123@gmail.com', '86318e52f5ed4801abe1d13d509443de', '03444444444', 'male', 'kpr', 'kpr', '58f50a36-9fe1-40fd-9ffb-c06145fc5d441.jpg', 0, 0, '937001562'),
(8, 'Muhammad Ejaz', 'jam5muna@gmail.com', '140b543013d988f4767277b6f45ba542', '03017666666', 'Male', 'khanpur', 'khanpur', '21034200_1939804056295077_1161053593165948700_n.jpg', 1, 1, '231507734');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `catID` int(11) NOT NULL,
  `catName` varchar(100) NOT NULL,
  `catImage` text NOT NULL,
  `catDescription` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`catID`, `catName`, `catImage`, `catDescription`, `status`) VALUES
(1, 'Car', 'ty2017corolla70979425_600.jpg', 'Very Good', 'Active'),
(2, 'Laptop', 'hp-elitebook-x360-1.jpg', 'Fast Computers', 'Active'),
(3, 'Mobile', 'apple-iphone-6-2016-ios-10-gallery-img-2-101016.jpg', 'Very Good', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tblfeedback`
--

CREATE TABLE `tblfeedback` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `bidderID` int(11) DEFAULT NULL,
  `sellerID` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `feedback` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblfeedback`
--

INSERT INTO `tblfeedback` (`id`, `name`, `bidderID`, `sellerID`, `email`, `feedback`, `date`, `time`) VALUES
(1, 'Asad', 4, NULL, 'asds@mm.s', 'Good Interface', '2018-09-10', '18:22:38'),
(2, 'Waqas', NULL, 1, 'wq@d.h', 'Good Work', '2018-09-10', '18:23:13'),
(3, 'new', NULL, 1, 'kjkj@mms.d', 'jkjkjkjkjkj', '2018-09-10', '19:14:51'),
(4, 'again', NULL, 1, 'mk@d.d', ',k,k', '2018-09-10', '19:15:41'),
(5, 'Asad', NULL, 1, 'asadit2014@gmail.com', 'Very Good', '2018-09-25', '10:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct`
--

CREATE TABLE `tblproduct` (
  `prodID` int(11) NOT NULL,
  `prodName` varchar(100) NOT NULL,
  `catID` int(11) NOT NULL,
  `sellerID` int(11) NOT NULL,
  `prodPrice` varchar(100) NOT NULL,
  `prodDescription` text NOT NULL,
  `prodStatus` varchar(20) DEFAULT NULL,
  `prodQuantity` int(11) NOT NULL,
  `prodStartDate` date NOT NULL,
  `prodEndDate` date NOT NULL,
  `prodImage` text NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblproduct`
--

INSERT INTO `tblproduct` (`prodID`, `prodName`, `catID`, `sellerID`, `prodPrice`, `prodDescription`, `prodStatus`, `prodQuantity`, `prodStartDate`, `prodEndDate`, `prodImage`, `status`) VALUES
(1, 'IPhone 6', 3, 1, '3000', 'Very Good', 'Active', 1, '2018-09-24', '2018-09-28', 'apple-iphone-6-2016-ios-10-gallery-img-2-1010164.jpg', 1),
(2, 'Sumsang S4', 3, 1, '4000', 'Very Fast', 'Active', 1, '2018-09-24', '2018-09-29', 'samsung-galaxy-s-duos-1-600x750.jpg', 1),
(3, 'Nokia', 3, 1, '5000', 'Very Fast', 'Active', 1, '2018-09-24', '2018-09-29', 'nokia-6-5.jpg', 1),
(5, 'Hp Elitebook 8460p', 2, 1, '15000', 'High Speed Processor', 'Active', 1, '2018-09-24', '2018-09-26', 'hp-elitebook-x360-14.jpg', 1),
(6, 'Suzuki Mehran 2014', 1, 1, '140000', 'Very Fast Engine', 'Active', 1, '2018-09-24', '2018-09-26', 'Suzuki-Mehran-2014-600x360.jpg', 1),
(10, 'LG', 3, 1, '888', 'High Speed Processor 1.8Ghz', 'Active', 1, '2018-09-24', '2018-09-26', '7b4900bc40daabb94f1be68b3b1d008c3.jpg', 1),
(11, 'Fortuner 2011', 1, 1, '3000000', 'Very Fast and Power Engine11', 'Active', 1, '2018-09-24', '2018-09-26', 'toyota-new_fortuner-03.jpg', 1),
(13, 'Lenovo', 2, 2, '20000', 'Blazing-fast portable workstations', 'Active', 1, '2018-09-10', '2018-09-28', 'lenevo.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblseller`
--

CREATE TABLE `tblseller` (
  `sellerID` int(11) NOT NULL,
  `sellerName` varchar(100) NOT NULL,
  `sellerPassword` varchar(50) NOT NULL,
  `sellerEmail` varchar(100) NOT NULL,
  `sellerPhone` varchar(15) NOT NULL,
  `sellerGender` varchar(20) NOT NULL,
  `sellerCity` varchar(80) NOT NULL,
  `sellerAddress` text NOT NULL,
  `sellerPhoto` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `emailStatus` tinyint(1) NOT NULL,
  `codeStatus` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblseller`
--

INSERT INTO `tblseller` (`sellerID`, `sellerName`, `sellerPassword`, `sellerEmail`, `sellerPhone`, `sellerGender`, `sellerCity`, `sellerAddress`, `sellerPhoto`, `status`, `emailStatus`, `codeStatus`) VALUES
(1, 'ALI KHAN', '140b543013d988f4767277b6f45ba542', 'asadit2014@gmail.com', '00000000000', 'Male', 'ww', 'wwwwwwwwwww', '18814026_796859303806667_2829481358144612453_n.jpg', 1, 1, '025f01d31f794baf5fe945a062c8ad35'),
(2, 'Asif Khan', '140b543013d988f4767277b6f45ba542', 'asif@gmail.com', '99999999999', 'male', 'kpr', 'kpr', 'IMG-20180711-WA0017.jpg', 1, 1, ''),
(3, 'Ahmed', '9193ce3b31332b03f7d8af056c692b84', 'ahmed123@gmail.com', '03443434322', 'male', 'khanpur', 'street no 1 khanpur', 'IMG-20180320-WA0051.jpg', 1, 1, ''),
(4, 'ashir', '229aa634edcc8d13cf4bdd49da8cf845', 'ashi@gmail.com', '03455555555', 'male', 'kpr', 'kpr', '633584-pexels-photo-368893.jpg', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `userID` int(11) NOT NULL,
  `userName` varchar(100) NOT NULL,
  `userPhone` varchar(15) NOT NULL,
  `userPassword` varchar(50) NOT NULL,
  `userEmail` varchar(100) NOT NULL,
  `userImage` text NOT NULL,
  `role` varchar(100) NOT NULL,
  `status` varchar(30) NOT NULL,
  `emailStatus` tinyint(1) NOT NULL,
  `codeStatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`userID`, `userName`, `userPhone`, `userPassword`, `userEmail`, `userImage`, `role`, `status`, `emailStatus`, `codeStatus`) VALUES
(1, 'ASAD KHAN', '03032521027', '140b543013d988f4767277b6f45ba542', 'asadit2014@gmail.com', 'Contacccct.jpg', 'Super Admin', 'Active', 1, '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblbid`
--
ALTER TABLE `tblbid`
  ADD PRIMARY KEY (`bidID`),
  ADD KEY `bidderID` (`bidderID`),
  ADD KEY `prodID` (`prodID`);

--
-- Indexes for table `tblbidder`
--
ALTER TABLE `tblbidder`
  ADD PRIMARY KEY (`bidderID`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`catID`);

--
-- Indexes for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bidderID` (`bidderID`),
  ADD KEY `sellerID` (`sellerID`);

--
-- Indexes for table `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD PRIMARY KEY (`prodID`),
  ADD KEY `catID` (`catID`),
  ADD KEY `sellerID` (`sellerID`);

--
-- Indexes for table `tblseller`
--
ALTER TABLE `tblseller`
  ADD PRIMARY KEY (`sellerID`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblbid`
--
ALTER TABLE `tblbid`
  MODIFY `bidID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblbidder`
--
ALTER TABLE `tblbidder`
  MODIFY `bidderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `catID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblproduct`
--
ALTER TABLE `tblproduct`
  MODIFY `prodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblseller`
--
ALTER TABLE `tblseller`
  MODIFY `sellerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblbid`
--
ALTER TABLE `tblbid`
  ADD CONSTRAINT `tblbid_ibfk_1` FOREIGN KEY (`bidderID`) REFERENCES `tblbidder` (`bidderID`),
  ADD CONSTRAINT `tblbid_ibfk_2` FOREIGN KEY (`prodID`) REFERENCES `tblproduct` (`prodID`);

--
-- Constraints for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  ADD CONSTRAINT `tblfeedback_ibfk_1` FOREIGN KEY (`bidderID`) REFERENCES `tblbidder` (`bidderID`),
  ADD CONSTRAINT `tblfeedback_ibfk_2` FOREIGN KEY (`sellerID`) REFERENCES `tblseller` (`sellerID`);

--
-- Constraints for table `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD CONSTRAINT `tblproduct_ibfk_1` FOREIGN KEY (`catID`) REFERENCES `tblcategory` (`catID`),
  ADD CONSTRAINT `tblproduct_ibfk_3` FOREIGN KEY (`sellerID`) REFERENCES `tblseller` (`sellerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
