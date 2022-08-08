create schema livros;
use livros;

-- CATEGORIA ----------------------------------------------------------------------------
create table categoria(
id_categoria int primary key,
nome_categoria varchar (20) not null
);

insert into categoria (id_categoria, nome_categoria)
	values (1, "drama"), (2, "ficção"), (3, "romance"), (4, "terror"), (5, "suspense"); 
    
delete from categoria where id_categoria = 5;
delete from categoria where nome_categoria = "ficção";
    
select * from categoria; 

-- ID_CATEGORIA DISPONÍVEIS: 1, 3 e 4
-- --------------------------------------------------------------------------------------
-- AUTORES -----------------------------------------
create table autores(
id_autor int primary key,
endereco_autor varchar (50) not null,
telefone_autor varchar (20) not null,
nome_autor varchar (50) not null
);

insert into autores(id_autor, endereco_autor, telefone_autor, nome_autor)
	values (1, "85901046", "49999087858", "John Green"), (2, "89609000", "49999525321", "Agatha Christie"), (3, "89609100", "49999525331", "Sidney Sheldon"), (4, "85901045", "49999525387", "Joana");
    
update autores
	set nome_autor = "Drauzio Varela"
    where nome_autor = "Joana";
        
select * from autores;
-- --------------------------------------------------------------------------------------
-- EDITORAS ----------------------------------------------------------------------
create table editoras(
id_editora int primary key,
endereco_editora varchar (50) not null,
telefone_editora varchar (20) not null,
nome_editora varchar (50) not null
);

insert into editoras (id_editora, endereco_editora, telefone_editora, nome_editora)
	values(1, "Toledo", "258148818", "Editora Toledo"), (2, "Maringá", "485148574", "Editora Maringá"), (3, "Londrina", "87871787", "Editora Londrina");
    
select * from editoras;
-- -------------------------------------------------------------------------------------
-- LIVROS --------------------------------------------------
create table livros(
id_livro int primary key,
ano int not null, 
edicao int not null,
id_editora int not null,
constraint fk_livro_editora foreign key (id_editora) references editoras (id_editora)
);

-- SÓ INSERIR DADOS NA ID_EDITORA DA TABELA LIVROS SE ID_EDITORA JÁ EXISTE NA TABELA EDITORA;
-- OU SEJA, PRIMEIRO INSERE DADOS NA TABELA QUE NÃO LEVA A CONSTRAINT 

-- ID_EDITORA DISPONÍVEIS: 1, 2 e 3

insert into livros (id_livro, ano, edicao, id_editora)
	values(1, 2002, 44, 1), (2, 1998, 41, 3); 

insert into livros (id_livro, ano, edicao, id_editora)
	values(3, 2001, 4, 3);

select * from livros; 
-- -------------------------------------------------------------------------------------
-- SÓ INSERRIR DADOS NA TABELA ASSOCIATIVA SE ESTES JÁ EXISTEM NAS TABELAS INDIVIDUAIS
-- TABELA ASSOCIATIVA CATEGORIA_LIVROS ---------------------------------------
create table categoria_livros(
id_categoria int,
id_livro int,
primary key(id_categoria, id_livro),
foreign key (id_livro) references livros (id_livro),
foreign key (id_categoria) references categoria (id_categoria)
); 

-- ID_CATEGORIA DISPONÍVEIS: 1, 3 e 4
-- ID_LIVRO DISPONÍVEIS: 1, 2 e 3

insert into categoria_livros(id_categoria, id_livro)
	values (1, 1), (1,3), (1,2);
    
select * from categoria_livros;
-- -------------------------------------------------------------------------------------
-- TABELA ASSOCIATIVA LIVROS_AUTORES --------------------------------------------------
create table livros_autores(
id_livro int,
id_autor int, 
primary key(id_livro, id_autor),
foreign key (id_livro) references livros (id_livro),
foreign key (id_autor) references autores (id_autor)
);

-- ID_LIVRO DISPONÍVEIS: 1, 2 e 3
-- ID_AUTOR DISPONÍVEIS: 1, 2, 3, 4

insert into livros_autores(id_livro, id_autor)
	values(1,1),(1,2),(1,3),(1,4),(2,1),(3,2);
    
select * from livros_autores; 
-- -------------------------------------------------------------------------------------
-- TABELA TESTE COM AUTO_INCREMENT
create table clientes(
id_cliente int primary key auto_increment,
nome_cliente varchar (50)
);

insert into clientes(nome_cliente)
	values("Joana"), ("Willian"); 

delete from clientes where nome_cliente = "Joana"; 

update clientes
	set id_cliente = 1
    where nome_cliente = "Willian";

select * from clientes;

-- conclusão: se eu uso auto_increment nao preciso inserir meu id_cliente



