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
-- Table structure for table `bolashelado`
--

DROP TABLE IF EXISTS `bolashelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bolashelado` (
  `id_bola_helado` int NOT NULL AUTO_INCREMENT,
  `id_leche` int NOT NULL,
  `id_saborizante` int NOT NULL,
  `id_edulcorante` int NOT NULL,
  PRIMARY KEY (`id_bola_helado`),
  KEY `id_leche` (`id_leche`),
  KEY `id_saborizante` (`id_saborizante`),
  KEY `id_edulcorante` (`id_edulcorante`),
  CONSTRAINT `bolashelado_ibfk_1` FOREIGN KEY (`id_leche`) REFERENCES `leches` (`id_leche`),
  CONSTRAINT `bolashelado_ibfk_2` FOREIGN KEY (`id_saborizante`) REFERENCES `saborizantes` (`id_saborizante`),
  CONSTRAINT `bolashelado_ibfk_3` FOREIGN KEY (`id_edulcorante`) REFERENCES `edulcorantes` (`id_edulcorante`),
  CONSTRAINT `bolashelado_ibfk_4` FOREIGN KEY (`id_leche`) REFERENCES `leches` (`id_leche`),
  CONSTRAINT `bolashelado_ibfk_5` FOREIGN KEY (`id_saborizante`) REFERENCES `saborizantes` (`id_saborizante`),
  CONSTRAINT `bolashelado_ibfk_6` FOREIGN KEY (`id_edulcorante`) REFERENCES `edulcorantes` (`id_edulcorante`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bolashelado`
--

LOCK TABLES `bolashelado` WRITE;
/*!40000 ALTER TABLE `bolashelado` DISABLE KEYS */;
INSERT INTO `bolashelado` VALUES (1,1,1,1),(2,2,2,1),(3,3,3,2),(4,4,4,2),(5,5,5,3),(6,6,6,1),(7,7,7,1),(8,8,8,2),(9,1,9,2),(10,2,10,3),(11,3,11,1),(12,4,12,1),(13,5,13,2),(14,6,14,2),(15,7,15,3),(16,8,16,1),(17,1,17,1),(18,2,18,2),(19,3,19,2),(20,4,20,3),(21,5,21,1),(22,6,22,1),(23,7,23,2),(24,8,24,3),(25,1,25,1);
/*!40000 ALTER TABLE `bolashelado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-14 16:51:06
