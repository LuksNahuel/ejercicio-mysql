-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: supermercado
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `cod_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `barrio` varchar(50) DEFAULT NULL,
  `direccion` varchar(80) NOT NULL,
  PRIMARY KEY (`cod_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES (1,'Moron','Avenida Rivadavia 18880'),(2,'Haedo','Marcos Sastre 145'),(3,'Ituzaingo','Avenida Ratti 13458'),(4,'Ituzaingo','Blas Parera 455'),(5,'Moreno','Buen viaje 1003'),(6,'Merlo','Junin 1503'),(7,'San Antonio de Padua','Sarmiento 1233'),(8,'Castelar','Avenida Santa Rosa 3214'),(9,'Ciudadela','Presidente Perón 555'),(10,'Liniers','Avenida Rivadavia 14302');
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `num_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `cod_sucursal` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto_total` decimal(15,2) NOT NULL,
  `medio_de_pago` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`num_ticket`),
  KEY `FK_cod_sucursal` (`cod_sucursal`),
  CONSTRAINT `FK_cod_sucursal` FOREIGN KEY (`cod_sucursal`) REFERENCES `sucursales` (`cod_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,'2019-09-01',1550.50,'debito'),(2,1,'2019-09-02',2034.00,'credito'),(3,1,'2019-09-03',5129.67,'efectivo'),(4,1,'2019-09-04',10351.20,'debito'),(5,1,'2019-10-05',200.32,'efectivo'),(6,2,'2019-10-01',3200.23,'debito'),(7,2,'2019-10-02',2500.00,'debito'),(8,2,'2019-11-03',6532.25,'credito'),(9,2,'2019-11-04',1001.20,'efectivo'),(10,2,'2019-11-05',4367.66,'debito'),(11,3,'2019-11-01',1100.50,'credito'),(12,3,'2019-11-02',3010.00,'debito'),(13,3,'2019-11-03',125.25,'efectivo'),(14,3,'2019-09-04',4500.00,'credito'),(15,3,'2019-11-05',2000.50,'debito'),(16,4,'2019-11-01',10320.22,'credito'),(17,4,'2019-11-02',500.00,'efectivo'),(18,5,'2019-11-03',2030.25,'efectivo'),(19,5,'2019-11-04',199.99,'efectivo'),(20,6,'2019-11-05',9999.99,'credito'),(21,6,'2019-11-06',5010.10,'credito'),(22,7,'2019-11-07',4030.00,'debito'),(23,8,'2019-11-08',2000.13,'debito'),(24,9,'2019-11-09',8004.65,'credito'),(25,10,'2019-11-10',1316.66,'debito');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-18 14:33:01
