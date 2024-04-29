CREATE DATABASE  IF NOT EXISTS `webapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `webapp`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: webapp
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id_bill` int unsigned NOT NULL AUTO_INCREMENT,
  `NIT` varchar(13) NOT NULL,
  `total` float unsigned NOT NULL,
  `client_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_bill`),
  KEY `NIT` (`NIT`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`NIT`) REFERENCES `clients` (`NIT`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,'12548796',165.8,'María Fernanda Vega'),(2,'54789632',208.8,'José Robert Gómez Chacón'),(3,'69854712',213.75,'Claudia Pérez'),(4,'785449632',349.9,'Sofía Castillo Morales'),(6,'874559621',255.4,'Jorge Martín Luna'),(7,'12548796',320,'María Fernanda Vega'),(8,'54789632',359.95,'José Robert Gómez Chacón'),(9,'69854712',303.95,'Claudia Pérez'),(10,'785449632',384.25,'Sofía Castillo Morales'),(11,'874559621',311.55,'Jorge Martín Luna');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkpoints`
--

DROP TABLE IF EXISTS `checkpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkpoints` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `route` int unsigned NOT NULL,
  `limit_queue` int unsigned NOT NULL,
  `queue_packages` int unsigned NOT NULL,
  `address` varchar(50) NOT NULL,
  `operation_fee` float unsigned DEFAULT NULL,
  `global_fee` float unsigned NOT NULL,
  `checkpoint_order` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `route` (`route`),
  CONSTRAINT `checkpoints_ibfk_1` FOREIGN KEY (`route`) REFERENCES `routes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkpoints`
--

LOCK TABLES `checkpoints` WRITE;
/*!40000 ALTER TABLE `checkpoints` DISABLE KEYS */;
INSERT INTO `checkpoints` VALUES (1,1,123,2,'Calzada Roosvelt',NULL,1500,1),(2,1,235,0,'San Lucas Sacatepéquez',NULL,1500,2),(3,1,153,0,'Santa Lucía Milpas Altas',NULL,1500,3),(4,1,142,0,'Entrada a Antigua Guatemala',NULL,1500,4),(5,2,321,1,'Salida de Quetzaltenango',800,1300,1),(6,2,245,0,'Cruce de San Carlos Alzatate',NULL,1300,2),(7,2,421,1,'Pasarela de San Sebastián',NULL,1300,3),(8,2,352,1,'Entrada de Retalhuleu',1200,1300,4),(9,3,200,0,'Salida de Cobán',600,1500,1),(10,3,241,0,'Cruce en Tactic',NULL,1500,2),(11,3,222,1,'San Pedro Carchá',NULL,1500,3),(12,3,249,0,'Entrada a Lanquín',NULL,1500,4),(13,4,100,1,'Salida de Flores',1780,1800,1),(14,4,152,1,'Cruce en El Remate',NULL,1800,2),(15,4,352,0,'Cerro Cahuí',NULL,1800,3),(16,4,324,4,'Entrada a Parque Nacional Tikal',2000,1800,4),(17,5,129,0,'Salida de Escuintla',1100,1000,1),(18,5,200,1,'La Gomera',NULL,1000,2),(19,5,250,1,'Puente La Avellana',1100,1000,3),(20,5,300,1,'Entrada a Puerto San José',NULL,1000,4);
/*!40000 ALTER TABLE `checkpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `NIT` varchar(13) NOT NULL,
  `name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`NIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES ('12548796','María Fernanda','Vega','54879654'),('54789632','José Robert','Gómez Chacón','54789632'),('69854712','Claudia','Pérez',NULL),('785449632','Sofía','Castillo Morales',NULL),('874559621','Jorge Martín','Luna','87459621');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operators`
--

DROP TABLE IF EXISTS `operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operators` (
  `id_checkpoint` int unsigned DEFAULT NULL,
  `state` bit(1) NOT NULL,
  `DPI` varchar(13) NOT NULL,
  `id_operator` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_operator`),
  KEY `DPI` (`DPI`),
  KEY `id_checkpoint` (`id_checkpoint`),
  CONSTRAINT `operators_ibfk_1` FOREIGN KEY (`DPI`) REFERENCES `users` (`DPI`),
  CONSTRAINT `operators_ibfk_2` FOREIGN KEY (`id_checkpoint`) REFERENCES `checkpoints` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operators`
--

LOCK TABLES `operators` WRITE;
/*!40000 ALTER TABLE `operators` DISABLE KEYS */;
/*!40000 ALTER TABLE `operators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `addressee` varchar(75) NOT NULL,
  `sender` varchar(75) NOT NULL,
  `route` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  `id_bill` int unsigned NOT NULL,
  `charge` float unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_bill` (`id_bill`),
  CONSTRAINT `package_ibfk_1` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`id_bill`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (2,'Diego Ramírez Soto','María Fernanda Vega',5,3.97,1,59.55),(3,'Lucía Fernanda Morales','María Fernanda Vega',5,1.1,1,16.5),(4,'Carlos López Ruiz','María Fernanda Vega',2,2.65,1,39.75),(5,'Elena Torres Vega','José Robert Gómez Chacón',1,4.63,2,69.45),(6,'Miguel Ángel Gómez Castro','José Robert Gómez Chacón',1,1.98,2,29.7),(7,'Carmen Martínez Pineda','José Robert Gómez Chacón',3,3.31,2,49.65),(8,'Juan Pérez Rodríguez','Claudia Pérez',4,2.43,3,36.45),(9,'Teresa Jimena Linares','Claudia Pérez',4,5.07,3,50.7),(10,'Francisco Gabriel Mendóza','Claudia Pérez',4,8.16,3,81.6),(11,'Ana María Sánchez Arias','Sofía Castillo Morales',4,9.92,4,99.2),(12,'José Luis Aguilar Navarro','Sofía Castillo Morales',4,7.05,4,70.5),(13,'Patricia Ortiz Correa','Sofía Castillo Morales',4,11.02,4,110.2),(15,'Fernando Castillo Marroquín','Jorge Martín Luna',2,6.17,6,61.7),(16,'Gabriela Espinoza Vargas','Jorge Martín Luna',2,6.61,6,66.1),(17,'Ricardo Méndez Barrios','Jorge Martín Luna',5,9.26,6,92.6),(18,'Carlos Mendez','María Fernanda Vega',1,3.31,7,49.65),(19,'Lucía Pérez','María Fernanda Vega',1,4.85,7,72.75),(20,'Juan Gómez','María Fernanda Vega',1,6.61,7,66.1),(21,'Ana López','María Fernanda Vega',1,1.76,7,26.4),(22,'Fernando Castillo','María Fernanda Vega',1,5.51,7,55.1),(23,'María Jiménez','José Robert Gómez Chacón',2,2.65,8,39.75),(24,'David Ruiz','José Robert Gómez Chacón',2,7.5,8,75),(25,'Gabriela Torres','José Robert Gómez Chacón',2,4.41,8,66.15),(26,'Roberto Hernández','José Robert Gómez Chacón',2,3.97,8,59.55),(27,'Patricia Sánchez','José Robert Gómez Chacón',2,5.95,8,59.5),(28,'Luis Álvarez','Claudia Pérez',3,3.53,9,52.95),(29,'Elena García','Claudia Pérez',3,5.07,9,50.7),(30,'Marco Vásquez','Claudia Pérez',3,6.83,9,68.3),(31,'Sofía Morales','Claudia Pérez',3,1.98,9,29.7),(32,'Alejandro Ramírez','Claudia Pérez',3,5.73,9,57.3),(33,'Isabel Martínez','Sofía Castillo Morales',4,2.87,10,43.05),(34,'Sergio Navarro','Sofía Castillo Morales',4,7.72,10,77.2),(35,'Carmen Díaz','Sofía Castillo Morales',4,4.63,10,69.45),(36,'Daniel Soto','Sofía Castillo Morales',4,4.19,10,62.85),(37,'Laura González','Sofía Castillo Morales',4,6.17,10,61.7),(38,'José Aguilar','Jorge Martín Luna',5,3.75,11,56.25),(39,'Teresa Méndez','Jorge Martín Luna',5,5.29,11,52.9),(40,'Ricardo Ortíz','Jorge Martín Luna',5,7.05,11,70.5),(41,'Silvia Castro','Jorge Martín Luna',5,2.2,11,33),(42,'Esteban Florers','Jorge Martín Luna',5,6.39,11,63.9);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_checkpoint`
--

DROP TABLE IF EXISTS `package_checkpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_checkpoint` (
  `id_process` int unsigned NOT NULL AUTO_INCREMENT,
  `id_checkpoint` int unsigned DEFAULT NULL,
  `id_package` int unsigned NOT NULL,
  `passed_hours` float unsigned NOT NULL,
  `state` varchar(50) NOT NULL,
  `entry_date` varchar(10) NOT NULL,
  `departure_date` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_process`),
  KEY `id_checkpoint` (`id_checkpoint`),
  KEY `id_package` (`id_package`),
  CONSTRAINT `package_checkpoint_ibfk_1` FOREIGN KEY (`id_checkpoint`) REFERENCES `checkpoints` (`id`),
  CONSTRAINT `package_checkpoint_ibfk_2` FOREIGN KEY (`id_package`) REFERENCES `package` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_checkpoint`
--

LOCK TABLES `package_checkpoint` WRITE;
/*!40000 ALTER TABLE `package_checkpoint` DISABLE KEYS */;
INSERT INTO `package_checkpoint` VALUES (153,18,2,2,'Punto de Control','2023-03-28',NULL),(154,19,3,2,'Punto de Control','2023-03-28',NULL),(155,5,4,4,'Punto de Control','2023-03-31',NULL),(156,1,5,4,'Punto de Control','2023-03-27',NULL),(157,1,6,2,'Punto de Control','2023-03-27',NULL),(158,11,7,6,'Punto de Control','2023-03-27',NULL),(159,13,8,6,'Punto de Control','2023-03-28',NULL),(160,14,9,2,'Punto de Control','2023-03-30',NULL),(161,16,10,8,'Punto de Control','2023-03-26',NULL),(162,16,11,8,'Punto de Control','2023-03-31',NULL),(163,16,12,16,'Punto de Control','2023-03-27',NULL),(164,16,13,4,'Punto de Control','2023-03-28',NULL),(165,7,15,0,'Punto de Control','2023-03-29',NULL),(166,8,16,2,'Punto de Control','2023-03-29',''),(167,20,17,3,'Punto de Control','2023-03-29',''),(168,NULL,18,0,'entregado','2023-03-04','2023-04-02'),(169,NULL,19,0,'entregado','2023-03-03','2023-04-03'),(170,NULL,20,0,'entregado','2023-03-02','2023-04-05'),(171,NULL,21,0,'entregado','2023-03-01','2023-04-06'),(172,NULL,22,0,'entregado','2023-03-21','2023-04-01'),(173,NULL,23,0,'entregado','2023-03-20','2023-04-01'),(174,NULL,24,0,'entregado','2023-03-19','2023-04-02'),(175,NULL,25,0,'entregado','2023-03-18','2023-04-01'),(176,NULL,26,0,'entregado','2023-03-17','2023-04-01'),(177,NULL,27,0,'entregado','2023-03-16','2023-04-05'),(178,NULL,28,0,'entregado','2023-03-15','2023-04-03'),(179,NULL,29,0,'entregado','2023-03-14','2023-04-02'),(180,NULL,30,0,'entregado','2023-03-13','2023-04-01'),(181,NULL,31,0,'entregado','2023-03-12','2023-04-06'),(182,NULL,32,0,'entregado','2023-03-11','2023-04-06'),(183,NULL,33,0,'entregado','2023-03-10','2023-04-06'),(184,NULL,34,0,'entregado','2023-03-09','2023-04-05'),(185,NULL,35,0,'entregado','2023-03-08','2023-04-03'),(186,NULL,36,0,'entregado','2023-03-07','2023-04-05'),(187,NULL,37,0,'entregado','2023-03-06','2023-04-04'),(188,NULL,38,0,'entregado','2023-03-05','2023-04-03'),(189,NULL,39,0,'entregado','2023-03-04','2023-04-03'),(190,NULL,40,0,'entregado','2023-03-03','2023-04-04'),(191,NULL,41,0,'entregado','2023-03-02','2023-04-05'),(192,NULL,42,0,'entregado','2023-03-01','2023-04-06');
/*!40000 ALTER TABLE `package_checkpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `weight` int unsigned NOT NULL,
  `price` float unsigned NOT NULL,
  PRIMARY KEY (`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (5,15),(6,10);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receptionists`
--

DROP TABLE IF EXISTS `receptionists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receptionists` (
  `id_receptionist` int unsigned NOT NULL AUTO_INCREMENT,
  `DPI` varchar(13) NOT NULL,
  `state` bit(1) NOT NULL,
  PRIMARY KEY (`id_receptionist`),
  KEY `DPI` (`DPI`),
  CONSTRAINT `receptionists_ibfk_1` FOREIGN KEY (`DPI`) REFERENCES `users` (`DPI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptionists`
--

LOCK TABLES `receptionists` WRITE;
/*!40000 ALTER TABLE `receptionists` DISABLE KEYS */;
/*!40000 ALTER TABLE `receptionists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `state` tinyint(1) NOT NULL,
  `destination_fee` float unsigned NOT NULL,
  `initial_address` varchar(50) NOT NULL,
  `end_address` varchar(50) NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `global_fee` float unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,50,'Ciudad de Guatemala','Antigua Guatemala',1,1500),(1,60,'Quetzaltenango','Retalhuleu',2,1300),(1,45,'Cobán','Lanquín',3,1500),(1,70,'Flores','Tikal',4,1800),(1,35,'Escuintla','Puerto San José',5,1000);
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `DPI` varchar(13) NOT NULL,
  `name_user` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `rol` varchar(13) NOT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`DPI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1029384756102','Melany Sofia','Tum','operador',1),('1111200398123','Juan José','Granados','recepcionista',1),('1122334455660','Carlos Francisco','Morales Pérez','recepcionista',0),('1234567890123','Manuel','Pinto','recepcionista',0),('284501236789','Sofía','López','operador',1),('284512347890','Gabriela','Rodríguez','recepcionista',1),('284523458901','Esteban','Morales','recepcionista',1),('284534569012','Patricia','Hernández','recepcionista',1),('284556781234','Juan','Pérez','administrador',1),('284567892345','Ana','Gómez','administrador',1),('284578903456','Carlos','Díaz','administrador',1),('284589014567','Luisa','Méndez','operador',1),('284590125678','Marco','Castillo','operador',1),('4023876010123','José María','Tzoc','operador',1),('5432167890150','Pedro','Smith','recepcionista',1),('5647382910109','Sergio Emanuel','Ramírez','administrador',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'webapp'
--

--
-- Dumping routines for database 'webapp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-29  0:03:40
