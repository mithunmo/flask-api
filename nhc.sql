-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.21-MariaDB

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
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `created` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` VALUES (1,'NHC-Alerts','NHC-Alerts','0000-00-00'),(2,'NHC-Installation','NHC-Installation','0000-00-00'),(3,'NHC-Dashboard','NHC-Dashboard','0000-00-00');
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `created` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,'package1','Sanity testing','0000-00-00'),(2,'charlie 2.0','this is a new package ','0000-00-00'),(3,'daya_Test','','0000-00-00');
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packagesuite`
--

DROP TABLE IF EXISTS `packagesuite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packagesuite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testcaseID` int(11) NOT NULL,
  `featureID` int(11) NOT NULL,
  `packageID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packagesuite`
--

LOCK TABLES `packagesuite` WRITE;
/*!40000 ALTER TABLE `packagesuite` DISABLE KEYS */;
INSERT INTO `packagesuite` VALUES (1,2,1,1),(2,3,2,1),(3,2,1,2),(4,3,2,2),(5,2,1,3),(6,3,2,3);
/*!40000 ALTER TABLE `packagesuite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packageID` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `pass` int(11) NOT NULL,
  `fail` int(11) NOT NULL,
  `executed` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,1,4,2,2,'2017-06-08'),(2,1,4,2,2,'2017-06-08'),(3,2,4,2,2,'2017-06-12'),(4,3,4,2,2,'2017-06-14');
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultsuite`
--

DROP TABLE IF EXISTS `resultsuite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resultsuite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resultID` int(11) NOT NULL,
  `packageID` int(11) NOT NULL,
  `testcaseID` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `log` text NOT NULL,
  `executed` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultsuite`
--

LOCK TABLES `resultsuite` WRITE;
/*!40000 ALTER TABLE `resultsuite` DISABLE KEYS */;
INSERT INTO `resultsuite` VALUES (1,1,1,'My Test',0,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\nMy Test :: Example test                                               | PASS |\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | PASS |\r\n1 critical test, 1 passed, 0 failed\r\n1 test total, 1 passed, 0 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-08 08:20:52'),(2,1,1,'Another Test',0,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\nAnother Test                                                          | PASS |\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | PASS |\r\n1 critical test, 1 passed, 0 failed\r\n1 test total, 1 passed, 0 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-08 08:20:52'),(3,1,1,'test1',1,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\ntest1                                                                 | FAIL |\r\nTest case contains no keywords.\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | FAIL |\r\n1 critical test, 0 passed, 1 failed\r\n1 test total, 0 passed, 1 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-08 08:20:52'),(4,1,1,'Valid Login',1,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\nValid Login                                                           | FAIL |\r\nNo keyword with name \'Open Browser\' found.\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | FAIL |\r\n1 critical test, 0 passed, 1 failed\r\n1 test total, 0 passed, 1 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-08 08:20:52'),(5,2,1,'My Test',0,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\nMy Test :: Example test                                               | PASS |\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | PASS |\r\n1 critical test, 1 passed, 0 failed\r\n1 test total, 1 passed, 0 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-08 08:28:34'),(6,2,1,'Another Test',0,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\nAnother Test                                                          | PASS |\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | PASS |\r\n1 critical test, 1 passed, 0 failed\r\n1 test total, 1 passed, 0 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-08 08:28:34'),(7,2,1,'test1',1,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\ntest1                                                                 | FAIL |\r\nTest case contains no keywords.\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | FAIL |\r\n1 critical test, 0 passed, 1 failed\r\n1 test total, 0 passed, 1 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-08 08:28:34'),(8,2,1,'Valid Login',1,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\nValid Login                                                           | FAIL |\r\nNo keyword with name \'Open Browser\' found.\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | FAIL |\r\n1 critical test, 0 passed, 1 failed\r\n1 test total, 0 passed, 1 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-08 08:28:34'),(9,3,2,'My Test',0,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\nMy Test :: Example test                                               | PASS |\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | PASS |\r\n1 critical test, 1 passed, 0 failed\r\n1 test total, 1 passed, 0 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-12 17:10:07'),(10,3,2,'Another Test',0,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\nAnother Test                                                          | PASS |\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | PASS |\r\n1 critical test, 1 passed, 0 failed\r\n1 test total, 1 passed, 0 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-12 17:10:07'),(11,3,2,'test1',1,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\ntest1                                                                 | FAIL |\r\nTest case contains no keywords.\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | FAIL |\r\n1 critical test, 0 passed, 1 failed\r\n1 test total, 0 passed, 1 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-12 17:10:07'),(12,3,2,'Valid Login',1,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\nValid Login                                                           | FAIL |\r\nNo keyword with name \'Open Browser\' found.\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | FAIL |\r\n1 critical test, 0 passed, 1 failed\r\n1 test total, 0 passed, 1 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-12 17:10:07'),(13,4,3,'My Test',0,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\nMy Test :: Example test                                               | PASS |\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | PASS |\r\n1 critical test, 1 passed, 0 failed\r\n1 test total, 1 passed, 0 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-14 17:02:20'),(14,4,3,'Another Test',0,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\nAnother Test                                                          | PASS |\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | PASS |\r\n1 critical test, 1 passed, 0 failed\r\n1 test total, 1 passed, 0 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-14 17:02:20'),(15,4,3,'test1',1,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\ntest1                                                                 | FAIL |\r\nTest case contains no keywords.\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | FAIL |\r\n1 critical test, 0 passed, 1 failed\r\n1 test total, 0 passed, 1 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-14 17:02:20'),(16,4,3,'Valid Login',1,'==============================================================================\r\nTest1                                                                         \r\n==============================================================================\r\nValid Login                                                           | FAIL |\r\nNo keyword with name \'Open Browser\' found.\r\n------------------------------------------------------------------------------\r\nTest1                                                                 | FAIL |\r\n1 critical test, 0 passed, 1 failed\r\n1 test total, 0 passed, 1 failed\r\n==============================================================================\r\nOutput:  C:\\Users\\mohanm\\flask\\output.xml\r\nLog:     C:\\Users\\mohanm\\flask\\log.html\r\nReport:  C:\\Users\\mohanm\\flask\\report.html\r\n','2017-06-14 17:02:20');
/*!40000 ALTER TABLE `resultsuite` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-16 12:04:39
