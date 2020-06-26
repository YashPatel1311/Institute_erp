CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendanceid` int unsigned NOT NULL AUTO_INCREMENT,
  `lectureid` int unsigned DEFAULT NULL,
  `studentid` varchar(9) DEFAULT NULL,
  `attended` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`attendanceid`),
  KEY `lectureid` (`lectureid`),
  KEY `studentid` (`studentid`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`lectureid`) REFERENCES `lecture` (`lectureid`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`studentid`) REFERENCES `student` (`studentid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1,'201851010',0),(2,1,'201851020',0),(3,1,'201851030',1),(4,1,'201851040',1),(5,1,'201851050',1),(6,1,'201851060',1),(7,1,'201851070',1),(8,1,'201851082',1),(9,1,'201851084',0),(10,1,'201851090',1),(11,2,'201851099',1),(12,2,'201851110',1),(13,2,'201851120',1),(14,2,'201851130',1),(15,2,'201851140',1),(16,2,'201851150',1),(17,3,'201852010',1),(18,3,'201852020',1),(19,3,'201852030',1),(20,4,'201851010',1),(21,4,'201851020',1),(22,4,'201851030',1),(23,4,'201851040',1),(24,4,'201851050',1),(25,4,'201851060',1),(26,4,'201851070',1),(27,4,'201851082',1),(28,4,'201851084',0),(29,4,'201851090',1),(30,5,'201851099',1),(31,5,'201851110',1),(32,5,'201851120',1),(33,5,'201851130',1),(34,5,'201851140',1),(35,5,'201851150',1),(36,6,'201852010',1),(37,6,'201852020',1),(38,6,'201852030',1),(39,11,'201851010',1),(40,11,'201851020',1),(41,11,'201851030',1),(42,11,'201851040',1),(43,11,'201851050',1),(44,11,'201851060',1),(45,11,'201851070',1),(46,11,'201851082',1),(47,11,'201851084',0),(48,11,'201851090',1),(49,12,'201851099',1),(50,12,'201851110',1),(51,12,'201851120',1),(52,12,'201851130',1),(53,12,'201851140',1),(54,12,'201851150',1),(55,13,'201852010',1),(56,13,'201852020',1),(57,13,'201852030',1);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add faculty',7,'add_faculty'),(26,'Can change faculty',7,'change_faculty'),(27,'Can delete faculty',7,'delete_faculty'),(28,'Can view faculty',7,'view_faculty'),(29,'Can add student',8,'add_student'),(30,'Can change student',8,'change_student'),(31,'Can delete student',8,'delete_student'),(32,'Can view student',8,'view_student'),(33,'Can add attendance',9,'add_attendance'),(34,'Can change attendance',9,'change_attendance'),(35,'Can delete attendance',9,'delete_attendance'),(36,'Can view attendance',9,'view_attendance'),(37,'Can add branch',10,'add_branch'),(38,'Can change branch',10,'change_branch'),(39,'Can delete branch',10,'delete_branch'),(40,'Can view branch',10,'view_branch'),(41,'Can add class',11,'add_class'),(42,'Can change class',11,'change_class'),(43,'Can delete class',11,'delete_class'),(44,'Can view class',11,'view_class'),(45,'Can add class course',12,'add_classcourse'),(46,'Can change class course',12,'change_classcourse'),(47,'Can delete class course',12,'delete_classcourse'),(48,'Can view class course',12,'view_classcourse'),(49,'Can add course',13,'add_course'),(50,'Can change course',13,'change_course'),(51,'Can delete course',13,'delete_course'),(52,'Can view course',13,'view_course'),(53,'Can add enrollment',14,'add_enrollment'),(54,'Can change enrollment',14,'change_enrollment'),(55,'Can delete enrollment',14,'delete_enrollment'),(56,'Can view enrollment',14,'view_enrollment'),(57,'Can add exam',15,'add_exam'),(58,'Can change exam',15,'change_exam'),(59,'Can delete exam',15,'delete_exam'),(60,'Can view exam',15,'view_exam'),(61,'Can add lecture',16,'add_lecture'),(62,'Can change lecture',16,'change_lecture'),(63,'Can delete lecture',16,'delete_lecture'),(64,'Can view lecture',16,'view_lecture'),(65,'Can add student class',17,'add_studentclass'),(66,'Can change student class',17,'change_studentclass'),(67,'Can delete student class',17,'delete_studentclass'),(68,'Can view student class',17,'view_studentclass'),(69,'Can add student classcourse',18,'add_studentclasscourse'),(70,'Can change student classcourse',18,'change_studentclasscourse'),(71,'Can delete student classcourse',18,'delete_studentclasscourse'),(72,'Can view student classcourse',18,'view_studentclasscourse'),(73,'Can add timetable',19,'add_timetable'),(74,'Can change timetable',19,'change_timetable'),(75,'Can delete timetable',19,'delete_timetable'),(76,'Can view timetable',19,'view_timetable'),(77,'Can add branch course',20,'add_branchcourse'),(78,'Can change branch course',20,'change_branchcourse'),(79,'Can delete branch course',20,'delete_branchcourse'),(80,'Can view branch course',20,'view_branchcourse'),(81,'Can add marks',21,'add_marks'),(82,'Can change marks',21,'change_marks'),(83,'Can delete marks',21,'delete_marks'),(84,'Can view marks',21,'view_marks');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branchid` char(2) NOT NULL,
  `bname` varchar(35) NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`branchid`),
  CONSTRAINT `branch_chk_1` CHECK ((`branchid` in (_utf8mb4'cs',_utf8mb4'it')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('cs','computer science and engineering',180),('it','information technology',40);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_course`
--

DROP TABLE IF EXISTS `branch_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_course` (
  `branchid` varchar(3) NOT NULL,
  `courseid` varchar(6) NOT NULL,
  PRIMARY KEY (`branchid`,`courseid`),
  KEY `courseid` (`courseid`),
  CONSTRAINT `branch_course_ibfk_1` FOREIGN KEY (`branchid`) REFERENCES `branch` (`branchid`),
  CONSTRAINT `branch_course_ibfk_2` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_course`
--

LOCK TABLES `branch_course` WRITE;
/*!40000 ALTER TABLE `branch_course` DISABLE KEYS */;
INSERT INTO `branch_course` VALUES ('cs','CS101'),('it','CS101'),('cs','CS201'),('it','CS201'),('cs','CS301'),('it','CS301'),('cs','CS302'),('it','CS302'),('cs','CS401'),('it','CS401'),('cs','CS402'),('it','CS402'),('cs','CS403'),('it','CS403'),('cs','CS404'),('it','CS404'),('cs','EC101'),('it','EC101'),('cs','EC201'),('it','EC201'),('cs','EC301'),('it','EC301'),('cs','EC601'),('it','EC601'),('cs','HS101'),('it','HS101'),('cs','HS201'),('it','HS201'),('cs','HS301'),('it','HS301'),('cs','MA101'),('it','MA101'),('cs','MA201'),('it','MA201'),('cs','MA301'),('it','MA301'),('cs','MA401'),('it','MA401'),('cs','PHY101'),('it','PHY101'),('cs','PHY201'),('it','PHY201');
/*!40000 ALTER TABLE `branch_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `classid_ai` int NOT NULL AUTO_INCREMENT,
  `classid` char(7) DEFAULT NULL,
  `branch` char(2) NOT NULL,
  `batch` year NOT NULL,
  `section` char(1) DEFAULT NULL,
  `labgroup` char(1) DEFAULT NULL,
  PRIMARY KEY (`classid_ai`),
  UNIQUE KEY `classid` (`classid`),
  KEY `branch` (`branch`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`branch`) REFERENCES `branch` (`branchid`),
  CONSTRAINT `class_chk_1` CHECK ((`section` in (_utf8mb4'1',_utf8mb4'2',NULL))),
  CONSTRAINT `class_chk_2` CHECK ((`labgroup` in (_utf8mb4'a',_utf8mb4'b',_utf8mb4'c',_utf8mb4'd',NULL)))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'cs20171','cs',2017,'1',NULL),(2,'cs20172','cs',2017,'2',NULL),(3,'it20172','it',2017,'2',NULL),(4,'cs2017a','cs',2017,NULL,'a'),(5,'cs2017b','cs',2017,NULL,'b'),(6,'cs2017c','cs',2017,NULL,'c'),(7,'it2017c','it',2017,NULL,'c'),(8,'cs20181','cs',2018,'1',NULL),(9,'cs20182','cs',2018,'2',NULL),(10,'it20182','it',2018,'2',NULL),(11,'cs2018a','cs',2018,NULL,'a'),(12,'cs2018b','cs',2018,NULL,'b'),(13,'cs2018c','cs',2018,NULL,'c'),(14,'it2018c','it',2018,NULL,'c');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `batch_chk` BEFORE INSERT ON `class` FOR EACH ROW BEGIN
	if new.batch <'2013' and new.batch > year(curdate()) then
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid batch!';
    END if;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `set_classid` BEFORE INSERT ON `class` FOR EACH ROW BEGIN

	if new.section is not null then
	set new.classid= concat(new.branch,CAST(new.batch as char(4)),CAST(new.section as char(1)));
    
    else 
    set new.classid= concat(new.branch,CAST(new.batch as char(4)),CAST(new.labgroup as char(1)));
    
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `class_course`
--

DROP TABLE IF EXISTS `class_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_course` (
  `classcourseid` int unsigned NOT NULL AUTO_INCREMENT,
  `classid` char(7) DEFAULT NULL,
  `facultyid` int DEFAULT NULL,
  `courseid` char(6) DEFAULT NULL,
  `ac_year` year DEFAULT NULL,
  `sem` tinyint DEFAULT NULL,
  PRIMARY KEY (`classcourseid`),
  UNIQUE KEY `classid` (`classid`,`courseid`,`ac_year`,`sem`),
  KEY `facultyid` (`facultyid`),
  KEY `courseid` (`courseid`),
  CONSTRAINT `class_course_ibfk_1` FOREIGN KEY (`facultyid`) REFERENCES `faculty` (`facultyid`),
  CONSTRAINT `class_course_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `class` (`classid`),
  CONSTRAINT `class_course_ibfk_3` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`) ON UPDATE CASCADE,
  CONSTRAINT `class_course_chk_1` CHECK ((`sem` in (1,2)))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_course`
--

LOCK TABLES `class_course` WRITE;
/*!40000 ALTER TABLE `class_course` DISABLE KEYS */;
INSERT INTO `class_course` VALUES (1,'cs20181',2,'CS401',2019,2),(2,'cs20181',3,'CS402',2019,2),(3,'cs20181',4,'CS403',2019,2),(4,'cs20181',5,'MA401',2019,2),(5,'cs20181',6,'HS401',2019,2),(6,'cs20182',2,'CS401',2019,2),(7,'cs20182',3,'CS402',2019,2),(8,'cs20182',4,'CS403',2019,2),(9,'cs20182',5,'MA401',2019,2),(10,'cs20182',6,'HS401',2019,2),(11,'it20182',2,'CS401',2019,2),(12,'it20182',3,'CS402',2019,2),(13,'it20182',4,'CS403',2019,2),(14,'it20182',5,'MA401',2019,2),(15,'it20182',6,'HS401',2019,2);
/*!40000 ALTER TABLE `class_course` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `student_list` AFTER INSERT ON `class_course` FOR EACH ROW BEGIN
	
    insert into student_classcourse(studentid,classcourseid)
    select studentid,new.classcourseid from
    (select studentid from student_class where section=new.classid or labgroup=new.classid)as s1
    natural join
    (select studentid from enrollment where enrollment.courseid=new.courseid and enrollment.ac_year=new.ac_year and enrollment.sem=new.sem)as s2;
    
    
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `courseid` varchar(6) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `credit` int NOT NULL,
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('CS101','Introduction to Programming',4),('CS201','Data structures',4),('CS301','Design and analysis of Algorithms',4),('CS302','Introduction to Object Oriented Programming',4),('CS401','Database Management Systems',4),('CS402','Design and analysis of Algorithms',4),('CS403','Operating Systems',4),('CS404','Computer Organisation and Architecture',4),('EC101','Basic Electronics Circuits',4),('EC201','Basic Electrical Engineering',4),('EC301','Digital Logic Design',4),('EC601','Digital IC Design',4),('HS101','Spoken and written',2),('HS201','Science,Technology and society',2),('HS301','Technical Writing',2),('HS401','Economics',2),('MA101','Linear Algebra',4),('MA201','Discrete Mathematics',4),('MA301','Probability and Statistics',4),('MA401','Numerical Techniques',4),('PHY101','Waves and Electromagnetics',4),('PHY201','Quantum Physics',3);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-06-25 09:24:47.587419','2','kamal@gmail.com',1,'[{\"added\": {}}, {\"added\": {\"name\": \"faculty\", \"object\": \"Faculty object (2)\"}}]',6,1),(2,'2020-06-25 09:25:30.212849','3','antrikshg@gmail.com',1,'[{\"added\": {}}, {\"added\": {\"name\": \"faculty\", \"object\": \"Faculty object (3)\"}}]',6,1),(3,'2020-06-25 09:25:58.613544','4','nk@gmail.com',1,'[{\"added\": {}}, {\"added\": {\"name\": \"faculty\", \"object\": \"Faculty object (4)\"}}]',6,1),(4,'2020-06-25 09:26:17.517757','5','jb@gmail.com',1,'[{\"added\": {}}, {\"added\": {\"name\": \"faculty\", \"object\": \"Faculty object (5)\"}}]',6,1),(5,'2020-06-25 09:26:38.543789','6','an@gmail.com',1,'[{\"added\": {}}, {\"added\": {\"name\": \"faculty\", \"object\": \"Faculty object (6)\"}}]',6,1),(6,'2020-06-25 09:27:43.840143','7','me@me.com',1,'[{\"added\": {}}, {\"added\": {\"name\": \"student\", \"object\": \"Student object (201851084)\"}}]',6,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'accounts','attendance'),(10,'accounts','branch'),(20,'accounts','branchcourse'),(11,'accounts','class'),(12,'accounts','classcourse'),(13,'accounts','course'),(14,'accounts','enrollment'),(15,'accounts','exam'),(7,'accounts','faculty'),(16,'accounts','lecture'),(21,'accounts','marks'),(8,'accounts','student'),(17,'accounts','studentclass'),(18,'accounts','studentclasscourse'),(19,'accounts','timetable'),(6,'accounts','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'accounts','0001_initial','2020-06-25 09:17:17.927921'),(2,'accounts','0002_auto_20200625_0853','2020-06-25 09:17:18.237688'),(3,'contenttypes','0001_initial','2020-06-25 09:17:18.322900'),(4,'admin','0001_initial','2020-06-25 09:17:18.385397'),(5,'admin','0002_logentry_remove_auto_add','2020-06-25 09:17:18.702118'),(6,'admin','0003_logentry_add_action_flag_choices','2020-06-25 09:17:18.721069'),(7,'contenttypes','0002_remove_content_type_name','2020-06-25 09:17:18.962852'),(8,'auth','0001_initial','2020-06-25 09:17:19.105330'),(9,'auth','0002_alter_permission_name_max_length','2020-06-25 09:17:19.785039'),(10,'auth','0003_alter_user_email_max_length','2020-06-25 09:17:19.799999'),(11,'auth','0004_alter_user_username_opts','2020-06-25 09:17:19.813001'),(12,'auth','0005_alter_user_last_login_null','2020-06-25 09:17:19.823935'),(13,'auth','0006_require_contenttypes_0002','2020-06-25 09:17:19.830915'),(14,'auth','0007_alter_validators_add_error_messages','2020-06-25 09:17:19.841922'),(15,'auth','0008_alter_user_username_max_length','2020-06-25 09:17:19.852894'),(16,'auth','0009_alter_user_last_name_max_length','2020-06-25 09:17:19.865859'),(17,'auth','0010_alter_group_name_max_length','2020-06-25 09:17:19.906715'),(18,'auth','0011_update_proxy_permissions','2020-06-25 09:17:19.924668'),(19,'sessions','0001_initial','2020-06-25 09:17:19.965556');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('76xthwrtv90zmq2z8laa70776zyjujit','OGVjZjI1MGEyZmNmZjJkYTY4ZWExOGEwNzljNTU5MDgzZGM4NDJhMjp7fQ==','2020-07-10 12:15:33.581737'),('k520ql1ajzctlko0daunb6z1sdlnbgk1','OGVjZjI1MGEyZmNmZjJkYTY4ZWExOGEwNzljNTU5MDgzZGM4NDJhMjp7fQ==','2020-07-10 12:15:14.395372'),('os1cwqtg8te5xs73iev5potst75wmo5z','ZWFmNjM0NmIzZDlkZmFjMGRlMzljYTM0MWU4OTNhYzJjZDI5OTc2ZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzA5NDM1MmY0OTk0ZTM4ZjUwMjQ5ZWE3MGUwYzViZjE3OTA2NmY3In0=','2020-07-10 15:56:39.301686'),('sgjcm69543mk20r9ecgqwxv4zuaynz57','OGVjZjI1MGEyZmNmZjJkYTY4ZWExOGEwNzljNTU5MDgzZGM4NDJhMjp7fQ==','2020-07-10 04:39:40.306487');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `enrollid` int unsigned NOT NULL AUTO_INCREMENT,
  `courseid` varchar(6) DEFAULT NULL,
  `studentid` char(9) DEFAULT NULL,
  `ac_year` year DEFAULT NULL,
  `sem` tinyint DEFAULT NULL,
  PRIMARY KEY (`enrollid`),
  UNIQUE KEY `courseid` (`courseid`,`studentid`),
  KEY `studentid` (`studentid`),
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`studentid`) REFERENCES `student` (`studentid`),
  CONSTRAINT `enrollment_chk_1` CHECK ((`sem` in (1,2)))
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,'CS401','201851084',2019,2),(2,'CS401','201851010',2019,2),(3,'CS401','201851020',2019,2),(4,'CS401','201851030',2019,2),(5,'CS401','201851040',2019,2),(6,'CS401','201851050',2019,2),(7,'CS401','201851060',2019,2),(8,'CS401','201851070',2019,2),(9,'CS401','201851082',2019,2),(10,'CS401','201851090',2019,2),(11,'CS401','201851099',2019,2),(12,'CS401','201851110',2019,2),(13,'CS401','201851120',2019,2),(14,'CS401','201851130',2019,2),(15,'CS401','201851140',2019,2),(16,'CS401','201851150',2019,2),(17,'CS401','201852010',2019,2),(18,'CS401','201852020',2019,2),(19,'CS401','201852030',2019,2),(20,'CS402','201851084',2019,2),(21,'CS402','201851010',2019,2),(22,'CS402','201851020',2019,2),(23,'CS402','201851030',2019,2),(24,'CS402','201851040',2019,2),(25,'CS402','201851050',2019,2),(26,'CS402','201851060',2019,2),(27,'CS402','201851070',2019,2),(28,'CS402','201851082',2019,2),(29,'CS402','201851090',2019,2),(30,'CS402','201851099',2019,2),(31,'CS402','201851110',2019,2),(32,'CS402','201851120',2019,2),(33,'CS402','201851130',2019,2),(34,'CS402','201851140',2019,2),(35,'CS402','201851150',2019,2),(36,'CS402','201852010',2019,2),(37,'CS402','201852020',2019,2),(38,'CS402','201852030',2019,2),(39,'CS403','201851084',2019,2),(40,'CS403','201851010',2019,2),(41,'CS403','201851020',2019,2),(42,'CS403','201851030',2019,2),(43,'CS403','201851040',2019,2),(44,'CS403','201851050',2019,2),(45,'CS403','201851060',2019,2),(46,'CS403','201851070',2019,2),(47,'CS403','201851082',2019,2),(48,'CS403','201851090',2019,2),(49,'CS403','201851099',2019,2),(50,'CS403','201851110',2019,2),(51,'CS403','201851120',2019,2),(52,'CS403','201851130',2019,2),(53,'CS403','201851140',2019,2),(54,'CS403','201851150',2019,2),(55,'CS403','201852010',2019,2),(56,'CS403','201852020',2019,2),(57,'CS403','201852030',2019,2),(58,'MA401','201851084',2019,2),(59,'MA401','201851010',2019,2),(60,'MA401','201851020',2019,2),(61,'MA401','201851030',2019,2),(62,'MA401','201851040',2019,2),(63,'MA401','201851050',2019,2),(64,'MA401','201851060',2019,2),(65,'MA401','201851070',2019,2),(66,'MA401','201851082',2019,2),(67,'MA401','201851090',2019,2),(68,'MA401','201851099',2019,2),(69,'MA401','201851110',2019,2),(70,'MA401','201851120',2019,2),(71,'MA401','201851130',2019,2),(72,'MA401','201851140',2019,2),(73,'MA401','201851150',2019,2),(74,'MA401','201852010',2019,2),(75,'MA401','201852020',2019,2),(76,'MA401','201852030',2019,2),(77,'HS401','201851084',2019,2),(78,'HS401','201851010',2019,2),(79,'HS401','201851020',2019,2),(80,'HS401','201851030',2019,2),(81,'HS401','201851040',2019,2),(82,'HS401','201851050',2019,2),(83,'HS401','201851060',2019,2),(84,'HS401','201851070',2019,2),(85,'HS401','201851082',2019,2),(86,'HS401','201851090',2019,2),(87,'HS401','201851099',2019,2),(88,'HS401','201851110',2019,2),(89,'HS401','201851120',2019,2),(90,'HS401','201851130',2019,2),(91,'HS401','201851140',2019,2),(92,'HS401','201851150',2019,2),(93,'HS401','201852010',2019,2),(94,'HS401','201852020',2019,2),(95,'HS401','201852030',2019,2);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `examid` int unsigned NOT NULL AUTO_INCREMENT,
  `classcourseid` int unsigned DEFAULT NULL,
  `examtype` char(6) NOT NULL,
  `edate` date DEFAULT NULL,
  `total` tinyint unsigned NOT NULL,
  PRIMARY KEY (`examid`),
  UNIQUE KEY `classcourseid` (`classcourseid`,`examtype`,`edate`),
  CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`classcourseid`) REFERENCES `class_course` (`classcourseid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,1,'insem1','2020-11-05',20),(2,1,'insem2','2020-11-06',20),(3,2,'insem1','2020-12-05',20),(4,2,'insem2','2020-11-06',20);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `student_list_exam` AFTER INSERT ON `exam` FOR EACH ROW BEGIN
    insert into marks(examid,studentid,obtained)
    select new.examid,studentid,0 from
	student_classcourse where student_classcourse.classcourseid=new.classcourseid;    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `facultyid` int NOT NULL,
  `facultyname` varchar(60) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`facultyid`),
  CONSTRAINT `accounts_faculty_facultyid_a271ae3a_fk_accounts_user_id` FOREIGN KEY (`facultyid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (2,'kkj','M',NULL,NULL),(3,'ag','M',NULL,NULL),(4,'nk','M',NULL,NULL),(5,'jb','M',NULL,NULL),(6,'an','M',NULL,NULL);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture` (
  `lectureid` int unsigned NOT NULL AUTO_INCREMENT,
  `facultyid` int NOT NULL,
  `classcourseid` int unsigned DEFAULT NULL,
  `timedate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`lectureid`),
  UNIQUE KEY `facultyid` (`facultyid`,`classcourseid`,`timedate`),
  KEY `classcourseid` (`classcourseid`),
  CONSTRAINT `lecture_ibfk_1` FOREIGN KEY (`facultyid`) REFERENCES `faculty` (`facultyid`),
  CONSTRAINT `lecture_ibfk_2` FOREIGN KEY (`classcourseid`) REFERENCES `class_course` (`classcourseid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES (1,2,1,'2020-06-25 03:30:00'),(11,2,1,'2020-06-26 03:30:00'),(5,2,6,'2020-06-25 05:15:00'),(2,2,8,'2020-06-25 03:30:00'),(6,2,11,'2020-06-25 05:15:00'),(4,4,3,'2020-06-25 05:15:00'),(12,4,8,'2020-06-26 03:30:00'),(3,4,13,'2020-06-25 03:30:00'),(13,4,13,'2020-06-26 03:30:00');
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `student_lecture` AFTER INSERT ON `lecture` FOR EACH ROW begin
    insert into  attendance(lectureid,studentid)
    select new.lectureid,studentid from student_classcourse	
    where new.classcourseid=student_classcourse.classcourseid;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marks` (
  `marksid` int unsigned NOT NULL AUTO_INCREMENT,
  `examid` int unsigned DEFAULT NULL,
  `studentid` varchar(9) NOT NULL,
  `obtained` int NOT NULL,
  PRIMARY KEY (`marksid`),
  UNIQUE KEY `examid` (`examid`,`studentid`),
  KEY `studentid` (`studentid`),
  CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `student` (`studentid`),
  CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`examid`) REFERENCES `exam` (`examid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES (1,1,'201851010',5),(2,1,'201851020',7),(3,1,'201851030',8),(4,1,'201851040',12),(5,1,'201851050',10),(6,1,'201851060',14),(7,1,'201851070',16),(8,1,'201851082',18),(9,1,'201851084',19),(10,1,'201851090',20),(11,2,'201851010',12),(12,2,'201851020',16),(13,2,'201851030',18),(14,2,'201851040',1),(15,2,'201851050',18),(16,2,'201851060',7),(17,2,'201851070',9),(18,2,'201851082',6),(19,2,'201851084',19),(20,2,'201851090',9),(21,3,'201851010',0),(22,3,'201851020',0),(23,3,'201851030',0),(24,3,'201851040',0),(25,3,'201851050',0),(26,3,'201851060',0),(27,3,'201851070',0),(28,3,'201851082',0),(29,3,'201851084',0),(30,3,'201851090',0),(31,4,'201851010',0),(32,4,'201851020',0),(33,4,'201851030',0),(34,4,'201851040',0),(35,4,'201851050',0),(36,4,'201851060',0),(37,4,'201851070',0),(38,4,'201851082',0),(39,4,'201851084',0),(40,4,'201851090',0);
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `studentid` varchar(9) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `UID` int DEFAULT NULL,
  PRIMARY KEY (`studentid`),
  UNIQUE KEY `UID_UNIQUE` (`UID`),
  CONSTRAINT `id` FOREIGN KEY (`UID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('201751010','Atthi',NULL,'santosh','M',NULL,NULL,NULL,NULL,NULL,NULL),('201751020','kartikey',NULL,'lakhotiya','M',NULL,NULL,NULL,NULL,NULL,NULL),('201751030','jainish','rajesh','parekh','M',NULL,NULL,NULL,NULL,NULL,NULL),('201751040','rajat',NULL,'kumar','M',NULL,NULL,NULL,NULL,NULL,NULL),('201751050','shashank',NULL,'patel','M',NULL,NULL,NULL,NULL,NULL,NULL),('201751060','varnika','dipak','dasgupta','F',NULL,NULL,NULL,NULL,NULL,NULL),('201752010','ankit',NULL,'gupta','M',NULL,NULL,NULL,NULL,NULL,NULL),('201752020','khusboo',NULL,'garg','M',NULL,NULL,NULL,NULL,NULL,NULL),('201752030','ravi',NULL,'varshney','M',NULL,NULL,NULL,NULL,NULL,NULL),('201851010','Ahmed',NULL,'Jilani','M',NULL,NULL,NULL,NULL,NULL,NULL),('201851020','Anagha',NULL,'mittal','F',NULL,NULL,NULL,NULL,NULL,NULL),('201851030','Ayush',NULL,'Tamta','M',NULL,NULL,NULL,NULL,NULL,NULL),('201851040','Rajiv','dharavat','gandhi','M',NULL,NULL,NULL,NULL,NULL,NULL),('201851050','hritik',NULL,'vaishnav','M',NULL,NULL,NULL,NULL,NULL,NULL),('201851060','Premkumar',NULL,'kodavath','M',NULL,NULL,NULL,NULL,NULL,NULL),('201851070','naveen',NULL,'kumar','M',NULL,NULL,NULL,NULL,NULL,NULL),('201851082','Darshan','arunbhai','patel','M',NULL,NULL,NULL,NULL,NULL,NULL),('201851084','me','me','me','M','2020-06-25',NULL,NULL,NULL,NULL,7),('201851090','prateek',NULL,'senapati','M',NULL,NULL,NULL,NULL,NULL,NULL),('201851099','yassh','narendra','ramchandani','M',NULL,NULL,NULL,NULL,NULL,NULL),('201851110','naveen',NULL,'sapavat','M',NULL,NULL,NULL,NULL,NULL,NULL),('201851120','shilp',NULL,'khatri','M',NULL,NULL,NULL,NULL,NULL,NULL),('201851130','sudhansu',NULL,'mishra','M',NULL,NULL,NULL,NULL,NULL,NULL),('201851140','vanshika',NULL,'panwar','F',NULL,NULL,NULL,NULL,NULL,NULL),('201851150','yash',NULL,'shah','M',NULL,NULL,NULL,NULL,NULL,NULL),('201852010','jhanvi',NULL,'gouru','F',NULL,NULL,NULL,NULL,NULL,NULL),('201852020','mayur',NULL,'gupta','M',NULL,NULL,NULL,NULL,NULL,NULL),('201852030','swasti',NULL,'khurana','F',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `setbatch` BEFORE INSERT ON `student` FOR EACH ROW BEGIN

		if substring(new.studentid,6,1) ='1' then
		if cast(substring(new.studentid,7,3) as unsigned)>=(select capacity from branch where branchid="cs") then
		signal sqlstate '45000' set message_text = 'Branch capacity reached !';
        
        end if;
        
        else
        if cast(substring(new.studentid,7,3) as unsigned)>=(select capacity from branch where branchid="it") then
		signal sqlstate '45000' set message_text = 'Branch capacity reached !';
        end if;
        
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student_class`
--

DROP TABLE IF EXISTS `student_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_class` (
  `studentid` char(9) DEFAULT NULL,
  `section` char(7) DEFAULT NULL,
  `labgroup` char(7) DEFAULT NULL,
  KEY `section` (`section`),
  KEY `labgroup` (`labgroup`),
  KEY `studentid` (`studentid`),
  CONSTRAINT `student_class_ibfk_1` FOREIGN KEY (`section`) REFERENCES `class` (`classid`),
  CONSTRAINT `student_class_ibfk_2` FOREIGN KEY (`labgroup`) REFERENCES `class` (`classid`),
  CONSTRAINT `student_class_ibfk_3` FOREIGN KEY (`studentid`) REFERENCES `student` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_class`
--

LOCK TABLES `student_class` WRITE;
/*!40000 ALTER TABLE `student_class` DISABLE KEYS */;
INSERT INTO `student_class` VALUES ('201851084','CS20181',NULL),('201851010','CS20181',NULL),('201851020','CS20181',NULL),('201851030','CS20181',NULL),('201851040','CS20181',NULL),('201851050','CS20181',NULL),('201851060','CS20181',NULL),('201851070','CS20181',NULL),('201851082','CS20181',NULL),('201851090','CS20181',NULL),('201851099','CS20182',NULL),('201851110','CS20182',NULL),('201851120','CS20182',NULL),('201851130','CS20182',NULL),('201851140','CS20182',NULL),('201851150','CS20182',NULL),('201852010','IT20182',NULL),('201852020','IT20182',NULL),('201852030','IT20182',NULL),('201851084',NULL,'CS2018a'),('201851010',NULL,'CS2018a'),('201851020',NULL,'CS2018a'),('201851030',NULL,'CS2018a'),('201851040',NULL,'CS2018a'),('201851050',NULL,'CS2018a'),('201851060',NULL,'CS2018a'),('201851070',NULL,'CS2018b'),('201851082',NULL,'CS2018b'),('201851090',NULL,'CS2018b'),('201851099',NULL,'CS2018b'),('201851110',NULL,'CS2018b'),('201851120',NULL,'CS2018b'),('201851130',NULL,'CS2018b'),('201851140',NULL,'CS2018c'),('201851150',NULL,'CS2018c'),('201852010',NULL,'IT2018c'),('201852020',NULL,'IT2018c'),('201852030',NULL,'IT2018c');
/*!40000 ALTER TABLE `student_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_classcourse`
--

DROP TABLE IF EXISTS `student_classcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_classcourse` (
  `studentid` char(9) NOT NULL,
  `classcourseid` int unsigned NOT NULL,
  PRIMARY KEY (`studentid`,`classcourseid`),
  KEY `classcourseid` (`classcourseid`),
  CONSTRAINT `student_classcourse_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `student` (`studentid`),
  CONSTRAINT `student_classcourse_ibfk_2` FOREIGN KEY (`classcourseid`) REFERENCES `class_course` (`classcourseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_classcourse`
--

LOCK TABLES `student_classcourse` WRITE;
/*!40000 ALTER TABLE `student_classcourse` DISABLE KEYS */;
INSERT INTO `student_classcourse` VALUES ('201851010',1),('201851020',1),('201851030',1),('201851040',1),('201851050',1),('201851060',1),('201851070',1),('201851082',1),('201851084',1),('201851090',1),('201851010',2),('201851020',2),('201851030',2),('201851040',2),('201851050',2),('201851060',2),('201851070',2),('201851082',2),('201851084',2),('201851090',2),('201851010',3),('201851020',3),('201851030',3),('201851040',3),('201851050',3),('201851060',3),('201851070',3),('201851082',3),('201851084',3),('201851090',3),('201851010',4),('201851020',4),('201851030',4),('201851040',4),('201851050',4),('201851060',4),('201851070',4),('201851082',4),('201851084',4),('201851090',4),('201851010',5),('201851020',5),('201851030',5),('201851040',5),('201851050',5),('201851060',5),('201851070',5),('201851082',5),('201851084',5),('201851090',5),('201851099',6),('201851110',6),('201851120',6),('201851130',6),('201851140',6),('201851150',6),('201851099',7),('201851110',7),('201851120',7),('201851130',7),('201851140',7),('201851150',7),('201851099',8),('201851110',8),('201851120',8),('201851130',8),('201851140',8),('201851150',8),('201851099',9),('201851110',9),('201851120',9),('201851130',9),('201851140',9),('201851150',9),('201851099',10),('201851110',10),('201851120',10),('201851130',10),('201851140',10),('201851150',10),('201852010',11),('201852020',11),('201852030',11),('201852010',12),('201852020',12),('201852030',12),('201852010',13),('201852020',13),('201852030',13),('201852010',14),('201852020',14),('201852030',14),('201852010',15),('201852020',15),('201852030',15);
/*!40000 ALTER TABLE `student_classcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable` (
  `weekday` tinyint unsigned DEFAULT NULL,
  `facultyid` int DEFAULT NULL,
  `classcourseid` int unsigned DEFAULT NULL,
  `starttime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  `room` char(4) DEFAULT NULL,
  KEY `facultyid` (`facultyid`),
  KEY `classcourseid` (`classcourseid`),
  CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`facultyid`) REFERENCES `faculty` (`facultyid`),
  CONSTRAINT `timetable_ibfk_2` FOREIGN KEY (`classcourseid`) REFERENCES `class_course` (`classcourseid`) ON UPDATE CASCADE,
  CONSTRAINT `timetable_chk_1` CHECK ((`weekday` between 2 and 7))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (2,2,1,'09:00:00','10:30:00','8001'),(2,6,10,'09:00:00','10:30:00','8001'),(2,6,15,'09:00:00','10:30:00','8001'),(2,6,5,'10:45:00','12:15:00','8001'),(2,3,7,'10:45:00','12:15:00','8001'),(2,3,12,'10:45:00','12:15:00','8001'),(3,4,3,'09:00:00','10:30:00','8001'),(3,2,6,'09:00:00','10:30:00','8001'),(3,2,11,'09:00:00','10:30:00','8001'),(3,3,2,'10:45:00','12:15:00','8001'),(3,4,8,'10:45:00','12:15:00','8001'),(3,4,13,'10:45:00','12:15:00','8001'),(4,6,5,'09:00:00','10:30:00','8001'),(4,3,7,'09:00:00','10:30:00','8001'),(4,3,12,'09:00:00','10:30:00','8001'),(4,3,2,'10:45:00','12:15:00','8001'),(4,6,10,'10:45:00','12:15:00','8001'),(4,6,15,'10:45:00','12:15:00','8001'),(5,2,1,'09:00:00','10:30:00','8001'),(5,2,8,'09:00:00','10:30:00','8001'),(5,4,13,'09:00:00','10:30:00','8001'),(5,4,3,'10:45:00','12:15:00','8001'),(5,2,6,'10:45:00','12:15:00','8001'),(5,2,11,'10:45:00','12:15:00','8001'),(6,2,1,'09:00:00','10:30:00','8001'),(6,4,8,'09:00:00','10:30:00','8001'),(6,4,13,'09:00:00','10:30:00','8001'),(6,4,3,'10:45:00','12:15:00','8001'),(6,2,6,'10:45:00','12:15:00','8001'),(6,2,11,'10:45:00','12:15:00','8001');
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `role` tinyint(1) DEFAULT NULL,
  `staff` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'pbkdf2_sha256$180000$SKjGLLNlxKfP$obURyxW+pSf0vN/UBwfgf1y7UBFMYyvS4tBU2itdDWk=','2020-06-25 16:32:10.301701','admin@gmail.com',1,1,1,1),(2,'pbkdf2_sha256$180000$0sRz1MMpB3BV$a3K1rWUziAUKN7ki6fDh7gmVX5BwPDXgjdR08V0vfUs=','2020-06-26 15:56:39.285694','kamal@gmail.com',1,0,0,0),(3,'pbkdf2_sha256$180000$pDCn7LNMJmn4$lxVuYT9Rx3tMMoZgh7KmlIkyJkbalqYb3ns46QBSarU=',NULL,'antrikshg@gmail.com',1,0,0,0),(4,'pbkdf2_sha256$180000$SPO252bJOabG$ICZtCIaDInMAFw9+dO8V4EDEX8V1h9zU9CKsIqTbj84=','2020-06-25 16:36:53.700044','nk@gmail.com',1,0,0,0),(5,'pbkdf2_sha256$180000$yKF7N2kZyKRl$58Wvyjrl0T8No5JPp7hUih7SOotAMARnoxa69tdEUyA=',NULL,'jb@gmail.com',1,0,0,0),(6,'pbkdf2_sha256$180000$V8pdJpkS23uT$JpnzANoW3YAI6azobO71QPWKqLq6octT6xlGZeKxjeQ=',NULL,'an@gmail.com',1,0,0,0),(7,'pbkdf2_sha256$180000$JYkS7ysxVR0m$+f6aITMOU7JlpDwrhMqd61afJDMYyis0+LIpS5QQXa0=','2020-06-26 14:19:40.708088','me@me.com',1,1,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'project'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `issue_lecture` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `issue_lecture` ON SCHEDULE EVERY 90 MINUTE STARTS '2020-05-16 09:00:00' ON COMPLETION PRESERVE ENABLE DO BEGIN
		
	IF dayofweek(curdate()) BETWEEN 2 and 7 then
    
		insert  into lecture(facultyid,classcourseid,timedate) 
        select facultyid,classcourseid,timestamp(concat(curdate()," ",starttime)) 
		from timetable 
		where timetable.weekday=dayofweek(curdate()) and timetable.starttime<=curtime();
        
	END IF;
    END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'project'
--
/*!50003 DROP PROCEDURE IF EXISTS `classes_by_faculty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `classes_by_faculty`(IN facid int)
    READS SQL DATA
BEGIN
select classid,ac_year,sem from class_course where facultyid=facid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_all_students_attendance_by_faculty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_all_students_attendance_by_faculty`(IN f_id int,IN academic_year year,IN semester tinyint)
    READS SQL DATA
BEGIN

select studentid,count(distinct lectureid) as TotalLecutres,sum(attended) as AttendedLecutres from attendance natural join
(select lectureid,timedate from lecture natural join
(select classcourseid from class_course where facultyid=f_id and ac_year=academic_year and sem=semester)as t1)as t2
group by studentid
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_all_students_marks_by_faculty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_all_students_marks_by_faculty`(IN f_id int,IN academic_year year,IN semester tinyint)
    READS SQL DATA
BEGIN

select marksid,studentid,examtype,obtained,total from marks natural join
(select examid,total,examtype from exam natural join
(select classcourseid from class_course where ac_year=academic_year and sem=semester and facultyid=f_id) as t1)as t2;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_all_student_in_course_attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_all_student_in_course_attendance`(IN course char(6),IN class char(7),IN ac_year year,IN sem int)
    READS SQL DATA
BEGIN

select studentid,count(distinct lectureid)as total_lectures,sum(attended) as attended_lectures from( 
select lectureid from
(select classcourseid from class_course 
where courseid=course and classid=class and class_course.ac_year =ac_year and class_course.sem=sem)as t1 
natural join 
lecture) as t2
natural join attendance
group by studentid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_students_attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_students_attendance`(IN sid char(9),IN ac_year year,IN sem tinyint)
    READS SQL DATA
BEGIN

select courseid,count(attendanceid),sum(attended) from(
select lectureid,courseid from(
select classcourseid,courseid from
(select * from student_class 
where studentid=sid) as t1
join 
(select * from class_course
where class_course.ac_year=ac_year and class_course.sem=sem) as t2
where t1.section=t2.classid or t1.labgroup=t2.classid) as t3  natural join lecture) as t4 natural join attendance
where studentid=sid
group by courseid;    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_students_attendance_by_faculty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_students_attendance_by_faculty`(IN sid char(9),IN courseid char(6),IN academic_year year,IN semester tinyint)
    READS SQL DATA
BEGIN

SET @count:=0;
select attendanceid,(@count:=@count+1) as '#',date(timedate) as 'date',dayname(timedate) as 'day',attended from attendance natural join(
select lectureid,studentid,timedate from lecture natural join
(select classcourseid,studentid from
(select * from student_classcourse where studentid=sid) as t1
natural join
(select * from class_course where courseid=courseid and ac_year=academic_year and sem=semester) as t2)as t3) as t4;    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_students_marks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_students_marks`(IN sid char(9),IN academic_year year,IN semester tinyint)
    READS SQL DATA
BEGIN
select courseid,examtype,obtained,total from marks natural join
(select courseid,examid,studentid,total,examtype from exam natural join
(select classcourseid,courseid,studentid from
(select * from class_course where ac_year=academic_year and sem=semester) as t1
natural join
(select * from student_classcourse where studentid =sid) as t2) as t3)as t4
order by courseid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_students_marks_by_faculty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_students_marks_by_faculty`(IN sid char(9),IN c_id char(6),IN academic_year year,IN semester tinyint)
    READS SQL DATA
BEGIN

select marksid,examid,examtype,obtained,total from marks natural join
(select courseid,examid,studentid,total,examtype from exam natural join
(select classcourseid,courseid,studentid from
(select * from class_course where ac_year=academic_year and sem=semester and courseid=c_id) as t1
natural join
(select * from student_classcourse where studentid =sid) as t2) as t3)as t4
order by courseid;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_student_courses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_student_courses`(IN sid char(9),IN academic_year year,IN semester tinyint)
    READS SQL DATA
begin

select * from (select courseid from enrollment
where studentid=sid and ac_year=academic_year and sem=semester)as t1 
natural join course;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_timetable_faculty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_timetable_faculty`(IN f_id char(9),IN academic_year year,IN semester tinyint)
    READS SQL DATA
begin

select weekday,courseid,starttime,endtime,room from timetable natural join
(select classcourseid,courseid from class_course where ac_year=academic_year and sem=semester and facultyid=f_id) as t1
order by weekday;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_timitable_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_timitable_student`(IN sid char(9),IN academic_year year,IN semester tinyint)
    READS SQL DATA
begin

select courseid,weekday as  'day',starttime,endtime from
(select classcourseid,courseid from
(select * from student_classcourse where studentid=sid) as t1
natural join
(select * from class_course where ac_year=academic_year and sem=semester) as t2)as t3
natural join 
timetable
order by weekday;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-26 21:36:21
