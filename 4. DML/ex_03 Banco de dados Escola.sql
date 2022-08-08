create schema escola_ex3;
use escola_ex3; 

-- INSTRUTOR -----------------------------------------------------
create table instrutor(
id_instrutor int auto_increment, 
cpf_instrutor varchar (50),
primary key (id_instrutor, cpf_instrutor),
rg_instrutor varchar (50) not null, 
nome_instrutor varchar (50) not null, 
telefone_instrutor varchar (50) not null ,
endereco_instrutor varchar (50) not null,
salario_instrutor float unsigned not null, 
email varchar (50) not null,
unique (rg_instrutor, telefone_instrutor, email)
);

insert into instrutor(cpf_instrutor, rg_instrutor, nome_instrutor, telefone_instrutor, endereco_instrutor, salario_instrutor, email)
	values("29478512479", "4785129", "Edivaldo Pereira", "35236987", "Floripa", 1541.51, "edivaldopereira@gmail.com"), 
			("56256186214", "7458746", "Lorena Silva", "145874125", "Toledo", 4152.36, "lorenasilva@gmail.com"),
            ("47851296387", "4125787", "Amanda Batista", "478569325", "Joaçaba", 2899.28, "amandabatista@gmail.com"),
			("875526262", "652881", "Larissa Mendes", "18844995", "Maringá", 45521.62, "larissamendes@gmail.com"),
            ("5817115181", "184818", "Karina Boreal", "1588715", "Piracicaba", 1987.52, "karinaboreal@gmail.com");
            
            
update instrutor
	set nome_instrutor = "Edivaldo Pereira da Silva"
    where id_instrutor = 1;
    
update instrutor
	set nome_instrutor = "Lorena Silva Batista"
    where email = "lorenasilva@gmail.com";
    
-- delete from instrutor where id_instrutor = 2; -- nao consigo deletar pq id_instrutor = 2 faz parte da tabela associativa
delete from  instrutor where id_instrutor = 4;
delete from instrutor where id_instrutor = 3; 

select * from instrutor; 

 -- -----------------------------------------------------------
 -- ALUNO -----------------------------------------------------
create table aluno(
id_aluno int auto_increment primary key,
nome_aluno  varchar (50) not null, 
telefone_aluno varchar (20) not null,
endereco_aluno varchar (50) not null,
idade_aluno int not null check (idade_aluno >= 18),
sexo_aluno enum  ("feminino", "masculino", "não identificado"),
id_turma_fk int not null, 
constraint fk_aluno_turma foreign key (id_turma_fk) references turma (id_turma),
id_curso_fk int not null,
constraint fk_aluno_curso foreign key (id_curso_fk) references curso (id_curso)
);

insert into aluno(nome_aluno, telefone_aluno, endereco_aluno, idade_aluno, sexo_aluno, id_turma_fk, id_curso_fk)
	values("Joana", "499849489", "Toledo", "19", "feminino", "1", "1"),
			("Ricardo", "487784887", "Maringá", "20", "masculino", "2", "1"),
            ("Larissa", "489949948", "São Paulo", "25", "nao identificado", "4", "5"),
            ("Thiago", "4989894", "Minas Gerais", "55", "masculino", "3", "3"), 
            ("Matheus", "4899914", "Brasília", "18", "masculino", "1", "3");		
    
delete from aluno where id_aluno = 4; -- aqui eu consigo deletar 
delete from aluno where id_aluno = 3;
    
select * from aluno;
 -- -----------------------------------------------------------
 -- TURMA -----------------------------------------------------
create table turma(
id_turma int auto_increment primary key,
nome_turma varchar (50) not null,
localizacao_turma varchar (50) default ("Téreo - Prédio A")
);

insert into turma(nome_turma, localizacao_turma)
	values("A", "Andar 2 - Prédio B"), 
			("B", default),  
            ("A", default), 
            ("B", "Andar 2 - Prédio B"), 
            ("C", "Andar 3 - Prédio C");
            
update turma
	set localizacao_turma = default
    where id_turma = 1;
    
update turma
	set localizacao_turma = "Andar 4 - Prédio D"
    where id_turma = 5;
    
select * from turma;
 -- -----------------------------------------------------------
 -- CURSO -----------------------------------------------------
create table curso(
id_curso int auto_increment primary key,
nome_curso varchar (50) not null, 
nível_curso varchar (50) not null
);

insert into curso(nome_curso, nível_curso)
	values("Medicina", "Bacharelado"), 
		("Engenharia 4.0", "Pós-Graduação"),
        ("Eletrotécnica", "Técnico"), 
        ("Programação", "Extensão"),
		("Direito", "Bacharelado");

update curso
	set nome_curso = "Eletromecânica"
    where id_curso = 3;
    
update curso
	set nome_curso = "ADS"
	where id_curso = 4;
    
-- delete from curso where id_curso = 3; -- nao consigo deletar se o id_curso faz parte de uma relação em outra tabela; na outra tabela, porém, consigo deletar. 
    
  insert into curso (nome_curso, nível_curso)
	values("Agronomia", "Bacharelado"), ("Hotelaria", "Bacharelado");
    
delete from curso where id_curso = 6;
delete from curso where id_curso = 7;
    
select * from curso;
 -- -----------------------------------------------------------
-- TABELA ASSOCIATIVA TURMA-INSTRUTOR
create table turma_instrutor(
id_instrutor_associativa int,
id_turma_associativa int,
primary key (id_instrutor_associativa, id_turma_associativa),
constraint fk_id_instrutor_associativa foreign key (id_instrutor_associativa) references instrutor (id_instrutor),
constraint fk_id_turma_associativa foreign key (id_turma_associativa) references turma (id_turma)
);

insert into turma_instrutor(id_instrutor_associativa, id_turma_associativa)
	values (3,4), (2,3), (4,1), (5,5), (1,3);
    
update turma_instrutor
	set id_instrutor_associativa = 5
    where id_turma_associativa = 1;

update turma_instrutor
	set id_instrutor_associativa = 1
    where id_turma_associativa = 4; 
    
delete from turma_instrutor where id_instrutor_associativa = 1;  
delete from turma_instrutor where id_turma_associativa = 5;  

select * from turma_instrutor;

