create database lista002;
create schema database_lista002;

create table alunos(
	codigo_aluno int not null primary key auto_increment,
    primeiro_nome_aluno varchar (50) not null, 
    segundo_nome_aluno varchar (50), 
    ultimo_nome_aluno varchar (50) not null,
    celular_aluno varchar (50) not null,
    cidade_aluno varchar (50) not null  
    ); 
    
desc alunos;

create table alunos_2(
	codigo_aluno int not null primary key auto_increment,
    primeiro_nome_aluno varchar (200) not null, 
    segundo_nome_aluno varchar (200), 
    ultimo_nome_aluno varchar (200) not null,
    celular_aluno varchar (50) not null,
    cidade_aluno varchar (100) not null
    );
    
desc alunos_2;

create table funcionarios(
	codigo_funcionario int not null primary key auto_increment,
    primeiro_nome_funcionario varchar (200) not null, 
    segundo_nome_funcionario varchar (200), 
    ultimo_nome_funcionario varchar (200) not null,
    celular_funcionario varchar (50) not null,
    cidade_funcionario varchar (50) not null,  
    estado_funcionario varchar (50) not null, 
    cep_funcionario varchar (20) not null,
    rg_funcionario varchar (20) not null, 
    cpf_funcionario varchar (20) not null, 
    salario_funcionario float not null
    );

desc funcionarios; 

create table fornecedores(
		codigo_fornecedor int not null primary key auto_increment,
		primeiro_nome_fornecedor varchar (200) not null, 
		segundo_nome_fornecedor varchar (200), 
		ultimo_nome_fornecedor varchar (200) not null,
		celular_fornecedeor varchar (50) not null,
		cidade_fornecedor varchar (50) not null,  
		estado_fornecedor varchar (50) not null, 
		cep_fornecedor varchar (20) not null,
		rg_fornecedor varchar (20) not null, 
		cpf_fornecedor varchar (20) not null, 
		salario_fornecedor float not null, 
        cnpj_fornecedor varchar (50) not null,
        email_fornecedor varchar (50) not null
    );
    
desc fornecedores; 

create table livros(
    codigo_livros int not null primary key auto_increment,
    nome_livro varchar (50) not null, 
    categoria_livro varchar (50) not null, 
    resumo_livro text not null, 
    preco_custo_ivro float not null, 
    preco_venda_livro float not null
    );
   
desc livros; 
    
create table estoque(
    codigo_produto int not null primary key auto_increment,
    nome_produto varchar (50) not null, 
    categoria_produto varchar (50) not null, 
    preco_custo_produto float not null, 
    preco_venda_produto float not null,
    quantidade_produto int not null,
    nome_fornecedor varchar (50) not null
    );
   
desc estoque; 

create table notas(
	codigo_aluno int not null primary key auto_increment,
    primeiro_nome_aluno varchar (50) not null, 
    segundo_nome_aluno varchar (50), 
    ultimo_nome_aluno varchar (50) not null,
    bimestre varchar (6) not null
    );
    
desc notas;

create table fechamento_caixa_empresa(
	id_caixa_empresa int not null primary key auto_increment,
    data_caixa_empresa date not null, 
    descricao_caixa_empresa tinytext not null,
    credito_empresa float,
    debito_empresa float
    );
    
desc fechamento_caixa_empresa;

create table contas_pendentes(
	codigo_conta int not null primary key auto_increment,
    vencimento_conta date not null,
    descricao_conta tinytext not null,
    valor_conta float not null,
    data_conta_paga date not null
    );
    
desc contas_pendentes;

create table contas_a_receber(
	codigo_conta int not null primary key auto_increment,
    data_conta date not null,
    descricao_conta tinytext not null,
    valor_conta float not null,
    data_recebimento date not null
    );
    
desc contas_a_receber;

create table filmes(
	codigo_filme int not null primary key auto_increment,
    nome_filme varchar (50) not null,
    sinopse_filme text not null, 
    categoria_filme varchar (50) not null, 
    nome_diretor_filme varchar (50) not null
    );
    
desc filmes;  
    
create table CDs(
	codigo_cd int not null primary key auto_increment,
    nome_cd varchar (50) not null,
    nome_cantor_cd varchar (50) not null,
    ano_cd year not null,
    qntdd_musicas int not null
    );
    
desc CDs;

drop table alunos_2;

desc alunos_2;

drop table livros, contas_pendentes, contas_a_receber, filmes;
 
 desc alunos;
 
 desc funcionarios;
 
 desc fornecedores;

alter table fornecedores rename to super_fornecedores;

desc super_fornecedores;

drop table super_fornecedores;

alter table funcionarios add tipo_sanguineo varchar (50);

desc funcionarios; 



    