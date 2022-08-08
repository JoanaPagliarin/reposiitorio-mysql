create schema revendedora;
use revendedora;

create table automovel(
renavam varchar (11) not null primary key,
placa char (7) not null, 
marca varchar (20) not null, 
modelo varchar (50) not null, 
ano_fabricacao char (4) not null,
ano_modelo char (4) not null, 
motor varchar (20) not null, 
cor varchar (10) not null, 
num_portas int not null,
tipo_combustivel varchar (20) not null,
preco float not null
);
desc automovel;
drop table automovel;

create table clientes(
id_cliente int not null primary key,
nome varchar (20) not null,
sobrenome varchar (50) not null, 
num_rua int not null,
nome_rua varchar (20) not null,
complemento varchar (20) not null, 
bairro varchar (20) not null,
cidade varchar (20) not null,
estado varchar (20) not null, 
cep varchar (15) not null
);
desc clientes;
drop table clientes;

create table vendedores(
id_vendedor int not null primary key,
nome varchar (20) not null,
sobrenome varchar (50) not null, 
num_rua int not null,
nome_rua varchar (20) not null,
complemento varchar (20) not null, 
bairro varchar (20) not null,
cidade varchar (20) not null,
estado varchar (20) not null, 
cep varchar (15) not null,
data_admissao date not null,
salario float not null
);
desc vendedores;
drop table vendedores;

create table negocio(
id_negocio varchar (20) not null primary key,
data_negocio date not null, 
preco_negocio float not null,
id_vendedor int, 
id_cliente int, 
constraint fk_negocio_vendedor foreign key (id_vendedor) references vendedores (id_vendedor),
constraint fk_negocio_cliente foreign key (id_cliente) references clientes (id_cliente)
);
desc negocio;
drop table negocio;


create table negocio_automovel(
id_negocio varchar (20),
renavam varchar (11),
primary key (id_negocio, renavam),
foreign key (id_negocio) references automovel (renavam),
foreign key (renavam) references negocio (id_negocio)
);
