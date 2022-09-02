CREATE TABLE `autor` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `primeiro_nome_autor` varchar(50) NOT NULL,
  `segundo_nome_autor` varchar(50) DEFAULT NULL,
  `sobrenome_autor` varchar(50) NOT NULL,
  `telefone_autor` varchar(20) NOT NULL,
  `idade` int NOT NULL,
  PRIMARY KEY (`id_autor`),
  CONSTRAINT `autor_chk_1` CHECK ((`idade` >= 18))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `editora` (
  `id_editora` int NOT NULL AUTO_INCREMENT,
  `nome_editora` varchar(50) NOT NULL,
  `telefone_editora` varchar(20) NOT NULL,
  PRIMARY KEY (`id_editora`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `endereco_autor` (
  `id_endereco_autor` int NOT NULL AUTO_INCREMENT,
  `cep` varchar(20) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  `estado` enum('PR','SC','RS','outro') DEFAULT NULL,
  PRIMARY KEY (`id_endereco_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `endereco_autor_assoc` (
  `id_endereco_autor_fk` int NOT NULL,
  `id_endereco_fk` int NOT NULL,
  PRIMARY KEY (`id_endereco_autor_fk`,`id_endereco_fk`),
  KEY `fk_endereco` (`id_endereco_fk`),
  CONSTRAINT `fk_endereco` FOREIGN KEY (`id_endereco_fk`) REFERENCES `endereco_autor` (`id_endereco_autor`),
  CONSTRAINT `fk_endereco_autor` FOREIGN KEY (`id_endereco_autor_fk`) REFERENCES `autor` (`id_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `endereco_editora` (
  `id_endereco_editora` int NOT NULL AUTO_INCREMENT,
  `cep` varchar(20) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  `estado` enum('PR','SC','RS','outro') DEFAULT NULL,
  `id_editora_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_endereco_editora`),
  KEY `fk_endereco_editora` (`id_editora_fk`),
  CONSTRAINT `fk_endereco_editora` FOREIGN KEY (`id_editora_fk`) REFERENCES `editora` (`id_editora`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estilo` (
  `id_estilo` int NOT NULL,
  `nome_estilo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estilo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `livro` (
  `id_livro` int NOT NULL AUTO_INCREMENT,
  `nome_livro` varchar(50) NOT NULL,
  `edicao` int NOT NULL,
  `data_publicacao` date NOT NULL,
  `id_editora_fk` int DEFAULT NULL,
  `preco_livro` float NOT NULL,
  PRIMARY KEY (`id_livro`),
  KEY `fk_livro_editora` (`id_editora_fk`),
  CONSTRAINT `fk_livro_editora` FOREIGN KEY (`id_editora_fk`) REFERENCES `editora` (`id_editora`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `livro_autor` (
  `id_livro_fk_autor` int NOT NULL,
  `id_autor_fk_livro` int NOT NULL,
  PRIMARY KEY (`id_livro_fk_autor`,`id_autor_fk_livro`),
  KEY `fk_autor_livro` (`id_autor_fk_livro`),
  CONSTRAINT `fk_autor_livro` FOREIGN KEY (`id_autor_fk_livro`) REFERENCES `autor` (`id_autor`),
  CONSTRAINT `fk_livro_autor` FOREIGN KEY (`id_livro_fk_autor`) REFERENCES `livro` (`id_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `livro_estilo` (
  `id_livro_fk_estilo` int NOT NULL,
  `id_estilo_fk_livro` int NOT NULL,
  PRIMARY KEY (`id_livro_fk_estilo`,`id_estilo_fk_livro`),
  KEY `fk_estilo_livro` (`id_estilo_fk_livro`),
  CONSTRAINT `fk_estilo_livro` FOREIGN KEY (`id_estilo_fk_livro`) REFERENCES `estilo` (`id_estilo`),
  CONSTRAINT `fk_livro_estilo` FOREIGN KEY (`id_livro_fk_estilo`) REFERENCES `livro` (`id_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
