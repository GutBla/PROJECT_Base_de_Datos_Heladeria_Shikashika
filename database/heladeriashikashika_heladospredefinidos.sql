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
-- Table structure for table `heladospredefinidos`
--

DROP TABLE IF EXISTS `heladospredefinidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heladospredefinidos` (
  `id_helado_predefinido` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre_helado` varchar(30) NOT NULL,
  `direccion_imagen` varchar(100) NOT NULL,
  `id_helado` int NOT NULL,
  PRIMARY KEY (`id_helado_predefinido`),
  KEY `id_helado` (`id_helado`),
  CONSTRAINT `heladospredefinidos_ibfk_1` FOREIGN KEY (`id_helado`) REFERENCES `helados` (`id_helado`),
  CONSTRAINT `heladospredefinidos_ibfk_2` FOREIGN KEY (`id_helado`) REFERENCES `helados` (`id_helado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heladospredefinidos`
--

LOCK TABLES `heladospredefinidos` WRITE;
/*!40000 ALTER TABLE `heladospredefinidos` DISABLE KEYS */;
INSERT INTO `heladospredefinidos` VALUES (1,'Helado intenso de chocolate, cubierto con galletas de chocolate y chispas de colores.','Choco Explosión','/imagenes/choco.jpg',1),(2,'Helado cremoso de caramelo, decorado con dulce de leche y galletas trituradas.','Caramelo Travieso','/imagenes/caramelo_travieso.jpg',3),(3,'Helado de Oreo con trozos de galletas y crema batida, ideal para los amantes del chocolate.','Oreo Monstruoso','/imagenes/oreos_monster.jpg',5),(4,'Combinación de pasas al ron con chocolate y un toque de canela.','Pasas Locas','/imagenes/pasas_locas.jpg',7),(5,'Exótico helado de mango, decorado con trozos de frutas tropicales.','Mango Dinamita','/imagenes/mango_dinamita.jpg',9);
/*!40000 ALTER TABLE `heladospredefinidos` ENABLE KEYS */;
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
