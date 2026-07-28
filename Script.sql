CREATE DATABASE  IF NOT EXISTS `fitcimm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fitcimm`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: fitcimm
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `ingreso`
--

DROP TABLE IF EXISTS `ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingreso` (
  `id_ingreso` int NOT NULL AUTO_INCREMENT,
  `id_socio` int NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `hora_ingreso` time NOT NULL,
  PRIMARY KEY (`id_ingreso`),
  UNIQUE KEY `uk_socio_fecha_ingreso` (`id_socio`,`fecha_ingreso`),
  CONSTRAINT `fk_ingreso_socio` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso`
--

LOCK TABLES `ingreso` WRITE;
/*!40000 ALTER TABLE `ingreso` DISABLE KEYS */;
INSERT INTO `ingreso` VALUES (1,1,'2026-07-20','08:30:00'),(2,2,'2026-07-20','09:15:00'),(3,3,'2026-07-21','07:45:00'),(4,4,'2026-07-21','09:10:00'),(5,5,'2026-07-22','10:30:00'),(6,6,'2026-07-22','06:50:00'),(7,7,'2026-07-23','08:05:00'),(8,8,'2026-07-23','17:30:00'),(9,9,'2026-07-24','18:10:00'),(10,10,'2026-07-24','07:20:00'),(11,1,'2026-07-25','10:02:00'),(12,2,'2026-07-26','10:03:00'),(13,3,'2026-07-27','10:23:00');
/*!40000 ALTER TABLE `ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membresia`
--

DROP TABLE IF EXISTS `membresia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membresia` (
  `id_membresia` int NOT NULL AUTO_INCREMENT,
  `id_socio` int NOT NULL,
  `id_plan` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `valor_pagado` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_membresia`),
  KEY `fk_membresia_socio` (`id_socio`),
  KEY `fk_membresia_plan` (`id_plan`),
  CONSTRAINT `fk_membresia_plan` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`),
  CONSTRAINT `fk_membresia_socio` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membresia`
--

LOCK TABLES `membresia` WRITE;
/*!40000 ALTER TABLE `membresia` DISABLE KEYS */;
INSERT INTO `membresia` VALUES (1,1,5,'2026-07-01','2026-07-31',75000.00),(2,2,7,'2026-07-01','2026-09-29',195000.00),(3,3,5,'2026-07-10','2026-08-09',75000.00),(4,4,7,'2026-04-01','2026-07-29',195000.00),(5,5,5,'2026-06-01','2026-07-23',75000.00),(6,6,8,'2026-07-05','2026-12-31',360000.00),(7,7,9,'2026-01-15','2027-01-14',680000.00),(8,8,5,'2026-07-20','2026-08-18',75000.00),(9,9,7,'2026-05-10','2026-08-08',195000.00),(10,10,8,'2026-06-15','2026-12-12',360000.00);
/*!40000 ALTER TABLE `membresia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `id_plan` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `duracion_dias` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,'Diario',1,8000.00,1),(2,'Fin de Semana',2,15000.00,1),(3,'Semanal',7,30000.00,1),(4,'Quincenal',15,50000.00,1),(5,'Mensual',30,75000.00,1),(6,'Bimestral',60,140000.00,1),(7,'Trimestral',90,195000.00,1),(8,'Semestral',180,360000.00,1),(9,'Anual',365,680000.00,1),(10,'Vitalicio',3650,2500000.00,1);
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socio` (
  `id_socio` int NOT NULL AUTO_INCREMENT,
  `documento` varchar(20) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_socio`),
  UNIQUE KEY `documento` (`documento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
INSERT INTO `socio` VALUES (1,'1098765432','Carlos','Pérez','3101234567','carlos@mail.com','2000-05-15',1),(2,'1012345678','Ana','Gómez','3209876543','ana@mail.com','1998-10-20',1),(3,'1034567890','Luis','Martínez','3114567890','luis@mail.com','1999-03-12',1),(4,'1045678901','María','Rodríguez','3125678901','maria@mail.com','2001-08-25',0),(5,'1056789012','Jorge','Ramírez','3136789012','jorge@mail.com','1997-11-18',1),(6,'1067890123','Sofía','Hernández','3147890123','sofia@mail.com','2002-01-30',1),(7,'1078901234','Andrés','Castro','3158901234','andres@mail.com','1996-06-14',1),(8,'1089012345','Valentina','Torres','3169012345','valentina@mail.com','2000-09-05',1),(9,'1090123456','Mateo','Rojas','3170123456','mateo@mail.com','1995-12-22',0),(10,'1001234567','Camila','Vargas','3181234567','camila@mail.com','2003-04-17',1);
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-28 13:51:24
