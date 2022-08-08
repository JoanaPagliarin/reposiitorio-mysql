create schema escola;
use escola; 

-- PROFESSOR -----------------------------------------------------------------
create table professor(
id_professor int primary key auto_increment,
nome varchar (50) not null, 
telefone varchar (20) not null,
endereço varchar (50) not null
);

insert into professor(nome, telefone, endereço)
	values("Alice", "1874784891", "Toledo"), ("Joana", "18717878", "Maringá"), ("Bruno", "1877788178", "Londrina"), ("Thiago", "18918778", "Palmas"), ("Rafael", "178871187", "São Paulo");

insert into professor(nome, telefone, endereço)
	values("Luciana", "8498771", "Itajai");

update professor
	set endereço = "Joaçaba"
    where nome = "Alice"; 
    
delete from professor where endereço = "São Paulo"; 

delete from professor where id_professor = 3; -- isso faz com que suma da tabela associativa também quando id_professor = 3

select * from professor; 
-- -----------------------------------------------------------------
-- ALUNO  -----------------------------------------------------------------
create table aluno(
id_aluno int primary key auto_increment,
nome varchar (50) not null, 
telefone varchar (20) not null,
endereço varchar (50) not null,
id_aula int,
id_turma int,
constraint fk_aluno_aula foreign key (id_aula) references aula (id_aula),
constraint fk_aluno_turma foreign key (id_turma) references turma (id_turma)
);

insert into aluno(nome, telefone, endereço, id_aula, id_turma)
	values("Luis", "187118789", "Luzerna", "3", "2"), ("Guilherme", "11787871", "Lacerdopolis", "2", "3");
    
insert into aluno(nome, telefone, endereço, id_aula, id_turma)
	values("Matheus", "29298289", "Herval", "6", "3");
    
select * from aluno;

-- -----------------------------------------------------------------
-- TURMA -----------------------------------------------------------------
create table turma(
id_turma int primary key auto_increment,
nome varchar (50) not null
);

insert into turma(nome)
	values("9ano"), ("1ano"), ("4ano");
    
insert into turma(nome)
	values("2ano");
    
update turma
	set nome = "5ano"
    where nome = "4ano";

delete from turma where nome = "2ano";
    
select * from turma;

--  -----------------------------------------------------------------
-- AULA -----------------------------------------------------------------
create table aula(
id_aula int primary key auto_increment,
nome varchar (50) not null
);

insert into aula(nome)
	values("História"), ("Geografia"), ("Português"); 
    
delete from aula where id_aula = 1; 

insert into aula(nome)
	values("Matemática"), ("Artes"), ("Física"); 
    
update aula
	set nome = "Ciências Humanas"
    where nome = "Artes";
    
select * from aula; 
-- -----------------------------------------------------------------
-- TABELA ASSOCIATIVA PROFESSOR_TURMA ----------------------
-- SÓ CONSIGO ADICIONAR INFORMAÇÕES NA TABELA ASSOCIATIVA SE ESSAS JÁ EXISTIREM NAS TABELAS INDIVIDUAIS
create table professor_turma(
id_professor int,
id_turma int,
primary key (id_professor, id_turma),
constraint fk_professor_turma foreign key (id_professor) references professor (id_professor),
constraint fk_turma_professor foreign key (id_turma) references turma (id_turma)
);

insert into professor_turma (id_professor, id_turma)
	values(2, 2), (3, 2), (4, 3);
    
delete from professor_turma where id_professor = 4;

update professor_turma
	set id_professor = 6 -- só consigo fazer isso porque previamente já havia criado um id_professor = 6 na tabela professor. Não posso substituir um id_professor por outro já existente
    where id_professor = 3;
    
select * from professor_turma; 
	
-- -----------------------------------------------------------------

