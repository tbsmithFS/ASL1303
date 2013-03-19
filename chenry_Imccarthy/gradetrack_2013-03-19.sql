# ************************************************************
# Sequel Pro SQL dump
# Version 4004
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.25)
# Database: gradetrack
# Generation Time: 2013-03-19 21:12:33 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table courses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `course_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) unsigned NOT NULL,
  `student_id` int(255) unsigned DEFAULT NULL,
  `course_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`course_id`),
  KEY `Classes_ibfk_1` (`teacher_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;

INSERT INTO `courses` (`course_id`, `teacher_id`, `student_id`, `course_name`)
VALUES
	(5,2,1234567,'ASL');

/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gradeables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gradeables`;

CREATE TABLE `gradeables` (
  `gradeable_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(11) unsigned NOT NULL,
  `gradeable_name` varchar(255) NOT NULL DEFAULT '',
  `weight` int(11) unsigned NOT NULL,
  PRIMARY KEY (`gradeable_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `gradeables_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `gradeables` WRITE;
/*!40000 ALTER TABLE `gradeables` DISABLE KEYS */;

INSERT INTO `gradeables` (`gradeable_id`, `course_id`, `gradeable_name`, `weight`)
VALUES
	(4,5,'Lab 1',10),
	(6,5,'Lab 2',10),
	(7,5,'Lab 3',10),
	(8,5,'Lab 4',10);

/*!40000 ALTER TABLE `gradeables` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grades
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grades`;

CREATE TABLE `grades` (
  `grade_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(255) unsigned DEFAULT NULL,
  `course_id` int(11) unsigned DEFAULT NULL,
  `gradeable_id` int(11) unsigned DEFAULT NULL,
  `grade` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`grade_id`),
  KEY `course_id` (`course_id`),
  KEY `gradeable_id` (`gradeable_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `grades_ibfk_4` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grades_ibfk_5` FOREIGN KEY (`gradeable_id`) REFERENCES `gradeables` (`gradeable_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grades_ibfk_6` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;

INSERT INTO `grades` (`grade_id`, `student_id`, `course_id`, `gradeable_id`, `grade`)
VALUES
	(9,1234567,5,6,9),
	(10,1234567,5,7,10),
	(11,1234567,5,8,7),
	(12,1234567,5,4,3),
	(19,7654321,5,6,2),
	(20,7654321,5,7,10),
	(21,7654321,5,8,9),
	(22,7654321,5,4,9);

/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table students
# ------------------------------------------------------------

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `student_id` int(255) unsigned NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;

INSERT INTO `students` (`student_id`, `password`)
VALUES
	(1234567,'1c0b76fce779f78f51be339c49445c49'),
	(7654321,'1c0b76fce779f78f51be339c49445c49');

/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table teachers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teachers`;

CREATE TABLE `teachers` (
  `teacher_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;

INSERT INTO `teachers` (`teacher_id`, `email`, `password`)
VALUES
	(2,'ivan@gmail.com','1c0b76fce779f78f51be339c49445c49'),
	(5,'bob@gmail.com','d41d8cd98f00b204e9800998ecf8427e');

/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
