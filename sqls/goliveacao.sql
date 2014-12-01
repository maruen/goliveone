-- MySQL dump 10.13  Distrib 5.6.20, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: goliveacao
-- ------------------------------------------------------
-- Server version	5.6.20-1+deb.sury.org~precise+1

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
-- Table structure for table `tbAuditoria`
--

DROP TABLE IF EXISTS `tbAuditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `LabelPropertyFormulario` varchar(120) NOT NULL,
  `AcaoUsuario` varchar(2500) NOT NULL,
  `Observacao` varchar(2500) DEFAULT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria`
--

LOCK TABLES `tbAuditoria` WRITE;
/*!40000 ALTER TABLE `tbAuditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoriaItem`
--

DROP TABLE IF EXISTS `tbAuditoriaItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoriaItem` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `LabelPropertyCampo` varchar(2500) NOT NULL,
  `InformacaoAnterior` varchar(2500) NOT NULL,
  `InformacaoAtual` varchar(2500) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoriaItem`
--

LOCK TABLES `tbAuditoriaItem` WRITE;
/*!40000 ALTER TABLE `tbAuditoriaItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoriaItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoriaItem_tbAuditoria`
--

DROP TABLE IF EXISTS `tbAuditoriaItem_tbAuditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoriaItem_tbAuditoria` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbUsuario0003` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0038` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0001` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0003` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoriaItem_tbAuditoria`
--

LOCK TABLES `tbAuditoriaItem_tbAuditoria` WRITE;
/*!40000 ALTER TABLE `tbAuditoriaItem_tbAuditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoriaItem_tbAuditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbCategoriaNaturezaJuridica`
--

DROP TABLE IF EXISTS `tbAuditoria_tbCategoriaNaturezaJuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbCategoriaNaturezaJuridica` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbCategoriaNaturezaJuridica_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbCategoriaNaturezaJuridica_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbCategoriaNaturezaJuridica0001` (`tbCategoriaNaturezaJuridica_Id`),
  KEY `FK_tbUsuario0014` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0006` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0037` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCategoriaNaturezaJuridica0001` FOREIGN KEY (`tbCategoriaNaturezaJuridica_Id`) REFERENCES `tbCategoriaNaturezaJuridica` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0014` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbCategoriaNaturezaJuridica`
--

LOCK TABLES `tbAuditoria_tbCategoriaNaturezaJuridica` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbCategoriaNaturezaJuridica` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbCategoriaNaturezaJuridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbCnaeClasse`
--

DROP TABLE IF EXISTS `tbAuditoria_tbCnaeClasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbCnaeClasse` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeClasse_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbCnaeClasse_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbCnaeClasse0002` (`tbCnaeClasse_Id`),
  KEY `FK_tbUsuario0020` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0030` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0016` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeClasse0002` FOREIGN KEY (`tbCnaeClasse_Id`) REFERENCES `tbCnaeClasse` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0020` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbCnaeClasse`
--

LOCK TABLES `tbAuditoria_tbCnaeClasse` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbCnaeClasse` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbCnaeClasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbCnaeDivisao`
--

DROP TABLE IF EXISTS `tbAuditoria_tbCnaeDivisao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbCnaeDivisao` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeDivisao_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbCnaeDivisao_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbCnaeDivisao0002` (`tbCnaeDivisao_Id`),
  KEY `FK_tbUsuario0018` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria00028` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0014` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeDivisao0002` FOREIGN KEY (`tbCnaeDivisao_Id`) REFERENCES `tbCnaeDivisao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0018` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbCnaeDivisao`
--

LOCK TABLES `tbAuditoria_tbCnaeDivisao` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbCnaeDivisao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbCnaeDivisao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbCnaeGrupo`
--

DROP TABLE IF EXISTS `tbAuditoria_tbCnaeGrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbCnaeGrupo` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeGrupo_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbCnaeGrupo_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbCnaeGrupo0003` (`tbCnaeGrupo_Id`),
  KEY `FK_tbUsuario0019` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0029` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0015` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeGrupo0003` FOREIGN KEY (`tbCnaeGrupo_Id`) REFERENCES `tbCnaeGrupo` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0019` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbCnaeGrupo`
--

LOCK TABLES `tbAuditoria_tbCnaeGrupo` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbCnaeGrupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbCnaeGrupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbCnaeImpeditivoSimplesNacional`
--

DROP TABLE IF EXISTS `tbAuditoria_tbCnaeImpeditivoSimplesNacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbCnaeImpeditivoSimplesNacional` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeImpeditivoSimplesNacional_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbCnaeImpeditivoSimplesNacional_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbCnaeImpeditivoSimplesNacional0002` (`tbCnaeImpeditivoSimplesNacional_Id`),
  KEY `FK_tbUsuario0022` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0032` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0018` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeImpeditivoSimplesNacional0002` FOREIGN KEY (`tbCnaeImpeditivoSimplesNacional_Id`) REFERENCES `tbCnaeImpeditivoSimplesNacional` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0022` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbCnaeImpeditivoSimplesNacional`
--

LOCK TABLES `tbAuditoria_tbCnaeImpeditivoSimplesNacional` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbCnaeImpeditivoSimplesNacional` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbCnaeImpeditivoSimplesNacional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbCnaeSecao`
--

DROP TABLE IF EXISTS `tbAuditoria_tbCnaeSecao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbCnaeSecao` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeSecao_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbCnaeSecao_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbCnaeSecao0001` (`tbCnaeSecao_Id`),
  KEY `FK_tbUsuario0017` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0027` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0013` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0001` FOREIGN KEY (`tbCnaeSecao_Id`) REFERENCES `tbCnaeSecao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0017` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbCnaeSecao`
--

LOCK TABLES `tbAuditoria_tbCnaeSecao` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbCnaeSecao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbCnaeSecao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbCnaeSubClasse`
--

DROP TABLE IF EXISTS `tbAuditoria_tbCnaeSubClasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbCnaeSubClasse` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeSubClasse_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbCnaeSubClasse_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbCnaeSubClasse0002` (`tbCnaeSubClasse_Id`),
  KEY `FK_tbUsuario0021` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0031` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0017` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSubClasse0002` FOREIGN KEY (`tbCnaeSubClasse_Id`) REFERENCES `tbCnaeSubClasse` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0021` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbCnaeSubClasse`
--

LOCK TABLES `tbAuditoria_tbCnaeSubClasse` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbCnaeSubClasse` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbCnaeSubClasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbCodigoInternet`
--

DROP TABLE IF EXISTS `tbAuditoria_tbCodigoInternet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbCodigoInternet` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbCodigoInternet_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbCodigoInternet_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbCodigoInternet0001` (`tbCodigoInternet_Id`),
  KEY `FK_tbUsuario0004` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0033` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0003` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoInternet0001` FOREIGN KEY (`tbCodigoInternet_Id`) REFERENCES `tbCodigoInternet` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0004` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbCodigoInternet`
--

LOCK TABLES `tbAuditoria_tbCodigoInternet` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbCodigoInternet` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbCodigoInternet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbCodigoPaisesBacen`
--

DROP TABLE IF EXISTS `tbAuditoria_tbCodigoPaisesBacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbCodigoPaisesBacen` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbCodigoPaisesBacen_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbCodigoPaisesBacen_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbUsuario0044` (`tbUsuario_Id`),
  KEY `FK_tbCodigoPaisesBacen0001` (`tbCodigoPaisesBacen_Id`),
  CONSTRAINT `FK_tbAuditoria0040` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0040` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoPaisesBacen0001` FOREIGN KEY (`tbCodigoPaisesBacen_Id`) REFERENCES `tbCodigoPaisesBacen` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0044` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbCodigoPaisesBacen`
--

LOCK TABLES `tbAuditoria_tbCodigoPaisesBacen` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbCodigoPaisesBacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbCodigoPaisesBacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbCodigoPaisesFips`
--

DROP TABLE IF EXISTS `tbAuditoria_tbCodigoPaisesFips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbCodigoPaisesFips` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbCodigoPaisesFips_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbCodigoPaisesFips_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbCodigoPaisesFips0001` (`tbCodigoPaisesFips_Id`),
  KEY `FK_tbUsuario0007` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0036` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0006` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoPaisesFips0001` FOREIGN KEY (`tbCodigoPaisesFips_Id`) REFERENCES `tbCodigoPaisesFips` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0007` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbCodigoPaisesFips`
--

LOCK TABLES `tbAuditoria_tbCodigoPaisesFips` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbCodigoPaisesFips` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbCodigoPaisesFips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3`
--

DROP TABLE IF EXISTS `tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbCodigoPaisesIso3161_1_Alfa_3_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbCodigoPaisesIso3161_1_Alfa_3_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbCodigoPaisesIso3161_1_Alfa_3_0001` (`tbCodigoPaisesIso3161_1_Alfa_3_Id`),
  KEY `FK_tbUsuario0008` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0037` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0007` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoPaisesIso3161_1_Alfa_3_0001` FOREIGN KEY (`tbCodigoPaisesIso3161_1_Alfa_3_Id`) REFERENCES `tbCodigoPaisesIso3161_1_Alfa_3` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0008` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3`
--

LOCK TABLES `tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbCodigoTelefonicoMunicipios`
--

DROP TABLE IF EXISTS `tbAuditoria_tbCodigoTelefonicoMunicipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbCodigoTelefonicoMunicipios` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbCodigoTelefonicoMunicipios_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbCodigoTelefonicoMunicipios_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbUsuario0046` (`tbUsuario_Id`),
  KEY `FK_tbCodigoTelefonicoMunicipios0002` (`tbCodigoTelefonicoMunicipios_Id`),
  CONSTRAINT `FK_tbAuditoria0042` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0042` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoTelefonicoMunicipios0002` FOREIGN KEY (`tbCodigoTelefonicoMunicipios_Id`) REFERENCES `tbCodigoTelefonicoMunicipios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0046` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbCodigoTelefonicoMunicipios`
--

LOCK TABLES `tbAuditoria_tbCodigoTelefonicoMunicipios` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbCodigoTelefonicoMunicipios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbCodigoTelefonicoMunicipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbCodigoTelefonicoPaises`
--

DROP TABLE IF EXISTS `tbAuditoria_tbCodigoTelefonicoPaises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbCodigoTelefonicoPaises` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbCodigoTelefonicoPaises_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbCodigoTelefonicoPaises_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbUsuario0045` (`tbUsuario_Id`),
  KEY `FK_tbCodigoTelefonicoPaises0001` (`tbCodigoTelefonicoPaises_Id`),
  CONSTRAINT `FK_tbAuditoria0041` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0041` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoTelefonicoPaises0001` FOREIGN KEY (`tbCodigoTelefonicoPaises_Id`) REFERENCES `tbCodigoTelefonicoPaises` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0045` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbCodigoTelefonicoPaises`
--

LOCK TABLES `tbAuditoria_tbCodigoTelefonicoPaises` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbCodigoTelefonicoPaises` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbCodigoTelefonicoPaises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbColecoesProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbColecoesProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbColecoesProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbColecoesProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbColecoesProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbColecoesProduto0008` (`tbColecoesProduto_Id`),
  KEY `FK_tbUsuario0030` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0016` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0026` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0008` FOREIGN KEY (`tbColecoesProduto_Id`) REFERENCES `tbColecoesProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0030` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbColecoesProduto`
--

LOCK TABLES `tbAuditoria_tbColecoesProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbColecoesProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbColecoesProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbCorProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbCorProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbCorProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbCorProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbCorProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbCorProduto0008` (`tbCorProduto_Id`),
  KEY `FK_tbUsuario0031` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0017` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0027` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCorProduto0008` FOREIGN KEY (`tbCorProduto_Id`) REFERENCES `tbCorProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0031` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbCorProduto`
--

LOCK TABLES `tbAuditoria_tbCorProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbCorProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbCorProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbDepartamentoProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbDepartamentoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbDepartamentoProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbDepartamentoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbDepartamentoProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbDepartamentoProduto0008` (`tbDepartamentoProduto_Id`),
  KEY `FK_tbUsuario0025` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0011` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0021` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0008` FOREIGN KEY (`tbDepartamentoProduto_Id`) REFERENCES `tbDepartamentoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0025` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbDepartamentoProduto`
--

LOCK TABLES `tbAuditoria_tbDepartamentoProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbDepartamentoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbDepartamentoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbEstado`
--

DROP TABLE IF EXISTS `tbAuditoria_tbEstado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbEstado` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbEstado_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbEstado_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbUsuario0048` (`tbUsuario_Id`),
  KEY `FK_tbEstado0001` (`tbEstado_Id`),
  CONSTRAINT `FK_tbAuditoria0044` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0044` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEstado0001` FOREIGN KEY (`tbEstado_Id`) REFERENCES `tbEstado` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0048` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbEstado`
--

LOCK TABLES `tbAuditoria_tbEstado` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbEstado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbEstado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbFinalidadeCodigoBarrasProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbFinalidadeCodigoBarrasProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbFinalidadeCodigoBarrasProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadeCodigoBarrasProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbFinalidadeCodigoBarrasProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbFinalidadeCodigoBarrasProduto0003` (`tbFinalidadeCodigoBarrasProduto_Id`),
  KEY `FK_tbUsuario0034` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0020` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0030` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCodigoBarrasProduto0003` FOREIGN KEY (`tbFinalidadeCodigoBarrasProduto_Id`) REFERENCES `tbFinalidadeCodigoBarrasProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0034` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbFinalidadeCodigoBarrasProduto`
--

LOCK TABLES `tbAuditoria_tbFinalidadeCodigoBarrasProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadeCodigoBarrasProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadeCodigoBarrasProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbFinalidadeCodigoProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbFinalidadeCodigoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbFinalidadeCodigoProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadeCodigoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbFinalidadeCodigoProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbFinalidadeCodigoProduto0002` (`tbFinalidadeCodigoProduto_Id`),
  KEY `FK_tbUsuario0032` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0018` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0028` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCodigoProduto0002` FOREIGN KEY (`tbFinalidadeCodigoProduto_Id`) REFERENCES `tbFinalidadeCodigoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0032` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbFinalidadeCodigoProduto`
--

LOCK TABLES `tbAuditoria_tbFinalidadeCodigoProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadeCodigoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadeCodigoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbFinalidadeColecaoProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbFinalidadeColecaoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbFinalidadeColecaoProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadeColecaoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbFinalidadeColecaoProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbFinalidadeColecaoProduto0002` (`tbFinalidadeColecaoProduto_Id`),
  KEY `FK_tbUsuario0033` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0019` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0029` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeColecaoProduto0002` FOREIGN KEY (`tbFinalidadeColecaoProduto_Id`) REFERENCES `tbFinalidadeColecaoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0033` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbFinalidadeColecaoProduto`
--

LOCK TABLES `tbAuditoria_tbFinalidadeColecaoProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadeColecaoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadeColecaoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbFinalidadeCorProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbFinalidadeCorProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbFinalidadeCorProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadeCorProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbFinalidadeCorProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbFinalidadeCorProduto0002` (`tbFinalidadeCorProduto_Id`),
  KEY `FK_tbUsuario0035` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0021` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0031` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCorProduto0002` FOREIGN KEY (`tbFinalidadeCorProduto_Id`) REFERENCES `tbFinalidadeCorProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0035` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbFinalidadeCorProduto`
--

LOCK TABLES `tbAuditoria_tbFinalidadeCorProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadeCorProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadeCorProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbFinalidadeDescricaoProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbFinalidadeDescricaoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbFinalidadeDescricaoProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadeDescricaoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbFinalidadeDescricaoProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbFinalidadeDescricaoProduto0002` (`tbFinalidadeDescricaoProduto_Id`),
  KEY `FK_tbUsuario0036` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0022` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0032` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeDescricaoProduto0002` FOREIGN KEY (`tbFinalidadeDescricaoProduto_Id`) REFERENCES `tbFinalidadeDescricaoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0036` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbFinalidadeDescricaoProduto`
--

LOCK TABLES `tbAuditoria_tbFinalidadeDescricaoProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadeDescricaoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadeDescricaoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbFinalidadePadraoEspessuraProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbFinalidadePadraoEspessuraProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbFinalidadePadraoEspessuraProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadePadraoEspessuraProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbFinalidadePadraoEspessuraProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbFinalidadePadraoEspessuraProduto0003` (`tbFinalidadePadraoEspessuraProduto_Id`),
  KEY `FK_tbUsuario0037` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0023` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0033` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadePadraoEspessuraProduto0003` FOREIGN KEY (`tbFinalidadePadraoEspessuraProduto_Id`) REFERENCES `tbFinalidadePadraoEspessuraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0037` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbFinalidadePadraoEspessuraProduto`
--

LOCK TABLES `tbAuditoria_tbFinalidadePadraoEspessuraProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadePadraoEspessuraProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadePadraoEspessuraProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbFinalidadePadraoLarguraProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbFinalidadePadraoLarguraProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbFinalidadePadraoLarguraProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadePadraoLarguraProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbFinalidadePadraoLarguraProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbFinalidadePadraoLarguraProduto0003` (`tbFinalidadePadraoLarguraProduto_Id`),
  KEY `FK_tbUsuario0038` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0024` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0034` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadePadraoLarguraProduto0003` FOREIGN KEY (`tbFinalidadePadraoLarguraProduto_Id`) REFERENCES `tbFinalidadePadraoLarguraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0038` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbFinalidadePadraoLarguraProduto`
--

LOCK TABLES `tbAuditoria_tbFinalidadePadraoLarguraProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadePadraoLarguraProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadePadraoLarguraProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbFinalidadeTipoProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbFinalidadeTipoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbFinalidadeTipoProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadeTipoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbFinalidadeTipoProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbFinalidadeTipoProduto0002` (`tbFinalidadeTipoProduto_Id`),
  KEY `FK_tbUsuario0039` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0025` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0035` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeTipoProduto0002` FOREIGN KEY (`tbFinalidadeTipoProduto_Id`) REFERENCES `tbFinalidadeTipoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0039` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbFinalidadeTipoProduto`
--

LOCK TABLES `tbAuditoria_tbFinalidadeTipoProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadeTipoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadeTipoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbFinalidadeUnidadeProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbFinalidadeUnidadeProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbFinalidadeUnidadeProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadeUnidadeProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbFinalidadeUnidadeProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbFinalidadeUnidadeProduto0003` (`tbFinalidadeUnidadeProduto_Id`),
  KEY `FK_tbUsuario0040` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0026` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0036` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeUnidadeProduto0003` FOREIGN KEY (`tbFinalidadeUnidadeProduto_Id`) REFERENCES `tbFinalidadeUnidadeProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0040` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbFinalidadeUnidadeProduto`
--

LOCK TABLES `tbAuditoria_tbFinalidadeUnidadeProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadeUnidadeProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbFinalidadeUnidadeProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbGrupoProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbGrupoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbGrupoProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbGrupoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbGrupoProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbGrupoProduto0008` (`tbGrupoProduto_Id`),
  KEY `FK_tbUsuario0026` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0012` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0022` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0008` FOREIGN KEY (`tbGrupoProduto_Id`) REFERENCES `tbGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0026` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbGrupoProduto`
--

LOCK TABLES `tbAuditoria_tbGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbGrupoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbLinguas`
--

DROP TABLE IF EXISTS `tbAuditoria_tbLinguas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbLinguas` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbLinguas_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbLinguas_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbLinguas0001` (`tbLinguas_Id`),
  KEY `FK_tbUsuario0005` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0034` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0004` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbLinguas0001` FOREIGN KEY (`tbLinguas_Id`) REFERENCES `tbLinguas` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0005` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbLinguas`
--

LOCK TABLES `tbAuditoria_tbLinguas` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbLinguas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbLinguas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbMoeda`
--

DROP TABLE IF EXISTS `tbAuditoria_tbMoeda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbMoeda` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbMoeda_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbMoeda_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbMoeda0002` (`tbMoeda_Id`),
  KEY `FK_tbUsuario0006` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0035` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0005` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbMoeda0002` FOREIGN KEY (`tbMoeda_Id`) REFERENCES `tbMoeda` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0006` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbMoeda`
--

LOCK TABLES `tbAuditoria_tbMoeda` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbMoeda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbMoeda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbMunicipio`
--

DROP TABLE IF EXISTS `tbAuditoria_tbMunicipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbMunicipio` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbMunicipio_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbMunicipio_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbUsuario0049` (`tbUsuario_Id`),
  KEY `FK_FK_tbMunicipio0001` (`tbMunicipio_Id`),
  CONSTRAINT `FK_FK_tbMunicipio0001` FOREIGN KEY (`tbMunicipio_Id`) REFERENCES `tbMunicipio` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoria0045` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0045` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0049` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbMunicipio`
--

LOCK TABLES `tbAuditoria_tbMunicipio` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbMunicipio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbMunicipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbNaturezaJuridica`
--

DROP TABLE IF EXISTS `tbAuditoria_tbNaturezaJuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbNaturezaJuridica` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbNaturezaJuridica_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbNaturezaJuridica_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbNaturezaJuridica0001` (`tbNaturezaJuridica_Id`),
  KEY `FK_tbUsuario0015` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0007` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0038` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbNaturezaJuridica0001` FOREIGN KEY (`tbNaturezaJuridica_Id`) REFERENCES `tbNaturezaJuridica` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0015` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbNaturezaJuridica`
--

LOCK TABLES `tbAuditoria_tbNaturezaJuridica` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbNaturezaJuridica` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbNaturezaJuridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbPadroesEspessuraProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbPadroesEspessuraProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbPadroesEspessuraProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbPadroesEspessuraProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbPadroesEspessuraProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbPadroesEspessuraProduto0007` (`tbPadroesEspessuraProduto_Id`),
  KEY `FK_tbUsuario0028` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0014` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0024` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesEspessuraProduto0007` FOREIGN KEY (`tbPadroesEspessuraProduto_Id`) REFERENCES `tbPadroesEspessuraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0028` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbPadroesEspessuraProduto`
--

LOCK TABLES `tbAuditoria_tbPadroesEspessuraProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbPadroesEspessuraProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbPadroesEspessuraProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbPadroesLarguraProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbPadroesLarguraProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbPadroesLarguraProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbPadroesLarguraProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbPadroesLarguraProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbPadroesLarguraProduto0007` (`tbPadroesLarguraProduto_Id`),
  KEY `FK_tbUsuario0029` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0015` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0025` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesLarguraProduto0007` FOREIGN KEY (`tbPadroesLarguraProduto_Id`) REFERENCES `tbPadroesLarguraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0029` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbPadroesLarguraProduto`
--

LOCK TABLES `tbAuditoria_tbPadroesLarguraProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbPadroesLarguraProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbPadroesLarguraProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbPais`
--

DROP TABLE IF EXISTS `tbAuditoria_tbPais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbPais` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbPais_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbPais_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbUsuario0051` (`tbUsuario_Id`),
  KEY `FK_tbPais0001` (`tbPais_Id`),
  CONSTRAINT `FK_tbAuditoria0047` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0047` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPais0001` FOREIGN KEY (`tbPais_Id`) REFERENCES `tbPais` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0051` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbPais`
--

LOCK TABLES `tbAuditoria_tbPais` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbPais` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbPais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbProduto0015` (`tbProduto_Id`),
  KEY `FK_tbUsuario0009` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0001` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0008` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto0015` FOREIGN KEY (`tbProduto_Id`) REFERENCES `tbProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0009` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbProduto`
--

LOCK TABLES `tbAuditoria_tbProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbProdutoCodigo`
--

DROP TABLE IF EXISTS `tbAuditoria_tbProdutoCodigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbProdutoCodigo` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbProdutoCodigo_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbProdutoCodigo_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbProdutoCodigo0002` (`tbProdutoCodigo_Id`),
  KEY `FK_tbUsuario0010` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0002` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0009` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigo0002` FOREIGN KEY (`tbProdutoCodigo_Id`) REFERENCES `tbProdutoCodigo` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0010` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbProdutoCodigo`
--

LOCK TABLES `tbAuditoria_tbProdutoCodigo` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbProdutoCodigo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbProdutoCodigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbProdutoCodigoBarras`
--

DROP TABLE IF EXISTS `tbAuditoria_tbProdutoCodigoBarras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbProdutoCodigoBarras` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbProdutoCodigoBarras_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbProdutoCodigoBarras_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbProdutoCodigoBarras0003` (`tbProdutoCodigoBarras_Id`),
  KEY `FK_tbUsuario0013` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0005` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0012` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigoBarras0003` FOREIGN KEY (`tbProdutoCodigoBarras_Id`) REFERENCES `tbProdutoCodigoBarras` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0013` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbProdutoCodigoBarras`
--

LOCK TABLES `tbAuditoria_tbProdutoCodigoBarras` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbProdutoCodigoBarras` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbProdutoCodigoBarras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbProdutoDescricao`
--

DROP TABLE IF EXISTS `tbAuditoria_tbProdutoDescricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbProdutoDescricao` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbProdutoDescricao_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbProdutoDescricao_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbProdutoDescricao0002` (`tbProdutoDescricao_Id`),
  KEY `FK_tbUsuario0011` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0003` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0010` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoDescricao0002` FOREIGN KEY (`tbProdutoDescricao_Id`) REFERENCES `tbProdutoDescricao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0011` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbProdutoDescricao`
--

LOCK TABLES `tbAuditoria_tbProdutoDescricao` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbProdutoDescricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbProdutoDescricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbProdutoUnidade`
--

DROP TABLE IF EXISTS `tbAuditoria_tbProdutoUnidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbProdutoUnidade` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbProdutoUnidade_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbProdutoUnidade_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbProdutoUnidade0002` (`tbProdutoUnidade_Id`),
  KEY `FK_tbUsuario0012` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0004` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0011` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoUnidade0002` FOREIGN KEY (`tbProdutoUnidade_Id`) REFERENCES `tbProdutoUnidade` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0012` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbProdutoUnidade`
--

LOCK TABLES `tbAuditoria_tbProdutoUnidade` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbProdutoUnidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbProdutoUnidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbRegiao`
--

DROP TABLE IF EXISTS `tbAuditoria_tbRegiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbRegiao` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbRegiao_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbRegiao_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbUsuario0047` (`tbUsuario_Id`),
  KEY `FK_tbRegiao0001` (`tbRegiao_Id`),
  CONSTRAINT `FK_tbAuditoria0043` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0043` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0001` FOREIGN KEY (`tbRegiao_Id`) REFERENCES `tbRegiao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0047` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbRegiao`
--

LOCK TABLES `tbAuditoria_tbRegiao` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbRegiao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbRegiao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbRegimeApuracao`
--

DROP TABLE IF EXISTS `tbAuditoria_tbRegimeApuracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbRegimeApuracao` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbRegimeApuracao_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbRegimeApuracao_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbRegimeApuracao0001` (`tbRegimeApuracao_Id`),
  KEY `FK_tbUsuario0016` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0008` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0039` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegimeApuracao0001` FOREIGN KEY (`tbRegimeApuracao_Id`) REFERENCES `tbRegimeApuracao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0016` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbRegimeApuracao`
--

LOCK TABLES `tbAuditoria_tbRegimeApuracao` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbRegimeApuracao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbRegimeApuracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbSubGrupoProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbSubGrupoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbSubGrupoProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbSubGrupoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbSubGrupoProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbSubGrupoProduto0009` (`tbSubGrupoProduto_Id`),
  KEY `FK_tbUsuario0027` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0013` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0023` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0009` FOREIGN KEY (`tbSubGrupoProduto_Id`) REFERENCES `tbSubGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0027` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbSubGrupoProduto`
--

LOCK TABLES `tbAuditoria_tbSubGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbSubGrupoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbSubGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbTipoLogradouro`
--

DROP TABLE IF EXISTS `tbAuditoria_tbTipoLogradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbTipoLogradouro` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbTipoLogradouro_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbTipoLogradouro_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbUsuario0050` (`tbUsuario_Id`),
  KEY `FK_tbTipoLogradouro0001` (`tbTipoLogradouro_Id`),
  CONSTRAINT `FK_tbAuditoria0046` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0046` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbTipoLogradouro0001` FOREIGN KEY (`tbTipoLogradouro_Id`) REFERENCES `tbTipoLogradouro` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0050` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbTipoLogradouro`
--

LOCK TABLES `tbAuditoria_tbTipoLogradouro` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbTipoLogradouro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbTipoLogradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbTipoProduto`
--

DROP TABLE IF EXISTS `tbAuditoria_tbTipoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbTipoProduto` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbTipoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbTipoProduto_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbTipoProduto0002` (`tbTipoProduto_Id`),
  KEY `FK_tbUsuario0024` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0010` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0020` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbTipoProduto0002` FOREIGN KEY (`tbTipoProduto_Id`) REFERENCES `tbTipoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0024` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbTipoProduto`
--

LOCK TABLES `tbAuditoria_tbTipoProduto` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbTipoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbTipoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbUnidade`
--

DROP TABLE IF EXISTS `tbAuditoria_tbUnidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbUnidade` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbUnidade_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`,`tbUnidade_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbUnidade0006` (`tbUnidade_Id`),
  KEY `FK_tbUsuario0023` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0009` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0019` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0006` FOREIGN KEY (`tbUnidade_Id`) REFERENCES `tbUnidade` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0023` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbUnidade`
--

LOCK TABLES `tbAuditoria_tbUnidade` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbUnidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbUnidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbAuditoria_tbUsuario`
--

DROP TABLE IF EXISTS `tbAuditoria_tbUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbAuditoria_tbUsuario` (
  `tbAuditoria_Id` int(10) unsigned zerofill NOT NULL,
  `tbAuditoriaItem_Id` int(10) unsigned zerofill NOT NULL,
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`,`tbAuditoriaItem_Id`,`tbUsuario_Id`),
  UNIQUE KEY `tbAuditoriaItem_Id_UNIQUE` (`tbAuditoriaItem_Id`),
  KEY `FK_tbUsuario0002` (`tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0039` FOREIGN KEY (`tbAuditoria_Id`) REFERENCES `tbAuditoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0002` FOREIGN KEY (`tbAuditoriaItem_Id`) REFERENCES `tbAuditoriaItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0001` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0002` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria_tbUsuario`
--

LOCK TABLES `tbAuditoria_tbUsuario` WRITE;
/*!40000 ALTER TABLE `tbAuditoria_tbUsuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbAuditoria_tbUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCategoriaNaturezaJuridica`
--

DROP TABLE IF EXISTS `tbCategoriaNaturezaJuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCategoriaNaturezaJuridica` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CategoriaNaturezaJuridica` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCategoriaNaturezaJuridica`
--

LOCK TABLES `tbCategoriaNaturezaJuridica` WRITE;
/*!40000 ALTER TABLE `tbCategoriaNaturezaJuridica` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCategoriaNaturezaJuridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCnaeClasse`
--

DROP TABLE IF EXISTS `tbCnaeClasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCnaeClasse` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoClasse` int(2) unsigned zerofill NOT NULL,
  `DenominacaoClasse` varchar(250) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCnaeClasse`
--

LOCK TABLES `tbCnaeClasse` WRITE;
/*!40000 ALTER TABLE `tbCnaeClasse` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCnaeClasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCnaeClasse_Dependencies`
--

DROP TABLE IF EXISTS `tbCnaeClasse_Dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCnaeClasse_Dependencies` (
  `tbCnaeClasse_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeSecao_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeDivisao_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeGrupo_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbCnaeClasse_Id`,`tbCnaeSecao_Id`,`tbCnaeDivisao_Id`,`tbCnaeGrupo_Id`),
  UNIQUE KEY `tbCnaeClasse_Id_UNIQUE` (`tbCnaeClasse_Id`),
  KEY `FK_tbCnaeSecao0004` (`tbCnaeSecao_Id`),
  KEY `FK_tbCnaeDivisao0004` (`tbCnaeDivisao_Id`),
  KEY `FK_tbCnaeGrupo0002` (`tbCnaeGrupo_Id`),
  CONSTRAINT `FK_tbCnaeClasse0001` FOREIGN KEY (`tbCnaeClasse_Id`) REFERENCES `tbCnaeClasse` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeDivisao0004` FOREIGN KEY (`tbCnaeDivisao_Id`) REFERENCES `tbCnaeDivisao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeGrupo0002` FOREIGN KEY (`tbCnaeGrupo_Id`) REFERENCES `tbCnaeGrupo` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0004` FOREIGN KEY (`tbCnaeSecao_Id`) REFERENCES `tbCnaeSecao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCnaeClasse_Dependencies`
--

LOCK TABLES `tbCnaeClasse_Dependencies` WRITE;
/*!40000 ALTER TABLE `tbCnaeClasse_Dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCnaeClasse_Dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCnaeDivisao`
--

DROP TABLE IF EXISTS `tbCnaeDivisao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCnaeDivisao` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoDivisao` int(2) unsigned zerofill NOT NULL,
  `DenominacaoDivisao` varchar(250) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCnaeDivisao`
--

LOCK TABLES `tbCnaeDivisao` WRITE;
/*!40000 ALTER TABLE `tbCnaeDivisao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCnaeDivisao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCnaeDivisao_tbCnaeSecao`
--

DROP TABLE IF EXISTS `tbCnaeDivisao_tbCnaeSecao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCnaeDivisao_tbCnaeSecao` (
  `tbCnaeDivisao_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeSecao_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbCnaeDivisao_Id`,`tbCnaeSecao_Id`),
  UNIQUE KEY `tbCnaeDivisao_Id_UNIQUE` (`tbCnaeDivisao_Id`),
  KEY `FK_tbCnaeSecao0002` (`tbCnaeSecao_Id`),
  CONSTRAINT `FK_tbCnaeDivisao0001` FOREIGN KEY (`tbCnaeDivisao_Id`) REFERENCES `tbCnaeDivisao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0002` FOREIGN KEY (`tbCnaeSecao_Id`) REFERENCES `tbCnaeSecao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCnaeDivisao_tbCnaeSecao`
--

LOCK TABLES `tbCnaeDivisao_tbCnaeSecao` WRITE;
/*!40000 ALTER TABLE `tbCnaeDivisao_tbCnaeSecao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCnaeDivisao_tbCnaeSecao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCnaeGrupo`
--

DROP TABLE IF EXISTS `tbCnaeGrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCnaeGrupo` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoGrupo` int(1) unsigned zerofill NOT NULL,
  `DenominacaoGrupo` varchar(250) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`,`CodigoGrupo`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCnaeGrupo`
--

LOCK TABLES `tbCnaeGrupo` WRITE;
/*!40000 ALTER TABLE `tbCnaeGrupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCnaeGrupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCnaeGrupo_Dependencies`
--

DROP TABLE IF EXISTS `tbCnaeGrupo_Dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCnaeGrupo_Dependencies` (
  `tbCnaeGrupo_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeSecao_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeDivisao_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbCnaeGrupo_Id`,`tbCnaeSecao_Id`,`tbCnaeDivisao_Id`),
  UNIQUE KEY `tbCnaeGrupo_Id_UNIQUE` (`tbCnaeGrupo_Id`),
  KEY `FK_tbCnaeSecao0003` (`tbCnaeSecao_Id`),
  KEY `FK_tbCnaeDivisao0003` (`tbCnaeDivisao_Id`),
  CONSTRAINT `FK_tbCnaeDivisao0003` FOREIGN KEY (`tbCnaeDivisao_Id`) REFERENCES `tbCnaeDivisao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeGrupo0001` FOREIGN KEY (`tbCnaeGrupo_Id`) REFERENCES `tbCnaeGrupo` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0003` FOREIGN KEY (`tbCnaeSecao_Id`) REFERENCES `tbCnaeSecao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCnaeGrupo_Dependencies`
--

LOCK TABLES `tbCnaeGrupo_Dependencies` WRITE;
/*!40000 ALTER TABLE `tbCnaeGrupo_Dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCnaeGrupo_Dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCnaeImpeditivoSimplesNacional`
--

DROP TABLE IF EXISTS `tbCnaeImpeditivoSimplesNacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCnaeImpeditivoSimplesNacional` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCnaeImpeditivoSimplesNacional`
--

LOCK TABLES `tbCnaeImpeditivoSimplesNacional` WRITE;
/*!40000 ALTER TABLE `tbCnaeImpeditivoSimplesNacional` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCnaeImpeditivoSimplesNacional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse`
--

DROP TABLE IF EXISTS `tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` (
  `tbCnaeImpeditivoSimplesNacional_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeSubClasse_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbCnaeImpeditivoSimplesNacional_Id`,`tbCnaeSubClasse_Id`),
  UNIQUE KEY `tbCnaeImpeditivoSimplesNacional_Id_UNIQUE` (`tbCnaeImpeditivoSimplesNacional_Id`),
  UNIQUE KEY `tbCnaeSubClasse_Id_UNIQUE` (`tbCnaeSubClasse_Id`),
  CONSTRAINT `FK_tbCnaeImpeditivoSimplesNacional0001` FOREIGN KEY (`tbCnaeImpeditivoSimplesNacional_Id`) REFERENCES `tbCnaeImpeditivoSimplesNacional` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSubClasse0003` FOREIGN KEY (`tbCnaeSubClasse_Id`) REFERENCES `tbCnaeSubClasse` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse`
--

LOCK TABLES `tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` WRITE;
/*!40000 ALTER TABLE `tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCnaeSecao`
--

DROP TABLE IF EXISTS `tbCnaeSecao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCnaeSecao` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoSecao` char(1) NOT NULL,
  `DenominacaoSecao` varchar(250) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCnaeSecao`
--

LOCK TABLES `tbCnaeSecao` WRITE;
/*!40000 ALTER TABLE `tbCnaeSecao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCnaeSecao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCnaeSubClasse`
--

DROP TABLE IF EXISTS `tbCnaeSubClasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCnaeSubClasse` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoSubClasse` int(2) unsigned zerofill NOT NULL,
  `DenominacaoSubClasse` varchar(250) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCnaeSubClasse`
--

LOCK TABLES `tbCnaeSubClasse` WRITE;
/*!40000 ALTER TABLE `tbCnaeSubClasse` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCnaeSubClasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCnaeSubClasse_Dependencies`
--

DROP TABLE IF EXISTS `tbCnaeSubClasse_Dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCnaeSubClasse_Dependencies` (
  `tbCnaeSubClasse_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeSecao_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeDivisao_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeGrupo_Id` int(10) unsigned zerofill NOT NULL,
  `tbCnaeClasse_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbCnaeSubClasse_Id`,`tbCnaeSecao_Id`,`tbCnaeDivisao_Id`,`tbCnaeGrupo_Id`,`tbCnaeClasse_Id`),
  UNIQUE KEY `tbCnaeSubClasse_Id_UNIQUE` (`tbCnaeSubClasse_Id`),
  KEY `FK_tbCnaeSecao0005` (`tbCnaeSecao_Id`),
  KEY `FK_tbCnaeDivisao0005` (`tbCnaeDivisao_Id`),
  KEY `FK_tb_CnaeGrupo0003` (`tbCnaeGrupo_Id`),
  KEY `FK_tb_CnaeClasse0003` (`tbCnaeClasse_Id`),
  CONSTRAINT `FK_tbCnaeDivisao0005` FOREIGN KEY (`tbCnaeDivisao_Id`) REFERENCES `tbCnaeDivisao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0005` FOREIGN KEY (`tbCnaeSecao_Id`) REFERENCES `tbCnaeSecao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSubClasse0001` FOREIGN KEY (`tbCnaeSubClasse_Id`) REFERENCES `tbCnaeSubClasse` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb_CnaeClasse0003` FOREIGN KEY (`tbCnaeClasse_Id`) REFERENCES `tbCnaeClasse` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb_CnaeGrupo0003` FOREIGN KEY (`tbCnaeGrupo_Id`) REFERENCES `tbCnaeGrupo` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCnaeSubClasse_Dependencies`
--

LOCK TABLES `tbCnaeSubClasse_Dependencies` WRITE;
/*!40000 ALTER TABLE `tbCnaeSubClasse_Dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCnaeSubClasse_Dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCodigoInternet`
--

DROP TABLE IF EXISTS `tbCodigoInternet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCodigoInternet` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoTld` char(2) NOT NULL,
  `PaisEmPortugues` varchar(120) NOT NULL,
  `PaisEmIngles` varchar(120) NOT NULL,
  `PaisEmNativo` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCodigoInternet`
--

LOCK TABLES `tbCodigoInternet` WRITE;
/*!40000 ALTER TABLE `tbCodigoInternet` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCodigoInternet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCodigoPaisesBacen`
--

DROP TABLE IF EXISTS `tbCodigoPaisesBacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCodigoPaisesBacen` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoBacen` int(5) unsigned zerofill NOT NULL,
  `PaisEmPortugues` varchar(120) NOT NULL,
  `PaisEmIngles` varchar(120) NOT NULL,
  `PaisEmNativo` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  UNIQUE KEY `CodigoBacen_UNIQUE` (`CodigoBacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCodigoPaisesBacen`
--

LOCK TABLES `tbCodigoPaisesBacen` WRITE;
/*!40000 ALTER TABLE `tbCodigoPaisesBacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCodigoPaisesBacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCodigoPaisesFips`
--

DROP TABLE IF EXISTS `tbCodigoPaisesFips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCodigoPaisesFips` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoFips` char(2) NOT NULL,
  `PaisEmPortugues` varchar(120) NOT NULL,
  `PaisEmIngles` varchar(120) NOT NULL,
  `PaisEmNativo` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCodigoPaisesFips`
--

LOCK TABLES `tbCodigoPaisesFips` WRITE;
/*!40000 ALTER TABLE `tbCodigoPaisesFips` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCodigoPaisesFips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCodigoPaisesIso3161_1_Alfa_3`
--

DROP TABLE IF EXISTS `tbCodigoPaisesIso3161_1_Alfa_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCodigoPaisesIso3161_1_Alfa_3` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoISO3161_1_Alfa_3` char(3) NOT NULL,
  `PaisEmPortugues` varchar(120) NOT NULL,
  `PaisEmIngles` varchar(120) NOT NULL,
  `PaisEmNativo` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCodigoPaisesIso3161_1_Alfa_3`
--

LOCK TABLES `tbCodigoPaisesIso3161_1_Alfa_3` WRITE;
/*!40000 ALTER TABLE `tbCodigoPaisesIso3161_1_Alfa_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCodigoPaisesIso3161_1_Alfa_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCodigoTelefonicoMunicipios`
--

DROP TABLE IF EXISTS `tbCodigoTelefonicoMunicipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCodigoTelefonicoMunicipios` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoTelefonicoMunicipio` int(3) unsigned NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCodigoTelefonicoMunicipios`
--

LOCK TABLES `tbCodigoTelefonicoMunicipios` WRITE;
/*!40000 ALTER TABLE `tbCodigoTelefonicoMunicipios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCodigoTelefonicoMunicipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCodigoTelefonicoMunicipios_tbMunicipio`
--

DROP TABLE IF EXISTS `tbCodigoTelefonicoMunicipios_tbMunicipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCodigoTelefonicoMunicipios_tbMunicipio` (
  `tbCodigoTelefonicoMunicipios_Id` int(10) unsigned zerofill NOT NULL,
  `tbMunicipio_Id` int(10) unsigned zerofill NOT NULL,
  `tbEstado_Id` int(10) unsigned zerofill NOT NULL,
  `tbRegiao_Id` int(10) unsigned zerofill NOT NULL,
  `tbPais_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbCodigoTelefonicoMunicipios_Id`,`tbMunicipio_Id`,`tbEstado_Id`,`tbRegiao_Id`,`tbPais_Id`),
  UNIQUE KEY `tbCodigoTelefonicoMunicipios_Id_UNIQUE` (`tbCodigoTelefonicoMunicipios_Id`),
  UNIQUE KEY `tbMunicipio_Id_UNIQUE` (`tbMunicipio_Id`),
  KEY `FK_tbRegiao0002` (`tbRegiao_Id`),
  KEY `FK_tbEstado0003` (`tbEstado_Id`),
  CONSTRAINT `FK_tbCodigoTelefonicoMunicipios0001` FOREIGN KEY (`tbCodigoTelefonicoMunicipios_Id`) REFERENCES `tbCodigoTelefonicoMunicipios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEstado0003` FOREIGN KEY (`tbEstado_Id`) REFERENCES `tbEstado` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0002` FOREIGN KEY (`tbRegiao_Id`) REFERENCES `tbRegiao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCodigoTelefonicoMunicipios_tbMunicipio`
--

LOCK TABLES `tbCodigoTelefonicoMunicipios_tbMunicipio` WRITE;
/*!40000 ALTER TABLE `tbCodigoTelefonicoMunicipios_tbMunicipio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCodigoTelefonicoMunicipios_tbMunicipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCodigoTelefonicoPaises`
--

DROP TABLE IF EXISTS `tbCodigoTelefonicoPaises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCodigoTelefonicoPaises` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoTelefonicoPais` int(3) unsigned NOT NULL,
  `PaisEmPortugues` varchar(120) NOT NULL,
  `PaisEmIngles` varchar(120) NOT NULL,
  `PaisEmNativo` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCodigoTelefonicoPaises`
--

LOCK TABLES `tbCodigoTelefonicoPaises` WRITE;
/*!40000 ALTER TABLE `tbCodigoTelefonicoPaises` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCodigoTelefonicoPaises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbColecoesProduto`
--

DROP TABLE IF EXISTS `tbColecoesProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbColecoesProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Colecao` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbColecoesProduto`
--

LOCK TABLES `tbColecoesProduto` WRITE;
/*!40000 ALTER TABLE `tbColecoesProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbColecoesProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbColecoesProduto_tbDepartamentoProduto`
--

DROP TABLE IF EXISTS `tbColecoesProduto_tbDepartamentoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbColecoesProduto_tbDepartamentoProduto` (
  `tbColecoesProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbDepartamentoProduto_Id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tbColecoesProduto_Id`,`tbDepartamentoProduto_Id`),
  KEY `FK_tbDepartamentoProduto0006` (`tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0004` FOREIGN KEY (`tbColecoesProduto_Id`) REFERENCES `tbColecoesProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0006` FOREIGN KEY (`tbDepartamentoProduto_Id`) REFERENCES `tbDepartamentoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbColecoesProduto_tbDepartamentoProduto`
--

LOCK TABLES `tbColecoesProduto_tbDepartamentoProduto` WRITE;
/*!40000 ALTER TABLE `tbColecoesProduto_tbDepartamentoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbColecoesProduto_tbDepartamentoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbColecoesProduto_tbGrupoProduto`
--

DROP TABLE IF EXISTS `tbColecoesProduto_tbGrupoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbColecoesProduto_tbGrupoProduto` (
  `tbColecoesProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbGrupoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbColecoesProduto_Id`,`tbGrupoProduto_Id`),
  KEY `FK_tbGrupoProduto0006` (`tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0005` FOREIGN KEY (`tbColecoesProduto_Id`) REFERENCES `tbColecoesProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0006` FOREIGN KEY (`tbGrupoProduto_Id`) REFERENCES `tbGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbColecoesProduto_tbGrupoProduto`
--

LOCK TABLES `tbColecoesProduto_tbGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbColecoesProduto_tbGrupoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbColecoesProduto_tbGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbColecoesProduto_tbSubGrupoProduto`
--

DROP TABLE IF EXISTS `tbColecoesProduto_tbSubGrupoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbColecoesProduto_tbSubGrupoProduto` (
  `tbColecoesProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbSubGrupoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbColecoesProduto_Id`,`tbSubGrupoProduto_Id`),
  KEY `FK_tbSubGrupoProduto0006` (`tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0006` FOREIGN KEY (`tbColecoesProduto_Id`) REFERENCES `tbColecoesProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0006` FOREIGN KEY (`tbSubGrupoProduto_Id`) REFERENCES `tbSubGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbColecoesProduto_tbSubGrupoProduto`
--

LOCK TABLES `tbColecoesProduto_tbSubGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbColecoesProduto_tbSubGrupoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbColecoesProduto_tbSubGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbConfiguracaoColunaPagina`
--

DROP TABLE IF EXISTS `tbConfiguracaoColunaPagina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbConfiguracaoColunaPagina` (
  `tbUsuario_Id` int(10) unsigned NOT NULL,
  `Ordernation` int(10) unsigned NOT NULL,
  `PageBeanName` varchar(45) DEFAULT NULL,
  `TableName` varchar(45) DEFAULT NULL,
  `ColumnName` varchar(45) DEFAULT NULL,
  `PatternFilter` varchar(45) DEFAULT NULL,
  `WidthColumn` int(10) unsigned DEFAULT NULL,
  `Visible` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbConfiguracaoColunaPagina`
--

LOCK TABLES `tbConfiguracaoColunaPagina` WRITE;
/*!40000 ALTER TABLE `tbConfiguracaoColunaPagina` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbConfiguracaoColunaPagina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCorProduto`
--

DROP TABLE IF EXISTS `tbCorProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCorProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CorCodigo` varchar(15) DEFAULT NULL,
  `CorDescricao` varchar(45) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCorProduto`
--

LOCK TABLES `tbCorProduto` WRITE;
/*!40000 ALTER TABLE `tbCorProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCorProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCorProduto_tbColecoesProduto`
--

DROP TABLE IF EXISTS `tbCorProduto_tbColecoesProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCorProduto_tbColecoesProduto` (
  `tbCorProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbColecoesProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`,`tbColecoesProduto_Id`),
  UNIQUE KEY `tbCorProduto_Id_UNIQUE` (`tbCorProduto_Id`),
  KEY `FK_tbColecoesProduto0007` (`tbColecoesProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0007` FOREIGN KEY (`tbColecoesProduto_Id`) REFERENCES `tbColecoesProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCorProduto0007` FOREIGN KEY (`tbCorProduto_Id`) REFERENCES `tbCorProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCorProduto_tbColecoesProduto`
--

LOCK TABLES `tbCorProduto_tbColecoesProduto` WRITE;
/*!40000 ALTER TABLE `tbCorProduto_tbColecoesProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCorProduto_tbColecoesProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCorProduto_tbDepartamentoProduto`
--

DROP TABLE IF EXISTS `tbCorProduto_tbDepartamentoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCorProduto_tbDepartamentoProduto` (
  `tbCorProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbDepartamentoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`,`tbDepartamentoProduto_Id`),
  KEY `FK_tbDepartamentoProduto0007` (`tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0004` FOREIGN KEY (`tbCorProduto_Id`) REFERENCES `tbCorProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0007` FOREIGN KEY (`tbDepartamentoProduto_Id`) REFERENCES `tbDepartamentoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCorProduto_tbDepartamentoProduto`
--

LOCK TABLES `tbCorProduto_tbDepartamentoProduto` WRITE;
/*!40000 ALTER TABLE `tbCorProduto_tbDepartamentoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCorProduto_tbDepartamentoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCorProduto_tbGrupoProduto`
--

DROP TABLE IF EXISTS `tbCorProduto_tbGrupoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCorProduto_tbGrupoProduto` (
  `tbCorProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbGrupoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`,`tbGrupoProduto_Id`),
  KEY `FK_tbGrupoProduto0007` (`tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0005` FOREIGN KEY (`tbCorProduto_Id`) REFERENCES `tbCorProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0007` FOREIGN KEY (`tbGrupoProduto_Id`) REFERENCES `tbGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCorProduto_tbGrupoProduto`
--

LOCK TABLES `tbCorProduto_tbGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbCorProduto_tbGrupoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCorProduto_tbGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbCorProduto_tbSubGrupoProduto`
--

DROP TABLE IF EXISTS `tbCorProduto_tbSubGrupoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbCorProduto_tbSubGrupoProduto` (
  `tbCorProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbSubGrupoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`,`tbSubGrupoProduto_Id`),
  KEY `FK_tbSubGrupoProduto0007` (`tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0006` FOREIGN KEY (`tbCorProduto_Id`) REFERENCES `tbCorProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0007` FOREIGN KEY (`tbSubGrupoProduto_Id`) REFERENCES `tbSubGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCorProduto_tbSubGrupoProduto`
--

LOCK TABLES `tbCorProduto_tbSubGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbCorProduto_tbSubGrupoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbCorProduto_tbSubGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbDepartamentoProduto`
--

DROP TABLE IF EXISTS `tbDepartamentoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbDepartamentoProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `DepartamentoProduto` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbDepartamentoProduto`
--

LOCK TABLES `tbDepartamentoProduto` WRITE;
/*!40000 ALTER TABLE `tbDepartamentoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbDepartamentoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbEstado`
--

DROP TABLE IF EXISTS `tbEstado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbEstado` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoIbge` int(2) unsigned NOT NULL,
  `Abreviacao` char(2) NOT NULL,
  `Estado` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbEstado`
--

LOCK TABLES `tbEstado` WRITE;
/*!40000 ALTER TABLE `tbEstado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbEstado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbEstado_tbPais`
--

DROP TABLE IF EXISTS `tbEstado_tbPais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbEstado_tbPais` (
  `tbEstado_Id` int(10) unsigned zerofill NOT NULL,
  `tbPais_Id` int(10) unsigned zerofill NOT NULL,
  `tbRegiao_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbEstado_Id`,`tbPais_Id`,`tbRegiao_Id`),
  UNIQUE KEY `tbEstado_Id_UNIQUE` (`tbEstado_Id`),
  KEY `FK_tbRegiao0003` (`tbRegiao_Id`),
  CONSTRAINT `FK_tbEstado0002` FOREIGN KEY (`tbEstado_Id`) REFERENCES `tbEstado` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0003` FOREIGN KEY (`tbRegiao_Id`) REFERENCES `tbRegiao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbEstado_tbPais`
--

LOCK TABLES `tbEstado_tbPais` WRITE;
/*!40000 ALTER TABLE `tbEstado_tbPais` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbEstado_tbPais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbFinalidadeCodigoBarrasProduto`
--

DROP TABLE IF EXISTS `tbFinalidadeCodigoBarrasProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbFinalidadeCodigoBarrasProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `FinalidadeCodigoBarrasProduto` varchar(45) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaGridPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `ApresentacaoVendasGraficos` bit(1) NOT NULL,
  `ApresentacaoVendasPesquisas` bit(1) NOT NULL,
  `ApresentacaoVendasRelatorios` bit(1) NOT NULL,
  `ApresentacaoVendasOrcamentos` bit(1) NOT NULL,
  `ApresentacaoVendasPedidosVenda` bit(1) NOT NULL,
  `ApresentacaoVendasDAV` bit(1) NOT NULL,
  `ApresentacaoComprasGraficos` bit(1) NOT NULL,
  `ApresentacaoComprasPesquisas` bit(1) NOT NULL,
  `ApresentacaoComprasRelatorios` bit(1) NOT NULL,
  `ApresentacaoComprasCotacoes` bit(1) NOT NULL,
  `ApresentacaoComprasPedidosCompra` bit(1) NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `AplicacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaGirdPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `AplicacaoVendasGraficos` bit(1) NOT NULL,
  `AplicacaoVendasPesquisas` bit(1) NOT NULL,
  `AplicacaoVendasRelatorios` bit(1) NOT NULL,
  `AplicacaoVendasOrcamentos` bit(1) NOT NULL,
  `AplicacaoVendasPedidosDeVenda` bit(1) NOT NULL,
  `AplicacaoVendasDAV` bit(1) NOT NULL,
  `AplicacaoComprasGraficos` bit(1) NOT NULL,
  `AplicacaoComprasPesquisas` bit(1) NOT NULL,
  `AplicacaoComprasRelatorios` bit(1) NOT NULL,
  `AplicacaoComprasCotacoes` bit(1) NOT NULL,
  `AplicacaoComprasPedidosCompra` bit(1) NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbFinalidadeCodigoBarrasProduto`
--

LOCK TABLES `tbFinalidadeCodigoBarrasProduto` WRITE;
/*!40000 ALTER TABLE `tbFinalidadeCodigoBarrasProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbFinalidadeCodigoBarrasProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbFinalidadeCodigoBarrasProduto_tbUnidade`
--

DROP TABLE IF EXISTS `tbFinalidadeCodigoBarrasProduto_tbUnidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbFinalidadeCodigoBarrasProduto_tbUnidade` (
  `tbFinalidadeCodigoBarrasProduto_Id` int(10) unsigned NOT NULL,
  `tbUnidade_Id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tbFinalidadeCodigoBarrasProduto_Id`,`tbUnidade_Id`),
  UNIQUE KEY `tbFinalidadeCodigoBarrasProduto_Id_UNIQUE` (`tbFinalidadeCodigoBarrasProduto_Id`),
  KEY `FK_tbUnidade0001` (`tbUnidade_Id`),
  CONSTRAINT `FK_tbFinalidadeCodigoBarrasProduto0001` FOREIGN KEY (`tbFinalidadeCodigoBarrasProduto_Id`) REFERENCES `tbFinalidadeCodigoBarrasProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0001` FOREIGN KEY (`tbUnidade_Id`) REFERENCES `tbUnidade` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbFinalidadeCodigoBarrasProduto_tbUnidade`
--

LOCK TABLES `tbFinalidadeCodigoBarrasProduto_tbUnidade` WRITE;
/*!40000 ALTER TABLE `tbFinalidadeCodigoBarrasProduto_tbUnidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbFinalidadeCodigoBarrasProduto_tbUnidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbFinalidadeCodigoProduto`
--

DROP TABLE IF EXISTS `tbFinalidadeCodigoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbFinalidadeCodigoProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `FinalidadeCodigoProduto` varchar(45) NOT NULL,
  `NumeroMinimoCaracteres` decimal(5,0) NOT NULL,
  `NumeroMaximoCaracteres` decimal(5,0) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaGridPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `ApresentacaoVendasGraficos` bit(1) NOT NULL,
  `ApresentacaoVendasPesquisas` bit(1) NOT NULL,
  `ApresentacaoVendasRelatorios` bit(1) NOT NULL,
  `ApresentacaoVendasOrcamentos` bit(1) NOT NULL,
  `ApresentacaoVendasPedidosVenda` bit(1) NOT NULL,
  `ApresentacaoVendasDAV` bit(1) NOT NULL,
  `ApresentacaoComprasGraficos` bit(1) NOT NULL,
  `ApresentacaoComprasPesquisas` bit(1) NOT NULL,
  `ApresentacaoComprasRelatorios` bit(1) NOT NULL,
  `ApresentacaoComprasCotacoes` bit(1) NOT NULL,
  `ApresentacaoComprasPedidosCompra` bit(1) NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `AplicacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaGirdPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `AplicacaoVendasGraficos` bit(1) NOT NULL,
  `AplicacaoVendasPesquisas` bit(1) NOT NULL,
  `AplicacaoVendasRelatorios` bit(1) NOT NULL,
  `AplicacaoVendasOrcamentos` bit(1) NOT NULL,
  `AplicacaoVendasPedidosDeVenda` bit(1) NOT NULL,
  `AplicacaoVendasDAV` bit(1) NOT NULL,
  `AplicacaoComprasGraficos` bit(1) NOT NULL,
  `AplicacaoComprasPesquisas` bit(1) NOT NULL,
  `AplicacaoComprasRelatorios` bit(1) NOT NULL,
  `AplicacaoComprasCotacoes` bit(1) NOT NULL,
  `AplicacaoComprasPedidosCompra` bit(1) NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbFinalidadeCodigoProduto`
--

LOCK TABLES `tbFinalidadeCodigoProduto` WRITE;
/*!40000 ALTER TABLE `tbFinalidadeCodigoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbFinalidadeCodigoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbFinalidadeColecaoProduto`
--

DROP TABLE IF EXISTS `tbFinalidadeColecaoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbFinalidadeColecaoProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `FinalidadeColecaoProduto` varchar(45) NOT NULL,
  `NumeroMinimoCaracteres` decimal(5,0) NOT NULL,
  `NumeroMaximoCaracteres` decimal(5,0) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaGridPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `ApresentacaoVendasGraficos` bit(1) NOT NULL,
  `ApresentacaoVendasPesquisas` bit(1) NOT NULL,
  `ApresentacaoVendasRelatorios` bit(1) NOT NULL,
  `ApresentacaoVendasOrcamentos` bit(1) NOT NULL,
  `ApresentacaoVendasPedidosVenda` bit(1) NOT NULL,
  `ApresentacaoVendasDAV` bit(1) NOT NULL,
  `ApresentacaoComprasGraficos` bit(1) NOT NULL,
  `ApresentacaoComprasPesquisas` bit(1) NOT NULL,
  `ApresentacaoComprasRelatorios` bit(1) NOT NULL,
  `ApresentacaoComprasCotacoes` bit(1) NOT NULL,
  `ApresentacaoComprasPedidosCompra` bit(1) NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `AplicacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaGirdPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `AplicacaoVendasGraficos` bit(1) NOT NULL,
  `AplicacaoVendasPesquisas` bit(1) NOT NULL,
  `AplicacaoVendasRelatorios` bit(1) NOT NULL,
  `AplicacaoVendasOrcamentos` bit(1) NOT NULL,
  `AplicacaoVendasPedidosDeVenda` bit(1) NOT NULL,
  `AplicacaoVendasDAV` bit(1) NOT NULL,
  `AplicacaoComprasGraficos` bit(1) NOT NULL,
  `AplicacaoComprasPesquisas` bit(1) NOT NULL,
  `AplicacaoComprasRelatorios` bit(1) NOT NULL,
  `AplicacaoComprasCotacoes` bit(1) NOT NULL,
  `AplicacaoComprasPedidosCompra` bit(1) NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbFinalidadeColecaoProduto`
--

LOCK TABLES `tbFinalidadeColecaoProduto` WRITE;
/*!40000 ALTER TABLE `tbFinalidadeColecaoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbFinalidadeColecaoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbFinalidadeCorProduto`
--

DROP TABLE IF EXISTS `tbFinalidadeCorProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbFinalidadeCorProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `FinalidadeCorProduto` varchar(45) NOT NULL,
  `NumeroMinimoCaracteres` decimal(5,0) NOT NULL,
  `NumeroMaximoCaracteres` decimal(5,0) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaGridPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `ApresentacaoVendasGraficos` bit(1) NOT NULL,
  `ApresentacaoVendasPesquisas` bit(1) NOT NULL,
  `ApresentacaoVendasRelatorios` bit(1) NOT NULL,
  `ApresentacaoVendasOrcamentos` bit(1) NOT NULL,
  `ApresentacaoVendasPedidosVenda` bit(1) NOT NULL,
  `ApresentacaoVendasDAV` bit(1) NOT NULL,
  `ApresentacaoComprasGraficos` bit(1) NOT NULL,
  `ApresentacaoComprasPesquisas` bit(1) NOT NULL,
  `ApresentacaoComprasRelatorios` bit(1) NOT NULL,
  `ApresentacaoComprasCotacoes` bit(1) NOT NULL,
  `ApresentacaoComprasPedidosCompra` bit(1) NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `AplicacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaGirdPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `AplicacaoVendasGraficos` bit(1) NOT NULL,
  `AplicacaoVendasPesquisas` bit(1) NOT NULL,
  `AplicacaoVendasRelatorios` bit(1) NOT NULL,
  `AplicacaoVendasOrcamentos` bit(1) NOT NULL,
  `AplicacaoVendasPedidosDeVenda` bit(1) NOT NULL,
  `AplicacaoVendasDAV` bit(1) NOT NULL,
  `AplicacaoComprasGraficos` bit(1) NOT NULL,
  `AplicacaoComprasPesquisas` bit(1) NOT NULL,
  `AplicacaoComprasRelatorios` bit(1) NOT NULL,
  `AplicacaoComprasCotacoes` bit(1) NOT NULL,
  `AplicacaoComprasPedidosCompra` bit(1) NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbFinalidadeCorProduto`
--

LOCK TABLES `tbFinalidadeCorProduto` WRITE;
/*!40000 ALTER TABLE `tbFinalidadeCorProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbFinalidadeCorProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbFinalidadeDescricaoProduto`
--

DROP TABLE IF EXISTS `tbFinalidadeDescricaoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbFinalidadeDescricaoProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `FinalidadeDescricaoProduto` varchar(45) NOT NULL,
  `NumeroMinimoCaracteres` decimal(5,0) NOT NULL,
  `NumeroMaximoCaracteres` decimal(5,0) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaGridPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `ApresentacaoVendasGraficos` bit(1) NOT NULL,
  `ApresentacaoVendasPesquisas` bit(1) NOT NULL,
  `ApresentacaoVendasRelatorios` bit(1) NOT NULL,
  `ApresentacaoVendasOrcamentos` bit(1) NOT NULL,
  `ApresentacaoVendasPedidosVenda` bit(1) NOT NULL,
  `ApresentacaoVendasDAV` bit(1) NOT NULL,
  `ApresentacaoComprasGraficos` bit(1) NOT NULL,
  `ApresentacaoComprasPesquisas` bit(1) NOT NULL,
  `ApresentacaoComprasRelatorios` bit(1) NOT NULL,
  `ApresentacaoComprasCotacoes` bit(1) NOT NULL,
  `ApresentacaoComprasPedidosCompra` bit(1) NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `AplicacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaGirdPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `AplicacaoVendasGraficos` bit(1) NOT NULL,
  `AplicacaoVendasPesquisas` bit(1) NOT NULL,
  `AplicacaoVendasRelatorios` bit(1) NOT NULL,
  `AplicacaoVendasOrcamentos` bit(1) NOT NULL,
  `AplicacaoVendasPedidosDeVenda` bit(1) NOT NULL,
  `AplicacaoVendasDAV` bit(1) NOT NULL,
  `AplicacaoComprasGraficos` bit(1) NOT NULL,
  `AplicacaoComprasPesquisas` bit(1) NOT NULL,
  `AplicacaoComprasRelatorios` bit(1) NOT NULL,
  `AplicacaoComprasCotacoes` bit(1) NOT NULL,
  `AplicacaoComprasPedidosCompra` bit(1) NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbFinalidadeDescricaoProduto`
--

LOCK TABLES `tbFinalidadeDescricaoProduto` WRITE;
/*!40000 ALTER TABLE `tbFinalidadeDescricaoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbFinalidadeDescricaoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbFinalidadePadraoEspessuraProduto`
--

DROP TABLE IF EXISTS `tbFinalidadePadraoEspessuraProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbFinalidadePadraoEspessuraProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `FinalidadePadraoEspessuraProduto` varchar(45) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaGridPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `ApresentacaoVendasGraficos` bit(1) NOT NULL,
  `ApresentacaoVendasPesquisas` bit(1) NOT NULL,
  `ApresentacaoVendasRelatorios` bit(1) NOT NULL,
  `ApresentacaoVendasOrcamentos` bit(1) NOT NULL,
  `ApresentacaoVendasPedidosVenda` bit(1) NOT NULL,
  `ApresentacaoVendasDAV` bit(1) NOT NULL,
  `ApresentacaoComprasGraficos` bit(1) NOT NULL,
  `ApresentacaoComprasPesquisas` bit(1) NOT NULL,
  `ApresentacaoComprasRelatorios` bit(1) NOT NULL,
  `ApresentacaoComprasCotacoes` bit(1) NOT NULL,
  `ApresentacaoComprasPedidosCompra` bit(1) NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `AplicacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaGirdPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `AplicacaoVendasGraficos` bit(1) NOT NULL,
  `AplicacaoVendasPesquisas` bit(1) NOT NULL,
  `AplicacaoVendasRelatorios` bit(1) NOT NULL,
  `AplicacaoVendasOrcamentos` bit(1) NOT NULL,
  `AplicacaoVendasPedidosDeVenda` bit(1) NOT NULL,
  `AplicacaoVendasDAV` bit(1) NOT NULL,
  `AplicacaoComprasGraficos` bit(1) NOT NULL,
  `AplicacaoComprasPesquisas` bit(1) NOT NULL,
  `AplicacaoComprasRelatorios` bit(1) NOT NULL,
  `AplicacaoComprasCotacoes` bit(1) NOT NULL,
  `AplicacaoComprasPedidosCompra` bit(1) NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbFinalidadePadraoEspessuraProduto`
--

LOCK TABLES `tbFinalidadePadraoEspessuraProduto` WRITE;
/*!40000 ALTER TABLE `tbFinalidadePadraoEspessuraProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbFinalidadePadraoEspessuraProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbFinalidadePadraoEspessuraProduto_tbUnidade`
--

DROP TABLE IF EXISTS `tbFinalidadePadraoEspessuraProduto_tbUnidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbFinalidadePadraoEspessuraProduto_tbUnidade` (
  `tbFinalidadePadraoEspessuraProduto_Id` int(10) unsigned NOT NULL,
  `tbUnidade_Id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tbFinalidadePadraoEspessuraProduto_Id`,`tbUnidade_Id`),
  UNIQUE KEY `tbFinalidadePadraoEspessuraProduto_Id_UNIQUE` (`tbFinalidadePadraoEspessuraProduto_Id`),
  KEY `FK_tbUnidade0002` (`tbUnidade_Id`),
  CONSTRAINT `FK_tbFinalidadePadraoEspessuraProduto0001` FOREIGN KEY (`tbFinalidadePadraoEspessuraProduto_Id`) REFERENCES `tbFinalidadePadraoEspessuraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0002` FOREIGN KEY (`tbUnidade_Id`) REFERENCES `tbUnidade` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbFinalidadePadraoEspessuraProduto_tbUnidade`
--

LOCK TABLES `tbFinalidadePadraoEspessuraProduto_tbUnidade` WRITE;
/*!40000 ALTER TABLE `tbFinalidadePadraoEspessuraProduto_tbUnidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbFinalidadePadraoEspessuraProduto_tbUnidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbFinalidadePadraoLarguraProduto`
--

DROP TABLE IF EXISTS `tbFinalidadePadraoLarguraProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbFinalidadePadraoLarguraProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `FinalidadePadraoLarguraProduto` varchar(45) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaGridPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `ApresentacaoVendasGraficos` bit(1) NOT NULL,
  `ApresentacaoVendasPesquisas` bit(1) NOT NULL,
  `ApresentacaoVendasRelatorios` bit(1) NOT NULL,
  `ApresentacaoVendasOrcamentos` bit(1) NOT NULL,
  `ApresentacaoVendasPedidosVenda` bit(1) NOT NULL,
  `ApresentacaoVendasDAV` bit(1) NOT NULL,
  `ApresentacaoComprasGraficos` bit(1) NOT NULL,
  `ApresentacaoComprasPesquisas` bit(1) NOT NULL,
  `ApresentacaoComprasRelatorios` bit(1) NOT NULL,
  `ApresentacaoComprasCotacoes` bit(1) NOT NULL,
  `ApresentacaoComprasPedidosCompra` bit(1) NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `AplicacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaGirdPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `AplicacaoVendasGraficos` bit(1) NOT NULL,
  `AplicacaoVendasPesquisas` bit(1) NOT NULL,
  `AplicacaoVendasRelatorios` bit(1) NOT NULL,
  `AplicacaoVendasOrcamentos` bit(1) NOT NULL,
  `AplicacaoVendasPedidosDeVenda` bit(1) NOT NULL,
  `AplicacaoVendasDAV` bit(1) NOT NULL,
  `AplicacaoComprasGraficos` bit(1) NOT NULL,
  `AplicacaoComprasPesquisas` bit(1) NOT NULL,
  `AplicacaoComprasRelatorios` bit(1) NOT NULL,
  `AplicacaoComprasCotacoes` bit(1) NOT NULL,
  `AplicacaoComprasPedidosCompra` bit(1) NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbFinalidadePadraoLarguraProduto`
--

LOCK TABLES `tbFinalidadePadraoLarguraProduto` WRITE;
/*!40000 ALTER TABLE `tbFinalidadePadraoLarguraProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbFinalidadePadraoLarguraProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbFinalidadePadraoLarguraProduto_tbUnidade`
--

DROP TABLE IF EXISTS `tbFinalidadePadraoLarguraProduto_tbUnidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbFinalidadePadraoLarguraProduto_tbUnidade` (
  `tbFinalidadePadraoLarguraProduto_Id` int(10) unsigned NOT NULL,
  `tbUnidade_Id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tbFinalidadePadraoLarguraProduto_Id`,`tbUnidade_Id`),
  UNIQUE KEY `tbFinalidadeCodigoBarrasProduto_Id_UNIQUE` (`tbFinalidadePadraoLarguraProduto_Id`),
  KEY `FK_tbUnidade0003` (`tbUnidade_Id`),
  CONSTRAINT `FK_tbFinalidadePadraoLarguraProduto0001` FOREIGN KEY (`tbFinalidadePadraoLarguraProduto_Id`) REFERENCES `tbFinalidadePadraoLarguraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0003` FOREIGN KEY (`tbUnidade_Id`) REFERENCES `tbUnidade` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbFinalidadePadraoLarguraProduto_tbUnidade`
--

LOCK TABLES `tbFinalidadePadraoLarguraProduto_tbUnidade` WRITE;
/*!40000 ALTER TABLE `tbFinalidadePadraoLarguraProduto_tbUnidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbFinalidadePadraoLarguraProduto_tbUnidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbFinalidadeTipoProduto`
--

DROP TABLE IF EXISTS `tbFinalidadeTipoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbFinalidadeTipoProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `FinalidadeTipoProduto` varchar(45) NOT NULL,
  `NumeroMinimoCaracteres` decimal(5,0) NOT NULL,
  `NumeroMaximoCaracteres` decimal(5,0) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaGridPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `ApresentacaoVendasGraficos` bit(1) NOT NULL,
  `ApresentacaoVendasPesquisas` bit(1) NOT NULL,
  `ApresentacaoVendasRelatorios` bit(1) NOT NULL,
  `ApresentacaoVendasOrcamentos` bit(1) NOT NULL,
  `ApresentacaoVendasPedidosVenda` bit(1) NOT NULL,
  `ApresentacaoVendasDAV` bit(1) NOT NULL,
  `ApresentacaoComprasGraficos` bit(1) NOT NULL,
  `ApresentacaoComprasPesquisas` bit(1) NOT NULL,
  `ApresentacaoComprasRelatorios` bit(1) NOT NULL,
  `ApresentacaoComprasCotacoes` bit(1) NOT NULL,
  `ApresentacaoComprasPedidosCompra` bit(1) NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `AplicacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaGirdPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `AplicacaoVendasGraficos` bit(1) NOT NULL,
  `AplicacaoVendasPesquisas` bit(1) NOT NULL,
  `AplicacaoVendasRelatorios` bit(1) NOT NULL,
  `AplicacaoVendasOrcamentos` bit(1) NOT NULL,
  `AplicacaoVendasPedidosDeVenda` bit(1) NOT NULL,
  `AplicacaoVendasDAV` bit(1) NOT NULL,
  `AplicacaoComprasGraficos` bit(1) NOT NULL,
  `AplicacaoComprasPesquisas` bit(1) NOT NULL,
  `AplicacaoComprasRelatorios` bit(1) NOT NULL,
  `AplicacaoComprasCotacoes` bit(1) NOT NULL,
  `AplicacaoComprasPedidosCompra` bit(1) NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbFinalidadeTipoProduto`
--

LOCK TABLES `tbFinalidadeTipoProduto` WRITE;
/*!40000 ALTER TABLE `tbFinalidadeTipoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbFinalidadeTipoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbFinalidadeUnidadeProduto`
--

DROP TABLE IF EXISTS `tbFinalidadeUnidadeProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbFinalidadeUnidadeProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `FinalidadeUnidadeProduto` varchar(45) NOT NULL,
  `NumeroMinimoCaracteres` decimal(5,0) NOT NULL,
  `NumeroMaximoCaracteres` decimal(5,0) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaGridPesquisas` bit(1) NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `ApresentacaoVendasGraficos` bit(1) NOT NULL,
  `ApresentacaoVendasPesquisas` bit(1) NOT NULL,
  `ApresentacaoVendasRelatorios` bit(1) NOT NULL,
  `ApresentacaoVendasOrcamentos` bit(1) NOT NULL,
  `ApresentacaoVendasPedidosVenda` bit(1) NOT NULL,
  `ApresentacaoVendasDAV` bit(1) NOT NULL,
  `ApresentacaoComprasGraficos` bit(1) NOT NULL,
  `ApresentacaoComprasPesquisas` bit(1) NOT NULL,
  `ApresentacaoComprasRelatorios` bit(1) NOT NULL,
  `ApresentacaoComprasCotacoes` bit(1) NOT NULL,
  `ApresentacaoComprasPedidosCompra` bit(1) NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `AplicacaoSistemaLookupPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaGirdPesquisas` bit(1) NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` bit(1) NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` bit(1) NOT NULL,
  `AplicacaoVendasGraficos` bit(1) NOT NULL,
  `AplicacaoVendasPesquisas` bit(1) NOT NULL,
  `AplicacaoVendasRelatorios` bit(1) NOT NULL,
  `AplicacaoVendasOrcamentos` bit(1) NOT NULL,
  `AplicacaoVendasPedidosDeVenda` bit(1) NOT NULL,
  `AplicacaoVendasDAV` bit(1) NOT NULL,
  `AplicacaoComprasGraficos` bit(1) NOT NULL,
  `AplicacaoComprasPesquisas` bit(1) NOT NULL,
  `AplicacaoComprasRelatorios` bit(1) NOT NULL,
  `AplicacaoComprasCotacoes` bit(1) NOT NULL,
  `AplicacaoComprasPedidosCompra` bit(1) NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFe` bit(1) NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` bit(1) NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` bit(1) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbFinalidadeUnidadeProduto`
--

LOCK TABLES `tbFinalidadeUnidadeProduto` WRITE;
/*!40000 ALTER TABLE `tbFinalidadeUnidadeProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbFinalidadeUnidadeProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbGrupoProduto`
--

DROP TABLE IF EXISTS `tbGrupoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbGrupoProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `GrupoProduto` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbGrupoProduto`
--

LOCK TABLES `tbGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbGrupoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbGrupoProduto_tbDepartamentoProduto`
--

DROP TABLE IF EXISTS `tbGrupoProduto_tbDepartamentoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbGrupoProduto_tbDepartamentoProduto` (
  `tbGrupoProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbDepartamentoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbGrupoProduto_Id`,`tbDepartamentoProduto_Id`),
  KEY `FK_tbDepartamentoProduto0002` (`tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbDepartamentoProduto0002` FOREIGN KEY (`tbDepartamentoProduto_Id`) REFERENCES `tbDepartamentoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0002` FOREIGN KEY (`tbGrupoProduto_Id`) REFERENCES `tbGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbGrupoProduto_tbDepartamentoProduto`
--

LOCK TABLES `tbGrupoProduto_tbDepartamentoProduto` WRITE;
/*!40000 ALTER TABLE `tbGrupoProduto_tbDepartamentoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbGrupoProduto_tbDepartamentoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbLinguas`
--

DROP TABLE IF EXISTS `tbLinguas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbLinguas` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoISO639-1` char(2) NOT NULL,
  `LinguaEmPortugues` varchar(120) NOT NULL,
  `LinguaEmIngles` varchar(120) NOT NULL,
  `LinguaEmNativo` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbLinguas`
--

LOCK TABLES `tbLinguas` WRITE;
/*!40000 ALTER TABLE `tbLinguas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbLinguas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbMoeda`
--

DROP TABLE IF EXISTS `tbMoeda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbMoeda` (
  `Id` int(10) unsigned zerofill NOT NULL,
  `CodigoIso4217` char(3) NOT NULL,
  `SimboloMonetario` varchar(4) NOT NULL,
  `MoedaEmPortugues` varchar(120) NOT NULL,
  `MoedaEmIngles` varchar(120) NOT NULL,
  `MoedaEmNativo` varchar(120) NOT NULL,
  `UnidadeFracionadaPortugues` varchar(60) NOT NULL,
  `UnidadeFracionadaIngles` varchar(60) NOT NULL,
  `UnidadeFracionadaNativo` varchar(60) NOT NULL,
  `Divisao` int(4) NOT NULL,
  `CasasDecimais` decimal(3,2) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbMoeda`
--

LOCK TABLES `tbMoeda` WRITE;
/*!40000 ALTER TABLE `tbMoeda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbMoeda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbMoeda_tbPais`
--

DROP TABLE IF EXISTS `tbMoeda_tbPais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbMoeda_tbPais` (
  `tbMoeda_Id` int(10) unsigned zerofill NOT NULL,
  `tbPais_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbMoeda_Id`,`tbPais_Id`),
  CONSTRAINT `FK_tbMoeda0001` FOREIGN KEY (`tbMoeda_Id`) REFERENCES `tbMoeda` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbMoeda_tbPais`
--

LOCK TABLES `tbMoeda_tbPais` WRITE;
/*!40000 ALTER TABLE `tbMoeda_tbPais` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbMoeda_tbPais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbMunicipio`
--

DROP TABLE IF EXISTS `tbMunicipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbMunicipio` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoIbge` int(7) unsigned NOT NULL,
  `Municipio` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbMunicipio`
--

LOCK TABLES `tbMunicipio` WRITE;
/*!40000 ALTER TABLE `tbMunicipio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbMunicipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbMunicipio_tbPais`
--

DROP TABLE IF EXISTS `tbMunicipio_tbPais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbMunicipio_tbPais` (
  `tbMunicipio_Id` int(10) unsigned zerofill NOT NULL,
  `tbPais_Id` int(10) unsigned zerofill NOT NULL,
  `tbEstado_Id` int(10) unsigned zerofill NOT NULL,
  `tbRegiao_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbMunicipio_Id`,`tbPais_Id`,`tbEstado_Id`,`tbRegiao_Id`),
  UNIQUE KEY `tbMunicipio_Id_UNIQUE` (`tbMunicipio_Id`),
  KEY `FK_tbEstado0004` (`tbEstado_Id`),
  KEY `FK_tbRegiao0004` (`tbRegiao_Id`),
  CONSTRAINT `FK_tbEstado0004` FOREIGN KEY (`tbEstado_Id`) REFERENCES `tbEstado` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbMunicipio0002` FOREIGN KEY (`tbMunicipio_Id`) REFERENCES `tbMunicipio` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0004` FOREIGN KEY (`tbRegiao_Id`) REFERENCES `tbRegiao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbMunicipio_tbPais`
--

LOCK TABLES `tbMunicipio_tbPais` WRITE;
/*!40000 ALTER TABLE `tbMunicipio_tbPais` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbMunicipio_tbPais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbNaturezaJuridica`
--

DROP TABLE IF EXISTS `tbNaturezaJuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbNaturezaJuridica` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoNaturezaJuridica` int(10) unsigned zerofill NOT NULL,
  `NaturezaJuridica` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbNaturezaJuridica`
--

LOCK TABLES `tbNaturezaJuridica` WRITE;
/*!40000 ALTER TABLE `tbNaturezaJuridica` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbNaturezaJuridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbNaturezaJuridica_tbCategoriaNaturezaJuridica`
--

DROP TABLE IF EXISTS `tbNaturezaJuridica_tbCategoriaNaturezaJuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbNaturezaJuridica_tbCategoriaNaturezaJuridica` (
  `tbNaturezaJuridica_Id` int(10) unsigned zerofill NOT NULL,
  `tbCategoriaNaturezaJuridica_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbNaturezaJuridica_Id`,`tbCategoriaNaturezaJuridica_Id`),
  UNIQUE KEY `tbNaturezaJuridica_Id_UNIQUE` (`tbNaturezaJuridica_Id`),
  KEY `FK_tbCategoriaNaturezaJuridica` (`tbCategoriaNaturezaJuridica_Id`),
  CONSTRAINT `FK_tbCategoriaNaturezaJuridica` FOREIGN KEY (`tbCategoriaNaturezaJuridica_Id`) REFERENCES `tbCategoriaNaturezaJuridica` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbNaturezaJuridica` FOREIGN KEY (`tbNaturezaJuridica_Id`) REFERENCES `tbNaturezaJuridica` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbNaturezaJuridica_tbCategoriaNaturezaJuridica`
--

LOCK TABLES `tbNaturezaJuridica_tbCategoriaNaturezaJuridica` WRITE;
/*!40000 ALTER TABLE `tbNaturezaJuridica_tbCategoriaNaturezaJuridica` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbNaturezaJuridica_tbCategoriaNaturezaJuridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPadroesEspessuraProduto`
--

DROP TABLE IF EXISTS `tbPadroesEspessuraProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPadroesEspessuraProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Espessura` decimal(6,3) NOT NULL,
  `EspessuraDescricao` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesEspessuraProduto`
--

LOCK TABLES `tbPadroesEspessuraProduto` WRITE;
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPadroesEspessuraProduto_tbColecoesProduto`
--

DROP TABLE IF EXISTS `tbPadroesEspessuraProduto_tbColecoesProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPadroesEspessuraProduto_tbColecoesProduto` (
  `tbPadroesEspessuraProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbColecoesProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbPadroesEspessuraProduto_Id`,`tbColecoesProduto_Id`),
  KEY `FK_tbColecoesProduto0002` (`tbColecoesProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0002` FOREIGN KEY (`tbColecoesProduto_Id`) REFERENCES `tbColecoesProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesEspessuraProduto0005` FOREIGN KEY (`tbPadroesEspessuraProduto_Id`) REFERENCES `tbPadroesEspessuraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesEspessuraProduto_tbColecoesProduto`
--

LOCK TABLES `tbPadroesEspessuraProduto_tbColecoesProduto` WRITE;
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto_tbColecoesProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto_tbColecoesProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPadroesEspessuraProduto_tbCorProduto`
--

DROP TABLE IF EXISTS `tbPadroesEspessuraProduto_tbCorProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPadroesEspessuraProduto_tbCorProduto` (
  `tbPadoresEspessuraProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbCorProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbPadoresEspessuraProduto_Id`,`tbCorProduto_Id`),
  UNIQUE KEY `tbCorProduto_Id_UNIQUE` (`tbCorProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0002` FOREIGN KEY (`tbCorProduto_Id`) REFERENCES `tbCorProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesEspessuraProduto0006` FOREIGN KEY (`tbPadoresEspessuraProduto_Id`) REFERENCES `tbPadroesEspessuraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesEspessuraProduto_tbCorProduto`
--

LOCK TABLES `tbPadroesEspessuraProduto_tbCorProduto` WRITE;
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto_tbCorProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto_tbCorProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPadroesEspessuraProduto_tbDepartamento`
--

DROP TABLE IF EXISTS `tbPadroesEspessuraProduto_tbDepartamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPadroesEspessuraProduto_tbDepartamento` (
  `tbPadroesEspessurasProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbDepartamentoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbPadroesEspessurasProduto_Id`,`tbDepartamentoProduto_Id`),
  KEY `FK_tbDepartamentoProduto0004` (`tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbDepartamentoProduto0004` FOREIGN KEY (`tbDepartamentoProduto_Id`) REFERENCES `tbDepartamentoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesEspessurasProduto0002` FOREIGN KEY (`tbPadroesEspessurasProduto_Id`) REFERENCES `tbPadroesEspessuraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesEspessuraProduto_tbDepartamento`
--

LOCK TABLES `tbPadroesEspessuraProduto_tbDepartamento` WRITE;
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto_tbDepartamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto_tbDepartamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPadroesEspessuraProduto_tbGrupoProduto`
--

DROP TABLE IF EXISTS `tbPadroesEspessuraProduto_tbGrupoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPadroesEspessuraProduto_tbGrupoProduto` (
  `tbPadroesEspessuraProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbGrupoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbPadroesEspessuraProduto_Id`,`tbGrupoProduto_Id`),
  KEY `FK_tbGrupoProduto0004` (`tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbGrupoProduto0004` FOREIGN KEY (`tbGrupoProduto_Id`) REFERENCES `tbGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPradroesEspessuraProduto0003` FOREIGN KEY (`tbPadroesEspessuraProduto_Id`) REFERENCES `tbPadroesEspessuraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesEspessuraProduto_tbGrupoProduto`
--

LOCK TABLES `tbPadroesEspessuraProduto_tbGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto_tbGrupoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto_tbGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPadroesEspessuraProduto_tbSubGrupoProduto`
--

DROP TABLE IF EXISTS `tbPadroesEspessuraProduto_tbSubGrupoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPadroesEspessuraProduto_tbSubGrupoProduto` (
  `tbPadroesEspessuraProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbSubGrupoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbPadroesEspessuraProduto_Id`,`tbSubGrupoProduto_Id`),
  KEY `FK_tbSubGrupoProduto0004` (`tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbPadroesEspessuraProduto0004` FOREIGN KEY (`tbPadroesEspessuraProduto_Id`) REFERENCES `tbPadroesEspessuraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0004` FOREIGN KEY (`tbSubGrupoProduto_Id`) REFERENCES `tbSubGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesEspessuraProduto_tbSubGrupoProduto`
--

LOCK TABLES `tbPadroesEspessuraProduto_tbSubGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto_tbSubGrupoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto_tbSubGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPadroesLarguraProduto`
--

DROP TABLE IF EXISTS `tbPadroesLarguraProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPadroesLarguraProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Largura` decimal(6,3) NOT NULL,
  `LarguraDescricao` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesLarguraProduto`
--

LOCK TABLES `tbPadroesLarguraProduto` WRITE;
/*!40000 ALTER TABLE `tbPadroesLarguraProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbPadroesLarguraProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPadroesLarguraProduto_tbColecoesProduto`
--

DROP TABLE IF EXISTS `tbPadroesLarguraProduto_tbColecoesProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPadroesLarguraProduto_tbColecoesProduto` (
  `tbPadroesLarguraProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbColecoesProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`,`tbColecoesProduto_Id`),
  KEY `FK_tbColecoesProduto0003` (`tbColecoesProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0003` FOREIGN KEY (`tbColecoesProduto_Id`) REFERENCES `tbColecoesProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesLarguraProduto0005` FOREIGN KEY (`tbPadroesLarguraProduto_Id`) REFERENCES `tbPadroesLarguraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesLarguraProduto_tbColecoesProduto`
--

LOCK TABLES `tbPadroesLarguraProduto_tbColecoesProduto` WRITE;
/*!40000 ALTER TABLE `tbPadroesLarguraProduto_tbColecoesProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbPadroesLarguraProduto_tbColecoesProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPadroesLarguraProduto_tbCorProduto`
--

DROP TABLE IF EXISTS `tbPadroesLarguraProduto_tbCorProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPadroesLarguraProduto_tbCorProduto` (
  `tbPadroesLarguraProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbCorProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`,`tbCorProduto_Id`),
  UNIQUE KEY `tbCorProduto_Id_UNIQUE` (`tbCorProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0003` FOREIGN KEY (`tbCorProduto_Id`) REFERENCES `tbCorProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesLarguraProduto0006` FOREIGN KEY (`tbPadroesLarguraProduto_Id`) REFERENCES `tbPadroesLarguraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesLarguraProduto_tbCorProduto`
--

LOCK TABLES `tbPadroesLarguraProduto_tbCorProduto` WRITE;
/*!40000 ALTER TABLE `tbPadroesLarguraProduto_tbCorProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbPadroesLarguraProduto_tbCorProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPadroesLarguraProduto_tbDepartamentoProduto`
--

DROP TABLE IF EXISTS `tbPadroesLarguraProduto_tbDepartamentoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPadroesLarguraProduto_tbDepartamentoProduto` (
  `tbPadroesLarguraProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbDepartamentoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`,`tbDepartamentoProduto_Id`),
  KEY `FK_tbDepartamentoProduto0005` (`tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbDepartamentoProduto0005` FOREIGN KEY (`tbDepartamentoProduto_Id`) REFERENCES `tbDepartamentoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesLarguraProduto0002` FOREIGN KEY (`tbPadroesLarguraProduto_Id`) REFERENCES `tbPadroesLarguraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesLarguraProduto_tbDepartamentoProduto`
--

LOCK TABLES `tbPadroesLarguraProduto_tbDepartamentoProduto` WRITE;
/*!40000 ALTER TABLE `tbPadroesLarguraProduto_tbDepartamentoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbPadroesLarguraProduto_tbDepartamentoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPadroesLarguraProduto_tbGrupoProduto`
--

DROP TABLE IF EXISTS `tbPadroesLarguraProduto_tbGrupoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPadroesLarguraProduto_tbGrupoProduto` (
  `tbPadroesLarguraProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbGrupoProduto` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`,`tbGrupoProduto`),
  KEY `FK_tbGrupoProduto0005` (`tbGrupoProduto`),
  CONSTRAINT `FK_tbGrupoProduto0005` FOREIGN KEY (`tbGrupoProduto`) REFERENCES `tbGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesLarguraProduto0003` FOREIGN KEY (`tbPadroesLarguraProduto_Id`) REFERENCES `tbPadroesLarguraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesLarguraProduto_tbGrupoProduto`
--

LOCK TABLES `tbPadroesLarguraProduto_tbGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbPadroesLarguraProduto_tbGrupoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbPadroesLarguraProduto_tbGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPadroesLarguraProduto_tbSubGrupoProduto`
--

DROP TABLE IF EXISTS `tbPadroesLarguraProduto_tbSubGrupoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPadroesLarguraProduto_tbSubGrupoProduto` (
  `tbPadroesLarguraProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbSubGrupoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`,`tbSubGrupoProduto_Id`),
  KEY `FK_tbSubGrupoProduto0005` (`tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0004` FOREIGN KEY (`tbPadroesLarguraProduto_Id`) REFERENCES `tbPadroesLarguraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0005` FOREIGN KEY (`tbSubGrupoProduto_Id`) REFERENCES `tbSubGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesLarguraProduto_tbSubGrupoProduto`
--

LOCK TABLES `tbPadroesLarguraProduto_tbSubGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbPadroesLarguraProduto_tbSubGrupoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbPadroesLarguraProduto_tbSubGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPais`
--

DROP TABLE IF EXISTS `tbPais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPais` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Bandeira` blob,
  `PaisEmPortugues` varchar(120) NOT NULL,
  `PaisEmIngles` varchar(120) NOT NULL,
  `PaisEmNativo` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `Utc+` bit(1) NOT NULL,
  `Utc-` bit(1) NOT NULL,
  `Utc` time NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPais`
--

LOCK TABLES `tbPais` WRITE;
/*!40000 ALTER TABLE `tbPais` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbPais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPais_Dependecies`
--

DROP TABLE IF EXISTS `tbPais_Dependecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPais_Dependecies` (
  `tbPais_Id` int(10) unsigned zerofill NOT NULL,
  `tbCodigoPaisesBacen_Id` int(10) unsigned zerofill NOT NULL,
  `tbCodigoPaisesIso3161_1_Alfa_3_Id` int(10) unsigned zerofill NOT NULL,
  `tbCodigoPaisesFips_Id` int(10) unsigned zerofill NOT NULL,
  `tbMoeda_Id` int(10) unsigned zerofill NOT NULL,
  `tbLinguas_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbPais_Id`,`tbCodigoPaisesBacen_Id`,`tbCodigoPaisesIso3161_1_Alfa_3_Id`,`tbCodigoPaisesFips_Id`,`tbMoeda_Id`,`tbLinguas_Id`),
  UNIQUE KEY `tbPais_Id_UNIQUE` (`tbPais_Id`),
  UNIQUE KEY `tbCodigoPaisesBacen_Id_UNIQUE` (`tbCodigoPaisesBacen_Id`),
  UNIQUE KEY `tbCodigoPaisesIso3161_1_Alfa_3_Id_UNIQUE` (`tbCodigoPaisesIso3161_1_Alfa_3_Id`),
  UNIQUE KEY `tbCodigoPaisesFips_Id_UNIQUE` (`tbCodigoPaisesFips_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPais_Dependecies`
--

LOCK TABLES `tbPais_Dependecies` WRITE;
/*!40000 ALTER TABLE `tbPais_Dependecies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbPais_Dependecies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProduto`
--

DROP TABLE IF EXISTS `tbProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Observacao` varchar(8000) DEFAULT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProduto`
--

LOCK TABLES `tbProduto` WRITE;
/*!40000 ALTER TABLE `tbProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProdutoCodigo`
--

DROP TABLE IF EXISTS `tbProdutoCodigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProdutoCodigo` (
  `Id` int(10) unsigned zerofill NOT NULL,
  `Codigo` varchar(8000) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProdutoCodigo`
--

LOCK TABLES `tbProdutoCodigo` WRITE;
/*!40000 ALTER TABLE `tbProdutoCodigo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProdutoCodigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProdutoCodigoBarras`
--

DROP TABLE IF EXISTS `tbProdutoCodigoBarras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProdutoCodigoBarras` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CodigoBarras` bigint(14) unsigned zerofill NOT NULL,
  `FatorMultiplicacao` decimal(18,3) DEFAULT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProdutoCodigoBarras`
--

LOCK TABLES `tbProdutoCodigoBarras` WRITE;
/*!40000 ALTER TABLE `tbProdutoCodigoBarras` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProdutoCodigoBarras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProdutoCodigoBarras_tbUnidade`
--

DROP TABLE IF EXISTS `tbProdutoCodigoBarras_tbUnidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProdutoCodigoBarras_tbUnidade` (
  `tbProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbProdutoCodigoBarras_Id` int(10) unsigned zerofill NOT NULL,
  `tbUnidade_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadeUnidadeProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbProduto_Id`,`tbProdutoCodigoBarras_Id`,`tbUnidade_Id`,`tbFinalidadeUnidadeProduto_Id`),
  UNIQUE KEY `tbProdutoCodigoBarras_Id_UNIQUE` (`tbProdutoCodigoBarras_Id`),
  KEY `FK_tbUnidade0005` (`tbUnidade_Id`),
  KEY `FK_tbFinalidadeUnidadeProduto0002` (`tbFinalidadeUnidadeProduto_Id`),
  CONSTRAINT `FK_tbFinalidadeUnidadeProduto0002` FOREIGN KEY (`tbFinalidadeUnidadeProduto_Id`) REFERENCES `tbFinalidadeUnidadeProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto0013` FOREIGN KEY (`tbProduto_Id`) REFERENCES `tbProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigoBarras0002` FOREIGN KEY (`tbProdutoCodigoBarras_Id`) REFERENCES `tbProdutoCodigoBarras` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0005` FOREIGN KEY (`tbUnidade_Id`) REFERENCES `tbUnidade` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProdutoCodigoBarras_tbUnidade`
--

LOCK TABLES `tbProdutoCodigoBarras_tbUnidade` WRITE;
/*!40000 ALTER TABLE `tbProdutoCodigoBarras_tbUnidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProdutoCodigoBarras_tbUnidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProdutoDescricao`
--

DROP TABLE IF EXISTS `tbProdutoDescricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProdutoDescricao` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(8000) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProdutoDescricao`
--

LOCK TABLES `tbProdutoDescricao` WRITE;
/*!40000 ALTER TABLE `tbProdutoDescricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProdutoDescricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProdutoUnidade`
--

DROP TABLE IF EXISTS `tbProdutoUnidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProdutoUnidade` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `UnidadePrincipal` bit(1) NOT NULL,
  `UnidadeSecundaria` bit(1) NOT NULL,
  `FatorMultiplicacao` decimal(18,3) DEFAULT NULL,
  `PesoLiquido` decimal(18,3) DEFAULT NULL,
  `PesoBruto` decimal(18,3) DEFAULT NULL,
  `PermiteCompra` bit(1) NOT NULL,
  `LimitaQuantidadeMinimaPedidoCompra` bit(1) NOT NULL,
  `QuantidadeMinimaPedidoCompra` decimal(18,3) DEFAULT NULL,
  `LimitaQuantidadeMaximaPedidoCompra` bit(1) NOT NULL,
  `QuantidadeMaximaPedidoCompra` decimal(18,3) DEFAULT NULL,
  `LimitaPesoMaximoPedidoCompra` bit(1) NOT NULL,
  `PesoMaximoPedidoCompra` decimal(18,3) DEFAULT NULL,
  `UtilizadaAnaliseComparativaPedidoCompra` bit(1) NOT NULL,
  `UtilizadaAnaliseComparativaEstoque` bit(1) NOT NULL,
  `PermiteVenda` bit(1) NOT NULL,
  `LimitaQuantidadeMinimaPedidoVenda` bit(1) NOT NULL,
  `QuantidadeMinimaPedidoVenda` decimal(18,3) DEFAULT NULL,
  `LimitaQuantidadeMaximaPedidoVenda` bit(1) NOT NULL,
  `QuantidadeMaximaPedidoVenda` decimal(18,3) DEFAULT NULL,
  `LimitaPesoMaximoPedidoVenda` bit(1) NOT NULL,
  `PesoMaximoPedidoVenda` decimal(18,3) DEFAULT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProdutoUnidade`
--

LOCK TABLES `tbProdutoUnidade` WRITE;
/*!40000 ALTER TABLE `tbProdutoUnidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProdutoUnidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProduto_tbColecoesProduto`
--

DROP TABLE IF EXISTS `tbProduto_tbColecoesProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProduto_tbColecoesProduto` (
  `tbProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbColecoesProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadeColecaoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbProduto_Id`,`tbColecoesProduto_Id`,`tbFinalidadeColecaoProduto_Id`),
  KEY `FK_tbColecoesProduto0001` (`tbColecoesProduto_Id`),
  KEY `FK_tbFinalidadeColecaoProduto0001` (`tbFinalidadeColecaoProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0001` FOREIGN KEY (`tbColecoesProduto_Id`) REFERENCES `tbColecoesProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeColecaoProduto0001` FOREIGN KEY (`tbFinalidadeColecaoProduto_Id`) REFERENCES `tbFinalidadeColecaoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto000006` FOREIGN KEY (`tbProduto_Id`) REFERENCES `tbProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProduto_tbColecoesProduto`
--

LOCK TABLES `tbProduto_tbColecoesProduto` WRITE;
/*!40000 ALTER TABLE `tbProduto_tbColecoesProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProduto_tbColecoesProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProduto_tbCorProduto`
--

DROP TABLE IF EXISTS `tbProduto_tbCorProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProduto_tbCorProduto` (
  `tbProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbCorProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadeCorProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbProduto_Id`,`tbCorProduto_Id`,`tbFinalidadeCorProduto_Id`),
  KEY `FK_tbCorProduto0001` (`tbCorProduto_Id`),
  KEY `FK_tbFinalidadeCorProduto0001` (`tbFinalidadeCorProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0001` FOREIGN KEY (`tbCorProduto_Id`) REFERENCES `tbCorProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCorProduto0001` FOREIGN KEY (`tbFinalidadeCorProduto_Id`) REFERENCES `tbFinalidadeCorProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto0007` FOREIGN KEY (`tbProduto_Id`) REFERENCES `tbProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProduto_tbCorProduto`
--

LOCK TABLES `tbProduto_tbCorProduto` WRITE;
/*!40000 ALTER TABLE `tbProduto_tbCorProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProduto_tbCorProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProduto_tbDepartamentoProduto`
--

DROP TABLE IF EXISTS `tbProduto_tbDepartamentoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProduto_tbDepartamentoProduto` (
  `tbProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbDepartamentoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbProduto_Id`,`tbDepartamentoProduto_Id`),
  UNIQUE KEY `tbProduto_Id_UNIQUE` (`tbProduto_Id`),
  KEY `FK_tbDepartamentoProduto0001` (`tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbDepartamentoProduto0001` FOREIGN KEY (`tbDepartamentoProduto_Id`) REFERENCES `tbDepartamentoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto0003` FOREIGN KEY (`tbProduto_Id`) REFERENCES `tbProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProduto_tbDepartamentoProduto`
--

LOCK TABLES `tbProduto_tbDepartamentoProduto` WRITE;
/*!40000 ALTER TABLE `tbProduto_tbDepartamentoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProduto_tbDepartamentoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProduto_tbFornecedor`
--

DROP TABLE IF EXISTS `tbProduto_tbFornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProduto_tbFornecedor` (
  `tbProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbFornecedor_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbProduto_Id`,`tbFornecedor_Id`),
  CONSTRAINT `FK_tbProduto0014` FOREIGN KEY (`tbProduto_Id`) REFERENCES `tbProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProduto_tbFornecedor`
--

LOCK TABLES `tbProduto_tbFornecedor` WRITE;
/*!40000 ALTER TABLE `tbProduto_tbFornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProduto_tbFornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProduto_tbGrupoProduto`
--

DROP TABLE IF EXISTS `tbProduto_tbGrupoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProduto_tbGrupoProduto` (
  `tbProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbGrupoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbProduto_Id`,`tbGrupoProduto_Id`),
  UNIQUE KEY `tbProduto_Id_UNIQUE` (`tbProduto_Id`),
  KEY `FK_tbGrupoProduto0001` (`tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbGrupoProduto0001` FOREIGN KEY (`tbGrupoProduto_Id`) REFERENCES `tbGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto0004` FOREIGN KEY (`tbProduto_Id`) REFERENCES `tbProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProduto_tbGrupoProduto`
--

LOCK TABLES `tbProduto_tbGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbProduto_tbGrupoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProduto_tbGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProduto_tbPadroesEspessuraProduto`
--

DROP TABLE IF EXISTS `tbProduto_tbPadroesEspessuraProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProduto_tbPadroesEspessuraProduto` (
  `tbProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbPadroesEspessuraProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadePadraoEspessuraProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbProduto_Id`,`tbPadroesEspessuraProduto_Id`,`tbFinalidadePadraoEspessuraProduto_Id`),
  KEY `FK_tbPadroesEspessuraProduto0001` (`tbPadroesEspessuraProduto_Id`),
  KEY `FK_tbFinalidadePadraoEspessuraProduto0002` (`tbFinalidadePadraoEspessuraProduto_Id`),
  CONSTRAINT `FK_tbFinalidadePadraoEspessuraProduto0002` FOREIGN KEY (`tbFinalidadePadraoEspessuraProduto_Id`) REFERENCES `tbFinalidadePadraoEspessuraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesEspessuraProduto0001` FOREIGN KEY (`tbPadroesEspessuraProduto_Id`) REFERENCES `tbPadroesEspessuraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto0009` FOREIGN KEY (`tbProduto_Id`) REFERENCES `tbProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProduto_tbPadroesEspessuraProduto`
--

LOCK TABLES `tbProduto_tbPadroesEspessuraProduto` WRITE;
/*!40000 ALTER TABLE `tbProduto_tbPadroesEspessuraProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProduto_tbPadroesEspessuraProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProduto_tbPadroesLarguraProduto`
--

DROP TABLE IF EXISTS `tbProduto_tbPadroesLarguraProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProduto_tbPadroesLarguraProduto` (
  `tbProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbPadroesLarguraProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadePadraoLarguraProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbProduto_Id`,`tbPadroesLarguraProduto_Id`,`tbFinalidadePadraoLarguraProduto_Id`),
  KEY `FK_tbPadroesLarguraProduto0001` (`tbPadroesLarguraProduto_Id`),
  KEY `FK_tbFinalidadePadraoLarguraProduto0002` (`tbFinalidadePadraoLarguraProduto_Id`),
  CONSTRAINT `FK_tbFinalidadePadraoLarguraProduto0002` FOREIGN KEY (`tbFinalidadePadraoLarguraProduto_Id`) REFERENCES `tbFinalidadePadraoLarguraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesLarguraProduto0001` FOREIGN KEY (`tbPadroesLarguraProduto_Id`) REFERENCES `tbPadroesLarguraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto0008` FOREIGN KEY (`tbProduto_Id`) REFERENCES `tbProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProduto_tbPadroesLarguraProduto`
--

LOCK TABLES `tbProduto_tbPadroesLarguraProduto` WRITE;
/*!40000 ALTER TABLE `tbProduto_tbPadroesLarguraProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProduto_tbPadroesLarguraProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProduto_tbProdutoCodigo`
--

DROP TABLE IF EXISTS `tbProduto_tbProdutoCodigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProduto_tbProdutoCodigo` (
  `tbProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbProdutoCodigo_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadeCodigoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbProduto_Id`,`tbProdutoCodigo_Id`,`tbFinalidadeCodigoProduto_Id`),
  UNIQUE KEY `tbProdutoCodigo_Id_UNIQUE` (`tbProdutoCodigo_Id`),
  KEY `FK_tbFinalidadeCodigoProduto0001` (`tbFinalidadeCodigoProduto_Id`),
  CONSTRAINT `FK_tbFinalidadeCodigoProduto0001` FOREIGN KEY (`tbFinalidadeCodigoProduto_Id`) REFERENCES `tbFinalidadeCodigoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto0001` FOREIGN KEY (`tbProduto_Id`) REFERENCES `tbProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigo0001` FOREIGN KEY (`tbProdutoCodigo_Id`) REFERENCES `tbProdutoCodigo` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProduto_tbProdutoCodigo`
--

LOCK TABLES `tbProduto_tbProdutoCodigo` WRITE;
/*!40000 ALTER TABLE `tbProduto_tbProdutoCodigo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProduto_tbProdutoCodigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProduto_tbProdutoCodigoBarras`
--

DROP TABLE IF EXISTS `tbProduto_tbProdutoCodigoBarras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProduto_tbProdutoCodigoBarras` (
  `tbProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbProdutoCodigoBarras_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadeCodigoBarras_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbProduto_Id`,`tbProdutoCodigoBarras_Id`,`tbFinalidadeCodigoBarras_Id`),
  KEY `FK_tbProdutoCodigoBarras0001` (`tbProdutoCodigoBarras_Id`),
  KEY `FK_tbFinalidadeCodigoBarrasProduto0002` (`tbFinalidadeCodigoBarras_Id`),
  CONSTRAINT `FK_tbFinalidadeCodigoBarrasProduto0002` FOREIGN KEY (`tbFinalidadeCodigoBarras_Id`) REFERENCES `tbFinalidadeCodigoBarrasProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto0012` FOREIGN KEY (`tbProduto_Id`) REFERENCES `tbProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigoBarras0001` FOREIGN KEY (`tbProdutoCodigoBarras_Id`) REFERENCES `tbProdutoCodigoBarras` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProduto_tbProdutoCodigoBarras`
--

LOCK TABLES `tbProduto_tbProdutoCodigoBarras` WRITE;
/*!40000 ALTER TABLE `tbProduto_tbProdutoCodigoBarras` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProduto_tbProdutoCodigoBarras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProduto_tbProdutoDescricao`
--

DROP TABLE IF EXISTS `tbProduto_tbProdutoDescricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProduto_tbProdutoDescricao` (
  `tbProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbProdutoDescricao_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadeDescricaoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbProduto_Id`,`tbProdutoDescricao_Id`,`tbFinalidadeDescricaoProduto_Id`),
  UNIQUE KEY `tbProdutoDescricao_Id_UNIQUE` (`tbProdutoDescricao_Id`),
  KEY `FK_tbFinalidadeDescricaoProduto0001` (`tbFinalidadeDescricaoProduto_Id`),
  CONSTRAINT `FK_tbFinalidadeDescricaoProduto0001` FOREIGN KEY (`tbFinalidadeDescricaoProduto_Id`) REFERENCES `tbFinalidadeDescricaoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto0002` FOREIGN KEY (`tbProduto_Id`) REFERENCES `tbProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoDescricao0001` FOREIGN KEY (`tbProdutoDescricao_Id`) REFERENCES `tbProdutoDescricao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProduto_tbProdutoDescricao`
--

LOCK TABLES `tbProduto_tbProdutoDescricao` WRITE;
/*!40000 ALTER TABLE `tbProduto_tbProdutoDescricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProduto_tbProdutoDescricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProduto_tbProdutoUnidade`
--

DROP TABLE IF EXISTS `tbProduto_tbProdutoUnidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProduto_tbProdutoUnidade` (
  `tbProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbUnidade_Id` int(10) unsigned zerofill NOT NULL,
  `tbProdutoUnidade_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadeUnidadeProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbProduto_Id`,`tbUnidade_Id`,`tbProdutoUnidade_Id`,`tbFinalidadeUnidadeProduto_Id`),
  UNIQUE KEY `tbProduto_Id_UNIQUE` (`tbProduto_Id`),
  UNIQUE KEY `tbProdutoUnidade_Id_UNIQUE` (`tbProdutoUnidade_Id`),
  KEY `FK_tbFinalidadeUnidadeProduto0001` (`tbFinalidadeUnidadeProduto_Id`),
  KEY `FK_tbUnidade0004` (`tbUnidade_Id`),
  CONSTRAINT `FK_tbFinalidadeUnidadeProduto0001` FOREIGN KEY (`tbFinalidadeUnidadeProduto_Id`) REFERENCES `tbFinalidadeUnidadeProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto0011` FOREIGN KEY (`tbProduto_Id`) REFERENCES `tbProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoUnidade0001` FOREIGN KEY (`tbProdutoUnidade_Id`) REFERENCES `tbProdutoUnidade` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0004` FOREIGN KEY (`tbUnidade_Id`) REFERENCES `tbUnidade` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProduto_tbProdutoUnidade`
--

LOCK TABLES `tbProduto_tbProdutoUnidade` WRITE;
/*!40000 ALTER TABLE `tbProduto_tbProdutoUnidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProduto_tbProdutoUnidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProduto_tbSubGrupoProduto`
--

DROP TABLE IF EXISTS `tbProduto_tbSubGrupoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProduto_tbSubGrupoProduto` (
  `tbProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbSubGrupoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbProduto_Id`,`tbSubGrupoProduto_Id`),
  UNIQUE KEY `tbProduto_Id_UNIQUE` (`tbProduto_Id`),
  KEY `FK_tbSubGrupoProduto0001` (`tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbProduto00005` FOREIGN KEY (`tbProduto_Id`) REFERENCES `tbProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0001` FOREIGN KEY (`tbSubGrupoProduto_Id`) REFERENCES `tbSubGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProduto_tbSubGrupoProduto`
--

LOCK TABLES `tbProduto_tbSubGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbProduto_tbSubGrupoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProduto_tbSubGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbProduto_tbTipoProduto`
--

DROP TABLE IF EXISTS `tbProduto_tbTipoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbProduto_tbTipoProduto` (
  `tbProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbTipoProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbFinalidadeTipoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbProduto_Id`,`tbTipoProduto_Id`,`tbFinalidadeTipoProduto_Id`),
  KEY `FK_tbTipoProduto0001` (`tbTipoProduto_Id`),
  KEY `FK_FinalidadeTipoProduto0001` (`tbFinalidadeTipoProduto_Id`),
  CONSTRAINT `FK_FinalidadeTipoProduto0001` FOREIGN KEY (`tbFinalidadeTipoProduto_Id`) REFERENCES `tbFinalidadeTipoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto0010` FOREIGN KEY (`tbProduto_Id`) REFERENCES `tbProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbTipoProduto0001` FOREIGN KEY (`tbTipoProduto_Id`) REFERENCES `tbTipoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbProduto_tbTipoProduto`
--

LOCK TABLES `tbProduto_tbTipoProduto` WRITE;
/*!40000 ALTER TABLE `tbProduto_tbTipoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbProduto_tbTipoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbRegiao`
--

DROP TABLE IF EXISTS `tbRegiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbRegiao` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Regiao` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbRegiao`
--

LOCK TABLES `tbRegiao` WRITE;
/*!40000 ALTER TABLE `tbRegiao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbRegiao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbRegimeApuracao`
--

DROP TABLE IF EXISTS `tbRegimeApuracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbRegimeApuracao` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `RegimeApuracao` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbRegimeApuracao`
--

LOCK TABLES `tbRegimeApuracao` WRITE;
/*!40000 ALTER TABLE `tbRegimeApuracao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbRegimeApuracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbSubGrupoProduto`
--

DROP TABLE IF EXISTS `tbSubGrupoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbSubGrupoProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `SubGrupoProduto` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbSubGrupoProduto`
--

LOCK TABLES `tbSubGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbSubGrupoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbSubGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbSubGrupoProduto_tbDepartamentoProduto`
--

DROP TABLE IF EXISTS `tbSubGrupoProduto_tbDepartamentoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbSubGrupoProduto_tbDepartamentoProduto` (
  `tbSubGrupoProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbDepartamentoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbSubGrupoProduto_Id`,`tbDepartamentoProduto_Id`),
  KEY `FK_tbDepartamentoProduto0003` (`tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbDepartamentoProduto0003` FOREIGN KEY (`tbDepartamentoProduto_Id`) REFERENCES `tbDepartamentoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0003` FOREIGN KEY (`tbSubGrupoProduto_Id`) REFERENCES `tbSubGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbSubGrupoProduto_tbDepartamentoProduto`
--

LOCK TABLES `tbSubGrupoProduto_tbDepartamentoProduto` WRITE;
/*!40000 ALTER TABLE `tbSubGrupoProduto_tbDepartamentoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbSubGrupoProduto_tbDepartamentoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbSubGrupoProduto_tbGrupoProduto`
--

DROP TABLE IF EXISTS `tbSubGrupoProduto_tbGrupoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbSubGrupoProduto_tbGrupoProduto` (
  `tbSubGrupoProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbGrupoProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbSubGrupoProduto_Id`,`tbGrupoProduto_Id`),
  KEY `FK_tbGrupoProduto0003` (`tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbGrupoProduto0003` FOREIGN KEY (`tbGrupoProduto_Id`) REFERENCES `tbGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0002` FOREIGN KEY (`tbSubGrupoProduto_Id`) REFERENCES `tbSubGrupoProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbSubGrupoProduto_tbGrupoProduto`
--

LOCK TABLES `tbSubGrupoProduto_tbGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbSubGrupoProduto_tbGrupoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbSubGrupoProduto_tbGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbTipoLogradouro`
--

DROP TABLE IF EXISTS `tbTipoLogradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbTipoLogradouro` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Abreviacao` varchar(4) NOT NULL,
  `TipoLogradouro` varchar(120) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbTipoLogradouro`
--

LOCK TABLES `tbTipoLogradouro` WRITE;
/*!40000 ALTER TABLE `tbTipoLogradouro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbTipoLogradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbTipoProduto`
--

DROP TABLE IF EXISTS `tbTipoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbTipoProduto` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `TipoProduto` varchar(45) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbTipoProduto`
--

LOCK TABLES `tbTipoProduto` WRITE;
/*!40000 ALTER TABLE `tbTipoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbTipoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbUnidade`
--

DROP TABLE IF EXISTS `tbUnidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbUnidade` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Abreviacao` varchar(3) NOT NULL,
  `Unidade` varchar(45) NOT NULL,
  `UtilizacaoProdutoProdutos` bit(1) NOT NULL,
  `UtilizacaoProdutoCodigoBarrasProdutos` bit(1) NOT NULL,
  `UtilizacaoProdutoPadraoLargura` bit(1) NOT NULL,
  `UtilizacaoProdutoPadraoEspessura` bit(1) NOT NULL,
  `UtilizacaoProdutoPesoLiquido` bit(1) NOT NULL,
  `UtilizacaoProdutoPesoBruto` bit(1) NOT NULL,
  `UtilizacaoVendasQuantMinPedidoVenda` bit(1) NOT NULL,
  `UtilizacaoVendasQuantMaxPedidoVenda` bit(1) NOT NULL,
  `UtilizacaoVendasTabelaPrecos` bit(1) NOT NULL,
  `UtilizacaoComprasQuantMinPedidoCompra` bit(1) NOT NULL,
  `UtilizacaoComprasQuantMaxPedidoCompra` bit(1) NOT NULL,
  `UtilizacaoComprasAnaliseComparativaPedidoCompra` bit(1) NOT NULL,
  `UtilizacaoComprasAnaliseComparativaEstoque` bit(1) NOT NULL,
  `UtilizacaoFaturamentoCupomFiscal` bit(1) NOT NULL,
  `UtilizacaoFaturamentoNFCe` bit(1) NOT NULL,
  `UtilizacaoFaturamentoNFeVenda` bit(1) NOT NULL,
  `UtilizacaoFaturamentoNFeDevolucao` bit(1) NOT NULL,
  `UtilizacaoFaturamentoNFeBeneficiamento` bit(1) NOT NULL,
  `UtilizacaoFaturamentoNFSe` bit(1) NOT NULL,
  `SystemIncludeDateTime` datetime NOT NULL,
  `SystemChangeDateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbUnidade`
--

LOCK TABLES `tbUnidade` WRITE;
/*!40000 ALTER TABLE `tbUnidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbUnidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbUsuario_tbCliente`
--

DROP TABLE IF EXISTS `tbUsuario_tbCliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbUsuario_tbCliente` (
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbCliente_Id` int(10) unsigned zerofill NOT NULL,
  `tbClienteContato_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbUsuario_Id`,`tbCliente_Id`,`tbClienteContato_Id`),
  UNIQUE KEY `tbUsuario_Id_UNIQUE` (`tbUsuario_Id`),
  UNIQUE KEY `tbClienteContato_Id_UNIQUE` (`tbClienteContato_Id`),
  CONSTRAINT `FK_tbUsuario0042` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbUsuario_tbCliente`
--

LOCK TABLES `tbUsuario_tbCliente` WRITE;
/*!40000 ALTER TABLE `tbUsuario_tbCliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbUsuario_tbCliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbUsuario_tbFornecedor`
--

DROP TABLE IF EXISTS `tbUsuario_tbFornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbUsuario_tbFornecedor` (
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbFornecedor_Id` int(10) unsigned zerofill NOT NULL,
  `tbFornecedorContato_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbUsuario_Id`,`tbFornecedor_Id`,`tbFornecedorContato_Id`),
  UNIQUE KEY `tbUsuario_Id_UNIQUE` (`tbUsuario_Id`),
  UNIQUE KEY `tbFornecedorContato_Id_UNIQUE` (`tbFornecedorContato_Id`),
  CONSTRAINT `FK_tbUsuario0043` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbUsuario_tbFornecedor`
--

LOCK TABLES `tbUsuario_tbFornecedor` WRITE;
/*!40000 ALTER TABLE `tbUsuario_tbFornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbUsuario_tbFornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbUsuario_tbFuncionario`
--

DROP TABLE IF EXISTS `tbUsuario_tbFuncionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbUsuario_tbFuncionario` (
  `tbUsuario_Id` int(10) unsigned zerofill NOT NULL,
  `tbFuncionario_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbUsuario_Id`,`tbFuncionario_Id`),
  UNIQUE KEY `tbUsuario_Id_UNIQUE` (`tbUsuario_Id`),
  UNIQUE KEY `tbFuncionario_Id_UNIQUE` (`tbFuncionario_Id`),
  CONSTRAINT `FK_tbUsuario0041` FOREIGN KEY (`tbUsuario_Id`) REFERENCES `golivecentral`.`tbUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbUsuario_tbFuncionario`
--

LOCK TABLES `tbUsuario_tbFuncionario` WRITE;
/*!40000 ALTER TABLE `tbUsuario_tbFuncionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbUsuario_tbFuncionario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-01 17:34:24
