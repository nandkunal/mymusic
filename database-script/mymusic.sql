-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2014 at 03:36 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mymusic`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_cas`
--

CREATE TABLE IF NOT EXISTS `auth_cas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `service` varchar(512) DEFAULT NULL,
  `ticket` varchar(512) DEFAULT NULL,
  `renew` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_event`
--

CREATE TABLE IF NOT EXISTS `auth_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_stamp` datetime DEFAULT NULL,
  `client_ip` varchar(512) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `origin` varchar(512) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `auth_event`
--

INSERT INTO `auth_event` (`id`, `time_stamp`, `client_ip`, `user_id`, `origin`, `description`) VALUES
(1, '2014-11-18 13:55:27', '127.0.0.1', NULL, 'auth', 'Group 1 created'),
(2, '2014-11-18 13:55:27', '127.0.0.1', 1, 'auth', 'User 1 Registered');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(512) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `role`, `description`) VALUES
(1, 'user_1', 'Group uniquely assigned to user 1');

-- --------------------------------------------------------

--
-- Table structure for table `auth_membership`
--

CREATE TABLE IF NOT EXISTS `auth_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  KEY `group_id__idx` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `auth_membership`
--

INSERT INTO `auth_membership` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(512) DEFAULT NULL,
  `table_name` varchar(512) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id__idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `registration_key` varchar(512) DEFAULT NULL,
  `reset_password_key` varchar(512) DEFAULT NULL,
  `registration_id` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `first_name`, `last_name`, `email`, `password`, `registration_key`, `reset_password_key`, `registration_id`) VALUES
(1, 'Kunal', 'Khaware', 'nandkunal@gmail.com', 'pbkdf2(1000,20,sha512)$ba0a4298f974dc3b$662f21244376545bad4dcf0e089de50524a6004e', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_music_category`
--

CREATE TABLE IF NOT EXISTS `t_music_category` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(100) NOT NULL,
  `cat_desc` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cat_name` (`cat_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1007 ;

--
-- Dumping data for table `t_music_category`
--

INSERT INTO `t_music_category` (`id`, `cat_name`, `cat_desc`) VALUES
(1001, 'Blues', ''),
(1002, 'Folk', ''),
(1004, 'Hip Hop', ''),
(1005, 'Jazz', ''),
(1006, 'Pop', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_uploads`
--

CREATE TABLE IF NOT EXISTS `t_uploads` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `music_category_id` int(5) NOT NULL,
  `artists` text NOT NULL,
  `upload_datetime` datetime NOT NULL,
  `file_url` varchar(500) NOT NULL,
  `track_desc` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_uploads_fk1` (`user_id`),
  KEY `t_uploads_fk2` (`music_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `t_upload_share_likes`
--

CREATE TABLE IF NOT EXISTS `t_upload_share_likes` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `upload_id` int(5) NOT NULL,
  `count_likes` int(5) NOT NULL,
  `count_shares` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_upload_share_likes_fk1` (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `t_users_music_taste`
--

CREATE TABLE IF NOT EXISTS `t_users_music_taste` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `music_category_id` int(5) NOT NULL,
  `artists` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_users_music_taste_fk1` (`user_id`),
  KEY `t_users_music_taste_fk2` (`music_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `t_users_profile_pic`
--

CREATE TABLE IF NOT EXISTS `t_users_profile_pic` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `profile_pic_url` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_users_profile_pic_fk1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_cas`
--
ALTER TABLE `auth_cas`
  ADD CONSTRAINT `auth_cas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_event`
--
ALTER TABLE `auth_event`
  ADD CONSTRAINT `auth_event_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_membership`
--
ALTER TABLE `auth_membership`
  ADD CONSTRAINT `auth_membership_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_membership_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `t_uploads`
--
ALTER TABLE `t_uploads`
  ADD CONSTRAINT `t_uploads_fk1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `t_uploads_fk2` FOREIGN KEY (`music_category_id`) REFERENCES `t_music_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `t_users_music_taste`
--
ALTER TABLE `t_users_music_taste`
  ADD CONSTRAINT `t_users_music_taste_fk1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `t_users_music_taste_fk2` FOREIGN KEY (`music_category_id`) REFERENCES `t_music_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `t_users_profile_pic`
--
ALTER TABLE `t_users_profile_pic`
  ADD CONSTRAINT `t_users_profile_pic_fk1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
