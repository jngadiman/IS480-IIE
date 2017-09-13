-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2017 at 12:54 PM
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

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `company_id` int(100) NOT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `company_description` varchar(200) DEFAULT NULL,
  `founders` varchar(3000) NOT NULL,
  `num_fulltime` int(255) DEFAULT NULL,
  `num_parttime` int(255) DEFAULT NULL,
  `industry` int(45) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `current_stage` int(11) DEFAULT NULL,
  `company_logo` mediumblob DEFAULT NULL,
  `product_differentiation` varchar(3000) DEFAULT NULL,
  `revenue_model` varchar(3000) DEFAULT NULL,
  `traction` varchar(3000) DEFAULT NULL,
  `deployment_of_funds` varchar(3000) DEFAULT NULL,
  `acra_file` mediumblob DEFAULT NULL,
  `business_slides` mediumblob DEFAULT NULL,
  `agreement_form` mediumblob DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `nric` varchar(9) DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `profile_pic` mediumblob,
  `user_type` varchar(45) DEFAULT NULL,
  `company_id` int(100) NOT NULL,
  `position` varchar(30) DEFAULT NULL,
  `equity_percentage` int(3) DEFAULT NULL,
  `contact_number` int(20) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mentee`
--

DROP TABLE IF EXISTS `mentee`;
CREATE TABLE IF NOT EXISTS `mentee` (
  `email` varchar(45) NOT NULL,
  `degree` varchar(45) DEFAULT NULL,
  `year_of_grad` int(100) DEFAULT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `mentee_user_email` FOREIGN KEY (`email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mentor`
--

DROP TABLE IF EXISTS `mentor`;
CREATE TABLE IF NOT EXISTS `mentor` (
  `email` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  `introduction` varchar(10000) NOT NULL,
  `skills` varchar(10000) NOT NULL,
  `bank_account` varchar(20) NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `mentor_user_email` FOREIGN KEY (`email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------
--
-- Table structure for table `predefined_task`
--

DROP TABLE IF EXISTS `predefined_task`;
CREATE TABLE IF NOT EXISTS `predefined_task` (
  `task_id` int(11) NOT NULL,
  `task_name` varchar(125) NOT NULL,
  `program_stage` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------
--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
CREATE TABLE IF NOT EXISTS `skills` (
  `skill_id` int(11) NOT NULL,
  `skill_name` varchar(125) NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
CREATE TABLE IF NOT EXISTS `meeting` (
  `meeting_id` int(100) NOT NULL,
  `meeting_name` varchar(120) NOT NULL,
  `meeting_type` varchar(120) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `attendees` varchar(500) NOT NULL,
  `status` varchar(8) NOT NULL,
  `mentee_company_id` int(100) NOT NULL,
  PRIMARY KEY (`meeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `program_stages`
--

DROP TABLE IF EXISTS `program_stages`;
CREATE TABLE IF NOT EXISTS `program_stages` (
  `stage_no` int(11) NOT NULL,
  `stage_name` varchar(125) NOT NULL,
  PRIMARY KEY (`stage_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `industry`
--

DROP TABLE IF EXISTS `industry`;
CREATE TABLE IF NOT EXISTS `industry` (
  `industry_code` varchar(20) NOT NULL,
  `industry_name` varchar(200) NOT NULL,
  PRIMARY KEY (`industry_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE IF NOT EXISTS `task` (
  `task_id` int(11) NOT NULL,
  `task_name` varchar(125) NOT NULL,
  `task_deadline` datetime DEFAULT NULL,
  `program_stage` int(11) DEFAULT NULL,
  `company_id` int(100) NOT NULL,
  `is_completed` char(2) DEFAULT NULL,
  PRIMARY KEY (`task_id`, `company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company_competition`
--

DROP TABLE IF EXISTS `company_competition`;
CREATE TABLE IF NOT EXISTS `company_competition` (
  `company_id` int(100) NOT NULL,
  `competition_name` varchar(200) NOT NULL,
  `competition_date` date DEFAULT NULL,
  `prize_amount` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`company_id`, `competition_name`),
  CONSTRAINT `competition_cid` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company_costs`
--

DROP TABLE IF EXISTS `company_costs`;
CREATE TABLE IF NOT EXISTS `company_costs` (
  `company_id` int(100) NOT NULL,
  `year` date NOT NULL,
  `paid_up_capital` decimal(20,2) DEFAULT NULL,
  `rev_q1` decimal(20,2) DEFAULT NULL,
  `rev_q2` decimal(20,2) DEFAULT NULL,
  `rev_q3` decimal(20,2) DEFAULT NULL,
  `rev_q4` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`company_id`, `year`),
  CONSTRAINT `costs_cid` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company_grant`
--

DROP TABLE IF EXISTS `company_grant`;
CREATE TABLE IF NOT EXISTS `company_grant` (
  `company_id` int(100) NOT NULL,
  `grant_name` varchar(200) NOT NULL,
  `grant_date` date NOT NULL,
  `grant_amount` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`company_id`, `grant_name`, `grant_date`),
  CONSTRAINT `grant_cid` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company_investment`
--

DROP TABLE IF EXISTS `company_investment`;
CREATE TABLE IF NOT EXISTS `company_investment` (
  `company_id` int(100) NOT NULL,
  `investor` varchar(200) NOT NULL,
  `investment_stage` int(100) DEFAULT NULL,
  `investment_date` date DEFAULT NULL,
  `investment_amount` decimal(20,2) DEFAULT NULL,
  `investment_valuation` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`company_id`, `investor`),
  CONSTRAINT `investment_cid` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_minutes`
--

DROP TABLE IF EXISTS `meeting_minutes`;
CREATE TABLE IF NOT EXISTS `meeting_minutes` (
  `minutes_id` int(100) NOT NULL,
  `title` varchar(120) NOT NULL,
  `meeting_id` int(100) NOT NULL,
  `mentor` varchar(100) DEFAULT NULL,
  `task_id` int(11) NOT NULL,
  `comment` varchar(65535) DEFAULT NULL,
  `submitted_user` varchar(100) NOT NULL,
  PRIMARY KEY (`minutes_id`,`task_id`,`meeting_id`),
  CONSTRAINT `minutes_tid` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`),
  CONSTRAINT `minutes_mid` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`meeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mentor_preference`
--

DROP TABLE IF EXISTS `mentor_preference`;
CREATE TABLE IF NOT EXISTS `mentor_preference` (
  `company_id` int(100) NOT NULL,
  `mentor_email` varchar(45) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  PRIMARY KEY (`company_id`, `mentor_email`),
  CONSTRAINT `mentor_email` FOREIGN KEY (`mentor_email`) REFERENCES `user` (`email`),
  CONSTRAINT `mentee_cid` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mentor_rating`
--

DROP TABLE IF EXISTS `mentor_rating`;
CREATE TABLE IF NOT EXISTS `mentor_rating` (
  `rating_id` int(100) NOT NULL,
  `title` varchar(120) NOT NULL,
  `meeting_id` int(100) NOT NULL,
  `mentor` varchar(100) NOT NULL,
  `rating` int(100) NOT NULL,
  `comment` int(150) NOT NULL,
  `submitted_user` varchar(100) NOT NULL,
  PRIMARY KEY (`rating_id`),
  CONSTRAINT `rating_mentor` FOREIGN KEY (`mentor`) REFERENCES `user` (`email`),
  CONSTRAINT `rating_mentee` FOREIGN KEY (`submitted_user`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `relationship`
--

DROP TABLE IF EXISTS `relationship`;
CREATE TABLE IF NOT EXISTS `relationship` (
  `rls_id` int(100) NOT NULL,
  `company_id` int(100) NOT NULL,
  `mentor_email` varchar(45) NOT NULL,
  `type` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`rls_id`),
  CONSTRAINT `relationship_mentor` FOREIGN KEY (`mentor_email`) REFERENCES `user` (`email`),
  CONSTRAINT `relationship_cid` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `acquisition`
--

DROP TABLE IF EXISTS `acquisition`;
CREATE TABLE IF NOT EXISTS `acquisition` (
  `company_id` int(100) NOT NULL,
  `acquired_name` varchar(100) NOT NULL,
  `acquired_date` date NOT NULL,
  `acquired_amount` decimal(20,2) NOT NULL,
  `acquired_type` varchar(100) NOT NULL,
  PRIMARY KEY (`company_id`),
  CONSTRAINT `acquisition_cid` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_voucher`
--

DROP TABLE IF EXISTS `payment_voucher`;
CREATE TABLE IF NOT EXISTS `payment_voucher` (
  `voucher_id` int(255) NOT NULL,
  `mentor_email` varchar(45) NOT NULL,
  `mentee_company_id` int(100) NOT NULL,
  `start_date` date,
  `end_date` date,
  `payment_type` varchar(200),
  `delivery_type` varchar(200),
  `amount` decimal(20,2),
  `cost_centre` varchar(200),
  `gst` varchar(200),
  `order` varchar(200),
  PRIMARY KEY (`voucher_id`),
  CONSTRAINT `voucher_mentor` FOREIGN KEY (`mentor_email`) REFERENCES `user` (`email`),
  CONSTRAINT `voucher_cid` FOREIGN KEY (`mentee_company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank_account`
--

DROP TABLE IF EXISTS `bank_account_details`;
CREATE TABLE IF NOT EXISTS `bank_account_details` (
  `account_number` varchar(20) NOT NULL,
  `account_name` varchar(200) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `swift_code` varchar(200) NOT NULL,
  `bank_address` varchar(200) NOT NULL,
  PRIMARY KEY (`account_number`),
  CONSTRAINT `bank_account_number` FOREIGN KEY (`account_number`) REFERENCES `mentor` (`bank_account`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_description`, `stakeholders`, `num_fulltime`, `num_parttime`, `industry`, `start_date`, `current_stage`) VALUES
(2, 'iPear Private Limited', 'Founded in 2011, iPear is set up by co-founders Janet and Yvonne. ', 'yvonne.tan.2011@smu.edu.sg,janet.lee.2011@smu.edu.sg', 10, 5, 0, '2011-12-12 00:00:00', 1),
(3, 'Traveline', 'Traveline is a Travel agency which already has flights around SEA', 'b.wee.2008@smu.edu.sg,george.kim.2010@smu.edu.sg', 15, 15, 0, '2008-04-03 00:00:00', 2),
(4, 'Cosmos Private Limited', 'Cosmos delivers the best facial products and cosmestics.', 'j.mabeline.2009@smu.edu.sg', 2, 30, 0, '2015-06-07 00:00:00', 1),
(1, 'Singapore Management University', 'Singapore Management University is a University in Singapore that specializes in business and management studies.', 'admin@smu.edu.sg', 300, 200, 0, '2000-01-01 00:00:00', 4),
(5, 'Foley Tan Group Pte Ltd', 'To empower tangible business growth for SMEs and PLCs through access to C-level resources.', 'mentor1@hotmail.com,mentor2@hotmail.com,mentor3@hotmail.com', 3000, 1000, 0, '2012-01-01 00:00:00', 4),
(7, 'Incognito Muffins', 'To bake the best muffins in the world.', 'jiatung.lim.2014@smu.edu.sg,jngadiman.2014@smu.edu.sg,huimin.sim.2015@smu.edu.sg,xinyao.nie.2015@smu.edu.sg,yanmin.tay.2015@smu.edu.sg', 5, 0, 0, '2015-04-03 00:00:00', 1)
;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `password`, `name`, `nric`, `user_type`, `company_id`, `position`, `contact_number`, `nationality`) VALUES
('admin@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Adeline Tan', 'S1234567A', 'admin', 1, '0', 97762886, 'Singaporean');
INSERT INTO `user` (`email`, `password`, `name`, `nric`, `user_type`, `company_id`, `position`, `contact_number`, `nationality`) VALUES
('mentor1@hotmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Andrew Jones', '922-18-4103', 'Incubation Mentor', 5, 'Founder', 83740286, 'American');
INSERT INTO `user` (`email`, `password`, `name`, `nric`, `user_type`, `company_id`, `position`, `contact_number`, `nationality`) VALUES
('mentor2@hotmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Sim Jia Min', 'S8645283F', 'Incubation Mentor', 5, 'Senior Manager', 98035991, 'Singaporean');
INSERT INTO `user` (`email`, `password`, `name`, `nric`, `user_type`, `company_id`, `position`, `contact_number`, `nationality`) VALUES
('mentor3@hotmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Matthew Foley', '672-376-0427', 'Incubation Mentor', 5, 'Finance Consultant', 98586923, 'British');
INSERT INTO `user` (`email`, `password`, `name`, `nric`, `user_type`, `company_id`, `position`, `contact_number`, `nationality`) VALUES
('yvonne.tan.2011@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Yvonne Tan', 'S9542431G', 'regular_mentee', 2, 'Founder', 96257246, 'Singaporean');
INSERT INTO `user` (`email`, `password`, `name`, `nric`, `user_type`, `company_id`, `position`, `contact_number`, `nationality`) VALUES
('janet.lee.2011@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Janet Lee', 'S9287656J', 'regular_mentee', 2, 'Founder', 87749739, 'Singaporean');
INSERT INTO `user` (`email`, `password`, `name`, `nric`, `user_type`, `company_id`, `position`, `contact_number`, `nationality`) VALUES
('b.wee.2008@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Benjamin Wee', 'S9261531H', 'regular_mentee', 3, 'Founder', 88867358, 'Singaporean');
INSERT INTO `user` (`email`, `password`, `name`, `nric`, `user_type`, `company_id`, `position`, `contact_number`, `nationality`) VALUES
('george.kim.2010@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'George Kim', 'S9301840K', 'regular_mentee', 3, 'Marketing Manager', 87749739, 'Singaporean');
INSERT INTO `user` (`email`, `password`, `name`, `nric`, `user_type`, `company_id`, `position`, `contact_number`, `nationality`) VALUES
('j.mabeline.2009@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Jessica Mabeline', 'S9387656L', 'regular_mentee', 4, 'Founder', 87749739, 'Singaporean');

INSERT INTO `user` (`email`, `password`, `name`, `nric`, `user_type`, `company_id`, `position`, `contact_number`, `nationality`) VALUES
('jngadiman.2014@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Jenneder Ngadiman', 'S9654963A', 'light_mentee', 7, 'UX Designer', 91261745, 'Singaporean'),
('jiatung.lim.2014@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Lim Jia Tung', 'S9639562B', 'light_mentee', 7, 'Quality Assurance', 91261719, 'Singaporean'),
('xinyao.nie.2015@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Nie Xin Yao', 'S9648653C', 'light_mentee', 7, 'Lead Front End', 91261704, 'Singaporean'),
('huimin.sim.2015@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Sim Hui Min', 'S9676592D', 'light_mentee', 7, 'Lead Back End', 91261763, 'Singaporean'),
('yanmin.tay.2015@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Tay Yan Min', 'S9517375E', 'light_mentee', 7, 'Project Manager', 91261797, 'Singaporean')
;

--
-- Dumping data for table `mentee`
--

INSERT INTO `mentee` (`email`, `degree`, `year_of_grad`, `mentor_email`) VALUES
('yvonne.tan.2011@smu.edu.sg', 'Business', 2015, NULL),
('janet.lee.2011@smu.edu.sg', 'Information', 2015, NULL),
('george.kim.2010@smu.edu.sg', 'Business', 2014, 'mentor3@hotmail.com'),
('j.mabeline.2009@smu.edu.sg', 'Business', 2013, NULL),
('b.wee.2008@smu.edu.sg', 'Information', 2012, 'mentor3@hotmail.com');

--
-- Dumping data for table `mentor`
--

INSERT INTO `mentor` (`email`, `position`, `introduction`, `skills`, `bank_account`) VALUES
('mentor1@hotmail.com', 'Co-Founder, Chief Brand Officer', 'Experience\na) Reebonz (Oct 2008-Present)\nb) Credit Suisse (Aug 2008-Dec2008)\nc) eFsuion (Jun 2006-Aug 2006)\n\nHighest Qualification - BBM\n\nhttps://www.linkedin.com/in/reebonz/?ppe=1\n', 'E-commerce, Branding & Marketing', ''),
('mentor2@hotmail.com', 'Co-founder and CEO', 'a) e27 (2011-Present)\nb) Little Lives (2011-12)\nc) Gokil Games (2010-11)\n\nHighest Qualification - Bachelors in Computer Engineering\n\nhttps://www.linkedin.com/in/mohanbelani/?ppe=1', 'Business Development, Business Strategy, Product Management', ''),
('mentor3@hotmail.com', 'Managing Director', 'a) The Wicked Quiz (2006-Present)\nb) Originally U.S. (2014-Present)\n\nHighest Qualification - Bachelors, Information Systems Management\n\nhttps://www.linkedin.com/in/tayweikiat/?ppe=1', 'Digital Marketing', '');

--
-- Dumping data for table `predefined_task`
--

INSERT INTO `predefined_task` (`task_id`, `task_name`, `program_stage`) VALUES
(101, 'Validate Business Model Canvas', 1),
(102, 'Competitor Analysis', 1),
(103, 'Market Sizing', 1),
(104, 'Define Target Audience', 1),
(105, 'Ensure Product-Market-Fit (Value proposition for identified target audience)', 1),
(106, 'Define Revenue Model', 1),
(107, 'Define Distribution Channels', 1),
(201, 'Define Key Features', 2),
(202, 'Product/Service Architecture', 2),
(203, 'Base & Technologies/Platform', 2),
(204, 'Product Road Map', 2),
(205, 'Beta Test Plan', 2),
(206, 'Key Metrics To Exit ID', 2),
(207, 'Minimum Viable Product', 2),
(301, 'Identify Early Adopters', 3),
(302, 'Proof Of Concept (POC) – Market Validation', 3),
(303, 'Key Customer Adoption/Acquisition Metrics', 3),
(304, 'Market Segmentation/Marketing Plan (Both Online & Offline)', 3),
(305, 'Growth Hacking Strategy', 3),
(306, 'Sales Process (Direct/Partner/Reseller/Channels)', 3),
(307, 'Pricing Strategy', 3),
(308, 'Replicable Process For Customer Acquisition', 3),
(401, 'Pitch Deck On Growth Strategy', 4),
(402, 'Pitch Deck On Financial Model', 4),
(403, 'Pitch Deck On Business Plan', 4),
(404, 'Pitch Deck On Investment Requirement/Use Of Funds', 4),
(405, 'Pitch Deck On Valuation', 4),
(406, 'Investment Term Sheet & Negotiation', 4)
;

--
-- Dumping data for table `meeting`
--

INSERT INTO `meeting` (`meeting_id`, `meeting_name`, `meeting_type`, `start_time`, `end_time`, `attendees`, `status`, `mentee_company_id`) VALUES
(1, 'Meeting #1', 'Incubation', '2017-08-31 19:35:43', '2017-08-31 20:55:23', 'yvonne.tan.2011@smu.edu.sg,mentor3@hotmail.com', 'accepted', 2),
(2, 'Meeting #2', 'Incubation', '2017-09-04 00:00:00', '2017-09-05 00:00:00', 'mentor3@hotmail.com, b2utylovesb2st@hotmail.com', 'accepted', 10),
(3, 'Meeing #3', 'Incubation', '2017-09-05 00:00:00', '2017-09-06 00:00:00', 'mentor3@hotmail.com, b.wee.2008@smu.edu.sg', 'accepted', 3);

--
-- Dumping data for table `program_stages`
--

INSERT INTO `program_stages` (`stage_no`, `stage_name`) VALUES
(1, 'Business Model Validation Stage'),
(2, 'Innovation Development Stage'),
(3, 'Go-To-Market & Early Customer Acquisition Stage'),
(4, 'Business Plan/ Financial Modelling Stage');

--
-- Dumping data for table `industry`
--

INSERT INTO `industry` (`industry_code`, `industry_name`) VALUES
('101010', 'Energy Equipment & Services'),
('101020', 'Oil, Gas & Consumable Fuels'),
('151010', 'Chemicals'),
('151020', 'Construction Materials'),
('151030', 'Containers & Packaging'),
('151040', 'Metals & Mining'),
('151050', 'Paper & Forest Products'),
('201010', 'Aerospace & Defense'),
('201020', 'Building Products'),
('201030', 'Construction & Engineering'),
('201040', 'Electrical Equipment'),
('201050', 'Industrial Conglomerates'),
('201060', 'Machinery'),
('201070', 'Trading Companies & Distributors'),
('202010', 'Commercial Services & Supplies'),
('202020', 'Professional Services'),
('203010', 'Air Freight & Logistics'),
('203020', 'Airlines'),
('203030', 'Marine'),
('203040', 'Road & Rail'),
('203050', 'Transportation Infrastructure'),
('251010', 'Auto Components'),
('251020', 'Automobiles'),
('252010', 'Household Durables'),
('252020', 'Leisure Products'),
('252030', 'Textiles, Apparel & Luxury Goods'),
('253010', 'Hotels, Restaurants & Leisure'),
('253020', 'Diversified Consumer Services'),
('254010', 'Media'),
('255010', 'Distributors'),
('255020', 'Internet & Direct Marketing Retail'),
('255030', 'Multiline Retail'),
('255040', 'Specialty Retail'),
('301010', 'Food & Staples Retailing'),
('302010', 'Beverages'),
('302020', 'Food Products'),
('302030', 'Tobacco'),
('303010', 'Household Products'),
('303020', 'Personal Products'),
('351010', 'Health Care Equipment & Supplies'),
('351020', 'Health Care Providers & Services'),
('351030', 'Health Care Technology'),
('352010', 'Biotechnology'),
('352020', 'Pharmaceuticals'),
('352030', 'Life Sciences Tools & Services'),
('401010', 'Banks'),
('401020', 'Thrifts & Mortgage Finance'),
('402010', 'Diversified Financial Services'),
('402020', 'Consumer Finance'),
('402030', 'Capital Markets'),
('402040', 'Mortgage Real Estate Investment Trusts (REITs),'),
('403010', 'Insurance'),
('451010', 'Internet Software & Services'),
('451020', 'IT Services'),
('451030', 'Software'),
('452010', 'Communications Equipment'),
('452020', 'Technology Hardware, Storage & Peripherals'),
('452030', 'Electronic Equipment, Instruments & Components'),
('453010', 'Semiconductors & Semiconductor Equipment'),
('501010', 'Diversified Telecommunication Services'),
('501020', 'Wireless Telecommunication Services'),
('551010', 'Electric Utilities'),
('551020', 'Gas Utilities'),
('551030', 'Multi-Utilities'),
('551040', 'Water Utilities'),
('551050', 'Independent Power and Renewable Electricity Producers'),
('601010', 'Equity Real Estate Investment Trusts (REITs)'),
('601020', 'Real Estate Management & Development')
;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`task_id`, `task_name`, `task_deadline`, `program_stage`, `company_id`, `is_completed`) VALUES
(108, 'Meet Mentor', NULL, 1, 0, NULL);

--
-- Dumping data for table `company_competition`
--

INSERT INTO `company_competition` (`company_id`, `competition_name`, `competition_date`, `prize_amount`) VALUES
(1, 'Big Sound Festival 2016', '2016-05-14', '6500.00'),
(1, 'Save The Environment 2016', '2016-06-13', '7000.00'),
(1, 'The Get Together 2016', '2016-07-22', '8500.00'),
(1, 'The Great Chilli Competition 2016', '2016-02-06', '5000.00'),
(1, 'The Ultimate Business Compeition 2016', '2016-07-31', '10000.00');

--
-- Dumping data for table `company_costs`
--

INSERT INTO `company_costs` (`company_id`, `year`, `paid_up_capital`, `rev_q1`, `rev_q2`, `rev_q3`, `rev_q4`) VALUES
(2, '2016-01-01', '20000.00', '3200.00', '1000.00', '4600.00', '3520.00');

--
-- Dumping data for table `company_grant`
--

INSERT INTO `company_grant` (`company_id`, `grant_name`, `grant_date`, `grant_amount`) VALUES
(1, 'EzTech Research Foundation', '2016-04-30', '2000.00'),
(1, 'Singapore Teaching Materials Grant', '2016-03-14', '1000.00'),
(1, 'Wonder League Competition', '2016-11-14', '3000.00');

--
-- Dumping data for table `company_investment`
--

INSERT INTO `company_investment` (`company_id`, `investor`, `investment_stage`, `investment_date`, `investment_amount`, `investment_valuation`) VALUES
(1, 'Master of Business Applications', NULL, '2016-03-14', '100000.00', ''),
(2, 'uGrape', NULL, '2016-08-15', '200000.00', ''),
(3, 'HotelStay', NULL, '2016-11-04', '3000.00', '');

--
-- Dumping data for table `meeting_minutes`
--

INSERT INTO `meeting_minutes` (`minutes_id`, `title`, `meeting_id`, `mentor`, `task_id`, `comment`, `submitted_user`) VALUES
(1, 'Meeting #1', 1, 'mentor2@hotmail.com', 1, 'well done', 'b.wee.2008@smu.edu.sg'),
(2, 'Meeting #2', 2, 'mentor3@hotmail.com', 2, 'good job', 'b2utylovesb2st@hotmail.com'),
(2, 'Meeting #2', 2, 'mentor3@hotmail.com', 4, 'done', 'b2utylovesb2st@hotmail.com'),
(3, 'Meeting #3', 3, 'mentor3@hotmail.com', 2, 'done', 'b.wee.2008@smu.edu.sg');

--
-- Dumping data for table `mentor_preference`
--

INSERT INTO `mentor_preference` (`company_id`, `mentor_email`, `start_date`, `end_date`, `need`, `date_sent`) VALUES
(1, 'mentor1@hotmail.com', '2017-09-01', '2017-09-02', 'Revenue Model', NULL),
(2, 'mentor3@hotmail.com', '2017-09-03', '2017-09-07', 'Investment', NULL),
(3, 'mentor2@hotmail.com', '2017-09-13', '2017-09-15', 'Differentiation of Product', NULL),
(4, 'mentor3@hotmail.com', '2017-09-11', '2017-09-13', 'Revenue Model', '2017-09-05 16:02:20'),
(5, 'mentor1@hotmail.com', NULL, NULL, 'Deployment of Funds', '2017-09-09 00:00:00');

--
-- Dumping data for table `relationship`
--

INSERT INTO `relationship` (`rls_id`, `company_id`, `mentor_email`, `type`, `start_date`, `end_date`, `status`) VALUES
(1, 2, 'mentor2@hotmail.com', 'incubator', NULL, NULL, 'requesting'),
(2, 8, 'mentor3@hotmail.com', 'incubator', NULL, NULL, 'assigned'),
(3, 9, 'mentor1@hotmail.com', 'incubator', NULL, NULL, 'requesting'),
(4, 10, 'mentor3@hotmail.com', 'incubation', '2017-09-06', '2017-09-07', 'over'),
(5, 11, 'mentor2@hotmail.com', 'incubation', '2017-09-07', '2017-09-15', 'over'),
(6, 12, 'mentor1@hotmail.com', 'incubation', '2017-09-06', '2017-09-09', 'over'),
(7, 7, 'mentor2@hotmail.com', 'incubation', '2017-09-04', '2017-09-08', 'over');

--
-- Dumping data for table `acquisition`
--

INSERT INTO `acquisition` (`company_id`, `acquired_name`, `acquired_date`, `acquired_amount`, `acquired_type`) VALUES
(4, 'Wandas Private Limited', '2016-11-30', '6500.00', 'exit_by_sale'),
(5, 'Pully Ten Limited', '2016-10-31', '8500.00', 'public_offerings');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;