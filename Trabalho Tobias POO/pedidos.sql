-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 16-Out-2015 às 21:57
-- Versão do servidor: 5.6.26
-- PHP Version: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pedidos`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(6) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `email`, `telefone`, `status`) VALUES
(4, 'Harry Potter', 'hp@hotmail.com', '(45)2859-9843', NULL),
(5, 'Hermione', 'Hermione@hotmail.com', '(45)4593-8457', NULL),
(6, 'Ron', 'RonW@gmail.com', '(45)8463-9847', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(6) NOT NULL,
  `subtotal` float DEFAULT NULL,
  `quant` int(6) DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `idProduto` int(6) DEFAULT NULL,
  `IdPedido` int(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`id`, `subtotal`, `quant`, `preco`, `idProduto`, `IdPedido`) VALUES
(3, NULL, 1, 4, 3, 3),
(5, NULL, 1, 1.9, 4, 5),
(7, NULL, 1, 4, 3, 5),
(9, NULL, 1, 2.5, 6, 7),
(10, NULL, 1, 2, 10, 7),
(11, NULL, 2, 7.7, 12, 7),
(12, NULL, 1, 20, 8, 8),
(13, NULL, 1, 25.55, 9, 9),
(14, NULL, 3, 13.45, 11, 9),
(15, NULL, 2, 2.5, 6, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE IF NOT EXISTS `pagamento` (
  `id` int(6) NOT NULL,
  `data` varchar(50) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `idPedido` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(6) NOT NULL,
  `total` float DEFAULT NULL,
  `data` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `idCliente` int(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`id`, `total`, `data`, `status`, `idCliente`) VALUES
(7, 19.9, '16/10/2015', 'Pago', 4),
(8, 20, '16/10/2015', 'Pago', 5),
(9, 70.9, '16/10/2015', 'Pago', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(6) NOT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `quant` int(6) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `descricao`, `preco`, `quant`, `status`) VALUES
(5, 'caixa de fogos básico', 5, 70, NULL),
(6, 'pasta para remover hematomas', 2.5, 27, NULL),
(7, 'creme de canários', 0.7, 200, NULL),
(8, 'deflagração de luxo', 20, 149, NULL),
(9, 'caldeirão de mentira', 25.55, 129, NULL),
(10, 'caramelo incha lingua', 2, 199, NULL),
(11, 'vomitilha', 13.45, 67, NULL),
(12, 'febricolate', 7.7, 88, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProduto` (`idProduto`),
  ADD KEY `IdPedido` (`IdPedido`);

--
-- Indexes for table `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`IdPedido`) REFERENCES `pedido` (`id`);

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`id`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
