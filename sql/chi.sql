-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2015 at 08:58 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `chi`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE IF NOT EXISTS `alumni` (
  `name` varchar(50) NOT NULL,
  `university` varchar(100) NOT NULL,
  `major` varchar(50) NOT NULL,
  `degree` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `company` varchar(100) NOT NULL,
  `location` varchar(50) NOT NULL,
  `company_domain` varchar(50) NOT NULL,
  `graduation_class` int(11) NOT NULL,
  `designation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank`
--

CREATE TABLE IF NOT EXISTS `question_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `major` varchar(20) DEFAULT NULL,
  `companyID` varchar(50) NOT NULL,
  `field` varchar(20) NOT NULL,
  `domain` varchar(20) NOT NULL,
  `difficulty` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `input_format` varchar(1000) NOT NULL,
  `constraints` varchar(1000) NOT NULL,
  `output_format` varchar(1000) NOT NULL,
  `input` varchar(1000) NOT NULL,
  `output` varchar(1000) NOT NULL,
  `time` int(11) NOT NULL,
  `memory` int(11) NOT NULL,
  `input_test_case` varchar(200) NOT NULL,
  `output_test_case` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `question_bank`
--

INSERT INTO `question_bank` (`id`, `title`, `major`, `companyID`, `field`, `domain`, `difficulty`, `type`, `question`, `input_format`, `constraints`, `output_format`, `input`, `output`, `time`, `memory`, `input_test_case`, `output_test_case`) VALUES
(1, 'Find Point', 'computer science', 'Bloomberg L.P.', 'geometry', 'math', 1, 2, 'Given two points P and Q, output the symmetric point of point P about Q.', 'The first line contains an integer T representing the number of test cases (T <= 15)\r\nEach test case contains Px Py Qx Qy representing the (x,y) coordinates of P and Q, all of them being\r\nintegers.', '1 <= T <= 15\r\n-100 <= x, y <= 100', 'For each test case output x and y coordinates of the symmetric point.', '1\r\n0 0 1 1', '2 2', 1, 10, '2\r\n3\r\n456\r\n423\r\n42\r\n333', '2\r\n3\r\n456'),
(2, 'Sherlock and Planes', 'computer science', 'Bloomberg L.P.', 'geometry', 'math', 2, 2, 'Watson gives four 3-dimensional points to Sherlock and asks him if they all lie in the same plane. Your task\r\nhere is to help Sherlock.', 'First line contains T, the number of testcases.\r\nEach test case consists of four lines. Each line contains three integers, denoting x y z .', '1 ? T ? 10\r\n-10 ? x ,y ,z ? 10', 'For each test case, print YES or NO whether all four points lie in same plane or not, respectively.', '1\r\n1 2 0\r\n2 3 0\r\n4 0 0\r\n0 0 0', 'YES', 2, 10, '', ''),
(3, 'Polar Angles', 'computer science', 'Yelp', 'geometry', 'math', 3, 2, 'Given a list of points in the 2D plane, sort them in ascending order of their polar angle. In case multiple\r\npoints share exactly the same polar angle, the one with lesser distance from the origin (0,0) should occur\r\nearlier in the sorted list.', 'The first line contains an integer N.\r\nThis is followed by N lines containing pairs of space separated integers, x and y which represent the\r\ncoordinates of the points in the cartesian plane.', '1 <= N <= 1000\r\n-100 <= x,y <= 100\r\nThe point (0,0) will not be present in the list of points.', 'The output should contain N lines. Each line should contain two integers x and y, corresponding to a point\r\nin the original list. Display the points in ascending order of their polar angle.', '4\r\n1 0\r\n0 -1\r\n-1 0\r\n0 1', '1 0\r\n0 1\r\n-1 0\r\n0 -1', 5, 100, '', ''),
(4, 'Spheres', 'computer science', 'Facebook', 'geometry', 'math', 4, 2, 'Initially, two non-touching spheres of radii R1 and R2 are lying in space at rest. Both of them are then given\r\naccelerations a1 and a2 respectively at time=0. Find whether they will ever come in contact. Their initial\r\npositions are represented as (x1,y1,z1) and (x2,y2,z2) respectively. Accelerations have respective\r\ncomponents in 3D. They are represented as (a1,a1,a1 ) and (a2,a2,a2 ) respectively.', 'The first line contains T, the number of test cases.\r\nEach test case consists of five lines, where the first line contains R1 and R2. The next two lines contain\r\nposition and acceleration of the first sphere. The next two lines after this contain position and acceleration\r\nof the second sphere. All numbers in input are integers.', '1 ? T ? 10\r\n1 ? R1, R2 ? 10\r\n-10 ? x1, y1, z1 , x2 , y2 , z2 ? 10\r\n-10 ? a1 , a1 , a1 , a2 , a2 , a2 ? 10', 'For each test case, print YES , if the spheres come in contact. Otherwise, print NO (quotes for clarity).', '2\r\n1 2\r\n0 0 0\r\n-1 0 0\r\n4 0 0\r\n1 0 0\r\n1 2\r\n0 0 0\r\n100 0 0\r\n4 0 0\r\n0 0 0', 'NO\r\nYES', 10, 100, '', ''),
(5, 'Jim Beam', 'computer science', 'Google', 'geometry', 'math', 5, 2, 'Jim likes to play with laser beams.\r\nJim stays at point .\r\nThere is a mirror at point and a wall between points and .\r\nJim wants to find out if he can point the laser beam on the mirror.', 'First line contains the number of test cases, .\r\nEach subsequent line contains one test case: space separated integers that denote endpoints of the wall and position of the mirror .', '1 ? T ? 100\r\n0 ? |X1|,|Y1|,|X2|,|Y2|,|Xm|,|Ym| ? 10^6\r\nMirror doesn''t have common points with wall.\r\nWall doesn''t pass through the point (0,0).', 'The answer for each test case: Display YES if Jim can point the laser beam to the mirror, otherwise display\r\nNO .', '5\r\n1 2 2 1 2 2\r\n-1 1 1 1 1 -1\r\n1 1 2 2 3 3\r\n2 2 3 3 1 1\r\n0 1 1 1 0 2', 'NO\r\nYES\r\nNO\r\nYES\r\nNO', 10, 1000, '', ''),
(6, 'Find Point', 'computer science', 'Bloomberg L.P.', 'geometry', 'math', 1, 2, 'Given two points P and Q, output the symmetric point of point P about Q.', 'The first line contains an integer T representing the number of test cases (T <= 15)\r\nEach test case contains Px Py Qx Qy representing the (x,y) coordinates of P and Q, all of them being\r\nintegers.', '1 <= T <= 15\r\n-100 <= x, y <= 100', 'For each test case output x and y coordinates of the symmetric point.', '1\r\n0 0 1 1', '2 2', 1, 10, '', ''),
(7, 'Sherlock and Planes', 'computer science', 'Bloomberg L.P.', 'geometry', 'math', 1, 2, 'Watson gives four 3-dimensional points to Sherlock and asks him if they all lie in the same plane. Your task\r\nhere is to help Sherlock.', 'First line contains T, the number of testcases.\r\nEach test case consists of four lines. Each line contains three integers, denoting x y z .', '1 ? T ? 10\r\n-10 ? x ,y ,z ? 10', 'For each test case, print YES or NO whether all four points lie in same plane or not, respectively.', '1\r\n1 2 0\r\n2 3 0\r\n4 0 0\r\n0 0 0', 'YES', 2, 10, '', ''),
(8, 'Polar Angles', 'computer science', 'Yelp', 'geometry', 'math', 3, 2, 'Given a list of points in the 2D plane, sort them in ascending order of their polar angle. In case multiple\r\npoints share exactly the same polar angle, the one with lesser distance from the origin (0,0) should occur\r\nearlier in the sorted list.', 'The first line contains an integer N.\r\nThis is followed by N lines containing pairs of space separated integers, x and y which represent the\r\ncoordinates of the points in the cartesian plane.', '1 <= N <= 1000\r\n-100 <= x,y <= 100\r\nThe point (0,0) will not be present in the list of points.', 'The output should contain N lines. Each line should contain two integers x and y, corresponding to a point\r\nin the original list. Display the points in ascending order of their polar angle.', '4\r\n1 0\r\n0 -1\r\n-1 0\r\n0 1', '1 0\r\n0 1\r\n-1 0\r\n0 -1', 5, 100, '', ''),
(9, 'Spheres', 'computer science', 'Facebook', 'geometry', 'math', 4, 2, 'Initially, two non-touching spheres of radii R1 and R2 are lying in space at rest. Both of them are then given\r\naccelerations a1 and a2 respectively at time=0. Find whether they will ever come in contact. Their initial\r\npositions are represented as (x1,y1,z1) and (x2,y2,z2) respectively. Accelerations have respective\r\ncomponents in 3D. They are represented as (a1,a1,a1 ) and (a2,a2,a2 ) respectively.', 'The first line contains T, the number of test cases.\r\nEach test case consists of five lines, where the first line contains R1 and R2. The next two lines contain\r\nposition and acceleration of the first sphere. The next two lines after this contain position and acceleration\r\nof the second sphere. All numbers in input are integers.', '1 ? T ? 10\r\n1 ? R1, R2 ? 10\r\n-10 ? x1, y1, z1 , x2 , y2 , z2 ? 10\r\n-10 ? a1 , a1 , a1 , a2 , a2 , a2 ? 10', 'For each test case, print YES , if the spheres come in contact. Otherwise, print NO (quotes for clarity).', '2\r\n1 2\r\n0 0 0\r\n-1 0 0\r\n4 0 0\r\n1 0 0\r\n1 2\r\n0 0 0\r\n100 0 0\r\n4 0 0\r\n0 0 0', 'NO\r\nYES', 10, 100, '', ''),
(10, 'Jim Beam', 'computer science', 'Google', 'geometry', 'math', 5, 2, 'Jim likes to play with laser beams.\r\nJim stays at point .\r\nThere is a mirror at point and a wall between points and .\r\nJim wants to find out if he can point the laser beam on the mirror.', 'First line contains the number of test cases, .\r\nEach subsequent line contains one test case: space separated integers that denote endpoints of the wall and position of the mirror .', '1 ? T ? 100\r\n0 ? |X1|,|Y1|,|X2|,|Y2|,|Xm|,|Ym| ? 10^6\r\nMirror doesn''t have common points with wall.\r\nWall doesn''t pass through the point (0,0).', 'The answer for each test case: Display YES if Jim can point the laser beam to the mirror, otherwise display\r\nNO .', '5\r\n1 2 2 1 2 2\r\n-1 1 1 1 1 -1\r\n1 1 2 2 3 3\r\n2 2 3 3 1 1\r\n0 1 1 1 0 2', 'NO\r\nYES\r\nNO\r\nYES\r\nNO', 10, 1000, '', ''),
(11, 'The minimal set of super key is called', 'computer science', '', 'database', '', 1, 1, 'The minimal set of super key is called', 'Primary key', 'Secondary key', 'Candidate key', 'Foreign key', 'Candidate key', 0, 0, '', ''),
(12, '', 'computer science', '', '', '', 1, 1, 'A relation that has no partial dependencies is in which normal form', 'First', 'Second', 'Third', 'BCNF', 'Second', 0, 0, '', ''),
(13, '', 'computer science', '', '', '', 2, 1, 'A functional dependency between two or more non-key attributes is called', 'Transitive dependency', 'Partial transitive dependency', 'Functional dependency', 'Partial functional dependency', 'Transitive dependency', 0, 0, '', ''),
(14, '', 'computer science', '', '', '', 2, 1, 'A logical description of some portion of database that is required by a user to perform task is called as', 'System View', 'User View', 'Logical View ', 'Data View', 'User View', 0, 0, '', ''),
(15, '', 'computer science', '', '', '', 3, 1, 'Which of the following is a classical approach to database design?', 'Left Right approach', 'Right Left approach', 'Top Down approach', 'Bottom Up approach', 'Top Down approach', 0, 0, '', ''),
(16, '', 'computer science', '', '', '', 3, 1, '_____________ refers to the correctness and completeness of the data in a database?', 'Data security', 'Data integrity', 'Data constraint', 'Data independence', 'Data integrity', 0, 0, '', ''),
(17, '', 'computer science', '', '', '', 4, 1, 'A table that displays data redundancies yields ____________ anomalies', 'Insertion', 'Deletion', 'Update', 'All of the above', 'All of the above', 0, 0, '', ''),
(18, '', 'computer science', '', '', '', 4, 1, 'A lock that allows concurrent transactions to access different rows of the same table is known as a', 'Field-level lock', 'Row-level lock', 'Table-level lock', 'Database-level lock', 'Field-level lock', 0, 0, '', ''),
(19, '', 'computer science', '', '', '', 5, 1, 'A type of query that is placed within a WHERE or HAVING clause of another query is called', 'Super query', 'Sub query', 'Master query', 'Multi-query', 'Sub query', 0, 0, '', ''),
(20, '', 'computer science', '', '', '', 5, 1, 'A transaction completes its execution is said to be', 'Saved', 'Loaded', 'Rolled', 'Committed', 'Committed', 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `test_scores`
--

CREATE TABLE IF NOT EXISTS `test_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `field` varchar(20) NOT NULL,
  `domain` varchar(20) NOT NULL,
  `score` int(11) NOT NULL,
  `submission_time` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `test_scores`
--

INSERT INTO `test_scores` (`id`, `userID`, `field`, `domain`, `score`, `submission_time`) VALUES
(6, 1, 'Information Systems', 'Networks', 60, '2015-05-02 17:35:16'),
(7, 1, 'Information Systems', 'Networks', 60, '2015-05-02 17:37:39'),
(8, 1, 'Information Systems', 'Networks', 0, '2015-05-02 17:40:24'),
(9, 1, 'Information Systems', 'Networks', 0, '2015-05-02 17:56:34'),
(10, 1, 'Information Systems', 'Networks', 0, '2015-05-02 17:59:38'),
(11, 1, 'Information Systems', 'Networks', 0, '2015-05-02 18:00:21'),
(12, 1, 'Information Systems', 'Networks', 0, '2015-05-02 18:01:06'),
(13, 1, 'Information Systems', 'Networks', 0, '2015-05-02 18:02:32'),
(14, 1, 'Information Systems', 'Networks', 0, '2015-05-02 18:03:47'),
(15, 1, 'Information Systems', 'Networks', 0, '2015-05-02 18:04:56'),
(16, 1, 'Information Systems', 'Networks', 0, '2015-05-02 18:05:58'),
(17, 1, 'Information Systems', 'Networks', 0, '2015-05-02 18:06:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `location_preference` varchar(50) NOT NULL,
  `company_preference` varchar(50) NOT NULL,
  `keyword_preference` varchar(200) NOT NULL,
  `field_preference` varchar(50) NOT NULL,
  `domain_preference` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `emailid`, `password`, `location_preference`, `company_preference`, `keyword_preference`, `field_preference`, `domain_preference`) VALUES
(1, 'Akshay', 'Kulkarni', 'akshaykul@yahoo.com', 'akshay1', '', '', 'N;', 'Information Systems', 'Networks');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
