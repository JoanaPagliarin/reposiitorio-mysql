create schema database_clinica;
use database_clinica; 

create table sala(
id_numero_sala int not null unique primary key check (id_numero_sala > 1 AND id_numero_sala < 50),
andar int not null unique check (andar < 12),
id_CRM varchar (15) unique not null, -- medicos
constraint fk_sala_medicos foreign key (id_CRM) references medicos (id_CRM)
);

drop table sala;

create table medicos(
id_CRM varchar (15) unique not null primary key, 
nome varchar (40) not null, 
idade int check (idade > 23),
especialidade varchar (20) not null default "Cirurgia Geral", 
cpf varchar (15) unique not null, 
data_admissao date
);

create table pacientes(
id_rg char (11) unique not null primary key,
nome varchar (40) not null, 
data_nascimento date,
cidade varchar (30) default "Toledo",
doenca varchar (40) not null, 
plano_saude varchar (40) not null default "UNIMED"
);

create table funcionarios(
id_matricula varchar (15) not null unique primary key, 
nome varchar (40) not null, 
data_nascimento date not null, 
data_admissao date not null, 
cargo varchar (40) not null default "Assistente Médico",
salario float not null default "1300"
);

create table consultas(
id_consulta int unique not null primary key,
data_horario datetime,
id_rg char (11) unique not null, -- pacientes
id_CRM varchar (15) unique not null,  -- medicos 
constraint fk_consultas_pacientes foreign key (id_rg) references pacientes (id_rg),
constraint fk_consultas_medicos foreign key (id_CRM) references medicos (id_CRM)
);

drop table consultas;
desc consultas; 