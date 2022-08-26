-- EX 01
select l.titulo, e.nome, es.nome, a.nome from livro l
inner join editora e on l.id_editora = e.id_editora
inner join livro_estilo le on le.id_livro = l.id_livro
inner join estilo es on le.id_estilo = es.id_estilo
inner join livro_autor la on la.id_livro = l.id_livro
inner join autor a on la.id_autor = a.id_autor;

-- EX 02
select l.titulo, e.nome from livro l
join editora e on l.id_editora = e.id_editora and e.telefone = 123345;

-- EX 03
select l.titulo, a.nome from livro l
join livro_autor la on la.id_livro = l.id_livro
join autor a on la.id_autor = a.id_autor
join autor a on l.id_autor = a.id_autor and a.idade = 35;

-- EX 04
select l.titulo, a.nome, e.nome from livro l
join editora e on l.id_editora = e.id_editora
join livro_autor la on la.id_livro = l.id_livro
join autor a on la.id_autor = a.id_autor and a.nome = 'dan brown';

-- EX 05
select l.titulo, a.nome, e.nome from livro l
join editora e on l.id_editora = e.id_editora
join livro_autor la on la.id_livro = l.id_livro
join autor a on la.id_autor = a.id_autor and a.nome = 'dan brown' and a.idade = 35;

-- EX 06
select l.titulo, a.nome, e.nome from livro l
join editora e on l.id_editora = e.id_editora
join livro_autor la on la.id_livro = l.id_livro
join autor a on la.id_autor = a.id_autor
join livro_estilo le on le.id_livro = l.id_livro
join estilo es on le.id_estilo = es.id_estilo
and a.nome = 'dan brown' and e.telefone = 123345;

-- EX 07
select l.titulo, e.nome from livro l
join livro_estilo es on es.id_livro = l.id_livro
join estilo e on es.id_estilo = e.id_estilo
and e.nome = 'romance';

-- EX 08
select l.titulo, est.nome, e.nome from livro l
join editora e on e.id_editora = l.id_editora
join livro_estilo es on es.id_livro = l.id_livro
join estilo est on es.id_estilo = est.id_estilo
and e.nome = 'globo';

-- EX 09
select l.titulo, MIN(l.valor) from livro l;



