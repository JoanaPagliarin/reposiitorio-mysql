create schema controledelivros;
use controledelivros;

-- Uma editora tem vários livros, mas um livro só pertence a uma editora (N:1);
-- Um livro pode ter vários estilos e um estilo tem vários livros (N:N);
-- Um livro pode ter vários autores e um autor pode ter vários livros (N:N);
-- Um autor pode ter vários endereços e em um endereço pode ter vários autores (N:N);
-- Uma editora pode ter vários endereços (residir em vários lugares do Brasil), mas em um endereço só tem uma editora (N:1); 

create table editora(
id_editora int primary key auto_increment,
nome_editora varchar (50) not null, 
telefone_editora varchar (20) not null
); 
insert into editora (nome_editora, telefone_editora)
	values ("Abril", "12345"),
			("Globo", "67890"),
            ("Abril", "67890"),
            ("Saraiva", "35230"), 
            ("Primavera", "35231"); 
select * from editora;
select id_editora from editora;
update editora set telefone_editora = 12346 where id_editora = 1;

create table endereco_editora(
id_endereco_editora int primary key auto_increment,
cep varchar (20) not null, 
cidade varchar (20) not null, 
estado enum("PR", "SC", "RS", "outro"),
id_editora_fk int,
constraint fk_endereco_editora foreign key (id_editora_fk) references editora (id_editora)
);
insert into endereco_editora (cep, cidade, estado, id_editora_fk)
	values ("89609000", "Curitiba", "PR", 1), 
		("89609001", "Toledo", "PR", 2), 
        ("89609002", "Luzerna", "SC", 1), 
        ("89609002", "Joaçaba", "SC", 3),
        ("89609123", "São Luis", "outro", 4),
         ("89609002", "Ibicaré", "SC", 5),
         ("89605124", "São Luis", "outro", 2),
         ("89609123", "São Luis", "outro", 1); 
select * from endereco_editora;

create table livro(
id_livro int primary key auto_increment,
nome_livro varchar (50) not null, 
edicao int not null,
data_publicacao date not null,
id_editora_fk int, 
constraint fk_livro_editora foreign key (id_editora_fk) references editora (id_editora)
);
insert into livro (nome_livro, edicao, data_publicacao, id_editora_fk)
	values ("Livro A", 1, "2002-04-15", 3), 
		("Livro B", 1, "1996-08-21", 3), 
        ("Livro C", 2, "1960-10-25", 5),
        ("Livro D", 4, "2002-04-15", 5),
        ("Livro E", 2, "1970-08-14", 4),
        ("Livro F", 3, "1985-04-25", 1), 
        ("Livro G", 3, "2010-07-28", 2); 
alter table livro add preco_livro float not null; 
update livro set preco_livro = 10 where id_livro = 1;
update livro set preco_livro = 20 where id_livro = 2;
update livro set preco_livro = 5 where id_livro = 3;
update livro set preco_livro = 40 where id_livro = 4 or id_livro = 5; 
update livro set preco_livro = 35 where id_livro = 6 or id_LIVRO = 7;
select * from livro;

create table estilo(
id_estilo int primary key, 
nome_estilo varchar (50) not null
);

insert into estilo (id_estilo, nome_estilo)
	values (1, "Drama"), ("2", "Terror"), (3, "Humor"), (4, "Suspense"), (5, "Romance"); 
create table livro_estilo(
id_livro_fk_estilo int, 
id_estilo_fk_livro int,
primary key (id_livro_fk_estilo, id_estilo_fk_livro),
constraint fk_livro_estilo foreign key (id_livro_fk_estilo) references livro (id_livro),
constraint fk_estilo_livro foreign key (id_estilo_fk_livro) references estilo (id_estilo)
);
insert into livro_estilo (id_livro_fk_estilo, id_estilo_fk_livro)
	values (1, 1), (1, 4), (2, 1), (2, 5), (3, 1), (4, 2), (4, 5), (5, 4), (6,1), (7,3);

create table autor(
id_autor int primary key auto_increment,
primeiro_nome_autor varchar (50) not null,
segundo_nome_autor varchar (50),
sobrenome_autor varchar (50) not null, 
telefone_autor varchar (20) not null,
idade int not null check (idade >= 18)
); 
insert into autor (primeiro_nome_autor, segundo_nome_autor, sobrenome_autor, telefone_autor, idade)
	values ("Lucas", NULL, "Silva", "54321", 20), 
			("Joao", "Lucas", "Santos", "09876", 30), 
            ("Antonio", NULL, "Nunes", "12334", 20),
            ("Felipe", "Luis", "Medeiros", "17548", 40),
            ("Matheus", "Luis", "Silva", "53210", 18),
            ("Joao", NULL, "Paz", "87411", 63); 
select * from autor;

create table endereco_autor(
id_endereco_autor int primary key auto_increment,
cep varchar (20) not null, 
cidade varchar (20) not null, 
estado enum("PR", "SC", "RS", "outro")
); 
insert into endereco_autor (cep, cidade, estado)
	values("89609000", "Curitiba", "PR"),
		("89609001", "Toledo", "PR"), 
        ("504123", "São Paulo", "outro"),
        ("89609002", "Ibicaré", "SC"), 
         ("89605124", "São Luis", "outro"),
         ("785412", "Piracicaba", "outro"),
         ("589632", "Belo Horizonte", "outro");
select * from endereco_autor;

create table endereco_autor_assoc(
id_endereco_autor_fk int,
id_endereco_fk int,
primary key (id_endereco_autor_fk, id_endereco_fk),
constraint fk_endereco_autor foreign key (id_endereco_autor_fk) references autor (id_autor),
constraint fk_endereco foreign key (id_endereco_fk) references endereco_autor (id_endereco_autor)
);
insert into endereco_autor_assoc(id_endereco_autor_fk, id_endereco_fk)
	values (1, 2), (1, 3), (2, 1), (3, 4), (4, 5), (5, 6), (6, 6), (2,7), (5, 7); 
select * from endereco_autor_assoc; 

create table livro_autor(
id_livro_fk_autor int,
id_autor_fk_livro int, 
primary key (id_livro_fk_autor, id_autor_fk_livro), 
constraint fk_livro_autor foreign key (id_livro_fk_autor) references livro (id_livro),
constraint fk_autor_livro foreign key (id_autor_fk_livro) references autor (id_autor)
);

insert into livro_autor (id_livro_fk_autor, id_autor_fk_livro)
	values(1, 1), (1, 2), (2, 3), (7, 1), (5,2), (4,3), (6,1), (7,2), (4,2);

