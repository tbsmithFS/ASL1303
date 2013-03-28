# ************************************************************
# Sequel Pro SQL dump
# Version 4004
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.29)
# Database: panoramicam
# Generation Time: 2013-03-28 22:47:54 +0000
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
  `url_id` varchar(30) NOT NULL DEFAULT '',
  `first_name` varchar(30) NOT NULL DEFAULT '',
  `last_name` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `birthdate` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT '',
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
	(1,'csang11','Carlos','Sang','csang.chino11@gmail.com','1993-05-01','M','I\'m a Web Developer, nice!','2013-03-21 22:36:18','2AC9CB7DC02B3C0083EB70898E549B63',0),
	(2,'jjordan','Jacob','Jordan','jjordan1770@gmail.com',NULL,'M','I\'m a student.','2013-03-21 21:56:18','2ac9cb7dc02b3c0083eb70898e549b63',0),
	(4,'jsang11','Jose','Sang','jsang@mail.com',NULL,'M',NULL,'2013-03-21 21:56:21','2ac9cb7dc02b3c0083eb70898e549b63',0),
	(5,'admin','Admin','User','admin@panoramicam.com',NULL,'',NULL,'2013-03-23 18:40:08','2ac9cb7dc02b3c0083eb70898e549b63',1);

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
	(40,1,'csang11','csangMarch2620130650.jpg','2013-03-26 18:50:27'),
	(57,2,'jjordan','jjordanMarch2820130327296.jpg','2013-03-28 15:27:23');

/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
