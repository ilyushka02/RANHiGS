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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `second_name` varchar(45) DEFAULT NULL,
  `office_position` int NOT NULL,
  `department_id` int NOT NULL,
  `email` varchar(155) DEFAULT NULL,
  `phone_number` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `office_position` (`office_position`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`office_position`) REFERENCES `official_positions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_chk_1` CHECK ((`email` like _utf8mb4'%@%.%'))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Иванов','Иван','Иванович',2,6,'ivanov@example.com','+79161234567'),(2,'Кузнецова','Елена','Валерьевна',3,10,'kuznetsova@example.com','+79161235679'),(3,'Михайлов','Александр','Владимирович',5,6,'mikhailov@example.com','+79201235780'),(4,'Романова','Маргарита','Ивановна',4,8,'romanova@example.com','+79311235891'),(5,'Попов','Антон','Павлович',5,12,'popov@example.com','+79421235992'),(6,'Воробьев','Максим','Георгиевич',1,13,'vorobev@example.com','+79531236093'),(7,'Захарова','Татьяна','Анатольевна',5,6,'zaharova@example.com','+79641236194'),(8,'Коваленко','Кирилл','Денисович',1,4,'kovalenko@example.com','+79751236295'),(9,'Степанова','Оксана','Леонидовна',5,1,'stepanova@example.com','+79861236396'),(10,'Шишкин','Артем','Олегович',2,12,'shishkin@example.com','+79971236497'),(11,'Гордеева','Юлия','Владиславовна',5,4,'gordeeva@example.com','+79081236598'),(12,'Кузнецова','Елена','Валерьевна',4,11,'kuznetsova@example.com','+79161235679'),(13,'Михайлов','Александр','Владимирович',2,19,'mikhailov@example.com','+79201235780'),(14,'Романова','Маргарита','Ивановна',4,9,'romanova@example.com','+79311235891'),(15,'Попов','Антон','Павлович',2,1,'popov@example.com','+79421235992'),(16,'Воробьев','Максим','Георгиевич',2,12,'vorobev@example.com','+79531236093'),(17,'Захарова','Татьяна','Анатольевна',5,11,'zaharova@example.com','+79641236204'),(18,'Коваленко','Кирилл','Денисович',1,20,'kovalenko@example.com','+79751236295'),(19,'Степанова','Оксана','Леонидовна',3,8,'stepanova@example.com','+79861236396'),(20,'Шишкин','Артем','Олегович',3,10,'shishkin@example.com','+79971236497'),(21,'Гордеева','Юлия','Владиславовна',4,10,'gordeeva@example.com','+79081236598'),(22,'Иванов','Иван','Иванович',1,14,'ivanov@example.com','+79161234567'),(23,'Петрова','Анна','Владимировна',3,1,'petrova@example.com','+79201234678'),(24,'Сидоров','Сергей','Александрович',5,7,'sidorov@example.com','+79311234789'),(25,'Васильев','Алексей','Геннадьевич',1,1,'vasiliev@example.com','+79421234890'),(26,'Николаева','Ольга','Евгеньевна',1,15,'nikolaeva@example.com','+79531234991'),(27,'Орлова','Екатерина','Андреевна',1,11,'orlova@example.com','+79641235092'),(28,'Комаров','Владимир','Борисович',2,13,'komarov@example.com','+79751235203'),(29,'Павлова','Марина','Сергеевна',2,16,'pavlova@example.com','+79861235294');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-11 10:58:28
