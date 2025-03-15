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
-- Table structure for table `toppings`
--

DROP TABLE IF EXISTS `toppings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toppings` (
  `id_topping` int NOT NULL AUTO_INCREMENT,
  `nombre_topping` varchar(30) NOT NULL,
  `tipo_topping` varchar(30) NOT NULL,
  `id_ingrediente` int NOT NULL,
  PRIMARY KEY (`id_topping`),
  KEY `id_ingrediente` (`id_ingrediente`),
  CONSTRAINT `toppings_ibfk_1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`),
  CONSTRAINT `toppings_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toppings`
--

LOCK TABLES `toppings` WRITE;
/*!40000 ALTER TABLE `toppings` DISABLE KEYS */;
INSERT INTO `toppings` VALUES (1,'Almendras','sólido',34),(2,'Arándano','sólido',35),(3,'Castañas','sólido',36),(4,'Chips de colores','sólido',37),(5,'Frambuesa','sólido',38),(6,'Fresas','sólido',39),(7,'Galletas de chocolate','sólido',40),(8,'Kiwi','sólido',41),(9,'Mango','sólido',42),(10,'Nueces','sólido',43),(11,'Piña','sólido',44),(12,'Plátanos','sólido',45),(13,'Salsa de chocolate','líquido',46),(14,'Virutas de chocolate','sólido',47),(15,'Chocolate','sólido',48),(16,'Dulce de leche','líquido',49),(17,'Cereales Chocapic','sólido',50),(18,'Cereza','sólido',51),(19,'Ciruela','sólido',52),(20,'Durazno','sólido',53),(21,'Cereal Zucaritas','sólido',54),(22,'Limón','sólido',55),(23,'Mandarina','sólido',56),(24,'Manzana','sólido',57),(25,'Melón','sólido',58),(26,'Naranja','sólido',59),(27,'Pera','sólido',60),(28,'Pomelo','sólido',61),(29,'Coco rallado','sólido',62),(30,'Galletas Oreo','sólido',63),(31,'Dulces de Menta','sólido',64),(32,'Gomitas de osos','sólido',65),(33,'Mini marshmallows','sólido',66),(34,'Cereales Froot Loops','sólido',67),(35,'Botones de chocolate','sólido',68),(36,'Sandía','sólido',69),(37,'Barquillos','sólido',70),(38,'Maní','sólido',71);
/*!40000 ALTER TABLE `toppings` ENABLE KEYS */;
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
