-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: brainEngraver
-- ------------------------------------------------------
-- Server version	5.7.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Exam`
--

DROP TABLE IF EXISTS `Exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(45) NOT NULL,
  `meaning` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exam`
--

LOCK TABLES `Exam` WRITE;
/*!40000 ALTER TABLE `Exam` DISABLE KEYS */;
INSERT INTO `Exam` VALUES (1,'','');
/*!40000 ALTER TABLE `Exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ForgettingRate`
--

DROP TABLE IF EXISTS `ForgettingRate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ForgettingRate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `wordId` int(11) NOT NULL,
  `correct` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ForgettingRate`
--

LOCK TABLES `ForgettingRate` WRITE;
/*!40000 ALTER TABLE `ForgettingRate` DISABLE KEYS */;
/*!40000 ALTER TABLE `ForgettingRate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubWordSet`
--

DROP TABLE IF EXISTS `SubWordSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubWordSet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wordSetId` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `studied` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubWordSet`
--

LOCK TABLES `SubWordSet` WRITE;
/*!40000 ALTER TABLE `SubWordSet` DISABLE KEYS */;
INSERT INTO `SubWordSet` VALUES (1,'1','Chapter1',0),(2,'1','Chapter2',0),(3,'1','Chapter3',0),(4,'2','Chapter1',0),(5,'2','Chapter2',0),(6,'2','Chapter3',0);
/*!40000 ALTER TABLE `SubWordSet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idUser_UNIQUE` (`id`),
  UNIQUE KEY `userId_UNIQUE` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (6,'kiMin','kiMin','1234');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Word`
--

DROP TABLE IF EXISTS `Word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wordSetId` int(11) NOT NULL,
  `subWordSetId` int(11) NOT NULL,
  `word` varchar(45) NOT NULL,
  `meaning` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Word`
--

LOCK TABLES `Word` WRITE;
/*!40000 ALTER TABLE `Word` DISABLE KEYS */;
INSERT INTO `Word` VALUES (1,1,1,'green','초록색'),(2,1,1,'yellow','노란색'),(3,1,1,'red','빨간색'),(4,1,1,'blue','파란색'),(5,1,1,'purple','보라색'),(6,1,2,'alpha','알파'),(7,1,2,'beta','베타'),(8,1,2,'omega','오메가'),(9,1,2,'delta','델타'),(10,1,2,'theta','세타');
/*!40000 ALTER TABLE `Word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WordSet`
--

DROP TABLE IF EXISTS `WordSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WordSet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WordSet`
--

LOCK TABLES `WordSet` WRITE;
/*!40000 ALTER TABLE `WordSet` DISABLE KEYS */;
INSERT INTO `WordSet` VALUES (2,'TOEFL'),(1,'TOEIC');
/*!40000 ALTER TABLE `WordSet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-19 21:54:32
