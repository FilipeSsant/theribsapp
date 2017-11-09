-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dbtheribssh
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `tbl_avaliacao`
--

DROP TABLE IF EXISTS `tbl_avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_avaliacao` (
  `id_avaliacao` int(11) NOT NULL AUTO_INCREMENT,
  `nota` float NOT NULL,
  `nome` varchar(100) NOT NULL,
  `imagem` varchar(200) NOT NULL,
  PRIMARY KEY (`id_avaliacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_avaliacao`
--

LOCK TABLES `tbl_avaliacao` WRITE;
/*!40000 ALTER TABLE `tbl_avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_banco`
--

DROP TABLE IF EXISTS `tbl_banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_banco` (
  `id_banco` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `logo` varchar(200) NOT NULL,
  PRIMARY KEY (`id_banco`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_banco`
--

LOCK TABLES `tbl_banco` WRITE;
/*!40000 ALTER TABLE `tbl_banco` DISABLE KEYS */;
INSERT INTO `tbl_banco` VALUES (1,'Mastercard','caminho'),(2,'Visa','caminho');
/*!40000 ALTER TABLE `tbl_banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_boleto`
--

DROP TABLE IF EXISTS `tbl_boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_boleto` (
  `id_boleto` int(11) NOT NULL AUTO_INCREMENT,
  `id_banco` int(11) NOT NULL,
  `id_pedidocompra` int(11) NOT NULL,
  `num_identificacao` varchar(50) NOT NULL,
  `data_vencimento` date NOT NULL,
  `valor` float NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_boleto`),
  KEY `fk_id_pedidocompra_idx` (`id_pedidocompra`),
  KEY `fk_id_banco_idx` (`id_banco`),
  CONSTRAINT `fk_id_banco2` FOREIGN KEY (`id_banco`) REFERENCES `tbl_banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_pedidocompra2` FOREIGN KEY (`id_pedidocompra`) REFERENCES `tbl_pedidocompra` (`id_pedidocompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_boleto`
--

LOCK TABLES `tbl_boleto` WRITE;
/*!40000 ALTER TABLE `tbl_boleto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cardapio`
--

DROP TABLE IF EXISTS `tbl_cardapio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cardapio` (
  `id_cardapio` int(11) NOT NULL AUTO_INCREMENT,
  `id_restaurante` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_cardapio`),
  KEY `fk_restauranteCardapio_idx` (`id_restaurante`),
  CONSTRAINT `fk_restauranteCardapio` FOREIGN KEY (`id_restaurante`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cardapio`
--

LOCK TABLES `tbl_cardapio` WRITE;
/*!40000 ALTER TABLE `tbl_cardapio` DISABLE KEYS */;
INSERT INTO `tbl_cardapio` VALUES (6,1,'Card�pio Oficial',1);
/*!40000 ALTER TABLE `tbl_cardapio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cardapioproduto`
--

DROP TABLE IF EXISTS `tbl_cardapioproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cardapioproduto` (
  `id_cardapioProduto` int(11) NOT NULL AUTO_INCREMENT,
  `id_cardapio` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `principais` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_cardapioProduto`),
  KEY `fk_cardapio_idx` (`id_cardapio`),
  KEY `fk_produtocardapio_idx` (`id_produto`),
  CONSTRAINT `fk_cardapio` FOREIGN KEY (`id_cardapio`) REFERENCES `tbl_cardapio` (`id_cardapio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtocardapio` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cardapioproduto`
--

LOCK TABLES `tbl_cardapioproduto` WRITE;
/*!40000 ALTER TABLE `tbl_cardapioproduto` DISABLE KEYS */;
INSERT INTO `tbl_cardapioproduto` VALUES (22,6,5,1),(23,6,6,1),(24,6,7,1);
/*!40000 ALTER TABLE `tbl_cardapioproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cargo`
--

DROP TABLE IF EXISTS `tbl_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cargo` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cargo`
--

LOCK TABLES `tbl_cargo` WRITE;
/*!40000 ALTER TABLE `tbl_cargo` DISABLE KEYS */;
INSERT INTO `tbl_cargo` VALUES (20,'Administrador'),(21,'Cozinheiro');
/*!40000 ALTER TABLE `tbl_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cargopermissao`
--

DROP TABLE IF EXISTS `tbl_cargopermissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cargopermissao` (
  `id_cargoPermissao` int(11) NOT NULL AUTO_INCREMENT,
  `id_cargo` int(11) NOT NULL,
  `id_permissao` int(11) NOT NULL,
  PRIMARY KEY (`id_cargoPermissao`),
  KEY `fk_id_cargo_idx` (`id_cargo`),
  KEY `fk_id_permissao_idx` (`id_permissao`),
  CONSTRAINT `fk_id_cargo2` FOREIGN KEY (`id_cargo`) REFERENCES `tbl_cargo` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_permissao` FOREIGN KEY (`id_permissao`) REFERENCES `tbl_permissao` (`id_permissao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cargopermissao`
--

LOCK TABLES `tbl_cargopermissao` WRITE;
/*!40000 ALTER TABLE `tbl_cargopermissao` DISABLE KEYS */;
INSERT INTO `tbl_cargopermissao` VALUES (89,20,1),(90,20,2),(91,20,3),(92,20,4),(93,20,5),(94,20,6),(95,20,7),(96,20,8),(97,20,9),(98,20,10),(99,20,11),(100,20,12),(101,20,13),(102,20,14),(103,20,15),(104,20,16),(105,20,17),(106,21,4),(107,21,6),(108,21,7);
/*!40000 ALTER TABLE `tbl_cargopermissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cartaocredito`
--

DROP TABLE IF EXISTS `tbl_cartaocredito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cartaocredito` (
  `id_cartaocredito` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_banco` int(11) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `nome_cartao` varchar(100) NOT NULL,
  `data` varchar(7) NOT NULL,
  `cvv` varchar(5) NOT NULL,
  PRIMARY KEY (`id_cartaocredito`),
  KEY `fk_id_cliente_idx` (`id_cliente`),
  KEY `fk_id_banco_idx` (`id_banco`),
  CONSTRAINT `fk_id_banco` FOREIGN KEY (`id_banco`) REFERENCES `tbl_banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_cliente3` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cartaocredito`
--

LOCK TABLES `tbl_cartaocredito` WRITE;
/*!40000 ALTER TABLE `tbl_cartaocredito` DISABLE KEYS */;
INSERT INTO `tbl_cartaocredito` VALUES (1,3,1,'6541 6546 5351 6556','BEATRIZ CASTRO','12/2017','123'),(2,5,2,'6666 6666 6666 6666','MATHEUS MACHADO FROTA','25/2019','666'),(3,6,2,'5645 4646 5666 4564','4546456764','12/2019','656'),(4,7,2,'6666 6666 6666 6666','NO�','25/2018','666');
/*!40000 ALTER TABLE `tbl_cartaocredito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_categoria`
--

DROP TABLE IF EXISTS `tbl_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `imagem` varchar(200) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categoria`
--

LOCK TABLES `tbl_categoria` WRITE;
/*!40000 ALTER TABLE `tbl_categoria` DISABLE KEYS */;
INSERT INTO `tbl_categoria` VALUES (1,'Steakhouse','arquivos/icones_categorias/steak (2).png'),(3,'Vegetariano','arquivos/icones_categorias/broccoli.png'),(4,'Sa�davel','arquivos/icones_categorias/salad.png');
/*!40000 ALTER TABLE `tbl_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cidade`
--

DROP TABLE IF EXISTS `tbl_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cidade` (
  `id_cidade` int(11) NOT NULL AUTO_INCREMENT,
  `id_estado` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  PRIMARY KEY (`id_cidade`),
  KEY `fk_id_estado_idx` (`id_estado`),
  CONSTRAINT `fk_id_estado` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cidade`
--

LOCK TABLES `tbl_cidade` WRITE;
/*!40000 ALTER TABLE `tbl_cidade` DISABLE KEYS */;
INSERT INTO `tbl_cidade` VALUES (1,1,'Jandira'),(2,1,'Barueri'),(3,1,'Osasco'),(4,2,'Niter�i'),(5,2,'Angra dos Reis'),(6,2,'Paraty'),(7,1,'Carap�cuiba');
/*!40000 ALTER TABLE `tbl_cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cliente`
--

DROP TABLE IF EXISTS `tbl_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_endereco` int(11) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `foto` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_id_endereco3_idx` (`id_endereco`),
  CONSTRAINT `fk_id_endereco4` FOREIGN KEY (`id_endereco`) REFERENCES `tbl_endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cliente`
--

LOCK TABLES `tbl_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_cliente` DISABLE KEYS */;
INSERT INTO `tbl_cliente` VALUES (1,1,'jailson4524','ja','Jailson Mendes','Laranjal','(11) 23213-2131','(12) 3123-1230','jailson.mendes@gmail.com','arquivos/foto_usuario/mickeyilson.png'),(2,2,'filipe','filipe','Filipe da Silva','Santos','(11) 85198-1156','(11) 9848-9489','filipe@gmail.com','arquivos/foto_usuario/sanik.png'),(3,3,'bia','sonico','Beatriz','Castro','(11) 97024-1518','(11) 4303-5101','biia@gmail.com','arquivos/foto_usuario/sonicwut.jpg'),(4,7,'pablo_azul','pablo','Pablo','Backyardigan','(11) 98045-6878','(11) 4205-4575','pablo@backyardigan.com','arquivos/foto_usuario/inventor_pablo_grimacing_the_backyardigans.png'),(5,24,'MatheusFrota25','belinha123teamo','Matheus ','Machado Frota','(11) 98553-8302','(11) 4136-8749','matheus.frota25052000@gmail.com','arquivos/foto_usuario/images.jpg'),(6,38,'eilane','123','Eilane','alves','(11) 58475-1255','(11) 4175-8246','eilane99@hotmail.com','arquivos/foto_usuario/standardUser.png'),(7,39,'Mfrota','123','Matheus ','Machado Frota','(11) 98553-8302','(11) 4136-8749','matheus.frota25052000@gmail.com','arquivos/foto_usuario/usuariologin.png');
/*!40000 ALTER TABLE `tbl_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contabancaria`
--

DROP TABLE IF EXISTS `tbl_contabancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_contabancaria` (
  `id_contabancaria` int(11) NOT NULL AUTO_INCREMENT,
  `id_funcionario` int(11) NOT NULL,
  `id_banco` int(11) NOT NULL,
  `agencia` varchar(5) NOT NULL,
  `conta_corrente` varchar(12) NOT NULL,
  PRIMARY KEY (`id_contabancaria`),
  KEY `fk_id_funcionario3_idx` (`id_funcionario`),
  KEY `fk_id_banco3_idx` (`id_banco`),
  CONSTRAINT `fk_id_banco3` FOREIGN KEY (`id_banco`) REFERENCES `tbl_banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_funcionario3` FOREIGN KEY (`id_funcionario`) REFERENCES `tbl_funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contabancaria`
--

LOCK TABLES `tbl_contabancaria` WRITE;
/*!40000 ALTER TABLE `tbl_contabancaria` DISABLE KEYS */;
INSERT INTO `tbl_contabancaria` VALUES (6,21,1,'4165','74849848-9'),(7,22,1,'4451','11546515-1');
/*!40000 ALTER TABLE `tbl_contabancaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_credito`
--

DROP TABLE IF EXISTS `tbl_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_credito` (
  `id_credito` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `quantidade` float NOT NULL,
  PRIMARY KEY (`id_credito`),
  KEY `fk_id_pedido_idx` (`id_pedido`),
  CONSTRAINT `fk_id_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `tbl_pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_credito`
--

LOCK TABLES `tbl_credito` WRITE;
/*!40000 ALTER TABLE `tbl_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_endereco`
--

DROP TABLE IF EXISTS `tbl_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_endereco` (
  `id_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `id_cidade` int(11) NOT NULL,
  `logradouro` varchar(200) DEFAULT NULL,
  `bairro` varchar(200) NOT NULL,
  `rua` varchar(200) NOT NULL,
  `aptbloco` varchar(50) DEFAULT NULL,
  `numero` varchar(10) NOT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `fk_id_cidade_idx` (`id_cidade`),
  CONSTRAINT `fk_id_cidade` FOREIGN KEY (`id_cidade`) REFERENCES `tbl_cidade` (`id_cidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_endereco`
--

LOCK TABLES `tbl_endereco` WRITE;
/*!40000 ALTER TABLE `tbl_endereco` DISABLE KEYS */;
INSERT INTO `tbl_endereco` VALUES (1,1,'','Jardim das Pe�as','Rua das Laranjas','-','61'),(2,1,'Rua Anci�o Sebasti�o Antonini','Jardim das Margaridas','Rua Anci�o Sebasti�o Antonini','31-27','61'),(3,2,'Bar do Z�','Jd. Silveira','Maria Siqueira','-','102'),(5,1,'Pr�ximo ao Centro','Jardim Tup�','Rua Fernando Pessoa','-','32'),(6,7,'O mundo inteiro no nosso quintal','Divers�o','Casa','-','25'),(7,2,'Perto da �nica casa que tem aqui','Illusion Paradise','Quintal ','-','45'),(8,2,'Bar do Away','Sonicol�ndia','Rua das Argolas Douradas','-','133'),(9,2,'32123','jardim','Rua das Flroes','-','213'),(24,7,'casa 12','Vila Dirce ','Av. Inoc�ncio Ser�fico ','-','3021'),(31,1,'Escola SENAI Jandira','Jardim das Rosas','Ant�nio Figueredo','-','41'),(32,1,'Escola SENAI Jandira','Jardim das Rosas','Ant�nio Figueredo','-','41'),(33,3,'Perto do Bar do Pudim','Jardim dos Confeitos','Rua da Clara de Ovo','-','13'),(34,1,'Escola SENAI Jandira','Jardim das Rosas','Rua da Clara de Ovo','-','41'),(35,2,'96','amado','francisco','52-7','528'),(36,1,'Perto da Loja do seu Z�','Espinafre verde','Pudim Reluzente','-','452'),(37,2,NULL,'Marechal Teodoro','Ouro Verde',NULL,'543'),(38,6,'hgfh','dsfd','francisco','52-45','858'),(39,7,'casa 1','Vila Dirce ','Av. Inoc�ncio Ser�fico ','-','3021');
/*!40000 ALTER TABLE `tbl_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_enquete`
--

DROP TABLE IF EXISTS `tbl_enquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_enquete` (
  `id_enquete` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_enquete`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_enquete`
--

LOCK TABLES `tbl_enquete` WRITE;
/*!40000 ALTER TABLE `tbl_enquete` DISABLE KEYS */;
INSERT INTO `tbl_enquete` VALUES (2,'Rendimento dos Gar�ons',0),(3,'Cor do Site',1),(4,'a',0);
/*!40000 ALTER TABLE `tbl_enquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado`
--

DROP TABLE IF EXISTS `tbl_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `id_regiao` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  PRIMARY KEY (`id_estado`),
  KEY `fk_id_regiao_idx` (`id_regiao`),
  CONSTRAINT `fk_id_regiao` FOREIGN KEY (`id_regiao`) REFERENCES `tbl_regiao` (`id_regiao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado`
--

LOCK TABLES `tbl_estado` WRITE;
/*!40000 ALTER TABLE `tbl_estado` DISABLE KEYS */;
INSERT INTO `tbl_estado` VALUES (1,9,'S�o Paulo'),(2,9,'Rio de Janeiro');
/*!40000 ALTER TABLE `tbl_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estoque`
--

DROP TABLE IF EXISTS `tbl_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_estoque` (
  `id_estoque` int(11) NOT NULL AUTO_INCREMENT,
  `id_restaurante` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  PRIMARY KEY (`id_estoque`),
  KEY `fk_id_restaurante_idx` (`id_restaurante`),
  CONSTRAINT `fk_id_restaurante5` FOREIGN KEY (`id_restaurante`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estoque`
--

LOCK TABLES `tbl_estoque` WRITE;
/*!40000 ALTER TABLE `tbl_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_faleconosco`
--

DROP TABLE IF EXISTS `tbl_faleconosco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_faleconosco` (
  `id_faleconosco` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipoInfo` int(11) NOT NULL,
  `id_restaurante` int(11) DEFAULT NULL,
  `nome_completo` varchar(40) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `obs` text,
  PRIMARY KEY (`id_faleconosco`),
  KEY `fk_id_tipoInfo_idx` (`id_tipoInfo`),
  KEY `fk_id_restaurante_idx` (`id_restaurante`),
  CONSTRAINT `fk_id_restaurante4` FOREIGN KEY (`id_restaurante`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_tipoInfo` FOREIGN KEY (`id_tipoInfo`) REFERENCES `tbl_tipoinfo` (`id_tipoInfo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_faleconosco`
--

LOCK TABLES `tbl_faleconosco` WRITE;
/*!40000 ALTER TABLE `tbl_faleconosco` DISABLE KEYS */;
INSERT INTO `tbl_faleconosco` VALUES (3,1,1,'Jailson Mendes','(11) 54564-5616','(11) 9848-9489','jaja@gmail.com','Muda a cor do site.'),(4,1,1,'Jos� Mariano','(11) 98045-6165','(11) 4202-0650','jose@gmail.com','A comida precisa de mais sal!'),(5,1,1,'J�ao neves','(66) 66666-6666','(66) 6666-6666','joaopingolao@gmail.com','dfvdfvsdv');
/*!40000 ALTER TABLE `tbl_faleconosco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_faq`
--

DROP TABLE IF EXISTS `tbl_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_faq` (
  `id_faq` int(11) NOT NULL AUTO_INCREMENT,
  `pergunta` varchar(200) NOT NULL,
  `resposta` text NOT NULL,
  PRIMARY KEY (`id_faq`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_faq`
--

LOCK TABLES `tbl_faq` WRITE;
/*!40000 ALTER TABLE `tbl_faq` DISABLE KEYS */;
INSERT INTO `tbl_faq` VALUES (5,'Como acessar meu perfil?','Depois de logado, � necess�rio passar o mouse em cima sua imagem de perfil e assim aparecer� uma pequena janela flutuante.'),(6,'Por que n�o consigo fazer minhas reservas?','A reserva s� pode ser feita ap�s 24 horas da cria��o da conta.');
/*!40000 ALTER TABLE `tbl_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_feedback`
--

DROP TABLE IF EXISTS `tbl_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_feedback` (
  `id_feedback` int(11) NOT NULL AUTO_INCREMENT,
  `id_avaliacao` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  PRIMARY KEY (`id_feedback`),
  KEY `fk_id_avaliacao_idx` (`id_avaliacao`),
  KEY `fk_id_pedido2_idx` (`id_pedido`),
  CONSTRAINT `fk_id_avaliacao` FOREIGN KEY (`id_avaliacao`) REFERENCES `tbl_avaliacao` (`id_avaliacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_pedido3` FOREIGN KEY (`id_pedido`) REFERENCES `tbl_pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_feedback`
--

LOCK TABLES `tbl_feedback` WRITE;
/*!40000 ALTER TABLE `tbl_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fornecedor`
--

DROP TABLE IF EXISTS `tbl_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_fornecedor` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(18) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `cnpj_UNIQUE` (`cnpj`),
  KEY `fk_id_endereco_idx` (`id_endereco`),
  CONSTRAINT `fk_id_endereco3` FOREIGN KEY (`id_endereco`) REFERENCES `tbl_endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fornecedor`
--

LOCK TABLES `tbl_fornecedor` WRITE;
/*!40000 ALTER TABLE `tbl_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_funcionario`
--

DROP TABLE IF EXISTS `tbl_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_funcionario` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `id_restaurante` int(11) DEFAULT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `nome_completo` varchar(200) NOT NULL,
  `num_registro` varchar(12) NOT NULL,
  `sexo` char(1) NOT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `celular` varchar(15) NOT NULL,
  `salario` float(11,2) NOT NULL,
  `dt_nasc` date NOT NULL,
  `statusMDM` tinyint(1) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `email` varchar(80) NOT NULL,
  `dia_pagamento` varchar(2) NOT NULL,
  `comissao` float(3,2) DEFAULT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_id_restaurante_idx` (`id_restaurante`),
  KEY `fk_id_endereco_idx` (`id_endereco`),
  KEY `fk_id_cargo_idx` (`id_cargo`),
  CONSTRAINT `fk_id_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `tbl_cargo` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_endereco` FOREIGN KEY (`id_endereco`) REFERENCES `tbl_endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_restaurante` FOREIGN KEY (`id_restaurante`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_funcionario`
--

LOCK TABLES `tbl_funcionario` WRITE;
/*!40000 ALTER TABLE `tbl_funcionario` DISABLE KEYS */;
INSERT INTO `tbl_funcionario` VALUES (21,1,20,34,'894.989.789-48','DEVSOFT CORPORATION','156.156.561','M','(11) 4511-6515','(11) 98465-1651',15000.00,'2000-01-13',0,'arquivos/foto_perfilFuncionario/adasdsadsd.png','dev@devsoft.com','15',0.00,'devsoft','dev'),(22,1,21,36,'515.616.516-51','PALMIRINHA ONOFRE','451.651.651','M','(11) 4561-2313','(11) 98054-6515',2500.00,'1931-06-29',0,'arquivos/foto_perfilFuncionario/yuzk9zom.jpeg','palmirinha@ribs.com','12',0.00,'palmirinha','123');
/*!40000 ALTER TABLE `tbl_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_home`
--

DROP TABLE IF EXISTS `tbl_home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_home` (
  `id_home` int(11) NOT NULL AUTO_INCREMENT,
  `caminho_imagemSuperior` varchar(200) NOT NULL,
  `caminho_imagemInferior` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_home`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_home`
--

LOCK TABLES `tbl_home` WRITE;
/*!40000 ALTER TABLE `tbl_home` DISABLE KEYS */;
INSERT INTO `tbl_home` VALUES (3,'arquivos/midia_home/q-grill-camden-1.jpg','arquivos/midia_home/steak_1472646321611_5895592_ver1.0.jpg',1);
/*!40000 ALTER TABLE `tbl_home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ingrediente`
--

DROP TABLE IF EXISTS `tbl_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ingrediente` (
  `id_ingrediente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  PRIMARY KEY (`id_ingrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ingrediente`
--

LOCK TABLES `tbl_ingrediente` WRITE;
/*!40000 ALTER TABLE `tbl_ingrediente` DISABLE KEYS */;
INSERT INTO `tbl_ingrediente` VALUES (1,'Tomate'),(2,'Alface'),(3,'Salsinha'),(4,'Cebolinha'),(5,'Fil� Mignon'),(6,'Contrafil�'),(7,'Alcatra'),(8,'Picanha'),(9,'Carne Patinho'),(10,'Carne Fraldinha'),(11,'Carne Maminha'),(12,'Fil� de Costela'),(13,'Batata'),(14,'Queijo'),(15,'Azeite'),(16,'Sal'),(17,'Cenoura'),(18,'Macarr�o'),(19,'�gua de Coco'),(20,'Melancia'),(21,'Gengibre'),(22,'Laranja'),(23,'�gua');
/*!40000 ALTER TABLE `tbl_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ingredienteproduto`
--

DROP TABLE IF EXISTS `tbl_ingredienteproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ingredienteproduto` (
  `id_ingredienteProduto` int(11) NOT NULL AUTO_INCREMENT,
  `id_ingrediente` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_tipounit` int(11) NOT NULL,
  `quantidade` float NOT NULL,
  `detalhe` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ingredienteProduto`),
  KEY `fk_id_ingrediente_idx` (`id_ingrediente`),
  KEY `fk_id_produto_idx` (`id_produto`),
  KEY `fk_id_tipounit2_idx` (`id_tipounit`),
  CONSTRAINT `fk_id_ingrediente2` FOREIGN KEY (`id_ingrediente`) REFERENCES `tbl_ingrediente` (`id_ingrediente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_produto2` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_tipounit4` FOREIGN KEY (`id_tipounit`) REFERENCES `tbl_tipounit` (`id_tipounit`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ingredienteproduto`
--

LOCK TABLES `tbl_ingredienteproduto` WRITE;
/*!40000 ALTER TABLE `tbl_ingredienteproduto` DISABLE KEYS */;
INSERT INTO `tbl_ingredienteproduto` VALUES (55,5,5,4,400,''),(58,16,5,4,400,'a gosto'),(59,17,5,4,0.5,'Picada'),(60,17,6,6,1,'Ralada'),(61,18,6,4,250,'Tipo Penne'),(63,23,7,7,1,''),(64,22,7,6,2,''),(65,21,7,6,1,'');
/*!40000 ALTER TABLE `tbl_ingredienteproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_materiaprima`
--

DROP TABLE IF EXISTS `tbl_materiaprima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_materiaprima` (
  `id_materiaprima` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedidocompra` int(11) NOT NULL,
  `id_tipounit` int(11) NOT NULL,
  `id_estoque` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  `quantidade` float NOT NULL,
  PRIMARY KEY (`id_materiaprima`),
  KEY `fk_id_estoque_idx` (`id_estoque`),
  KEY `fk_id_tipounit_idx` (`id_tipounit`),
  KEY `fk_id_pedidocompra_idx` (`id_pedidocompra`),
  KEY `fk_id_ingrediente_idx` (`id_ingrediente`),
  CONSTRAINT `fk_id_estoque` FOREIGN KEY (`id_estoque`) REFERENCES `tbl_estoque` (`id_estoque`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_ingrediente` FOREIGN KEY (`id_ingrediente`) REFERENCES `tbl_ingrediente` (`id_ingrediente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_pedidocompra` FOREIGN KEY (`id_pedidocompra`) REFERENCES `tbl_pedidocompra` (`id_pedidocompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_tipounit` FOREIGN KEY (`id_tipounit`) REFERENCES `tbl_tipounit` (`id_tipounit`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_materiaprima`
--

LOCK TABLES `tbl_materiaprima` WRITE;
/*!40000 ALTER TABLE `tbl_materiaprima` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_materiaprima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mesa`
--

DROP TABLE IF EXISTS `tbl_mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_mesa` (
  `id_mesa` int(11) NOT NULL AUTO_INCREMENT,
  `id_restaurante` int(11) NOT NULL,
  `id_tipomesa` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  PRIMARY KEY (`id_mesa`),
  KEY `fk_id_restaurante_idx` (`id_restaurante`),
  KEY `fk_id_tipomesa_idx` (`id_tipomesa`),
  CONSTRAINT `fk_id_restaurante3` FOREIGN KEY (`id_restaurante`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_tipomesa` FOREIGN KEY (`id_tipomesa`) REFERENCES `tbl_tipomesa` (`id_tipomesa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mesa`
--

LOCK TABLES `tbl_mesa` WRITE;
/*!40000 ALTER TABLE `tbl_mesa` DISABLE KEYS */;
INSERT INTO `tbl_mesa` VALUES (1,1,1,'A1');
/*!40000 ALTER TABLE `tbl_mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_opcao`
--

DROP TABLE IF EXISTS `tbl_opcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_opcao` (
  `id_opcao` int(11) NOT NULL AUTO_INCREMENT,
  `id_pergunta` int(11) NOT NULL,
  `alternativa1` varchar(100) NOT NULL,
  `alternativa2` varchar(100) NOT NULL,
  `alternativa3` varchar(100) DEFAULT NULL,
  `alternativa4` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_opcao`),
  KEY `fk_id_pergunta_idx` (`id_pergunta`),
  CONSTRAINT `fk_id_pergunta` FOREIGN KEY (`id_pergunta`) REFERENCES `tbl_pergunta` (`id_pergunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_opcao`
--

LOCK TABLES `tbl_opcao` WRITE;
/*!40000 ALTER TABLE `tbl_opcao` DISABLE KEYS */;
INSERT INTO `tbl_opcao` VALUES (30,1,'Bom','Razo�vel','Ruim','P�ssimo'),(31,3,'Sim','N�o','','');
/*!40000 ALTER TABLE `tbl_opcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pais`
--

DROP TABLE IF EXISTS `tbl_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pais` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pais`
--

LOCK TABLES `tbl_pais` WRITE;
/*!40000 ALTER TABLE `tbl_pais` DISABLE KEYS */;
INSERT INTO `tbl_pais` VALUES (1,'Brasil');
/*!40000 ALTER TABLE `tbl_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_paletacor`
--

DROP TABLE IF EXISTS `tbl_paletacor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_paletacor` (
  `id_paletacor` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `cor_primaria` varchar(8) NOT NULL,
  `cor_secundaria` varchar(8) NOT NULL,
  `cor_terciaria` varchar(8) NOT NULL,
  `cor_quartenaria` varchar(8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_paletacor`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_paletacor`
--

LOCK TABLES `tbl_paletacor` WRITE;
/*!40000 ALTER TABLE `tbl_paletacor` DISABLE KEYS */;
INSERT INTO `tbl_paletacor` VALUES (56,'Cor Padr�o','#291818','#ffffff','#200b00','#441a1a',1);
/*!40000 ALTER TABLE `tbl_paletacor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedido`
--

DROP TABLE IF EXISTS `tbl_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_funcionario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_id_funcionario_idx` (`id_funcionario`),
  KEY `fk_id_cliente_idx` (`id_cliente`),
  CONSTRAINT `fk_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `tbl_funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedido`
--

LOCK TABLES `tbl_pedido` WRITE;
/*!40000 ALTER TABLE `tbl_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedidocompra`
--

DROP TABLE IF EXISTS `tbl_pedidocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pedidocompra` (
  `id_pedidocompra` int(11) NOT NULL AUTO_INCREMENT,
  `id_fornecedor` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id_pedidocompra`),
  KEY `fk_id_fornecedor_idx` (`id_fornecedor`),
  CONSTRAINT `fk_id_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `tbl_fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedidocompra`
--

LOCK TABLES `tbl_pedidocompra` WRITE;
/*!40000 ALTER TABLE `tbl_pedidocompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedidocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedidoproduto`
--

DROP TABLE IF EXISTS `tbl_pedidoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pedidoproduto` (
  `id_pedidoProduto` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  PRIMARY KEY (`id_pedidoProduto`),
  KEY `fk_id_pedido_idx` (`id_pedido`),
  KEY `fk_id_produto_idx` (`id_produto`),
  CONSTRAINT `fk_id_pedido2` FOREIGN KEY (`id_pedido`) REFERENCES `tbl_pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_produto` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedidoproduto`
--

LOCK TABLES `tbl_pedidoproduto` WRITE;
/*!40000 ALTER TABLE `tbl_pedidoproduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedidoproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pergunta`
--

DROP TABLE IF EXISTS `tbl_pergunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pergunta` (
  `id_pergunta` int(11) NOT NULL AUTO_INCREMENT,
  `id_enquete` int(11) NOT NULL,
  `pergunta` varchar(200) NOT NULL,
  PRIMARY KEY (`id_pergunta`),
  KEY `fk_id_enquete_idx` (`id_enquete`),
  CONSTRAINT `fk_id_enquete` FOREIGN KEY (`id_enquete`) REFERENCES `tbl_enquete` (`id_enquete`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pergunta`
--

LOCK TABLES `tbl_pergunta` WRITE;
/*!40000 ALTER TABLE `tbl_pergunta` DISABLE KEYS */;
INSERT INTO `tbl_pergunta` VALUES (1,2,'Qual o desempenho dos nossos gar�ons?'),(3,3,'A cor do site est� agrad�vel?');
/*!40000 ALTER TABLE `tbl_pergunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_periodo`
--

DROP TABLE IF EXISTS `tbl_periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_periodo` (
  `id_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `horario_inicial` time NOT NULL,
  `horario_final` time NOT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_periodo`
--

LOCK TABLES `tbl_periodo` WRITE;
/*!40000 ALTER TABLE `tbl_periodo` DISABLE KEYS */;
INSERT INTO `tbl_periodo` VALUES (1,'Manh�','06:00:00','12:00:00'),(2,'Tarde','12:00:00','18:00:00');
/*!40000 ALTER TABLE `tbl_periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_periodorestaurante`
--

DROP TABLE IF EXISTS `tbl_periodorestaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_periodorestaurante` (
  `id_periodoRestaurante` int(11) NOT NULL AUTO_INCREMENT,
  `id_periodo` int(11) NOT NULL,
  `id_restaurante` int(11) NOT NULL,
  PRIMARY KEY (`id_periodoRestaurante`),
  KEY `fk_id_periodo_idx` (`id_periodo`),
  KEY `fk_id_periodo_idx1` (`id_restaurante`),
  CONSTRAINT `fk_id_periodo` FOREIGN KEY (`id_periodo`) REFERENCES `tbl_periodo` (`id_periodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_restaurante2` FOREIGN KEY (`id_restaurante`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_periodorestaurante`
--

LOCK TABLES `tbl_periodorestaurante` WRITE;
/*!40000 ALTER TABLE `tbl_periodorestaurante` DISABLE KEYS */;
INSERT INTO `tbl_periodorestaurante` VALUES (1,1,1),(2,2,2),(3,1,2);
/*!40000 ALTER TABLE `tbl_periodorestaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_permissao`
--

DROP TABLE IF EXISTS `tbl_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_permissao` (
  `id_permissao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_permissao`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permissao`
--

LOCK TABLES `tbl_permissao` WRITE;
/*!40000 ALTER TABLE `tbl_permissao` DISABLE KEYS */;
INSERT INTO `tbl_permissao` VALUES (1,'Fechamento do Pedido'),(2,'Aprovacao do Produto'),(3,'Crud Paleta de Cores'),(4,'Crud Card�pio'),(5,'Crud Home'),(6,'Crud de Produtos'),(7,'Crud Categorias'),(8,'Crud Funcion�rios'),(9,'Crud Cargos'),(10,'Crud Usu�rios Cadastrados'),(11,'Crud Mesas'),(12,'Crud Reservas'),(13,'Crud Enquetes'),(14,'Crud Sobre N�s'),(15,'Crud Fale Conosco'),(16,'Crud FAQ'),(17,'Crud Redes Sociais');
/*!40000 ALTER TABLE `tbl_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_produto`
--

DROP TABLE IF EXISTS `tbl_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `nome` varchar(200) NOT NULL,
  `imagem` varchar(200) NOT NULL,
  `preco` float NOT NULL,
  `statusAprovacao` tinyint(1) NOT NULL,
  `statusTabelaNuticional` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_id_categoria_idx` (`id_categoria`),
  CONSTRAINT `fk_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produto`
--

LOCK TABLES `tbl_produto` WRITE;
/*!40000 ALTER TABLE `tbl_produto` DISABLE KEYS */;
INSERT INTO `tbl_produto` VALUES (5,1,'E quando o fil� mignon ainda � acompanhado por um molho gostoso, voc� pode ter certeza que estar� diante de um prato maravilhoso. Como o molho madeira que ir� acompanhar o fil� mignon em nossa receita.','Fil� Mignon ao Molho Madeira','arquivos/foto_produtos/asdsasasd.png',40.5,1,0),(6,3,'Uma mistura de ingredientes que harmonizam, dando um sabor diferenciado e incomum aos paladares.','Salada de Penne','arquivos/foto_produtos/4037_original.jpg',25.5,1,0),(7,4,'Um suco feito � base de folhas verdes escuras que carregam em si a clorofila. ','Suco Verde','arquivos/foto_produtos/capturar.png',4,1,0),(8,4,'Um doce produzido na Fran�a com os melhores ingredientes.','doces','arquivos/foto_produtos/afternoon_tea_-_website31.jpg',29,0,0);
/*!40000 ALTER TABLE `tbl_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_redesocial`
--

DROP TABLE IF EXISTS `tbl_redesocial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_redesocial` (
  `id_redesocial` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `imagem` varchar(200) NOT NULL,
  `link` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_redesocial`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_redesocial`
--

LOCK TABLES `tbl_redesocial` WRITE;
/*!40000 ALTER TABLE `tbl_redesocial` DISABLE KEYS */;
INSERT INTO `tbl_redesocial` VALUES (6,'Twitter','arquivos/imagem_redesSociais/qfy0krip_400x400.jpg','http://www.twitter.com',1),(7,'Facebook','arquivos/imagem_redesSociais/fa.png','http://www.facebook.com',1),(8,'LinkedIn','arquivos/imagem_redesSociais/1200x630bb.jpg','http://www.linkedin.com',1);
/*!40000 ALTER TABLE `tbl_redesocial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_regiao`
--

DROP TABLE IF EXISTS `tbl_regiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_regiao` (
  `id_regiao` int(11) NOT NULL AUTO_INCREMENT,
  `id_pais` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  PRIMARY KEY (`id_regiao`),
  KEY `fk_id_pais_idx` (`id_pais`),
  CONSTRAINT `fk_id_pais` FOREIGN KEY (`id_pais`) REFERENCES `tbl_pais` (`id_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_regiao`
--

LOCK TABLES `tbl_regiao` WRITE;
/*!40000 ALTER TABLE `tbl_regiao` DISABLE KEYS */;
INSERT INTO `tbl_regiao` VALUES (9,1,'Sudeste'),(10,1,'Norte'),(11,1,'Nordeste'),(12,1,'Centro-Oeste'),(13,1,'Sul');
/*!40000 ALTER TABLE `tbl_regiao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reserva`
--

DROP TABLE IF EXISTS `tbl_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_reserva` (
  `id_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `id_restaurante` int(11) NOT NULL,
  `id_status` tinyint(4) NOT NULL,
  `horarioDataFeita` datetime NOT NULL,
  `dataMarcada` date NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `fk_id_cliente_idx` (`id_cliente`),
  KEY `fk_id_status_idx` (`id_status`),
  KEY `fk_id_periodo_idx` (`id_periodo`),
  KEY `fk_id_mesa_idx` (`id_mesa`),
  KEY `fk_id_restaurante3_idx` (`id_restaurante`),
  CONSTRAINT `fk_id_cliente2` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_mesa` FOREIGN KEY (`id_mesa`) REFERENCES `tbl_mesa` (`id_mesa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_periodo2` FOREIGN KEY (`id_periodo`) REFERENCES `tbl_periodo` (`id_periodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_restaurante8` FOREIGN KEY (`id_restaurante`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reserva`
--

LOCK TABLES `tbl_reserva` WRITE;
/*!40000 ALTER TABLE `tbl_reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_respostaenquete`
--

DROP TABLE IF EXISTS `tbl_respostaenquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_respostaenquete` (
  `id_respostaEnquete` int(11) NOT NULL AUTO_INCREMENT,
  `id_enquete` int(11) NOT NULL,
  `alternativa` varchar(45) NOT NULL,
  PRIMARY KEY (`id_respostaEnquete`),
  KEY `fk_id_enquete2_idx` (`id_enquete`),
  CONSTRAINT `fk_id_enquete2` FOREIGN KEY (`id_enquete`) REFERENCES `tbl_enquete` (`id_enquete`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_respostaenquete`
--

LOCK TABLES `tbl_respostaenquete` WRITE;
/*!40000 ALTER TABLE `tbl_respostaenquete` DISABLE KEYS */;
INSERT INTO `tbl_respostaenquete` VALUES (1,3,'alternativa1'),(2,3,'alternativa2'),(3,3,'alternativa1'),(4,3,'alternativa2'),(5,3,'alternativa2'),(6,3,'alternativa1'),(7,3,'alternativa2'),(8,3,'alternativa2'),(9,3,'alternativa1'),(10,3,'alternativa1'),(11,3,'alternativa1'),(12,3,'alternativa2');
/*!40000 ALTER TABLE `tbl_respostaenquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_restaurante`
--

DROP TABLE IF EXISTS `tbl_restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_restaurante` (
  `id_restaurante` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  `imagem` varchar(200) NOT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`id_restaurante`),
  KEY `fk_id_endereco_idx` (`id_endereco`),
  CONSTRAINT `fk_id_endereco2` FOREIGN KEY (`id_endereco`) REFERENCES `tbl_endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_restaurante`
--

LOCK TABLES `tbl_restaurante` WRITE;
/*!40000 ALTER TABLE `tbl_restaurante` DISABLE KEYS */;
INSERT INTO `tbl_restaurante` VALUES (1,'The Ribs Steakhouse Jandira',5,'caminho_imagem','Um restaurante renomado na arte da churrascaria local, trazido de diversas �pocas contempor�neas e tradicionais para hoje.'),(2,'The Ribs Steakhouse Barueri',37,'caminho_imagem','Um restaurante encontrado no mesmo local port�m com culturas var�aveis.');
/*!40000 ALTER TABLE `tbl_restaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sobrenos`
--

DROP TABLE IF EXISTS `tbl_sobrenos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sobrenos` (
  `id_sobrenos` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `texto` text NOT NULL,
  `caminho_imagem` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_sobrenos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sobrenos`
--

LOCK TABLES `tbl_sobrenos` WRITE;
/*!40000 ALTER TABLE `tbl_sobrenos` DISABLE KEYS */;
INSERT INTO `tbl_sobrenos` VALUES (1,'Artigo 1','O restaurante tem como objetivo atender ao p�blico com gostos diversos, temos v�rios tipos de pratos desde o prato destinado aos apreciantes da arte do churrasco, quanto aos tem uma prefer�ncia � saladas.','arquivos/midia_sobreNos/reserva1.jpg',1);
/*!40000 ALTER TABLE `tbl_sobrenos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_status`
--

DROP TABLE IF EXISTS `tbl_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_status` (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_status`
--

LOCK TABLES `tbl_status` WRITE;
/*!40000 ALTER TABLE `tbl_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipoinfo`
--

DROP TABLE IF EXISTS `tbl_tipoinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipoinfo` (
  `id_tipoInfo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipoInfo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipoinfo`
--

LOCK TABLES `tbl_tipoinfo` WRITE;
/*!40000 ALTER TABLE `tbl_tipoinfo` DISABLE KEYS */;
INSERT INTO `tbl_tipoinfo` VALUES (1,'Reclama��o'),(2,'Sugest�o'),(3,'Informa��o');
/*!40000 ALTER TABLE `tbl_tipoinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipomesa`
--

DROP TABLE IF EXISTS `tbl_tipomesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipomesa` (
  `id_tipomesa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipomesa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipomesa`
--

LOCK TABLES `tbl_tipomesa` WRITE;
/*!40000 ALTER TABLE `tbl_tipomesa` DISABLE KEYS */;
INSERT INTO `tbl_tipomesa` VALUES (1,'4'),(2,'8'),(3,'12');
/*!40000 ALTER TABLE `tbl_tipomesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipounit`
--

DROP TABLE IF EXISTS `tbl_tipounit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipounit` (
  `id_tipounit` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sigla` varchar(4) NOT NULL,
  PRIMARY KEY (`id_tipounit`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipounit`
--

LOCK TABLES `tbl_tipounit` WRITE;
/*!40000 ALTER TABLE `tbl_tipounit` DISABLE KEYS */;
INSERT INTO `tbl_tipounit` VALUES (4,'Grama','g'),(5,'Kilo','kg'),(6,'Unidade',''),(7,'Litro','L'),(8,'Mililitro','mL');
/*!40000 ALTER TABLE `tbl_tipounit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-01 13:23:49