-- COMPANHIA AÉREA

create schema database_aerea;
use database_aerea;

create table passageiros(
id_passageiro int not null primary key,
cpf char (11) not null,
passaporte char (50) not null, 
primeiro_nome char (50) not null,
segundo_nome char (50),
sobrenome char (50) not null, 
telefone char (50) not null,
assento int not null
id_aviao int not null, 
constraint fk_passageiros_aviao foreign key (id_aviao) references aviao (id_aviao)
);

desc passageiros;
drop table passageiros; 

create table bagagem(
id_bagagem int not null primary key,
peso float not null,
volume float not null, 
tipo varchar (50) not null,
id_passageiro int not null,
constraint fk_bagagem_passageiro foreign key (id_passageiro) references passageiros (id_passageiro)
);

desc bagagem;
drop table bagagem;

create table carga(
id_carga int not null primary key,
peso float not null,
volume float not null,
tipo varchar (50) not null
id_aviao int not null, 
constraint fk_carga_aviao foreign key (id_aviao) references aviao (id_aviao)
);

create table empresa(
id_cnpj varchar (50) not null primary key,
telefone varchar (50) not null,
endereco varchar (100) not null, 
nome varchar (50) not null, 
tipo varchar (50) not null
);

create table voos(
id_voo int not null primary key,
origem varchar (50) not null, 
destino varchar (50) not null,
horario_partida varchar (50) not null,
horario_chegada varchar (50) not null
id_aviao int not null, 
constraint fk_voo_aviao foreign key (id_aviao) references aviao (id_aviao)
);

create table aeroporto(
id_aeroporto int not null primary key,
cnpj varchar (50) not null,
telefone varchar (50) not null,
endereco varchar (100) not null, 
nome varchar (50) not null,
id_aviao int not null, 
constraint fk_aeroporto_aviao foreign key (id_aviao) references aviao (id_aviao)
);

create table aviao(
id_aviao int not null primary key,
capacidade float not null,
tipo varchar (50) not null,
modelo varchar (50) not null,
fabricante varchar (50) not null,
ano int (10) not null
id_passageiro int not null,
id_carga int not null,
id_voo int not null,
id_aeroporto int not null, 

create table funcionarios(
id_funcionario int not null primary key,
cpf char (11) not null,
primeiro_nome char (50) not null,
segundo_nome char (50),
sobrenome char (50) not null,
departamento varchar (50) not null,
telefone char (50) not null,
id_aeroporto int not null,
constraint fk_funcionarios_aeroporto foreign key (id_aeroporto) references aviao (id_aeroporto)
);

create table hangar(
id_hangar int not null primary key,
setor varchar (50) not null,
capacidade float not null,
id_aeroporto int not null,
constraint fk_hangar_aeroporto foreign key (id_aeroporto) references aviao (id_aeroporto)
);

create table equipamentos(
id_equipamentos int not null primary key,
autorizacao varchar (50) not null,





