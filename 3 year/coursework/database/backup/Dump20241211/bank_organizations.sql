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
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(155) NOT NULL,
  `inn` varchar(10) NOT NULL,
  `kpp` varchar(9) NOT NULL,
  `legal_form_id` int NOT NULL,
  `full_addres` varchar(145) NOT NULL,
  `director_id` int NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `email` varchar(155) DEFAULT NULL,
  `city_id` int NOT NULL,
  `registration_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legal_form_id` (`legal_form_id`),
  KEY `director_id` (`director_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `organizations_ibfk_1` FOREIGN KEY (`legal_form_id`) REFERENCES `legal_form` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `organizations_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `organizations_ibfk_3` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `organizations_chk_1` CHECK ((`email` like _utf8mb4'%@%.%'))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,'Пупки','1234567890','123456789',24,'Россия,Московскаяобласть,Москва,ул.Тверская,д.1',5,'+79001112233','org1@mail.ru',127,'2023-01-01'),(2,'Губки','2345678901','234567891',14,'Россия,Санкт-Петербург,Невскийпроспект,д.2',7,'+79012223344','org2@mail.ru',260,'2022-02-02'),(3,'Ховсты и рога','3456789012','345678912',7,'Россия,Новосибирск,ул.Красныйпроспект,д.3',6,'+79023334455','org3@mail.ru',289,'2021-03-03'),(4,'Ложки и вилки','4567890123','456789013',1,'Россия,Екатеринбург,ул.Ленина,д.4',2,'+79034445566','org4@mail.ru',439,'2020-04-04'),(5,'Маусер','5678901234','567890134',2,'Россия,Казань,ул.Баумана,д.5',5,'+79045556677','org5@mail.ru',327,'2019-05-05'),(6,'Додо','6789012345','678901235',19,'Россия,НижнийНовгород,ул.БольшаяПокровская,д.6',4,'+79056667788','org6@mail.ru',74,'2018-06-06'),(7,'Крипси','7890123456','789012356',11,'Россия,Челябинск,пр-тЛенина,д.7',5,'+79067778899','org7@mail.ru',376,'2017-07-07'),(8,'Красти Краб','8901234567','890123457',4,'Россия,Омск,ул.Маркса,д.8',3,'+79078889900','org8@mail.ru',134,'2016-08-08'),(9,'Дум С Дэй','9012345678','901234578',11,'Россия,Самара,ул.Молодогвардейская,д.9',1,'+79089990011','org9@mail.ru',108,'2015-09-09'),(10,'Дрова','0123456789','012345679',24,'Россия,Ростов-на-Дону,ул.Пушкинская,д.10',7,'+79090011122','org10@mail.ru',222,'2014-10-10');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
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
