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
-- Table structure for table `legal_form`
--

DROP TABLE IF EXISTS `legal_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legal_form` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_legal_form` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal_form`
--

LOCK TABLES `legal_form` WRITE;
/*!40000 ALTER TABLE `legal_form` DISABLE KEYS */;
INSERT INTO `legal_form` VALUES (1,'Общество с ограниченной ответственностью (ООО)'),(2,'Акционерное общество (АО)'),(3,'Публичное акционерное общество (ПАО)'),(4,'Полное товарищество'),(5,'Товарищество на вере (коммандитное товарищество)'),(6,'Производственный кооператив (артель)'),(7,'Хозяйственное партнерство'),(8,'Крестьянское (фермерское) хозяйство'),(9,'Некоммерческое партнерство'),(10,'Автономная некоммерческая организация'),(11,'Фонд'),(12,'Учреждение'),(13,'Благотворительный фонд'),(14,'Ассоциация (союз)'),(15,'Казачье общество'),(16,'Адвокатское образование'),(17,'Политическая партия'),(18,'Религиозная организация'),(19,'Саморегулируемая организация'),(20,'Потребительский кооператив'),(21,'Общественная организация'),(22,'Государственная корпорация'),(23,'Муниципальное унитарное предприятие'),(24,'Государственное бюджетное учреждение'),(25,'Частное учреждение'),(26,'Филиал иностранной компании');
/*!40000 ALTER TABLE `legal_form` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-11 10:58:29
