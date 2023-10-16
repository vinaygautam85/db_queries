CREATE DATABASE  IF NOT EXISTS `budget_data_2024_25` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `budget_data_2024_25`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: budget_data_2024_25
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
-- Table structure for table `salary_budget_2024_25`
--

DROP TABLE IF EXISTS `salary_budget_2024_25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_budget_2024_25` (
  `ulb_name` varchar(100) NOT NULL,
  `ulb_hrms_code` varchar(10) DEFAULT NULL,
  `emp_id` bigint NOT NULL,
  `pension_type` varchar(5) DEFAULT NULL,
  `pran` bigint DEFAULT NULL,
  `emp_name` varchar(100) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `payscale_min` int DEFAULT NULL,
  `payscale_max` int DEFAULT NULL,
  `basic_pay` int DEFAULT NULL,
  `basic_pay_for_year` int DEFAULT NULL,
  `increment_month` date DEFAULT NULL,
  `increment_rate` int DEFAULT NULL,
  `increment_for_year` int DEFAULT NULL,
  `basic_incrnt_total` int DEFAULT NULL,
  `da_for_year` int DEFAULT NULL,
  `hra_for_year` int DEFAULT NULL,
  `ma_for_year` int DEFAULT NULL,
  `ua_pk_spcl_for_year` int DEFAULT NULL,
  `cca_for_year` int DEFAULT NULL,
  `other_allowance_type` varchar(5) DEFAULT NULL,
  `oa_amount_for_year` int DEFAULT NULL,
  `surrender_leave_encash` int DEFAULT NULL,
  `nps_contr_for_year` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_budget_2024_25`
--

LOCK TABLES `salary_budget_2024_25` WRITE;
/*!40000 ALTER TABLE `salary_budget_2024_25` DISABLE KEYS */;
INSERT INTO `salary_budget_2024_25` VALUES ('Tumakuru','2201CC0123',911121651,'NPS',123456789123,'sxdfcsdfd','F','RO',43100,83900,43100,517200,'2025-01-01',1100,3300,520500,229020,41640,0,0,3434,'SFN',1500,32965,104933,933992),('Tumakuru','2201CC0123',911254678,'OPS',NULL,'sdfsdfsdfd','F','PK',17000,28950,17000,204000,'2024-07-01',400,3600,207600,91344,16608,2400,8400,4800,'PP',1200,13148,0,345500),('Tumakuru','2201CC0123',911257426,'NPS',110145623852,'dsdfsdfsd','M','CAUO',74400,109600,74400,892800,'2025-01-01',1900,5700,898500,395340,71880,0,0,6000,'SFN',1500,56905,181138,1611263);
/*!40000 ALTER TABLE `salary_budget_2024_25` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-16 16:45:00
