-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: springweb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `tb_complain`
--

DROP TABLE IF EXISTS `tb_complain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_complain` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `income` varchar(255) DEFAULT NULL COMMENT '工单来源',
  `contact` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0' COMMENT '工单状态\n0为工单未受理\n1为工单正在处理中\n2为工单已经完成',
  `type` varchar(255) DEFAULT NULL,
  `content` text COMMENT '内容详情',
  `number` varchar(255) DEFAULT NULL COMMENT '工单编号',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `tb_complain_cid_uindex` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3 COMMENT='工单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_complain`
--

LOCK TABLES `tb_complain` WRITE;
/*!40000 ALTER TABLE `tb_complain` DISABLE KEYS */;
INSERT INTO `tb_complain` VALUES (55,'温江柳台','辜勋昊','18228294740',2,'肇事逃逸','两人对骂','20200603'),(56,'温江柳台','辜勋昊','32132133',1,'学校事故','两人打架','20200603'),(64,'金牛区','蒋登禾2','18228294740',1,'肇事逃逸','谎的就看啥尽快哈是客户健康','202006060202'),(65,'温江柳台','蒋登禾2','18228294740',1,'交通事故','两人打架','20200602'),(68,'温江柳台','辜勋昊','18228294740',1,'交通事故','两人对骂','20200606');
/*!40000 ALTER TABLE `tb_complain` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-06  9:48:44
