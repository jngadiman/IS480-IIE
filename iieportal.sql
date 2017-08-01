-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2017 at 03:16 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `iieportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `company_id` int(100) NOT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `company_description` varchar(200) DEFAULT NULL,
  `vision` varchar(100) DEFAULT NULL,
  `mission` varchar(100) DEFAULT NULL,
  `industry` varchar(45) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `current_stage` int(11) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_description`, `vision`, `mission`, `industry`, `start_date`, `current_stage`) VALUES
(1, 'kfc', 'sells chicken', 'to sell as many chicken as possible', 'to sell the best quality chicken ever!', 'FnB', '2017-07-23 01:28:35', 1),
(0, 'ntuc', 'sells grocery', 'to be able to sell grocery everywhere', 'to bring you the best quality foods to you', 'FnB', '2012-07-09 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE IF NOT EXISTS `meeting` (
  `meeting_id` int(100) NOT NULL,
  `meeting_name` varchar(120) NOT NULL,
  `meeting_type` varchar(120) NOT NULL,
  `start_time` date NOT NULL,
  `end_time` date NOT NULL,
  `attendees` varchar(500) NOT NULL,
  `status` varchar(8) NOT NULL,
  PRIMARY KEY (`meeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_minutes`
--

CREATE TABLE IF NOT EXISTS `meeting_minutes` (
  `minutes_id` int(100) NOT NULL,
  `title` varchar(120) NOT NULL,
  `meeting_id` int(100) NOT NULL,
  `mentor_id` int(60) NOT NULL,
  `task_id` int(100) NOT NULL,
  `comment` varchar(150) NOT NULL,
  `submitted_user` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mentee`
--

CREATE TABLE IF NOT EXISTS `mentee` (
  `username` varchar(45) NOT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  `company_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `program_stages`
--

CREATE TABLE IF NOT EXISTS `program_stages` (
  `stage_no` int(11) NOT NULL,
  `stage_name` varchar(125) NOT NULL,
  PRIMARY KEY (`stage_no`)
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
-- Table structure for table `task`
--

CREATE TABLE IF NOT EXISTS `task` (
  `task_id` int(11) NOT NULL,
  `task_name` varchar(125) NOT NULL,
  `task_description` varchar(200) NOT NULL,
  `task_deadline` datetime DEFAULT NULL,
  `program_stage` int(11) DEFAULT NULL,
  `company_id` int(100) DEFAULT NULL,
  `is_completed` char(2) DEFAULT NULL,
  PRIMARY KEY (`task_id`)
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

CREATE TABLE IF NOT EXISTS `user` (
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `nric` varchar(9) DEFAULT NULL,
  `profile_pic` varchar(2000) DEFAULT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  `company_id` int(100) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `password`, `name`, `nric`, `profile_pic`, `user_type`, `company_id`) VALUES
('kobebeef@msn.com', 'food', 'Kobe Beef1', 'S1234567Y', NULL, 'regular_mentee', 1),
('huimin@hotmail.com', 'abc123', 'hui min', 'S9818127U', NULL, 'mentor', 0),
('huimin1@hotmail.com', 'abc1234', 'huimin1', 'S7657328Y', NULL, 'regular_mentee', 0),
('y@smu.edu.sg', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', NULL, 'S8887365O', NULL, 'light_mentee', 0),
('w@smu.edu.sg', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 'S1234567I', NULL, 'regular_mentee', 0),
('hello@hotmail.com', '3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'hello', 'S9272235Y', NULL, 'mentor', 0),
('hello123@hotmail.com', '3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'hello123', 'S9272235Y', NULL, 'light_mentee', 0),
('hello1234@hotmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'hello1234', 'S5672356U', NULL, 'light_mentee', 0),
('dsa@hotmail.coom', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'dsa', 'S8764567T', NULL, 'light_mentee', 0),
('h@abc.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'hi', 'S8755432T', NULL, 'light_mentee', 0),
('qss@hotmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'qbl', 'S5676534F', NULL, 'regular_mentee', 0),
('guniqa@hotmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'sum', 'S4567890I', NULL, 'light_mentee', 0),
('cab@hotmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'cab', 'S2346543U', NULL, 'regular_mentee', 0),
('ay@smu.edu.sg', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'hai', 'S7896543H', NULL, 'regular_mentee', 0),
('admin@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Jiatung Lim', 'S1112223J', NULL, 'light_mentee', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
