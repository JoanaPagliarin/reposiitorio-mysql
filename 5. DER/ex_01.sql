create schema clinica;
use clinica; 

CREATE TABLE `medicos` (
  `id_medico` int NOT NULL,
  `CRM` varchar(15) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `idade` int DEFAULT NULL,
  `especialidade` varchar(20) NOT NULL DEFAULT 'Cirurgia Geral',
  `cpf` varchar(15) NOT NULL,
  `data_admissao` date DEFAULT NULL,
  PRIMARY KEY (`id_medico`),
  UNIQUE KEY `CRM` (`CRM`),
  UNIQUE KEY `cpf` (`cpf`),
  CONSTRAINT `medicos_chk_1` CHECK ((`idade` > 23))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sala` (
  `id_sala` int NOT NULL,
  `numero_sala` int DEFAULT NULL,
  `andar` int NOT NULL,
  `id_medico` int NOT NULL,
  PRIMARY KEY (`id_sala`),
  KEY `fk_sala_medicos` (`id_medico`),
  CONSTRAINT `fk_sala_medicos` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  CONSTRAINT `sala_chk_1` CHECK (((`numero_sala` > 1) and (`numero_sala` < 50))),
  CONSTRAINT `sala_chk_2` CHECK ((`andar` < 12))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pacientes` (
  `id_paciente` int NOT NULL,
  `rg` char(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `doenca` varchar(40) NOT NULL,
  `plano_saude` varchar(40) NOT NULL DEFAULT 'UNIMED',
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `rg` (`rg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `funcionarios` (
  `id_funcionario` int NOT NULL,
  `matricula` varchar(15) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `data_nascimento` date NOT NULL,
  `data_admissao` date NOT NULL,
  `cargo` varchar(40) NOT NULL DEFAULT 'Assistente Médico',
  `salario` float NOT NULL DEFAULT '1300',
  PRIMARY KEY (`id_funcionario`),
  UNIQUE KEY `matricula` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `consultas` (
  `id_consulta` int NOT NULL,
  `data_horario` datetime DEFAULT NULL,
  `id_paciente` int NOT NULL,
  `id_medico` int NOT NULL,
  PRIMARY KEY (`id_consulta`),
  KEY `fk_consultas_pacientes` (`id_paciente`),
  KEY `fk_consultas_medicos` (`id_medico`),
  CONSTRAINT `fk_consultas_medicos` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  CONSTRAINT `fk_consultas_pacientes` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `endereco` (
  `id_endereco` int NOT NULL,
  `cep` varchar(20) NOT NULL,
  `cidade` varchar(15) NOT NULL,
  `estado` varchar(15) NOT NULL,
  PRIMARY KEY (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `paciente_endereco` (
  `id_paciente` int NOT NULL,
  `id_endereco` int NOT NULL,
  `rua` varchar(20) NOT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`,`id_endereco`),
  KEY `fk_endereco_paciente` (`id_endereco`),
  CONSTRAINT `fk_endereco_paciente` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`),
  CONSTRAINT `fk_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `medico_endereco` (
  `id_medico` int NOT NULL,
  `id_endereco` int NOT NULL,
  `rua` varchar(20) NOT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_medico`,`id_endereco`),
  KEY `fk_endereco_medico` (`id_endereco`),
  CONSTRAINT `fk_endereco_medico` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`),
  CONSTRAINT `fk_medico` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


