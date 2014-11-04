-- MySQL dump 10.13  Distrib 5.6.19, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: golivecentral
-- ------------------------------------------------------
-- Server version	5.6.19-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbDatabase`
--

DROP TABLE IF EXISTS `tbDatabase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbDatabase` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Database` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbDatabase`
--

LOCK TABLES `tbDatabase` WRITE;
/*!40000 ALTER TABLE `tbDatabase` DISABLE KEYS */;
INSERT INTO `tbDatabase` VALUES (0000000001,'goliveacao','2014-10-20 00:00:00','2014-10-20 00:00:00'),(0000000002,'golivetradicao','2014-10-20 00:00:00','2014-10-20 00:00:00'),(0000000003,'golivetest','2014-11-03 00:00:00','2014-11-03 00:00:00');
/*!40000 ALTER TABLE `tbDatabase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbDatabaseAddress`
--

DROP TABLE IF EXISTS `tbDatabaseAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbDatabaseAddress` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `IpAddressBloc1` int(3) unsigned NOT NULL,
  `IpAddressBloc2` int(3) unsigned NOT NULL,
  `IpAddressBloc3` int(3) unsigned NOT NULL,
  `IpAddressBloc4` int(3) unsigned NOT NULL,
  `Port` int(5) unsigned NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbDatabaseAddress`
--

LOCK TABLES `tbDatabaseAddress` WRITE;
/*!40000 ALTER TABLE `tbDatabaseAddress` DISABLE KEYS */;
INSERT INTO `tbDatabaseAddress` VALUES (0000000001,127,0,0,1,3306,'2014-10-20 00:00:00','2014-10-20 00:00:00');
/*!40000 ALTER TABLE `tbDatabaseAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbDatabaseUser`
--

DROP TABLE IF EXISTS `tbDatabaseUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbDatabaseUser` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Login` varchar(120) NOT NULL,
  `Password` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbDatabaseUser`
--

LOCK TABLES `tbDatabaseUser` WRITE;
/*!40000 ALTER TABLE `tbDatabaseUser` DISABLE KEYS */;
INSERT INTO `tbDatabaseUser` VALUES (0000000001,'goliveacao','goliveacao','2014-10-20 00:00:00','2014-10-20 00:00:00'),(0000000002,'golivetradicao','golivetradicao','2014-10-20 00:00:00','2014-10-20 00:00:00'),(0000000003,'golivetest','golivetest','2014-11-03 00:00:00','2014-11-03 00:00:00');
/*!40000 ALTER TABLE `tbDatabaseUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbEmpresa`
--

DROP TABLE IF EXISTS `tbEmpresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbEmpresa` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Cnpj` bigint(14) unsigned zerofill NOT NULL,
  `NomeFantasia` varchar(120) NOT NULL,
  `RazaoSocial` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbEmpresa`
--

LOCK TABLES `tbEmpresa` WRITE;
/*!40000 ALTER TABLE `tbEmpresa` DISABLE KEYS */;
INSERT INTO `tbEmpresa` VALUES (0000000001,11111111111111,'Ação Persianas e Distribuidora LTDA','razaoSocialAcao','2014-10-20 00:00:00','2014-10-20 00:00:00'),(0000000002,11111111111111,'Tradição Importadora e Distribuidora Ltda','razaoSocialTradicao','2014-10-20 00:00:00','2014-10-20 00:00:00'),(0000000003,11111111111111,'test','test','2014-11-03 00:00:00','2014-11-03 00:00:00');
/*!40000 ALTER TABLE `tbEmpresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbUsuario`
--

DROP TABLE IF EXISTS `tbUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbUsuario` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Login` varchar(120) NOT NULL,
  `Password` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbUsuario`
--

LOCK TABLES `tbUsuario` WRITE;
/*!40000 ALTER TABLE `tbUsuario` DISABLE KEYS */;
INSERT INTO `tbUsuario` VALUES (0000000001,'maruen','123','2014-10-20 00:00:00','2014-10-20 00:00:00'),(0000000002,'guilherme','123','2014-10-20 00:00:00','2014-10-20 00:00:00'),(0000000003,'test','test','2014-11-03 00:00:00','2014-11-03 00:00:00'),(0000000004,'cadastro@tradicao.com.br','tradicao','2014-11-04 00:00:00','2014-11-04 00:00:00'),(0000000005,'roberto.tradicao@gmail.com','tradicao1234','2014-11-04 00:00:00','2014-11-04 00:00:00');
/*!40000 ALTER TABLE `tbUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbUsuario_Dependencies`
--

DROP TABLE IF EXISTS `tbUsuario_Dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbUsuario_Dependencies` (
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbEmpresa_Id` int(10) unsigned zerofill NOT NULL,
  `tbDatabase_Id` int(10) unsigned zerofill NOT NULL,
  `tbDatabaseUser_Id` int(10) unsigned zerofill NOT NULL,
  `tbDatabaseAddress_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbUsuario_Id`,`tbEmpresa_Id`,`tbDatabase_Id`,`tbDatabaseUser_Id`,`tbDatabaseAddress_Id`),
  KEY `FK_tbEmpresa_idx` (`tbEmpresa_Id`),
  KEY `FK_tbDatabase_idx` (`tbDatabase_Id`),
  KEY `FK_tbDatabaseUser_idx` (`tbDatabaseUser_Id`),
  KEY `FK_tbDatabaseAddress_idx` (`tbDatabaseAddress_Id`),
  CONSTRAINT `FK_tbDatabase` FOREIGN KEY (`tbDatabase_Id`) REFERENCES `tbDatabase` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDatabaseAddress` FOREIGN KEY (`tbDatabaseAddress_Id`) REFERENCES `tbDatabaseAddress` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDatabaseUser` FOREIGN KEY (`tbDatabaseUser_Id`) REFERENCES `tbDatabaseUser` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEmpresa` FOREIGN KEY (`tbEmpresa_Id`) REFERENCES `tbEmpresa` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbUsuario_Dependencies`
--

LOCK TABLES `tbUsuario_Dependencies` WRITE;
/*!40000 ALTER TABLE `tbUsuario_Dependencies` DISABLE KEYS */;
INSERT INTO `tbUsuario_Dependencies` VALUES (0000000001,0000000001,0000000001,0000000001,0000000001),(0000000002,0000000001,0000000001,0000000001,0000000001),(0000000001,0000000002,0000000002,0000000002,0000000001),(0000000002,0000000002,0000000002,0000000002,0000000001),(0000000004,0000000002,0000000002,0000000002,0000000001),(0000000005,0000000002,0000000002,0000000002,0000000001),(0000000003,0000000003,0000000001,0000000003,0000000001);
/*!40000 ALTER TABLE `tbUsuario_Dependencies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-04 16:57:19
