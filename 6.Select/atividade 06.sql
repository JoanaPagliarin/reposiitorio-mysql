select nome from estilo order by nome;

select nome from autor order by nome desc;

select nome, telefone from editora;

select nome from editora;

select nome from estilo order by nome desc;

select id_estilo from estilo where id_estilo = 3;

select id_autor from autor where id_autor = 1;

select id_editora from editora where id_editora = 4;

select livro.titulo, editora.nome from livro, editora where livro.id_editora = editora.id_editora; 

select livro.titulo, editora.nome from livro, editora where livro.id_editora = editora.id_editora and editora.nome like 'a%'; 

select livro.titulo, editora.nome, estilo.nome, autor.nome 
	from livro, editora, estilo, autor
    where livro.id_editora = editora.id_editora and
    livro.id_autor = autor.id_autor and
    livro.id_estilo = estilo.id_estilo;
    
select livro.titulo, editora.nome from livro, editora where editora.telefone = 12345;

select livro.titulo, autor.nome from livro, autor where autor.idade = 35;

select livro.titulo, autor.nome, editora.nome from livro, autor, editora where livro.id_editora = editora.id_editora and autor.nome = 'dan brown';

select livro.titulo, autor.nome, editora.nome 
	from livro, autor, editora 
    where livro.id_editora = editora.id_editora
    and (autor.nome = 'dan brown')
    and (autor.idade = 35);

select livro.titulo, autor.nome, editora.nome, editora.telefone
	from livro, autor, editora 
	where livro.id_editora = editora.id_editora
    and (livro.id_autor = autor.id_autor)
    and (autor.nome = 'dan brown')
    or (editora.telefone = 123345);
    
select livro.titulo, estilo.nome
	from livro, estilo
    where livro.id_estilo = estilo.id_estilo
    and estilo.nome = 'romance';
    
select livro.titulo, editora.nome
	from livro, editora
    where livro.id_editora = editora.id_editora
    and editora.nome = 'globo';

select livro.titulo, editora.nome, autor.nome 
	from livro, editora, autor
    where livro.id_editora = editora.id_editora
    and livro.id_autor = autor.id_autor;
    
