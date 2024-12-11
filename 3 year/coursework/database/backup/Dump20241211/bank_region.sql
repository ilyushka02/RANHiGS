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
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reg_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Республика Адыгея (Адыгея)'),(2,'Республика Башкортостан'),(3,'Республика Бурятия'),(4,'Республика Алтай'),(5,'Республика Дагестан'),(6,'Республика Ингушетия'),(7,'Кабардино-Балкарская Республика'),(8,'Республика Калмыкия'),(9,'Карачаево-Черкесская Республика'),(10,'Республика Карелия'),(11,'Республика Коми'),(12,'Республика Марий Эл'),(13,'Республика Мордовия'),(14,'Республика Саха (Якутия)'),(15,'Республика Северная Осетия - Алания'),(16,'Республика Татарстан (Татарстан)'),(17,'Республика Тыва'),(18,'Удмуртская Республика'),(19,'Республика Хакасия'),(20,'Чеченская Республика'),(21,'Чувашская Республика - Чувашия'),(22,'Алтайский край'),(23,'Краснодарский край'),(24,'Красноярский край'),(25,'Приморский край'),(26,'Ставропольский край'),(27,'Хабаровский край'),(28,'Амурская область'),(29,'Архангельская область'),(30,'Астраханская область'),(31,'Белгородская область'),(32,'Брянская область'),(33,'Владимирская область'),(34,'Волгоградская область'),(35,'Вологодская область'),(36,'Воронежская область'),(37,'Ивановская область'),(38,'Иркутская область'),(39,'Калининградская область'),(40,'Калужская область'),(41,'Камчатский край'),(42,'Кемеровская область - Кузбасс'),(43,'Кировская область'),(44,'Костромская область'),(45,'Курганская область'),(46,'Курская область'),(47,'Ленинградская область'),(48,'Липецкая область'),(49,'Магаданская область'),(50,'Московская область'),(51,'Мурманская область'),(52,'Нижегородская область'),(53,'Новгородская область'),(54,'Новосибирская область'),(55,'Омская область'),(56,'Оренбургская область'),(57,'Орловская область'),(58,'Пензенская область'),(59,'Пермский край'),(60,'Псковская область'),(61,'Ростовская область'),(62,'Рязанская область'),(63,'Самарская область'),(64,'Саратовская область'),(65,'Сахалинская область'),(66,'Свердловская область'),(67,'Смоленская область'),(68,'Тамбовская область'),(69,'Тверская область'),(70,'Томская область'),(71,'Тульская область'),(72,'Тюменская область'),(73,'Ульяновская область'),(74,'Челябинская область'),(75,'Забайкальский край'),(76,'Ярославская область'),(77,'Еврейская автономная область'),(78,'Ненецкий автономный округ'),(79,'Ханты-Мансийский автономный округ - Югра'),(80,'Чукотский автономный округ'),(81,'Ямало-Ненецкий автономный округ'),(82,'Республика Крым');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-11 10:58:27