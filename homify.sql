-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2023 at 05:48 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homify`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `s_no` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` varchar(200) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`s_no`, `name`, `email`, `subject`, `message`, `date`) VALUES
(1, 'wil-sh', 'RITESHJ0023@GMAIL.COM', 'try', 'blah blah blah balh ablh!!!!!!!!!!\r\n', '2023-03-18 10:17:20');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `s_no` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` varchar(15) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `category` varchar(10) NOT NULL,
  `rooms` varchar(10) DEFAULT NULL,
  `carpet_area` varchar(15) NOT NULL,
  `price` int(10) NOT NULL,
  `location` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `slug` varchar(30) NOT NULL,
  `features` varchar(11) NOT NULL,
  `img1` varchar(15) DEFAULT NULL,
  `img2` varchar(11) DEFAULT NULL,
  `img3` varchar(11) DEFAULT NULL,
  `img4` varchar(11) DEFAULT NULL,
  `img5` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`s_no`, `title`, `name`, `status`, `content`, `category`, `rooms`, `carpet_area`, `price`, `location`, `date`, `slug`, `features`, `img1`, `img2`, `img3`, `img4`, `img5`) VALUES
(1, 'New Golden Nest', 'Sonam Classic', 'For Rent', 'New Golden Nest is a well designed and well connected apartment project located in Mira Road And Beyond,Mumbai. The project offers 1 BHK-2 BHK apartments that come with 690 sqft to 720 sqft sizes. The apartments are well designed and come with all the modern amenities. The project is conveniently located close to all the major points of the city and is well connected with all the major roads. The apartments are well connected with all the major shopping centers and are also well connected to Western Express Highway.', 'Flat', '1 BHK', '837 Sq. Ft.', 60, 'bhayander east', '2023-03-12 08:15:11', 'new_golden_nest', '', '0', '', '', NULL, NULL),
(2, 'Avdhoot CHS', '1 BHK Flat For Sale In Avdhoot CHS', 'For Sale', 'Avdhoot CHS is strategically located in Andheri West in the city of Mumbai and is a well-planned project. The project offers Ready To Move units. The commencement certificate of this well-planned project has not been granted. The occupancy certificate of the project not granted, so you can be rest assured. The well-known builder Cooperative Group Housing Society has developed Avdhoot CHS project. Andheri West, Mumbai. is the official address of this project. The pin code of this masterpiece project is 400047. Avdhoot CHS offers a contemporary lifestyle to its residents and is the perfect place to own your dream home.\r\n\r\nAvdhoot CHS Address\r\n\r\nAndheri West, Mumbai. , 400047, is the postal address of Avdhoot CHS in Mumbai.\r\n', 'Flat', '1 BHK', '460 Sq.Ft.', 90, 'Anheri', '2023-03-12 08:15:11', 'Avdhoot-CHS', 'Ready To Mo', '1.jpeg', '2.jpeg', '1.jpeg', '1.jpeg', '1.jpeg'),
(3, 'ETERNIA Oberoi', 'Tower A and B', 'For sale', 'In a city where Space is the ultimate luxury, we give you an abundance of it.\r\nConceived and created by Oberoi Realty - one of India\'s leading real estate companies, Eternia and Enigma offer an elevated living experience with spacious residences and wide-open play areas. Long jogging tracks lead you through verdant gardens and expansive walkways. Stroll through the greenery and let the most enchanting views of Yeoor Hills and Vihar Lake soothe your soul. Experience a truly global lifestyle with more than 30 amenities that offer you the latest in modern living in the lap of nature, yet seamlessly connected to the world outside through existing infrastructure and the upcoming Goregaon Mulund Link Road and the proposed Metro station. Eternia and Enigma have been approved by all leading banks and housing finance companies.\r\n\r\nOur show flats in the towers are open. Come, experience Mulund’s best residences today.', 'Flat', '4 BHK', '1262 Sq.ft', 5, 'Mulund', '2023-03-18 12:31:53', 'Tower-A-and-B-Eternia-Oberoi', 'Gymnasium  ', '0', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `s_no` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `category` varchar(10) NOT NULL,
  `rooms` varchar(10) DEFAULT NULL,
  `carpet__area` varchar(15) NOT NULL,
  `price` int(10) NOT NULL,
  `location` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `slug` varchar(30) NOT NULL,
  `feature` varchar(11) NOT NULL,
  `img1` int(200) NOT NULL,
  `img2` varchar(11) NOT NULL,
  `img3` varchar(11) NOT NULL,
  `img4` varchar(11) DEFAULT NULL,
  `img5` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`s_no`, `title`, `name`, `content`, `category`, `rooms`, `carpet__area`, `price`, `location`, `date`, `slug`, `feature`, `img1`, `img2`, `img3`, `img4`, `img5`) VALUES
(1, 'New Golden Nest', 'Sonam Classic', 'New Golden Nest is a well designed and well connected apartment project located in Mira Road And Beyond,Mumbai. The project offers 1 BHK-2 BHK apartments that come with 690 sqft to 720 sqft sizes. The apartments are well designed and come with all the modern amenities. The project is conveniently located close to all the major points of the city and is well connected with all the major roads. The apartments are well connected with all the major shopping centers and are also well connected to Western Express Highway.', 'Flat', '1 BHK', '837 Sq. Ft.', 60, 'bhayander east', '2023-03-12 08:15:11', 'new_golden_nest', '', 0, '', '', NULL, NULL),
(2, 'Avdhoot CHS', '1 BHK Flat For Sale In Avdhoot CHS', 'Avdhoot CHS is strategically located in Andheri West in the city of Mumbai and is a well-planned project. The project offers Ready To Move units. The commencement certificate of this well-planned project has not been granted. The occupancy certificate of the project not granted, so you can be rest assured. The well-known builder Cooperative Group Housing Society has developed Avdhoot CHS project. Andheri West, Mumbai. is the official address of this project. The pin code of this masterpiece project is 400047. Avdhoot CHS offers a contemporary lifestyle to its residents and is the perfect place to own your dream home.\r\n\r\nAvdhoot CHS Address\r\n\r\nAndheri West, Mumbai. , 400047, is the postal address of Avdhoot CHS in Mumbai.\r\n', 'Flat', '1 BHK', '460 Sq.Ft.', 90, 'Anheri', '2023-03-12 08:15:11', 'Avdhoot-CHS', 'Ready To Mo', 0, '2.jpeg', '1.jpeg', '1.jpeg', '1.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`s_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
