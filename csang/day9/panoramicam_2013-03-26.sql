# ************************************************************
# Sequel Pro SQL dump
# Version 4004
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.29)
# Database: panoramicam
# Generation Time: 2013-03-26 18:28:47 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table people
# ------------------------------------------------------------

DROP TABLE IF EXISTS `people`;

CREATE TABLE `people` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url_id` varchar(20) NOT NULL DEFAULT '',
  `first_name` varchar(20) NOT NULL DEFAULT '',
  `last_name` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `birthdate` date DEFAULT NULL,
  `gender` varchar(1) NOT NULL DEFAULT '',
  `about` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(255) NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_id` (`url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;

INSERT INTO `people` (`id`, `url_id`, `first_name`, `last_name`, `email`, `birthdate`, `gender`, `about`, `created_at`, `password`, `admin`)
VALUES
	(1,'csang','Carlos','Sang','csang.chino11@gmail.com','1993-05-01','M','I\'m a Web Developer and Designer.','2013-03-21 22:36:18','1A1DC91C907325C69271DDF0C944BC72',0),
	(2,'jjordan','Jacob','Jordan','jjordan1770@gmail.com',NULL,'M','I\'m a student.','2013-03-21 21:56:18','1a1dc91c907325c69271ddf0c944bc72',0),
	(4,'jsang','Jose','Sang','jsang@mail.com',NULL,'M',NULL,'2013-03-21 21:56:21','1a1dc91c907325c69271ddf0c944bc72',0),
	(5,'admin','Admin','User','admin@panoramicam.com',NULL,'',NULL,'2013-03-23 18:40:08','1a1dc91c907325c69271ddf0c944bc72',1),
	(12,'esuazo','Erika','Suazo','esuazo@gmail.com',NULL,'F',NULL,'2013-03-26 03:24:57','1A1DC91C907325C69271DDF0C944BC72',0);

/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table photos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `photo_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `personid` int(11) unsigned DEFAULT NULL,
  `url_id` varchar(20) NOT NULL DEFAULT '',
  `file` varchar(255) NOT NULL DEFAULT '',
  `uploaded_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`photo_id`),
  UNIQUE KEY `file` (`file`),
  KEY `personid` (`personid`),
  KEY `url_id` (`url_id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`personid`) REFERENCES `people` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;

INSERT INTO `photos` (`photo_id`, `personid`, `url_id`, `file`, `uploaded_at`)
VALUES
	(1,2,'jjordan','1.jpg','2013-03-21 15:08:29'),
	(2,2,'jjordan','2.jpg','2013-03-21 15:08:29'),
	(3,1,'csang','3.jpg','2013-03-21 22:56:43'),
	(4,1,'csang','4.jpg','2013-03-21 22:56:59'),
	(5,1,'csang','5.jpg','2013-03-21 15:08:33'),
	(31,12,'esuazo','esuazoMarch26201303282012-12-16 13.12.50.jpg','2013-03-26 03:28:50'),
	(32,1,'csang','csangMarch2620130206IMG_8096.jpeg','2013-03-26 14:06:01');

/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
