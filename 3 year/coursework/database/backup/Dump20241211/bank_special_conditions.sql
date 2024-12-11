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
-- Table structure for table `special_conditions`
--

DROP TABLE IF EXISTS `special_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `special_conditions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `describe_text` varchar(155) NOT NULL,
  `influence_interest_rate` decimal(4,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_conditions`
--

LOCK TABLES `special_conditions` WRITE;
/*!40000 ALTER TABLE `special_conditions` DISABLE KEYS */;
INSERT INTO `special_conditions` VALUES (1,'Крупный бизнес-клиент',2.50),(2,'Участник госзакупок',3.50),(3,'Поддержка малого бизнеса',0.40),(4,'Заемщик с положительной кредитной историей',0.45),(5,'Программы субсидирования для МСБ',0.55),(6,'Инвестиции в инновационные проекты',0.65),(7,'Экспортные операции',0.75),(8,'Агропромышленный комплекс',0.85),(9,'Использование банковских гарантий',0.95),(10,'Совместные проекты с государственными структурами',1.00),(11,'Страхование рисков',0.05),(12,'Регулярное пополнение оборотных средств',0.07),(13,'Автоматизированные платежи',0.08),(14,'Операции с валютным контролем',0.09),(15,'Расширение производства',1.00),(16,'Модернизация оборудования',1.50),(17,'Развитие инфраструктуры',2.00),(18,'Реализация проектов в приоритетных отраслях',0.22),(19,'Онлайн-банкинг для бизнеса',0.03),(20,'Акция для новых корпоративных клиентов',0.06);
/*!40000 ALTER TABLE `special_conditions` ENABLE KEYS */;
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
