-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: Wifly
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Wifly`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Wifly` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Wifly`;

--
-- Table structure for table `abonos`
--

DROP TABLE IF EXISTS `abonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abonos` (
  `id_abono` int NOT NULL AUTO_INCREMENT,
  `tipo_de_abono` varchar(20) DEFAULT '10MB',
  `costo_abono` int DEFAULT '7000',
  `precio_abono` int DEFAULT '15000',
  PRIMARY KEY (`id_abono`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonos`
--

LOCK TABLES `abonos` WRITE;
/*!40000 ALTER TABLE `abonos` DISABLE KEYS */;
INSERT INTO `abonos` VALUES (1,'10MB',7000,15000),(2,'20MB',10000,20000),(3,'30MB',13000,26000),(4,'40MB',16000,32000);
/*!40000 ALTER TABLE `abonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `id_area` int NOT NULL AUTO_INCREMENT,
  `area_de_trabajo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'Administracion'),(2,'Tecnicos'),(3,'Maestranza'),(4,'Gerencia Administracion'),(5,'Ceo');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaciones`
--

DROP TABLE IF EXISTS `asignaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignaciones` (
  `id_empleado` int NOT NULL,
  `id_operacion` int NOT NULL,
  `fecha_de_asignacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_empleado`,`id_operacion`),
  KEY `FK_ASIGNACIONES_OPERACIONES` (`id_operacion`),
  CONSTRAINT `FK_ASIGNACIONES_EMPLEADOS` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  CONSTRAINT `FK_ASIGNACIONES_OPERACIONES` FOREIGN KEY (`id_operacion`) REFERENCES `operaciones` (`id_operacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaciones`
--

LOCK TABLES `asignaciones` WRITE;
/*!40000 ALTER TABLE `asignaciones` DISABLE KEYS */;
INSERT INTO `asignaciones` VALUES (5,1,'2022-01-09 14:30:00'),(5,3,'2022-03-09 16:00:00'),(5,5,'2022-05-14 11:00:00'),(5,8,'2022-08-14 17:00:00'),(5,10,'2022-10-24 14:30:00'),(5,13,'2022-12-24 11:00:00'),(5,15,'2023-02-14 16:00:00'),(5,18,'2023-05-14 11:30:00'),(5,20,'2023-07-09 17:00:00'),(5,23,'2023-10-14 11:30:00'),(5,25,'2023-12-09 18:00:00'),(5,28,'2024-03-14 12:00:00'),(5,30,'2024-05-14 11:30:00'),(5,33,'2024-08-09 18:00:00'),(5,35,'2024-10-09 10:00:00'),(5,38,'2024-01-19 13:00:00'),(5,40,'2024-03-19 11:30:00'),(5,43,'2024-06-09 08:00:00'),(5,45,'2024-08-09 17:00:00'),(5,48,'2024-11-14 10:30:00'),(5,50,'2024-01-24 12:00:00'),(5,53,'2024-04-24 17:00:00'),(5,55,'2024-06-24 09:00:00'),(5,57,'2024-08-24 16:00:00'),(5,59,'2024-10-24 10:00:00'),(5,62,'2024-01-30 12:00:00'),(5,64,'2024-03-29 10:30:00'),(5,67,'2024-06-29 09:00:00'),(5,69,'2024-08-29 18:00:00'),(5,72,'2024-11-29 12:00:00'),(5,74,'2024-01-30 11:00:00'),(5,77,'2024-04-29 18:00:00'),(5,79,'2024-06-29 10:00:00'),(5,82,'2024-09-29 13:00:00'),(5,84,'2024-11-29 10:00:00'),(5,87,'2024-02-28 09:00:00'),(5,89,'2024-04-29 16:00:00'),(5,92,'2024-07-30 11:00:00'),(5,94,'2024-09-29 12:00:00'),(5,97,'2024-12-30 16:00:00'),(5,99,'2024-02-28 09:00:00'),(5,102,'2024-05-30 13:00:00'),(5,104,'2024-07-30 11:00:00'),(5,107,'2024-10-30 10:00:00'),(5,109,'2024-12-14 13:00:00'),(6,1,'2022-01-09 14:30:00'),(6,3,'2022-03-09 16:00:00'),(6,6,'2022-06-19 12:30:00'),(6,8,'2022-08-14 17:00:00'),(6,11,'2022-11-09 10:00:00'),(6,13,'2022-12-24 11:00:00'),(6,16,'2023-03-19 09:00:00'),(6,18,'2023-05-14 11:30:00'),(6,21,'2023-08-14 12:00:00'),(6,23,'2023-10-14 11:30:00'),(6,26,'2024-01-14 13:00:00'),(6,28,'2024-03-14 12:00:00'),(6,31,'2024-06-09 08:00:00'),(6,33,'2024-08-09 18:00:00'),(6,36,'2024-11-14 11:30:00'),(6,38,'2024-01-19 13:00:00'),(6,41,'2024-04-09 16:00:00'),(6,43,'2024-06-09 08:00:00'),(6,46,'2024-09-14 11:30:00'),(6,48,'2024-11-14 10:30:00'),(6,51,'2024-02-24 08:00:00'),(6,53,'2024-04-24 17:00:00'),(6,56,'2024-07-24 11:00:00'),(6,57,'2024-08-24 16:00:00'),(6,60,'2024-11-24 11:30:00'),(6,62,'2024-01-30 12:00:00'),(6,65,'2024-04-29 17:00:00'),(6,67,'2024-06-29 09:00:00'),(6,70,'2024-09-29 13:00:00'),(6,72,'2024-11-29 12:00:00'),(6,75,'2024-02-28 09:00:00'),(6,77,'2024-04-29 18:00:00'),(6,80,'2024-07-30 11:30:00'),(6,82,'2024-09-29 13:00:00'),(6,85,'2024-12-30 18:00:00'),(6,87,'2024-02-28 09:00:00'),(6,90,'2024-05-30 13:00:00'),(6,92,'2024-07-30 11:00:00'),(6,95,'2024-10-30 10:00:00'),(6,97,'2024-12-30 16:00:00'),(6,100,'2024-03-30 10:00:00'),(6,102,'2024-05-30 13:00:00'),(6,105,'2024-08-30 16:00:00'),(6,107,'2024-10-30 10:00:00'),(6,110,'2024-12-29 13:00:00'),(7,2,'2022-02-14 15:00:00'),(7,4,'2022-04-09 10:00:00'),(7,6,'2022-06-19 12:30:00'),(7,9,'2022-09-19 13:00:00'),(7,11,'2022-11-09 10:00:00'),(7,14,'2023-01-09 15:00:00'),(7,16,'2023-03-19 09:00:00'),(7,19,'2023-06-19 12:00:00'),(7,21,'2023-08-14 12:00:00'),(7,24,'2023-11-19 09:00:00'),(7,26,'2024-01-14 13:00:00'),(7,29,'2024-04-09 16:00:00'),(7,31,'2024-06-09 08:00:00'),(7,34,'2024-09-14 12:00:00'),(7,36,'2024-11-14 11:30:00'),(7,39,'2024-02-14 09:00:00'),(7,41,'2024-04-09 16:00:00'),(7,44,'2024-07-14 13:00:00'),(7,46,'2024-09-14 11:30:00'),(7,49,'2024-12-09 18:00:00'),(7,51,'2024-02-24 08:00:00'),(7,54,'2024-05-24 13:00:00'),(7,56,'2024-07-24 11:00:00'),(7,58,'2024-09-24 12:00:00'),(7,60,'2024-11-24 11:30:00'),(7,63,'2024-02-28 09:00:00'),(7,65,'2024-04-29 17:00:00'),(7,68,'2024-07-29 11:00:00'),(7,70,'2024-09-29 13:00:00'),(7,73,'2024-12-29 16:00:00'),(7,75,'2024-02-28 09:00:00'),(7,78,'2024-05-30 12:00:00'),(7,80,'2024-07-30 11:30:00'),(7,83,'2024-10-30 09:00:00'),(7,85,'2024-12-30 18:00:00'),(7,88,'2024-03-30 10:00:00'),(7,90,'2024-05-30 13:00:00'),(7,93,'2024-08-30 18:00:00'),(7,95,'2024-10-30 10:00:00'),(7,98,'2024-01-30 13:00:00'),(7,100,'2024-03-30 10:00:00'),(7,103,'2024-06-29 09:00:00'),(7,105,'2024-08-30 16:00:00'),(7,108,'2024-11-29 11:00:00'),(7,110,'2024-12-29 13:00:00'),(8,2,'2022-02-14 15:00:00'),(8,4,'2022-04-09 10:00:00'),(8,7,'2022-07-24 09:00:00'),(8,9,'2022-09-19 13:00:00'),(8,12,'2022-12-14 15:00:00'),(8,14,'2023-01-09 15:00:00'),(8,17,'2023-04-09 10:30:00'),(8,19,'2023-06-19 12:00:00'),(8,22,'2023-09-09 08:00:00'),(8,24,'2023-11-19 09:00:00'),(8,27,'2024-02-09 10:00:00'),(8,29,'2024-04-09 16:00:00'),(8,32,'2024-07-14 13:00:00'),(8,34,'2024-09-14 12:00:00'),(8,37,'2024-12-09 17:00:00'),(8,39,'2024-02-14 09:00:00'),(8,42,'2024-05-14 12:00:00'),(8,44,'2024-07-14 13:00:00'),(8,47,'2024-10-09 09:00:00'),(8,49,'2024-12-09 18:00:00'),(8,52,'2024-03-24 11:30:00'),(8,54,'2024-05-24 13:00:00'),(8,58,'2024-09-24 12:00:00'),(8,61,'2024-12-24 17:00:00'),(8,63,'2024-02-28 09:00:00'),(8,66,'2024-05-29 12:00:00'),(8,68,'2024-07-29 11:00:00'),(8,71,'2024-10-29 10:00:00'),(8,73,'2024-12-29 16:00:00'),(8,76,'2024-03-30 10:00:00'),(8,78,'2024-05-30 12:00:00'),(8,81,'2024-08-30 16:00:00'),(8,83,'2024-10-30 09:00:00'),(8,86,'2024-01-30 12:00:00'),(8,88,'2024-03-30 10:00:00'),(8,91,'2024-06-29 09:00:00'),(8,93,'2024-08-30 18:00:00'),(8,96,'2024-11-29 11:00:00'),(8,98,'2024-01-30 13:00:00'),(8,101,'2024-04-29 16:00:00'),(8,103,'2024-06-29 09:00:00'),(8,106,'2024-09-29 12:00:00'),(8,108,'2024-11-29 11:00:00'),(9,5,'2022-05-14 11:00:00'),(9,7,'2022-07-24 09:00:00'),(9,10,'2022-10-24 14:30:00'),(9,12,'2022-12-14 15:00:00'),(9,15,'2023-02-14 16:00:00'),(9,17,'2023-04-09 10:30:00'),(9,20,'2023-07-09 17:00:00'),(9,22,'2023-09-09 08:00:00'),(9,25,'2023-12-09 18:00:00'),(9,27,'2024-02-09 10:00:00'),(9,30,'2024-05-14 11:30:00'),(9,32,'2024-07-14 13:00:00'),(9,35,'2024-10-09 10:00:00'),(9,37,'2024-12-09 17:00:00'),(9,40,'2024-03-19 11:30:00'),(9,42,'2024-05-14 12:00:00'),(9,45,'2024-08-09 17:00:00'),(9,47,'2024-10-09 09:00:00'),(9,50,'2024-01-24 12:00:00'),(9,52,'2024-03-24 11:30:00'),(9,55,'2024-06-24 09:00:00'),(9,59,'2024-10-24 10:00:00'),(9,61,'2024-12-24 17:00:00'),(9,64,'2024-03-29 10:30:00'),(9,66,'2024-05-29 12:00:00'),(9,69,'2024-08-29 18:00:00'),(9,71,'2024-10-29 10:00:00'),(9,74,'2024-01-30 11:00:00'),(9,76,'2024-03-30 10:00:00'),(9,79,'2024-06-29 10:00:00'),(9,81,'2024-08-30 16:00:00'),(9,84,'2024-11-29 10:00:00'),(9,86,'2024-01-30 12:00:00'),(9,89,'2024-04-29 16:00:00'),(9,91,'2024-06-29 09:00:00'),(9,94,'2024-09-29 12:00:00'),(9,96,'2024-11-29 11:00:00'),(9,99,'2024-02-28 09:00:00'),(9,101,'2024-04-29 16:00:00'),(9,104,'2024-07-30 11:00:00'),(9,106,'2024-09-29 12:00:00'),(9,109,'2024-12-14 13:00:00');
/*!40000 ALTER TABLE `asignaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `id_equipo` int NOT NULL,
  `id_abono` int NOT NULL,
  `fecha_de_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `razon_social` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `celular` varchar(100) NOT NULL,
  `dni` varchar(50) NOT NULL,
  `coordenadas` varchar(30) DEFAULT 'Cargar en domicilio',
  `numero_ip` varchar(50) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `numero_ip` (`numero_ip`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`),
  KEY `FK_CLIENTE_EQUIPO` (`id_equipo`),
  CONSTRAINT `FK_CLIENTE_EQUIPO` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,1,1,'2022-01-02 14:30:00','Constructora del Norte SA','Av. Corrientes 1234','011-2345678','30567890','-34.603722, -58.381592','192.168.1.1','info@constructoradelnorte.com.ar'),(2,10,2,'2022-01-08 15:00:00','Farmacia San Jose','Calle San Martin 567','0341-8765432','40543210','-32.946819, -60.63932','192.168.1.2','farmaciasanjose@gmail.com'),(3,5,3,'2022-01-17 15:30:00','Consultora de Marketing Integral','Ruta Nacional 9 km 45','0299-6543210','20567890','-38.95161, -68.0591','192.168.1.3','info@consultoraintegral.com.ar'),(4,3,4,'2022-01-25 16:00:00','Inmobiliaria Buenos Aires','Av. Rivadavia 789','0221-3456789','30678901','-34.921389, -57.954444','192.168.1.4','info@inmobiliariaba.com.ar'),(5,7,1,'2023-01-02 16:30:00','Imprenta del Sur SRL','Av. Libertador 678','0381-9876543','40678901','-27.469771, -58.830039','192.168.1.5','contacto@imprentadelsur.com.ar'),(6,8,2,'2023-01-03 17:00:00','Libreria El Quijote','Calle Belgrano 456','0291-2222222','50678901','-32.89084, -68.827171','192.168.1.6','info@libreriaelquijote.com.ar'),(7,4,3,'2023-01-20 17:30:00','Hotel Plaza Central','Av. San Martin 789','0342-2425267','20789012','-31.63333, -60.7','192.168.1.7','info@hotelplazacentral.com.ar'),(8,6,4,'2023-01-25 18:00:00','Estudio Juridico Gomez y Asociados','Av. Mitre 567','0223-4567890','40789012','-38.002281, -57.557539','192.168.1.8','info@gomezyasociados.com.ar'),(9,2,1,'2023-01-30 18:30:00','Constructora Rio de Plata SRL','Av. Independencia 123','0381-2145789','30789012','-27.469771, -58.830039','192.168.1.9','info@constructorariodeplata.com.ar'),(10,9,2,'2024-01-02 19:00:00','Centro Medico San Lucas','Calle Entre Rios 789','0341-6985471','50789012','-32.89084, -68.827171','192.168.1.10','info@centromedicosanlucas.com.ar'),(11,8,3,'2024-01-03 19:30:00','Despacho Contable Rodriguez','Ruta Nacional 12 km 34','0299-6578120','20890123','-27.469771, -58.830039','192.168.1.11','info@despachorodriguez.com.ar'),(12,3,4,'2024-01-03 20:00:00','Ferreteria San Martin','Av. San Juan 456','0221-5678901','40890123','-34.921389, -57.954444','192.168.1.12','info@ferreteriasanmartin.com.ar'),(13,10,1,'2024-01-04 20:30:00','Estudio de Arquitectura Flores','Av. Santa Fe 456','0381-3178456','30890123','-32.89084, -68.827171','192.168.1.13','info@estudioflores.com.ar'),(14,6,2,'2024-01-04 21:00:00','Farmacia del Sol','Calle Sarmiento 789','0341-6390147','50890123','-31.63333, -60.7','192.168.1.14','farmaciadelsol@gmail.com'),(15,4,3,'2024-01-05 21:30:00','Consultorio Odontologico Garcia','Av. 9 de Julio 123','0299-3741021','20901234','-38.95161, -68.0591','192.168.1.15','consultoriogarcia@gmail.com'),(16,1,4,'2024-01-06 22:00:00','Taller Mecanico Gonzalez','Av. Belgrano 678','0221-6066014','40901234','-34.921389, -57.954444','192.168.1.16','tallergonzalez@gmail.com'),(17,2,1,'2024-01-07 22:30:00','Estudio de Abogados Sin Fronteras','Av. Pellegrini 123','0381-4512784','30901234','-27.469771, -58.830039','192.168.1.17','info@abogadossinfronteras.com.ar'),(18,5,2,'2024-01-07 23:00:00','Peluqueria Estilo','Calle Espana 789','0341-7548124','50901234','-32.89084, -68.827171','192.168.1.18','peluqueriaestilo@gmail.com'),(19,7,3,'2024-01-07 23:30:00','Estudio Fotografico Luna','Ruta Nacional 14 km 56','0299-9988547','20123456','-38.95161, -68.0591','192.168.1.19','estudioluna@gmail.com'),(20,9,4,'2024-01-08 00:00:00','Consultora de Recursos Humanos','Av. Centenario 456','0221-3698574','40123456','-34.921389, -57.954444','192.168.1.20','consultorarh@gmail.com'),(21,3,1,'2024-01-09 00:30:00','Estudio de Diseno Soluciones Creativas','Cabildo 123','0381-3455789','30123456','-27.469771, -58.830039','192.168.1.21','solucionescreativas@gmail.com'),(22,4,2,'2024-01-09 01:00:00','Libreria El Dorado','Calle Italia 789','0341-2463102','50123456','-32.89084, -68.827171','192.168.1.22','libreriaeldorado@gmail.com'),(23,6,3,'2024-01-09 01:30:00','Imprenta de la Colina','Av. Libertad 123','0299-3436351','20234567','-38.95161, -68.0591','192.168.1.23','imprentadelacolina@gmail.com'),(24,1,4,'2024-01-10 02:00:00','Inmobiliaria del Sur','Av. Rivadavia 789','0221-3598741','40234567','-34.921389, -57.954444','192.168.1.24','inmobiliariadelsur@gmail.com'),(25,5,1,'2024-01-11 02:30:00','Ferreteria San Lorenzo','Av. Independencia 456','0381-8022578','30234567','-27.469771, -58.830039','192.168.1.25','ferreteriasanlorenzo@gmail.com'),(26,7,2,'2024-01-12 03:00:00','Tienda de Ropa El Sol','Calle Chile 789','0341-2345666','50234567','-32.89084, -68.827171','192.168.1.26','tiendaelsol@gmail.com'),(27,8,3,'2024-01-13 03:30:00','Estudio de Arquitectura Digital','Ruta Nacional 11 km 67','0299-8764432','20345678','-38.95161, -68.0591','192.168.1.27','arquitecturadigital@gmail.com'),(28,10,4,'2024-01-13 04:00:00','Consultora de Marketing Digital','Av. Sarmiento 123','0221-5633301','40345678','-34.921389, -57.954444','192.168.1.28','marketingdigital@gmail.com'),(29,2,1,'2024-01-14 04:30:00','Estudio de Abogados Garcia y Asociados','Av. Belgrano 456','0381-2322441','30345678','-27.469771, -58.830039','192.168.1.29','abogadosgarcia@gmail.com'),(30,9,2,'2024-01-15 05:00:00','Ferreteria del Norte','Av. San Martin 678','0341-8766632','50345678','-32.89084, -68.827171','192.168.1.30','ferreteriadelnorte@gmail.com'),(31,6,3,'2024-01-16 05:30:00','Estudio de Arquitectura Moderna','Calle Mitre 123','0291-6510010','20345678','-32.89084, -68.827171','192.168.1.31','arquitecturamoderna@gmail.com'),(32,4,4,'2024-01-16 06:00:00','Consultorio Medico San Pablo','Av. Rivadavia 456','0221-9800654','40345678','-34.921389, -57.954444','192.168.1.32','consultoriomedicosanpablo@gmail.com'),(33,1,1,'2024-01-17 06:30:00','Peluqueria Estilo y Belleza','Av. 9 de Julio 789','0381-3456698','50345678','-27.469771, -58.830039','192.168.1.33','peluqueriaestiloybelleza@gmail.com'),(34,2,2,'2024-01-18 07:00:00','Estudio Contable Martinez','Calle San Juan 123','0341-9955412','30345678','-32.89084, -68.827171','192.168.1.34','contablemartinez@gmail.com'),(35,5,3,'2024-01-19 07:30:00','Farmacia del Centro','Ruta Nacional 7 km 89','0299-3695874','20345678','-38.95161, -68.0591','192.168.1.35','farmaciadelcentro@gmail.com'),(36,7,4,'2024-01-20 08:00:00','Estudio Juridico Ramirez y Asociados','Av. Pellegrini 789','0221-2581036','40345678','-34.921389, -57.954444','192.168.1.36','ramirezyasociados@gmail.com'),(37,9,1,'2024-01-21 08:30:00','Centro de Estetica Bella Vista','Av. Centenario 123','0341-2344457','50345678','-32.89084, -68.827171','192.168.1.37','esteticabellavista@gmail.com'),(38,8,2,'2024-01-22 09:00:00','Optica Vision','Av. 25 de Mayo 456','0291-8844771','20345678','-38.95161, -68.0591','192.168.1.38','opticavision@gmail.com'),(39,6,3,'2024-01-23 09:30:00','Estudio Fotografico Eclipse','Calle Belgrano 789','0381-3322647','40345678','-27.469771, -58.830039','192.168.1.39','fotografiaeclipse@gmail.com'),(40,10,4,'2024-01-23 10:00:00','Constructora Los Andes','Av. San Martin 123','0341-2211475','50345678','-32.89084, -68.827171','192.168.1.40','constructoralosandes@gmail.com'),(41,3,1,'2024-01-24 10:30:00','Estudio de Diseno Creativo','Calle Mitre 456','0299-2355521','20345678','-38.95161, -68.0591','192.168.1.41','disenocreativo@gmail.com'),(42,4,2,'2024-01-25 11:00:00','Libreria El Dorado II','Av. Santa Fe 789','0221-6688874','40345678','-34.921389, -57.954444','192.168.1.42','libreriaeldoradoII@gmail.com'),(43,1,3,'2024-01-26 11:30:00','Peluqueria Estilo y Corte','Calle Sarmiento 123','0381-2325284','50345678','-27.469771, -58.830039','192.168.1.43','peluqueriaestiloycorte@gmail.com'),(44,2,4,'2024-01-27 12:00:00','Estudio Contable Fernandez','Av. Independencia 789','0341-3366587','20345678','-32.89084, -68.827171','192.168.1.44','contablefernandez@gmail.com'),(45,5,1,'2024-01-27 12:30:00','Farmacia del Sol II','Calle Italia 123','0299-3658741','40345678','-38.95161, -68.0591','192.168.1.45','farmaciadelsolII@gmail.com'),(46,7,2,'2024-01-28 13:00:00','Tienda de Ropa La Estrella','Av. Libertad 789','0221-5677777','50345678','-34.921389, -57.954444','192.168.1.46','tiendalaestrella@gmail.com'),(47,9,3,'2024-01-29 13:30:00','Estudio de Arquitectura Contemporanea','Calle Chile 456','0381-8285444','20345678','-27.469771, -58.830039','192.168.1.47','arquitecturacontemporanea@gmail.com'),(48,8,4,'2024-01-30 14:00:00','Optica La Vista','Av. Sarmiento 456','0341-2241570','40345678','-32.89084, -68.827171','192.168.1.48','opticalavista@gmail.com'),(49,6,1,'2024-01-30 14:30:00','Estudio Fotografico Aurora','Ruta Nacional 7 km 123','0299-9657428','50345678','-38.95161, -68.0591','192.168.1.49','fotografiaaurora@gmail.com'),(50,10,2,'2024-01-31 15:00:00','Constructora La Plata','Calle San Martin 789','0221-9833347','20345678','-34.921389, -57.954444','192.168.1.50','constructoralaplata@gmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `id_area` int NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `celular` varchar(50) NOT NULL,
  `dni` varchar(50) NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `celular` (`celular`),
  KEY `FK_EMPLEADO_AREA` (`id_area`),
  CONSTRAINT `FK_EMPLEADO_AREA` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,1,'Gomez','Ana','Av. Mitre 123','1234567890','12345678','1985-03-10'),(2,1,'Martinez','Lucia','Calle Urquiza 456','2345678901','23456789','1990-06-15'),(3,1,'Rodriguez','Carla','Montevideo 789','3456789012','34567890','1992-11-20'),(4,1,'Lopez','Silvia','Calle San Martín 101','4567890123','45678901','1988-09-25'),(5,2,'Perez','Juan','Av. Paraguay 202','5678901234','56789012','1983-02-14'),(6,2,'Fernandez','Pedro','Av. Del Libertador 303','6789012345','67890123','1979-07-30'),(7,2,'Martinez','Roberto','Calle San Juan 404','7890123456','78901234','1986-12-05'),(8,2,'Castro','Lucas','Calle Entre Ríos 505','8901234567','89012345','1991-10-22'),(9,2,'Alvarez','Julian','Calle Buenos Aires 606','9012345678','90123456','1987-05-19'),(10,3,'Silva','Martín','Calle Santa Fe 707','0123456789','01234567','1993-04-04');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(100) DEFAULT 'TP LINK',
  `modelo` varchar(100) DEFAULT '850N',
  `costo_equipo` int DEFAULT '32000',
  `precio_equipo` int DEFAULT '42000',
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Cisco','RV160W',35000,45000,5),(2,'Ubiquiti','Bullet AC',28000,38000,10),(3,'MikroTik','RB951Ui-2HnD',30000,40000,8),(4,'D-Link','DIR-878',32000,42000,7),(5,'Netgear','Orbi RBK50',38000,48000,3),(6,'Linksys','WRT3200ACM',37000,47000,4),(7,'Huawei','B525s-65a',34000,44000,6),(8,'Asus','RT-AX88U',40000,50000,2),(9,'TP Link','850N',32000,42000,9),(10,'Xiaomi','Mi Router 4A Gigabit Edition',29000,39000,12);
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `nro_factura` varchar(100) NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_pago` int NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `FK_FACTURA_PAGO` (`id_pago`),
  CONSTRAINT `FK_FACTURA_PAGO` FOREIGN KEY (`id_pago`) REFERENCES `tipo_de_pago` (`id_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,'0001-00000001','2023-01-01 08:00:00',1,1),(2,'0001-00000002','2023-02-01 08:00:00',2,2),(3,'0001-00000003','2023-03-01 08:00:00',3,3),(4,'0001-00000004','2023-04-01 08:00:00',4,4),(5,'0001-00000005','2023-05-01 08:00:00',5,5),(6,'0001-00000006','2023-06-01 08:00:00',6,6),(7,'0001-00000007','2023-07-01 08:00:00',7,7),(8,'0001-00000008','2023-08-01 08:00:00',1,8),(9,'0001-00000009','2023-09-01 08:00:00',2,9),(10,'0001-00000010','2023-10-01 08:00:00',3,10),(11,'0001-00000011','2023-11-01 08:00:00',4,11),(12,'0001-00000012','2023-12-01 08:00:00',5,12),(13,'0001-00000013','2024-01-01 08:00:00',6,13),(14,'0001-00000014','2024-02-01 08:00:00',7,14),(15,'0001-00000015','2024-03-01 08:00:00',1,15),(16,'0001-00000016','2024-04-01 08:00:00',2,16),(17,'0001-00000017','2024-05-01 08:00:00',3,17),(18,'0001-00000018','2024-06-01 08:00:00',4,18),(19,'0001-00000019','2024-07-01 08:00:00',5,19),(20,'0001-00000020','2024-08-01 08:00:00',6,20),(21,'0001-00000021','2024-09-01 08:00:00',7,21),(22,'0001-00000022','2024-10-01 08:00:00',1,22),(23,'0001-00000023','2024-11-01 08:00:00',2,23),(24,'0001-00000024','2024-12-01 08:00:00',3,24),(25,'0001-00000025','2024-01-15 08:00:00',4,25),(26,'0001-00000026','2024-02-15 08:00:00',5,26),(27,'0001-00000027','2024-03-15 08:00:00',6,27),(28,'0001-00000028','2024-04-15 08:00:00',7,28),(29,'0001-00000029','2024-05-15 08:00:00',1,29),(30,'0001-00000030','2024-06-15 08:00:00',2,30),(31,'0001-00000031','2024-07-15 08:00:00',3,31),(32,'0001-00000032','2024-08-15 08:00:00',4,32),(33,'0001-00000033','2024-09-15 08:00:00',5,33),(34,'0001-00000034','2024-10-15 08:00:00',6,34),(35,'0001-00000035','2024-11-15 08:00:00',7,35),(36,'0001-00000036','2024-12-15 08:00:00',1,36),(37,'0001-00000037','2024-01-31 08:00:00',2,37),(38,'0001-00000038','2024-02-28 08:00:00',3,38),(39,'0001-00000039','2024-03-31 08:00:00',4,39),(40,'0001-00000040','2024-04-30 08:00:00',5,40),(41,'0001-00000041','2024-05-31 08:00:00',6,41),(42,'0001-00000042','2024-06-30 08:00:00',7,42),(43,'0001-00000043','2024-07-31 08:00:00',1,43),(44,'0001-00000044','2024-08-31 08:00:00',2,44),(45,'0001-00000045','2024-09-30 08:00:00',3,45),(46,'0001-00000046','2024-10-31 08:00:00',4,46),(47,'0001-00000047','2024-11-30 08:00:00',5,47),(48,'0001-00000048','2024-12-31 08:00:00',6,48),(49,'0001-00000049','2024-01-15 08:00:00',7,49),(50,'0001-00000050','2024-02-15 08:00:00',1,50);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operaciones`
--

DROP TABLE IF EXISTS `operaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operaciones` (
  `id_operacion` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `tipo_operacion` varchar(100) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `respuesta` varchar(200) NOT NULL,
  `fecha_operaciones` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_operacion`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operaciones`
--

LOCK TABLES `operaciones` WRITE;
/*!40000 ALTER TABLE `operaciones` DISABLE KEYS */;
INSERT INTO `operaciones` VALUES (1,1,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2022-01-10 14:30:00'),(2,1,'Reclamo','router quemado','router reemplazado','2022-02-15 15:00:00'),(3,1,'Modificacion','cambiar router por modelo más nuevo','router cambiado','2022-03-10 16:00:00'),(4,1,'Baja','cancelar servicio','efectuado satisfactoriamente','2022-04-10 10:00:00'),(5,2,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2022-05-15 11:00:00'),(6,2,'Reclamo','cable cortado','cable reparado','2022-06-20 12:30:00'),(7,2,'Modificacion','cambiar configuración de red','cambio realizado','2022-07-25 09:00:00'),(8,3,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2022-08-15 17:00:00'),(9,3,'Reclamo','inestabilidad de conexion','conexion estabilizada','2022-09-20 13:00:00'),(10,3,'Baja','cancelar servicio','efectuado satisfactoriamente','2022-10-25 14:30:00'),(11,4,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2022-11-10 10:00:00'),(12,4,'Reclamo','router quemado','router reemplazado','2022-12-15 15:00:00'),(13,4,'Modificacion','cambiar IP estática a dinámica','cambio realizado','2022-12-25 11:00:00'),(14,5,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2023-01-10 15:00:00'),(15,5,'Reclamo','cable cortado','cable reparado','2023-02-15 16:00:00'),(16,5,'Baja','cancelar servicio','efectuado satisfactoriamente','2023-03-20 09:00:00'),(17,6,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2023-04-10 10:30:00'),(18,6,'Reclamo','inestabilidad de conexion','conexion estabilizada','2023-05-15 11:30:00'),(19,6,'Modificacion','cambiar configuración de red','cambio realizado','2023-06-20 12:00:00'),(20,7,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2023-07-10 17:00:00'),(21,7,'Reclamo','cable cortado','cable reparado','2023-08-15 12:00:00'),(22,8,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2023-09-10 08:00:00'),(23,8,'Reclamo','inestabilidad de conexion','conexion estabilizada','2023-10-15 11:30:00'),(24,8,'Baja','cancelar servicio','efectuado satisfactoriamente','2023-11-20 09:00:00'),(25,9,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2023-12-10 18:00:00'),(26,9,'Reclamo','cable cortado','cable reparado','2024-01-15 13:00:00'),(27,10,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-02-10 10:00:00'),(28,10,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-03-15 12:00:00'),(29,11,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-04-10 16:00:00'),(30,11,'Reclamo','cable cortado','cable reparado','2024-05-15 11:30:00'),(31,12,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-06-10 08:00:00'),(32,12,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-07-15 13:00:00'),(33,13,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-08-10 18:00:00'),(34,13,'Reclamo','cable cortado','cable reparado','2024-09-15 12:00:00'),(35,14,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-10-10 10:00:00'),(36,14,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-11-15 11:30:00'),(37,15,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-12-10 17:00:00'),(38,15,'Reclamo','cable cortado','cable reparado','2024-01-20 13:00:00'),(39,16,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-02-15 09:00:00'),(40,16,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-03-20 11:30:00'),(41,17,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-04-10 16:00:00'),(42,17,'Reclamo','cable cortado','cable reparado','2024-05-15 12:00:00'),(43,18,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-06-10 08:00:00'),(44,18,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-07-15 13:00:00'),(45,19,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-08-10 17:00:00'),(46,19,'Reclamo','cable cortado','cable reparado','2024-09-15 11:30:00'),(47,20,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-10-10 09:00:00'),(48,20,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-11-15 10:30:00'),(49,21,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-12-10 18:00:00'),(50,21,'Reclamo','cable cortado','cable reparado','2024-01-25 12:00:00'),(51,22,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-02-25 08:00:00'),(52,22,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-03-25 11:30:00'),(53,23,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-04-25 17:00:00'),(54,23,'Reclamo','cable cortado','cable reparado','2024-05-25 13:00:00'),(55,24,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-06-25 09:00:00'),(56,24,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-07-25 11:00:00'),(57,25,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-08-25 16:00:00'),(58,25,'Reclamo','cable cortado','cable reparado','2024-09-25 12:00:00'),(59,26,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-10-25 10:00:00'),(60,26,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-11-25 11:30:00'),(61,27,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-12-25 17:00:00'),(62,27,'Reclamo','cable cortado','cable reparado','2024-01-31 12:00:00'),(63,28,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-02-29 09:00:00'),(64,28,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-03-30 10:30:00'),(65,29,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-04-30 17:00:00'),(66,29,'Reclamo','cable cortado','cable reparado','2024-05-30 12:00:00'),(67,30,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-06-30 09:00:00'),(68,30,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-07-30 11:00:00'),(69,31,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-08-30 18:00:00'),(70,31,'Reclamo','cable cortado','cable reparado','2024-09-30 13:00:00'),(71,32,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-10-30 10:00:00'),(72,32,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-11-30 12:00:00'),(73,33,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-12-30 16:00:00'),(74,33,'Reclamo','cable cortado','cable reparado','2024-01-31 11:00:00'),(75,34,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-02-29 09:00:00'),(76,34,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-03-31 10:00:00'),(77,35,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-04-30 18:00:00'),(78,35,'Reclamo','cable cortado','cable reparado','2024-05-31 12:00:00'),(79,36,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-06-30 10:00:00'),(80,36,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-07-31 11:30:00'),(81,37,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-08-31 16:00:00'),(82,37,'Reclamo','cable cortado','cable reparado','2024-09-30 13:00:00'),(83,38,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-10-31 09:00:00'),(84,38,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-11-30 10:00:00'),(85,39,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-12-31 18:00:00'),(86,39,'Reclamo','cable cortado','cable reparado','2024-01-31 12:00:00'),(87,40,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-02-29 09:00:00'),(88,40,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-03-31 10:00:00'),(89,41,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-04-30 16:00:00'),(90,41,'Reclamo','cable cortado','cable reparado','2024-05-31 13:00:00'),(91,42,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-06-30 09:00:00'),(92,42,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-07-31 11:00:00'),(93,43,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-08-31 18:00:00'),(94,43,'Reclamo','cable cortado','cable reparado','2024-09-30 12:00:00'),(95,44,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-10-31 10:00:00'),(96,44,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-11-30 11:00:00'),(97,45,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-12-31 16:00:00'),(98,45,'Reclamo','cable cortado','cable reparado','2024-01-31 13:00:00'),(99,46,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-02-29 09:00:00'),(100,46,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-03-31 10:00:00'),(101,47,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-04-30 16:00:00'),(102,47,'Reclamo','cable cortado','cable reparado','2024-05-31 13:00:00'),(103,48,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-06-30 09:00:00'),(104,48,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-07-31 11:00:00'),(105,49,'Instalacion','visitar después de las 17hs','instalado satisfactoriamente','2024-08-31 16:00:00'),(106,49,'Reclamo','cable cortado','cable reparado','2024-09-30 12:00:00'),(107,50,'Instalacion','disponible solo por la mañana','instalado satisfactoriamente','2024-10-31 10:00:00'),(108,50,'Reclamo','inestabilidad de conexion','conexion estabilizada','2024-11-30 11:00:00'),(109,12,'Reclamo','cable cortado','cable reparado','2024-12-15 13:00:00'),(110,31,'Reclamo','cable cortado','cable reparado','2024-12-30 13:00:00');
/*!40000 ALTER TABLE `operaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `chequear_fecha_futura` BEFORE INSERT ON `operaciones` FOR EACH ROW BEGIN
    DECLARE fecha_limite DATETIME;
    DECLARE mensaje_error TEXT;

    -- OBTENER FECHA ACTUAL Y FECHA LIMITE
    SET fecha_limite = DATE_ADD(NOW(), INTERVAL 6 MONTH);

    -- MENSAJE DE ERROR
    SET mensaje_error = CONCAT('La fecha de la operación no puede superar los 6 meses desde ahora. La fecha límite es: ', fecha_limite, '.');

    -- VERIFICACIÓN DE FECHA ACTUAL SUPERA FECHA LIMITE
    IF NEW.fecha_operaciones > fecha_limite THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mensaje_error;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `razon_social` (`razon_social`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Netcom Argentina SRL','Av. Libertador 1234','011-2345678','info@netcomargentina.com.ar'),(2,'Conexión Wireless SA','Av. San Martín 567','0341-8765432','ventas@conexionwireless.com.ar'),(3,'Servicios Wifi Express','Calle 9 de Julio 789','0221-3456789','info@wifiexpress.com.ar'),(4,'RapidLink Telecomunicaciones','Ruta 3 km 45','0299-6543210','ventas@rapidlinktelecom.com.ar'),(5,'Inalámbricos del Sur SA','Av. Patagonia 678','0381-9876543','info@inalambricosdelsur.com.ar'),(6,'WirelessNet Soluciones','Av. Norte 4321','0261-2345678','contacto@wirelessnetsoluciones.com.ar'),(7,'Servicios de Internet Inalámbrico','Calle Principal 789','0342-8765432','ventas@serviciosdeinternet.com.ar'),(8,'Global Wireless Solutions','Ruta Nacional 1 km 23','0223-3456789','info@globalwireless.com.ar'),(9,'Redes Wifi SA','Av. Belgrano 456','0291-6543210','contacto@redeswifi.com.ar'),(10,'Linkup Telecomunicaciones','Av. Rivadavia 987','011-9876543','ventas@linkuptelecom.com.ar'),(11,'WiFi Tech Solutions','Av. Córdoba 1234','0341-2345678','info@wifitech.com.ar'),(12,'Telecomunicaciones Inalámbricas del Centro','Calle Sarmiento 567','0261-8765432','contacto@telecomunicacionescentral.com.ar'),(13,'Conectividad Wireless Argentina','Av. Independencia 789','0299-2345678','ventas@conectividadwireless.com.ar'),(14,'Netlink Inalámbrico','Av. Corrientes 456','0223-8765432','info@netlinkinalambrico.com.ar'),(15,'WifiXpress Comunicaciones','Av. Mitre 678','0381-2345678','contacto@wifixpress.com.ar');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suministros`
--

DROP TABLE IF EXISTS `suministros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suministros` (
  `id_proveedor` int NOT NULL,
  `id_equipo` int NOT NULL,
  `fecha_de_suministro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_proveedor`,`id_equipo`),
  KEY `FK_SUMINISTRO_EQUIPO` (`id_equipo`),
  CONSTRAINT `FK_SUMINISTRO_EQUIPO` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`),
  CONSTRAINT `FK_SUMINISTRO_PROVEEDOR` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suministros`
--

LOCK TABLES `suministros` WRITE;
/*!40000 ALTER TABLE `suministros` DISABLE KEYS */;
INSERT INTO `suministros` VALUES (1,1,'2022-01-01 08:00:00'),(1,6,'2022-04-16 08:00:00'),(2,2,'2022-01-08 08:00:00'),(2,7,'2022-04-23 08:00:00'),(3,3,'2022-01-15 08:00:00'),(3,8,'2022-04-30 08:00:00'),(4,4,'2022-01-22 08:00:00'),(4,9,'2022-05-07 08:00:00'),(5,5,'2022-01-29 08:00:00'),(5,10,'2022-05-14 08:00:00'),(6,1,'2022-05-21 08:00:00'),(6,6,'2022-02-05 08:00:00'),(7,2,'2022-05-28 08:00:00'),(7,7,'2022-02-12 08:00:00'),(8,3,'2022-06-04 08:00:00'),(8,8,'2022-02-19 08:00:00'),(9,4,'2022-06-11 08:00:00'),(9,9,'2022-02-26 08:00:00'),(10,5,'2022-06-18 08:00:00'),(10,10,'2022-03-05 08:00:00'),(11,1,'2022-03-12 08:00:00'),(11,6,'2022-06-25 08:00:00'),(12,2,'2022-03-19 08:00:00'),(12,7,'2022-07-02 08:00:00'),(13,3,'2022-03-26 08:00:00'),(13,8,'2022-07-09 08:00:00'),(14,4,'2022-04-02 08:00:00'),(14,9,'2022-07-16 08:00:00'),(15,5,'2022-04-09 08:00:00'),(15,10,'2022-07-23 08:00:00');
/*!40000 ALTER TABLE `suministros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_pago`
--

DROP TABLE IF EXISTS `tipo_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_de_pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `tipo_de_pago` varchar(50) DEFAULT 'Efectivo',
  PRIMARY KEY (`id_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_pago`
--

LOCK TABLES `tipo_de_pago` WRITE;
/*!40000 ALTER TABLE `tipo_de_pago` DISABLE KEYS */;
INSERT INTO `tipo_de_pago` VALUES (1,'Efectivo'),(2,'Tarjeta de debito'),(3,'Tarjeta de credito'),(4,'Transferencia bancaria'),(5,'Mercado pago'),(6,'Cheque'),(7,'E-cheq');
/*!40000 ALTER TABLE `tipo_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_factura` int NOT NULL,
  `id_abono` int NOT NULL,
  `id_equipo` int NOT NULL,
  `id_operacion` int NOT NULL,
  `id_pago` int NOT NULL,
  `id_cliente` int NOT NULL,
  `cantidad` int NOT NULL,
  `costo_abono` int NOT NULL,
  `precio_abono` int NOT NULL,
  `costo_equipo` int NOT NULL,
  `precio_equipo` int NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `FK_VENTAS_FACTURAS` (`id_factura`),
  KEY `FK_VENTAS_ABONOS` (`id_abono`),
  KEY `FK_VENTAS_OPERACIONES` (`id_operacion`),
  KEY `FK_VENTAS_CLIENTES` (`id_cliente`),
  CONSTRAINT `FK_VENTAS_ABONOS` FOREIGN KEY (`id_abono`) REFERENCES `abonos` (`id_abono`),
  CONSTRAINT `FK_VENTAS_CLIENTES` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `FK_VENTAS_FACTURAS` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id_factura`),
  CONSTRAINT `FK_VENTAS_OPERACIONES` FOREIGN KEY (`id_operacion`) REFERENCES `operaciones` (`id_operacion`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,1,1,1,1,1,1,7000,15000,35000,45000),(2,2,2,10,5,2,2,1,10000,20000,29000,39000),(3,3,3,5,8,3,3,1,13000,26000,38000,48000),(4,4,4,3,11,4,4,1,16000,32000,30000,40000),(5,5,1,7,14,5,5,1,7000,15000,34000,44000),(6,6,2,8,17,6,6,1,10000,20000,40000,50000),(7,7,3,4,20,7,7,1,13000,26000,32000,42000),(8,8,4,6,22,1,8,1,16000,32000,37000,47000),(9,9,1,2,25,2,9,1,7000,15000,28000,38000),(10,10,2,9,27,3,10,1,10000,20000,32000,42000),(11,11,3,8,29,4,11,1,13000,26000,40000,50000),(12,12,4,3,31,5,12,1,16000,32000,30000,40000),(13,13,1,10,33,6,13,1,7000,15000,29000,39000),(14,14,2,6,35,7,14,1,10000,20000,37000,47000),(15,15,3,4,37,1,15,1,13000,26000,32000,42000),(16,16,4,1,39,2,16,1,16000,32000,35000,45000),(17,17,1,2,41,3,17,1,7000,15000,28000,38000),(18,18,2,5,43,4,18,1,10000,20000,38000,48000),(19,19,3,7,45,5,19,1,13000,26000,34000,44000),(20,20,4,9,47,6,20,1,16000,32000,32000,42000),(21,21,1,3,49,7,21,1,7000,15000,30000,40000),(22,22,2,4,51,1,22,1,10000,20000,32000,42000),(23,23,3,6,53,2,23,1,13000,26000,37000,47000),(24,24,4,1,55,3,24,1,16000,32000,35000,45000),(25,25,1,5,57,4,25,1,7000,15000,38000,48000),(26,26,2,7,59,5,26,1,10000,20000,34000,44000),(27,27,3,8,61,6,27,1,13000,26000,40000,50000),(28,28,4,10,63,7,28,1,16000,32000,29000,39000),(29,29,1,2,65,1,29,1,7000,15000,28000,38000),(30,30,2,9,67,2,30,1,10000,20000,32000,42000),(31,31,3,6,69,3,31,1,13000,26000,37000,47000),(32,32,4,4,71,4,32,1,16000,32000,32000,42000),(33,33,1,1,73,5,33,1,7000,15000,35000,45000),(34,34,2,2,75,6,34,1,10000,20000,28000,38000),(35,35,3,5,77,7,35,1,13000,26000,38000,48000),(36,36,4,7,79,1,36,1,16000,32000,34000,44000),(37,37,1,9,81,2,37,1,7000,15000,32000,42000),(38,38,2,8,83,3,38,1,10000,20000,40000,50000),(39,39,3,6,85,4,39,1,13000,26000,37000,47000),(40,40,4,10,87,5,40,1,16000,32000,29000,39000),(41,41,1,3,89,6,41,1,7000,15000,30000,40000),(42,42,2,4,91,7,42,1,10000,20000,32000,42000),(43,43,3,1,93,1,43,1,13000,26000,35000,45000),(44,44,4,2,95,2,44,1,16000,32000,28000,38000),(45,45,1,5,97,3,45,1,7000,15000,38000,48000),(46,46,2,7,99,4,46,1,10000,20000,34000,44000),(47,47,3,9,101,5,47,1,13000,26000,32000,42000),(48,48,4,8,103,6,48,1,16000,32000,40000,50000),(49,49,1,6,105,7,49,1,7000,15000,37000,47000),(50,50,2,10,107,1,50,1,10000,20000,29000,39000);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `verificar_cantidad_equipo` BEFORE INSERT ON `ventas` FOR EACH ROW BEGIN
    DECLARE cantidad_disponible INT;

    SELECT cantidad INTO cantidad_disponible
    FROM EQUIPOS
    WHERE id_equipo = NEW.id_equipo;

    IF cantidad_disponible < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay suficiente cantidad en stock para el equipo seleccionado.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `view_admin_abonos_clientes`
--

DROP TABLE IF EXISTS `view_admin_abonos_clientes`;
/*!50001 DROP VIEW IF EXISTS `view_admin_abonos_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_admin_abonos_clientes` AS SELECT 
 1 AS `id_cliente`,
 1 AS `Nombre Cliente`,
 1 AS `id_abono`,
 1 AS `Tipo de Abono`,
 1 AS `precio_abono`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_admin_equipos_adquiridos_fecha`
--

DROP TABLE IF EXISTS `view_admin_equipos_adquiridos_fecha`;
/*!50001 DROP VIEW IF EXISTS `view_admin_equipos_adquiridos_fecha`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_admin_equipos_adquiridos_fecha` AS SELECT 
 1 AS `id_cliente`,
 1 AS `Nombre Cliente`,
 1 AS `id_equipo`,
 1 AS `marca`,
 1 AS `modelo`,
 1 AS `id_proveedor`,
 1 AS `Nombre Proveedor`,
 1 AS `fecha_de_suministro`,
 1 AS `fecha_factura`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_admin_operaciones_respuesta`
--

DROP TABLE IF EXISTS `view_admin_operaciones_respuesta`;
/*!50001 DROP VIEW IF EXISTS `view_admin_operaciones_respuesta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_admin_operaciones_respuesta` AS SELECT 
 1 AS `tipo_operacion`,
 1 AS `fecha_operaciones`,
 1 AS `Empleado`,
 1 AS `respuesta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_bajas_clientes`
--

DROP TABLE IF EXISTS `view_bajas_clientes`;
/*!50001 DROP VIEW IF EXISTS `view_bajas_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_bajas_clientes` AS SELECT 
 1 AS `id_cliente`,
 1 AS `Nombre Cliente`,
 1 AS `id_operacion`,
 1 AS `Descripcion Operacion`,
 1 AS `Fecha Operacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_gerencia_ganancia_equipos`
--

DROP TABLE IF EXISTS `view_gerencia_ganancia_equipos`;
/*!50001 DROP VIEW IF EXISTS `view_gerencia_ganancia_equipos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_gerencia_ganancia_equipos` AS SELECT 
 1 AS `id_cliente`,
 1 AS `Ganancia Equipos`,
 1 AS `razon_social`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_reclamos_respuesta`
--

DROP TABLE IF EXISTS `view_reclamos_respuesta`;
/*!50001 DROP VIEW IF EXISTS `view_reclamos_respuesta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_reclamos_respuesta` AS SELECT 
 1 AS `id_operacion`,
 1 AS `Descripción Reclamo`,
 1 AS `Respuesta`,
 1 AS `Fecha`,
 1 AS `id_cliente`,
 1 AS `Nombre Cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'Wifly'
--
/*!50003 DROP FUNCTION IF EXISTS `descuento_abono` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `descuento_abono`(p_id_abono INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE precio_origen INT;
    DECLARE precio_descuento INT;

    -- PRECIO ORIGINAL SEGÚN ABONO PROPORCIONADO
    SELECT precio_abono INTO precio_origen
    FROM ABONOS
    WHERE id_abono = p_id_abono;

    -- CALCULAR EL 10% CON DESCUENTO
    SET precio_descuento = precio_origen * 0.5;

    -- RETORNAR EL PRECIO CON EL DESCUENTO
    RETURN precio_descuento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ganancia_anual_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ganancia_anual_cliente`(id_cliente INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE ganancia_mensual INT;
    DECLARE ganancia_anual INT;
    SELECT 
       v.precio_abono - v.costo_abono
    INTO ganancia_mensual
    FROM VENTAS v
    WHERE v.id_cliente = id_cliente;
    SET ganancia_anual = ganancia_mensual * 12;

    RETURN ganancia_anual;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_domicilio_ip_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_domicilio_ip_cliente`(
    IN p_id_cliente INT,
    IN p_nueva_direccion VARCHAR(100),
    IN p_nueva_ip VARCHAR(50)
)
BEGIN
    -- INICIO DE TCL
    START TRANSACTION;

    -- VERIFICAR SI EL CLIENTE EXISTE
    IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE id_cliente = p_id_cliente) THEN
        -- ERROR SI EL CLIENTE NO EXISTE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no existe, deberá darlo de alta';

    ELSE
        -- MODIFICAR DIRECCIÓN CLIENTE
        UPDATE CLIENTES
        SET direccion = p_nueva_direccion
        WHERE id_cliente = p_id_cliente;

        -- SAVEPOINT DESPUÉS DE MODIFICAR DIRECCIÓN
        SAVEPOINT direccion_modificada;

        -- VERIFICAR SI LA IP ESTÁ EN USO
        IF EXISTS (SELECT 1 FROM CLIENTES WHERE numero_ip = p_nueva_ip AND id_cliente <> p_id_cliente) THEN
            -- REVERTIR TRANSACCIÓN HASTA SAVEPOINT
            ROLLBACK TO SAVEPOINT direccion_modificada;

            -- ERROR POR IP EN USO
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La IP ya está en uso por otro cliente';

        ELSE
            -- ACTUALIZAR IP CLIENTE
            UPDATE CLIENTES
            SET numero_ip = p_nueva_ip
            WHERE id_cliente = p_id_cliente;

            -- CONFIRMAR TRANSACCIÓN EXITOSA
            COMMIT;
        END IF;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_cliente_y_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_cliente_y_factura`(
    IN p_id_cliente INT,
    IN p_id_equipo INT,
    IN p_id_abono INT,
    IN p_razon_social VARCHAR(100),
    IN p_direccion VARCHAR(100),
    IN p_celular VARCHAR(100),
    IN p_dni VARCHAR(50),
    IN p_numero_ip VARCHAR(50),
    IN p_correo_electronico VARCHAR(100),
    IN p_nro_factura VARCHAR(100),
    IN p_id_pago INT
)
BEGIN
    -- INICIO DE TCL
    START TRANSACTION;

    -- VERIFICAR EXISTENCIA EQUIPO
    IF NOT EXISTS (SELECT 1 FROM EQUIPOS WHERE id_equipo = p_id_equipo) THEN
        -- ERROR SI EL EQUIPO NO EXISTE
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El equipo especificado no existe.';
    END IF;

    -- VERIFICAR EXISTENCIA ABONO
    IF NOT EXISTS (SELECT 1 FROM ABONOS WHERE id_abono = p_id_abono) THEN
        -- ERROR SI EL ABONO NO EXISTE
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El tipo de abono especificado no existe.';
    END IF;

    -- VERIFICAR EXISTENCIA CLIENTE
    IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE id_cliente = p_id_cliente) THEN
        -- SI EL CLIENTE NO EXISTE, SE INSERTA UN NUEVO CLIENTE
        INSERT INTO CLIENTES (
            id_cliente, id_equipo, id_abono, razon_social, direccion, celular, dni, numero_ip, correo_electronico
        ) VALUES (
            p_id_cliente, p_id_equipo, p_id_abono, p_razon_social, p_direccion, p_celular, p_dni, p_numero_ip, p_correo_electronico
        );
    END IF;

    -- SAVEPOINT DESPUÉS DE INSERTAR CLIENTE O VERIFICAR EXISTENCIA
    SAVEPOINT cliente_verificado;

    -- VERIFICAR EXISTENCIA TIPO DE PAGO
    IF NOT EXISTS (SELECT 1 FROM TIPO_DE_PAGO WHERE id_pago = p_id_pago) THEN
        -- ERROR SI EL TIPO DE PAGO NO EXISTE
        ROLLBACK TO SAVEPOINT cliente_verificado;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El tipo de pago especificado no existe.';
    END IF;

    -- VERIFICAR SI EL NÚMERO DE FACTURA YA EXISTE
    IF p_nro_factura IS NOT NULL THEN
        IF EXISTS (SELECT 1 FROM FACTURAS WHERE nro_factura = p_nro_factura) THEN
            -- ERROR SI EL NÚMERO DE FACTURA YA EXISTE
            ROLLBACK TO SAVEPOINT cliente_verificado;
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El número de factura ya existe.';
        END IF;

        -- INSERTAR NUEVA FACTURA
        INSERT INTO FACTURAS (nro_factura, id_pago, id_cliente)
        VALUES (p_nro_factura, p_id_pago, p_id_cliente);
    END IF;

    -- CONFIRMAR LA TRANSACCIÓN
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_equipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_equipo`(
    IN marca VARCHAR(100),
    IN modelo VARCHAR(100),
    IN costo_equipo INT,
    IN precio_equipo INT,
    IN cantidad INT
)
BEGIN
    DECLARE resultado INT DEFAULT 0;

    -- VALIDAR MARCA DEL EQUIPO
    IF marca = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La marca del equipo no puede estar vacía';
    END IF;

    -- VALIDAR MODELO DEL EQUIPO
    IF modelo = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El modelo del equipo no puede estar vacío';
    END IF;

    -- VALIDAR COSTO DEL EQUIPO
    IF costo_equipo <= 28000 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El costo del equipo debe ser mayor que 28.000';
    END IF;

    -- VALIDAR PRECIO DEL EQUIPO
    IF precio_equipo <= costo_equipo THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio del equipo debe ser mayor que su costo';
    END IF;

    -- VALIDAR CANTIDAD
    IF cantidad <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cantidad debe ser mayor que 0';
    END IF;

    -- INSERCIÓN DEL NUEVO EQUIPO
    INSERT INTO EQUIPOS (marca, modelo, costo_equipo, precio_equipo, cantidad)
    VALUES (marca, modelo, costo_equipo, precio_equipo, cantidad);

    -- NÚMERO DE FILAS AFECTADAS
    SET resultado = ROW_COUNT();

    -- VALIDAR INSERCIÓN
    IF resultado = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se insertó ningún equipo por no cumplir con los requisitos mínimos';
    END IF;

    -- MOSTRAR ÚLTIMO REGISTRO INSERTADO
    SELECT * FROM EQUIPOS ORDER BY id_equipo DESC LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_abono` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_abono`(
    IN tipo_abono VARCHAR(50),
    IN costo_abono INT,
    IN precio_abono INT,
    OUT id_nuevo_abono INT
)
BEGIN
    -- VALOR DEL PARÁMETRO DE SALIDA
    SET id_nuevo_abono = -1;

    -- ESTABLECER Y VERIFICAR LAS CONDICIONES
    IF 
        -- COMPARAR EL NUEVO ABONO CON LAS CONDICIONES
        tipo_abono > '40MB' AND 
        costo_abono > 16000 AND 
        precio_abono > 36000
    THEN
        -- INSERCIÓN NUEVO ABONO
        INSERT INTO ABONOS (tipo_de_abono, costo_abono, precio_abono)
        VALUES (tipo_abono, costo_abono, precio_abono);

        -- OBTENER ID NUEVO ABONO
        SET id_nuevo_abono = LAST_INSERT_ID();
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `Wifly`
--

USE `Wifly`;

--
-- Final view structure for view `view_admin_abonos_clientes`
--

/*!50001 DROP VIEW IF EXISTS `view_admin_abonos_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_admin_abonos_clientes` AS select `c`.`id_cliente` AS `id_cliente`,`c`.`razon_social` AS `Nombre Cliente`,`c`.`id_abono` AS `id_abono`,`a`.`tipo_de_abono` AS `Tipo de Abono`,`a`.`precio_abono` AS `precio_abono` from (`clientes` `c` join `abonos` `a` on((`c`.`id_abono` = `a`.`id_abono`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_admin_equipos_adquiridos_fecha`
--

/*!50001 DROP VIEW IF EXISTS `view_admin_equipos_adquiridos_fecha`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_admin_equipos_adquiridos_fecha` AS select `c`.`id_cliente` AS `id_cliente`,`c`.`razon_social` AS `Nombre Cliente`,`e`.`id_equipo` AS `id_equipo`,`e`.`marca` AS `marca`,`e`.`modelo` AS `modelo`,`s`.`id_proveedor` AS `id_proveedor`,`p`.`razon_social` AS `Nombre Proveedor`,`s`.`fecha_de_suministro` AS `fecha_de_suministro`,`f`.`fecha` AS `fecha_factura` from ((((`clientes` `c` join `equipos` `e` on((`c`.`id_equipo` = `e`.`id_equipo`))) join `facturas` `f` on(((`c`.`id_cliente` = `f`.`id_cliente`) and (`e`.`id_equipo` = (select `clientes`.`id_equipo` from `clientes` where (`clientes`.`id_cliente` = `c`.`id_cliente`)))))) join `suministros` `s` on((`e`.`id_equipo` = `s`.`id_equipo`))) join `proveedores` `p` on((`s`.`id_proveedor` = `p`.`id_proveedor`))) where (`s`.`fecha_de_suministro` = (select `s2`.`fecha_de_suministro` from `suministros` `s2` where (`s2`.`id_equipo` = `e`.`id_equipo`) order by abs(timestampdiff(DAY,`s2`.`fecha_de_suministro`,`f`.`fecha`)) limit 1)) order by `c`.`id_cliente`,`e`.`id_equipo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_admin_operaciones_respuesta`
--

/*!50001 DROP VIEW IF EXISTS `view_admin_operaciones_respuesta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_admin_operaciones_respuesta` AS select `o`.`tipo_operacion` AS `tipo_operacion`,`o`.`fecha_operaciones` AS `fecha_operaciones`,concat(`e`.`nombre`,' ',`e`.`apellido`) AS `Empleado`,`o`.`respuesta` AS `respuesta` from ((`operaciones` `o` join `asignaciones` `a` on((`o`.`id_operacion` = `a`.`id_operacion`))) join `empleados` `e` on((`a`.`id_empleado` = `e`.`id_empleado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_bajas_clientes`
--

/*!50001 DROP VIEW IF EXISTS `view_bajas_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_bajas_clientes` AS select `c`.`id_cliente` AS `id_cliente`,`c`.`razon_social` AS `Nombre Cliente`,`o`.`id_operacion` AS `id_operacion`,`o`.`tipo_operacion` AS `Descripcion Operacion`,`o`.`fecha_operaciones` AS `Fecha Operacion` from (`clientes` `c` join `operaciones` `o` on((`c`.`id_cliente` = `o`.`id_cliente`))) where (`o`.`tipo_operacion` like '%Baja%') order by `c`.`id_cliente`,`o`.`fecha_operaciones` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_gerencia_ganancia_equipos`
--

/*!50001 DROP VIEW IF EXISTS `view_gerencia_ganancia_equipos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_gerencia_ganancia_equipos` AS select `v`.`id_cliente` AS `id_cliente`,sum((`v`.`precio_equipo` - `v`.`costo_equipo`)) AS `Ganancia Equipos`,`c`.`razon_social` AS `razon_social` from (`ventas` `v` join `clientes` `c` on((`v`.`id_cliente` = `c`.`id_cliente`))) group by `v`.`id_cliente`,`c`.`razon_social` order by sum((`v`.`precio_equipo` - `v`.`costo_equipo`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_reclamos_respuesta`
--

/*!50001 DROP VIEW IF EXISTS `view_reclamos_respuesta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_reclamos_respuesta` AS select `o`.`id_operacion` AS `id_operacion`,`o`.`descripcion` AS `Descripción Reclamo`,`o`.`respuesta` AS `Respuesta`,`o`.`fecha_operaciones` AS `Fecha`,`c`.`id_cliente` AS `id_cliente`,`c`.`razon_social` AS `Nombre Cliente` from (`operaciones` `o` join `clientes` `c` on((`o`.`id_cliente` = `c`.`id_cliente`))) where (`o`.`tipo_operacion` = 'Reclamo') order by `o`.`fecha_operaciones` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-24 23:23:20
