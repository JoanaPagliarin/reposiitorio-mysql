create schema database_eleicao;
use database_eleicao;

create table cargos(
id_cargo int not null unique primary key,
nome_cargo ENUM ('prefeito', 'vereador'),
salario float not null default "17000",
numero_vagas int not null unique
);

create table candidatos(
numero_candidato int not null unique primary key,
nome varchar (40) not null,
codigo_cargo int not null, 
codigo_partido int not null,
constraint fk_candidatos_cargo foreign key (codigo_cargo) references cargos (id_cargo),
constraint fk_candidatos_partido foreign key (codigo_partido) references partidos (codigo_partido)
);

drop table candidatos;

create table partidos(
codigo_partido int not null unique primary key,
sigla char (5) not null, 
nome varchar (40) not null unique,
numero char (3) not null unique
);

create table eleitor(
titulo_eleitor varchar (30) not null unique primary key,
zona_eleitoral char (5) not null,
sessao_eleitoral char (5) not null, 
nome varchar (40) not null
);

create table voto(
titulo_eleitor varchar(30) unique not null primary key,
numero_candidato int not null,
constraint fk_voto_candidato foreign key (numero_candidato) references candidatos (numero_candidato)
);

drop table voto;






