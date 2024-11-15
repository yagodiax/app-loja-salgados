-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/11/2024 às 23:25
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lojasalgados`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `valor` double NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vendas`
--

INSERT INTO `vendas` (`id`, `item`, `valor`, `data`) VALUES
(59, 'Coxinha', 7, '2024-10-04'),
(60, 'Pastel', 7, '2024-10-04'),
(61, 'Kibe', 8, '2024-10-04'),
(62, 'Assado Queijo C Presunto', 8, '2024-10-04'),
(63, 'Queijo C Presunto', 7, '2024-10-04'),
(64, 'Coxinha', 7, '2024-10-04'),
(65, 'Coxinha', 7, '2024-10-04'),
(66, 'Coxinha', 7, '2024-10-04'),
(67, 'Queijo C Presunto', 7, '2024-10-04'),
(68, 'Queijo C Presunto', 7, '2024-10-04'),
(69, 'Assado Queijo C Presunto', 8, '2024-10-04'),
(70, 'Assado Queijo C Presunto', 8, '2024-10-04'),
(71, 'Pastel', 7, '2024-10-04'),
(72, 'Pastel', 7, '2024-10-04'),
(73, 'Kibe', 8, '2024-10-04'),
(74, 'Kibe', 8, '2024-10-04'),
(75, 'Coxinha', 7, '2024-10-04'),
(76, 'Coxinha', 7, '2024-10-04'),
(77, 'Coxinha', 7, '2024-11-05'),
(78, 'Queijo C Presunto', 7, '2024-11-05'),
(79, 'Assado Queijo C Presunto', 8, '2024-11-05'),
(80, 'Assado Queijo C Presunto', 8, '2024-11-05');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
