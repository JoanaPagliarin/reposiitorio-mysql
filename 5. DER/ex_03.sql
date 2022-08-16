create schema revendedora;
use revendedora;

CREATE TABLE `automovel` (
  `id_automovel` int NOT NULL,
  `renavam` varchar(11) DEFAULT NULL,
  `placa` char(7) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `ano_fabricacao` char(4) NOT NULL,
  `ano_modelo` char(4) NOT NULL,
  `motor` varchar(20) NOT NULL,
  `cor` varchar(10) NOT NULL,
  `num_portas` int NOT NULL,
  `tipo_combustivel` varchar(20) NOT NULL,
  `preco` float NOT NULL,
  PRIMARY KEY (`id_automovel`),
  UNIQUE KEY `placa` (`placa`),
  UNIQUE KEY `renavam` (`renavam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL,
  `nome` varchar(30) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `cpf` char(12) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `vendedores` (
  `id_vendedor` int NOT NULL,
  `nome` varchar(20) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `cpf` char(12) NOT NULL,
  `data_admissao` date NOT NULL,
  `salario` float NOT NULL,
  PRIMARY KEY (`id_vendedor`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `negocio` (
  `id_negocio` int NOT NULL,
  `data_negocio` date NOT NULL,
  `preco_negocio` float NOT NULL,
  `id_vendedor` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_negocio`),
  KEY `fk_negocio_vendedor` (`id_vendedor`),
  KEY `fk_negocio_cliente` (`id_cliente`),
  CONSTRAINT `fk_negocio_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_negocio_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `negocio_automovel` (
  `id_negocio` int NOT NULL,
  `id_automovel` int NOT NULL,
  PRIMARY KEY (`id_negocio`,`id_automovel`),
  KEY `id_automovel` (`id_automovel`),
  CONSTRAINT `negocio_automovel_ibfk_1` FOREIGN KEY (`id_automovel`) REFERENCES `negocio` (`id_negocio`),
  CONSTRAINT `negocio_automovel_ibfk_2` FOREIGN KEY (`id_negocio`) REFERENCES `automovel` (`id_automovel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `endereco` (
  `id_endereco` int NOT NULL,
  `cep` varchar(20) NOT NULL,
  `cidade` varchar(15) NOT NULL,
  `estado` varchar(15) NOT NULL,
  PRIMARY KEY (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `cliente_endereco` (
  `id_cliente` int NOT NULL,
  `id_endereco` int NOT NULL,
  `rua` varchar(20) NOT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`,`id_endereco`),
  KEY `fk_endereco_cliente` (`id_endereco`),
  CONSTRAINT `fk_endereco_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `endereco` (`id_endereco`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `vendedor_endereco` (
  `id_vendedor` int NOT NULL,
  `id_endereco` int NOT NULL,
  `rua` varchar(20) NOT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_vendedor`,`id_endereco`),
  KEY `fk_endereco_vendedor` (`id_endereco`),
  CONSTRAINT `fk_endereco_vendedor` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`),
  CONSTRAINT `fk_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;