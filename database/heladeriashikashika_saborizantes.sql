-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: heladeriashikashika
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `saborizantes`
--

DROP TABLE IF EXISTS `saborizantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saborizantes` (
  `id_saborizante` int NOT NULL AUTO_INCREMENT,
  `nombre_saborizante` varchar(30) NOT NULL,
  `id_ingrediente` int NOT NULL,
  PRIMARY KEY (`id_saborizante`),
  KEY `id_ingrediente` (`id_ingrediente`),
  CONSTRAINT `saborizantes_ibfk_1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`),
  CONSTRAINT `saborizantes_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saborizantes`
--

LOCK TABLES `saborizantes` WRITE;
/*!40000 ALTER TABLE `saborizantes` DISABLE KEYS */;
INSERT INTO `saborizantes` VALUES (1,'Vainilla',1),(2,'Fresa',2),(3,'Chocolate',3),(4,'Coco',4),(5,'Menta',5),(6,'Limon',6),(7,'Naranja',7),(8,'Dulce de leche',8),(9,'Platano',9),(10,'Frambuesa',10),(11,'Mora',11),(12,'Mango',12),(13,'Pistacho',13),(14,'Pasas al Ron',14),(15,'Cafe',15),(16,'Durazno',16),(17,'Piña',17),(18,'Oreo',18),(19,'Algodon de Azucar',19),(20,'Canela',20),(21,'Arandano',21),(22,'Cereza',22),(23,'Almendra',23),(24,'Chicle',24),(25,'Calabaza',25);
/*!40000 ALTER TABLE `saborizantes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-14 16:51:08
