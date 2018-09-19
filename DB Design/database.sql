/*  Author: Arunika Oyshi
 *  Timestamp: 9/18/2018 9:32 PM
 */

DROP DATABASE IF EXISTS `course_gradebook` ;
CREATE DATABASE  IF NOT EXISTS `course_gradebook` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `course_gradebook`;

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT, 
  `firstName` varchar(50) COLLATE utf8_bin NOT NULL,
  `lastName` varchar(50) COLLATE utf8_bin NOT NULL,
  `utaID` char(10) COLLATE utf8_bin NOT NULL,  
  `role` varchar(10) COLLATE utf8_bin NOT NULL,
  `netID` char(7) COLLATE utf8_bin NOT NULL,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `utaID_UNIQUE` (`utaID`),
  UNIQUE KEY `netID_UNIQUE` (`netID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE user AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `number` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE course AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `studentID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `letterGrade` varchar(4) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  CONSTRAINT `fk_course` FOREIGN KEY (`courseID`) REFERENCES `course` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student` FOREIGN KEY (`studentID`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE grade AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `professorID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  CONSTRAINT `fk_course_taught` FOREIGN KEY (`courseID`) REFERENCES `course` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor` FOREIGN KEY (`professorID`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE professor AUTO_INCREMENT=1;
