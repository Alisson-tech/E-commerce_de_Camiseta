-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Mar-2021 às 19:43
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ecommerce`
--
CREATE DATABASE IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ecommerce`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `CPF` varchar(11) NOT NULL,
  `idtamanho` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartao`
--

CREATE TABLE `cartao` (
  `CPF` varchar(11) NOT NULL,
  `tipo` varchar(7) NOT NULL,
  `cvv` varchar(4) NOT NULL,
  `numero` varchar(19) NOT NULL,
  `validade` date NOT NULL,
  `nomeCartao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `CPF` varchar(11) NOT NULL,
  `CEP` varchar(5) NOT NULL,
  `rua` varchar(25) NOT NULL,
  `bairro` varchar(15) NOT NULL,
  `cidade` varchar(15) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `Complemento` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico`
--

CREATE TABLE `historico` (
  `CPF` varchar(11) NOT NULL,
  `idtamanho` int(11) NOT NULL,
  `data` date NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `loja`
--

CREATE TABLE `loja` (
  `idloja` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL,
  `idloja` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `imagem` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tamanho`
--

CREATE TABLE `tamanho` (
  `idtamanho` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `tamanho` varchar(2) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `CPF` varchar(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `senha` varchar(10) NOT NULL,
  `idLoja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD KEY `CPF_fk_carrinho` (`CPF`),
  ADD KEY `idtamanho_fk_carrinho` (`idtamanho`);

--
-- Índices para tabela `cartao`
--
ALTER TABLE `cartao`
  ADD KEY `CPF_fk_cartao` (`CPF`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD KEY `CPF_fk_endereco` (`CPF`);

--
-- Índices para tabela `historico`
--
ALTER TABLE `historico`
  ADD KEY `CPF_fk_historico` (`CPF`),
  ADD KEY `idtamanho_fk_historico` (`idtamanho`);

--
-- Índices para tabela `loja`
--
ALTER TABLE `loja`
  ADD PRIMARY KEY (`idloja`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idProduto`),
  ADD KEY `idloja_fk_produto` (`idloja`);

--
-- Índices para tabela `tamanho`
--
ALTER TABLE `tamanho`
  ADD PRIMARY KEY (`idtamanho`),
  ADD KEY `idproduto_fk_tamanho` (`idProduto`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`CPF`),
  ADD KEY `idloja_fk_usuario` (`idLoja`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `loja`
--
ALTER TABLE `loja`
  MODIFY `idloja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tamanho`
--
ALTER TABLE `tamanho`
  MODIFY `idtamanho` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `CPF_fk_carrinho` FOREIGN KEY (`CPF`) REFERENCES `usuario` (`CPF`),
  ADD CONSTRAINT `idtamanho_fk_carrinho` FOREIGN KEY (`idtamanho`) REFERENCES `tamanho` (`idtamanho`);

--
-- Limitadores para a tabela `cartao`
--
ALTER TABLE `cartao`
  ADD CONSTRAINT `CPF_fk_cartao` FOREIGN KEY (`CPF`) REFERENCES `usuario` (`CPF`);

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `CPF_fk_endereco` FOREIGN KEY (`CPF`) REFERENCES `usuario` (`CPF`);

--
-- Limitadores para a tabela `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `CPF_fk_historico` FOREIGN KEY (`CPF`) REFERENCES `usuario` (`CPF`),
  ADD CONSTRAINT `idtamanho_fk_historico` FOREIGN KEY (`idtamanho`) REFERENCES `tamanho` (`idtamanho`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `idloja_fk_produto` FOREIGN KEY (`idloja`) REFERENCES `loja` (`idloja`);

--
-- Limitadores para a tabela `tamanho`
--
ALTER TABLE `tamanho`
  ADD CONSTRAINT `idproduto_fk_tamanho` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `idloja_fk_usuario` FOREIGN KEY (`idLoja`) REFERENCES `loja` (`idloja`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
