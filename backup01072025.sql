CREATE DATABASE  IF NOT EXISTS `supermercado_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `supermercado_db`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: supermercado_db
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Abarrotes','Productos de despensa y consumo básico',1,'2025-06-08 00:05:59'),(2,'Lácteos','Productos lácteos y derivados',1,'2025-06-08 00:05:59'),(3,'Carnes','Carnes rojas, blancas y embutidos',1,'2025-06-08 00:05:59'),(4,'Frutas','Frutas frescas y procesadas',1,'2025-06-08 00:05:59'),(5,'Verduras','Verduras y hortalizas',1,'2025-06-08 00:05:59'),(6,'Bebidas','Bebidas alcohólicas y no alcohólicas',1,'2025-06-08 00:05:59'),(7,'Aseo','Productos de aseo personal y del hogar',1,'2025-06-08 00:05:59'),(8,'Congelados','Productos congelados y helados',1,'2025-06-08 00:05:59'),(9,'Mascotas','Alimentos para perros y gatos',1,'2025-06-20 02:27:47');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_recepciones`
--

DROP TABLE IF EXISTS `detalle_recepciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_recepciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recepcion_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` decimal(10,3) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recepcion_id` (`recepcion_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_recepciones_ibfk_1` FOREIGN KEY (`recepcion_id`) REFERENCES `recepciones` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detalle_recepciones_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_recepciones`
--

LOCK TABLES `detalle_recepciones` WRITE;
/*!40000 ALTER TABLE `detalle_recepciones` DISABLE KEYS */;
INSERT INTO `detalle_recepciones` VALUES (1,1,2,1.000,1500.00,1500.00),(2,2,3,15.000,1500.00,22500.00),(3,3,2,15.000,1600.00,24000.00),(4,3,1,15.000,5100.00,76500.00),(5,4,3,100.000,1000.00,100000.00),(6,5,2,5.000,1500.00,7500.00),(7,6,2,2.000,1500.00,3000.00),(8,7,1,1.000,5000.00,5000.00),(9,8,1,5.000,5000.00,25000.00),(10,9,5,12.000,2000.00,24000.00),(11,10,5,12.000,2000.00,24000.00),(12,11,5,1.000,2000.00,2000.00),(13,12,3,15.000,1500.00,22500.00),(14,13,3,1.000,2000.00,2000.00),(15,14,3,7.000,1800.00,12600.00),(16,15,3,1.000,1500.00,1500.00),(17,16,3,2.000,1000.00,2000.00),(18,17,1,1.000,5000.00,5000.00),(19,18,1,1.000,5000.00,5000.00),(20,19,1,1.000,5000.00,5000.00),(21,20,3,1.000,2000.00,2000.00),(22,21,3,1.000,2000.00,2000.00),(23,22,3,1.000,1500.00,1500.00),(24,23,3,1.000,1600.00,1600.00),(25,24,3,1.000,1200.00,1200.00),(26,25,3,1.000,800.00,800.00),(27,26,3,1.000,900.00,900.00),(28,27,6,5.000,3000.00,15000.00);
/*!40000 ALTER TABLE `detalle_recepciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `venta_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` decimal(10,3) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `venta_id` (`venta_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ventas`
--

LOCK TABLES `detalle_ventas` WRITE;
/*!40000 ALTER TABLE `detalle_ventas` DISABLE KEYS */;
INSERT INTO `detalle_ventas` VALUES (1,1,2,2.000,1800.00,3600.00),(2,2,1,2.000,6500.00,13000.00),(3,3,2,1.000,1700.00,1700.00),(4,4,1,3.000,6500.00,19500.00),(5,4,2,1.000,1700.00,1700.00),(6,5,2,1.000,1700.00,1700.00),(7,6,3,2.500,1500.00,3750.00),(8,7,3,3.500,1500.00,5250.00),(9,8,3,1.500,1500.00,2250.00),(10,9,3,2.500,1500.00,3750.00),(11,10,3,1.000,1500.00,1500.00),(12,11,2,1.000,1700.00,1700.00),(13,11,3,15.000,1500.00,22500.00),(14,12,4,5.000,300.00,1500.00),(15,13,3,2.000,1500.00,3000.00),(16,14,3,7.000,1500.00,10500.00),(17,15,3,1.000,1500.00,1500.00),(18,16,2,1.000,1700.00,1700.00),(19,17,3,20.000,1500.00,30000.00),(20,18,3,9.000,1500.00,13500.00),(21,19,2,19.000,1700.00,32300.00),(22,20,1,25.000,6500.00,162500.00),(23,21,3,1.000,1500.00,1500.00),(24,21,1,1.000,6500.00,6500.00),(25,22,3,9.500,1500.00,14250.00),(26,23,5,1.000,2500.00,2500.00),(27,23,1,1.000,6500.00,6500.00),(28,23,3,2.500,1500.00,3750.00),(29,23,2,2.000,1700.00,3400.00),(30,23,4,10.000,300.00,3000.00),(31,24,1,5.000,6500.00,32500.00),(32,25,5,2.000,2500.00,5000.00),(33,26,3,5.000,900.00,4500.00),(34,27,2,1.000,1800.00,1800.00),(35,27,8,1.600,20000.00,32000.00),(36,27,9,1.800,25000.00,45000.00),(37,27,5,1.000,2500.00,2500.00),(38,27,7,2.400,1500.00,3600.00),(39,27,6,1.800,3500.00,6300.00),(40,27,10,30.000,600.00,18000.00),(41,27,1,1.000,6500.00,6500.00),(42,27,4,4.000,300.00,1200.00),(43,27,3,1.500,900.00,1350.00),(44,28,3,10.000,900.00,9000.00),(45,29,3,1.000,900.00,900.00),(46,30,6,1.000,3000.00,3000.00),(47,31,3,2.000,900.00,1800.00),(48,31,2,1.000,1800.00,1800.00),(49,32,2,1.000,1800.00,1800.00),(50,33,3,1.000,900.00,900.00),(51,34,3,1.000,900.00,900.00),(52,34,6,1.000,3000.00,3000.00),(53,35,3,1.000,900.00,900.00),(54,35,6,1.000,3000.00,3000.00),(55,35,10,1.000,600.00,600.00),(56,35,2,1.000,1800.00,1800.00),(57,36,3,1.000,900.00,900.00),(58,37,3,1.000,900.00,900.00),(59,38,6,1.000,3000.00,3000.00),(60,39,10,1.000,600.00,600.00),(61,40,3,1.000,900.00,900.00),(62,41,3,1.000,900.00,900.00);
/*!40000 ALTER TABLE `detalle_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_inventario`
--

DROP TABLE IF EXISTS `movimientos_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_inventario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `tipo_movimiento` enum('entrada','salida','ajuste') NOT NULL,
  `cantidad` decimal(10,3) NOT NULL,
  `stock_anterior` decimal(10,3) NOT NULL,
  `stock_nuevo` decimal(10,3) NOT NULL,
  `referencia_id` int DEFAULT NULL,
  `referencia_tipo` enum('venta','recepcion','ajuste') DEFAULT NULL,
  `usuario_id` int NOT NULL,
  `observaciones` text,
  `fecha_movimiento` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `idx_movimientos_producto` (`producto_id`),
  KEY `idx_movimientos_fecha` (`fecha_movimiento`),
  CONSTRAINT `movimientos_inventario_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `movimientos_inventario_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_inventario`
--

LOCK TABLES `movimientos_inventario` WRITE;
/*!40000 ALTER TABLE `movimientos_inventario` DISABLE KEYS */;
INSERT INTO `movimientos_inventario` VALUES (1,1,'entrada',20.000,0.000,20.000,NULL,'ajuste',1,'Stock inicial','2025-06-09 21:01:03'),(2,2,'entrada',10.000,0.000,10.000,NULL,'ajuste',1,'Stock inicial','2025-06-09 21:16:13'),(3,2,'salida',2.000,10.000,8.000,1,'venta',1,'Venta V20250609-1749505944849','2025-06-09 21:52:24'),(4,1,'salida',2.000,20.000,18.000,2,'venta',1,'Venta V20250609-1749506021326','2025-06-09 21:53:41'),(5,2,'entrada',1.000,8.000,9.000,1,'recepcion',1,'Recepción RJ08062025','2025-06-09 22:09:04'),(6,2,'salida',1.000,9.000,8.000,3,'venta',1,'Venta V20250610-1749571739893','2025-06-10 16:08:59'),(7,1,'salida',3.000,18.000,15.000,4,'venta',1,'Venta V20250610-1749574716370','2025-06-10 16:58:36'),(8,2,'salida',1.000,8.000,7.000,4,'venta',1,'Venta V20250610-1749574716370','2025-06-10 16:58:36'),(9,2,'salida',1.000,7.000,6.000,5,'venta',1,'Venta V20250610-1749585709066','2025-06-10 20:01:49'),(10,3,'entrada',50.000,0.000,50.000,NULL,'ajuste',1,'Stock inicial','2025-06-10 20:06:55'),(11,3,'salida',2.500,50.000,47.500,6,'venta',1,'Venta V20250610-1749586075855','2025-06-10 20:07:55'),(12,3,'salida',3.500,47.500,44.000,7,'venta',1,'Venta V20250610-1749587117046','2025-06-10 20:25:17'),(13,3,'salida',1.500,44.000,42.500,8,'venta',1,'Venta V20250610-1749587207317','2025-06-10 20:26:47'),(14,3,'salida',2.500,42.500,40.000,9,'venta',3,'Venta V20250610-1749591068099','2025-06-10 21:31:08'),(15,3,'salida',1.000,40.000,39.000,10,'venta',4,'Venta V20250610-1749600847499','2025-06-11 00:14:07'),(16,2,'salida',1.000,6.000,5.000,11,'venta',3,'Venta V20250612-1749759835259','2025-06-12 20:23:55'),(17,3,'salida',15.000,39.000,24.000,11,'venta',3,'Venta V20250612-1749759835259','2025-06-12 20:23:55'),(18,4,'entrada',300.000,0.000,300.000,NULL,'ajuste',3,'Stock inicial','2025-06-12 20:40:38'),(19,4,'salida',5.000,300.000,295.000,12,'venta',3,'Venta V20250612-1749760968951','2025-06-12 20:42:48'),(20,3,'entrada',15.000,24.000,39.000,2,'recepcion',3,'Recepción RJ11062025','2025-06-12 21:03:38'),(21,3,'salida',2.000,39.000,37.000,13,'venta',3,'Venta V20250613-1749830535217','2025-06-13 16:02:15'),(22,3,'salida',7.000,37.000,30.000,14,'venta',3,'Venta V20250613-1749865467958','2025-06-14 01:44:28'),(23,3,'salida',1.000,30.000,29.000,15,'venta',3,'Venta V20250615-1750027821474','2025-06-15 22:50:21'),(24,2,'salida',1.000,5.000,4.000,16,'venta',3,'Venta V20250615-1750027913130','2025-06-15 22:51:53'),(25,2,'entrada',15.000,4.000,19.000,3,'recepcion',3,'Recepción RJ15062025','2025-06-16 01:16:22'),(26,1,'entrada',15.000,15.000,30.000,3,'recepcion',3,'Recepción RJ15062025','2025-06-16 01:16:22'),(27,3,'salida',20.000,29.000,9.000,17,'venta',3,'Venta V20250615-1750036725654','2025-06-16 01:18:45'),(28,3,'salida',9.000,9.000,0.000,18,'venta',3,'Venta V20250615-1750039856467','2025-06-16 02:10:56'),(29,3,'entrada',100.000,0.000,100.000,4,'recepcion',3,'Recepción RJ15062025913','2025-06-16 02:14:09'),(30,2,'salida',19.000,19.000,0.000,19,'venta',3,'Venta V20250615-1750040106159','2025-06-16 02:15:06'),(31,2,'entrada',5.000,0.000,5.000,5,'recepcion',3,'Recepción RJ1506','2025-06-16 02:16:39'),(32,2,'entrada',2.000,5.000,7.000,6,'recepcion',3,'Recepción RJ15067','2025-06-16 02:17:29'),(33,1,'entrada',1.000,30.000,31.000,7,'recepcion',3,'Recepción RJ15068','2025-06-16 02:19:34'),(34,1,'salida',25.000,31.000,6.000,20,'venta',3,'Venta V20250615-1750040476751','2025-06-16 02:21:16'),(35,1,'entrada',5.000,6.000,11.000,8,'recepcion',3,'Recepción RJ150675','2025-06-16 02:34:31'),(36,3,'salida',1.000,100.000,99.000,21,'venta',3,'Venta V20250615-1750045170465','2025-06-16 03:39:30'),(37,1,'salida',1.000,11.000,10.000,21,'venta',3,'Venta V20250615-1750045170465','2025-06-16 03:39:30'),(38,3,'salida',9.500,99.000,89.500,22,'venta',3,'Venta V20250619-1750384728972','2025-06-20 01:58:49'),(39,5,'entrada',12.000,0.000,12.000,NULL,'ajuste',3,'Stock inicial','2025-06-20 02:05:32'),(40,5,'entrada',12.000,12.000,24.000,10,'recepcion',3,'Recepción RJ190620256','2025-06-20 02:34:15'),(41,5,'salida',1.000,24.000,23.000,23,'venta',3,'Venta V20250619-1750387121012','2025-06-20 02:38:41'),(42,1,'salida',1.000,10.000,9.000,23,'venta',3,'Venta V20250619-1750387121012','2025-06-20 02:38:41'),(43,3,'salida',2.500,89.500,87.000,23,'venta',3,'Venta V20250619-1750387121012','2025-06-20 02:38:41'),(44,2,'salida',2.000,7.000,5.000,23,'venta',3,'Venta V20250619-1750387121012','2025-06-20 02:38:41'),(45,4,'salida',10.000,295.000,285.000,23,'venta',3,'Venta V20250619-1750387121012','2025-06-20 02:38:41'),(46,1,'salida',5.000,9.000,4.000,24,'venta',3,'Venta V20250619-1750387915036','2025-06-20 02:51:55'),(47,5,'salida',2.000,23.000,21.000,25,'venta',3,'Venta V20250619-1750389299626','2025-06-20 03:14:59'),(48,5,'entrada',1.000,21.000,22.000,11,'recepcion',3,'Recepción RJ06192025','2025-06-20 03:32:04'),(49,3,'entrada',15.000,87.000,102.000,12,'recepcion',3,'Recepción 23062025','2025-06-23 17:27:31'),(50,3,'entrada',1.000,102.000,103.000,13,'recepcion',3,'Recepción 24062025','2025-06-24 16:01:32'),(51,3,'entrada',7.000,103.000,110.000,14,'recepcion',3,'Recepción rj24062025','2025-06-24 16:13:36'),(52,3,'entrada',1.000,110.000,111.000,15,'recepcion',3,'Recepción r24062025','2025-06-24 16:36:48'),(53,1,'entrada',1.000,4.000,5.000,17,'recepcion',3,'Recepción 221326451','2025-06-24 17:09:15'),(54,1,'entrada',1.000,5.000,6.000,18,'recepcion',3,'Recepción 5ds15sd1','2025-06-24 17:18:30'),(55,3,'entrada',1.000,111.000,112.000,20,'recepcion',3,'Recepción d55fdf2','2025-06-24 17:41:31'),(56,3,'entrada',1.000,112.000,113.000,21,'recepcion',3,'Recepción s52d2f1f12f','2025-06-24 19:58:05'),(57,3,'entrada',1.000,113.000,114.000,22,'recepcion',3,'Recepción lalskkks','2025-06-24 19:59:21'),(58,3,'entrada',1.000,114.000,115.000,23,'recepcion',3,'Recepción cllxff','2025-06-24 20:12:30'),(59,3,'entrada',1.000,115.000,116.000,24,'recepcion',3,'Recepción mnknk4mm','2025-06-24 20:15:20'),(60,3,'entrada',1.000,116.000,117.000,25,'recepcion',3,'Recepción adddssd','2025-06-24 21:32:27'),(61,3,'entrada',1.000,117.000,118.000,26,'recepcion',3,'Recepción fs5dg21gf','2025-06-24 21:53:47'),(62,3,'salida',5.000,118.000,113.000,26,'venta',3,'Venta V20250625-1750905708496','2025-06-26 02:41:48'),(63,6,'entrada',50.000,0.000,50.000,NULL,'ajuste',3,'Stock inicial','2025-06-26 02:46:44'),(64,7,'entrada',15.000,0.000,15.000,NULL,'ajuste',3,'Stock inicial','2025-06-26 02:48:22'),(65,8,'entrada',40.000,0.000,40.000,NULL,'ajuste',3,'Stock inicial','2025-06-26 02:49:01'),(66,9,'entrada',20.000,0.000,20.000,NULL,'ajuste',3,'Stock inicial','2025-06-26 02:49:55'),(67,10,'entrada',100.000,0.000,100.000,NULL,'ajuste',3,'Stock inicial','2025-06-26 02:51:20'),(68,2,'salida',1.000,5.000,4.000,27,'venta',3,'Venta V20250625-1750906711859','2025-06-26 02:58:31'),(69,8,'salida',1.600,40.000,38.400,27,'venta',3,'Venta V20250625-1750906711859','2025-06-26 02:58:31'),(70,9,'salida',1.800,20.000,18.200,27,'venta',3,'Venta V20250625-1750906711859','2025-06-26 02:58:31'),(71,5,'salida',1.000,22.000,21.000,27,'venta',3,'Venta V20250625-1750906711859','2025-06-26 02:58:31'),(72,7,'salida',2.400,15.000,12.600,27,'venta',3,'Venta V20250625-1750906711859','2025-06-26 02:58:31'),(73,6,'salida',1.800,50.000,48.200,27,'venta',3,'Venta V20250625-1750906711859','2025-06-26 02:58:31'),(74,10,'salida',30.000,100.000,70.000,27,'venta',3,'Venta V20250625-1750906711859','2025-06-26 02:58:31'),(75,1,'salida',1.000,6.000,5.000,27,'venta',3,'Venta V20250625-1750906711859','2025-06-26 02:58:31'),(76,4,'salida',4.000,285.000,281.000,27,'venta',3,'Venta V20250625-1750906711859','2025-06-26 02:58:31'),(77,3,'salida',1.500,113.000,111.500,27,'venta',3,'Venta V20250625-1750906711859','2025-06-26 02:58:31'),(78,3,'salida',10.000,111.500,101.500,28,'venta',3,'Venta V20250625-1750909311932','2025-06-26 03:41:51'),(79,6,'entrada',5.000,48.200,53.200,27,'recepcion',5,'Recepción 27062025','2025-06-27 19:03:45'),(80,3,'salida',1.000,101.500,100.500,29,'venta',3,'Venta V20250628-1751150774552','2025-06-28 22:46:14'),(81,6,'salida',1.000,53.200,52.200,30,'venta',3,'Venta V20250628-1751151452493','2025-06-28 22:57:32'),(82,3,'salida',2.000,100.500,98.500,31,'venta',3,'Venta V20250628-1751152077459','2025-06-28 23:07:57'),(83,2,'salida',1.000,5.000,4.000,31,'venta',3,'Venta V20250628-1751152077459','2025-06-28 23:07:57'),(84,2,'salida',1.000,4.000,3.000,32,'venta',3,'Venta V20250628-1751152450672','2025-06-28 23:14:10'),(85,3,'salida',1.000,98.500,97.500,33,'venta',3,'Venta V20250628-1751154134790','2025-06-28 23:42:14'),(86,3,'salida',1.000,97.500,96.500,34,'venta',3,'Venta V20250628-1751154175595','2025-06-28 23:42:55'),(87,6,'salida',1.000,52.200,51.200,34,'venta',3,'Venta V20250628-1751154175595','2025-06-28 23:42:55'),(88,3,'salida',1.000,96.500,95.500,35,'venta',3,'Venta V20250628-1751154226978','2025-06-28 23:43:46'),(89,6,'salida',1.000,51.200,50.200,35,'venta',3,'Venta V20250628-1751154226978','2025-06-28 23:43:46'),(90,10,'salida',1.000,70.000,69.000,35,'venta',3,'Venta V20250628-1751154226978','2025-06-28 23:43:46'),(91,2,'salida',1.000,3.000,2.000,35,'venta',3,'Venta V20250628-1751154226978','2025-06-28 23:43:46'),(92,3,'salida',1.000,95.500,94.500,36,'venta',3,'Venta V20250628-1751154247243','2025-06-28 23:44:07'),(93,3,'salida',1.000,94.500,93.500,37,'venta',3,'Venta V20250628-1751154576503','2025-06-28 23:49:36'),(94,6,'salida',1.000,50.200,49.200,38,'venta',3,'Venta V20250628-1751154662294','2025-06-28 23:51:02'),(95,10,'salida',1.000,69.000,68.000,39,'venta',3,'Venta V20250628-1751154713799','2025-06-28 23:51:53'),(96,3,'salida',1.000,93.500,92.500,40,'venta',3,'Venta V20250628-1751165990285','2025-06-29 02:59:50'),(97,3,'salida',1.000,92.500,91.500,41,'venta',3,'Venta V20250630-1751322443542','2025-06-30 22:27:23');
/*!40000 ALTER TABLE `movimientos_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo_barras` varchar(50) DEFAULT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text,
  `categoria_id` int DEFAULT NULL,
  `precio_compra` decimal(10,2) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `tipo_medida` enum('unidad','peso') DEFAULT 'unidad',
  `stock_actual` decimal(10,3) DEFAULT '0.000',
  `stock_minimo` decimal(10,3) DEFAULT '0.000',
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_barras` (`codigo_barras`),
  KEY `idx_productos_codigo_barras` (`codigo_barras`),
  KEY `idx_productos_nombre` (`nombre`),
  KEY `idx_productos_categoria` (`categoria_id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'7700304521005','Natri','ENDULZANTE CON STEVIA EN POLVO ',1,5000.00,6500.00,'unidad',5.000,5.000,1,'2025-06-09 21:01:03','2025-06-26 02:58:31'),(2,'7700304150069','BRILLA KINGS','DESENGRASANTE y DESIFECTANTE CITRUS ',7,1500.00,1800.00,'unidad',2.000,5.000,1,'2025-06-09 21:16:13','2025-06-28 23:43:46'),(3,NULL,'Papa Pastusa','',5,800.00,900.00,'peso',91.500,10.000,1,'2025-06-10 20:06:55','2025-06-30 22:27:23'),(4,'7702024066101','Nescafe 1.5g','Nescafe 1.5 g (Dedito)',1,100.00,300.00,'unidad',281.000,50.000,1,'2025-06-12 20:40:38','2025-06-26 02:58:31'),(5,'7702004025753','Pony Malta','PonyMalta Familiar de litro ',6,2000.00,2500.00,'unidad',21.000,4.000,1,'2025-06-20 02:05:32','2025-06-26 02:58:31'),(6,NULL,'Tomate ','Tomate cocina ',5,3000.00,3000.00,'peso',49.200,10.000,1,'2025-06-26 02:46:44','2025-06-28 23:51:02'),(7,NULL,'Cebolla ','Cebolla larga ',5,1000.00,1500.00,'peso',12.600,5.000,1,'2025-06-26 02:48:22','2025-06-26 02:58:31'),(8,NULL,'Carne Chata','Chata o Blanda ',3,15000.00,20000.00,'peso',38.400,10.000,1,'2025-06-26 02:49:01','2025-06-26 02:58:31'),(9,NULL,'Pollo','Pechuga complenta',3,20000.00,25000.00,'peso',18.200,10.000,1,'2025-06-26 02:49:55','2025-06-26 02:58:31'),(10,NULL,'Huevo AAA','Huevo grande AAA',1,400.00,600.00,'unidad',68.000,40.000,1,'2025-06-26 02:51:20','2025-06-28 23:51:53');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` text,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT 'Colombia',
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Distribuidora Central','María González','3001234567','ventas@distcentral.com','Calle 50 #25-30','Bogotá','Colombia',1,'2025-06-08 00:05:59','2025-06-08 00:05:59'),(2,'Lácteos del Valle','Carlos Rodríguez','3109876543','pedidos@lacteosval.com','Carrera 15 #40-20','Cali','Colombia',1,'2025-06-08 00:05:59','2025-06-08 00:05:59'),(3,'Fruver Fresco','Ana Martínez','3157654321','info@fruverfresco.com','Avenida 80 #30-15','Medellín','Colombia',1,'2025-06-08 00:05:59','2025-06-08 00:05:59'),(4,'RICHARD S.A.S','Richard Jimenez','3203715274','richard.jc20@hotmail.com','Calle7AN#12AE-08\nCasa blanca de dos piso esquin','CUCUTA','Colombia',1,'2025-06-09 02:26:52','2025-06-10 20:10:55'),(5,'DICOM S.A.S','MILAGROS','3144444444','Milagros@gmail.com','DIagonal 53 ','CUCUTA','Colombia',1,'2025-06-12 20:32:27','2025-06-12 20:32:27');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepciones`
--

DROP TABLE IF EXISTS `recepciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero_factura` varchar(100) NOT NULL,
  `proveedor_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `total` decimal(12,2) DEFAULT '0.00',
  `observaciones` text,
  `estado` enum('pendiente','procesada','cancelada') DEFAULT 'pendiente',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `proveedor_id` (`proveedor_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `idx_recepciones_fecha` (`fecha_recepcion`),
  CONSTRAINT `recepciones_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`),
  CONSTRAINT `recepciones_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepciones`
--

LOCK TABLES `recepciones` WRITE;
/*!40000 ALTER TABLE `recepciones` DISABLE KEYS */;
INSERT INTO `recepciones` VALUES (1,'RJ08062025',4,1,'2025-06-09',1500.00,'','procesada','2025-06-09 21:55:30'),(2,'RJ11062025',4,3,'2025-06-11',22500.00,'','procesada','2025-06-11 20:09:24'),(3,'RJ15062025',4,3,'2025-06-15',100500.00,'','procesada','2025-06-16 01:16:12'),(4,'RJ15062025913',4,3,'2025-06-15',100000.00,'','procesada','2025-06-16 02:14:04'),(5,'RJ1506',4,3,'2025-06-16',7500.00,'','procesada','2025-06-16 02:16:34'),(6,'RJ15067',4,3,'2025-06-16',3000.00,'','procesada','2025-06-16 02:17:24'),(7,'RJ15068',5,3,'2025-06-16',5000.00,'','procesada','2025-06-16 02:19:30'),(8,'RJ150675',5,3,'2025-06-16',25000.00,'','procesada','2025-06-16 02:34:27'),(9,'RJ19062025',4,3,'2025-06-19',24000.00,'','cancelada','2025-06-20 02:31:20'),(10,'RJ190620256',4,3,'2025-06-19',24000.00,'','procesada','2025-06-20 02:34:10'),(11,'RJ06192025',2,3,'2025-06-19',2000.00,'','procesada','2025-06-20 03:31:55'),(12,'23062025',4,3,'2025-06-23',22500.00,'','procesada','2025-06-23 17:27:17'),(13,'24062025',4,3,'2025-06-24',2000.00,'','procesada','2025-06-24 16:01:28'),(14,'rj24062025',4,3,'2025-06-24',12600.00,'','procesada','2025-06-24 16:13:31'),(15,'r24062025',4,3,'2025-06-24',1500.00,'','procesada','2025-06-24 16:36:44'),(16,'RJ1506',1,3,'2025-06-24',2000.00,'','cancelada','2025-06-24 16:40:19'),(17,'221326451',5,3,'2025-06-24',5000.00,'','procesada','2025-06-24 17:09:10'),(18,'5ds15sd1',5,3,'2025-06-24',5000.00,'','procesada','2025-06-24 17:18:13'),(19,'54512151',5,3,'2025-06-24',5000.00,'','cancelada','2025-06-24 17:37:21'),(20,'d55fdf2',4,3,'2025-06-24',2000.00,'','procesada','2025-06-24 17:41:27'),(21,'s52d2f1f12f',4,3,'2025-06-24',2000.00,'','procesada','2025-06-24 19:57:57'),(22,'lalskkks',3,3,'2025-06-24',1500.00,'','procesada','2025-06-24 19:59:15'),(23,'cllxff',1,3,'2025-06-24',1600.00,'','procesada','2025-06-24 20:08:07'),(24,'mnknk4mm',5,3,'2025-06-24',1200.00,'','procesada','2025-06-24 20:15:01'),(25,'adddssd',5,3,'2025-06-24',800.00,'','procesada','2025-06-24 21:32:21'),(26,'fs5dg21gf',5,3,'2025-06-24',900.00,'','procesada','2025-06-24 21:53:44'),(27,'27062025',4,5,'2025-06-27',15000.00,'','procesada','2025-06-27 19:03:34');
/*!40000 ALTER TABLE `recepciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `rol` enum('cajero','administrador','dueño','ayudante') NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','admin@supermercado.com','Administrador','Sistema','administrador',1,'2025-06-08 00:05:59','2025-06-08 00:05:59'),(2,'cajero1','$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','cajero1@supermercado.com','Juan','Pérez','cajero',1,'2025-06-08 00:05:59','2025-06-08 00:05:59'),(3,'RichardJG','$2a$10$GQrfhkB/I99E.21gKgfTHeZXcUqu9ZziSvrTEzCJcQIHrl2D32MuW','richard.jc20@hotmail.com','Richard Hernan','Jimenez Guerrero','administrador',1,'2025-06-10 21:24:10','2025-06-10 21:34:08'),(4,'LeticiaGC','$2a$10$5IU693.JUwvCj6.ibhGw3eb/Y/kmnrI.aJPoaisYvY9TGnSrBW8e6','leticiaguerrero04@hotmail.com','Leticia','Guerrero','dueño',1,'2025-06-11 00:09:28','2025-06-11 00:09:28'),(5,'Prueba1','$2a$10$nvGrqt152ceK6vtUXy9WWO8ZXR46s8sMZvWQKaDqkZNZje6Lckibi','preuba1@gmail.com','Prueba','Prueba1','ayudante',1,'2025-06-27 19:02:36','2025-06-27 19:02:36');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero_venta` varchar(100) NOT NULL,
  `usuario_id` int NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `metodo_pago` enum('efectivo','tarjeta','transferencia') DEFAULT 'efectivo',
  `fecha_venta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `idx_ventas_fecha` (`fecha_venta`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'V20250609-1749505944849',1,3600.00,'efectivo','2025-06-09 21:52:24'),(2,'V20250609-1749506021326',1,13000.00,'efectivo','2025-06-09 21:53:41'),(3,'V20250610-1749571739893',1,1700.00,'efectivo','2025-06-10 16:08:59'),(4,'V20250610-1749574716370',1,21200.00,'efectivo','2025-06-10 16:58:36'),(5,'V20250610-1749585709066',1,1700.00,'transferencia','2025-06-10 20:01:49'),(6,'V20250610-1749586075855',1,3750.00,'efectivo','2025-06-10 20:07:55'),(7,'V20250610-1749587117046',1,5250.00,'efectivo','2025-06-10 20:25:17'),(8,'V20250610-1749587207317',1,2250.00,'efectivo','2025-06-10 20:26:47'),(9,'V20250610-1749591068099',3,3750.00,'efectivo','2025-06-10 21:31:08'),(10,'V20250610-1749600847499',4,1500.00,'transferencia','2025-06-11 00:14:07'),(11,'V20250612-1749759835259',3,24200.00,'transferencia','2025-06-12 20:23:55'),(12,'V20250612-1749760968951',3,1500.00,'efectivo','2025-06-12 20:42:48'),(13,'V20250613-1749830535217',3,3000.00,'transferencia','2025-06-13 16:02:15'),(14,'V20250613-1749865467958',3,10500.00,'transferencia','2025-06-14 01:44:27'),(15,'V20250615-1750027821474',3,1500.00,'efectivo','2025-06-15 22:50:21'),(16,'V20250615-1750027913130',3,1700.00,'transferencia','2025-06-15 22:51:53'),(17,'V20250615-1750036725654',3,30000.00,'efectivo','2025-06-16 01:18:45'),(18,'V20250615-1750039856467',3,13500.00,'efectivo','2025-06-16 02:10:56'),(19,'V20250615-1750040106159',3,32300.00,'efectivo','2025-06-16 02:15:06'),(20,'V20250615-1750040476751',3,162500.00,'efectivo','2025-06-16 02:21:16'),(21,'V20250615-1750045170465',3,8000.00,'transferencia','2025-06-16 03:39:30'),(22,'V20250619-1750384728972',3,14250.00,'efectivo','2025-06-20 01:58:48'),(23,'V20250619-1750387121012',3,19150.00,'efectivo','2025-06-20 02:38:41'),(24,'V20250619-1750387915036',3,32500.00,'transferencia','2025-06-20 02:51:55'),(25,'V20250619-1750389299626',3,5000.00,'efectivo','2025-06-20 03:14:59'),(26,'V20250625-1750905708496',3,4500.00,'efectivo','2025-06-26 02:41:48'),(27,'V20250625-1750906711859',3,118250.00,'efectivo','2025-06-26 02:58:31'),(28,'V20250625-1750909311932',3,9000.00,'transferencia','2025-06-26 03:41:51'),(29,'V20250628-1751150774552',3,900.00,'efectivo','2025-06-28 22:46:14'),(30,'V20250628-1751151452493',3,3000.00,'efectivo','2025-06-28 22:57:32'),(31,'V20250628-1751152077459',3,3600.00,'transferencia','2025-06-28 23:07:57'),(32,'V20250628-1751152450672',3,1800.00,'efectivo','2025-06-28 23:14:10'),(33,'V20250628-1751154134790',3,900.00,'efectivo','2025-06-28 23:42:14'),(34,'V20250628-1751154175595',3,3900.00,'transferencia','2025-06-28 23:42:55'),(35,'V20250628-1751154226978',3,6300.00,'efectivo','2025-06-28 23:43:46'),(36,'V20250628-1751154247243',3,900.00,'efectivo','2025-06-28 23:44:07'),(37,'V20250628-1751154576503',3,900.00,'efectivo','2025-06-28 23:49:36'),(38,'V20250628-1751154662294',3,3000.00,'transferencia','2025-06-28 23:51:02'),(39,'V20250628-1751154713799',3,600.00,'efectivo','2025-06-28 23:51:53'),(40,'V20250628-1751165990285',3,900.00,'efectivo','2025-06-29 02:59:50'),(41,'V20250630-1751322443542',3,900.00,'efectivo','2025-06-30 22:27:23');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'supermercado_db'
--

--
-- Dumping routines for database 'supermercado_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-01 21:51:37
