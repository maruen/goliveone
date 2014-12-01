-- MySQL dump 10.13  Distrib 5.6.20, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: golivetest
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
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoria`
--

LOCK TABLES `tbAuditoria` WRITE;
/*!40000 ALTER TABLE `tbAuditoria` DISABLE KEYS */;
INSERT INTO `tbAuditoria` VALUES (0000000001,'label.cadastroDepartamento','Inserção',NULL,'2014-11-04 17:45:24','2014-11-04 17:45:24'),(0000000002,'label.cadastroDepartamento','Inserção',NULL,'2014-11-04 17:45:38','2014-11-04 17:45:38'),(0000000003,'label.gruposDeProdutos','Inserção',NULL,'2014-11-04 17:46:03','2014-11-04 17:46:03'),(0000000004,'label.cadastroDepartamento','Atualização',NULL,'2014-11-04 17:46:30','2014-11-04 17:46:30'),(0000000005,'label.gruposDeProdutos','Inserção',NULL,'2014-11-04 17:47:13','2014-11-04 17:47:13'),(0000000006,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-04 17:47:57','2014-11-04 17:47:57'),(0000000007,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-04 17:48:29','2014-11-04 17:48:29'),(0000000008,'label.colecoes','Inserção',NULL,'2014-11-04 17:49:41','2014-11-04 17:49:41'),(0000000009,'label.cadastroCores','Inserção',NULL,'2014-11-04 17:50:37','2014-11-04 17:50:37'),(0000000010,'label.colecoes','Inserção',NULL,'2014-11-04 17:51:07','2014-11-04 17:51:07'),(0000000011,'label.cadastroCores','Inserção',NULL,'2014-11-04 17:51:57','2014-11-04 17:51:57'),(0000000012,'label.cadastroCores','Exclusão',NULL,'2014-11-04 17:52:08','2014-11-04 17:52:08'),(0000000013,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-04 17:52:30','2014-11-04 17:52:30'),(0000000014,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-04 17:52:59','2014-11-04 17:52:59'),(0000000017,'label.cadastroDepartamento','Inserção',NULL,'2014-11-04 18:04:21','2014-11-04 18:04:21'),(0000000018,'label.cadastroDepartamento','Inserção',NULL,'2014-11-04 18:04:36','2014-11-04 18:04:36'),(0000000019,'label.cadastroDepartamento','Atualização',NULL,'2014-11-04 18:05:10','2014-11-04 18:05:10'),(0000000020,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-04 18:05:31','2014-11-04 18:05:31'),(0000000021,'label.cadastroDepartamento','Inserção',NULL,'2014-11-04 18:06:37','2014-11-04 18:06:37'),(0000000022,'label.cadastroDepartamento','Atualização',NULL,'2014-11-04 18:06:44','2014-11-04 18:06:44'),(0000000023,'label.cadastroDepartamento','Atualização',NULL,'2014-11-04 18:06:58','2014-11-04 18:06:58'),(0000000024,'label.gruposDeProdutos','Inserção',NULL,'2014-11-04 18:11:12','2014-11-04 18:11:12'),(0000000025,'label.gruposDeProdutos','Inserção',NULL,'2014-11-04 18:11:53','2014-11-04 18:11:53'),(0000000026,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-04 18:12:06','2014-11-04 18:12:06'),(0000000027,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-04 18:12:28','2014-11-04 18:12:28'),(0000000028,'label.gruposDeProdutos','Atualização',NULL,'2014-11-04 18:14:25','2014-11-04 18:14:25'),(0000000029,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-04 18:14:46','2014-11-04 18:14:46'),(0000000030,'label.gruposDeProdutos','Inserção',NULL,'2014-11-04 18:15:38','2014-11-04 18:15:38'),(0000000031,'label.gruposDeProdutos','Atualização',NULL,'2014-11-04 18:15:59','2014-11-04 18:15:59'),(0000000032,'label.gruposDeProdutos','Atualização',NULL,'2014-11-04 18:16:17','2014-11-04 18:16:17'),(0000000033,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-04 18:17:21','2014-11-04 18:17:21'),(0000000034,'label.gruposDeProdutos','Inserção',NULL,'2014-11-04 18:18:14','2014-11-04 18:18:14'),(0000000035,'label.gruposDeProdutos','Inserção',NULL,'2014-11-04 18:18:28','2014-11-04 18:18:28'),(0000000036,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-04 18:18:43','2014-11-04 18:18:43'),(0000000037,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-04 18:19:03','2014-11-04 18:19:03'),(0000000038,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-04 18:19:28','2014-11-04 18:19:28'),(0000000040,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-04 18:20:05','2014-11-04 18:20:05'),(0000000043,'label.cadastroSubGrupoProduto','Atualização',NULL,'2014-11-04 18:22:23','2014-11-04 18:22:23'),(0000000044,'label.cadastroDepartamento','Atualização',NULL,'2014-11-04 18:22:46','2014-11-04 18:22:46'),(0000000046,'label.cadastroSubGrupoProduto','Exclusão',NULL,'2014-11-04 18:24:08','2014-11-04 18:24:08'),(0000000047,'label.colecoes','Inserção',NULL,'2014-11-04 18:25:14','2014-11-04 18:25:14'),(0000000048,'label.colecoes','Inserção',NULL,'2014-11-04 18:25:37','2014-11-04 18:25:37'),(0000000049,'label.colecoes','Inserção',NULL,'2014-11-04 18:26:32','2014-11-04 18:26:32'),(0000000050,'label.colecoes','Atualização',NULL,'2014-11-04 18:27:05','2014-11-04 18:27:05'),(0000000051,'label.colecoes','Atualização',NULL,'2014-11-04 18:27:22','2014-11-04 18:27:22'),(0000000052,'label.colecoes','Atualização',NULL,'2014-11-04 18:27:55','2014-11-04 18:27:55'),(0000000053,'label.colecoes','Atualização',NULL,'2014-11-04 18:28:22','2014-11-04 18:28:22'),(0000000054,'label.colecoes','Exclusão',NULL,'2014-11-04 18:28:47','2014-11-04 18:28:47'),(0000000055,'label.cadastroCores','Inserção',NULL,'2014-11-04 18:30:06','2014-11-04 18:30:06'),(0000000056,'label.cadastroCores','Inserção',NULL,'2014-11-04 18:30:36','2014-11-04 18:30:36'),(0000000057,'label.cadastroCores','Inserção',NULL,'2014-11-04 18:30:58','2014-11-04 18:30:58'),(0000000058,'label.cadastroCores','Atualização',NULL,'2014-11-04 18:31:23','2014-11-04 18:31:23'),(0000000059,'label.cadastroCores','Atualização',NULL,'2014-11-04 18:33:24','2014-11-04 18:33:24'),(0000000060,'label.cadastroCores','Exclusão',NULL,'2014-11-04 18:33:32','2014-11-04 18:33:32'),(0000000061,'label.cadastroDepartamento','Inserção',NULL,'2014-11-04 18:38:09','2014-11-04 18:38:09'),(0000000062,'label.cadastroDepartamento','Atualização',NULL,'2014-11-04 18:38:21','2014-11-04 18:38:21'),(0000000063,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-04 18:38:32','2014-11-04 18:38:32'),(0000000064,'label.cadastroDepartamento','Inserção',NULL,'2014-11-04 18:38:41','2014-11-04 18:38:41'),(0000000065,'label.gruposDeProdutos','Inserção',NULL,'2014-11-04 18:39:26','2014-11-04 18:39:26'),(0000000066,'label.gruposDeProdutos','Atualização',NULL,'2014-11-04 18:39:38','2014-11-04 18:39:38'),(0000000067,'label.gruposDeProdutos','Atualização',NULL,'2014-11-04 18:39:53','2014-11-04 18:39:53'),(0000000068,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-04 18:40:02','2014-11-04 18:40:02'),(0000000069,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-04 18:40:37','2014-11-04 18:40:37'),(0000000070,'label.cadastroSubGrupoProduto','Atualização',NULL,'2014-11-04 18:40:59','2014-11-04 18:40:59'),(0000000072,'label.colecoes','Inserção',NULL,'2014-11-04 18:41:49','2014-11-04 18:41:49'),(0000000073,'label.cadastroCores','Inserção',NULL,'2014-11-04 18:42:33','2014-11-04 18:42:33'),(0000000074,'label.colecoes','Inserção',NULL,'2014-11-04 18:42:56','2014-11-04 18:42:56'),(0000000075,'label.cadastroCores','Inserção',NULL,'2014-11-04 18:43:36','2014-11-04 18:43:36'),(0000000076,'label.cadastroCores','Atualização',NULL,'2014-11-04 18:43:48','2014-11-04 18:43:48'),(0000000077,'label.cadastroDepartamento','Inserção',NULL,'2014-11-04 19:46:00','2014-11-04 19:46:00'),(0000000078,'label.cadastroDepartamento','Atualização',NULL,'2014-11-04 19:46:16','2014-11-04 19:46:16'),(0000000079,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-04 19:46:24','2014-11-04 19:46:24'),(0000000080,'label.cadastroDepartamento','Inserção',NULL,'2014-11-04 19:46:34','2014-11-04 19:46:34'),(0000000081,'label.gruposDeProdutos','Inserção',NULL,'2014-11-04 19:47:08','2014-11-04 19:47:08'),(0000000082,'label.gruposDeProdutos','Inserção',NULL,'2014-11-04 19:49:27','2014-11-04 19:49:27'),(0000000083,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-04 19:50:57','2014-11-04 19:50:57'),(0000000084,'label.colecoes','Inserção',NULL,'2014-11-04 19:53:56','2014-11-04 19:53:56'),(0000000085,'label.cadastroCores','Inserção',NULL,'2014-11-04 19:56:11','2014-11-04 19:56:11'),(0000000086,'label.cadastroDepartamento','Inserção',NULL,'2014-11-05 16:52:36','2014-11-05 16:52:36'),(0000000087,'label.cadastroDepartamento','Atualização',NULL,'2014-11-05 16:52:56','2014-11-05 16:52:56'),(0000000088,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-05 16:53:16','2014-11-05 16:53:16'),(0000000089,'label.cadastroDepartamento','Inserção',NULL,'2014-11-05 16:53:41','2014-11-05 16:53:41'),(0000000090,'label.gruposDeProdutos','Inserção',NULL,'2014-11-05 16:54:58','2014-11-05 16:54:58'),(0000000091,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-05 16:58:04','2014-11-05 16:58:04'),(0000000092,'label.cadastroDepartamento','Inserção',NULL,'2014-11-05 17:23:03','2014-11-05 17:23:03'),(0000000093,'label.gruposDeProdutos','Inserção',NULL,'2014-11-05 17:23:55','2014-11-05 17:23:55'),(0000000094,'label.colecoes','Inserção',NULL,'2014-11-05 17:25:15','2014-11-05 17:25:15'),(0000000095,'label.cadastroCores','Inserção',NULL,'2014-11-05 17:26:11','2014-11-05 17:26:11'),(0000000096,'label.colecoes','Inserção',NULL,'2014-11-07 17:29:19','2014-11-07 17:29:19'),(0000000097,'label.colecoes','Atualização',NULL,'2014-11-07 18:02:10','2014-11-07 18:02:10'),(0000000098,'label.colecoes','Atualização',NULL,'2014-11-07 18:02:21','2014-11-07 18:02:21'),(0000000099,'label.cadastroCores','Atualização',NULL,'2014-11-07 18:02:37','2014-11-07 18:02:37'),(0000000100,'label.colecoes','Atualização',NULL,'2014-11-10 16:05:13','2014-11-10 16:05:13'),(0000000101,'label.colecoes','Atualização',NULL,'2014-11-10 16:08:43','2014-11-10 16:08:43'),(0000000102,'label.colecoes','Atualização',NULL,'2014-11-10 16:09:17','2014-11-10 16:09:17'),(0000000104,'label.colecoes','Atualização',NULL,'2014-11-10 16:12:32','2014-11-10 16:12:32'),(0000000105,'label.colecoes','Atualização',NULL,'2014-11-10 16:14:55','2014-11-10 16:14:55'),(0000000106,'label.colecoes','Inserção',NULL,'2014-11-10 16:16:34','2014-11-10 16:16:34'),(0000000107,'label.colecoes','Atualização',NULL,'2014-11-10 16:21:55','2014-11-10 16:21:55'),(0000000108,'label.colecoes','Atualização',NULL,'2014-11-10 16:23:43','2014-11-10 16:23:43'),(0000000109,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-10 16:24:50','2014-11-10 16:24:50'),(0000000110,'label.colecoes','Atualização',NULL,'2014-11-10 16:25:00','2014-11-10 16:25:00'),(0000000111,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-10 16:25:57','2014-11-10 16:25:57'),(0000000112,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-10 16:30:03','2014-11-10 16:30:03'),(0000000113,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-10 16:36:12','2014-11-10 16:36:12'),(0000000114,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-10 16:37:05','2014-11-10 16:37:05'),(0000000115,'label.colecoes','Inserção',NULL,'2014-11-10 16:37:41','2014-11-10 16:37:41'),(0000000116,'label.gruposDeProdutos','Inserção',NULL,'2014-11-10 16:56:36','2014-11-10 16:56:36'),(0000000117,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-10 16:57:25','2014-11-10 16:57:25'),(0000000118,'label.cadastroDepartamento','Inserção',NULL,'2014-11-10 16:57:51','2014-11-10 16:57:51'),(0000000119,'label.cadastroDepartamento','Inserção',NULL,'2014-11-10 16:57:57','2014-11-10 16:57:57'),(0000000120,'label.cadastroDepartamento','Inserção',NULL,'2014-11-10 16:58:02','2014-11-10 16:58:02'),(0000000121,'label.cadastroDepartamento','Inserção',NULL,'2014-11-10 16:58:08','2014-11-10 16:58:08'),(0000000122,'label.cadastroDepartamento','Inserção',NULL,'2014-11-10 16:58:17','2014-11-10 16:58:17'),(0000000123,'label.cadastroDepartamento','Inserção',NULL,'2014-11-10 16:58:37','2014-11-10 16:58:37'),(0000000124,'label.cadastroDepartamento','Inserção',NULL,'2014-11-10 16:58:43','2014-11-10 16:58:43'),(0000000125,'label.cadastroDepartamento','Inserção',NULL,'2014-11-10 16:58:49','2014-11-10 16:58:49'),(0000000126,'label.cadastroDepartamento','Inserção',NULL,'2014-11-10 16:59:00','2014-11-10 16:59:00'),(0000000127,'label.cadastroDepartamento','Inserção',NULL,'2014-11-10 16:59:06','2014-11-10 16:59:06'),(0000000128,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-10 16:59:15','2014-11-10 16:59:15'),(0000000129,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-10 16:59:22','2014-11-10 16:59:22'),(0000000130,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-10 16:59:30','2014-11-10 16:59:30'),(0000000131,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-10 16:59:38','2014-11-10 16:59:38'),(0000000132,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-10 16:59:45','2014-11-10 16:59:45'),(0000000133,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-10 16:59:53','2014-11-10 16:59:53'),(0000000134,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-10 17:00:01','2014-11-10 17:00:01'),(0000000135,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-10 17:00:08','2014-11-10 17:00:08'),(0000000136,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-10 17:00:16','2014-11-10 17:00:16'),(0000000137,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-10 17:00:23','2014-11-10 17:00:23'),(0000000138,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-10 17:03:26','2014-11-10 17:03:26'),(0000000139,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-10 17:03:55','2014-11-10 17:03:55'),(0000000140,'label.cadastroSubGrupoProduto','Exclusão',NULL,'2014-11-10 17:04:07','2014-11-10 17:04:07'),(0000000141,'label.cadastroSubGrupoProduto','Exclusão',NULL,'2014-11-10 17:04:23','2014-11-10 17:04:23'),(0000000142,'label.cadastroSubGrupoProduto','Exclusão',NULL,'2014-11-10 17:04:35','2014-11-10 17:04:35'),(0000000143,'label.cadastroSubGrupoProduto','Exclusão',NULL,'2014-11-10 17:04:57','2014-11-10 17:04:57'),(0000000144,'label.cadastroSubGrupoProduto','Exclusão',NULL,'2014-11-10 17:05:09','2014-11-10 17:05:09'),(0000000145,'label.cadastroSubGrupoProduto','Exclusão',NULL,'2014-11-10 17:05:30','2014-11-10 17:05:30'),(0000000146,'label.cadastroSubGrupoProduto','Exclusão',NULL,'2014-11-10 17:05:40','2014-11-10 17:05:40'),(0000000147,'label.cadastroSubGrupoProduto','Exclusão',NULL,'2014-11-10 17:05:56','2014-11-10 17:05:56'),(0000000148,'label.cadastroSubGrupoProduto','Exclusão',NULL,'2014-11-10 17:06:07','2014-11-10 17:06:07'),(0000000150,'label.cadastroSubGrupoProduto','Atualização',NULL,'2014-11-10 17:11:31','2014-11-10 17:11:31'),(0000000151,'label.cadastroSubGrupoProduto','Atualização',NULL,'2014-11-10 17:11:47','2014-11-10 17:11:47'),(0000000152,'label.cadastroSubGrupoProduto','Atualização',NULL,'2014-11-10 17:13:30','2014-11-10 17:13:30'),(0000000153,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-10 17:13:51','2014-11-10 17:13:51'),(0000000154,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-10 17:21:07','2014-11-10 17:21:07'),(0000000155,'label.cadastroSubGrupoProduto','Inserção',NULL,'2014-11-10 17:22:36','2014-11-10 17:22:36'),(0000000156,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-10 17:24:59','2014-11-10 17:24:59'),(0000000158,'label.cadastroDepartamento','Atualização',NULL,'2014-11-10 17:30:13','2014-11-10 17:30:13'),(0000000159,'label.cadastroDepartamento','Atualização',NULL,'2014-11-10 17:30:24','2014-11-10 17:30:24'),(0000000160,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-10 17:33:06','2014-11-10 17:33:06'),(0000000162,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-10 17:33:23','2014-11-10 17:33:23'),(0000000165,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-10 17:34:00','2014-11-10 17:34:00'),(0000000171,'label.gruposDeProdutos','Inserção',NULL,'2014-11-10 17:34:57','2014-11-10 17:34:57'),(0000000172,'label.gruposDeProdutos','Inserção',NULL,'2014-11-10 17:35:10','2014-11-10 17:35:10'),(0000000173,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-10 17:35:32','2014-11-10 17:35:32'),(0000000174,'label.gruposDeProdutos','Inserção',NULL,'2014-11-10 17:35:48','2014-11-10 17:35:48'),(0000000175,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-10 17:35:58','2014-11-10 17:35:58'),(0000000176,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-10 17:36:06','2014-11-10 17:36:06'),(0000000177,'label.cadastroSubGrupoProduto','Atualização',NULL,'2014-11-10 17:40:19','2014-11-10 17:40:19'),(0000000178,'label.cadastroSubGrupoProduto','Atualização',NULL,'2014-11-10 17:40:31','2014-11-10 17:40:31'),(0000000179,'label.cadastroSubGrupoProduto','Atualização',NULL,'2014-11-10 17:40:43','2014-11-10 17:40:43'),(0000000180,'label.cadastroSubGrupoProduto','Exclusão',NULL,'2014-11-10 17:47:26','2014-11-10 17:47:26'),(0000000181,'label.cadastroSubGrupoProduto','Exclusão',NULL,'2014-11-10 17:47:46','2014-11-10 17:47:46'),(0000000182,'label.cadastroSubGrupoProduto','Exclusão',NULL,'2014-11-10 17:47:53','2014-11-10 17:47:53'),(0000000183,'label.colecoes','Atualização',NULL,'2014-11-11 10:33:42','2014-11-11 10:33:42'),(0000000184,'label.colecoes','Inserção',NULL,'2014-11-11 10:34:12','2014-11-11 10:34:12'),(0000000185,'label.colecoes','Atualização',NULL,'2014-11-11 10:40:46','2014-11-11 10:40:46'),(0000000186,'label.colecoes','Exclusão',NULL,'2014-11-11 10:42:01','2014-11-11 10:42:01'),(0000000189,'label.colecoes','Exclusão',NULL,'2014-11-11 10:43:15','2014-11-11 10:43:15'),(0000000190,'label.cadastroSubGrupoProduto','Exclusão',NULL,'2014-11-11 10:48:55','2014-11-11 10:48:55'),(0000000191,'label.colecoes','Exclusão',NULL,'2014-11-11 10:53:39','2014-11-11 10:53:39'),(0000000192,'label.cadastroCores','Inserção',NULL,'2014-11-11 11:12:58','2014-11-11 11:12:58'),(0000000193,'label.cadastroCores','Atualização',NULL,'2014-11-11 11:15:10','2014-11-11 11:15:10'),(0000000194,'label.colecoes','Exclusão',NULL,'2014-11-11 11:15:41','2014-11-11 11:15:41'),(0000000195,'label.colecoes','Exclusão',NULL,'2014-11-11 11:15:54','2014-11-11 11:15:54'),(0000000196,'label.colecoes','Exclusão',NULL,'2014-11-11 11:16:16','2014-11-11 11:16:16'),(0000000197,'label.colecoes','Exclusão',NULL,'2014-11-11 11:16:25','2014-11-11 11:16:25'),(0000000198,'label.colecoes','Exclusão',NULL,'2014-11-11 11:16:35','2014-11-11 11:16:35'),(0000000200,'label.colecoes','Atualização',NULL,'2014-11-11 11:18:45','2014-11-11 11:18:45'),(0000000201,'label.colecoes','Exclusão',NULL,'2014-11-11 11:19:53','2014-11-11 11:19:53'),(0000000202,'label.cadastroDepartamento','Inserção',NULL,'2014-11-11 12:02:18','2014-11-11 12:02:18'),(0000000203,'label.cadastroDepartamento','Inserção',NULL,'2014-11-11 12:02:28','2014-11-11 12:02:28'),(0000000204,'label.cadastroDepartamento','Inserção',NULL,'2014-11-11 12:02:34','2014-11-11 12:02:34'),(0000000205,'label.cadastroDepartamento','Atualização',NULL,'2014-11-11 12:02:44','2014-11-11 12:02:44'),(0000000206,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-11 12:02:50','2014-11-11 12:02:50'),(0000000207,'label.cadastroDepartamento','Exclusão',NULL,'2014-11-11 12:02:58','2014-11-11 12:02:58'),(0000000208,'label.gruposDeProdutos','Inserção',NULL,'2014-11-11 12:04:30','2014-11-11 12:04:30'),(0000000209,'label.gruposDeProdutos','Inserção',NULL,'2014-11-11 12:04:52','2014-11-11 12:04:52'),(0000000210,'label.gruposDeProdutos','Atualização',NULL,'2014-11-11 12:05:03','2014-11-11 12:05:03'),(0000000211,'label.gruposDeProdutos','Atualização',NULL,'2014-11-11 12:05:12','2014-11-11 12:05:12'),(0000000212,'label.gruposDeProdutos','Atualização',NULL,'2014-11-11 12:08:18','2014-11-11 12:08:18'),(0000000213,'label.gruposDeProdutos','Atualização',NULL,'2014-11-11 12:08:29','2014-11-11 12:08:29'),(0000000214,'label.gruposDeProdutos','Atualização',NULL,'2014-11-11 12:08:37','2014-11-11 12:08:37'),(0000000215,'label.gruposDeProdutos','Atualização',NULL,'2014-11-11 12:11:35','2014-11-11 12:11:35'),(0000000216,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-11 12:11:44','2014-11-11 12:11:44'),(0000000217,'label.gruposDeProdutos','Atualização',NULL,'2014-11-11 12:17:48','2014-11-11 12:17:48'),(0000000218,'label.gruposDeProdutos','Atualização',NULL,'2014-11-11 12:17:57','2014-11-11 12:17:57'),(0000000219,'label.gruposDeProdutos','Atualização',NULL,'2014-11-11 12:18:11','2014-11-11 12:18:11'),(0000000220,'label.gruposDeProdutos','Atualização',NULL,'2014-11-11 12:18:28','2014-11-11 12:18:28'),(0000000221,'label.gruposDeProdutos','Atualização',NULL,'2014-11-11 12:18:50','2014-11-11 12:18:50'),(0000000222,'label.departamento','Atualização',NULL,'2014-11-11 18:13:48','2014-11-11 18:13:48'),(0000000223,'label.gruposDeProdutos','Atualização',NULL,'2014-11-11 18:19:36','2014-11-11 18:19:36'),(0000000224,'label.subgrupoDeProdutos','Atualização',NULL,'2014-11-11 18:21:58','2014-11-11 18:21:58'),(0000000225,'label.colecoes','Atualização',NULL,'2014-11-11 18:22:54','2014-11-11 18:22:54'),(0000000226,'label.departamento','Inserção',NULL,'2014-11-11 18:38:51','2014-11-11 18:38:51'),(0000000227,'label.departamento','Inserção',NULL,'2014-11-11 18:38:58','2014-11-11 18:38:58'),(0000000228,'label.cadastroUnidade','Inserção',NULL,'2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000229,'label.cadastroPadroesLargura','Inserção',NULL,'2014-11-27 10:50:00','2014-11-27 10:50:00'),(0000000230,'label.cadastroPadroesEspessura','Inserção',NULL,'2014-11-27 10:50:30','2014-11-27 10:50:30'),(0000000231,'label.cadastroTipoProduto','Inserção',NULL,'2014-11-27 10:50:41','2014-11-27 10:50:41'),(0000000232,'label.cadastroUnidade','Inserção',NULL,'2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000233,'label.cadastroUnidade','Atualização',NULL,'2014-11-27 13:22:03','2014-11-27 13:22:03'),(0000000234,'label.cadastroUnidade','Atualização',NULL,'2014-11-27 13:22:25','2014-11-27 13:22:25'),(0000000235,'label.colecoes','Inserção',NULL,'2014-11-27 13:28:53','2014-11-27 13:28:53'),(0000000236,'label.departamento','Inserção',NULL,'2014-11-27 14:35:31','2014-11-27 14:35:31'),(0000000237,'label.departamento','Atualização',NULL,'2014-11-27 14:35:47','2014-11-27 14:35:47'),(0000000238,'label.departamento','Atualização',NULL,'2014-11-27 14:36:09','2014-11-27 14:36:09'),(0000000239,'label.departamento','Exclusão',NULL,'2014-11-27 14:36:22','2014-11-27 14:36:22'),(0000000241,'label.gruposDeProdutos','Inserção',NULL,'2014-11-27 14:38:03','2014-11-27 14:38:03'),(0000000242,'label.gruposDeProdutos','Atualização',NULL,'2014-11-27 14:38:27','2014-11-27 14:38:27'),(0000000243,'label.gruposDeProdutos','Inserção',NULL,'2014-11-27 14:38:51','2014-11-27 14:38:51'),(0000000244,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-27 14:38:58','2014-11-27 14:38:58'),(0000000245,'label.subgrupoDeProdutos','Inserção',NULL,'2014-11-27 14:39:56','2014-11-27 14:39:56'),(0000000246,'label.subgrupoDeProdutos','Inserção',NULL,'2014-11-27 14:40:23','2014-11-27 14:40:23'),(0000000247,'label.subgrupoDeProdutos','Atualização',NULL,'2014-11-27 14:40:45','2014-11-27 14:40:45'),(0000000248,'label.subgrupoDeProdutos','Exclusão',NULL,'2014-11-27 14:40:59','2014-11-27 14:40:59'),(0000000249,'label.subgrupoDeProdutos','Atualização',NULL,'2014-11-27 14:41:20','2014-11-27 14:41:20'),(0000000250,'label.colecoes','Atualização',NULL,'2014-11-27 14:42:23','2014-11-27 14:42:23'),(0000000251,'label.subgrupoDeProdutos','Atualização',NULL,'2014-11-27 14:46:07','2014-11-27 14:46:07'),(0000000252,'label.colecoes','Inserção',NULL,'2014-11-27 14:46:19','2014-11-27 14:46:19'),(0000000253,'label.colecoes','Inserção',NULL,'2014-11-27 14:47:23','2014-11-27 14:47:23'),(0000000254,'label.colecoes','Atualização',NULL,'2014-11-27 14:48:04','2014-11-27 14:48:04'),(0000000255,'label.colecoes','Atualização',NULL,'2014-11-27 14:48:22','2014-11-27 14:48:22'),(0000000256,'label.colecoes','Exclusão',NULL,'2014-11-27 14:48:29','2014-11-27 14:48:29'),(0000000257,'label.cadastroCores','Atualização',NULL,'2014-11-27 14:49:02','2014-11-27 14:49:02'),(0000000258,'label.cadastroCores','Atualização',NULL,'2014-11-27 14:49:22','2014-11-27 14:49:22'),(0000000259,'label.cadastroCores','Inserção',NULL,'2014-11-27 14:49:50','2014-11-27 14:49:50'),(0000000260,'label.cadastroCores','Inserção',NULL,'2014-11-27 14:50:14','2014-11-27 14:50:14'),(0000000261,'label.cadastroCores','Atualização',NULL,'2014-11-27 14:50:32','2014-11-27 14:50:32'),(0000000262,'label.cadastroCores','Exclusão',NULL,'2014-11-27 14:50:50','2014-11-27 14:50:50'),(0000000263,'label.cadastroUnidade','Inserção',NULL,'2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000264,'label.cadastroUnidade','Atualização',NULL,'2014-11-27 14:51:37','2014-11-27 14:51:37'),(0000000265,'label.cadastroUnidade','Atualização',NULL,'2014-11-27 14:51:56','2014-11-27 14:51:56'),(0000000266,'label.cadastroUnidade','Inserção',NULL,'2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000267,'label.cadastroUnidade','Atualização',NULL,'2014-11-27 14:52:31','2014-11-27 14:52:31'),(0000000268,'label.cadastroUnidade','Inserção',NULL,'2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000269,'label.cadastroUnidade','Exclusão',NULL,'2014-11-27 14:52:49','2014-11-27 14:52:49'),(0000000270,'label.cadastroTipoProduto','Inserção',NULL,'2014-11-27 14:53:44','2014-11-27 14:53:44'),(0000000271,'label.cadastroTipoProduto','Inserção',NULL,'2014-11-27 14:53:53','2014-11-27 14:53:53'),(0000000272,'label.cadastroTipoProduto','Inserção',NULL,'2014-11-27 14:54:02','2014-11-27 14:54:02'),(0000000273,'label.cadastroTipoProduto','Exclusão',NULL,'2014-11-27 14:54:13','2014-11-27 14:54:13'),(0000000274,'label.cadastroTipoProduto','Atualização',NULL,'2014-11-27 14:54:32','2014-11-27 14:54:32'),(0000000275,'label.cadastroTipoProduto','Atualização',NULL,'2014-11-27 14:54:43','2014-11-27 14:54:43'),(0000000278,'label.cadastroCores','Inserção',NULL,'2014-11-27 15:09:44','2014-11-27 15:09:44'),(0000000279,'label.cadastroPadroesLargura','Inserção',NULL,'2014-11-27 15:10:15','2014-11-27 15:10:15'),(0000000280,'label.cadastroPadroesLargura','Inserção',NULL,'2014-11-27 15:10:43','2014-11-27 15:10:43'),(0000000281,'label.cadastroPadroesLargura','Exclusão',NULL,'2014-11-27 15:11:18','2014-11-27 15:11:18'),(0000000282,'label.cadastroPadroesLargura','Atualização',NULL,'2014-11-27 15:11:36','2014-11-27 15:11:36'),(0000000283,'label.cadastroPadroesEspessura','Inserção',NULL,'2014-11-27 15:13:08','2014-11-27 15:13:08'),(0000000284,'label.cadastroPadroesEspessura','Inserção',NULL,'2014-11-27 15:13:51','2014-11-27 15:13:51'),(0000000285,'label.cadastroPadroesEspessura','Inserção',NULL,'2014-11-27 15:15:08','2014-11-27 15:15:08'),(0000000286,'label.cadastroPadroesEspessura','Exclusão',NULL,'2014-11-27 15:15:25','2014-11-27 15:15:25'),(0000000287,'label.cadastroPadroesEspessura','Atualização',NULL,'2014-11-27 15:18:18','2014-11-27 15:18:18'),(0000000288,'label.cadastroTipoProduto','Atualização',NULL,'2014-11-27 16:27:15','2014-11-27 16:27:15'),(0000000289,'label.departamento','Inserção',NULL,'2014-11-27 19:55:04','2014-11-27 19:55:04'),(0000000290,'label.gruposDeProdutos','Inserção',NULL,'2014-11-27 19:56:44','2014-11-27 19:56:44'),(0000000291,'label.gruposDeProdutos','Inserção',NULL,'2014-11-27 20:00:55','2014-11-27 20:00:55'),(0000000292,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-27 20:26:02','2014-11-27 20:26:02'),(0000000293,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-27 20:26:11','2014-11-27 20:26:11'),(0000000295,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-27 20:29:20','2014-11-27 20:29:20'),(0000000301,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-27 20:30:55','2014-11-27 20:30:55'),(0000000302,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-27 20:32:28','2014-11-27 20:32:28'),(0000000303,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-27 20:33:07','2014-11-27 20:33:07'),(0000000305,'label.subgrupoDeProdutos','Inserção',NULL,'2014-11-27 20:39:57','2014-11-27 20:39:57'),(0000000306,'label.colecoes','Inserção',NULL,'2014-11-27 20:40:35','2014-11-27 20:40:35'),(0000000307,'label.cadastroCores','Inserção',NULL,'2014-11-27 20:41:08','2014-11-27 20:41:08'),(0000000308,'label.cadastroUnidade','Atualização',NULL,'2014-11-27 20:42:17','2014-11-27 20:42:17'),(0000000309,'label.cadastroUnidade','Atualização',NULL,'2014-11-27 20:43:13','2014-11-27 20:43:13'),(0000000310,'label.cadastroUnidade','Atualização',NULL,'2014-11-27 20:43:50','2014-11-27 20:43:50'),(0000000312,'label.cadastroPadroesLargura','Inserção',NULL,'2014-11-27 21:09:40','2014-11-27 21:09:40'),(0000000313,'label.cadastroPadroesLargura','Exclusão',NULL,'2014-11-27 21:15:18','2014-11-27 21:15:18'),(0000000314,'label.cadastroPadroesLargura','Exclusão',NULL,'2014-11-27 21:15:27','2014-11-27 21:15:27'),(0000000315,'label.cadastroPadroesLargura','Exclusão',NULL,'2014-11-27 21:15:41','2014-11-27 21:15:41'),(0000000316,'label.cadastroPadroesLargura','Inserção',NULL,'2014-11-27 21:32:32','2014-11-27 21:32:32'),(0000000317,'label.cadastroPadroesLargura','Inserção',NULL,'2014-11-27 21:33:14','2014-11-27 21:33:14'),(0000000318,'label.cadastroPadroesLargura','Inserção',NULL,'2014-11-27 21:33:41','2014-11-27 21:33:41'),(0000000319,'label.departamento','Atualização',NULL,'2014-11-27 23:26:29','2014-11-27 23:26:29'),(0000000320,'label.departamento','Atualização',NULL,'2014-11-27 23:26:42','2014-11-27 23:26:42'),(0000000322,'label.departamento','Inserção',NULL,'2014-11-27 23:42:18','2014-11-27 23:42:18'),(0000000323,'label.gruposDeProdutos','Inserção',NULL,'2014-11-27 23:42:42','2014-11-27 23:42:42'),(0000000324,'label.gruposDeProdutos','Inserção',NULL,'2014-11-27 23:46:07','2014-11-27 23:46:07'),(0000000325,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-27 23:47:25','2014-11-27 23:47:25'),(0000000326,'label.subgrupoDeProdutos','Inserção',NULL,'2014-11-27 23:52:25','2014-11-27 23:52:25'),(0000000327,'label.subgrupoDeProdutos','Atualização',NULL,'2014-11-27 23:53:26','2014-11-27 23:53:26'),(0000000328,'label.colecoes','Inserção',NULL,'2014-11-27 23:54:37','2014-11-27 23:54:37'),(0000000329,'label.colecoes','Atualização',NULL,'2014-11-27 23:55:03','2014-11-27 23:55:03'),(0000000330,'label.colecoes','Atualização',NULL,'2014-11-27 23:55:14','2014-11-27 23:55:14'),(0000000331,'label.colecoes','Exclusão',NULL,'2014-11-27 23:55:34','2014-11-27 23:55:34'),(0000000332,'label.colecoes','Inserção',NULL,'2014-11-27 23:57:50','2014-11-27 23:57:50'),(0000000333,'label.cadastroCores','Inserção',NULL,'2014-11-27 23:58:36','2014-11-27 23:58:36'),(0000000334,'label.cadastroCores','Atualização',NULL,'2014-11-27 23:58:48','2014-11-27 23:58:48'),(0000000335,'label.cadastroCores','Exclusão',NULL,'2014-11-27 23:59:07','2014-11-27 23:59:07'),(0000000336,'label.cadastroCores','Inserção',NULL,'2014-11-27 23:59:36','2014-11-27 23:59:36'),(0000000337,'label.cadastroCores','Exclusão',NULL,'2014-11-27 23:59:44','2014-11-27 23:59:44'),(0000000338,'label.cadastroCores','Inserção',NULL,'2014-11-28 00:00:07','2014-11-28 00:00:07'),(0000000339,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-28 00:01:35','2014-11-28 00:01:35'),(0000000340,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-28 00:01:52','2014-11-28 00:01:52'),(0000000341,'label.subgrupoDeProdutos','Exclusão',NULL,'2014-11-28 00:04:08','2014-11-28 00:04:08'),(0000000342,'label.gruposDeProdutos','Inserção',NULL,'2014-11-28 00:16:01','2014-11-28 00:16:01'),(0000000343,'label.colecoes','Inserção',NULL,'2014-11-28 00:23:01','2014-11-28 00:23:01'),(0000000344,'label.colecoes','Exclusão',NULL,'2014-11-28 00:23:09','2014-11-28 00:23:09'),(0000000345,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-28 00:25:09','2014-11-28 00:25:09'),(0000000349,'label.gruposDeProdutos','Exclusão',NULL,'2014-11-28 00:47:56','2014-11-28 00:47:56'),(0000000354,'label.cadastroPadroesEspessura','Exclusão',NULL,'2014-12-01 17:30:50','2014-12-01 17:30:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=673 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAuditoriaItem`
--

LOCK TABLES `tbAuditoriaItem` WRITE;
/*!40000 ALTER TABLE `tbAuditoriaItem` DISABLE KEYS */;
INSERT INTO `tbAuditoriaItem` VALUES (0000000001,'departamento','','Depto 1','2014-11-04 17:45:24','2014-11-04 17:45:24'),(0000000002,'departamento','','depto 2','2014-11-04 17:45:38','2014-11-04 17:45:38'),(0000000003,'grupoDeProduto','','Grupo 1','2014-11-04 17:46:03','2014-11-04 17:46:03'),(0000000004,'departamentoModel','','Depto 1','2014-11-04 17:46:03','2014-11-04 17:46:03'),(0000000005,'departamento','depto 2','Depto 2','2014-11-04 17:46:30','2014-11-04 17:46:30'),(0000000006,'grupoDeProduto','','Grupo 2','2014-11-04 17:47:13','2014-11-04 17:47:13'),(0000000007,'departamentoModel','','Depto 2','2014-11-04 17:47:13','2014-11-04 17:47:13'),(0000000008,'subGrupoProduto','','SubGrupo 1','2014-11-04 17:47:57','2014-11-04 17:47:57'),(0000000009,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@aeb6727f','2014-11-04 17:47:57','2014-11-04 17:47:57'),(0000000010,'departamentoSelected','','Depto 1','2014-11-04 17:47:57','2014-11-04 17:47:57'),(0000000011,'subGrupoProduto','','SubGrupo 2','2014-11-04 17:48:28','2014-11-04 17:48:28'),(0000000012,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@8532af41','2014-11-04 17:48:28','2014-11-04 17:48:28'),(0000000013,'departamentoSelected','','Depto 2','2014-11-04 17:48:28','2014-11-04 17:48:28'),(0000000014,'colecao','','Coleção 1','2014-11-04 17:49:41','2014-11-04 17:49:41'),(0000000015,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@aeb6727f','2014-11-04 17:49:41','2014-11-04 17:49:41'),(0000000016,'departamentoSelected','','Depto 1','2014-11-04 17:49:41','2014-11-04 17:49:41'),(0000000017,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@2b63bf96','2014-11-04 17:49:41','2014-11-04 17:49:41'),(0000000018,'corCodigo','','1','2014-11-04 17:50:37','2014-11-04 17:50:37'),(0000000019,'corDescricao','','Cor 1','2014-11-04 17:50:37','2014-11-04 17:50:37'),(0000000020,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@2b63bf96','2014-11-04 17:50:37','2014-11-04 17:50:37'),(0000000021,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@aeb6727f','2014-11-04 17:50:37','2014-11-04 17:50:37'),(0000000022,'departamentoSelected','','Depto 1','2014-11-04 17:50:37','2014-11-04 17:50:37'),(0000000023,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@7e612e93','2014-11-04 17:50:37','2014-11-04 17:50:37'),(0000000024,'colecao','','Coleção 2','2014-11-04 17:51:07','2014-11-04 17:51:07'),(0000000025,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@8532af41','2014-11-04 17:51:07','2014-11-04 17:51:07'),(0000000026,'departamentoSelected','','Depto 2','2014-11-04 17:51:07','2014-11-04 17:51:07'),(0000000027,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@1f2f8774','2014-11-04 17:51:07','2014-11-04 17:51:07'),(0000000028,'corCodigo','','2','2014-11-04 17:51:57','2014-11-04 17:51:57'),(0000000029,'corDescricao','','cor 2','2014-11-04 17:51:57','2014-11-04 17:51:57'),(0000000030,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@1f2f8774','2014-11-04 17:51:57','2014-11-04 17:51:57'),(0000000031,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@8532af41','2014-11-04 17:51:57','2014-11-04 17:51:57'),(0000000032,'departamentoSelected','','Depto 2','2014-11-04 17:51:57','2014-11-04 17:51:57'),(0000000033,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@aea798cf','2014-11-04 17:51:57','2014-11-04 17:51:57'),(0000000034,'departamento','','Departamento 1','2014-11-04 18:04:21','2014-11-04 18:04:21'),(0000000035,'departamento','','Departamento 2','2014-11-04 18:04:36','2014-11-04 18:04:36'),(0000000036,'departamento','Departamento 1','Departamento 4','2014-11-04 18:05:10','2014-11-04 18:05:10'),(0000000037,'departamento','','Depart. 5','2014-11-04 18:06:37','2014-11-04 18:06:37'),(0000000038,'departamento','Depart. 5','Depart 5','2014-11-04 18:06:58','2014-11-04 18:06:58'),(0000000039,'grupoDeProduto','','Grupo 1','2014-11-04 18:11:12','2014-11-04 18:11:12'),(0000000040,'departamentoModel','','Departamento 4','2014-11-04 18:11:12','2014-11-04 18:11:12'),(0000000041,'grupoDeProduto','','Grupo Produto 2','2014-11-04 18:11:53','2014-11-04 18:11:53'),(0000000042,'departamentoModel','','Depart 5','2014-11-04 18:11:53','2014-11-04 18:11:53'),(0000000043,'departamentoModel','Depto 1','Departamento 4','2014-11-04 18:14:25','2014-11-04 18:14:25'),(0000000044,'grupoDeProduto','','GP 1','2014-11-04 18:15:38','2014-11-04 18:15:38'),(0000000045,'departamentoModel','','Depart 5','2014-11-04 18:15:38','2014-11-04 18:15:38'),(0000000046,'departamentoModel','Depart 5','Depto 1','2014-11-04 18:15:59','2014-11-04 18:15:59'),(0000000047,'grupoDeProduto','Grupo 2','Grupo 22','2014-11-04 18:16:17','2014-11-04 18:16:17'),(0000000048,'grupoDeProduto','','Gp2','2014-11-04 18:18:14','2014-11-04 18:18:14'),(0000000049,'departamentoModel','','Depto 2','2014-11-04 18:18:14','2014-11-04 18:18:14'),(0000000050,'grupoDeProduto','','GP3','2014-11-04 18:18:28','2014-11-04 18:18:28'),(0000000051,'departamentoModel','','Depart 5','2014-11-04 18:18:28','2014-11-04 18:18:28'),(0000000052,'subGrupoProduto','','SGP1','2014-11-04 18:18:43','2014-11-04 18:18:43'),(0000000053,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@fe499e0c','2014-11-04 18:18:43','2014-11-04 18:18:43'),(0000000054,'departamentoSelected','','Depto 1','2014-11-04 18:18:43','2014-11-04 18:18:43'),(0000000055,'subGrupoProduto','','SGP2','2014-11-04 18:19:03','2014-11-04 18:19:03'),(0000000056,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@e338c113','2014-11-04 18:19:03','2014-11-04 18:19:03'),(0000000057,'departamentoSelected','','Depart 5','2014-11-04 18:19:03','2014-11-04 18:19:03'),(0000000058,'subGrupoProduto','','SGP3','2014-11-04 18:19:28','2014-11-04 18:19:28'),(0000000059,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@757dea7c','2014-11-04 18:19:28','2014-11-04 18:19:28'),(0000000060,'departamentoSelected','','Departamento 4','2014-11-04 18:19:28','2014-11-04 18:19:28'),(0000000061,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@e338c113','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@fe499e0c','2014-11-04 18:22:23','2014-11-04 18:22:23'),(0000000062,'departamentoSelected','Depart 5','Depto 1','2014-11-04 18:22:23','2014-11-04 18:22:23'),(0000000063,'departamento','Depto 2','Depto 2, alteração','2014-11-04 18:22:46','2014-11-04 18:22:46'),(0000000064,'colecao','','Coleção 1','2014-11-04 18:25:14','2014-11-04 18:25:14'),(0000000065,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@fe499e0c','2014-11-04 18:25:14','2014-11-04 18:25:14'),(0000000066,'departamentoSelected','','Depto 1','2014-11-04 18:25:14','2014-11-04 18:25:14'),(0000000067,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@c8a0c1c2','2014-11-04 18:25:14','2014-11-04 18:25:14'),(0000000068,'colecao','','Coleção 2','2014-11-04 18:25:37','2014-11-04 18:25:37'),(0000000069,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@757dea7c','2014-11-04 18:25:37','2014-11-04 18:25:37'),(0000000070,'departamentoSelected','','Departamento 4','2014-11-04 18:25:37','2014-11-04 18:25:37'),(0000000071,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@3d8b4739','2014-11-04 18:25:37','2014-11-04 18:25:37'),(0000000072,'colecao','','Coleção 3','2014-11-04 18:26:32','2014-11-04 18:26:32'),(0000000073,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@757dea7c','2014-11-04 18:26:32','2014-11-04 18:26:32'),(0000000074,'departamentoSelected','','Departamento 4','2014-11-04 18:26:32','2014-11-04 18:26:32'),(0000000075,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@ce3f9c25','2014-11-04 18:26:32','2014-11-04 18:26:32'),(0000000076,'departamentoSelected','Depto 1','Departamento 4','2014-11-04 18:27:05','2014-11-04 18:27:05'),(0000000077,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@757dea7c','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@3ccd0661','2014-11-04 18:27:22','2014-11-04 18:27:22'),(0000000078,'departamentoSelected','Departamento 4','Depto 2, alteração','2014-11-04 18:27:22','2014-11-04 18:27:22'),(0000000079,'subGrupoProdutoSelected','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@3d8b4739','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@ede54490','2014-11-04 18:27:22','2014-11-04 18:27:22'),(0000000080,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@3ccd0661','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@fe499e0c','2014-11-04 18:27:55','2014-11-04 18:27:55'),(0000000081,'departamentoSelected','Depto 2, alteração','Depto 1','2014-11-04 18:27:55','2014-11-04 18:27:55'),(0000000082,'subGrupoProdutoSelected','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@ede54490','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@c8a0c1c2','2014-11-04 18:27:55','2014-11-04 18:27:55'),(0000000083,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@fe499e0c','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@757dea7c','2014-11-04 18:28:22','2014-11-04 18:28:22'),(0000000084,'departamentoSelected','Depto 1','Departamento 4','2014-11-04 18:28:22','2014-11-04 18:28:22'),(0000000085,'subGrupoProdutoSelected','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@c8a0c1c2','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@ce3f9c25','2014-11-04 18:28:22','2014-11-04 18:28:22'),(0000000086,'corCodigo','','1','2014-11-04 18:30:06','2014-11-04 18:30:06'),(0000000087,'corDescricao','','Cor 1','2014-11-04 18:30:06','2014-11-04 18:30:06'),(0000000088,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@c8a0c1c2','2014-11-04 18:30:06','2014-11-04 18:30:06'),(0000000089,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@fe499e0c','2014-11-04 18:30:06','2014-11-04 18:30:06'),(0000000090,'departamentoSelected','','Depto 1','2014-11-04 18:30:06','2014-11-04 18:30:06'),(0000000091,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@886548d4','2014-11-04 18:30:06','2014-11-04 18:30:06'),(0000000092,'corCodigo','','22','2014-11-04 18:30:36','2014-11-04 18:30:36'),(0000000093,'corDescricao','','Cor 2','2014-11-04 18:30:36','2014-11-04 18:30:36'),(0000000094,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@ede54490','2014-11-04 18:30:36','2014-11-04 18:30:36'),(0000000095,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@3ccd0661','2014-11-04 18:30:36','2014-11-04 18:30:36'),(0000000096,'departamentoSelected','','Depto 2, alteração','2014-11-04 18:30:36','2014-11-04 18:30:36'),(0000000097,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@1bbb711','2014-11-04 18:30:36','2014-11-04 18:30:36'),(0000000098,'corCodigo','','33','2014-11-04 18:30:58','2014-11-04 18:30:58'),(0000000099,'corDescricao','','Cor 33','2014-11-04 18:30:58','2014-11-04 18:30:58'),(0000000100,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@ce3f9c25','2014-11-04 18:30:58','2014-11-04 18:30:58'),(0000000101,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@757dea7c','2014-11-04 18:30:58','2014-11-04 18:30:58'),(0000000102,'departamentoSelected','','Departamento 4','2014-11-04 18:30:58','2014-11-04 18:30:58'),(0000000103,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@f60b0d50','2014-11-04 18:30:58','2014-11-04 18:30:58'),(0000000104,'subGrupoProdutoSelected','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@ede54490','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@3d8b4739','2014-11-04 18:31:23','2014-11-04 18:31:23'),(0000000105,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@3ccd0661','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@757dea7c','2014-11-04 18:31:23','2014-11-04 18:31:23'),(0000000106,'departamentoSelected','Depto 2, alteração','Departamento 4','2014-11-04 18:31:23','2014-11-04 18:31:23'),(0000000107,'colecaoSelected','br.com.golive.entity.colecoes.model.ColecoesModel@1bbb711','br.com.golive.entity.colecoes.model.ColecoesModel@f87565ac','2014-11-04 18:31:23','2014-11-04 18:31:23'),(0000000108,'departamento','','Verticais','2014-11-04 18:38:09','2014-11-04 18:38:09'),(0000000109,'departamento','Verticais','Persiana Vertical','2014-11-04 18:38:21','2014-11-04 18:38:21'),(0000000110,'departamento','','Persiana Vertical','2014-11-04 18:38:41','2014-11-04 18:38:41'),(0000000111,'grupoDeProduto','','Tecido','2014-11-04 18:39:26','2014-11-04 18:39:26'),(0000000112,'departamentoModel','','Persiana Vertical','2014-11-04 18:39:26','2014-11-04 18:39:26'),(0000000113,'grupoDeProduto','Tecido','Tecidos','2014-11-04 18:39:38','2014-11-04 18:39:38'),(0000000114,'departamentoModel','Persiana Vertical','Depto 2, alteração','2014-11-04 18:39:38','2014-11-04 18:39:38'),(0000000115,'departamentoModel','Depto 2, alteração','Persiana Vertical','2014-11-04 18:39:53','2014-11-04 18:39:53'),(0000000116,'subGrupoProduto','','Anti-Chama','2014-11-04 18:40:37','2014-11-04 18:40:37'),(0000000117,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@78167a69','2014-11-04 18:40:37','2014-11-04 18:40:37'),(0000000118,'departamentoSelected','','Persiana Vertical','2014-11-04 18:40:37','2014-11-04 18:40:37'),(0000000119,'colecao','','Calgary','2014-11-04 18:41:49','2014-11-04 18:41:49'),(0000000120,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@7b539f49','2014-11-04 18:41:49','2014-11-04 18:41:49'),(0000000121,'departamentoSelected','','Persiana Vertical','2014-11-04 18:41:49','2014-11-04 18:41:49'),(0000000122,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@8910e96','2014-11-04 18:41:49','2014-11-04 18:41:49'),(0000000123,'corCodigo','','55','2014-11-04 18:42:33','2014-11-04 18:42:33'),(0000000124,'corDescricao','','Azul','2014-11-04 18:42:33','2014-11-04 18:42:33'),(0000000125,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@8910e96','2014-11-04 18:42:33','2014-11-04 18:42:33'),(0000000126,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@7b539f49','2014-11-04 18:42:33','2014-11-04 18:42:33'),(0000000127,'departamentoSelected','','Persiana Vertical','2014-11-04 18:42:33','2014-11-04 18:42:33'),(0000000128,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@dc0c8332','2014-11-04 18:42:33','2014-11-04 18:42:33'),(0000000129,'colecao','','Mountain','2014-11-04 18:42:56','2014-11-04 18:42:56'),(0000000130,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@7b539f49','2014-11-04 18:42:56','2014-11-04 18:42:56'),(0000000131,'departamentoSelected','','Persiana Vertical','2014-11-04 18:42:56','2014-11-04 18:42:56'),(0000000132,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@8910e96','2014-11-04 18:42:56','2014-11-04 18:42:56'),(0000000133,'corCodigo','','35','2014-11-04 18:43:36','2014-11-04 18:43:36'),(0000000134,'corDescricao','','Metalic Blue','2014-11-04 18:43:36','2014-11-04 18:43:36'),(0000000135,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@8910e96','2014-11-04 18:43:36','2014-11-04 18:43:36'),(0000000136,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@7b539f49','2014-11-04 18:43:36','2014-11-04 18:43:36'),(0000000137,'departamentoSelected','','Persiana Vertical','2014-11-04 18:43:36','2014-11-04 18:43:36'),(0000000138,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@1085ad95','2014-11-04 18:43:36','2014-11-04 18:43:36'),(0000000139,'colecaoSelected','br.com.golive.entity.colecoes.model.ColecoesModel@1085ad95','br.com.golive.entity.colecoes.model.ColecoesModel@dc0c8332','2014-11-04 18:43:48','2014-11-04 18:43:48'),(0000000140,'departamento','','Persiana Horizontal','2014-11-04 19:46:00','2014-11-04 19:46:00'),(0000000141,'departamento','Persiana Horizontal','Persianas Horizontais','2014-11-04 19:46:16','2014-11-04 19:46:16'),(0000000142,'departamento','','Persiana Horizontal','2014-11-04 19:46:34','2014-11-04 19:46:34'),(0000000143,'grupoDeProduto','','Alumínio','2014-11-04 19:47:08','2014-11-04 19:47:08'),(0000000144,'departamentoModel','','Persiana Horizontal','2014-11-04 19:47:08','2014-11-04 19:47:08'),(0000000145,'grupoDeProduto','','Madeira','2014-11-04 19:49:27','2014-11-04 19:49:27'),(0000000146,'departamentoModel','','Persiana Horizontal','2014-11-04 19:49:27','2014-11-04 19:49:27'),(0000000147,'subGrupoProduto','','Vinilico','2014-11-04 19:50:57','2014-11-04 19:50:57'),(0000000148,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@4582e3f1','2014-11-04 19:50:57','2014-11-04 19:50:57'),(0000000149,'departamentoSelected','','Persiana Horizontal','2014-11-04 19:50:57','2014-11-04 19:50:57'),(0000000150,'colecao','','wood','2014-11-04 19:53:56','2014-11-04 19:53:56'),(0000000151,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@70696991','2014-11-04 19:53:56','2014-11-04 19:53:56'),(0000000152,'departamentoSelected','','Persiana Horizontal','2014-11-04 19:53:56','2014-11-04 19:53:56'),(0000000153,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@8965481b','2014-11-04 19:53:56','2014-11-04 19:53:56'),(0000000154,'corCodigo','','10','2014-11-04 19:56:11','2014-11-04 19:56:11'),(0000000155,'corDescricao','','Tabaco','2014-11-04 19:56:11','2014-11-04 19:56:11'),(0000000156,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@8965481b','2014-11-04 19:56:11','2014-11-04 19:56:11'),(0000000157,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@70696991','2014-11-04 19:56:11','2014-11-04 19:56:11'),(0000000158,'departamentoSelected','','Persiana Horizontal','2014-11-04 19:56:11','2014-11-04 19:56:11'),(0000000159,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@2e50487f','2014-11-04 19:56:11','2014-11-04 19:56:11'),(0000000160,'departamento','','Tecidos','2014-11-05 16:52:36','2014-11-05 16:52:36'),(0000000161,'departamento','Tecidos','Tecido','2014-11-05 16:52:56','2014-11-05 16:52:56'),(0000000162,'departamento','','Tecidos','2014-11-05 16:53:41','2014-11-05 16:53:41'),(0000000163,'grupoDeProduto','','Rollo / Romana / Painel','2014-11-05 16:54:58','2014-11-05 16:54:58'),(0000000164,'departamentoModel','','Tecidos','2014-11-05 16:54:58','2014-11-05 16:54:58'),(0000000165,'subGrupoProduto','','Translucida','2014-11-05 16:58:04','2014-11-05 16:58:04'),(0000000166,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@3290a74e','2014-11-05 16:58:04','2014-11-05 16:58:04'),(0000000167,'departamentoSelected','','Tecidos','2014-11-05 16:58:04','2014-11-05 16:58:04'),(0000000168,'departamento','','Laminas','2014-11-05 17:23:03','2014-11-05 17:23:03'),(0000000169,'grupoDeProduto','','Horizontal 16mm / 25mm','2014-11-05 17:23:55','2014-11-05 17:23:55'),(0000000170,'departamentoModel','','Laminas','2014-11-05 17:23:55','2014-11-05 17:23:55'),(0000000171,'colecao','','Napolis','2014-11-05 17:25:15','2014-11-05 17:25:15'),(0000000172,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@d74619ce','2014-11-05 17:25:15','2014-11-05 17:25:15'),(0000000173,'departamentoSelected','','Tecidos','2014-11-05 17:25:15','2014-11-05 17:25:15'),(0000000174,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@7ed1b6e6','2014-11-05 17:25:15','2014-11-05 17:25:15'),(0000000175,'corCodigo','','001','2014-11-05 17:26:11','2014-11-05 17:26:11'),(0000000176,'corDescricao','','White','2014-11-05 17:26:11','2014-11-05 17:26:11'),(0000000177,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@7ed1b6e6','2014-11-05 17:26:11','2014-11-05 17:26:11'),(0000000178,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@d74619ce','2014-11-05 17:26:11','2014-11-05 17:26:11'),(0000000179,'departamentoSelected','','Tecidos','2014-11-05 17:26:11','2014-11-05 17:26:11'),(0000000180,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@62514ec3','2014-11-05 17:26:11','2014-11-05 17:26:11'),(0000000181,'colecao','','Teste 1','2014-11-07 17:29:19','2014-11-07 17:29:19'),(0000000182,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@3ccd0661','2014-11-07 17:29:19','2014-11-07 17:29:19'),(0000000183,'departamentoSelected','','Depto 2, alteração','2014-11-07 17:29:19','2014-11-07 17:29:19'),(0000000184,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@ede54490','2014-11-07 17:29:19','2014-11-07 17:29:19'),(0000000185,'colecao','Coleção 2','Coleção 21','2014-11-07 18:02:10','2014-11-07 18:02:10'),(0000000186,'colecao','Coleção 1','Coleção 11','2014-11-07 18:02:21','2014-11-07 18:02:21'),(0000000187,'corDescricao','Cor 2','Cor 21','2014-11-07 18:02:37','2014-11-07 18:02:37'),(0000000188,'colecao','Coleção 1','Coleção 11','2014-11-10 16:05:13','2014-11-10 16:05:13'),(0000000189,'colecao','Coleção 11','Coleção 1','2014-11-10 16:08:43','2014-11-10 16:08:43'),(0000000190,'colecao','Coleção 21','Coleção 22','2014-11-10 16:09:17','2014-11-10 16:09:17'),(0000000192,'colecao','Coleção 11','Coleção 12','2014-11-10 16:12:32','2014-11-10 16:12:32'),(0000000193,'colecao','Napolis','Napolis1','2014-11-10 16:14:55','2014-11-10 16:14:55'),(0000000194,'colecao','','Coleção 1','2014-11-10 16:16:33','2014-11-10 16:16:33'),(0000000195,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@fe499e0c','2014-11-10 16:16:33','2014-11-10 16:16:33'),(0000000196,'departamentoSelected','','Depto 1','2014-11-10 16:16:33','2014-11-10 16:16:33'),(0000000197,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@c8a0c1c2','2014-11-10 16:16:33','2014-11-10 16:16:33'),(0000000198,'subGrupoProduto','','SubGrupo 3','2014-11-10 16:24:50','2014-11-10 16:24:50'),(0000000199,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ce0d8fb7','2014-11-10 16:24:50','2014-11-10 16:24:50'),(0000000200,'departamentoSelected','','Depto 2, alteração','2014-11-10 16:24:50','2014-11-10 16:24:50'),(0000000201,'subGrupoProdutoSelected','null','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@888ebe94','2014-11-10 16:25:00','2014-11-10 16:25:00'),(0000000202,'subGrupoProduto','','SubGrupo 4','2014-11-10 16:25:57','2014-11-10 16:25:57'),(0000000203,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@67ca9677','2014-11-10 16:25:57','2014-11-10 16:25:57'),(0000000204,'departamentoSelected','','Persiana Horizontal','2014-11-10 16:25:57','2014-11-10 16:25:57'),(0000000205,'subGrupoProduto','','Teste 1','2014-11-10 16:30:03','2014-11-10 16:30:03'),(0000000206,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@67ca9677','2014-11-10 16:30:03','2014-11-10 16:30:03'),(0000000207,'departamentoSelected','','Persiana Horizontal','2014-11-10 16:30:03','2014-11-10 16:30:03'),(0000000208,'subGrupoProduto','','Teste 2','2014-11-10 16:36:12','2014-11-10 16:36:12'),(0000000209,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@70696991','2014-11-10 16:36:12','2014-11-10 16:36:12'),(0000000210,'departamentoSelected','','Persiana Horizontal','2014-11-10 16:36:12','2014-11-10 16:36:12'),(0000000211,'subGrupoProduto','','Teste 3','2014-11-10 16:37:05','2014-11-10 16:37:05'),(0000000212,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ce0d8fb7','2014-11-10 16:37:05','2014-11-10 16:37:05'),(0000000213,'departamentoSelected','','Depto 2, alteração','2014-11-10 16:37:05','2014-11-10 16:37:05'),(0000000214,'colecao','','Teste 5','2014-11-10 16:37:41','2014-11-10 16:37:41'),(0000000215,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ce0d8fb7','2014-11-10 16:37:41','2014-11-10 16:37:41'),(0000000216,'departamentoSelected','','Depto 2, alteração','2014-11-10 16:37:41','2014-11-10 16:37:41'),(0000000217,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@e51e205a','2014-11-10 16:37:41','2014-11-10 16:37:41'),(0000000218,'grupoDeProduto','','Teste 10/11','2014-11-10 16:56:36','2014-11-10 16:56:36'),(0000000219,'departamentoModel','','Departamento 4','2014-11-10 16:56:36','2014-11-10 16:56:36'),(0000000220,'departamento','','1','2014-11-10 16:57:51','2014-11-10 16:57:51'),(0000000221,'departamento','','2','2014-11-10 16:57:57','2014-11-10 16:57:57'),(0000000222,'departamento','','3','2014-11-10 16:58:02','2014-11-10 16:58:02'),(0000000223,'departamento','','4','2014-11-10 16:58:08','2014-11-10 16:58:08'),(0000000224,'departamento','','5','2014-11-10 16:58:17','2014-11-10 16:58:17'),(0000000225,'departamento','','6','2014-11-10 16:58:37','2014-11-10 16:58:37'),(0000000226,'departamento','','7','2014-11-10 16:58:43','2014-11-10 16:58:43'),(0000000227,'departamento','','8','2014-11-10 16:58:49','2014-11-10 16:58:49'),(0000000228,'departamento','','9','2014-11-10 16:59:00','2014-11-10 16:59:00'),(0000000229,'departamento','','0','2014-11-10 16:59:06','2014-11-10 16:59:06'),(0000000230,'subGrupoProduto','','10/11','2014-11-10 17:03:26','2014-11-10 17:03:26'),(0000000231,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ce0d8fb7','2014-11-10 17:03:26','2014-11-10 17:03:26'),(0000000232,'departamentoSelected','','Depto 2, alteração','2014-11-10 17:03:26','2014-11-10 17:03:26'),(0000000233,'subGrupoProduto','','10/11 - 2','2014-11-10 17:03:55','2014-11-10 17:03:55'),(0000000234,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@70696991','2014-11-10 17:03:55','2014-11-10 17:03:55'),(0000000235,'departamentoSelected','','Persiana Horizontal','2014-11-10 17:03:55','2014-11-10 17:03:55'),(0000000238,'subGrupoProduto','Teste 3','Teste 31','2014-11-10 17:11:31','2014-11-10 17:11:31'),(0000000239,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ce0d8fb7','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@3ccd0661','2014-11-10 17:11:31','2014-11-10 17:11:31'),(0000000240,'subGrupoProduto','Teste 31','Teste 3','2014-11-10 17:11:47','2014-11-10 17:11:47'),(0000000241,'subGrupoProduto','SubGrupo 3','SubGrupo ','2014-11-10 17:13:30','2014-11-10 17:13:30'),(0000000242,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ce0d8fb7','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@70696991','2014-11-10 17:13:30','2014-11-10 17:13:30'),(0000000243,'departamentoSelected','Depto 2, alteração','Persiana Horizontal','2014-11-10 17:13:30','2014-11-10 17:13:30'),(0000000244,'subGrupoProduto','','teste','2014-11-10 17:13:51','2014-11-10 17:13:51'),(0000000245,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@70696991','2014-11-10 17:13:51','2014-11-10 17:13:51'),(0000000246,'departamentoSelected','','Depto 2, alteração','2014-11-10 17:13:51','2014-11-10 17:13:51'),(0000000247,'subGrupoProduto','','1','2014-11-10 17:21:07','2014-11-10 17:21:07'),(0000000248,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ce0d8fb7','2014-11-10 17:21:07','2014-11-10 17:21:07'),(0000000249,'departamentoSelected','','Depto 2, alteração','2014-11-10 17:21:07','2014-11-10 17:21:07'),(0000000250,'subGrupoProduto','','2','2014-11-10 17:22:36','2014-11-10 17:22:36'),(0000000251,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ce0d8fb7','2014-11-10 17:22:36','2014-11-10 17:22:36'),(0000000252,'departamentoSelected','','Persiana Horizontal','2014-11-10 17:22:36','2014-11-10 17:22:36'),(0000000254,'departamento','Depto 2, alteração','Depto 2, alteração1','2014-11-10 17:30:13','2014-11-10 17:30:13'),(0000000255,'departamento','Depto 2, alteração1','Depto 2, alteração','2014-11-10 17:30:24','2014-11-10 17:30:24'),(0000000256,'grupoDeProduto','','Produto 1','2014-11-10 17:34:57','2014-11-10 17:34:57'),(0000000257,'departamentoModel','','Persiana Horizontal','2014-11-10 17:34:57','2014-11-10 17:34:57'),(0000000258,'grupoDeProduto','','Produto 2','2014-11-10 17:35:10','2014-11-10 17:35:10'),(0000000259,'departamentoModel','','Depto 1','2014-11-10 17:35:10','2014-11-10 17:35:10'),(0000000260,'grupoDeProduto','','Produto 1','2014-11-10 17:35:48','2014-11-10 17:35:48'),(0000000261,'departamentoModel','','Persiana Horizontal','2014-11-10 17:35:48','2014-11-10 17:35:48'),(0000000262,'grupoProdutoSelected','null','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@fe499e0c','2014-11-10 17:40:19','2014-11-10 17:40:19'),(0000000263,'subGrupoProduto','SGP 22','SGP 1','2014-11-10 17:40:31','2014-11-10 17:40:31'),(0000000264,'subGrupoProduto','SGP 1','SGP 11','2014-11-10 17:40:43','2014-11-10 17:40:43'),(0000000265,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@757dea7c','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ecdf8711','2014-11-11 10:33:42','2014-11-11 10:33:42'),(0000000266,'departamentoSelected','Departamento 4','Depto 2, alteração','2014-11-11 10:33:42','2014-11-11 10:33:42'),(0000000267,'subGrupoProdutoSelected','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@3d8b4739','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@780714e0','2014-11-11 10:33:42','2014-11-11 10:33:42'),(0000000268,'colecao','','teste','2014-11-11 10:34:12','2014-11-11 10:34:12'),(0000000269,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ecdf8711','2014-11-11 10:34:12','2014-11-11 10:34:12'),(0000000270,'departamentoSelected','','Persiana Horizontal','2014-11-11 10:34:12','2014-11-11 10:34:12'),(0000000271,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@780714e0','2014-11-11 10:34:12','2014-11-11 10:34:12'),(0000000272,'colecao','Coleção 1','Coleção 2','2014-11-11 10:40:46','2014-11-11 10:40:46'),(0000000273,'departamentoSelected','Depto 2, alteração','Persiana Horizontal','2014-11-11 10:40:46','2014-11-11 10:40:46'),(0000000274,'corCodigo','','11/11','2014-11-11 11:12:58','2014-11-11 11:12:58'),(0000000275,'corDescricao','','11/11','2014-11-11 11:12:58','2014-11-11 11:12:58'),(0000000276,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@780714e0','2014-11-11 11:12:58','2014-11-11 11:12:58'),(0000000277,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ecdf8711','2014-11-11 11:12:58','2014-11-11 11:12:58'),(0000000278,'departamentoSelected','','Depto 2, alteração','2014-11-11 11:12:58','2014-11-11 11:12:58'),(0000000279,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@256210a3','2014-11-11 11:12:58','2014-11-11 11:12:58'),(0000000280,'corDescricao','White','White1','2014-11-11 11:15:10','2014-11-11 11:15:10'),(0000000281,'subGrupoProdutoSelected','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@7ed1b6e6','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@780714e0','2014-11-11 11:15:10','2014-11-11 11:15:10'),(0000000282,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@d74619ce','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ecdf8711','2014-11-11 11:15:10','2014-11-11 11:15:10'),(0000000283,'departamentoSelected','Tecidos','Depto 2, alteração','2014-11-11 11:15:10','2014-11-11 11:15:10'),(0000000284,'colecaoSelected','br.com.golive.entity.colecoes.model.ColecoesModel@e95d1d9a','br.com.golive.entity.colecoes.model.ColecoesModel@256210a3','2014-11-11 11:15:10','2014-11-11 11:15:10'),(0000000288,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@fe499e0c','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ecdf8711','2014-11-11 11:18:45','2014-11-11 11:18:45'),(0000000289,'departamentoSelected','Depto 1','Depto 2, alteração','2014-11-11 11:18:45','2014-11-11 11:18:45'),(0000000290,'subGrupoProdutoSelected','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@8a6c0870','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@92606f30','2014-11-11 11:18:45','2014-11-11 11:18:45'),(0000000291,'departamento','','1','2014-11-11 12:02:18','2014-11-11 12:02:18'),(0000000292,'departamento','','2','2014-11-11 12:02:28','2014-11-11 12:02:28'),(0000000293,'departamento','','3','2014-11-11 12:02:34','2014-11-11 12:02:34'),(0000000294,'departamento','2','12','2014-11-11 12:02:44','2014-11-11 12:02:44'),(0000000295,'grupoDeProduto','','1','2014-11-11 12:04:30','2014-11-11 12:04:30'),(0000000296,'departamentoModel','','1','2014-11-11 12:04:30','2014-11-11 12:04:30'),(0000000297,'grupoDeProduto','','2','2014-11-11 12:04:52','2014-11-11 12:04:52'),(0000000298,'departamentoModel','','1','2014-11-11 12:04:52','2014-11-11 12:04:52'),(0000000299,'grupoDeProduto','2','1','2014-11-11 12:05:03','2014-11-11 12:05:03'),(0000000300,'grupoDeProduto','1','21','2014-11-11 12:05:12','2014-11-11 12:05:12'),(0000000301,'grupoDeProduto','21','22','2014-11-11 12:08:18','2014-11-11 12:08:18'),(0000000302,'grupoDeProduto','22','23','2014-11-11 12:08:29','2014-11-11 12:08:29'),(0000000303,'grupoDeProduto','23','24','2014-11-11 12:08:37','2014-11-11 12:08:37'),(0000000304,'grupoDeProduto','24','25','2014-11-11 12:11:35','2014-11-11 12:11:35'),(0000000305,'grupoDeProduto','1','11','2014-11-11 12:17:48','2014-11-11 12:17:48'),(0000000306,'grupoDeProduto','11','&11','2014-11-11 12:17:57','2014-11-11 12:17:57'),(0000000307,'grupoDeProduto','&11','1','2014-11-11 12:18:11','2014-11-11 12:18:11'),(0000000308,'departamentoModel','1','Depto 1','2014-11-11 12:18:28','2014-11-11 12:18:28'),(0000000309,'departamentoModel','Depto 1','1','2014-11-11 12:18:50','2014-11-11 12:18:50'),(0000000310,'departamento','1','Produto 1','2014-11-11 18:13:48','2014-11-11 18:13:48'),(0000000311,'grupoDeProduto','1','Grupo de Produto 1','2014-11-11 18:19:36','2014-11-11 18:19:36'),(0000000312,'departamentoModel','Produto 1','Depto 1','2014-11-11 18:19:36','2014-11-11 18:19:36'),(0000000313,'subGrupoProduto','Teste 3','SubGrupo de Produto','2014-11-11 18:21:58','2014-11-11 18:21:58'),(0000000314,'colecao','Teste 1','Coleção','2014-11-11 18:22:54','2014-11-11 18:22:54'),(0000000315,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@7e201067','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ecdf8711','2014-11-11 18:22:54','2014-11-11 18:22:54'),(0000000316,'subGrupoProdutoSelected','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@eb80c839','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@50072ff3','2014-11-11 18:22:54','2014-11-11 18:22:54'),(0000000317,'departamento','','10','2014-11-11 18:38:51','2014-11-11 18:38:51'),(0000000318,'departamento','','11','2014-11-11 18:38:58','2014-11-11 18:38:58'),(0000000319,'abreviacao','','Cod','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000320,'unidade','','Teste','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000321,'utilizacaoProdutoProdutos','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000322,'utilizacaoProdutoCodigoBarrasProdutos','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000323,'utilizacaoProdutoPadraoLargura','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000324,'utilizacaoProdutoPadraoEspessura','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000325,'utilizacaoProdutoPesoLiquido','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000326,'utilizacaoProdutoPesoBruto','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000327,'utilizacaoVendasQuantMinPedidoVenda','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000328,'utilizacaoVendasQuantMaxPedidoVenda','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000329,'utilizacaoVendasTabelaPrecos','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000330,'utilizacaoComprasQuantMinPedidoCompra','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000331,'utilizacaoComprasQuantMaxPedidoCompra','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000332,'utilizacaoComprasAnaliseComparativaPedidoCompra','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000333,'utilizacaoComprasAnaliseComparativaEstoque','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000334,'utilizacaoFaturamentoCupomFiscal','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000335,'utilizacaoFaturamentoNFCe','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000336,'utilizacaoFaturamentoNFeVenda','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000337,'utilizacaoFaturamentoNFeDevolucao','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000338,'utilizacaoFaturamentoNFeBeneficiamento','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000339,'utilizacaoFaturamentoNFSe','','false','2014-11-27 10:49:14','2014-11-27 10:49:14'),(0000000340,'largura','','1.0','2014-11-27 10:50:00','2014-11-27 10:50:00'),(0000000341,'larguraDescricao','','1','2014-11-27 10:50:00','2014-11-27 10:50:00'),(0000000342,'departamentoSelected','','Depto 2, alteração','2014-11-27 10:50:00','2014-11-27 10:50:00'),(0000000343,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ecdf8711','2014-11-27 10:50:00','2014-11-27 10:50:00'),(0000000344,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@92606f30','2014-11-27 10:50:00','2014-11-27 10:50:00'),(0000000345,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@6d2e428d','2014-11-27 10:50:00','2014-11-27 10:50:00'),(0000000346,'corProdutoSelected','','br.com.golive.entity.especialidades.model.CorProdutoModel@2345cbce','2014-11-27 10:50:00','2014-11-27 10:50:00'),(0000000347,'unidadeSelected','','br.com.golive.entity.unidade.model.UnidadeModel@22fa8d31','2014-11-27 10:50:00','2014-11-27 10:50:00'),(0000000348,'espessura','','1.0','2014-11-27 10:50:30','2014-11-27 10:50:30'),(0000000349,'espessuraDescricao','','123','2014-11-27 10:50:30','2014-11-27 10:50:30'),(0000000350,'departamentoSelected','','Depto 2, alteração','2014-11-27 10:50:30','2014-11-27 10:50:30'),(0000000351,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ecdf8711','2014-11-27 10:50:30','2014-11-27 10:50:30'),(0000000352,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@92606f30','2014-11-27 10:50:30','2014-11-27 10:50:30'),(0000000353,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@6d2e428d','2014-11-27 10:50:30','2014-11-27 10:50:30'),(0000000354,'corProdutoSelected','','br.com.golive.entity.especialidades.model.CorProdutoModel@2345cbce','2014-11-27 10:50:30','2014-11-27 10:50:30'),(0000000355,'unidadeSelected','','br.com.golive.entity.unidade.model.UnidadeModel@22fa8d31','2014-11-27 10:50:30','2014-11-27 10:50:30'),(0000000356,'tipoProduto','','Vish','2014-11-27 10:50:41','2014-11-27 10:50:41'),(0000000357,'abreviacao','','MM','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000358,'unidade','','Milimetro','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000359,'utilizacaoProdutoProdutos','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000360,'utilizacaoProdutoCodigoBarrasProdutos','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000361,'utilizacaoProdutoPadraoLargura','','true','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000362,'utilizacaoProdutoPadraoEspessura','','true','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000363,'utilizacaoProdutoPesoLiquido','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000364,'utilizacaoProdutoPesoBruto','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000365,'utilizacaoVendasQuantMinPedidoVenda','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000366,'utilizacaoVendasQuantMaxPedidoVenda','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000367,'utilizacaoVendasTabelaPrecos','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000368,'utilizacaoComprasQuantMinPedidoCompra','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000369,'utilizacaoComprasQuantMaxPedidoCompra','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000370,'utilizacaoComprasAnaliseComparativaPedidoCompra','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000371,'utilizacaoComprasAnaliseComparativaEstoque','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000372,'utilizacaoFaturamentoCupomFiscal','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000373,'utilizacaoFaturamentoNFCe','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000374,'utilizacaoFaturamentoNFeVenda','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000375,'utilizacaoFaturamentoNFeDevolucao','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000376,'utilizacaoFaturamentoNFeBeneficiamento','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000377,'utilizacaoFaturamentoNFSe','','false','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000378,'abreviacao','Cod','Cdg','2014-11-27 13:22:03','2014-11-27 13:22:03'),(0000000379,'unidade','Teste','Teste1','2014-11-27 13:22:03','2014-11-27 13:22:03'),(0000000380,'unidade','Teste1','Teste2','2014-11-27 13:22:25','2014-11-27 13:22:25'),(0000000381,'colecao','','Coleção Teste','2014-11-27 13:28:53','2014-11-27 13:28:53'),(0000000382,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@fe499e0c','2014-11-27 13:28:53','2014-11-27 13:28:53'),(0000000383,'departamentoSelected','','Depto 1','2014-11-27 13:28:53','2014-11-27 13:28:53'),(0000000384,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@8a6c0870','2014-11-27 13:28:53','2014-11-27 13:28:53'),(0000000385,'departamento','','Depto 10','2014-11-27 14:35:31','2014-11-27 14:35:31'),(0000000386,'departamento','Depart 5','Depto 5','2014-11-27 14:35:47','2014-11-27 14:35:47'),(0000000387,'departamento','Depto 10','Depto 10.1','2014-11-27 14:36:09','2014-11-27 14:36:09'),(0000000388,'grupoDeProduto','','Grupo 10','2014-11-27 14:38:03','2014-11-27 14:38:03'),(0000000389,'departamentoModel','','Depto 10.1','2014-11-27 14:38:03','2014-11-27 14:38:03'),(0000000390,'grupoDeProduto','Gp2','Grupo 2','2014-11-27 14:38:27','2014-11-27 14:38:27'),(0000000391,'grupoDeProduto','','teste','2014-11-27 14:38:51','2014-11-27 14:38:51'),(0000000392,'departamentoModel','','Depto 1','2014-11-27 14:38:51','2014-11-27 14:38:51'),(0000000393,'subGrupoProduto','','teste','2014-11-27 14:39:56','2014-11-27 14:39:56'),(0000000394,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@274d173b','2014-11-27 14:39:56','2014-11-27 14:39:56'),(0000000395,'departamentoSelected','','Depto 10.1','2014-11-27 14:39:56','2014-11-27 14:39:56'),(0000000396,'subGrupoProduto','','teste','2014-11-27 14:40:23','2014-11-27 14:40:23'),(0000000397,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@757dea7c','2014-11-27 14:40:23','2014-11-27 14:40:23'),(0000000398,'departamentoSelected','','Departamento 4','2014-11-27 14:40:23','2014-11-27 14:40:23'),(0000000399,'subGrupoProduto','teste','Sub 10','2014-11-27 14:40:45','2014-11-27 14:40:45'),(0000000400,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@274d173b','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@757dea7c','2014-11-27 14:40:45','2014-11-27 14:40:45'),(0000000401,'subGrupoProduto','SGP 11','Sub 3','2014-11-27 14:41:20','2014-11-27 14:41:20'),(0000000402,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@fe499e0c','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@757dea7c','2014-11-27 14:41:20','2014-11-27 14:41:20'),(0000000403,'colecao','teste','Col 5','2014-11-27 14:42:23','2014-11-27 14:42:23'),(0000000404,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ecdf8711','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@70696991','2014-11-27 14:42:23','2014-11-27 14:42:23'),(0000000405,'subGrupoProdutoSelected','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@50072ff3','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@8965481b','2014-11-27 14:42:23','2014-11-27 14:42:23'),(0000000406,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@757dea7c','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@274d173b','2014-11-27 14:46:07','2014-11-27 14:46:07'),(0000000407,'colecao','','teste','2014-11-27 14:46:19','2014-11-27 14:46:19'),(0000000408,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@274d173b','2014-11-27 14:46:19','2014-11-27 14:46:19'),(0000000409,'departamentoSelected','','Depto 10.1','2014-11-27 14:46:19','2014-11-27 14:46:19'),(0000000410,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@b500e0df','2014-11-27 14:46:19','2014-11-27 14:46:19'),(0000000411,'colecao','','teste2','2014-11-27 14:47:23','2014-11-27 14:47:23'),(0000000412,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@d74619ce','2014-11-27 14:47:23','2014-11-27 14:47:23'),(0000000413,'departamentoSelected','','Tecidos','2014-11-27 14:47:23','2014-11-27 14:47:23'),(0000000414,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@7ed1b6e6','2014-11-27 14:47:23','2014-11-27 14:47:23'),(0000000415,'colecao','Coleção Teste','Cole 5','2014-11-27 14:48:04','2014-11-27 14:48:04'),(0000000416,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@fe499e0c','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ecdf8711','2014-11-27 14:48:04','2014-11-27 14:48:04'),(0000000417,'departamentoSelected','Depto 1','Depto 2, alteração','2014-11-27 14:48:04','2014-11-27 14:48:04'),(0000000418,'subGrupoProdutoSelected','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@78666ac7','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@92606f30','2014-11-27 14:48:04','2014-11-27 14:48:04'),(0000000419,'colecao','teste2','teste2222','2014-11-27 14:48:22','2014-11-27 14:48:22'),(0000000420,'corCodigo','11/11','1','2014-11-27 14:49:02','2014-11-27 14:49:02'),(0000000421,'corDescricao','11/11','teste','2014-11-27 14:49:02','2014-11-27 14:49:02'),(0000000422,'colecaoSelected','br.com.golive.entity.colecoes.model.ColecoesModel@161f83ec','br.com.golive.entity.colecoes.model.ColecoesModel@cb221e7c','2014-11-27 14:49:22','2014-11-27 14:49:22'),(0000000423,'corCodigo','','2','2014-11-27 14:49:50','2014-11-27 14:49:50'),(0000000424,'corDescricao','','teste','2014-11-27 14:49:50','2014-11-27 14:49:50'),(0000000425,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@b500e0df','2014-11-27 14:49:50','2014-11-27 14:49:50'),(0000000426,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@274d173b','2014-11-27 14:49:50','2014-11-27 14:49:50'),(0000000427,'departamentoSelected','','Depto 10.1','2014-11-27 14:49:50','2014-11-27 14:49:50'),(0000000428,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@8c82296c','2014-11-27 14:49:50','2014-11-27 14:49:50'),(0000000429,'corCodigo','','3','2014-11-27 14:50:14','2014-11-27 14:50:14'),(0000000430,'corDescricao','','testando','2014-11-27 14:50:14','2014-11-27 14:50:14'),(0000000431,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@92606f30','2014-11-27 14:50:14','2014-11-27 14:50:14'),(0000000432,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ecdf8711','2014-11-27 14:50:14','2014-11-27 14:50:14'),(0000000433,'departamentoSelected','','Depto 2, alteração','2014-11-27 14:50:14','2014-11-27 14:50:14'),(0000000434,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@6d2e428d','2014-11-27 14:50:14','2014-11-27 14:50:14'),(0000000435,'corDescricao','testando','cor','2014-11-27 14:50:32','2014-11-27 14:50:32'),(0000000436,'abreviacao','','2','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000437,'unidade','','ML','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000438,'utilizacaoProdutoProdutos','','true','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000439,'utilizacaoProdutoCodigoBarrasProdutos','','false','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000440,'utilizacaoProdutoPadraoLargura','','false','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000441,'utilizacaoProdutoPadraoEspessura','','false','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000442,'utilizacaoProdutoPesoLiquido','','false','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000443,'utilizacaoProdutoPesoBruto','','false','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000444,'utilizacaoVendasQuantMinPedidoVenda','','true','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000445,'utilizacaoVendasQuantMaxPedidoVenda','','false','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000446,'utilizacaoVendasTabelaPrecos','','false','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000447,'utilizacaoComprasQuantMinPedidoCompra','','true','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000448,'utilizacaoComprasQuantMaxPedidoCompra','','false','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000449,'utilizacaoComprasAnaliseComparativaPedidoCompra','','false','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000450,'utilizacaoComprasAnaliseComparativaEstoque','','false','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000451,'utilizacaoFaturamentoCupomFiscal','','true','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000452,'utilizacaoFaturamentoNFCe','','false','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000453,'utilizacaoFaturamentoNFeVenda','','false','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000454,'utilizacaoFaturamentoNFeDevolucao','','false','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000455,'utilizacaoFaturamentoNFeBeneficiamento','','false','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000456,'utilizacaoFaturamentoNFSe','','false','2014-11-27 14:51:18','2014-11-27 14:51:18'),(0000000457,'utilizacaoProdutoPesoBruto','false','true','2014-11-27 14:51:37','2014-11-27 14:51:37'),(0000000458,'unidade','Teste2','Unidade','2014-11-27 14:51:56','2014-11-27 14:51:56'),(0000000459,'abreviacao','','25','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000460,'unidade','','teste','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000461,'utilizacaoProdutoProdutos','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000462,'utilizacaoProdutoCodigoBarrasProdutos','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000463,'utilizacaoProdutoPadraoLargura','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000464,'utilizacaoProdutoPadraoEspessura','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000465,'utilizacaoProdutoPesoLiquido','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000466,'utilizacaoProdutoPesoBruto','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000467,'utilizacaoVendasQuantMinPedidoVenda','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000468,'utilizacaoVendasQuantMaxPedidoVenda','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000469,'utilizacaoVendasTabelaPrecos','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000470,'utilizacaoComprasQuantMinPedidoCompra','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000471,'utilizacaoComprasQuantMaxPedidoCompra','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000472,'utilizacaoComprasAnaliseComparativaPedidoCompra','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000473,'utilizacaoComprasAnaliseComparativaEstoque','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000474,'utilizacaoFaturamentoCupomFiscal','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000475,'utilizacaoFaturamentoNFCe','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000476,'utilizacaoFaturamentoNFeVenda','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000477,'utilizacaoFaturamentoNFeDevolucao','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000478,'utilizacaoFaturamentoNFeBeneficiamento','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000479,'utilizacaoFaturamentoNFSe','','false','2014-11-27 14:52:16','2014-11-27 14:52:16'),(0000000480,'unidade','teste','KM','2014-11-27 14:52:31','2014-11-27 14:52:31'),(0000000481,'abreviacao','','dsd','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000482,'unidade','','asdfsdf','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000483,'utilizacaoProdutoProdutos','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000484,'utilizacaoProdutoCodigoBarrasProdutos','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000485,'utilizacaoProdutoPadraoLargura','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000486,'utilizacaoProdutoPadraoEspessura','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000487,'utilizacaoProdutoPesoLiquido','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000488,'utilizacaoProdutoPesoBruto','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000489,'utilizacaoVendasQuantMinPedidoVenda','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000490,'utilizacaoVendasQuantMaxPedidoVenda','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000491,'utilizacaoVendasTabelaPrecos','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000492,'utilizacaoComprasQuantMinPedidoCompra','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000493,'utilizacaoComprasQuantMaxPedidoCompra','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000494,'utilizacaoComprasAnaliseComparativaPedidoCompra','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000495,'utilizacaoComprasAnaliseComparativaEstoque','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000496,'utilizacaoFaturamentoCupomFiscal','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000497,'utilizacaoFaturamentoNFCe','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000498,'utilizacaoFaturamentoNFeVenda','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000499,'utilizacaoFaturamentoNFeDevolucao','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000500,'utilizacaoFaturamentoNFeBeneficiamento','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000501,'utilizacaoFaturamentoNFSe','','false','2014-11-27 14:52:39','2014-11-27 14:52:39'),(0000000502,'tipoProduto','','teste','2014-11-27 14:53:44','2014-11-27 14:53:44'),(0000000503,'tipoProduto','','testando','2014-11-27 14:53:53','2014-11-27 14:53:53'),(0000000504,'tipoProduto','','123','2014-11-27 14:54:02','2014-11-27 14:54:02'),(0000000505,'tipoProduto','teste','Prod 10','2014-11-27 14:54:32','2014-11-27 14:54:32'),(0000000506,'tipoProduto','testando','teste123','2014-11-27 14:54:43','2014-11-27 14:54:43'),(0000000509,'corCodigo','','10','2014-11-27 15:09:44','2014-11-27 15:09:44'),(0000000510,'corDescricao','','cor 10','2014-11-27 15:09:44','2014-11-27 15:09:44'),(0000000511,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@b500e0df','2014-11-27 15:09:44','2014-11-27 15:09:44'),(0000000512,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@274d173b','2014-11-27 15:09:44','2014-11-27 15:09:44'),(0000000513,'departamentoSelected','','Depto 10.1','2014-11-27 15:09:44','2014-11-27 15:09:44'),(0000000514,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@8c82296c','2014-11-27 15:09:44','2014-11-27 15:09:44'),(0000000515,'largura','','10.0','2014-11-27 15:10:15','2014-11-27 15:10:15'),(0000000516,'larguraDescricao','','10','2014-11-27 15:10:15','2014-11-27 15:10:15'),(0000000517,'departamentoSelected','','Depto 10.1','2014-11-27 15:10:15','2014-11-27 15:10:15'),(0000000518,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@274d173b','2014-11-27 15:10:15','2014-11-27 15:10:15'),(0000000519,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@b500e0df','2014-11-27 15:10:15','2014-11-27 15:10:15'),(0000000520,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@8c82296c','2014-11-27 15:10:15','2014-11-27 15:10:15'),(0000000521,'corProdutoSelected','','br.com.golive.entity.especialidades.model.CorProdutoModel@9b462077','2014-11-27 15:10:15','2014-11-27 15:10:15'),(0000000522,'unidadeSelected','','br.com.golive.entity.unidade.model.UnidadeModel@4d302cba','2014-11-27 15:10:15','2014-11-27 15:10:15'),(0000000523,'largura','','10.0','2014-11-27 15:10:43','2014-11-27 15:10:43'),(0000000524,'larguraDescricao','','teste','2014-11-27 15:10:43','2014-11-27 15:10:43'),(0000000525,'departamentoSelected','','Depto 2, alteração','2014-11-27 15:10:43','2014-11-27 15:10:43'),(0000000526,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ecdf8711','2014-11-27 15:10:43','2014-11-27 15:10:43'),(0000000527,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@92606f30','2014-11-27 15:10:43','2014-11-27 15:10:43'),(0000000528,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@6d2e428d','2014-11-27 15:10:43','2014-11-27 15:10:43'),(0000000529,'corProdutoSelected','','br.com.golive.entity.especialidades.model.CorProdutoModel@7801281','2014-11-27 15:10:43','2014-11-27 15:10:43'),(0000000530,'unidadeSelected','','br.com.golive.entity.unidade.model.UnidadeModel@95d1a1ab','2014-11-27 15:10:43','2014-11-27 15:10:43'),(0000000531,'larguraDescricao','teste','123','2014-11-27 15:11:36','2014-11-27 15:11:36'),(0000000532,'espessura','','10.0','2014-11-27 15:13:08','2014-11-27 15:13:08'),(0000000533,'espessuraDescricao','','10','2014-11-27 15:13:08','2014-11-27 15:13:08'),(0000000534,'departamentoSelected','','Depto 10.1','2014-11-27 15:13:08','2014-11-27 15:13:08'),(0000000535,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@274d173b','2014-11-27 15:13:08','2014-11-27 15:13:08'),(0000000536,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@b500e0df','2014-11-27 15:13:08','2014-11-27 15:13:08'),(0000000537,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@8c82296c','2014-11-27 15:13:08','2014-11-27 15:13:08'),(0000000538,'corProdutoSelected','','br.com.golive.entity.especialidades.model.CorProdutoModel@9b462077','2014-11-27 15:13:08','2014-11-27 15:13:08'),(0000000539,'unidadeSelected','','br.com.golive.entity.unidade.model.UnidadeModel@4d302cba','2014-11-27 15:13:08','2014-11-27 15:13:08'),(0000000540,'espessura','','10.1','2014-11-27 15:13:51','2014-11-27 15:13:51'),(0000000541,'espessuraDescricao','','teste','2014-11-27 15:13:51','2014-11-27 15:13:51'),(0000000542,'departamentoSelected','','Depto 2, alteração','2014-11-27 15:13:51','2014-11-27 15:13:51'),(0000000543,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ecdf8711','2014-11-27 15:13:51','2014-11-27 15:13:51'),(0000000544,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@92606f30','2014-11-27 15:13:51','2014-11-27 15:13:51'),(0000000545,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@6d2e428d','2014-11-27 15:13:51','2014-11-27 15:13:51'),(0000000546,'corProdutoSelected','','br.com.golive.entity.especialidades.model.CorProdutoModel@7801281','2014-11-27 15:13:51','2014-11-27 15:13:51'),(0000000547,'unidadeSelected','','br.com.golive.entity.unidade.model.UnidadeModel@cebae91a','2014-11-27 15:13:51','2014-11-27 15:13:51'),(0000000548,'espessura','','1.25','2014-11-27 15:15:08','2014-11-27 15:15:08'),(0000000549,'espessuraDescricao','','teste2','2014-11-27 15:15:08','2014-11-27 15:15:08'),(0000000550,'departamentoSelected','','Persiana Vertical','2014-11-27 15:15:08','2014-11-27 15:15:08'),(0000000551,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@7b539f49','2014-11-27 15:15:08','2014-11-27 15:15:08'),(0000000552,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@8910e96','2014-11-27 15:15:08','2014-11-27 15:15:08'),(0000000553,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@d937326a','2014-11-27 15:15:08','2014-11-27 15:15:08'),(0000000554,'corProdutoSelected','','br.com.golive.entity.especialidades.model.CorProdutoModel@70978661','2014-11-27 15:15:08','2014-11-27 15:15:08'),(0000000555,'unidadeSelected','','br.com.golive.entity.unidade.model.UnidadeModel@95d1a1ab','2014-11-27 15:15:08','2014-11-27 15:15:08'),(0000000556,'espessuraDescricao','123','123456','2014-11-27 15:18:18','2014-11-27 15:18:18'),(0000000557,'grupoProdutoSelected','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ecdf8711','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@98c93181','2014-11-27 15:18:18','2014-11-27 15:18:18'),(0000000558,'unidadeSelected','br.com.golive.entity.unidade.model.UnidadeModel@4d302cba','br.com.golive.entity.unidade.model.UnidadeModel@cebae91a','2014-11-27 15:18:18','2014-11-27 15:18:18'),(0000000559,'tipoProduto','Vish','Update TEste','2014-11-27 16:27:15','2014-11-27 16:27:15'),(0000000560,'departamento','','teste1','2014-11-27 19:55:04','2014-11-27 19:55:04'),(0000000561,'grupoDeProduto','','teste1 grp','2014-11-27 19:56:44','2014-11-27 19:56:44'),(0000000562,'departamentoModel','','teste1','2014-11-27 19:56:44','2014-11-27 19:56:44'),(0000000563,'grupoDeProduto','','teste grupo5','2014-11-27 20:00:55','2014-11-27 20:00:55'),(0000000564,'departamentoModel','','Depto 5','2014-11-27 20:00:55','2014-11-27 20:00:55'),(0000000565,'subGrupoProduto','','teste1 sbgrp','2014-11-27 20:39:57','2014-11-27 20:39:57'),(0000000566,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@e51151f5','2014-11-27 20:39:57','2014-11-27 20:39:57'),(0000000567,'departamentoSelected','','teste1','2014-11-27 20:39:57','2014-11-27 20:39:57'),(0000000568,'colecao','','teste1 colecoes','2014-11-27 20:40:35','2014-11-27 20:40:35'),(0000000569,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@e51151f5','2014-11-27 20:40:35','2014-11-27 20:40:35'),(0000000570,'departamentoSelected','','teste1','2014-11-27 20:40:35','2014-11-27 20:40:35'),(0000000571,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@3aa1ee4d','2014-11-27 20:40:35','2014-11-27 20:40:35'),(0000000572,'corCodigo','','000001','2014-11-27 20:41:08','2014-11-27 20:41:08'),(0000000573,'corDescricao','','Branco','2014-11-27 20:41:08','2014-11-27 20:41:08'),(0000000574,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@3aa1ee4d','2014-11-27 20:41:08','2014-11-27 20:41:08'),(0000000575,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@e51151f5','2014-11-27 20:41:08','2014-11-27 20:41:08'),(0000000576,'departamentoSelected','','teste1','2014-11-27 20:41:08','2014-11-27 20:41:08'),(0000000577,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@a7067e9','2014-11-27 20:41:08','2014-11-27 20:41:08'),(0000000578,'abreviacao','2','ML','2014-11-27 20:42:17','2014-11-27 20:42:17'),(0000000579,'unidade','ML','Metro Linear','2014-11-27 20:42:17','2014-11-27 20:42:17'),(0000000580,'utilizacaoVendasQuantMinPedidoVenda','true','false','2014-11-27 20:42:17','2014-11-27 20:42:17'),(0000000581,'utilizacaoComprasQuantMinPedidoCompra','true','false','2014-11-27 20:42:17','2014-11-27 20:42:17'),(0000000582,'utilizacaoFaturamentoCupomFiscal','true','false','2014-11-27 20:42:17','2014-11-27 20:42:17'),(0000000583,'abreviacao','25','YD','2014-11-27 20:43:13','2014-11-27 20:43:13'),(0000000584,'unidade','KM','Jarda','2014-11-27 20:43:13','2014-11-27 20:43:13'),(0000000585,'utilizacaoProdutoProdutos','false','true','2014-11-27 20:43:13','2014-11-27 20:43:13'),(0000000586,'abreviacao','Cdg','UND','2014-11-27 20:43:50','2014-11-27 20:43:50'),(0000000587,'utilizacaoProdutoProdutos','false','true','2014-11-27 20:43:50','2014-11-27 20:43:50'),(0000000588,'utilizacaoProdutoCodigoBarrasProdutos','false','true','2014-11-27 20:43:50','2014-11-27 20:43:50'),(0000000589,'utilizacaoProdutoPesoBruto','true','false','2014-11-27 20:43:50','2014-11-27 20:43:50'),(0000000590,'utilizacaoVendasQuantMinPedidoVenda','false','true','2014-11-27 20:43:50','2014-11-27 20:43:50'),(0000000591,'utilizacaoVendasQuantMaxPedidoVenda','false','true','2014-11-27 20:43:50','2014-11-27 20:43:50'),(0000000592,'utilizacaoVendasTabelaPrecos','false','true','2014-11-27 20:43:50','2014-11-27 20:43:50'),(0000000593,'utilizacaoComprasQuantMinPedidoCompra','false','true','2014-11-27 20:43:50','2014-11-27 20:43:50'),(0000000594,'utilizacaoComprasQuantMaxPedidoCompra','false','true','2014-11-27 20:43:50','2014-11-27 20:43:50'),(0000000595,'utilizacaoComprasAnaliseComparativaPedidoCompra','false','true','2014-11-27 20:43:50','2014-11-27 20:43:50'),(0000000596,'utilizacaoComprasAnaliseComparativaEstoque','false','true','2014-11-27 20:43:50','2014-11-27 20:43:50'),(0000000597,'largura','','1.83','2014-11-27 21:09:40','2014-11-27 21:09:40'),(0000000598,'larguraDescricao','','Largura do Rolo 1,83 Metros Lineares','2014-11-27 21:09:40','2014-11-27 21:09:40'),(0000000599,'departamentoSelected','','teste1','2014-11-27 21:09:40','2014-11-27 21:09:40'),(0000000600,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@e51151f5','2014-11-27 21:09:40','2014-11-27 21:09:40'),(0000000601,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@3aa1ee4d','2014-11-27 21:09:40','2014-11-27 21:09:40'),(0000000602,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@a7067e9','2014-11-27 21:09:40','2014-11-27 21:09:40'),(0000000603,'corProdutoSelected','','br.com.golive.entity.especialidades.model.CorProdutoModel@112eb576','2014-11-27 21:09:40','2014-11-27 21:09:40'),(0000000604,'unidadeSelected','','br.com.golive.entity.unidade.model.UnidadeModel@22915b2b','2014-11-27 21:09:40','2014-11-27 21:09:40'),(0000000605,'largura','','1.0','2014-11-27 21:32:32','2014-11-27 21:32:32'),(0000000606,'larguraDescricao','','123','2014-11-27 21:32:32','2014-11-27 21:32:32'),(0000000607,'departamentoSelected','','Depto 2, alteração','2014-11-27 21:32:32','2014-11-27 21:32:32'),(0000000608,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ecdf8711','2014-11-27 21:32:32','2014-11-27 21:32:32'),(0000000609,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@92606f30','2014-11-27 21:32:32','2014-11-27 21:32:32'),(0000000610,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@6d2e428d','2014-11-27 21:32:32','2014-11-27 21:32:32'),(0000000611,'corProdutoSelected','','br.com.golive.entity.especialidades.model.CorProdutoModel@c4733c75','2014-11-27 21:32:32','2014-11-27 21:32:32'),(0000000612,'unidadeSelected','','br.com.golive.entity.unidade.model.UnidadeModel@3670d543','2014-11-27 21:32:32','2014-11-27 21:32:32'),(0000000613,'largura','','1.0','2014-11-27 21:33:14','2014-11-27 21:33:14'),(0000000614,'larguraDescricao','','123','2014-11-27 21:33:14','2014-11-27 21:33:14'),(0000000615,'departamentoSelected','','teste1','2014-11-27 21:33:14','2014-11-27 21:33:14'),(0000000616,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@e51151f5','2014-11-27 21:33:14','2014-11-27 21:33:14'),(0000000617,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@3aa1ee4d','2014-11-27 21:33:14','2014-11-27 21:33:14'),(0000000618,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@a7067e9','2014-11-27 21:33:14','2014-11-27 21:33:14'),(0000000619,'corProdutoSelected','','br.com.golive.entity.especialidades.model.CorProdutoModel@112eb576','2014-11-27 21:33:14','2014-11-27 21:33:14'),(0000000620,'unidadeSelected','','br.com.golive.entity.unidade.model.UnidadeModel@3670d543','2014-11-27 21:33:14','2014-11-27 21:33:14'),(0000000621,'largura','','1.0','2014-11-27 21:33:41','2014-11-27 21:33:41'),(0000000622,'larguraDescricao','','asdadasda','2014-11-27 21:33:41','2014-11-27 21:33:41'),(0000000623,'departamentoSelected','','teste1','2014-11-27 21:33:41','2014-11-27 21:33:41'),(0000000624,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@e51151f5','2014-11-27 21:33:41','2014-11-27 21:33:41'),(0000000625,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@3aa1ee4d','2014-11-27 21:33:41','2014-11-27 21:33:41'),(0000000626,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@a7067e9','2014-11-27 21:33:41','2014-11-27 21:33:41'),(0000000627,'corProdutoSelected','','br.com.golive.entity.especialidades.model.CorProdutoModel@112eb576','2014-11-27 21:33:41','2014-11-27 21:33:41'),(0000000628,'unidadeSelected','','br.com.golive.entity.unidade.model.UnidadeModel@3670d543','2014-11-27 21:33:41','2014-11-27 21:33:41'),(0000000629,'departamento','teste1','teste','2014-11-27 23:26:29','2014-11-27 23:26:29'),(0000000630,'departamento','Depto 1','Depto 11','2014-11-27 23:26:42','2014-11-27 23:26:42'),(0000000631,'departamento','','teste1 dpt','2014-11-27 23:42:18','2014-11-27 23:42:18'),(0000000632,'grupoDeProduto','','teste1 grp','2014-11-27 23:42:42','2014-11-27 23:42:42'),(0000000633,'departamentoModel','','teste1 dpt','2014-11-27 23:42:42','2014-11-27 23:42:42'),(0000000634,'grupoDeProduto','','teste1 grp1','2014-11-27 23:46:07','2014-11-27 23:46:07'),(0000000635,'departamentoModel','','teste1 dpt','2014-11-27 23:46:07','2014-11-27 23:46:07'),(0000000636,'subGrupoProduto','','teste1 sbgrp','2014-11-27 23:52:25','2014-11-27 23:52:25'),(0000000637,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@8ba473f0','2014-11-27 23:52:25','2014-11-27 23:52:25'),(0000000638,'departamentoSelected','','teste1 dpt','2014-11-27 23:52:25','2014-11-27 23:52:25'),(0000000639,'colecao','','teste1 colecoes','2014-11-27 23:54:37','2014-11-27 23:54:37'),(0000000640,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@8ba473f0','2014-11-27 23:54:37','2014-11-27 23:54:37'),(0000000641,'departamentoSelected','','teste1 dpt','2014-11-27 23:54:37','2014-11-27 23:54:37'),(0000000642,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@60e63190','2014-11-27 23:54:37','2014-11-27 23:54:37'),(0000000643,'colecao','teste1 colecoes','teste1 col','2014-11-27 23:55:03','2014-11-27 23:55:03'),(0000000644,'colecao','','teste1 col','2014-11-27 23:57:50','2014-11-27 23:57:50'),(0000000645,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@8ba473f0','2014-11-27 23:57:50','2014-11-27 23:57:50'),(0000000646,'departamentoSelected','','teste1 dpt','2014-11-27 23:57:50','2014-11-27 23:57:50'),(0000000647,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@60e63190','2014-11-27 23:57:50','2014-11-27 23:57:50'),(0000000648,'corCodigo','','000001','2014-11-27 23:58:36','2014-11-27 23:58:36'),(0000000649,'corDescricao','','teste1 cor branca','2014-11-27 23:58:36','2014-11-27 23:58:36'),(0000000650,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@60e63190','2014-11-27 23:58:36','2014-11-27 23:58:36'),(0000000651,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@8ba473f0','2014-11-27 23:58:36','2014-11-27 23:58:36'),(0000000652,'departamentoSelected','','teste1 dpt','2014-11-27 23:58:36','2014-11-27 23:58:36'),(0000000653,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@b127af1d','2014-11-27 23:58:36','2014-11-27 23:58:36'),(0000000654,'corDescricao','teste1 cor branca','teste1 cor brancas','2014-11-27 23:58:48','2014-11-27 23:58:48'),(0000000655,'corCodigo','','000001','2014-11-27 23:59:36','2014-11-27 23:59:36'),(0000000656,'corDescricao','','teste1 cor branca','2014-11-27 23:59:36','2014-11-27 23:59:36'),(0000000657,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@60e63190','2014-11-27 23:59:36','2014-11-27 23:59:36'),(0000000658,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@8ba473f0','2014-11-27 23:59:36','2014-11-27 23:59:36'),(0000000659,'departamentoSelected','','teste1 dpt','2014-11-27 23:59:36','2014-11-27 23:59:36'),(0000000660,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@b127af1d','2014-11-27 23:59:36','2014-11-27 23:59:36'),(0000000661,'corCodigo','','000001','2014-11-28 00:00:07','2014-11-28 00:00:07'),(0000000662,'corDescricao','','teste1 cor branca','2014-11-28 00:00:07','2014-11-28 00:00:07'),(0000000663,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@60e63190','2014-11-28 00:00:07','2014-11-28 00:00:07'),(0000000664,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@8ba473f0','2014-11-28 00:00:07','2014-11-28 00:00:07'),(0000000665,'departamentoSelected','','teste1 dpt','2014-11-28 00:00:07','2014-11-28 00:00:07'),(0000000666,'colecaoSelected','','br.com.golive.entity.colecoes.model.ColecoesModel@b127af1d','2014-11-28 00:00:07','2014-11-28 00:00:07'),(0000000667,'grupoDeProduto','','teste1 grp','2014-11-28 00:16:01','2014-11-28 00:16:01'),(0000000668,'departamentoModel','','teste1 dpt','2014-11-28 00:16:01','2014-11-28 00:16:01'),(0000000669,'colecao','','teste1 col','2014-11-28 00:23:01','2014-11-28 00:23:01'),(0000000670,'grupoProdutoSelected','','br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel@ff503740','2014-11-28 00:23:01','2014-11-28 00:23:01'),(0000000671,'departamentoSelected','','teste1 dpt','2014-11-28 00:23:01','2014-11-28 00:23:01'),(0000000672,'subGrupoProdutoSelected','','br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel@da730250','2014-11-28 00:23:01','2014-11-28 00:23:01');
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
INSERT INTO `tbAuditoriaItem_tbAuditoria` VALUES (0000000001,0000000001,0000000003),(0000000002,0000000002,0000000003),(0000000003,0000000003,0000000003),(0000000003,0000000004,0000000003),(0000000004,0000000005,0000000003),(0000000005,0000000006,0000000003),(0000000005,0000000007,0000000003),(0000000006,0000000008,0000000003),(0000000006,0000000009,0000000003),(0000000006,0000000010,0000000003),(0000000007,0000000011,0000000003),(0000000007,0000000012,0000000003),(0000000007,0000000013,0000000003),(0000000008,0000000014,0000000003),(0000000008,0000000015,0000000003),(0000000008,0000000016,0000000003),(0000000008,0000000017,0000000003),(0000000009,0000000018,0000000003),(0000000009,0000000019,0000000003),(0000000009,0000000020,0000000003),(0000000009,0000000021,0000000003),(0000000009,0000000022,0000000003),(0000000009,0000000023,0000000003),(0000000010,0000000024,0000000003),(0000000010,0000000025,0000000003),(0000000010,0000000026,0000000003),(0000000010,0000000027,0000000003),(0000000011,0000000028,0000000003),(0000000011,0000000029,0000000003),(0000000011,0000000030,0000000003),(0000000011,0000000031,0000000003),(0000000011,0000000032,0000000003),(0000000011,0000000033,0000000003),(0000000017,0000000034,0000000003),(0000000018,0000000035,0000000003),(0000000019,0000000036,0000000003),(0000000021,0000000037,0000000003),(0000000023,0000000038,0000000003),(0000000024,0000000039,0000000003),(0000000024,0000000040,0000000003),(0000000025,0000000041,0000000003),(0000000025,0000000042,0000000003),(0000000028,0000000043,0000000003),(0000000030,0000000044,0000000003),(0000000030,0000000045,0000000003),(0000000031,0000000046,0000000003),(0000000032,0000000047,0000000003),(0000000034,0000000048,0000000003),(0000000034,0000000049,0000000003),(0000000035,0000000050,0000000003),(0000000035,0000000051,0000000003),(0000000036,0000000052,0000000003),(0000000036,0000000053,0000000003),(0000000036,0000000054,0000000003),(0000000037,0000000055,0000000003),(0000000037,0000000056,0000000003),(0000000037,0000000057,0000000003),(0000000038,0000000058,0000000003),(0000000038,0000000059,0000000003),(0000000038,0000000060,0000000003),(0000000043,0000000061,0000000003),(0000000043,0000000062,0000000003),(0000000044,0000000063,0000000003),(0000000047,0000000064,0000000003),(0000000047,0000000065,0000000003),(0000000047,0000000066,0000000003),(0000000047,0000000067,0000000003),(0000000048,0000000068,0000000003),(0000000048,0000000069,0000000003),(0000000048,0000000070,0000000003),(0000000048,0000000071,0000000003),(0000000049,0000000072,0000000003),(0000000049,0000000073,0000000003),(0000000049,0000000074,0000000003),(0000000049,0000000075,0000000003),(0000000050,0000000076,0000000003),(0000000051,0000000077,0000000003),(0000000051,0000000078,0000000003),(0000000051,0000000079,0000000003),(0000000052,0000000080,0000000003),(0000000052,0000000081,0000000003),(0000000052,0000000082,0000000003),(0000000053,0000000083,0000000003),(0000000053,0000000084,0000000003),(0000000053,0000000085,0000000003),(0000000055,0000000086,0000000003),(0000000055,0000000087,0000000003),(0000000055,0000000088,0000000003),(0000000055,0000000089,0000000003),(0000000055,0000000090,0000000003),(0000000055,0000000091,0000000003),(0000000056,0000000092,0000000003),(0000000056,0000000093,0000000003),(0000000056,0000000094,0000000003),(0000000056,0000000095,0000000003),(0000000056,0000000096,0000000003),(0000000056,0000000097,0000000003),(0000000057,0000000098,0000000003),(0000000057,0000000099,0000000003),(0000000057,0000000100,0000000003),(0000000057,0000000101,0000000003),(0000000057,0000000102,0000000003),(0000000057,0000000103,0000000003),(0000000058,0000000104,0000000003),(0000000058,0000000105,0000000003),(0000000058,0000000106,0000000003),(0000000058,0000000107,0000000003),(0000000061,0000000108,0000000003),(0000000062,0000000109,0000000003),(0000000064,0000000110,0000000003),(0000000065,0000000111,0000000003),(0000000065,0000000112,0000000003),(0000000066,0000000113,0000000003),(0000000066,0000000114,0000000003),(0000000067,0000000115,0000000003),(0000000069,0000000116,0000000003),(0000000069,0000000117,0000000003),(0000000069,0000000118,0000000003),(0000000072,0000000119,0000000003),(0000000072,0000000120,0000000003),(0000000072,0000000121,0000000003),(0000000072,0000000122,0000000003),(0000000073,0000000123,0000000003),(0000000073,0000000124,0000000003),(0000000073,0000000125,0000000003),(0000000073,0000000126,0000000003),(0000000073,0000000127,0000000003),(0000000073,0000000128,0000000003),(0000000074,0000000129,0000000003),(0000000074,0000000130,0000000003),(0000000074,0000000131,0000000003),(0000000074,0000000132,0000000003),(0000000075,0000000133,0000000003),(0000000075,0000000134,0000000003),(0000000075,0000000135,0000000003),(0000000075,0000000136,0000000003),(0000000075,0000000137,0000000003),(0000000075,0000000138,0000000003),(0000000076,0000000139,0000000003),(0000000077,0000000140,0000000003),(0000000078,0000000141,0000000003),(0000000080,0000000142,0000000003),(0000000081,0000000143,0000000003),(0000000081,0000000144,0000000003),(0000000082,0000000145,0000000003),(0000000082,0000000146,0000000003),(0000000083,0000000147,0000000003),(0000000083,0000000148,0000000003),(0000000083,0000000149,0000000003),(0000000084,0000000150,0000000003),(0000000084,0000000151,0000000003),(0000000084,0000000152,0000000003),(0000000084,0000000153,0000000003),(0000000085,0000000154,0000000003),(0000000085,0000000155,0000000003),(0000000085,0000000156,0000000003),(0000000085,0000000157,0000000003),(0000000085,0000000158,0000000003),(0000000085,0000000159,0000000003),(0000000086,0000000160,0000000003),(0000000087,0000000161,0000000003),(0000000089,0000000162,0000000003),(0000000090,0000000163,0000000003),(0000000090,0000000164,0000000003),(0000000091,0000000165,0000000003),(0000000091,0000000166,0000000003),(0000000091,0000000167,0000000003),(0000000092,0000000168,0000000003),(0000000093,0000000169,0000000003),(0000000093,0000000170,0000000003),(0000000094,0000000171,0000000003),(0000000094,0000000172,0000000003),(0000000094,0000000173,0000000003),(0000000094,0000000174,0000000003),(0000000095,0000000175,0000000003),(0000000095,0000000176,0000000003),(0000000095,0000000177,0000000003),(0000000095,0000000178,0000000003),(0000000095,0000000179,0000000003),(0000000095,0000000180,0000000003),(0000000096,0000000181,0000000003),(0000000096,0000000182,0000000003),(0000000096,0000000183,0000000003),(0000000096,0000000184,0000000003),(0000000097,0000000185,0000000003),(0000000098,0000000186,0000000003),(0000000099,0000000187,0000000003),(0000000100,0000000188,0000000003),(0000000101,0000000189,0000000003),(0000000102,0000000190,0000000003),(0000000104,0000000192,0000000003),(0000000105,0000000193,0000000003),(0000000106,0000000194,0000000003),(0000000106,0000000195,0000000003),(0000000106,0000000196,0000000003),(0000000106,0000000197,0000000003),(0000000109,0000000198,0000000003),(0000000109,0000000199,0000000003),(0000000109,0000000200,0000000003),(0000000110,0000000201,0000000003),(0000000111,0000000202,0000000003),(0000000111,0000000203,0000000003),(0000000111,0000000204,0000000003),(0000000112,0000000205,0000000003),(0000000112,0000000206,0000000003),(0000000112,0000000207,0000000003),(0000000113,0000000208,0000000003),(0000000113,0000000209,0000000003),(0000000113,0000000210,0000000003),(0000000114,0000000211,0000000003),(0000000114,0000000212,0000000003),(0000000114,0000000213,0000000003),(0000000115,0000000214,0000000003),(0000000115,0000000215,0000000003),(0000000115,0000000216,0000000003),(0000000115,0000000217,0000000003),(0000000116,0000000218,0000000003),(0000000116,0000000219,0000000003),(0000000118,0000000220,0000000003),(0000000119,0000000221,0000000003),(0000000120,0000000222,0000000003),(0000000121,0000000223,0000000003),(0000000122,0000000224,0000000003),(0000000123,0000000225,0000000003),(0000000124,0000000226,0000000003),(0000000125,0000000227,0000000003),(0000000126,0000000228,0000000003),(0000000127,0000000229,0000000003),(0000000138,0000000230,0000000003),(0000000138,0000000231,0000000003),(0000000138,0000000232,0000000003),(0000000139,0000000233,0000000003),(0000000139,0000000234,0000000003),(0000000139,0000000235,0000000003),(0000000150,0000000238,0000000003),(0000000150,0000000239,0000000003),(0000000151,0000000240,0000000003),(0000000152,0000000241,0000000003),(0000000152,0000000242,0000000003),(0000000152,0000000243,0000000003),(0000000153,0000000244,0000000003),(0000000153,0000000245,0000000003),(0000000153,0000000246,0000000003),(0000000154,0000000247,0000000003),(0000000154,0000000248,0000000003),(0000000154,0000000249,0000000003),(0000000155,0000000250,0000000003),(0000000155,0000000251,0000000003),(0000000155,0000000252,0000000003),(0000000158,0000000254,0000000003),(0000000159,0000000255,0000000003),(0000000171,0000000256,0000000003),(0000000171,0000000257,0000000003),(0000000172,0000000258,0000000003),(0000000172,0000000259,0000000003),(0000000174,0000000260,0000000003),(0000000174,0000000261,0000000003),(0000000177,0000000262,0000000003),(0000000178,0000000263,0000000003),(0000000179,0000000264,0000000003),(0000000183,0000000265,0000000003),(0000000183,0000000266,0000000003),(0000000183,0000000267,0000000003),(0000000184,0000000268,0000000003),(0000000184,0000000269,0000000003),(0000000184,0000000270,0000000003),(0000000184,0000000271,0000000003),(0000000185,0000000272,0000000003),(0000000185,0000000273,0000000003),(0000000192,0000000274,0000000003),(0000000192,0000000275,0000000003),(0000000192,0000000276,0000000003),(0000000192,0000000277,0000000003),(0000000192,0000000278,0000000003),(0000000192,0000000279,0000000003),(0000000193,0000000280,0000000003),(0000000193,0000000281,0000000003),(0000000193,0000000282,0000000003),(0000000193,0000000283,0000000003),(0000000193,0000000284,0000000003),(0000000200,0000000288,0000000003),(0000000200,0000000289,0000000003),(0000000200,0000000290,0000000003),(0000000202,0000000291,0000000003),(0000000203,0000000292,0000000003),(0000000204,0000000293,0000000003),(0000000205,0000000294,0000000003),(0000000208,0000000295,0000000003),(0000000208,0000000296,0000000003),(0000000209,0000000297,0000000003),(0000000209,0000000298,0000000003),(0000000210,0000000299,0000000003),(0000000211,0000000300,0000000003),(0000000212,0000000301,0000000003),(0000000213,0000000302,0000000003),(0000000214,0000000303,0000000003),(0000000215,0000000304,0000000003),(0000000217,0000000305,0000000003),(0000000218,0000000306,0000000003),(0000000219,0000000307,0000000003),(0000000220,0000000308,0000000003),(0000000221,0000000309,0000000003),(0000000222,0000000310,0000000003),(0000000223,0000000311,0000000003),(0000000223,0000000312,0000000003),(0000000224,0000000313,0000000003),(0000000225,0000000314,0000000003),(0000000225,0000000315,0000000003),(0000000225,0000000316,0000000003),(0000000226,0000000317,0000000003),(0000000227,0000000318,0000000003),(0000000228,0000000319,0000000003),(0000000228,0000000320,0000000003),(0000000228,0000000321,0000000003),(0000000228,0000000322,0000000003),(0000000228,0000000323,0000000003),(0000000228,0000000324,0000000003),(0000000228,0000000325,0000000003),(0000000228,0000000326,0000000003),(0000000228,0000000327,0000000003),(0000000228,0000000328,0000000003),(0000000228,0000000329,0000000003),(0000000228,0000000330,0000000003),(0000000228,0000000331,0000000003),(0000000228,0000000332,0000000003),(0000000228,0000000333,0000000003),(0000000228,0000000334,0000000003),(0000000228,0000000335,0000000003),(0000000228,0000000336,0000000003),(0000000228,0000000337,0000000003),(0000000228,0000000338,0000000003),(0000000228,0000000339,0000000003),(0000000229,0000000340,0000000003),(0000000229,0000000341,0000000003),(0000000229,0000000342,0000000003),(0000000229,0000000343,0000000003),(0000000229,0000000344,0000000003),(0000000229,0000000345,0000000003),(0000000229,0000000346,0000000003),(0000000229,0000000347,0000000003),(0000000230,0000000348,0000000003),(0000000230,0000000349,0000000003),(0000000230,0000000350,0000000003),(0000000230,0000000351,0000000003),(0000000230,0000000352,0000000003),(0000000230,0000000353,0000000003),(0000000230,0000000354,0000000003),(0000000230,0000000355,0000000003),(0000000231,0000000356,0000000003),(0000000232,0000000357,0000000003),(0000000232,0000000358,0000000003),(0000000232,0000000359,0000000003),(0000000232,0000000360,0000000003),(0000000232,0000000361,0000000003),(0000000232,0000000362,0000000003),(0000000232,0000000363,0000000003),(0000000232,0000000364,0000000003),(0000000232,0000000365,0000000003),(0000000232,0000000366,0000000003),(0000000232,0000000367,0000000003),(0000000232,0000000368,0000000003),(0000000232,0000000369,0000000003),(0000000232,0000000370,0000000003),(0000000232,0000000371,0000000003),(0000000232,0000000372,0000000003),(0000000232,0000000373,0000000003),(0000000232,0000000374,0000000003),(0000000232,0000000375,0000000003),(0000000232,0000000376,0000000003),(0000000232,0000000377,0000000003),(0000000233,0000000378,0000000003),(0000000233,0000000379,0000000003),(0000000234,0000000380,0000000003),(0000000235,0000000381,0000000003),(0000000235,0000000382,0000000003),(0000000235,0000000383,0000000003),(0000000235,0000000384,0000000003),(0000000236,0000000385,0000000003),(0000000237,0000000386,0000000003),(0000000238,0000000387,0000000003),(0000000241,0000000388,0000000003),(0000000241,0000000389,0000000003),(0000000242,0000000390,0000000003),(0000000243,0000000391,0000000003),(0000000243,0000000392,0000000003),(0000000245,0000000393,0000000003),(0000000245,0000000394,0000000003),(0000000245,0000000395,0000000003),(0000000246,0000000396,0000000003),(0000000246,0000000397,0000000003),(0000000246,0000000398,0000000003),(0000000247,0000000399,0000000003),(0000000247,0000000400,0000000003),(0000000249,0000000401,0000000003),(0000000249,0000000402,0000000003),(0000000250,0000000403,0000000003),(0000000250,0000000404,0000000003),(0000000250,0000000405,0000000003),(0000000251,0000000406,0000000003),(0000000252,0000000407,0000000003),(0000000252,0000000408,0000000003),(0000000252,0000000409,0000000003),(0000000252,0000000410,0000000003),(0000000253,0000000411,0000000003),(0000000253,0000000412,0000000003),(0000000253,0000000413,0000000003),(0000000253,0000000414,0000000003),(0000000254,0000000415,0000000003),(0000000254,0000000416,0000000003),(0000000254,0000000417,0000000003),(0000000254,0000000418,0000000003),(0000000255,0000000419,0000000003),(0000000257,0000000420,0000000003),(0000000257,0000000421,0000000003),(0000000258,0000000422,0000000003),(0000000259,0000000423,0000000003),(0000000259,0000000424,0000000003),(0000000259,0000000425,0000000003),(0000000259,0000000426,0000000003),(0000000259,0000000427,0000000003),(0000000259,0000000428,0000000003),(0000000260,0000000429,0000000003),(0000000260,0000000430,0000000003),(0000000260,0000000431,0000000003),(0000000260,0000000432,0000000003),(0000000260,0000000433,0000000003),(0000000260,0000000434,0000000003),(0000000261,0000000435,0000000003),(0000000263,0000000436,0000000003),(0000000263,0000000437,0000000003),(0000000263,0000000438,0000000003),(0000000263,0000000439,0000000003),(0000000263,0000000440,0000000003),(0000000263,0000000441,0000000003),(0000000263,0000000442,0000000003),(0000000263,0000000443,0000000003),(0000000263,0000000444,0000000003),(0000000263,0000000445,0000000003),(0000000263,0000000446,0000000003),(0000000263,0000000447,0000000003),(0000000263,0000000448,0000000003),(0000000263,0000000449,0000000003),(0000000263,0000000450,0000000003),(0000000263,0000000451,0000000003),(0000000263,0000000452,0000000003),(0000000263,0000000453,0000000003),(0000000263,0000000454,0000000003),(0000000263,0000000455,0000000003),(0000000263,0000000456,0000000003),(0000000264,0000000457,0000000003),(0000000265,0000000458,0000000003),(0000000266,0000000459,0000000003),(0000000266,0000000460,0000000003),(0000000266,0000000461,0000000003),(0000000266,0000000462,0000000003),(0000000266,0000000463,0000000003),(0000000266,0000000464,0000000003),(0000000266,0000000465,0000000003),(0000000266,0000000466,0000000003),(0000000266,0000000467,0000000003),(0000000266,0000000468,0000000003),(0000000266,0000000469,0000000003),(0000000266,0000000470,0000000003),(0000000266,0000000471,0000000003),(0000000266,0000000472,0000000003),(0000000266,0000000473,0000000003),(0000000266,0000000474,0000000003),(0000000266,0000000475,0000000003),(0000000266,0000000476,0000000003),(0000000266,0000000477,0000000003),(0000000266,0000000478,0000000003),(0000000266,0000000479,0000000003),(0000000267,0000000480,0000000003),(0000000268,0000000481,0000000003),(0000000268,0000000482,0000000003),(0000000268,0000000483,0000000003),(0000000268,0000000484,0000000003),(0000000268,0000000485,0000000003),(0000000268,0000000486,0000000003),(0000000268,0000000487,0000000003),(0000000268,0000000488,0000000003),(0000000268,0000000489,0000000003),(0000000268,0000000490,0000000003),(0000000268,0000000491,0000000003),(0000000268,0000000492,0000000003),(0000000268,0000000493,0000000003),(0000000268,0000000494,0000000003),(0000000268,0000000495,0000000003),(0000000268,0000000496,0000000003),(0000000268,0000000497,0000000003),(0000000268,0000000498,0000000003),(0000000268,0000000499,0000000003),(0000000268,0000000500,0000000003),(0000000268,0000000501,0000000003),(0000000270,0000000502,0000000003),(0000000271,0000000503,0000000003),(0000000272,0000000504,0000000003),(0000000274,0000000505,0000000003),(0000000275,0000000506,0000000003),(0000000278,0000000509,0000000003),(0000000278,0000000510,0000000003),(0000000278,0000000511,0000000003),(0000000278,0000000512,0000000003),(0000000278,0000000513,0000000003),(0000000278,0000000514,0000000003),(0000000279,0000000515,0000000003),(0000000279,0000000516,0000000003),(0000000279,0000000517,0000000003),(0000000279,0000000518,0000000003),(0000000279,0000000519,0000000003),(0000000279,0000000520,0000000003),(0000000279,0000000521,0000000003),(0000000279,0000000522,0000000003),(0000000280,0000000523,0000000003),(0000000280,0000000524,0000000003),(0000000280,0000000525,0000000003),(0000000280,0000000526,0000000003),(0000000280,0000000527,0000000003),(0000000280,0000000528,0000000003),(0000000280,0000000529,0000000003),(0000000280,0000000530,0000000003),(0000000282,0000000531,0000000003),(0000000283,0000000532,0000000003),(0000000283,0000000533,0000000003),(0000000283,0000000534,0000000003),(0000000283,0000000535,0000000003),(0000000283,0000000536,0000000003),(0000000283,0000000537,0000000003),(0000000283,0000000538,0000000003),(0000000283,0000000539,0000000003),(0000000284,0000000540,0000000003),(0000000284,0000000541,0000000003),(0000000284,0000000542,0000000003),(0000000284,0000000543,0000000003),(0000000284,0000000544,0000000003),(0000000284,0000000545,0000000003),(0000000284,0000000546,0000000003),(0000000284,0000000547,0000000003),(0000000285,0000000548,0000000003),(0000000285,0000000549,0000000003),(0000000285,0000000550,0000000003),(0000000285,0000000551,0000000003),(0000000285,0000000552,0000000003),(0000000285,0000000553,0000000003),(0000000285,0000000554,0000000003),(0000000285,0000000555,0000000003),(0000000287,0000000556,0000000003),(0000000287,0000000557,0000000003),(0000000287,0000000558,0000000003),(0000000288,0000000559,0000000003),(0000000289,0000000560,0000000003),(0000000290,0000000561,0000000003),(0000000290,0000000562,0000000003),(0000000291,0000000563,0000000003),(0000000291,0000000564,0000000003),(0000000305,0000000565,0000000003),(0000000305,0000000566,0000000003),(0000000305,0000000567,0000000003),(0000000306,0000000568,0000000003),(0000000306,0000000569,0000000003),(0000000306,0000000570,0000000003),(0000000306,0000000571,0000000003),(0000000307,0000000572,0000000003),(0000000307,0000000573,0000000003),(0000000307,0000000574,0000000003),(0000000307,0000000575,0000000003),(0000000307,0000000576,0000000003),(0000000307,0000000577,0000000003),(0000000308,0000000578,0000000003),(0000000308,0000000579,0000000003),(0000000308,0000000580,0000000003),(0000000308,0000000581,0000000003),(0000000308,0000000582,0000000003),(0000000309,0000000583,0000000003),(0000000309,0000000584,0000000003),(0000000309,0000000585,0000000003),(0000000310,0000000586,0000000003),(0000000310,0000000587,0000000003),(0000000310,0000000588,0000000003),(0000000310,0000000589,0000000003),(0000000310,0000000590,0000000003),(0000000310,0000000591,0000000003),(0000000310,0000000592,0000000003),(0000000310,0000000593,0000000003),(0000000310,0000000594,0000000003),(0000000310,0000000595,0000000003),(0000000310,0000000596,0000000003),(0000000312,0000000597,0000000003),(0000000312,0000000598,0000000003),(0000000312,0000000599,0000000003),(0000000312,0000000600,0000000003),(0000000312,0000000601,0000000003),(0000000312,0000000602,0000000003),(0000000312,0000000603,0000000003),(0000000312,0000000604,0000000003),(0000000316,0000000605,0000000003),(0000000316,0000000606,0000000003),(0000000316,0000000607,0000000003),(0000000316,0000000608,0000000003),(0000000316,0000000609,0000000003),(0000000316,0000000610,0000000003),(0000000316,0000000611,0000000003),(0000000316,0000000612,0000000003),(0000000317,0000000613,0000000003),(0000000317,0000000614,0000000003),(0000000317,0000000615,0000000003),(0000000317,0000000616,0000000003),(0000000317,0000000617,0000000003),(0000000317,0000000618,0000000003),(0000000317,0000000619,0000000003),(0000000317,0000000620,0000000003),(0000000318,0000000621,0000000003),(0000000318,0000000622,0000000003),(0000000318,0000000623,0000000003),(0000000318,0000000624,0000000003),(0000000318,0000000625,0000000003),(0000000318,0000000626,0000000003),(0000000318,0000000627,0000000003),(0000000318,0000000628,0000000003),(0000000319,0000000629,0000000003),(0000000320,0000000630,0000000003),(0000000322,0000000631,0000000003),(0000000323,0000000632,0000000003),(0000000323,0000000633,0000000003),(0000000324,0000000634,0000000003),(0000000324,0000000635,0000000003),(0000000326,0000000636,0000000003),(0000000326,0000000637,0000000003),(0000000326,0000000638,0000000003),(0000000328,0000000639,0000000003),(0000000328,0000000640,0000000003),(0000000328,0000000641,0000000003),(0000000328,0000000642,0000000003),(0000000329,0000000643,0000000003),(0000000332,0000000644,0000000003),(0000000332,0000000645,0000000003),(0000000332,0000000646,0000000003),(0000000332,0000000647,0000000003),(0000000333,0000000648,0000000003),(0000000333,0000000649,0000000003),(0000000333,0000000650,0000000003),(0000000333,0000000651,0000000003),(0000000333,0000000652,0000000003),(0000000333,0000000653,0000000003),(0000000334,0000000654,0000000003),(0000000336,0000000655,0000000003),(0000000336,0000000656,0000000003),(0000000336,0000000657,0000000003),(0000000336,0000000658,0000000003),(0000000336,0000000659,0000000003),(0000000336,0000000660,0000000003),(0000000338,0000000661,0000000003),(0000000338,0000000662,0000000003),(0000000338,0000000663,0000000003),(0000000338,0000000664,0000000003),(0000000338,0000000665,0000000003),(0000000338,0000000666,0000000003),(0000000342,0000000667,0000000003),(0000000342,0000000668,0000000003),(0000000343,0000000669,0000000003),(0000000343,0000000670,0000000003),(0000000343,0000000671,0000000003),(0000000343,0000000672,0000000003);
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
INSERT INTO `tbAuditoria_tbColecoesProduto` VALUES (0000000074,0000000129,0000000003,0000000007),(0000000074,0000000130,0000000003,0000000007),(0000000074,0000000131,0000000003,0000000007),(0000000074,0000000132,0000000003,0000000007),(0000000094,0000000171,0000000003,0000000009),(0000000094,0000000172,0000000003,0000000009),(0000000094,0000000173,0000000003,0000000009),(0000000094,0000000174,0000000003,0000000009),(0000000096,0000000181,0000000003,0000000010),(0000000096,0000000182,0000000003,0000000010),(0000000096,0000000183,0000000003,0000000010),(0000000096,0000000184,0000000003,0000000010),(0000000105,0000000193,0000000003,0000000009),(0000000110,0000000201,0000000003,0000000010),(0000000184,0000000268,0000000003,0000000013),(0000000184,0000000269,0000000003,0000000013),(0000000184,0000000270,0000000003,0000000013),(0000000184,0000000271,0000000003,0000000013),(0000000225,0000000314,0000000003,0000000010),(0000000225,0000000315,0000000003,0000000010),(0000000225,0000000316,0000000003,0000000010),(0000000235,0000000381,0000000003,0000000014),(0000000235,0000000382,0000000003,0000000014),(0000000235,0000000383,0000000003,0000000014),(0000000235,0000000384,0000000003,0000000014),(0000000250,0000000403,0000000003,0000000013),(0000000250,0000000404,0000000003,0000000013),(0000000250,0000000405,0000000003,0000000013),(0000000252,0000000407,0000000003,0000000015),(0000000252,0000000408,0000000003,0000000015),(0000000252,0000000409,0000000003,0000000015),(0000000252,0000000410,0000000003,0000000015),(0000000254,0000000415,0000000003,0000000014),(0000000254,0000000416,0000000003,0000000014),(0000000254,0000000417,0000000003,0000000014),(0000000254,0000000418,0000000003,0000000014),(0000000306,0000000568,0000000003,0000000017),(0000000306,0000000569,0000000003,0000000017),(0000000306,0000000570,0000000003,0000000017),(0000000306,0000000571,0000000003,0000000017),(0000000332,0000000644,0000000003,0000000019),(0000000332,0000000645,0000000003,0000000019),(0000000332,0000000646,0000000003,0000000019),(0000000332,0000000647,0000000003,0000000019);
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
INSERT INTO `tbAuditoria_tbCorProduto` VALUES (0000000009,0000000018,0000000003,0000000001),(0000000009,0000000019,0000000003,0000000001),(0000000009,0000000020,0000000003,0000000001),(0000000009,0000000021,0000000003,0000000001),(0000000009,0000000022,0000000003,0000000001),(0000000009,0000000023,0000000003,0000000001),(0000000055,0000000086,0000000003,0000000003),(0000000055,0000000087,0000000003,0000000003),(0000000055,0000000088,0000000003,0000000003),(0000000055,0000000089,0000000003,0000000003),(0000000055,0000000090,0000000003,0000000003),(0000000055,0000000091,0000000003,0000000003),(0000000056,0000000092,0000000003,0000000004),(0000000056,0000000093,0000000003,0000000004),(0000000056,0000000094,0000000003,0000000004),(0000000056,0000000095,0000000003,0000000004),(0000000056,0000000096,0000000003,0000000004),(0000000056,0000000097,0000000003,0000000004),(0000000058,0000000104,0000000003,0000000004),(0000000058,0000000105,0000000003,0000000004),(0000000058,0000000106,0000000003,0000000004),(0000000058,0000000107,0000000003,0000000004),(0000000073,0000000123,0000000003,0000000006),(0000000073,0000000124,0000000003,0000000006),(0000000073,0000000125,0000000003,0000000006),(0000000073,0000000126,0000000003,0000000006),(0000000073,0000000127,0000000003,0000000006),(0000000073,0000000128,0000000003,0000000006),(0000000075,0000000133,0000000003,0000000007),(0000000075,0000000134,0000000003,0000000007),(0000000075,0000000135,0000000003,0000000007),(0000000075,0000000136,0000000003,0000000007),(0000000075,0000000137,0000000003,0000000007),(0000000075,0000000138,0000000003,0000000007),(0000000076,0000000139,0000000003,0000000007),(0000000085,0000000154,0000000003,0000000008),(0000000085,0000000155,0000000003,0000000008),(0000000085,0000000156,0000000003,0000000008),(0000000085,0000000157,0000000003,0000000008),(0000000085,0000000158,0000000003,0000000008),(0000000085,0000000159,0000000003,0000000008),(0000000095,0000000175,0000000003,0000000009),(0000000095,0000000176,0000000003,0000000009),(0000000095,0000000177,0000000003,0000000009),(0000000095,0000000178,0000000003,0000000009),(0000000095,0000000179,0000000003,0000000009),(0000000095,0000000180,0000000003,0000000009),(0000000099,0000000187,0000000003,0000000004),(0000000192,0000000274,0000000003,0000000010),(0000000192,0000000275,0000000003,0000000010),(0000000192,0000000276,0000000003,0000000010),(0000000192,0000000277,0000000003,0000000010),(0000000192,0000000278,0000000003,0000000010),(0000000192,0000000279,0000000003,0000000010),(0000000193,0000000280,0000000003,0000000009),(0000000193,0000000281,0000000003,0000000009),(0000000193,0000000282,0000000003,0000000009),(0000000193,0000000283,0000000003,0000000009),(0000000193,0000000284,0000000003,0000000009),(0000000257,0000000420,0000000003,0000000010),(0000000257,0000000421,0000000003,0000000010),(0000000258,0000000422,0000000003,0000000010),(0000000260,0000000429,0000000003,0000000012),(0000000260,0000000430,0000000003,0000000012),(0000000260,0000000431,0000000003,0000000012),(0000000260,0000000432,0000000003,0000000012),(0000000260,0000000433,0000000003,0000000012),(0000000260,0000000434,0000000003,0000000012),(0000000261,0000000435,0000000003,0000000012),(0000000278,0000000509,0000000003,0000000013),(0000000278,0000000510,0000000003,0000000013),(0000000278,0000000511,0000000003,0000000013),(0000000278,0000000512,0000000003,0000000013),(0000000278,0000000513,0000000003,0000000013),(0000000278,0000000514,0000000003,0000000013),(0000000307,0000000572,0000000003,0000000014),(0000000307,0000000573,0000000003,0000000014),(0000000307,0000000574,0000000003,0000000014),(0000000307,0000000575,0000000003,0000000014),(0000000307,0000000576,0000000003,0000000014),(0000000307,0000000577,0000000003,0000000014),(0000000338,0000000661,0000000003,0000000017),(0000000338,0000000662,0000000003,0000000017),(0000000338,0000000663,0000000003,0000000017),(0000000338,0000000664,0000000003,0000000017),(0000000338,0000000665,0000000003,0000000017),(0000000338,0000000666,0000000003,0000000017);
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
INSERT INTO `tbAuditoria_tbDepartamentoProduto` VALUES (0000000001,0000000001,0000000003,0000000001),(0000000017,0000000034,0000000003,0000000003),(0000000019,0000000036,0000000003,0000000003),(0000000021,0000000037,0000000003,0000000005),(0000000023,0000000038,0000000003,0000000005),(0000000064,0000000110,0000000003,0000000007),(0000000080,0000000142,0000000003,0000000009),(0000000089,0000000162,0000000003,0000000011),(0000000092,0000000168,0000000003,0000000012),(0000000158,0000000254,0000000003,0000000002),(0000000159,0000000255,0000000003,0000000002),(0000000202,0000000291,0000000003,0000000023),(0000000222,0000000310,0000000003,0000000023),(0000000226,0000000317,0000000003,0000000026),(0000000236,0000000385,0000000003,0000000028),(0000000237,0000000386,0000000003,0000000005),(0000000238,0000000387,0000000003,0000000028),(0000000289,0000000560,0000000003,0000000029),(0000000319,0000000629,0000000003,0000000029),(0000000320,0000000630,0000000003,0000000001),(0000000322,0000000631,0000000003,0000000030);
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
INSERT INTO `tbAuditoria_tbGrupoProduto` VALUES (0000000005,0000000006,0000000003,0000000002),(0000000005,0000000007,0000000003,0000000002),(0000000025,0000000041,0000000003,0000000004),(0000000025,0000000042,0000000003,0000000004),(0000000031,0000000046,0000000003,0000000004),(0000000032,0000000047,0000000003,0000000002),(0000000034,0000000048,0000000003,0000000006),(0000000034,0000000049,0000000003,0000000006),(0000000065,0000000111,0000000003,0000000008),(0000000065,0000000112,0000000003,0000000008),(0000000066,0000000113,0000000003,0000000008),(0000000066,0000000114,0000000003,0000000008),(0000000067,0000000115,0000000003,0000000008),(0000000082,0000000145,0000000003,0000000010),(0000000082,0000000146,0000000003,0000000010),(0000000090,0000000163,0000000003,0000000011),(0000000090,0000000164,0000000003,0000000011),(0000000241,0000000388,0000000003,0000000019),(0000000241,0000000389,0000000003,0000000019),(0000000242,0000000390,0000000003,0000000006),(0000000290,0000000561,0000000003,0000000021),(0000000290,0000000562,0000000003,0000000021),(0000000342,0000000667,0000000003,0000000025),(0000000342,0000000668,0000000003,0000000025);
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
INSERT INTO `tbAuditoria_tbPadroesEspessuraProduto` VALUES (0000000230,0000000348,0000000003,0000000001),(0000000230,0000000349,0000000003,0000000001),(0000000230,0000000350,0000000003,0000000001),(0000000230,0000000351,0000000003,0000000001),(0000000230,0000000352,0000000003,0000000001),(0000000230,0000000353,0000000003,0000000001),(0000000230,0000000354,0000000003,0000000001),(0000000230,0000000355,0000000003,0000000001),(0000000284,0000000540,0000000003,0000000004),(0000000284,0000000541,0000000003,0000000004),(0000000284,0000000542,0000000003,0000000004),(0000000284,0000000543,0000000003,0000000004),(0000000284,0000000544,0000000003,0000000004),(0000000284,0000000545,0000000003,0000000004),(0000000284,0000000546,0000000003,0000000004),(0000000284,0000000547,0000000003,0000000004),(0000000287,0000000556,0000000003,0000000001),(0000000287,0000000557,0000000003,0000000001),(0000000287,0000000558,0000000003,0000000001);
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
INSERT INTO `tbAuditoria_tbPadroesLarguraProduto` VALUES (0000000316,0000000605,0000000003,0000000008),(0000000316,0000000606,0000000003,0000000008),(0000000316,0000000607,0000000003,0000000008),(0000000316,0000000608,0000000003,0000000008),(0000000316,0000000609,0000000003,0000000008),(0000000316,0000000610,0000000003,0000000008),(0000000316,0000000611,0000000003,0000000008),(0000000316,0000000612,0000000003,0000000008),(0000000317,0000000613,0000000003,0000000009),(0000000317,0000000614,0000000003,0000000009),(0000000317,0000000615,0000000003,0000000009),(0000000317,0000000616,0000000003,0000000009),(0000000317,0000000617,0000000003,0000000009),(0000000317,0000000618,0000000003,0000000009),(0000000317,0000000619,0000000003,0000000009),(0000000317,0000000620,0000000003,0000000009),(0000000318,0000000621,0000000003,0000000010),(0000000318,0000000622,0000000003,0000000010),(0000000318,0000000623,0000000003,0000000010),(0000000318,0000000624,0000000003,0000000010),(0000000318,0000000625,0000000003,0000000010),(0000000318,0000000626,0000000003,0000000010),(0000000318,0000000627,0000000003,0000000010),(0000000318,0000000628,0000000003,0000000010);
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
INSERT INTO `tbAuditoria_tbSubGrupoProduto` VALUES (0000000006,0000000008,0000000003,0000000001),(0000000006,0000000009,0000000003,0000000001),(0000000006,0000000010,0000000003,0000000001),(0000000007,0000000011,0000000003,0000000002),(0000000007,0000000012,0000000003,0000000002),(0000000007,0000000013,0000000003,0000000002),(0000000069,0000000116,0000000003,0000000006),(0000000069,0000000117,0000000003,0000000006),(0000000069,0000000118,0000000003,0000000006),(0000000083,0000000147,0000000003,0000000007),(0000000083,0000000148,0000000003,0000000007),(0000000083,0000000149,0000000003,0000000007),(0000000091,0000000165,0000000003,0000000008),(0000000091,0000000166,0000000003,0000000008),(0000000091,0000000167,0000000003,0000000008),(0000000109,0000000198,0000000003,0000000009),(0000000109,0000000199,0000000003,0000000009),(0000000109,0000000200,0000000003,0000000009),(0000000150,0000000238,0000000003,0000000013),(0000000150,0000000239,0000000003,0000000013),(0000000151,0000000240,0000000003,0000000013),(0000000152,0000000241,0000000003,0000000009),(0000000152,0000000242,0000000003,0000000009),(0000000152,0000000243,0000000003,0000000009),(0000000177,0000000262,0000000003,0000000004),(0000000178,0000000263,0000000003,0000000004),(0000000179,0000000264,0000000003,0000000004),(0000000224,0000000313,0000000003,0000000013),(0000000245,0000000393,0000000003,0000000019),(0000000245,0000000394,0000000003,0000000019),(0000000245,0000000395,0000000003,0000000019),(0000000247,0000000399,0000000003,0000000019),(0000000247,0000000400,0000000003,0000000019),(0000000249,0000000401,0000000003,0000000004),(0000000249,0000000402,0000000003,0000000004),(0000000251,0000000406,0000000003,0000000019),(0000000305,0000000565,0000000003,0000000021),(0000000305,0000000566,0000000003,0000000021),(0000000305,0000000567,0000000003,0000000021);
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
INSERT INTO `tbAuditoria_tbTipoProduto` VALUES (0000000231,0000000356,0000000003,0000000003),(0000000270,0000000502,0000000003,0000000004),(0000000271,0000000503,0000000003,0000000005),(0000000274,0000000505,0000000003,0000000004),(0000000275,0000000506,0000000003,0000000005),(0000000288,0000000559,0000000003,0000000003);
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
INSERT INTO `tbAuditoria_tbUnidade` VALUES (0000000228,0000000319,0000000003,0000000010),(0000000228,0000000320,0000000003,0000000010),(0000000228,0000000321,0000000003,0000000010),(0000000228,0000000322,0000000003,0000000010),(0000000228,0000000323,0000000003,0000000010),(0000000228,0000000324,0000000003,0000000010),(0000000228,0000000325,0000000003,0000000010),(0000000228,0000000326,0000000003,0000000010),(0000000228,0000000327,0000000003,0000000010),(0000000228,0000000328,0000000003,0000000010),(0000000228,0000000329,0000000003,0000000010),(0000000228,0000000330,0000000003,0000000010),(0000000228,0000000331,0000000003,0000000010),(0000000228,0000000332,0000000003,0000000010),(0000000228,0000000333,0000000003,0000000010),(0000000228,0000000334,0000000003,0000000010),(0000000228,0000000335,0000000003,0000000010),(0000000228,0000000336,0000000003,0000000010),(0000000228,0000000337,0000000003,0000000010),(0000000228,0000000338,0000000003,0000000010),(0000000228,0000000339,0000000003,0000000010),(0000000232,0000000357,0000000003,0000000011),(0000000232,0000000358,0000000003,0000000011),(0000000232,0000000359,0000000003,0000000011),(0000000232,0000000360,0000000003,0000000011),(0000000232,0000000361,0000000003,0000000011),(0000000232,0000000362,0000000003,0000000011),(0000000232,0000000363,0000000003,0000000011),(0000000232,0000000364,0000000003,0000000011),(0000000232,0000000365,0000000003,0000000011),(0000000232,0000000366,0000000003,0000000011),(0000000232,0000000367,0000000003,0000000011),(0000000232,0000000368,0000000003,0000000011),(0000000232,0000000369,0000000003,0000000011),(0000000232,0000000370,0000000003,0000000011),(0000000232,0000000371,0000000003,0000000011),(0000000232,0000000372,0000000003,0000000011),(0000000232,0000000373,0000000003,0000000011),(0000000232,0000000374,0000000003,0000000011),(0000000232,0000000375,0000000003,0000000011),(0000000232,0000000376,0000000003,0000000011),(0000000232,0000000377,0000000003,0000000011),(0000000233,0000000378,0000000003,0000000010),(0000000233,0000000379,0000000003,0000000010),(0000000234,0000000380,0000000003,0000000010),(0000000263,0000000436,0000000003,0000000012),(0000000263,0000000437,0000000003,0000000012),(0000000263,0000000438,0000000003,0000000012),(0000000263,0000000439,0000000003,0000000012),(0000000263,0000000440,0000000003,0000000012),(0000000263,0000000441,0000000003,0000000012),(0000000263,0000000442,0000000003,0000000012),(0000000263,0000000443,0000000003,0000000012),(0000000263,0000000444,0000000003,0000000012),(0000000263,0000000445,0000000003,0000000012),(0000000263,0000000446,0000000003,0000000012),(0000000263,0000000447,0000000003,0000000012),(0000000263,0000000448,0000000003,0000000012),(0000000263,0000000449,0000000003,0000000012),(0000000263,0000000450,0000000003,0000000012),(0000000263,0000000451,0000000003,0000000012),(0000000263,0000000452,0000000003,0000000012),(0000000263,0000000453,0000000003,0000000012),(0000000263,0000000454,0000000003,0000000012),(0000000263,0000000455,0000000003,0000000012),(0000000263,0000000456,0000000003,0000000012),(0000000264,0000000457,0000000003,0000000010),(0000000265,0000000458,0000000003,0000000010),(0000000266,0000000459,0000000003,0000000013),(0000000266,0000000460,0000000003,0000000013),(0000000266,0000000461,0000000003,0000000013),(0000000266,0000000462,0000000003,0000000013),(0000000266,0000000463,0000000003,0000000013),(0000000266,0000000464,0000000003,0000000013),(0000000266,0000000465,0000000003,0000000013),(0000000266,0000000466,0000000003,0000000013),(0000000266,0000000467,0000000003,0000000013),(0000000266,0000000468,0000000003,0000000013),(0000000266,0000000469,0000000003,0000000013),(0000000266,0000000470,0000000003,0000000013),(0000000266,0000000471,0000000003,0000000013),(0000000266,0000000472,0000000003,0000000013),(0000000266,0000000473,0000000003,0000000013),(0000000266,0000000474,0000000003,0000000013),(0000000266,0000000475,0000000003,0000000013),(0000000266,0000000476,0000000003,0000000013),(0000000266,0000000477,0000000003,0000000013),(0000000266,0000000478,0000000003,0000000013),(0000000266,0000000479,0000000003,0000000013),(0000000267,0000000480,0000000003,0000000013),(0000000308,0000000578,0000000003,0000000012),(0000000308,0000000579,0000000003,0000000012),(0000000308,0000000580,0000000003,0000000012),(0000000308,0000000581,0000000003,0000000012),(0000000308,0000000582,0000000003,0000000012),(0000000309,0000000583,0000000003,0000000013),(0000000309,0000000584,0000000003,0000000013),(0000000309,0000000585,0000000003,0000000013),(0000000310,0000000586,0000000003,0000000010),(0000000310,0000000587,0000000003,0000000010),(0000000310,0000000588,0000000003,0000000010),(0000000310,0000000589,0000000003,0000000010),(0000000310,0000000590,0000000003,0000000010),(0000000310,0000000591,0000000003,0000000010),(0000000310,0000000592,0000000003,0000000010),(0000000310,0000000593,0000000003,0000000010),(0000000310,0000000594,0000000003,0000000010),(0000000310,0000000595,0000000003,0000000010),(0000000310,0000000596,0000000003,0000000010);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbColecoesProduto`
--

LOCK TABLES `tbColecoesProduto` WRITE;
/*!40000 ALTER TABLE `tbColecoesProduto` DISABLE KEYS */;
INSERT INTO `tbColecoesProduto` VALUES (0000000001,'Coleção 2','2014-11-04 17:49:41','2014-11-11 11:15:41'),(0000000003,'Coleção 12','2014-11-04 18:25:14','2014-11-11 11:19:53'),(0000000006,'Calgary','2014-11-04 18:41:49','2014-11-11 11:16:16'),(0000000007,'Mountain','2014-11-04 18:42:56','2014-11-04 18:42:56'),(0000000008,'wood','2014-11-04 19:53:56','2014-11-11 11:16:25'),(0000000009,'Napolis1','2014-11-05 17:25:15','2014-11-10 16:14:55'),(0000000010,'Coleção','2014-11-07 17:29:19','2014-11-11 18:22:54'),(0000000012,'Teste 5','2014-11-10 16:37:41','2014-11-11 11:16:35'),(0000000013,'Col 5','2014-11-11 10:34:12','2014-11-27 14:42:23'),(0000000014,'Cole 5','2014-11-27 13:28:53','2014-11-27 14:48:04'),(0000000015,'teste','2014-11-27 14:46:19','2014-11-27 14:46:19'),(0000000017,'teste1 colecoes','2014-11-27 20:40:35','2014-11-27 20:40:35'),(0000000019,'teste1 col','2014-11-27 23:57:50','2014-11-27 23:57:50');
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
INSERT INTO `tbColecoesProduto_tbDepartamentoProduto` VALUES (0000000003,2),(0000000010,2),(0000000012,2),(0000000014,2),(0000000006,7),(0000000007,7),(0000000001,9),(0000000008,9),(0000000013,9),(0000000009,11),(0000000015,28),(0000000017,29),(0000000019,30);
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
INSERT INTO `tbColecoesProduto_tbGrupoProduto` VALUES (0000000001,0000000002),(0000000003,0000000002),(0000000010,0000000002),(0000000014,0000000002),(0000000012,0000000006),(0000000006,0000000008),(0000000007,0000000008),(0000000008,0000000010),(0000000013,0000000010),(0000000009,0000000011),(0000000015,0000000019),(0000000017,0000000021),(0000000019,0000000023);
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
INSERT INTO `tbColecoesProduto_tbSubGrupoProduto` VALUES (0000000003,0000000002),(0000000014,0000000002),(0000000006,0000000006),(0000000007,0000000006),(0000000008,0000000007),(0000000013,0000000007),(0000000009,0000000008),(0000000001,0000000013),(0000000010,0000000013),(0000000012,0000000013),(0000000015,0000000019),(0000000017,0000000021),(0000000019,0000000022);
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
INSERT INTO `tbConfiguracaoColunaPagina` VALUES (3,2,'ColecoesBean','tbDepartamentoProduto','DepartamentoProduto','igual',300,''),(3,8,'ColecoesBean','tbDepartamentoProduto','id','igual',300,'\0'),(3,12,'ColecoesBean','tbDepartamentoProduto','SystemIncludeDateTime','igual',300,'\0'),(3,14,'ColecoesBean','tbDepartamentoProduto','SystemChangeDateTime','igual',300,'\0'),(3,4,'ColecoesBean','tbGrupoProduto','GrupoProduto','igual',300,''),(3,5,'ColecoesBean','tbGrupoProduto','id','igual',300,'\0'),(3,10,'ColecoesBean','tbGrupoProduto','SystemIncludeDateTime','igual',300,'\0'),(3,15,'ColecoesBean','tbGrupoProduto','SystemChangeDateTime','igual',300,'\0'),(3,3,'ColecoesBean','tbSubGrupoProduto','SubGrupoProduto','igual',300,''),(3,6,'ColecoesBean','tbSubGrupoProduto','id','igual',300,'\0'),(3,9,'ColecoesBean','tbSubGrupoProduto','SystemIncludeDateTime','igual',300,'\0'),(3,13,'ColecoesBean','tbSubGrupoProduto','SystemChangeDateTime','igual',300,'\0'),(3,1,'ColecoesBean','tbColecoesProduto','Colecao','igual',300,''),(3,7,'ColecoesBean','tbColecoesProduto','id','igual',300,'\0'),(3,11,'ColecoesBean','tbColecoesProduto','SystemIncludeDateTime','igual',300,'\0'),(3,16,'ColecoesBean','tbColecoesProduto','SystemChangeDateTime','igual',300,'\0'),(3,2,'GrupoProdutosBean','tbDepartamentoProduto','DepartamentoProduto','contem',250,''),(3,4,'GrupoProdutosBean','tbDepartamentoProduto','id','igual',300,''),(3,5,'GrupoProdutosBean','tbDepartamentoProduto','SystemIncludeDateTime','igual',300,'\0'),(3,7,'GrupoProdutosBean','tbDepartamentoProduto','SystemChangeDateTime','igual',300,'\0'),(3,3,'GrupoProdutosBean','tbGrupoProduto','GrupoProduto','contem',250,''),(3,1,'GrupoProdutosBean','tbGrupoProduto','id','menor',250,''),(3,6,'GrupoProdutosBean','tbGrupoProduto','SystemIncludeDateTime','igual',250,''),(3,8,'GrupoProdutosBean','tbGrupoProduto','SystemChangeDateTime','igual',250,''),(3,2,'DepartamentoBean','tbDepartamentoProduto','DepartamentoProduto','contem',170,''),(3,1,'DepartamentoBean','tbDepartamentoProduto','id','contem',170,''),(3,3,'DepartamentoBean','tbDepartamentoProduto','SystemIncludeDateTime','menor',300,''),(3,4,'DepartamentoBean','tbDepartamentoProduto','SystemChangeDateTime','igual',300,''),(3,2,'SubGrupoProdutoBean','tbDepartamentoProduto','DepartamentoProduto','igual',250,''),(3,5,'SubGrupoProdutoBean','tbDepartamentoProduto','id','igual',300,'\0'),(3,9,'SubGrupoProdutoBean','tbDepartamentoProduto','SystemIncludeDateTime','igual',300,'\0'),(3,11,'SubGrupoProdutoBean','tbDepartamentoProduto','SystemChangeDateTime','igual',300,'\0'),(3,3,'SubGrupoProdutoBean','tbGrupoProduto','GrupoProduto','contem',250,''),(3,6,'SubGrupoProdutoBean','tbGrupoProduto','id','igual',300,'\0'),(3,8,'SubGrupoProdutoBean','tbGrupoProduto','SystemIncludeDateTime','igual',300,'\0'),(3,10,'SubGrupoProdutoBean','tbGrupoProduto','SystemChangeDateTime','igual',300,'\0'),(3,4,'SubGrupoProdutoBean','tbSubGrupoProduto','SubGrupoProduto','contem',250,''),(3,1,'SubGrupoProdutoBean','tbSubGrupoProduto','id','igual',170,''),(3,7,'SubGrupoProdutoBean','tbSubGrupoProduto','SystemIncludeDateTime','igual',250,'\0'),(3,12,'SubGrupoProdutoBean','tbSubGrupoProduto','SystemChangeDateTime','igual',250,'\0'),(3,5,'CorProdutoBean','tbCorProduto','CorCodigo','igual',300,''),(3,10,'CorProdutoBean','tbCorProduto','CorDescricao','igual',300,'\0'),(3,14,'CorProdutoBean','tbCorProduto','id','igual',300,''),(3,18,'CorProdutoBean','tbCorProduto','SystemIncludeDateTime','igual',300,'\0'),(3,21,'CorProdutoBean','tbCorProduto','SystemChangeDateTime','igual',300,'\0'),(3,1,'CorProdutoBean','tbDepartamentoProduto','DepartamentoProduto','contem',300,''),(3,9,'CorProdutoBean','tbDepartamentoProduto','id','igual',300,'\0'),(3,11,'CorProdutoBean','tbDepartamentoProduto','SystemIncludeDateTime','igual',300,'\0'),(3,16,'CorProdutoBean','tbDepartamentoProduto','SystemChangeDateTime','igual',300,'\0'),(3,3,'CorProdutoBean','tbSubGrupoProduto','SubGrupoProduto','igual',300,''),(3,8,'CorProdutoBean','tbSubGrupoProduto','id','igual',300,'\0'),(3,12,'CorProdutoBean','tbSubGrupoProduto','SystemIncludeDateTime','igual',300,'\0'),(3,19,'CorProdutoBean','tbSubGrupoProduto','SystemChangeDateTime','igual',300,'\0'),(3,2,'CorProdutoBean','tbGrupoProduto','GrupoProduto','contem',300,''),(3,7,'CorProdutoBean','tbGrupoProduto','id','igual',300,'\0'),(3,15,'CorProdutoBean','tbGrupoProduto','SystemIncludeDateTime','igual',300,'\0'),(3,17,'CorProdutoBean','tbGrupoProduto','SystemChangeDateTime','igual',300,'\0'),(3,4,'CorProdutoBean','tbColecoesProduto','Colecao','igual',300,''),(3,6,'CorProdutoBean','tbColecoesProduto','id','igual',300,'\0'),(3,13,'CorProdutoBean','tbColecoesProduto','SystemIncludeDateTime','igual',300,'\0'),(3,20,'CorProdutoBean','tbColecoesProduto','SystemChangeDateTime','igual',300,'\0'),(3,2,'UnidadeBean','tbUnidade','Abreviacao','contem',300,''),(3,3,'UnidadeBean','tbUnidade','Unidade','contem',300,''),(3,1,'UnidadeBean','tbUnidade','id','igual',250,''),(3,4,'UnidadeBean','tbUnidade','SystemIncludeDateTime','igual',300,'\0'),(3,5,'UnidadeBean','tbUnidade','SystemChangeDateTime','igual',300,'\0'),(3,1,'TipoProdutoBean','tbTipoProduto','TipoProduto','contem',300,''),(3,2,'TipoProdutoBean','tbTipoProduto','id','igual',300,''),(3,3,'TipoProdutoBean','tbTipoProduto','SystemIncludeDateTime','igual',300,''),(3,4,'TipoProdutoBean','tbTipoProduto','SystemChangeDateTime','igual',300,''),(3,1,'ProdutoPadraoLarguraBean','tbColecoesProduto','Colecao','contem',300,''),(3,2,'ProdutoPadraoLarguraBean','tbColecoesProduto','id','igual',300,'\0'),(3,3,'ProdutoPadraoLarguraBean','tbColecoesProduto','SystemIncludeDateTime','igual',300,'\0'),(3,4,'ProdutoPadraoLarguraBean','tbColecoesProduto','SystemChangeDateTime','igual',300,'\0'),(3,5,'ProdutoPadraoLarguraBean','tbCorProduto','CorCodigo','igual',300,''),(3,6,'ProdutoPadraoLarguraBean','tbCorProduto','CorDescricao','igual',300,''),(3,7,'ProdutoPadraoLarguraBean','tbCorProduto','id','igual',300,'\0'),(3,8,'ProdutoPadraoLarguraBean','tbCorProduto','SystemIncludeDateTime','igual',300,'\0'),(3,9,'ProdutoPadraoLarguraBean','tbCorProduto','SystemChangeDateTime','igual',300,'\0'),(3,10,'ProdutoPadraoLarguraBean','tbDepartamentoProduto','DepartamentoProduto','igual',300,''),(3,11,'ProdutoPadraoLarguraBean','tbDepartamentoProduto','id','igual',300,'\0'),(3,12,'ProdutoPadraoLarguraBean','tbDepartamentoProduto','SystemIncludeDateTime','igual',300,'\0'),(3,13,'ProdutoPadraoLarguraBean','tbDepartamentoProduto','SystemChangeDateTime','igual',300,'\0'),(3,14,'ProdutoPadraoLarguraBean','tbGrupoProduto','GrupoProduto','igual',300,''),(3,15,'ProdutoPadraoLarguraBean','tbGrupoProduto','id','igual',300,'\0'),(3,16,'ProdutoPadraoLarguraBean','tbGrupoProduto','SystemIncludeDateTime','igual',300,'\0'),(3,17,'ProdutoPadraoLarguraBean','tbGrupoProduto','SystemChangeDateTime','igual',300,'\0'),(3,18,'ProdutoPadraoLarguraBean','tbPadroesLarguraProduto','Largura','igual',300,''),(3,19,'ProdutoPadraoLarguraBean','tbPadroesLarguraProduto','LarguraDescricao','igual',300,''),(3,20,'ProdutoPadraoLarguraBean','tbPadroesLarguraProduto','id','igual',300,'\0'),(3,21,'ProdutoPadraoLarguraBean','tbPadroesLarguraProduto','SystemIncludeDateTime','igual',300,'\0'),(3,22,'ProdutoPadraoLarguraBean','tbPadroesLarguraProduto','SystemChangeDateTime','igual',300,'\0'),(3,23,'ProdutoPadraoLarguraBean','tbSubGrupoProduto','SubGrupoProduto','igual',300,''),(3,24,'ProdutoPadraoLarguraBean','tbSubGrupoProduto','id','igual',300,'\0'),(3,25,'ProdutoPadraoLarguraBean','tbSubGrupoProduto','SystemIncludeDateTime','igual',300,'\0'),(3,26,'ProdutoPadraoLarguraBean','tbSubGrupoProduto','SystemChangeDateTime','igual',300,'\0'),(3,27,'ProdutoPadraoLarguraBean','tbUnidade','Abreviacao','igual',300,''),(3,28,'ProdutoPadraoLarguraBean','tbUnidade','Unidade','igual',300,''),(3,29,'ProdutoPadraoLarguraBean','tbUnidade','id','igual',300,'\0'),(3,30,'ProdutoPadraoLarguraBean','tbUnidade','SystemIncludeDateTime','igual',300,'\0'),(3,31,'ProdutoPadraoLarguraBean','tbUnidade','SystemChangeDateTime','igual',300,'\0'),(3,1,'ProdutoPadraoEspessuraBean','tbColecoesProduto','Colecao','contem',300,''),(3,2,'ProdutoPadraoEspessuraBean','tbColecoesProduto','id','igual',300,'\0'),(3,3,'ProdutoPadraoEspessuraBean','tbColecoesProduto','SystemIncludeDateTime','igual',300,'\0'),(3,4,'ProdutoPadraoEspessuraBean','tbColecoesProduto','SystemChangeDateTime','igual',300,'\0'),(3,5,'ProdutoPadraoEspessuraBean','tbCorProduto','CorCodigo','igual',300,''),(3,6,'ProdutoPadraoEspessuraBean','tbCorProduto','CorDescricao','igual',300,''),(3,7,'ProdutoPadraoEspessuraBean','tbCorProduto','id','igual',300,'\0'),(3,8,'ProdutoPadraoEspessuraBean','tbCorProduto','SystemIncludeDateTime','igual',300,'\0'),(3,9,'ProdutoPadraoEspessuraBean','tbCorProduto','SystemChangeDateTime','igual',300,'\0'),(3,10,'ProdutoPadraoEspessuraBean','tbDepartamentoProduto','DepartamentoProduto','igual',300,''),(3,11,'ProdutoPadraoEspessuraBean','tbDepartamentoProduto','id','igual',300,'\0'),(3,12,'ProdutoPadraoEspessuraBean','tbDepartamentoProduto','SystemIncludeDateTime','igual',300,'\0'),(3,13,'ProdutoPadraoEspessuraBean','tbDepartamentoProduto','SystemChangeDateTime','igual',300,'\0'),(3,14,'ProdutoPadraoEspessuraBean','tbGrupoProduto','GrupoProduto','igual',300,''),(3,15,'ProdutoPadraoEspessuraBean','tbGrupoProduto','id','igual',300,'\0'),(3,16,'ProdutoPadraoEspessuraBean','tbGrupoProduto','SystemIncludeDateTime','igual',300,'\0'),(3,17,'ProdutoPadraoEspessuraBean','tbGrupoProduto','SystemChangeDateTime','igual',300,'\0'),(3,18,'ProdutoPadraoEspessuraBean','tbPadroesEspessuraProduto','Espessura','igual',300,''),(3,19,'ProdutoPadraoEspessuraBean','tbPadroesEspessuraProduto','EspessuraDescricao','igual',300,''),(3,20,'ProdutoPadraoEspessuraBean','tbPadroesEspessuraProduto','id','igual',300,'\0'),(3,21,'ProdutoPadraoEspessuraBean','tbPadroesEspessuraProduto','SystemIncludeDateTime','igual',300,'\0'),(3,22,'ProdutoPadraoEspessuraBean','tbPadroesEspessuraProduto','SystemChangeDateTime','igual',300,'\0'),(3,23,'ProdutoPadraoEspessuraBean','tbSubGrupoProduto','SubGrupoProduto','igual',300,''),(3,24,'ProdutoPadraoEspessuraBean','tbSubGrupoProduto','id','igual',300,'\0'),(3,25,'ProdutoPadraoEspessuraBean','tbSubGrupoProduto','SystemIncludeDateTime','igual',300,'\0'),(3,26,'ProdutoPadraoEspessuraBean','tbSubGrupoProduto','SystemChangeDateTime','igual',300,'\0'),(3,27,'ProdutoPadraoEspessuraBean','tbUnidade','Abreviacao','igual',300,''),(3,28,'ProdutoPadraoEspessuraBean','tbUnidade','Unidade','igual',300,''),(3,29,'ProdutoPadraoEspessuraBean','tbUnidade','id','igual',300,'\0'),(3,30,'ProdutoPadraoEspessuraBean','tbUnidade','SystemIncludeDateTime','igual',300,'\0'),(3,31,'ProdutoPadraoEspessuraBean','tbUnidade','SystemChangeDateTime','igual',300,'\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCorProduto`
--

LOCK TABLES `tbCorProduto` WRITE;
/*!40000 ALTER TABLE `tbCorProduto` DISABLE KEYS */;
INSERT INTO `tbCorProduto` VALUES (0000000001,'1','Cor 1','2014-11-04 17:50:37','2014-11-04 17:50:37'),(0000000003,'1','Cor 1','2014-11-04 18:30:06','2014-11-04 18:30:06'),(0000000004,'22','Cor 21','2014-11-04 18:30:36','2014-11-07 18:02:37'),(0000000006,'55','Azul','2014-11-04 18:42:33','2014-11-04 18:42:33'),(0000000007,'35','Metalic Blue','2014-11-04 18:43:36','2014-11-04 18:43:48'),(0000000008,'10','Tabaco','2014-11-04 19:56:11','2014-11-04 19:56:11'),(0000000009,'001','White12','2014-11-05 17:26:11','2014-11-11 11:15:10'),(0000000010,'1','teste','2014-11-11 11:12:58','2014-11-27 14:49:21'),(0000000012,'3','cor','2014-11-27 14:50:14','2014-11-27 14:50:32'),(0000000013,'10','cor 10','2014-11-27 15:09:44','2014-11-27 15:09:44'),(0000000014,'000001','Branco','2014-11-27 20:41:08','2014-11-27 20:41:08'),(0000000017,'000001','teste1 cor branca','2014-11-28 00:00:07','2014-11-28 00:00:07');
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
INSERT INTO `tbCorProduto_tbColecoesProduto` VALUES (0000000001,0000000001),(0000000003,0000000003),(0000000004,0000000001),(0000000006,0000000006),(0000000007,0000000006),(0000000008,0000000008),(0000000009,0000000012),(0000000010,0000000010),(0000000012,0000000003),(0000000013,0000000015),(0000000014,0000000017),(0000000017,0000000019);
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
INSERT INTO `tbCorProduto_tbDepartamentoProduto` VALUES (0000000001,0000000001),(0000000003,0000000001),(0000000009,0000000001),(0000000010,0000000002),(0000000012,0000000002),(0000000004,0000000003),(0000000006,0000000007),(0000000007,0000000007),(0000000008,0000000009),(0000000013,0000000028),(0000000014,0000000029),(0000000017,0000000030);
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
INSERT INTO `tbCorProduto_tbGrupoProduto` VALUES (0000000001,0000000001),(0000000004,0000000001),(0000000010,0000000002),(0000000012,0000000002),(0000000003,0000000004),(0000000006,0000000008),(0000000007,0000000008),(0000000008,0000000010),(0000000013,0000000019),(0000000014,0000000021),(0000000017,0000000023);
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
INSERT INTO `tbCorProduto_tbSubGrupoProduto` VALUES (0000000001,0000000001),(0000000004,0000000001),(0000000012,0000000002),(0000000003,0000000004),(0000000006,0000000006),(0000000007,0000000006),(0000000008,0000000007),(0000000010,0000000013),(0000000013,0000000019),(0000000014,0000000021),(0000000017,0000000022);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbDepartamentoProduto`
--

LOCK TABLES `tbDepartamentoProduto` WRITE;
/*!40000 ALTER TABLE `tbDepartamentoProduto` DISABLE KEYS */;
INSERT INTO `tbDepartamentoProduto` VALUES (0000000001,'Depto 11','2014-11-04 17:45:24','2014-11-27 23:26:42'),(0000000002,'Depto 2, alteração','2014-11-04 17:45:38','2014-11-10 17:30:24'),(0000000003,'Departamento 4','2014-11-04 18:04:21','2014-11-04 18:05:10'),(0000000005,'Depto 5','2014-11-04 18:06:37','2014-11-27 14:35:47'),(0000000007,'Persiana Vertical','2014-11-04 18:38:41','2014-11-04 18:38:41'),(0000000009,'Persiana Horizontal','2014-11-04 19:46:34','2014-11-04 19:46:34'),(0000000011,'Tecidos','2014-11-05 16:53:41','2014-11-05 16:53:41'),(0000000012,'Laminas','2014-11-05 17:23:03','2014-11-05 17:23:03'),(0000000023,'Produto 1','2014-11-11 12:02:18','2014-11-11 18:13:48'),(0000000026,'10','2014-11-11 18:38:51','2014-11-11 18:38:51'),(0000000028,'Depto 10.1','2014-11-27 14:35:31','2014-11-27 14:36:09'),(0000000029,'teste','2014-11-27 19:55:04','2014-11-27 23:26:29'),(0000000030,'teste1 dpt','2014-11-27 23:42:18','2014-11-27 23:42:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbGrupoProduto`
--

LOCK TABLES `tbGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbGrupoProduto` DISABLE KEYS */;
INSERT INTO `tbGrupoProduto` VALUES (0000000001,'Grupo 1','2014-11-04 17:46:03','2014-11-27 20:33:07'),(0000000002,'Grupo 22','2014-11-04 17:47:13','2014-11-04 18:16:17'),(0000000004,'Grupo Produto 2','2014-11-04 18:11:53','2014-11-04 18:15:59'),(0000000006,'Grupo 2','2014-11-04 18:18:14','2014-11-27 14:38:27'),(0000000008,'Tecidos','2014-11-04 18:39:25','2014-11-04 18:39:53'),(0000000010,'Madeira','2014-11-04 19:49:27','2014-11-04 19:49:27'),(0000000011,'Rollo / Romana / Painel','2014-11-05 16:54:58','2014-11-05 16:54:58'),(0000000019,'Grupo 10','2014-11-27 14:38:03','2014-11-27 14:38:03'),(0000000021,'teste1 grp','2014-11-27 19:56:44','2014-11-27 19:56:44'),(0000000023,'teste1 grp','2014-11-27 23:42:42','2014-11-28 00:47:56'),(0000000025,'teste1 grp','2014-11-28 00:16:01','2014-11-28 00:16:01');
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
INSERT INTO `tbGrupoProduto_tbDepartamentoProduto` VALUES (0000000004,0000000001),(0000000002,0000000002),(0000000006,0000000002),(0000000001,0000000003),(0000000008,0000000007),(0000000010,0000000009),(0000000011,0000000011),(0000000019,0000000028),(0000000021,0000000029),(0000000023,0000000030),(0000000025,0000000030);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesEspessuraProduto`
--

LOCK TABLES `tbPadroesEspessuraProduto` WRITE;
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto` DISABLE KEYS */;
INSERT INTO `tbPadroesEspessuraProduto` VALUES (0000000001,1.000,'123456','2014-11-27 10:50:30','2014-11-27 15:18:18'),(0000000004,10.100,'teste','2014-11-27 15:13:51','2014-11-27 15:13:51');
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
  UNIQUE KEY `tbPadroesEspessuraProduto_Id_UNIQUE` (`tbPadroesEspessuraProduto_Id`),
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
INSERT INTO `tbPadroesEspessuraProduto_tbColecoesProduto` VALUES (0000000001,0000000003),(0000000004,0000000003);
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
  UNIQUE KEY `tbPadoresEspessuraProduto_Id_UNIQUE` (`tbPadoresEspessuraProduto_Id`),
  KEY `FK_tbCorProduto0002` (`tbCorProduto_Id`),
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
  UNIQUE KEY `tbPadroesEspessurasProduto_Id_UNIQUE` (`tbPadroesEspessurasProduto_Id`),
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
INSERT INTO `tbPadroesEspessuraProduto_tbDepartamento` VALUES (0000000001,0000000002),(0000000004,0000000002);
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
  UNIQUE KEY `tbPadroesEspessuraProduto_Id_UNIQUE` (`tbPadroesEspessuraProduto_Id`),
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
INSERT INTO `tbPadroesEspessuraProduto_tbGrupoProduto` VALUES (0000000001,0000000006),(0000000004,0000000002);
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
  UNIQUE KEY `tbPadroesEspessuraProduto_Id_UNIQUE` (`tbPadroesEspessuraProduto_Id`),
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
INSERT INTO `tbPadroesEspessuraProduto_tbSubGrupoProduto` VALUES (0000000001,0000000002),(0000000004,0000000002);
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto_tbSubGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPadroesEspessuraProduto_tbUnidade`
--

DROP TABLE IF EXISTS `tbPadroesEspessuraProduto_tbUnidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPadroesEspessuraProduto_tbUnidade` (
  `tbPadroesEspessuraProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbUnidade_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbPadroesEspessuraProduto_Id`,`tbUnidade_Id`),
  UNIQUE KEY `tbPadroesEspessuraProduto_Id_UNIQUE` (`tbPadroesEspessuraProduto_Id`),
  KEY `FK_tbUnidade0007` (`tbUnidade_Id`),
  CONSTRAINT `FK_tbPadroesEspessuraProduto0008` FOREIGN KEY (`tbPadroesEspessuraProduto_Id`) REFERENCES `tbPadroesEspessuraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0007` FOREIGN KEY (`tbUnidade_Id`) REFERENCES `tbUnidade` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesEspessuraProduto_tbUnidade`
--

LOCK TABLES `tbPadroesEspessuraProduto_tbUnidade` WRITE;
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto_tbUnidade` DISABLE KEYS */;
INSERT INTO `tbPadroesEspessuraProduto_tbUnidade` VALUES (0000000001,0000000013),(0000000004,0000000013);
/*!40000 ALTER TABLE `tbPadroesEspessuraProduto_tbUnidade` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesLarguraProduto`
--

LOCK TABLES `tbPadroesLarguraProduto` WRITE;
/*!40000 ALTER TABLE `tbPadroesLarguraProduto` DISABLE KEYS */;
INSERT INTO `tbPadroesLarguraProduto` VALUES (0000000008,1.000,'123','2014-11-27 21:32:32','2014-11-27 21:32:32'),(0000000009,1.000,'123','2014-11-27 21:33:14','2014-11-27 21:33:14'),(0000000010,1.000,'asdadasda','2014-11-27 21:33:41','2014-11-27 21:33:41');
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
  UNIQUE KEY `tbPadroesLarguraProduto_Id_UNIQUE` (`tbPadroesLarguraProduto_Id`),
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
INSERT INTO `tbPadroesLarguraProduto_tbColecoesProduto` VALUES (0000000008,0000000003),(0000000009,0000000017),(0000000010,0000000017);
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
  UNIQUE KEY `tbPadroesLarguraProduto_Id_UNIQUE` (`tbPadroesLarguraProduto_Id`),
  KEY `FK_tbCorProduto0003` (`tbCorProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0003` FOREIGN KEY (`tbCorProduto_Id`) REFERENCES `tbCorProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesLarguraProduto0006` FOREIGN KEY (`tbPadroesLarguraProduto_Id`) REFERENCES `tbPadroesLarguraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesLarguraProduto_tbCorProduto`
--

LOCK TABLES `tbPadroesLarguraProduto_tbCorProduto` WRITE;
/*!40000 ALTER TABLE `tbPadroesLarguraProduto_tbCorProduto` DISABLE KEYS */;
INSERT INTO `tbPadroesLarguraProduto_tbCorProduto` VALUES (0000000008,0000000003),(0000000009,0000000014),(0000000010,0000000014);
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
  UNIQUE KEY `tbPadroesLarguraProduto_Id_UNIQUE` (`tbPadroesLarguraProduto_Id`),
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
INSERT INTO `tbPadroesLarguraProduto_tbDepartamentoProduto` VALUES (0000000008,0000000002),(0000000009,0000000029),(0000000010,0000000029);
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
  UNIQUE KEY `tbPadroesLarguraProduto_Id_UNIQUE` (`tbPadroesLarguraProduto_Id`),
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
INSERT INTO `tbPadroesLarguraProduto_tbGrupoProduto` VALUES (0000000008,0000000002),(0000000009,0000000021),(0000000010,0000000021);
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
  UNIQUE KEY `tbPadroesLarguraProduto_Id_UNIQUE` (`tbPadroesLarguraProduto_Id`),
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
INSERT INTO `tbPadroesLarguraProduto_tbSubGrupoProduto` VALUES (0000000008,0000000002),(0000000009,0000000021),(0000000010,0000000021);
/*!40000 ALTER TABLE `tbPadroesLarguraProduto_tbSubGrupoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPadroesLarguraProduto_tbUnidade`
--

DROP TABLE IF EXISTS `tbPadroesLarguraProduto_tbUnidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbPadroesLarguraProduto_tbUnidade` (
  `tbPadroesLarguraProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbUnidade_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`,`tbUnidade_Id`),
  UNIQUE KEY `tbPadroesLarguraProduto_Id_UNIQUE` (`tbPadroesLarguraProduto_Id`),
  KEY `FK_tbUnidade0008` (`tbUnidade_Id`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0008` FOREIGN KEY (`tbPadroesLarguraProduto_Id`) REFERENCES `tbPadroesLarguraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0008` FOREIGN KEY (`tbUnidade_Id`) REFERENCES `tbUnidade` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPadroesLarguraProduto_tbUnidade`
--

LOCK TABLES `tbPadroesLarguraProduto_tbUnidade` WRITE;
/*!40000 ALTER TABLE `tbPadroesLarguraProduto_tbUnidade` DISABLE KEYS */;
INSERT INTO `tbPadroesLarguraProduto_tbUnidade` VALUES (0000000008,0000000010),(0000000009,0000000010),(0000000010,0000000010);
/*!40000 ALTER TABLE `tbPadroesLarguraProduto_tbUnidade` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbSubGrupoProduto`
--

LOCK TABLES `tbSubGrupoProduto` WRITE;
/*!40000 ALTER TABLE `tbSubGrupoProduto` DISABLE KEYS */;
INSERT INTO `tbSubGrupoProduto` VALUES (0000000001,'SubGrupo 1','2014-11-04 17:47:57','2014-11-04 17:47:57'),(0000000002,'SubGrupo 2','2014-11-04 17:48:28','2014-11-04 17:48:28'),(0000000004,'Sub 3','2014-11-04 18:19:03','2014-11-27 14:41:20'),(0000000006,'Anti-Chama','2014-11-04 18:40:37','2014-11-04 18:40:59'),(0000000007,'Vinilico','2014-11-04 19:50:57','2014-11-04 19:50:57'),(0000000008,'Translucida','2014-11-05 16:58:04','2014-11-05 16:58:04'),(0000000009,'SubGrupo ','2014-11-10 16:24:50','2014-11-10 17:13:30'),(0000000013,'SubGrupo de Produto','2014-11-10 16:37:05','2014-11-11 18:21:58'),(0000000019,'Sub 10','2014-11-27 14:39:55','2014-11-27 14:46:07'),(0000000021,'teste1 sbgrp','2014-11-27 20:39:57','2014-11-27 20:39:57'),(0000000022,'teste1 sbgrp','2014-11-27 23:52:25','2014-11-28 00:04:08');
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
INSERT INTO `tbSubGrupoProduto_tbDepartamentoProduto` VALUES (0000000001,0000000001),(0000000004,0000000001),(0000000002,0000000002),(0000000013,0000000002),(0000000006,0000000007),(0000000007,0000000009),(0000000009,0000000009),(0000000008,0000000011),(0000000019,0000000028),(0000000021,0000000029),(0000000022,0000000030);
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
INSERT INTO `tbSubGrupoProduto_tbGrupoProduto` VALUES (0000000001,0000000001),(0000000004,0000000001),(0000000002,0000000002),(0000000013,0000000002),(0000000006,0000000008),(0000000007,0000000010),(0000000009,0000000010),(0000000008,0000000011),(0000000019,0000000019),(0000000021,0000000021),(0000000022,0000000023);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbTipoProduto`
--

LOCK TABLES `tbTipoProduto` WRITE;
/*!40000 ALTER TABLE `tbTipoProduto` DISABLE KEYS */;
INSERT INTO `tbTipoProduto` VALUES (0000000003,'Update TEste','2014-11-27 10:50:41','2014-11-27 16:27:15'),(0000000004,'Prod 10','2014-11-27 14:53:44','2014-11-27 14:54:32'),(0000000005,'teste123','2014-11-27 14:53:53','2014-11-27 14:54:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbUnidade`
--

LOCK TABLES `tbUnidade` WRITE;
/*!40000 ALTER TABLE `tbUnidade` DISABLE KEYS */;
INSERT INTO `tbUnidade` VALUES (0000000010,'UND','Unidade','','','\0','\0','\0','\0','','','','','','','','\0','\0','\0','\0','\0','\0','2014-11-27 10:49:14','2014-11-27 20:43:50'),(0000000011,'MM','Milimetro','\0','\0','','','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','2014-11-27 11:28:44','2014-11-27 11:28:44'),(0000000012,'ML','Metro Linear','','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','2014-11-27 14:51:18','2014-11-27 20:42:17'),(0000000013,'YD','Jarda','','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','2014-11-27 14:52:16','2014-11-27 20:43:13');
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

-- Dump completed on 2014-12-01 17:34:12
