-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2019 at 04:38 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

CREATE TABLE `candidate` (
  `cid` int(5) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pword` varchar(5) NOT NULL,
  `status` varchar(50) NOT NULL,
  `score` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`cid`, `fname`, `sname`, `email`, `pword`, `status`, `score`) VALUES
(3, 'eman', 'magdy', 'test2@test', 'CV', 'examed', 0),
(2, 'mohamed', 'ali', 'test@test', 'CV', 'wait', 2);

-- --------------------------------------------------------

--
-- Table structure for table `candidate_answer`
--

CREATE TABLE `candidate_answer` (
  `ansid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `atext` varchar(45) NOT NULL,
  `correct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_chosansr`
--

CREATE TABLE `candidate_chosansr` (
  `rid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `qtype` varchar(45) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `jid` int(5) NOT NULL,
  `title` varchar(20) NOT NULL,
  `desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`jid`, `title`, `desc`) VALUES
(1, 'software engineer', 'c++ , java , python'),
(2, 'data analysis', 'c++ , java , python'),
(3, 'web designer', 'html , css , jsp');

-- --------------------------------------------------------

--
-- Table structure for table `qtype`
--

CREATE TABLE `qtype` (
  `tid` int(5) NOT NULL,
  `ref` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qtype`
--

INSERT INTO `qtype` (`tid`, `ref`, `type`) VALUES
(3, 'Anal', 'Analysis'),
(1, 'IQ', 'IQ test'),
(2, 'pro', 'Programming test');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `qid` int(5) NOT NULL,
  `type` varchar(5) NOT NULL,
  `qtext` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`qid`, `type`, `qtext`) VALUES
(1, 'IQ', 'what is 8*8 ?'),
(2, 'pro', 'inf(x==?) ?'),
(3, 'Anal', 'mean = total/simple ?'),
(4, 'pro', 'what is c++?'),
(5, 'pro', 'what is java ?\r\n'),
(6, 'pro', 'what is php ?\r\n'),
(7, 'pro', 'for (int i=0 ; i?? ; i<10)? '),
(8, 'pro', 'for (int i=10 ; i?? ; i>0)? '),
(9, 'pro', 'string x =\"\" ?'),
(10, 'pro', 'int x =0 ?'),
(11, 'IQ', '1*1 ?'),
(12, 'IQ', '2*2 ?'),
(13, 'IQ', '3*3 ?'),
(14, 'IQ', '4*4 ?'),
(15, 'IQ', '5*5?'),
(16, 'IQ', '6*6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidate`
--
ALTER TABLE `candidate`
  ADD UNIQUE KEY `mail` (`email`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD UNIQUE KEY `jid` (`jid`);

--
-- Indexes for table `qtype`
--
ALTER TABLE `qtype`
  ADD UNIQUE KEY `ref` (`ref`),
  ADD UNIQUE KEY `tid` (`tid`),
  ADD UNIQUE KEY `ref_2` (`ref`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD UNIQUE KEY `qid` (`qid`),
  ADD UNIQUE KEY `qid_2` (`qid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
