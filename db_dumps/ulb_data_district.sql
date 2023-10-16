CREATE DATABASE  IF NOT EXISTS `ulb_data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ulb_data`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ulb_data
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `dist_id` int NOT NULL AUTO_INCREMENT,
  `dist_name` char(100) NOT NULL,
  `dist_div_id` int NOT NULL,
  PRIMARY KEY (`dist_id`),
  KEY `fk_div_dist` (`dist_div_id`),
  CONSTRAINT `fk_div_dist` FOREIGN KEY (`dist_div_id`) REFERENCES `division` (`div_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'Belagavi',1),(2,'Bagalakote',1),(3,'Vijayapura',1),(4,'Bidar',3),(5,'Raichur',3),(6,'Koppal',3),(7,'Gadag',1),(8,'Dharwad',1),(9,'Uttara Kannada',1),(10,'Haveri',1),(11,'Ballari',3),(12,'Chitradurga',2),(13,'Davanagere',2),(14,'Shivamogga',2),(15,'Udupi',4),(16,'Chikkamagaluru',4),(17,'Tumakuru',2),(18,'Bengaluru Urban',2),(19,'Mandya',4),(20,'Hassan',4),(21,'Dakshina Kannada',4),(22,'Kodagu',4),(23,'Mysuru',4),(24,'Chamarajanagara',4),(25,'Kalaburagi',3),(26,'Yadagiri',3),(27,'Kolar',2),(28,'Chikkaballapura',2),(29,'Bengaluru Rural',2),(30,'Ramanagara',2),(31,'Vijayanagara',3);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-16 16:44:58
