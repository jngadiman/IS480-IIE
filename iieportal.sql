-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2017 at 08:12 AM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iieportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(100) NOT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `company_description` varchar(200) DEFAULT NULL,
  `vision` varchar(100) DEFAULT NULL,
  `mission` varchar(100) DEFAULT NULL,
  `industry` varchar(45) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `current_stage` int(11) DEFAULT NULL,
  `company_logo` varchar(1000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_description`, `vision`, `mission`, `industry`, `start_date`, `current_stage`, `company_logo`) VALUES
(1, 'kfc', 'sells chicken', 'to sell as many chicken as possible', 'to sell the best quality chicken ever!', 'FnB', '2017-07-23 01:28:35', 1, 'C:/storage/pic.png'),
(2, 'ntuc', 'sells groceries.', 'to be able to sell groceries everywhere', 'to bring you the best quality foods to you', 'Food And Beverage', '2017-08-12 00:00:00', 3, 'starbucks-shiok-ah-ccino-frappuccino-drink.jpg'),
(3, 'In and Out', 'sells burgers and fries', 'to be able to sell in Asia', 'to make all our burgers so delicious you want to come back for more!', 'FnB', '2017-08-02 17:49:20', 0, 'C;/storage/inNout.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE `meeting` (
  `meeting_id` int(100) NOT NULL,
  `meeting_name` varchar(120) NOT NULL,
  `meeting_type` varchar(120) NOT NULL,
  `start_time` date NOT NULL,
  `end_time` date NOT NULL,
  `attendees` varchar(500) NOT NULL,
  `status` varchar(8) NOT NULL,
  `mentee_company_id` int(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meeting`
--

INSERT INTO `meeting` (`meeting_id`, `meeting_name`, `meeting_type`, `start_time`, `end_time`, `attendees`, `status`, `mentee_company_id`) VALUES
(1, 'testing mentor huimin', 'reqular', '2017-08-10', '2017-08-10', 'admin@smu.edu.sg, huimin@hotmail.com', 'approved', 2);

-- --------------------------------------------------------

--
-- Table structure for table `meeting_minutes`
--

CREATE TABLE `meeting_minutes` (
  `minutes_id` int(100) NOT NULL,
  `title` varchar(120) NOT NULL,
  `meeting_id` int(100) NOT NULL,
  `mentor` varchar(60) NOT NULL,
  `task_id` int(100) NOT NULL,
  `comment` varchar(150) NOT NULL,
  `submitted_user` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meeting_minutes`
--

INSERT INTO `meeting_minutes` (`minutes_id`, `title`, `meeting_id`, `mentor`, `task_id`, `comment`, `submitted_user`) VALUES
(1, 'mymunites', 1, 'huimin@hotmail.com', 1, 'testing', 'admin@smu.edu.sg'),
(1, 'mymunites', 1, 'huimin@hotmail.com', 2, 'testing', 'admin@smu.edu.sg'),
(1, 'mymunites', 1, 'huimin@hotmail.com', 3, 'testing', 'admin@smu.edu.sg'),
(2, 'mymeetingminutes', 2, 'huimin@hotmail.com', 5, 'nth much', 'huimin@hotmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `mentee`
--

CREATE TABLE `mentee` (
  `email` varchar(45) NOT NULL,
  `mentee_type` varchar(100) NOT NULL,
  `degree` varchar(45) DEFAULT NULL,
  `year_of_grad` int(100) DEFAULT NULL,
  `mentor_email` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mentee`
--

INSERT INTO `mentee` (`email`, `mentee_type`, `degree`, `year_of_grad`, `mentor_email`) VALUES
('huimin1@hotmail.com', 'regular', 'Information Systems', 2011, 'huimin@hotmail.com'),
('y@smu.edu.sg', 'light', 'business', 2018, 'huimin@hotmail.com'),
('admin@smu.edu.sg', 'regular', 'SIS', 2, 'huimin@hotmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `mentor`
--

CREATE TABLE `mentor` (
  `email` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  `introduction` varchar(10000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mentor`
--

INSERT INTO `mentor` (`email`, `position`, `introduction`) VALUES
('huimin@hotmail.com', 'owner', 'I am the owner of bla bla bla company...');

-- --------------------------------------------------------

--
-- Table structure for table `program_stages`
--

CREATE TABLE `program_stages` (
  `stage_no` int(11) NOT NULL,
  `stage_name` varchar(125) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `program_stages`
--

INSERT INTO `program_stages` (`stage_no`, `stage_name`) VALUES
(1, 'Business Model Validation Stage'),
(2, 'Innovation Development Stage'),
(4, 'Business Plan/ Financial Modelling Stage'),
(3, 'Go-To-Market & Early Customer Acquisition Stage');

-- --------------------------------------------------------

--
-- Table structure for table `relationship`
--

CREATE TABLE `relationship` (
  `rls_id` int(100) NOT NULL,
  `company_id` int(100) NOT NULL,
  `mentor_email` varchar(45) NOT NULL,
  `type` varchar(1000) NOT NULL,
  `admin_email` varchar(45) DEFAULT NULL,
  `status` varchar(1000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relationship`
--

INSERT INTO `relationship` (`rls_id`, `company_id`, `mentor_email`, `type`, `admin_email`, `status`) VALUES
(1, 1, 'huimin@hotmail.com', 'open', NULL, 'requesting'),
(2, 2, 'huimin@hotmail.com', 'incubator', 'w@smu.edu.sg', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `task_id` int(11) NOT NULL,
  `task_name` varchar(125) NOT NULL,
  `task_description` varchar(200) NOT NULL,
  `task_deadline` datetime DEFAULT NULL,
  `program_stage` int(11) DEFAULT NULL,
  `company_id` int(100) DEFAULT NULL,
  `is_completed` char(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`task_id`, `task_name`, `task_description`, `task_deadline`, `program_stage`, `company_id`, `is_completed`) VALUES
(1, 'nsdklanvcq', 'csklnnvcan', '2017-07-16 00:00:00', 1, 1, 'Y'),
(2, 'fwebc', 'cnlkscna', '2012-09-08 00:00:00', 1, 2, 'Y'),
(3, 'dhqwok', 'cslknaln', '2003-08-07 00:00:00', 2, 1, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `nric` varchar(9) DEFAULT NULL,
  `profile_pic` varchar(2000) DEFAULT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  `company_id` int(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `password`, `name`, `nric`, `profile_pic`, `user_type`, `company_id`) VALUES
('kobebeef@msn.com', 'food', 'Kobe Beef1', 'S1234567Y', NULL, 'regular_mentee', 1),
('huimin@hotmail.com', 'abc123', 'hui min', 'S9818127U', 'starbucks-shiok-ah-ccino-frappuccino-drink.jpg', 'mentor', 0),
('huimin1@hotmail.com', 'abc1234', 'huimin1', 'S7657328Y', 'starbucks-shiok-ah-ccino-frappuccino-drink.jpg', 'mentee', 1),
('y@smu.edu.sg', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', NULL, 'S8887365O', NULL, 'mentee', 2),
('w@smu.edu.sg', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 'S1234567I', NULL, 'admin', 1),
('hello@hotmail.com', '3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'hello', 'S9272235Y', NULL, 'mentor', 0),
('hello123@hotmail.com', '3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'hello123', 'S9272235Y', NULL, 'light_mentee', 2),
('hello1234@hotmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'hello1234', 'S5672356U', NULL, 'light_mentee', 3),
('dsa@hotmail.coom', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'dsa', 'S8764567T', NULL, 'light_mentee', 2),
('h@abc.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'hi', 'S8755432T', NULL, 'light_mentee', 3),
('qss@hotmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'qbl', 'S5676534F', NULL, 'regular_mentee', 1),
('guniqa@hotmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'sum', 'S4567890I', NULL, 'light_mentee', 3),
('cab@hotmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'cab', 'S2346543U', NULL, 'regular_mentee', 1),
('ay@smu.edu.sg', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'hai', 'S7896543H', NULL, 'regular_mentee', 1),
('admin@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Jiatung Lim', 'S1112223J', NULL, 'mentee', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`meeting_id`);

--
-- Indexes for table `meeting_minutes`
--
ALTER TABLE `meeting_minutes`
  ADD PRIMARY KEY (`minutes_id`,`task_id`);

--
-- Indexes for table `mentee`
--
ALTER TABLE `mentee`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `program_stages`
--
ALTER TABLE `program_stages`
  ADD PRIMARY KEY (`stage_no`);

--
-- Indexes for table `relationship`
--
ALTER TABLE `relationship`
  ADD PRIMARY KEY (`rls_id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
