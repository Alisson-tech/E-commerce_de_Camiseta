-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: ecommerce
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

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
-- Table structure for table `carrinho`
--

DROP TABLE IF EXISTS `carrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrinho` (
  `CPF` varchar(32) NOT NULL,
  `idtamanho` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  KEY `idtamanho_fk_carrinho` (`idtamanho`),
  KEY `cpf_fk_carrinho` (`CPF`),
  CONSTRAINT `cpf_fk_carrinho` FOREIGN KEY (`CPF`) REFERENCES `usuario` (`CPF`),
  CONSTRAINT `idtamanho_fk_carrinho` FOREIGN KEY (`idtamanho`) REFERENCES `tamanho` (`idtamanho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinho`
--

LOCK TABLES `carrinho` WRITE;
/*!40000 ALTER TABLE `carrinho` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrinho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao`
--

DROP TABLE IF EXISTS `cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartao` (
  `CPF` varchar(32) NOT NULL,
  `tipo` varchar(7) NOT NULL,
  `cvv` varchar(4) NOT NULL,
  `numero` varchar(19) NOT NULL,
  `validade` date NOT NULL,
  `nomeCartao` varchar(45) NOT NULL,
  KEY `cpf_fk_cartao` (`CPF`),
  CONSTRAINT `cpf_fk_cartao` FOREIGN KEY (`CPF`) REFERENCES `usuario` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao`
--

LOCK TABLES `cartao` WRITE;
/*!40000 ALTER TABLE `cartao` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `CPF` varchar(32) NOT NULL,
  `CEP` varchar(5) NOT NULL,
  `rua` varchar(25) NOT NULL,
  `bairro` varchar(15) NOT NULL,
  `cidade` varchar(15) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `Complemento` varchar(30) DEFAULT NULL,
  KEY `cpf_fk_endereco` (`CPF`),
  CONSTRAINT `cpf_fk_endereco` FOREIGN KEY (`CPF`) REFERENCES `usuario` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico` (
  `CPF` varchar(32) NOT NULL,
  `idtamanho` int(11) NOT NULL,
  `data` date NOT NULL,
  `quantidade` int(11) NOT NULL,
  KEY `idtamanho_fk_historico` (`idtamanho`),
  KEY `cpf_fk_historico` (`CPF`),
  CONSTRAINT `cpf_fk_historico` FOREIGN KEY (`CPF`) REFERENCES `usuario` (`CPF`),
  CONSTRAINT `idtamanho_fk_historico` FOREIGN KEY (`idtamanho`) REFERENCES `tamanho` (`idtamanho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loja`
--

DROP TABLE IF EXISTS `loja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loja` (
  `idloja` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`idloja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loja`
--

LOCK TABLES `loja` WRITE;
/*!40000 ALTER TABLE `loja` DISABLE KEYS */;
/*!40000 ALTER TABLE `loja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `idloja` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `imagem` longblob NOT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `idloja_fk_produto` (`idloja`),
  CONSTRAINT `idloja_fk_produto` FOREIGN KEY (`idloja`) REFERENCES `loja` (`idloja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamanho`
--

DROP TABLE IF EXISTS `tamanho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tamanho` (
  `idtamanho` int(11) NOT NULL AUTO_INCREMENT,
  `idProduto` int(11) NOT NULL,
  `tamanho` varchar(2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`idtamanho`),
  KEY `idproduto_fk_tamanho` (`idProduto`),
  CONSTRAINT `idproduto_fk_tamanho` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamanho`
--

LOCK TABLES `tamanho` WRITE;
/*!40000 ALTER TABLE `tamanho` DISABLE KEYS */;
/*!40000 ALTER TABLE `tamanho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `CPF` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `nome` varchar(32) NOT NULL,
  `senha` varchar(32) NOT NULL,
  `idLoja` int(11) DEFAULT NULL,
  PRIMARY KEY (`CPF`),
  KEY `idloja_fk_usuario` (`idLoja`),
  CONSTRAINT `idloja_fk_usuario` FOREIGN KEY (`idLoja`) REFERENCES `loja` (`idloja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-18 15:05:27
