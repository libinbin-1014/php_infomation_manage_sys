-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: gonghui
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `pwd` varchar(32) NOT NULL,
  `date` date DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (2,'admin','123456',NULL,1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eml_address_list`
--

DROP TABLE IF EXISTS `eml_address_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eml_address_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `sex` varchar(10) NOT NULL,
  `phone` varchar(128) DEFAULT NULL,
  `nation` varchar(128) DEFAULT NULL COMMENT 'æ°‘æ—',
  `duty` varchar(128) DEFAULT NULL COMMENT 'èŒåŠ¡',
  `idnumber` varchar(32) DEFAULT NULL COMMENT 'èº«ä»½è¯å·',
  `birthday` varchar(128) DEFAULT NULL COMMENT 'å‡ºç”Ÿæ—¶é—´',
  `address` varchar(512) DEFAULT NULL COMMENT 'å±…ä½åœ°',
  `edu` int(11) DEFAULT '0' COMMENT ' 0 å°å­¦ 1 åˆä¸­ 2 é«˜ä¸­ 3å¤§ä¸“ 4æœ¬ç§‘ 5ç ”ç©¶ç”Ÿ 6åšå£«',
  `title` varchar(512) DEFAULT NULL COMMENT 'èŒç§°',
  `title_date` varchar(512) DEFAULT NULL COMMENT 'èŒç§°èŽ·å¾—æ—¥æœŸ',
  `skill_level` varchar(1024) DEFAULT NULL COMMENT 'æŠ€èƒ½ç­‰çº§',
  `speciality` varchar(1024) DEFAULT NULL COMMENT 'ç‰¹é•¿',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deparyment` varchar(20) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `roleid` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eml_address_list`
--

LOCK TABLES `eml_address_list` WRITE;
/*!40000 ALTER TABLE `eml_address_list` DISABLE KEYS */;
INSERT INTO `eml_address_list` VALUES (32,'李彬彬','男','17600591345','汉','工程师','1304341990','2019-03-06','北京市',0,'高级工程师','1992-05-1','试试','额',1552301694,1552301746,'','','','',NULL,0),(33,'宁舰','男','','汉','基层搬砖工','1304341565xxs123','1995-07-13','324恩我是荣盛',5,'局长','2019-03-14','高级','跑步',1552355006,1552356194,'','','','',NULL,0);
/*!40000 ALTER TABLE `eml_address_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eml_user`
--

DROP TABLE IF EXISTS `eml_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eml_user` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `deparyment` varchar(20) NOT NULL,
  `position` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `roleid` int(11) unsigned NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eml_user`
--

LOCK TABLES `eml_user` WRITE;
/*!40000 ALTER TABLE `eml_user` DISABLE KEYS */;
INSERT INTO `eml_user` VALUES (3,'admin','827ccb0eea8a706c4c34a16891f84e7b','','男','','','','','','','',1,1552300269,0),(4,'test','e10adc3949ba59abbe56e057f20f883e','test','男','','','','','','','',2,1552305313,0);
/*!40000 ALTER TABLE `eml_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `sex` int(11) DEFAULT '0' COMMENT '0 male 1 female',
  `phone` varchar(128) DEFAULT NULL,
  `nation` varchar(128) DEFAULT NULL COMMENT 'æ°‘æ—',
  `duty` varchar(128) DEFAULT NULL COMMENT 'èŒåŠ¡',
  `idnumber` varchar(32) DEFAULT NULL COMMENT 'èº«ä»½è¯å·',
  `date_of_birth` varchar(128) DEFAULT NULL COMMENT 'å‡ºç”Ÿæ—¶é—´',
  `address` varchar(512) DEFAULT NULL COMMENT 'å±…ä½åœ°',
  `education` int(11) DEFAULT '0' COMMENT ' 0 å°å­¦ 1 åˆä¸­ 2 é«˜ä¸­ 3å¤§ä¸“ 4æœ¬ç§‘ 5ç ”ç©¶ç”Ÿ 6åšå£«',
  `title` varchar(512) DEFAULT NULL COMMENT 'èŒç§°',
  `title_date` varchar(512) DEFAULT NULL COMMENT 'èŒç§°èŽ·å¾—æ—¥æœŸ',
  `skills` varchar(1024) DEFAULT NULL COMMENT 'æŠ€èƒ½ç­‰çº§',
  `speciality` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (27,'89',1,'1234','13703206101','0','13046645595532','1992-10-14','123æ’’å¤§æ”¾é€',4,'å·¥è¡Œæ›¾æ˜¯åŠ©ç†','1992-05-1','é«˜çº§','è·‘æ­¥'),(30,'89',0,'13703206101','1234','0','130434111111123',NULL,'23',0,NULL,NULL,NULL,NULL),(28,'',1,'','1234','0','',NULL,'',0,NULL,NULL,NULL,NULL),(29,'8923',1,'12301231324','1234','0','1304341111111','0','0',0,NULL,NULL,NULL,NULL),(23,'89',0,'1234',NULL,NULL,'123012313254',NULL,NULL,0,NULL,NULL,NULL,NULL),(24,'89',0,'1234',NULL,NULL,'12301231324',NULL,NULL,0,NULL,NULL,NULL,NULL),(25,'89',0,'1234',NULL,NULL,'12301231324',NULL,NULL,0,NULL,NULL,NULL,NULL),(31,'æŽå½¬å½¬',1,'æ±‰','18701502238','å·¥ç¨‹å¸ˆ','130434199210xx','1992-10-14','åŒ—äº¬æµ·æ·€',0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_list`
--

DROP TABLE IF EXISTS `user_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `sex` varchar(10) NOT NULL,
  `phone` varchar(128) DEFAULT NULL,
  `nation` varchar(128) DEFAULT NULL COMMENT 'æ°‘æ—',
  `duty` varchar(128) DEFAULT NULL COMMENT 'èŒåŠ¡',
  `idnumber` varchar(32) DEFAULT NULL COMMENT 'èº«ä»½è¯å·',
  `birthday` varchar(128) DEFAULT NULL COMMENT 'å‡ºç”Ÿæ—¶é—´',
  `address` varchar(512) DEFAULT NULL COMMENT 'å±…ä½åœ°',
  `edu` int(11) DEFAULT '0' COMMENT ' 0 å°å­¦ 1 åˆä¸­ 2 é«˜ä¸­ 3å¤§ä¸“ 4æœ¬ç§‘ 5ç ”ç©¶ç”Ÿ 6åšå£«',
  `title` varchar(512) DEFAULT NULL COMMENT 'èŒç§°',
  `title_date` varchar(512) DEFAULT NULL COMMENT 'èŒç§°èŽ·å¾—æ—¥æœŸ',
  `skill_level` varchar(1024) DEFAULT NULL COMMENT 'æŠ€èƒ½ç­‰çº§',
  `speciality` varchar(1024) DEFAULT NULL COMMENT 'ç‰¹é•¿',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_list`
--

LOCK TABLES `user_list` WRITE;
/*!40000 ALTER TABLE `user_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-12 10:11:19
