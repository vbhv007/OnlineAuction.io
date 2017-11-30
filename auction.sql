-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 01, 2017 at 12:16 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auction`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(15) NOT NULL,
  `pass` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `pass`) VALUES
('0', '0'),
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderId` int(11) NOT NULL,
  `BuyerUsr` varchar(30) NOT NULL,
  `SellerUsr` varchar(30) NOT NULL,
  `Amount` float NOT NULL,
  `Address` varchar(100) NOT NULL,
  `productId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderId`, `BuyerUsr`, `SellerUsr`, `Amount`, `Address`, `productId`, `Quantity`, `status`) VALUES
(1, 'Tanay', 'Udai', 70, 'Parbatia Main Road, Balugada Turning, Near Esi Dispensary', 6, 3, 1),
(4, 'Tanay', 'Rahul', 2500, 'Parbatia Main Road, Balugada Turning, Near Esi Dispensary', 9, 1, 1),
(5, 'Ankit', 'Rahul', 3500, 'vit bOYS hOSTEL', 9, 1, 1),
(9, 'Tanay', 'Rahul', 9000, 'gfdgdg', 4, 2, 1),
(10, 'Ankit', 'Rahul', 14000, 'hdjfhd', 9, 1, 1),
(12, 'Ankit', 'Rahul', 76000, 'hghg', 10, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` int(11) NOT NULL,
  `productName` varchar(30) NOT NULL,
  `maxbid` float NOT NULL,
  `minbid` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `sellerUsr` varchar(30) NOT NULL,
  `descp` varchar(150) NOT NULL,
  `currBid` float NOT NULL,
  `expiry` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `productName`, `maxbid`, `minbid`, `quantity`, `sellerUsr`, `descp`, `currBid`, `expiry`) VALUES
(9, 'Magnet Perfume', 30000, 16000, 2, 'Rahul', 'Synthetic perfume imported form France', 0, '2017-11-04'),
(10, 'Tanishq Gold Watch', 200000, 75000, 0, 'Rahul', '22K gold watch with hall mark. ', 76000, '2017-12-31'),
(12, 'dkjfk', 2500, 200, 2, 'vbhv', 'jdkfjkd', 0, '2017-12-10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(15) NOT NULL,
  `pass` varchar(15) DEFAULT NULL,
  `first_name` varchar(10) DEFAULT NULL,
  `last_name` varchar(10) DEFAULT NULL,
  `dob` varchar(8) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `pass`, `first_name`, `last_name`, `dob`, `role`, `email`) VALUES
('aastha', 'aastha', 'aastha', 'sahay', '22/03/98', 'seller', 'hjdfhdj@jfkjdf.com'),
('Ankit', '5', 'Ankit', 'Jain', '27/12/98', 'buyer', 'ankitjain@gmail.com'),
('op', '1', 'op', 'op', '22/03/98', 'buyer', 'op@op.com'),
('po', '1', 'po', 'po', '22/05/98', 'buyer', 'po@po.com'),
('qww', '1', 'sdsf', 'dfsd', '22/05/98', 'buyer', 'qwerty@gmail.com'),
('Rahul', '4', 'Rahul', 'Kelkar', '29/02/98', 'seller', 'rahulanoop@gmail.com'),
('Tanay', '1', 'Tanay', 'Agarwal', '26/12/97', 'buyer', 'tanay1up@gmail.com'),
('Vbhv', 'vbhv', 'Vaibhav', 'Bhardwaj', '26/10/98', 'seller', 'vbhv@example.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`),
  ADD UNIQUE KEY `productId` (`productId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
