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

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `acquisition`, `bank_details`, `company`, `company_competition`, `company_costs`, `company_grant`, `company_investment`, `industry`, `meeting`, `meeting_minutes`, `mentee`, `mentor`, `mentor_preference`, `mentor_rating`, `payment_voucher`, `predefined_task`, `program_stages`, `relationship`, `skills`, `task`, `user`, `contract`, `skills_set`;
SET FOREIGN_KEY_CHECKS = 1;

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
  `company_logo` mediumblob,
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
-- Table structure for table `mentor`
--

DROP TABLE IF EXISTS `mentor`;
CREATE TABLE IF NOT EXISTS `mentor` (
  `email` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  `introduction` varchar(10000) NOT NULL,
  `skills` varchar(10000) NOT NULL,
  `bank_account` varchar(20) NOT NULL,
  PRIMARY KEY (`email`, `bank_account`),
  CONSTRAINT `mentor_user_email` FOREIGN KEY (`email`) REFERENCES `user` (`email`)
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
  `mentor_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `mentee_user_email` FOREIGN KEY (`email`) REFERENCES `user` (`email`),
  CONSTRAINT `mentee_mentor_email` FOREIGN KEY (`mentor_email`) REFERENCES `mentor` (`email`)
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
  `mentor` varchar(100) NOT NULL,
  `task_id` int(11) NOT NULL,
  `comment` varchar(10000) NOT NULL,
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
  `start_period` date NOT NULL,
  `end_period` date NOT NULL,
  `payment_type` varchar(200),
  `delivery` varchar(200),
  `amount` double NOT NULL,
  `cost_centre` varchar(200),
  `gst` varchar(200),
  `order` varchar(200),
  PRIMARY KEY (`voucher_id`),
  CONSTRAINT `voucher_mentor` FOREIGN KEY (`mentor_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank_account`
--

DROP TABLE IF EXISTS `bank_details`;
CREATE TABLE IF NOT EXISTS `bank_details` (
  `account_number` varchar(20) NOT NULL,
  `account_name` varchar(200) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `swift_code` varchar(200) NOT NULL,
  `bank_address` varchar(200) NOT NULL,
  PRIMARY KEY (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
CREATE TABLE IF NOT EXISTS `contract` (
  `rls_id` int(11) NOT NULL,
  `contract_file` mediumblob NOT NULL,
  PRIMARY KEY (`rls_id`),
  CONSTRAINT `contract_rls_id` FOREIGN KEY (`rls_id`) REFERENCES `relationship` (`rls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skills_set`
--

DROP TABLE IF EXISTS `skills_set`;
CREATE TABLE IF NOT EXISTS `skills_set` (
  `skill_id` int(11) NOT NULL,
  `skill_name` varchar(125) NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `founders`) VALUES
(0, 'Administrators of Singapore Management University Institute of Innovation & Entrepreneurship (IIE)', 'shirley.wong@tnfventures.com,robyntan@smu.edu.sg');

INSERT INTO `company` (`company_id`, `company_name`, `founders`) VALUES
(56025, 'A*STAR, Singapore', 'lux@i2r.a-star.edu.sg'),
(85138, 'Ad2Engage', 'alexandreyokoyama@gmail.com'),
(18220, 'ImpacTech', 'yoav@impactech.co'),
(31308, 'GfK Digital Operations', 'raj.home@gmail.com');

INSERT INTO `company` (`company_id`, `company_name`, `founders`, `start_date`) VALUES
(426447238, 'Bondevalue Pte Ltd', 'rahul.banerjee@bondevalue.com', '2017-08-03 00:00:00'),
(428269201, 'Tripbunny (Kaja Pte Ltd)', 'joshua@tripbunny.co,sebastian@tripbunny.co,yihao@tripbunny.co', '2017-08-03 00:00:00'),
(427959677, 'Huuve', 'jae.lee.2015@ddptechmgt.smu.edu.sg,marc.lee.2013@business.smu.edu.sg', '2017-08-03 00:00:00'),
(429508846, 'HFC Pte Ltd (Haste)', 'fufei@hastehfc.com,mervinho@hastehfc.com,robinthor@outlook.com', '2017-08-03 00:00:00'),
(424951410, 'Cuzzey', 'dewei@cuzzey.com,jazz@cuzzey.com', '2017-08-03 00:00:00');

INSERT INTO `company` (`company_id`, `company_name`, `founders`, `start_date`) VALUES
(79135, 'Testing Pte Ltd', 'yanmin.tay.2015@smu.edu.sg,huimin.sim.2015@smu.edu.sg,xinyao.nie.2015@smu.edu.sg,jiatung.lim.2014@smu.edu.sg,jngadiman.2014@smu.edu.sg', '2017-09-08 19:38:34');

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `password`, `company_id`, `user_type`, `joined_date`) VALUES
('smuiie.admin.eir@gmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 0, 'admin_eir', '2000-01-01');
INSERT INTO `user` (`email`, `password`, `company_id`, `user_type`, `joined_date`) VALUES
('smuiie.admin.im@gmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 0, 'admin_im', '2000-01-01');

INSERT INTO `user` (`email`, `password`, `company_id`, `user_type`, `joined_date`) VALUES
('rahul.banerjee@bondevalue.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 426447238, 'regular_mentee', '2017-08-03'),
('joshua@tripbunny.co', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 428269201, 'regular_mentee', '2017-08-03'),
('sebastian@tripbunny.co', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 428269201, 'regular_mentee', '2017-08-03'),
('yihao@tripbunny.co', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 428269201, 'regular_mentee', '2017-08-03'),
('jae.lee.2015@ddptechmgt.smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 427959677, 'regular_mentee', '2017-08-03'),
('marc.lee.2013@business.smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 427959677, 'regular_mentee', '2017-08-03'),
('fufei@hastehfc.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 429508846, 'regular_mentee', '2017-08-03'),
('mervinho@hastehfc.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 429508846), 'regular_mentee', '2017-08-03',
('robinthor@outlook.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 429508846, 'regular_mentee', '2017-08-03'),
('dewei@cuzzey.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 424951410, 'regular_mentee', '2017-08-03'),
('jazz@cuzzey.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 424951410, 'regular_mentee', '2017-08-03');
INSERT INTO `user` (`email`, `password`, `company_id`, `user_type`, `joined_date`) VALUES
('yanmin.tay.2015@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 79135, 'regular_mentee', '2017-09-18'),
('huimin.sim.2015@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 79135, 'regular_mentee', '2017-09-18'),
('xinyao.nie.2015@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 79135, 'regular_mentee', '2017-09-18'),
('jiatung.lim.2014@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 79135, 'regular_mentee', '2017-09-18'),
('jngadiman.2014@smu.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 79135, 'regular_mentee', '2017-09-18');

INSERT INTO `user` (`email`, `password`, `company_id`) VALUES
('lux@i2r.a-star.edu.sg', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 56025),
('alexandreyokoyama@gmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 85138),
('yoav@impactech.co', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 18220),
('raj.home@gmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 31308);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;