-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2015 at 05:33 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `name` varchar(20) NOT NULL,
  `number` int(11) NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`name`, `number`, `amount`) VALUES
('praveen', 101, 2398),
('saketh', 123, 4000),
('sravan', 144, 10000),
('abd', 365, 9000),
('yuvraj', 420, 6000),
('arpit', 565, 8239),
('jitendar', 650, 7000),
('ankit', 700, 700),
('mayank', 808, 9574),
('tilu', 875, 9475),
('kallol', 940, 7539);
--
-- Database: `chi`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE IF NOT EXISTS `alumni` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `university` varchar(100) NOT NULL,
  `major` varchar(50) NOT NULL,
  `degree` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `company` varchar(100) NOT NULL,
  `location` varchar(50) NOT NULL,
  `company_domain` varchar(50) NOT NULL,
  `graduation_class` int(11) NOT NULL,
  `designation` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `alumni`
--

INSERT INTO `alumni` (`id`, `name`, `university`, `major`, `degree`, `email`, `company`, `location`, `company_domain`, `graduation_class`, `designation`) VALUES
(1, 'Jordan Gross', 'Texas A&M University', 'Economics', 'Bachelors', 'jgross@apple.com', 'Apple', 'Cupertino', 'Software', 2014, 'Designer'),
(2, 'Shuhong Chen', 'Texas A&M University', 'Computer Science', 'Masters', 'schen@apple.com', 'Apple', 'Cupertino', 'software', 1990, 'Engineer'),
(3, 'Shonnon George', 'Texas A&M University', 'Industrial Engineer', 'Bachelors', 'sgeorge@apple.com', 'Apple', 'Austin', 'Software', 1993, 'Account Executive'),
(4, 'Stephanie Kreger', 'Texas A&M University', 'Business', 'Bachelors', 'stephkreger@apple.com', 'Apple', 'Austin', 'Software', 2009, 'Human Resource Manager'),
(5, 'Ashish Kumar', 'Texas A&M University', 'Computer Engineer', 'Masters', 'ashishkumar@apple.com', 'Apple', 'Santa Clara', 'Software', 2013, 'CPU Design Engineer'),
(6, 'Claude Roberts', 'Texas A&M University', 'Business', 'Bachelors', 'clroberts@bloomberg.com', 'Bloomberg', 'San Fransisco', 'S0ftware', 1983, 'Senior Account Executive'),
(7, 'Don Hinton', 'Texas A&M UNiversity', 'Computer Science', 'Bachelors', 'hilton@bloomberg.com', 'Bloomberg', 'New York', 'Software', 2011, 'Project Manager'),
(8, 'Don Hilton', 'Texas A&M University', 'Electrical Engineering', 'Bachelors', 'donhilton@gmail.com', 'Bloomberg', 'New York', 'Software', 1990, 'Project Manager'),
(9, 'Mia Motiee', 'Texas A&M University', 'Computer Science', 'Masters', 'motiee@bloomberg.comm', 'Bloomberg', 'San Fransisco', 'Software', 2008, 'Software Engineer'),
(10, 'Nader Kabbani', 'Texas A&M University', 'Electrical Engineering', 'Bachelors', 'nmk@amazon.com', 'Amazon', 'Seattle', 'Software', 1986, 'Vice President'),
(11, 'Robert Kirk', 'Texas A&M University', 'Computer Science', 'Bachelors', 'rkirk@gmail.com', 'Amazon', 'Seattle', 'Software', 1996, 'Software Engineer'),
(12, 'Timothy Thomson', 'Texas A&M University', 'Computer Science', 'Bachelors', 'tt@amazon.com', 'Amazon', 'Austin', 'Software', 2003, 'Software Engineer'),
(13, 'Oscar Ochoa', 'Texas A&M University', 'Engineering Technology', 'Bachelors', 'ochoa@live.com', 'Intel', 'Santa Clara', 'Computer Hardware', 1987, 'Commodity Manager'),
(14, 'William Cooper', 'Texas A&M University', 'Electrical Engineering', 'Masters', 'willcooper@intel.com', 'Intel', 'Santa Clara', 'Computer Hardware', 1971, 'Recruiter'),
(15, 'Lori Bradford', 'Texas A&M University', 'Industrial Distribution', 'Bachelors', 'lbradford@intel.com', 'Intel', 'Phoenix', 'Computer Hardware', 1982, 'Manufacturing Engineer'),
(16, 'Mohammad Bhuiyan', 'Texas A&M University', 'Computer Science', 'Bachelors', 'Bhuiyan@intel.com', 'Intel', 'Santa Clara', 'Computer Hardware', 2004, 'Software Engineer'),
(17, 'Janarthan Rengarajan', 'Texas A&M University', 'Computer Engineering', 'Masters', 'Rengarajan@intel.com', 'Intel', 'Austin', 'Computer Hardware', 2008, 'Senior Design Engineer'),
(18, 'John Decker', 'Texas A&M University', 'Computer Science', 'Bachelors', 'johnd@yahoo.com', 'Intel', 'Austin', 'Computer Hardware', 1987, 'Senior Systems Engineer');
--
-- Database: `test`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
