-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: bank
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `second_name` varchar(45) DEFAULT NULL,
  `passport_series` varchar(4) NOT NULL,
  `passport_number` varchar(6) NOT NULL,
  `birthdate` date NOT NULL,
  `issued_by` varchar(155) NOT NULL,
  `issue_date` date NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Иванов','Иван','Иванович','0001','123456','1980-01-01','МВД России','2000-02-02','+79001112233'),(2,'Петров','Петр','Петрович','0002','654321','1975-05-12','ГУВД Москвы','1998-03-03','+79101234567'),(3,'Сидоров','Сергей','Сергеевич','0003','987654','1960-09-30','ФМС России','2010-04-04','+79202345678'),(4,'Васильев','Алексей','Владимирович','0004','789101','1985-07-21','Управление МВД','2005-06-06','+79303334455'),(5,'Фёдоров','Михаил','Павлович','0005','121314','1950-11-18','Главное управление ФМС','2007-08-08','+79404445566'),(6,'Орлова','Анна','Николаевна','0006','151617','1990-03-14','Отдел УФМС','2012-09-09','+79505556677'),(7,'Козлов','Дмитрий','Андреевич','0007','181920','1978-12-31','Федеральная миграционная служба','2015-10-10','+79606667788'),(8,'Смирнова','Елена','Константиновна','0008','212223','1965-04-27','Региональное отделение МВД','2020-11-11','+79707778899');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-11 10:58:30
