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
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes` (
  `id_ingrediente` int NOT NULL AUTO_INCREMENT,
  `tipo_ingrediente` enum('TOPPING','EDULCORANTE','SABORIZANTE','LECHE') NOT NULL,
  `cantidad_disponible` int NOT NULL,
  `precio_uso_por_porcion` decimal(10,2) NOT NULL,
  `direccion_imagen` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ingrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES (1,'SABORIZANTE',100,0.50,'imagen_vainilla.jpg'),(2,'SABORIZANTE',120,0.60,'imagen_fresa.jpg'),(3,'SABORIZANTE',80,0.55,'imagen_chocolate.jpg'),(4,'SABORIZANTE',90,0.70,'imagen_coco.jpg'),(5,'SABORIZANTE',110,0.50,'imagen_menta.jpg'),(6,'SABORIZANTE',95,0.60,'imagen_limon.jpg'),(7,'SABORIZANTE',85,0.65,'imagen_naranja.jpg'),(8,'SABORIZANTE',130,0.50,'imagen_dulce_de_leche.jpg'),(9,'SABORIZANTE',100,0.60,'imagen_platano.jpg'),(10,'SABORIZANTE',105,0.50,'imagen_frambuesa.jpg'),(11,'SABORIZANTE',115,0.70,'imagen_mora.jpg'),(12,'SABORIZANTE',90,0.65,'imagen_mango.jpg'),(13,'SABORIZANTE',100,0.60,'imagen_pistacho.jpg'),(14,'SABORIZANTE',80,0.70,'imagen_pasas_al_ron.jpg'),(15,'SABORIZANTE',75,0.55,'imagen_cafe.jpg'),(16,'SABORIZANTE',120,0.65,'imagen_durazno.jpg'),(17,'SABORIZANTE',100,0.60,'imagen_piña.jpg'),(18,'SABORIZANTE',110,0.50,'imagen_oreo.jpg'),(19,'SABORIZANTE',90,0.70,'imagen_algodon_de_azucar.jpg'),(20,'SABORIZANTE',105,0.55,'imagen_canela.jpg'),(21,'SABORIZANTE',85,0.65,'imagen_arandano.jpg'),(22,'SABORIZANTE',115,0.50,'imagen_cereza.jpg'),(23,'SABORIZANTE',100,0.60,'imagen_almendra.jpg'),(24,'SABORIZANTE',95,0.70,'imagen_chicle.jpg'),(25,'SABORIZANTE',80,0.55,'imagen_calabaza.jpg'),(26,'LECHE',200,1.00,'imagen_leche_natural.jpg'),(27,'LECHE',150,1.10,'imagen_leche_deslactosada.jpg'),(28,'LECHE',180,1.05,'imagen_leche_light.jpg'),(29,'LECHE',160,1.20,'imagen_leche_descremada.jpg'),(30,'LECHE',140,1.30,'imagen_leche_soya.jpg'),(31,'LECHE',170,1.15,'imagen_leche_almendra.jpg'),(32,'LECHE',190,1.25,'imagen_leche_arroz.jpg'),(33,'LECHE',200,1.10,'imagen_leche_coco.jpg'),(34,'TOPPING',120,0.50,'imagenes/topping1.png'),(35,'TOPPING',200,0.30,'imagenes/topping2.png'),(36,'TOPPING',150,0.70,'imagenes/topping3.png'),(37,'TOPPING',100,0.80,'imagenes/topping4.png'),(38,'TOPPING',90,0.60,'imagenes/topping5.png'),(39,'TOPPING',250,0.25,'imagenes/topping6.png'),(40,'TOPPING',175,0.75,'imagenes/topping7.png'),(41,'TOPPING',80,0.85,'imagenes/topping8.png'),(42,'TOPPING',110,0.55,'imagenes/topping9.png'),(43,'TOPPING',220,0.35,'imagenes/topping10.png'),(44,'TOPPING',130,0.65,'imagenes/topping11.png'),(45,'TOPPING',95,0.90,'imagenes/topping12.png'),(46,'TOPPING',105,0.50,'imagenes/topping13.png'),(47,'TOPPING',180,0.40,'imagenes/topping14.png'),(48,'TOPPING',140,0.70,'imagenes/topping15.png'),(49,'TOPPING',70,0.80,'imagenes/topping16.png'),(50,'TOPPING',130,0.55,'imagenes/topping17.png'),(51,'TOPPING',160,0.30,'imagenes/topping18.png'),(52,'TOPPING',160,0.75,'imagenes/topping19.png'),(53,'TOPPING',60,0.85,'imagenes/topping20.png'),(54,'TOPPING',140,0.50,'imagenes/topping21.png'),(55,'TOPPING',210,0.35,'imagenes/topping22.png'),(56,'TOPPING',170,0.65,'imagenes/topping23.png'),(57,'TOPPING',125,0.55,'imagenes/topping24.png'),(58,'TOPPING',190,0.30,'imagenes/topping25.png'),(59,'TOPPING',155,0.70,'imagenes/topping26.png'),(60,'TOPPING',75,0.80,'imagenes/topping27.png'),(61,'TOPPING',115,0.60,'imagenes/topping28.png'),(62,'TOPPING',240,0.25,'imagenes/topping29.png'),(63,'TOPPING',135,0.75,'imagenes/topping30.png'),(64,'TOPPING',100,0.50,'imagenes/topping31.png'),(65,'TOPPING',210,0.40,'imagenes/topping32.png'),(66,'TOPPING',145,0.70,'imagenes/topping33.png'),(67,'TOPPING',130,0.60,'imagenes/topping34.png'),(68,'TOPPING',190,0.35,'imagenes/topping35.png'),(69,'TOPPING',220,0.30,'imagenes/topping36.png'),(70,'TOPPING',160,0.80,'imagenes/topping37.png'),(71,'TOPPING',80,0.75,'imagenes/topping38.png'),(72,'EDULCORANTE',200,0.30,'imagenes/edulcorante1.png'),(73,'EDULCORANTE',150,0.25,'imagenes/edulcorante2.png'),(74,'EDULCORANTE',175,0.35,'imagenes/edulcorante3.png');
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
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
