-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2018 at 10:37 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `profrit`
--

DELIMITER $$
--
-- Procedures
--

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAluno` (`nomeCompleto` VARCHAR(45), `naturalidade` VARCHAR(45),  `nacionalidade` VARCHAR(45),
 `sexo` VARCHAR(15),`dataNascimento` VARCHAR(45), `residencia` VARCHAR(20), `telemovel` VARCHAR(20), `email` VARCHAR(30), `usuario` VARCHAR(30), 
`senha` VARCHAR(20), `designacao` VARCHAR(30), `periodo` VARCHAR(10), `idClasse` INT, `idCurso` INT)  begin
insert into Pessoa values (null, nomeCompleto,'2019-03-12',naturalidade,nacionalidade,sexo,dataNascimento,residencia,telemovel,email);
select last_insert_id() into @codigoPessoa;
insert into Conta values (null,usuario,senha,'Aluno','nao');
select last_insert_id() into @codigoConta;
insert into Aluno values (null,@codigoPessoa,@codigoConta,'nao','2019-03-21');
select last_insert_id() into @codigoAluno;
insert into Turma values(null,designacao,periodo,1,idClasse,idCurso,@codigoAluno);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAdmin` (`nomeCompleto` VARCHAR(45), `naturalidade` VARCHAR(45),  `nacionalidade` VARCHAR(45),
 `sexo` VARCHAR(15),`dataNascimento` VARCHAR(45), `residencia` VARCHAR(20), `telemovel` VARCHAR(20), `email` VARCHAR(30), 
 `usuario` VARCHAR(30), `senha` VARCHAR(20))  begin
insert into Pessoa values (null, nomeCompleto,'2019-03-12',naturalidade,nacionalidade,sexo,dataNascimento,residencia,telemovel,email);
select last_insert_id() into @codigoPessoa;
insert into Conta values (null,usuario,senha,'Admin','sim');
end$$

DELIMITER ;


-- --------------------------------------------------------



--
-- Table structure for table `aluno`
--

CREATE TABLE `aluno` (
  `idluno` int(11) NOT NULL,
  `idPessoa` int(11) NOT NULL,
  `idConta` int(11) NOT NULL,
  `validar` varchar(20) NOT NULL,
  `DataCadastro` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

CREATE TABLE `classe` (
  `idClasse` int(11) NOT NULL,
  `descricao` int(11) NOT NULL,
  `valorMensal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`idClasse`, `descricao`, `valorMensal`) VALUES
(1, 10, 35000),
(2, 11, 40000),
(3, 12, 45000);

-- --------------------------------------------------------

--
-- Table structure for table `conta`
--

CREATE TABLE `conta` (
  `idConta` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `TipoConta` varchar(20) NOT NULL,
  `Estado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE `cursos` (
  `idCurso` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cursos`
--

INSERT INTO `cursos` (`idCurso`, `descricao`) VALUES
(1, 'Técnico de Informática'),
(2, 'Contabilidade e Gestão'),
(3, 'Ciências Físicas e Biológicas'),
(4, 'Ciências Económicas e Jurídicas');

-- --------------------------------------------------------

--
-- Table structure for table `meses`
--

CREATE TABLE `meses` (
  `idMes` int(11) NOT NULL,
  `descricao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meses`
--

INSERT INTO `meses` (`idMes`, `descricao`) VALUES
(1, 'Janeiro'),
(2, 'Fevereiro'),
(3, 'Março'),
(4, 'Abril'),
(5, 'Maio'),
(6, 'Junho'),
(7, 'Julho'),
(8, 'Agosto'),
(9, 'Setembro'),
(10, 'Outubro'),
(11, 'Novembro'),
(12, 'Dezembro');

-- --------------------------------------------------------

--
-- Table structure for table `pagamentos`
--

CREATE TABLE `pagamentos` (
  `idPagamentos` int(11) NOT NULL,
  `descricao` varchar(20) NOT NULL,
  `idMes` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `idAluno` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `data` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pessoa`
--

CREATE TABLE `pessoa` (
  `idPessoa` int(11) NOT NULL ,
  `nome` varchar(50) NOT NULL,
  `Datapessoa` varchar(20) NOT NULL,
  `naturalidade` varchar(50) NOT NULL,
  `nacionalidade` varchar(30) NOT NULL,
  `sexo` varchar(15) NOT NULL,
  `dataNascimento` varchar(50) NOT NULL,
  `morada` varchar(50) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `turma`
--

CREATE TABLE `turma` (
  `idTurma` int(11) NOT NULL ,
  `designacao` varchar(30) NOT NULL,
  `periodo` varchar(30) NOT NULL,
  `sala` int(11) NOT NULL,
  `idClasse` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `idAluno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`idluno`),
  ADD KEY `AlunoPessoa` (`idPessoa`),
  ADD KEY `AlunoConta` (`idConta`);

--
-- Indexes for table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`idClasse`);

--
-- Indexes for table `conta`
--
ALTER TABLE `conta`
  ADD PRIMARY KEY (`idConta`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idCurso`);

--
-- Indexes for table `meses`
--
ALTER TABLE `meses`
  ADD PRIMARY KEY (`idMes`);

--
-- Indexes for table `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`idPagamentos`),
  ADD KEY `PagamentoMes` (`idMes`),
  ADD KEY `PagamentoAluno` (`idAluno`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`idPessoa`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`idTurma`),
  ADD KEY `turmaClasse` (`idClasse`),
  ADD KEY `turmaCurso` (`idcurso`),
  ADD KEY `turmAluno` (`idAluno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classe`
--
ALTER TABLE `classe`
  MODIFY `idClasse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `cursos`
  MODIFY `idCurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `meses`
--
ALTER TABLE `meses`
  MODIFY `idMes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `turma`
--
ALTER TABLE `turma`
  MODIFY `idTurma` int(11) NOT NULL AUTO_INCREMENT;
  
  ALTER TABLE `pessoa`
  MODIFY `idPessoa` int(11) NOT NULL AUTO_INCREMENT;

  
  ALTER TABLE `Conta`
  MODIFY `idConta` int(11) NOT NULL AUTO_INCREMENT;
  
    ALTER TABLE `Aluno`
  MODIFY `idluno` int(11) NOT NULL AUTO_INCREMENT;
  
    ALTER TABLE `Turma`
  MODIFY `idTurma` int(11) NOT NULL AUTO_INCREMENT;
  
   ALTER TABLE `Pagamentos`
  MODIFY `idPagamentos` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `AlunoConta` FOREIGN KEY (`idConta`) REFERENCES `conta` (`idConta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `PagamentoAluno` FOREIGN KEY (`idAluno`) REFERENCES `aluno` (`idluno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turmAluno` FOREIGN KEY (`idAluno`) REFERENCES `aluno` (`idluno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `turmaClasse` FOREIGN KEY (`idClasse`) REFERENCES `classe` (`idClasse`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `turmaCurso` FOREIGN KEY (`idcurso`) REFERENCES `cursos` (`idCurso`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

call insertAdmin ('root','bie','Angolana','M','22-02-1997','viana','923443322','root@prituaria.com','root','3322'); 

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

