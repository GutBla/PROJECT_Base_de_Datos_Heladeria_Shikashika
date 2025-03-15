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
-- Table structure for table `helados`
--

DROP TABLE IF EXISTS `helados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helados` (
  `id_helado` int NOT NULL AUTO_INCREMENT,
  `tipo_helado` enum('PERSONALIZADO','PREDEFINIDO') DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `id_vaso` int NOT NULL,
  `id_detalle_pedido` int NOT NULL,
  PRIMARY KEY (`id_helado`),
  KEY `id_detalle_pedido` (`id_detalle_pedido`),
  KEY `id_vaso` (`id_vaso`),
  CONSTRAINT `helados_ibfk_1` FOREIGN KEY (`id_detalle_pedido`) REFERENCES `detallepedidos` (`id_detalle_pedido`),
  CONSTRAINT `helados_ibfk_2` FOREIGN KEY (`id_vaso`) REFERENCES `vasos` (`id_vaso`),
  CONSTRAINT `helados_ibfk_3` FOREIGN KEY (`id_detalle_pedido`) REFERENCES `detallepedidos` (`id_detalle_pedido`),
  CONSTRAINT `helados_ibfk_4` FOREIGN KEY (`id_vaso`) REFERENCES `vasos` (`id_vaso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helados`
--

LOCK TABLES `helados` WRITE;
/*!40000 ALTER TABLE `helados` DISABLE KEYS */;
INSERT INTO `helados` VALUES (1,'PREDEFINIDO',3.50,1,1),(2,'PERSONALIZADO',5.45,2,2),(3,'PREDEFINIDO',3.50,3,3),(4,'PERSONALIZADO',7.12,1,4),(5,'PREDEFINIDO',6.17,2,5),(6,'PERSONALIZADO',8.01,3,6),(7,'PREDEFINIDO',7.98,1,7),(8,'PERSONALIZADO',7.00,2,8),(9,'PREDEFINIDO',4.35,3,9),(10,'PERSONALIZADO',2.20,1,10);
/*!40000 ALTER TABLE `helados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-14 16:51:07
