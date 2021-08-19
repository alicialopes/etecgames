-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Tempo de geração: 19-Ago-2021 às 03:14
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdlojaetec`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcaixa`
--

CREATE TABLE `tbcaixa` (
  `codcai` int(11) NOT NULL,
  `codcli` int(11) DEFAULT NULL,
  `codfun` int(11) DEFAULT NULL,
  `codprod` int(11) DEFAULT NULL,
  `dtvendacai` int(60) NOT NULL,
  `qtdprodcai` int(80) NOT NULL,
  `totalcai` float NOT NULL,
  `fpgcai` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcliente`
--

CREATE TABLE `tbcliente` (
  `codcli` int(11) NOT NULL,
  `nomecli` varchar(50) NOT NULL,
  `emailcli` varchar(60) NOT NULL,
  `fonecli` char(14) NOT NULL,
  `cpfcli` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbcliente`
--

INSERT INTO `tbcliente` (`codcli`, `nomecli`, `emailcli`, `fonecli`, `cpfcli`) VALUES
(1, 'Alícia Lopes', 'alicia@gmail.com', '(11) 2325-4874', '42565845854'),
(2, 'Andreia Aparecida da Silva', 'andreia@gmail.com', '(11) 2587-4569', '13612565747'),
(3, 'Carlos Pereira de Carvalho', 'carlos@hotmail.com', '(11) 2569-1478', '23545865832'),
(4, 'Carlos Agostino Santos', 'agostino@hotmail.com', '(11) 2658-1258', '25436545811');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbestoque`
--

CREATE TABLE `tbestoque` (
  `codest` int(11) NOT NULL,
  `codprodFK` int(11) NOT NULL,
  `qtdprodest` varchar(4) NOT NULL,
  `valorprod` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbfornecedor`
--

CREATE TABLE `tbfornecedor` (
  `codforn` int(11) NOT NULL,
  `nomeforn` varchar(50) NOT NULL,
  `foneforn` char(11) NOT NULL,
  `contforn` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbfornecedor`
--

INSERT INTO `tbfornecedor` (`codforn`, `nomeforn`, `foneforn`, `contforn`) VALUES
(1, 'ELEEELAS', '1125698741', 'Marcos'),
(2, 'Extra Mais', '1125698745', 'Simone'),
(3, 'Roupas Deise', '1123541569', 'Daise'),
(4, 'BelaMulher', '1123569874', 'Luiza'),
(5, 'Roupas Deles', '1123145874', 'Antonio');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbfuncionario`
--

CREATE TABLE `tbfuncionario` (
  `codfun` int(11) NOT NULL,
  `nomefun` varchar(50) NOT NULL,
  `fonefun` char(14) NOT NULL,
  `cargofun` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbfuncionario`
--

INSERT INTO `tbfuncionario` (`codfun`, `nomefun`, `fonefun`, `cargofun`) VALUES
(1, 'Carlos Souza', '1124785698', 'vendedor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbproduto`
--

CREATE TABLE `tbproduto` (
  `codprod` int(11) NOT NULL,
  `codfornFK` int(11) NOT NULL,
  `nmprod` varchar(20) DEFAULT NULL,
  `marcaprod` varchar(20) DEFAULT NULL,
  `tamprod` enum('P','M','G') DEFAULT NULL,
  `corprod` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbproduto`
--

INSERT INTO `tbproduto` (`codprod`, `codfornFK`, `nmprod`, `marcaprod`, `tamprod`, `corprod`) VALUES
(1, 1, 'Blusa de moletom', 'Adidas', 'P', 'Vinho'),
(2, 5, 'Calça de moletom', 'Nike', 'M', 'Preto');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbusuario`
--

CREATE TABLE `tbusuario` (
  `codusu` int(3) NOT NULL,
  `codfunFK` int(11) NOT NULL,
  `loginusu` varchar(50) NOT NULL,
  `senhausu` varchar(50) NOT NULL,
  `recsenusu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbcaixa`
--
ALTER TABLE `tbcaixa`
  ADD PRIMARY KEY (`codcai`),
  ADD KEY `FK_CODCLI` (`codcli`),
  ADD KEY `FK_CODFUN` (`codfun`),
  ADD KEY `FK_CODPROD` (`codprod`);

--
-- Índices para tabela `tbcliente`
--
ALTER TABLE `tbcliente`
  ADD PRIMARY KEY (`codcli`);

--
-- Índices para tabela `tbestoque`
--
ALTER TABLE `tbestoque`
  ADD PRIMARY KEY (`codest`),
  ADD KEY `FK_PRODFK` (`codprodFK`);

--
-- Índices para tabela `tbfornecedor`
--
ALTER TABLE `tbfornecedor`
  ADD PRIMARY KEY (`codforn`);

--
-- Índices para tabela `tbfuncionario`
--
ALTER TABLE `tbfuncionario`
  ADD PRIMARY KEY (`codfun`);

--
-- Índices para tabela `tbproduto`
--
ALTER TABLE `tbproduto`
  ADD PRIMARY KEY (`codprod`),
  ADD KEY `FK_CODFORN` (`codfornFK`);

--
-- Índices para tabela `tbusuario`
--
ALTER TABLE `tbusuario`
  ADD PRIMARY KEY (`codusu`),
  ADD KEY `FKCODFUN` (`codfunFK`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbcliente`
--
ALTER TABLE `tbcliente`
  MODIFY `codcli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tbestoque`
--
ALTER TABLE `tbestoque`
  MODIFY `codest` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbfornecedor`
--
ALTER TABLE `tbfornecedor`
  MODIFY `codforn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tbfuncionario`
--
ALTER TABLE `tbfuncionario`
  MODIFY `codfun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbproduto`
--
ALTER TABLE `tbproduto`
  MODIFY `codprod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tbusuario`
--
ALTER TABLE `tbusuario`
  MODIFY `codusu` int(3) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbcaixa`
--
ALTER TABLE `tbcaixa`
  ADD CONSTRAINT `FK_CODCLI` FOREIGN KEY (`codcli`) REFERENCES `tbcliente` (`codcli`),
  ADD CONSTRAINT `FK_CODFUN` FOREIGN KEY (`codfun`) REFERENCES `tbfuncionario` (`codfun`),
  ADD CONSTRAINT `FK_CODPROD` FOREIGN KEY (`codprod`) REFERENCES `tbproduto` (`codprod`);

--
-- Limitadores para a tabela `tbestoque`
--
ALTER TABLE `tbestoque`
  ADD CONSTRAINT `FK_PRODFK` FOREIGN KEY (`codprodFK`) REFERENCES `tbproduto` (`codprod`);

--
-- Limitadores para a tabela `tbproduto`
--
ALTER TABLE `tbproduto`
  ADD CONSTRAINT `FK_CODFORN` FOREIGN KEY (`codfornFK`) REFERENCES `tbfornecedor` (`codforn`);

--
-- Limitadores para a tabela `tbusuario`
--
ALTER TABLE `tbusuario`
  ADD CONSTRAINT `FKCODFUN` FOREIGN KEY (`codfunFK`) REFERENCES `tbfuncionario` (`codfun`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
