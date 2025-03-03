-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.11.8-MariaDB-ubu2204 - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for intellisurv
CREATE DATABASE IF NOT EXISTS `intellisurv` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `intellisurv`;

-- Dumping structure for table intellisurv.aifacedetections
CREATE TABLE IF NOT EXISTS `aifacedetections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `camera_id` bigint(20) DEFAULT NULL,
  `createdts` timestamp NULL DEFAULT current_timestamp(),
  `facerecognized` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camera_id` (`camera_id`),
  KEY `facerecognized` (`facerecognized`),
  CONSTRAINT `aifacedetections_ibfk_1` FOREIGN KEY (`camera_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table intellisurv.aifacedetections: ~0 rows (approximately)
DELETE FROM `aifacedetections`;

-- Dumping structure for table intellisurv.aimonitors
CREATE TABLE IF NOT EXISTS `aimonitors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `camera_id` bigint(20) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `fps` int(11) DEFAULT NULL,
  `aipipeline` varchar(100) DEFAULT NULL,
  `override` varchar(50) DEFAULT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `framesize` smallint(5) unsigned NOT NULL DEFAULT 0,
  `createdts` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `camera_id` (`camera_id`),
  CONSTRAINT `aimonitors_ibfk_1` FOREIGN KEY (`camera_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table intellisurv.aimonitors: ~0 rows (approximately)
DELETE FROM `aimonitors`;

-- Dumping structure for table intellisurv.aitriggers
CREATE TABLE IF NOT EXISTS `aitriggers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `event_ts` varchar(25) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `detected` varchar(100) DEFAULT NULL,
  `reviewer_user_id` bigint(20) DEFAULT NULL,
  `feedback` int(11) DEFAULT NULL,
  `incidence_id` bigint(20) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `alarmfile` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`),
  CONSTRAINT `aitriggers_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table intellisurv.aitriggers: ~0 rows (approximately)
DELETE FROM `aitriggers`;

-- Dumping structure for table intellisurv.alarms
CREATE TABLE IF NOT EXISTS `alarms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` varchar(20) NOT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `filepath` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`),
  CONSTRAINT `alarms_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.alarms: ~0 rows (approximately)
DELETE FROM `alarms`;

-- Dumping structure for table intellisurv.assetnames
CREATE TABLE IF NOT EXISTS `assetnames` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assetname` varchar(50) NOT NULL,
  `assettype` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.assetnames: ~5 rows (approximately)
DELETE FROM `assetnames`;
INSERT INTO `assetnames` (`id`, `assetname`, `assettype`) VALUES
	(1, 'Router', 'ITAsset'),
	(2, 'Generator', 'NonITAsset'),
	(3, 'Monitor', 'NonITAsset'),
	(4, 'Server', 'ITAsset'),
	(5, 'sectest', 'ITAsset');

-- Dumping structure for table intellisurv.assets
CREATE TABLE IF NOT EXISTS `assets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `serialnumber` varchar(50) NOT NULL,
  `ponumber` varchar(50) DEFAULT NULL,
  `podate` date DEFAULT NULL,
  `golivedate` date DEFAULT NULL,
  `warrantyvalid` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `ipaddress` varchar(50) NOT NULL,
  `checkmetric` varchar(50) NOT NULL,
  `portnumber` varchar(50) NOT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `lastchecked` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `assets_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.assets: ~0 rows (approximately)
DELETE FROM `assets`;

-- Dumping structure for table intellisurv.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.category: ~3 rows (approximately)
DELETE FROM `category`;
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Poaching'),
	(3, 'somethingelse'),
	(4, 'sectest');

-- Dumping structure for table intellisurv.closedincidence
CREATE TABLE IF NOT EXISTS `closedincidence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `images` varchar(250) DEFAULT NULL,
  `savetoknowldge` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.closedincidence: ~0 rows (approximately)
DELETE FROM `closedincidence`;

-- Dumping structure for table intellisurv.creation_source
CREATE TABLE IF NOT EXISTS `creation_source` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.creation_source: ~0 rows (approximately)
DELETE FROM `creation_source`;

-- Dumping structure for table intellisurv.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.departments: ~3 rows (approximately)
DELETE FROM `departments`;
INSERT INTO `departments` (`id`, `name`) VALUES
	(3, 'Forest'),
	(2, 'GoR'),
	(1, 'Ops');

-- Dumping structure for table intellisurv.devices
CREATE TABLE IF NOT EXISTS `devices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `make` varchar(50) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `ipaddress` varchar(50) NOT NULL,
  `port` varchar(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `lqs` varchar(200) NOT NULL,
  `mqs` varchar(200) NOT NULL,
  `hqs` varchar(200) NOT NULL,
  `overrideport` varchar(5) DEFAULT NULL,
  `createdts` timestamp NULL DEFAULT current_timestamp(),
  `ptzsupport` tinyint(1) NOT NULL,
  `status` varchar(20) NOT NULL,
  `ptztoken` varchar(20) DEFAULT NULL,
  `lqres` varchar(20) DEFAULT NULL,
  `hqres` varchar(20) DEFAULT NULL,
  `triggermotionalarm` int(11) DEFAULT 0,
  `maxrange` int(11) DEFAULT 2000,
  `uptimekumaid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `devices_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.devices: ~1 rows (approximately)
DELETE FROM `devices`;
INSERT INTO `devices` (`id`, `name`, `location_id`, `model`, `make`, `serialnumber`, `ipaddress`, `port`, `username`, `password`, `lqs`, `mqs`, `hqs`, `overrideport`, `createdts`, `ptzsupport`, `status`, `ptztoken`, `lqres`, `hqres`, `triggermotionalarm`, `maxrange`, `uptimekumaid`) VALUES
	(13, 'demo', 1, 'fgfgf', 'ss', 'ghjgjg', '175.101.146.154', '554', 'admin', 'vfvjwehvf', 'rtsp://admin:admin123@175.101.146.154:554/cam/realmonitor?channel=3&subtype=1', 'rtsp://admin:admin123@175.101.146.154:554/cam/realmonitor?channel=3&subtype=1', 'rtsp://admin:admin123@175.101.146.154:554/cam/realmonitor?channel=3&subtype=0', '', '2023-10-01 11:52:34', 0, 'Online', '', '352x288', '1280x720', 0, 2000, NULL);

-- Dumping structure for table intellisurv.drones
CREATE TABLE IF NOT EXISTS `drones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `headquarter_id` bigint(20) NOT NULL,
  `dronetype` varchar(100) DEFAULT NULL,
  `ipaddress` varchar(50) NOT NULL,
  `authstring` varchar(100) DEFAULT NULL,
  `current_latitude` varchar(20) DEFAULT NULL,
  `current_longitude` varchar(20) DEFAULT NULL,
  `current_battery` varchar(20) DEFAULT NULL,
  `current_altitude` varchar(20) DEFAULT NULL,
  `current_mode` varchar(20) DEFAULT NULL,
  `lastrefreshts` timestamp NULL DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `sendsms` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `headquarter_id` (`headquarter_id`),
  KEY `device_id` (`device_id`),
  CONSTRAINT `drones_ibfk_1` FOREIGN KEY (`headquarter_id`) REFERENCES `headquaters` (`id`),
  CONSTRAINT `drones_ibfk_2` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.drones: ~0 rows (approximately)
DELETE FROM `drones`;

-- Dumping structure for table intellisurv.droneschedule
CREATE TABLE IF NOT EXISTS `droneschedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `drone_id` bigint(20) DEFAULT NULL,
  `headquater_id` bigint(20) DEFAULT NULL,
  `ts` timestamp NULL DEFAULT current_timestamp(),
  `areaofoperation` varchar(50) DEFAULT NULL,
  `planfrom` timestamp NULL DEFAULT NULL,
  `planto` timestamp NULL DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drone_id` (`drone_id`),
  KEY `headquater_id` (`headquater_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `droneschedule_ibfk_1` FOREIGN KEY (`drone_id`) REFERENCES `drones` (`id`),
  CONSTRAINT `droneschedule_ibfk_2` FOREIGN KEY (`headquater_id`) REFERENCES `headquaters` (`id`),
  CONSTRAINT `droneschedule_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.droneschedule: ~0 rows (approximately)
DELETE FROM `droneschedule`;

-- Dumping structure for table intellisurv.edgelocation_history
CREATE TABLE IF NOT EXISTS `edgelocation_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `currentstatus` varchar(50) NOT NULL,
  `lastpoll` timestamp NULL DEFAULT current_timestamp(),
  `recorded_at` timestamp NULL DEFAULT current_timestamp(),
  `cpu` float DEFAULT NULL,
  `ram` float DEFAULT NULL,
  `diskfree` float DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `edgelocation_history_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table intellisurv.edgelocation_history: ~0 rows (approximately)
DELETE FROM `edgelocation_history`;

-- Dumping structure for table intellisurv.escalation
CREATE TABLE IF NOT EXISTS `escalation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile` varchar(50) NOT NULL,
  `firstlevel` varchar(20) NOT NULL,
  `secondlevel` varchar(20) NOT NULL,
  `thirdlevel` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile` (`profile`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.escalation: ~3 rows (approximately)
DELETE FROM `escalation`;
INSERT INTO `escalation` (`id`, `profile`, `firstlevel`, `secondlevel`, `thirdlevel`) VALUES
	(1, 'esc1', '30', '60', '90'),
	(2, 'esc2', '1', '24', '96'),
	(3, '09550204270', '222', '22222', '222');

-- Dumping structure for table intellisurv.headquaters
CREATE TABLE IF NOT EXISTS `headquaters` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `hq_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `hq_id` (`hq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.headquaters: ~1 rows (approximately)
DELETE FROM `headquaters`;
INSERT INTO `headquaters` (`id`, `name`, `hq_id`) VALUES
	(1, 'hq1', 'hq1');

-- Dumping structure for table intellisurv.incidences
CREATE TABLE IF NOT EXISTS `incidences` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(50) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `subcategory_id` bigint(20) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creation_source_name` varchar(50) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `escalation_id` bigint(20) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `priority_level` varchar(50) DEFAULT NULL,
  `emergency` varchar(50) DEFAULT NULL,
  `users_name_id` bigint(20) DEFAULT NULL,
  `granularity` varchar(50) DEFAULT NULL,
  `images` varchar(1000) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `linkedincidence` bigint(20) DEFAULT NULL,
  `playback_id` bigint(20) DEFAULT NULL,
  `currentescalationlevel` varchar(10) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `closing_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `location_id` (`location_id`),
  KEY `subcategory_id` (`subcategory_id`),
  KEY `team_id` (`team_id`),
  KEY `escalation_id` (`escalation_id`),
  KEY `device_id` (`device_id`),
  KEY `users_name_id` (`users_name_id`),
  KEY `playback_id` (`playback_id`),
  CONSTRAINT `incidences_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `incidences_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id`),
  CONSTRAINT `incidences_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `incidences_ibfk_4` FOREIGN KEY (`escalation_id`) REFERENCES `escalation` (`id`),
  CONSTRAINT `incidences_ibfk_5` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  CONSTRAINT `incidences_ibfk_6` FOREIGN KEY (`users_name_id`) REFERENCES `users` (`id`),
  CONSTRAINT `incidences_ibfk_7` FOREIGN KEY (`playback_id`) REFERENCES `recordedfiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.incidences: ~0 rows (approximately)
DELETE FROM `incidences`;

-- Dumping structure for table intellisurv.incidence_content
CREATE TABLE IF NOT EXISTS `incidence_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `incidenceid` bigint(20) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `filepath` varchar(200) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `incidenceid` (`incidenceid`),
  KEY `userid` (`userid`),
  CONSTRAINT `incidence_content_ibfk_1` FOREIGN KEY (`incidenceid`) REFERENCES `incidences` (`id`),
  CONSTRAINT `incidence_content_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.incidence_content: ~0 rows (approximately)
DELETE FROM `incidence_content`;

-- Dumping structure for table intellisurv.incidence_history
CREATE TABLE IF NOT EXISTS `incidence_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `incidenceid` bigint(20) DEFAULT NULL,
  `event` varchar(2048) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `incidenceid` (`incidenceid`),
  KEY `userid` (`userid`),
  CONSTRAINT `incidence_history_ibfk_1` FOREIGN KEY (`incidenceid`) REFERENCES `incidences` (`id`),
  CONSTRAINT `incidence_history_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.incidence_history: ~0 rows (approximately)
DELETE FROM `incidence_history`;

-- Dumping structure for table intellisurv.incidence_location
CREATE TABLE IF NOT EXISTS `incidence_location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `devices_name` varchar(50) DEFAULT NULL,
  `location_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.incidence_location: ~0 rows (approximately)
DELETE FROM `incidence_location`;

-- Dumping structure for table intellisurv.knowledgebase
CREATE TABLE IF NOT EXISTS `knowledgebase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `answer` text NOT NULL,
  `featured` varchar(20) DEFAULT NULL,
  `linkedincidence` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `knowledgebase_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `knowledgebase_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.knowledgebase: ~1 rows (approximately)
DELETE FROM `knowledgebase`;
INSERT INTO `knowledgebase` (`id`, `user_id`, `category_id`, `question`, `answer`, `featured`, `linkedincidence`) VALUES
	(2, '1', 2, 'rtrt', 'rtrt', 'off', 0);

-- Dumping structure for table intellisurv.knowledgebase_category
CREATE TABLE IF NOT EXISTS `knowledgebase_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.knowledgebase_category: ~5 rows (approximately)
DELETE FROM `knowledgebase_category`;
INSERT INTO `knowledgebase_category` (`id`, `name`) VALUES
	(1, 'kb1'),
	(2, 'kb2'),
	(3, 'kb3'),
	(4, 'test'),
	(5, 'sectest');

-- Dumping structure for table intellisurv.locations
CREATE TABLE IF NOT EXISTS `locations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `location_id` varchar(45) NOT NULL,
  `highest_point` varchar(50) NOT NULL,
  `terrain` varchar(50) NOT NULL,
  `headquater_id` bigint(20) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `uptimekumaid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `headquater_id` (`headquater_id`),
  CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`headquater_id`) REFERENCES `headquaters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.locations: ~1 rows (approximately)
DELETE FROM `locations`;
INSERT INTO `locations` (`id`, `name`, `latitude`, `longitude`, `location_id`, `highest_point`, `terrain`, `headquater_id`, `description`, `uptimekumaid`) VALUES
	(1, 'loc1', '26.344', '75.221', 'l1', 'non', 'plain', 1, 'test desc', NULL);

-- Dumping structure for table intellisurv.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` varchar(30) NOT NULL,
  `message` varchar(4096) DEFAULT NULL,
  `sendsms` tinyint(1) DEFAULT NULL,
  `sendemail` tinyint(1) DEFAULT NULL,
  `sendvoice` tinyint(1) DEFAULT NULL,
  `smssendtime` timestamp NULL DEFAULT NULL,
  `emailsendtime` timestamp NULL DEFAULT NULL,
  `voicesendtime` timestamp NULL DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `link` varchar(40) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `sendtomanagement` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.notifications: ~0 rows (approximately)
DELETE FROM `notifications`;

-- Dumping structure for table intellisurv.pculist
CREATE TABLE IF NOT EXISTS `pculist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `pculist_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.pculist: ~0 rows (approximately)
DELETE FROM `pculist`;

-- Dumping structure for table intellisurv.priority
CREATE TABLE IF NOT EXISTS `priority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `prioritylevel` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.priority: ~0 rows (approximately)
DELETE FROM `priority`;

-- Dumping structure for table intellisurv.recordedfiles
CREATE TABLE IF NOT EXISTS `recordedfiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) DEFAULT NULL,
  `profile_id` bigint(20) DEFAULT NULL,
  `filepath` varchar(100) NOT NULL,
  `filesize` int(11) DEFAULT NULL,
  `starttime` timestamp NULL DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `md5hash` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`),
  KEY `profile_id` (`profile_id`),
  CONSTRAINT `recordedfiles_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  CONSTRAINT `recordedfiles_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `recordingprofiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=929 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.recordedfiles: ~0 rows (approximately)
DELETE FROM `recordedfiles`;

-- Dumping structure for table intellisurv.recordingbookmarks
CREATE TABLE IF NOT EXISTS `recordingbookmarks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `playback_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `timecode` varchar(15) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `playback_id` (`playback_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `recordingbookmarks_ibfk_1` FOREIGN KEY (`playback_id`) REFERENCES `recordedfiles` (`id`),
  CONSTRAINT `recordingbookmarks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.recordingbookmarks: ~0 rows (approximately)
DELETE FROM `recordingbookmarks`;

-- Dumping structure for table intellisurv.recordingprofiles
CREATE TABLE IF NOT EXISTS `recordingprofiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profilename` varchar(50) NOT NULL,
  `savepath` varchar(150) NOT NULL,
  `fallbacksavepath` varchar(150) DEFAULT NULL,
  `outfps` varchar(10) DEFAULT NULL,
  `transcodeenable` int(11) NOT NULL,
  `transcodepreset` varchar(10) DEFAULT NULL,
  `transcoderesolution` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `d1s` time NOT NULL DEFAULT '00:00:00',
  `d1e` time NOT NULL DEFAULT '23:59:59',
  `d2s` time NOT NULL DEFAULT '00:00:00',
  `d2e` time NOT NULL DEFAULT '23:59:59',
  `d3s` time NOT NULL DEFAULT '00:00:00',
  `d3e` time NOT NULL DEFAULT '23:59:59',
  `d4s` time NOT NULL DEFAULT '00:00:00',
  `d4e` time NOT NULL DEFAULT '23:59:59',
  `d5s` time NOT NULL DEFAULT '00:00:00',
  `d5e` time NOT NULL DEFAULT '23:59:59',
  `d6s` time NOT NULL DEFAULT '00:00:00',
  `d6e` time NOT NULL DEFAULT '23:59:59',
  `d7s` time NOT NULL DEFAULT '00:00:00',
  `d7e` time NOT NULL DEFAULT '23:59:59',
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table intellisurv.recordingprofiles: ~1 rows (approximately)
DELETE FROM `recordingprofiles`;
INSERT INTO `recordingprofiles` (`id`, `profilename`, `savepath`, `fallbacksavepath`, `outfps`, `transcodeenable`, `transcodepreset`, `transcoderesolution`, `status`, `d1s`, `d1e`, `d2s`, `d2e`, `d3s`, `d3e`, `d4s`, `d4e`, `d5s`, `d5e`, `d6s`, `d6e`, `d7s`, `d7e`, `startdate`, `enddate`) VALUES
	(1, 'primary', 'vidout/', 'NONE', '0', 0, 'ultrafast', '', 'ACTIVE', '00:00:01', '23:59:59', '00:00:01', '23:59:59', '00:00:01', '23:59:59', '00:00:01', '23:59:59', '00:00:01', '23:59:59', '00:00:01', '23:59:59', '00:00:01', '23:59:59', '2025-02-26', '2025-07-31');

-- Dumping structure for table intellisurv.recordingsavepaths
CREATE TABLE IF NOT EXISTS `recordingsavepaths` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `path` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.recordingsavepaths: ~2 rows (approximately)
DELETE FROM `recordingsavepaths`;
INSERT INTO `recordingsavepaths` (`id`, `name`, `path`) VALUES
	(4, 'vidout', 'vidout/'),
	(5, 'fallback', 'vidout2');

-- Dumping structure for table intellisurv.recordingservice
CREATE TABLE IF NOT EXISTS `recordingservice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) DEFAULT NULL,
  `profile_id` bigint(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'RECORDING',
  `createdts` timestamp NULL DEFAULT current_timestamp(),
  `lastrecordts` timestamp NULL DEFAULT NULL,
  `filescreated` int(11) NOT NULL,
  `hq_id` bigint(20) DEFAULT NULL,
  `locked_at` timestamp NULL DEFAULT NULL,
  `locked_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`),
  KEY `profile_id` (`profile_id`),
  CONSTRAINT `recordingservice_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  CONSTRAINT `recordingservice_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `recordingprofiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table intellisurv.recordingservice: ~0 rows (approximately)
DELETE FROM `recordingservice`;

-- Dumping structure for table intellisurv.subcategory
CREATE TABLE IF NOT EXISTS `subcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.subcategory: ~4 rows (approximately)
DELETE FROM `subcategory`;
INSERT INTO `subcategory` (`id`, `category_id`, `name`) VALUES
	(1, 1, 'Tiger Poaching'),
	(2, 3, 'sunfe'),
	(3, 1, 'otherpoaching'),
	(4, 4, 'sectestsub');

-- Dumping structure for table intellisurv.sysmonitor
CREATE TABLE IF NOT EXISTS `sysmonitor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `urlstring` varchar(300) NOT NULL,
  `ts` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.sysmonitor: ~2 rows (approximately)
DELETE FROM `sysmonitor`;
INSERT INTO `sysmonitor` (`id`, `name`, `urlstring`, `ts`) VALUES
	(1, 'LOCAL', 'http://localhost:10301', '2019-07-10 08:16:38'),
	(2, 'LOCAL 2', 'http://localhost:10302', '2019-07-10 08:16:54');

-- Dumping structure for table intellisurv.teams
CREATE TABLE IF NOT EXISTS `teams` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `headquater_id` bigint(20) NOT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `team_name` varchar(100) NOT NULL,
  `team_id` varchar(30) NOT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_name` (`team_name`),
  UNIQUE KEY `team_id` (`team_id`),
  KEY `headquater_id` (`headquater_id`),
  KEY `location_id` (`location_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`headquater_id`) REFERENCES `headquaters` (`id`),
  CONSTRAINT `teams_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `teams_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table intellisurv.teams: ~1 rows (approximately)
DELETE FROM `teams`;
INSERT INTO `teams` (`id`, `headquater_id`, `location_id`, `team_name`, `team_id`, `department_id`) VALUES
	(1, 1, 1, 'test', 't11', 1);

-- Dumping structure for table intellisurv.ticketcategory
CREATE TABLE IF NOT EXISTS `ticketcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sla` bigint(20) NOT NULL,
  `penalty` int(11) NOT NULL DEFAULT 100,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.ticketcategory: ~3 rows (approximately)
DELETE FROM `ticketcategory`;
INSERT INTO `ticketcategory` (`id`, `name`, `sla`, `penalty`) VALUES
	(1, 'cat1', 300, 100),
	(2, 'sectest', 30, 200),
	(3, 'pentest', 96, 50);

-- Dumping structure for table intellisurv.tickets
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(50) NOT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `priority` varchar(50) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `workallocatedid` bigint(20) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `closing_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `category_id` (`category_id`),
  KEY `users_id` (`users_id`),
  KEY `workallocatedid` (`workallocatedid`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `ticketcategory` (`id`),
  CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`workallocatedid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.tickets: ~0 rows (approximately)
DELETE FROM `tickets`;

-- Dumping structure for table intellisurv.ticket_history
CREATE TABLE IF NOT EXISTS `ticket_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticketid` bigint(20) DEFAULT NULL,
  `event` varchar(2048) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `ticketid` (`ticketid`),
  KEY `userid` (`userid`),
  CONSTRAINT `ticket_history_ibfk_1` FOREIGN KEY (`ticketid`) REFERENCES `tickets` (`id`),
  CONSTRAINT `ticket_history_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.ticket_history: ~0 rows (approximately)
DELETE FROM `ticket_history`;

-- Dumping structure for table intellisurv.userradiolocationhistory
CREATE TABLE IF NOT EXISTS `userradiolocationhistory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `radiocoordinate` varchar(60) NOT NULL,
  `ts` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `userradiolocationhistory_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.userradiolocationhistory: ~1 rows (approximately)
DELETE FROM `userradiolocationhistory`;
INSERT INTO `userradiolocationhistory` (`id`, `user_id`, `radiocoordinate`, `ts`) VALUES
	(1, 1, '23.98N, 45.67E', '2019-06-26 08:39:51');

-- Dumping structure for table intellisurv.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `contact` varchar(50) NOT NULL,
  `radiosubscriberid` varchar(50) DEFAULT NULL,
  `password` varchar(150) NOT NULL DEFAULT '',
  `user_type_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `profileimage` varchar(1000) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `dateofsub` timestamp NULL DEFAULT current_timestamp(),
  `lastlogin` varchar(30) DEFAULT '',
  `viewonly` tinyint(1) NOT NULL DEFAULT 1,
  `ptzaccess` tinyint(1) NOT NULL DEFAULT 1,
  `radiocoordinate` varchar(60) DEFAULT NULL,
  `radioproxyip` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `contact` (`contact`),
  KEY `location_id` (`location_id`),
  KEY `user_type_id` (`user_type_id`),
  KEY `department_id` (`department_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`),
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `users_ibfk_4` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.users: ~1 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `firstname`, `lastname`, `user_id`, `email`, `gender`, `location_id`, `contact`, `radiosubscriberid`, `password`, `user_type_id`, `department_id`, `team_id`, `profileimage`, `status`, `dateofsub`, `lastlogin`, `viewonly`, `ptzaccess`, `radiocoordinate`, `radioproxyip`) VALUES
	(1, 'samrat', 'majumderrssss', '11111', 'samrat@asia.com', 'Male', 1, '1233321', 'None', '$pbkdf2-sha256$29000$4Px/rzVGqLV2LuXcG8NYqw$6mCZYQOVN84T44e8RTjikauXbnauisOPS97cCvMtaHo', 1, 1, 1, 'zwlcufdduw1.JPG', 'Enabled', '2018-07-24 06:10:28', 'March, 01 2025 12:52:52', 0, 1, NULL, NULL);

-- Dumping structure for table intellisurv.user_type
CREATE TABLE IF NOT EXISTS `user_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.user_type: ~3 rows (approximately)
DELETE FROM `user_type`;
INSERT INTO `user_type` (`id`, `name`, `level`) VALUES
	(1, 'Admin', 'Admin'),
	(2, 'User', 'User'),
	(3, 'AreaAdmin', 'AreaAdmin');

-- Dumping structure for table intellisurv.videolayout
CREATE TABLE IF NOT EXISTS `videolayout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `headquarter_id` bigint(20) DEFAULT NULL,
  `json` varchar(4096) NOT NULL,
  `createdts` timestamp NULL DEFAULT current_timestamp(),
  `cameracount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.videolayout: ~0 rows (approximately)
DELETE FROM `videolayout`;

-- Dumping structure for table intellisurv.video_details
CREATE TABLE IF NOT EXISTS `video_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `processing_time` float DEFAULT NULL,
  `videosize` float DEFAULT NULL,
  `upload_date` timestamp NULL DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `video_name` varchar(255) DEFAULT NULL,
  `batch_id` varchar(255) DEFAULT NULL,
  `object_detected` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.video_details: ~0 rows (approximately)
DELETE FROM `video_details`;

-- Dumping structure for table intellisurv.whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table intellisurv.whitelist: ~0 rows (approximately)
DELETE FROM `whitelist`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
