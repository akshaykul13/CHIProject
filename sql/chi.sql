-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2015 at 06:18 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `question_bank`
--

CREATE TABLE IF NOT EXISTS `question_bank` (
  `id` int(11) NOT NULL,
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
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_bank`
--

INSERT INTO `question_bank` (`id`, `title`, `major`, `companyID`, `field`, `domain`, `difficulty`, `type`, `question`, `input_format`, `constraints`, `output_format`, `input`, `output`, `time`, `memory`, `input_test_case`, `output_test_case`) VALUES
(1, 'Find Point', 'Computer Science', 'Bloomberg L.P.', 'Math', 'Geometry', 1, 2, 'Given two points P and Q, output the symmetric point of point P about Q.', 'The first line contains an integer T representing the number of test cases (T <= 15)\r\nEach test case contains Px Py Qx Qy representing the (x,y) coordinates of P and Q, all of them being\r\nintegers.', '1 <= T <= 15\r\n-100 <= x, y <= 100', 'For each test case output x and y coordinates of the symmetric point.', '1\r\n0 0 1 1', '2 2', 1, 10, '2\r\n3\r\n456\r\n423\r\n42\r\n333', '2\r\n3\r\n456'),
(2, 'Sherlock and Planes', 'Computer Science', 'Bloomberg L.P.', 'Math', 'Geometry', 2, 2, 'Watson gives four 3-dimensional points to Sherlock and asks him if they all lie in the same plane. Your task\r\nhere is to help Sherlock.', 'First line contains T, the number of testcases.\r\nEach test case consists of four lines. Each line contains three integers, denoting x y z .', '1 ? T ? 10\r\n-10 ? x ,y ,z ? 10', 'For each test case, print YES or NO whether all four points lie in same plane or not, respectively.', '1\r\n1 2 0\r\n2 3 0\r\n4 0 0\r\n0 0 0', 'YES', 2, 10, '', ''),
(3, 'Polar Angles', 'Computer Science', 'Yelp', 'Math', 'Geometry', 3, 2, 'Given a list of points in the 2D plane, sort them in ascending order of their polar angle. In case multiple\r\npoints share exactly the same polar angle, the one with lesser distance from the origin (0,0) should occur\r\nearlier in the sorted list.', 'The first line contains an integer N.\r\nThis is followed by N lines containing pairs of space separated integers, x and y which represent the\r\ncoordinates of the points in the cartesian plane.', '1 <= N <= 1000\r\n-100 <= x,y <= 100\r\nThe point (0,0) will not be present in the list of points.', 'The output should contain N lines. Each line should contain two integers x and y, corresponding to a point\r\nin the original list. Display the points in ascending order of their polar angle.', '4\r\n1 0\r\n0 -1\r\n-1 0\r\n0 1', '1 0\r\n0 1\r\n-1 0\r\n0 -1', 5, 100, '', ''),
(4, 'Spheres', 'Computer Science', 'Facebook', 'Math', 'Geometry', 4, 2, 'Initially, two non-touching spheres of radii R1 and R2 are lying in space at rest. Both of them are then given\r\naccelerations a1 and a2 respectively at time=0. Find whether they will ever come in contact. Their initial\r\npositions are represented as (x1,y1,z1) and (x2,y2,z2) respectively. Accelerations have respective\r\ncomponents in 3D. They are represented as (a1,a1,a1 ) and (a2,a2,a2 ) respectively.', 'The first line contains T, the number of test cases.\r\nEach test case consists of five lines, where the first line contains R1 and R2. The next two lines contain\r\nposition and acceleration of the first sphere. The next two lines after this contain position and acceleration\r\nof the second sphere. All numbers in input are integers.', '1 ? T ? 10\r\n1 ? R1, R2 ? 10\r\n-10 ? x1, y1, z1 , x2 , y2 , z2 ? 10\r\n-10 ? a1 , a1 , a1 , a2 , a2 , a2 ? 10', 'For each test case, print YES , if the spheres come in contact. Otherwise, print NO (quotes for clarity).', '2\r\n1 2\r\n0 0 0\r\n-1 0 0\r\n4 0 0\r\n1 0 0\r\n1 2\r\n0 0 0\r\n100 0 0\r\n4 0 0\r\n0 0 0', 'NO\r\nYES', 10, 100, '', ''),
(5, 'Jim Beam', 'Computer Science', 'Google', 'Math', 'Geometry', 5, 2, 'Jim likes to play with laser beams.\r\nJim stays at point .\r\nThere is a mirror at point and a wall between points and .\r\nJim wants to find out if he can point the laser beam on the mirror.', 'First line contains the number of test cases, .\r\nEach subsequent line contains one test case: space separated integers that denote endpoints of the wall and position of the mirror .', '1 ? T ? 100\r\n0 ? |X1|,|Y1|,|X2|,|Y2|,|Xm|,|Ym| ? 10^6\r\nMirror doesn''t have common points with wall.\r\nWall doesn''t pass through the point (0,0).', 'The answer for each test case: Display YES if Jim can point the laser beam to the mirror, otherwise display\r\nNO .', '5\r\n1 2 2 1 2 2\r\n-1 1 1 1 1 -1\r\n1 1 2 2 3 3\r\n2 2 3 3 1 1\r\n0 1 1 1 0 2', 'NO\r\nYES\r\nNO\r\nYES\r\nNO', 10, 1000, '', ''),
(6, 'Find Point', 'Computer Science', 'Bloomberg L.P.', 'Math', 'Geometry', 1, 2, 'Given two points P and Q, output the symmetric point of point P about Q.', 'The first line contains an integer T representing the number of test cases (T <= 15)\r\nEach test case contains Px Py Qx Qy representing the (x,y) coordinates of P and Q, all of them being\r\nintegers.', '1 <= T <= 15\r\n-100 <= x, y <= 100', 'For each test case output x and y coordinates of the symmetric point.', '1\r\n0 0 1 1', '2 2', 1, 10, '', ''),
(7, 'Sherlock and Planes', 'Computer Science', 'Bloomberg L.P.', 'Math', 'Geometry', 1, 2, 'Watson gives four 3-dimensional points to Sherlock and asks him if they all lie in the same plane. Your task\r\nhere is to help Sherlock.', 'First line contains T, the number of testcases.\r\nEach test case consists of four lines. Each line contains three integers, denoting x y z .', '1 ? T ? 10\r\n-10 ? x ,y ,z ? 10', 'For each test case, print YES or NO whether all four points lie in same plane or not, respectively.', '1\r\n1 2 0\r\n2 3 0\r\n4 0 0\r\n0 0 0', 'YES', 2, 10, '', ''),
(8, 'Polar Angles', 'Computer Science', 'Yelp', 'Math', 'Geometry', 3, 2, 'Given a list of points in the 2D plane, sort them in ascending order of their polar angle. In case multiple\r\npoints share exactly the same polar angle, the one with lesser distance from the origin (0,0) should occur\r\nearlier in the sorted list.', 'The first line contains an integer N.\r\nThis is followed by N lines containing pairs of space separated integers, x and y which represent the\r\ncoordinates of the points in the cartesian plane.', '1 <= N <= 1000\r\n-100 <= x,y <= 100\r\nThe point (0,0) will not be present in the list of points.', 'The output should contain N lines. Each line should contain two integers x and y, corresponding to a point\r\nin the original list. Display the points in ascending order of their polar angle.', '4\r\n1 0\r\n0 -1\r\n-1 0\r\n0 1', '1 0\r\n0 1\r\n-1 0\r\n0 -1', 5, 100, '', ''),
(9, 'Spheres', 'Computer Science', 'Facebook', 'Math', 'Geometry', 4, 2, 'Initially, two non-touching spheres of radii R1 and R2 are lying in space at rest. Both of them are then given\r\naccelerations a1 and a2 respectively at time=0. Find whether they will ever come in contact. Their initial\r\npositions are represented as (x1,y1,z1) and (x2,y2,z2) respectively. Accelerations have respective\r\ncomponents in 3D. They are represented as (a1,a1,a1 ) and (a2,a2,a2 ) respectively.', 'The first line contains T, the number of test cases.\r\nEach test case consists of five lines, where the first line contains R1 and R2. The next two lines contain\r\nposition and acceleration of the first sphere. The next two lines after this contain position and acceleration\r\nof the second sphere. All numbers in input are integers.', '1 ? T ? 10\r\n1 ? R1, R2 ? 10\r\n-10 ? x1, y1, z1 , x2 , y2 , z2 ? 10\r\n-10 ? a1 , a1 , a1 , a2 , a2 , a2 ? 10', 'For each test case, print YES , if the spheres come in contact. Otherwise, print NO (quotes for clarity).', '2\r\n1 2\r\n0 0 0\r\n-1 0 0\r\n4 0 0\r\n1 0 0\r\n1 2\r\n0 0 0\r\n100 0 0\r\n4 0 0\r\n0 0 0', 'NO\r\nYES', 10, 100, '', ''),
(10, 'Jim Beam', 'Computer Science', 'Google', 'Math', 'Geometry', 5, 2, 'Jim likes to play with laser beams.\r\nJim stays at point .\r\nThere is a mirror at point and a wall between points and .\r\nJim wants to find out if he can point the laser beam on the mirror.', 'First line contains the number of test cases, .\r\nEach subsequent line contains one test case: space separated integers that denote endpoints of the wall and position of the mirror .', '1 ? T ? 100\r\n0 ? |X1|,|Y1|,|X2|,|Y2|,|Xm|,|Ym| ? 10^6\r\nMirror doesn''t have common points with wall.\r\nWall doesn''t pass through the point (0,0).', 'The answer for each test case: Display YES if Jim can point the laser beam to the mirror, otherwise display\r\nNO .', '5\r\n1 2 2 1 2 2\r\n-1 1 1 1 1 -1\r\n1 1 2 2 3 3\r\n2 2 3 3 1 1\r\n0 1 1 1 0 2', 'NO\r\nYES\r\nNO\r\nYES\r\nNO', 10, 1000, '', ''),
(11, 'The minimal set of super key is called', 'Computer Science', '', 'Computer', 'Database', 1, 1, 'The minimal set of super key is called', 'Primary key', 'Secondary key', 'Candidate key', 'Foreign key', 'Candidate key', 0, 0, '', ''),
(12, '', 'Computer Science', '', 'Computer Science', 'Database', 1, 1, 'A relation that has no partial dependencies is in which normal form', 'First', 'Second', 'Third', 'BCNF', 'Second', 0, 0, '', ''),
(13, '', 'Computer Science', '', 'Computer Science', 'Database', 2, 1, 'A functional dependency between two or more non-key attributes is called', 'Transitive dependency', 'Partial transitive dependency', 'Functional dependency', 'Partial functional dependency', 'Transitive dependency', 0, 0, '', ''),
(14, '', 'Computer Science', '', 'Computer Science', 'Database', 2, 1, 'A logical description of some portion of database that is required by a user to perform task is called as', 'System View', 'User View', 'Logical View ', 'Data View', 'User View', 0, 0, '', ''),
(15, '', 'Computer Science', '', 'Computer Science', 'Database', 3, 1, 'Which of the following is a classical approach to database design?', 'Left Right approach', 'Right Left approach', 'Top Down approach', 'Bottom Up approach', 'Top Down approach', 0, 0, '', ''),
(16, '', 'Computer Science', '', 'Computer Science', 'Database', 3, 1, '_____________ refers to the correctness and completeness of the data in a database?', 'Data security', 'Data integrity', 'Data constraint', 'Data independence', 'Data integrity', 0, 0, '', ''),
(17, '', 'Computer Science', '', 'Computer Science', 'Database', 4, 1, 'A table that displays data redundancies yields ____________ anomalies', 'Insertion', 'Deletion', 'Update', 'All of the above', 'All of the above', 0, 0, '', ''),
(18, '', 'Computer Science', '', 'Computer Science', 'Database', 4, 1, 'A lock that allows concurrent transactions to access different rows of the same table is known as a', 'Field-level lock', 'Row-level lock', 'Table-level lock', 'Database-level lock', 'Field-level lock', 0, 0, '', ''),
(19, '', 'Computer Science', '', 'Computer Science', 'Database', 5, 1, 'A type of query that is placed within a WHERE or HAVING clause of another query is called', 'Super query', 'Sub query', 'Master query', 'Multi-query', 'Sub query', 0, 0, '', ''),
(20, '', 'Computer Science', '', 'Computer Science', 'Database', 5, 1, 'A transaction completes its execution is said to be', 'Saved', 'Loaded', 'Rolled', 'Committed', 'Committed', 0, 0, '', ''),
(21, '', 'Computer Science', '', 'Computer Science', 'Networks', 1, 1, 'What is the IP Address range of APIPA?', '169.254.0.1 to 169.254.0.254', '169.254.0.1 to 169.254.0.255', '169.254.0.1 to 169.254.255.254', '169.254.0.1 to 169.254.255.255', '169.254.0.1 to 169.254.255.254', 0, 0, '', ''),
(22, '', 'Computer Science', '', 'Computer Science', 'Networks', 1, 1, 'Which of the following is correct in VLSM?', 'Can have subnets of different sizes', 'Subnets must be in same size            ', 'No required of subnet', 'All of above', 'Can have subnets of different sizes', 0, 0, '', ''),
(23, '', 'Computer Science', '', 'Computer Science', 'Networks', 2, 1, 'What does the port number in a TCP connection specify?', 'It specifies the communication process on the two end systems', 'It specifies the quality of the data & connection', 'It specify the size of data', 'All of the above', 'It specifies the communication process on the two end systems', 0, 0, '', ''),
(24, '', 'Computer Science', '', 'Computer Science', 'Networks', 2, 1, 'The class-based addressing is also known as', 'Modern Model', 'Classful Model', 'Classless Model', 'Heterogeneous Model', 'Classful Model', 0, 0, '', ''),
(25, '', 'Computer Science', '', 'Computer Science', 'Networks', 3, 1, 'Which of the following is correct in CIDR?', 'Class A includes Class B network', 'There are only two networks', 'There are high & low class network', 'There is no concept of class A, B, C networks', 'There is no concept of class A, B, C networks', 0, 0, '', ''),
(26, '', 'Computer Science', '', 'Computer Science', 'Networks', 3, 1, 'What is the size of Source and Destination IP address in IP header?', '4 bits', '8 bits', '16 bits', '32 bits', '32 bits', 0, 0, '', ''),
(27, '', 'Computer Science', '', 'Computer Science', 'Networks', 4, 1, 'Which of the following is reliable communication?', 'TCP', 'IP', 'UPD', 'All', 'TCP', 0, 0, '', ''),
(28, '', 'Computer Science', '', 'Computer Science', 'Networks', 4, 1, 'What is the typical range of Ephemeral ports?', '1 to 1024', '80 to 8080', '1024 to 65535', '1 to 80', '1024 to 65535', 0, 0, '', ''),
(29, '', 'Computer Science', '', 'Computer Science', 'Networks', 5, 1, 'What is the purpose of the PSH flag in the TCP header?', 'Typically used to indicate end of message', 'Typically used to indicate beginning of message', 'Typically used to push the message', 'Typically used to indicate stop the message', 'Typically used to indicate end of message', 0, 0, '', ''),
(30, '', 'Computer Science', '', 'Computer Science', 'Networks', 5, 1, 'What is the natural mask for a class C Network?', '255.255.255.1', '255.255.255.0', '255.255.255.254', '255.255.255.255', '255.255.255.0', 0, 0, '', ''),
(31, '', 'Computer Engineering', '', 'Computer Engineering', 'Microprocessor', 1, 1, 'The devices that provide the means for a computer to communicate with the user or other computers are referred to as:', 'CPU', 'ALU', 'I/O', 'none', 'I/O', 0, 0, '', ''),
(32, '', 'Computer Engineering', '', 'Computer Engineering', 'Microprocessor', 1, 1, 'The software used to drive microprocessor-based systems is called:', 'assembly language', 'firmware', 'machine language code', 'BASIC interpreter instructions', 'assembly language', 0, 0, '', ''),
(33, '', 'Computer Engineering', '', 'Computer Engineering', 'Microprocessor', 2, 1, 'The circuits in the 8085A that provide the arithmetic and logic functions are called the:', 'CPU', 'ALU', 'I/O', 'none', 'ALU', 0, 0, '', ''),
(34, '', 'Computer Engineering', '', 'Computer Engineering', 'Microprocessor', 2, 1, 'How many buses are connected as part of the 8085A microprocessor?', '2', '3', '5', '8', '3', 0, 0, '', ''),
(35, '', 'Computer Engineering', '', 'Computer Engineering', 'Microprocessor', 3, 1, 'The ________ ensures that only one IC is active at a time to avoid a bus conflict caused by two ICs writing different data to the same bus.', 'control bus', 'control instructions', 'address decoder', 'CPU', 'address decoder', 0, 0, '', ''),
(36, '', 'Computer Engineering', '', 'Computer Engineering', 'Microprocessor', 3, 1, 'How many bits are used in the data bus?', '7', '8', '9', '16', '8', 0, 0, '', ''),
(37, '', 'Computer Engineering', '', 'Computer Engineering', 'Microprocessor', 4, 1, 'The items that you can physically touch in a computer system are called:', 'software', 'firmware', 'hardware', 'none', 'hardware', 0, 0, '', ''),
(38, '', 'Computer Engineering', '', 'Computer Engineering', 'Microprocessor', 4, 1, 'Single-bit indicators that may be set or cleared to show the results of logical or arithmetic operations are the:', 'flags', 'registers', 'monitors', 'decisions', 'flags', 0, 0, '', ''),
(39, '', 'Computer Engineering', '', 'Computer Engineering', 'Microprocessor', 5, 1, 'When referring to instruction words, a mnemonic is:', 'a short abbreviation for the operand address', 'a short abbreviation for the operation to be performed', 'a short abbreviation for the data word stored at the operand address', 'shorthand for machine language', 'a short abbreviation for the operation to be performed', 0, 0, '', ''),
(40, '', 'Computer Engineering', '', 'Computer Engineering', 'Microprocessor', 5, 1, 'The technique of assigning a memory address to each I/O device in the computer system is called:', 'memory-mapped I/O', 'ported I/O', 'dedicated I/O', 'wired I/O', 'memory-mapped I/O', 0, 0, '', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

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
(17, 1, 'Information Systems', 'Networks', 0, '2015-05-02 18:06:30'),
(18, 3, 'Computer Science', '', 150, '2015-05-04 02:33:14'),
(19, 3, 'Computer Science', '', 60, '2015-05-04 03:37:25');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `emailid`, `password`, `location_preference`, `company_preference`, `keyword_preference`, `field_preference`, `domain_preference`) VALUES
(1, 'Akshay', 'Kulkarni', 'akshaykul@yahoo.com', 'akshay1', '', 'Apple', 'N;', '', ''),
(3, 'First', 'Last', 'first@last.com', 'akshay', '', 'Apple', 'N;', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
