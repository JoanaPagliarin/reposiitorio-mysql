-- EX 01
select l.titulo, e.nome, es.nome, a.nome from livro l
inner join editora e on l.id_editora = e.id_editora
join livro_autor la on la.id_livro = l.id_livro
join autor a on la.id_autor = a.id_autor
inner join livro_estilo le on le.id_livro = l.id_livro
inner join estilo es on le.id_estilo = es.id_estilo;

-- EX 02
select l.titulo, e.nome from livro l
join editora e on l.id_editora = e.id_editora and e.telefone = 123345;

-- EX 03
select l.titulo, a.nome from livro l
join livro_autor la on la.id_livro = l.id_livro
join autor a on la.id_autor = a.id_autor
and a.idade = 35;

-- EX 04
select l.titulo, a.nome, e.nome from livro l
join editora e on l.id_editora = e.id_editora
join livro_autor la on la.id_livro = l.id_livro
join autor a on la.id_autor = a.id_autor 
and a.nome = 'dan brown';

-- EX 05
select l.titulo, a.nome, e.nome from livro l
join editora e on l.id_editora = e.id_editora
join livro_autor la on la.id_livro = l.id_livro
join autor a on la.id_autor = a.id_autor 
and a.nome = 'dan brown' and a.idade = 35;

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
select l.titulo, MAX(l.valor) from livro l;

-- EX 10
select l.titulo, MIN(l.valor) from livro l;

-- EX 11
select AVG(valor) as media_valor from livro;

-- EX 12
select avg(valor_hr) as media_valor_hr from autor;

-- EX 13 
select count(distinct id_livro) as 'quantidade de livros' from livro;

-- EX 14 
select count(distinct id_livro) as 'livro com editora = 2' from livro where id_editora = 2; 

-- EX 15
select count(distinct id_livro) as 'livro com estilo = 5' from livro_estilo where id_estilo = 5; 

-- EX 16
select l.titulo, e.nome from livro l
join editora e on l.id_editora = e.id_editora;

-- EX 17 com WHERE
select l.titulo, e.nome from livro l, editora e 
where nome like 'A%' and l.id_editora = e.id_editora;

-- EX 17 com JOIN
select l.titulo, e.nome from livro l
join editora e on l.id_editora = e.id_editora
and nome like 'A%' and l.id_editora = e.id_editora;

-- EX 18 com WHERE
select a.nome from autor a
where a.id_autor not in (select id_autor from livro_autor);
 
-- EX 18 com JOIN
select a.nome from autor a
left join livro_autor la on a.id_autor = la.id_autor
where la.id_autor is null; 

-- EX 19 com WHERE
select e.nome from editora e
where e.id_editora not in (select id_editora from livro);

-- EX 19 com JOIN 
select e.nome from editora e
left join livro l on e.id_editora = l.id_editora
where l.id_editora is null;

-- EX 20 com WHERE
select e.nome from estilo e
where e.id_estilo not in (select id_estilo from livro_estilo);

-- EX 20 com JOIN
select e.nome from estilo e
left join livro_estilo le on e.id_estilo = le.id_estilo
where le.id_estilo is null; 

-- EX 21 
select a.nome, count(la.id_autor) from autor a
join livro_autor la on la.id_autor = a.id_autor 
join livro l on la.id_livro = l.id_livro
group by a.id_autor;

-- EX 22 
select e.nome as 'nome editora', count(l.id_editora) as 'qntdd livro/editora' from editora e
join livro l on l.id_editora = e.id_editora
group by e.id_editora; 

-- EX 23 
select e.nome as "estilo", count(le.id_estilo) as 'qntdd livro/estilo' from estilo e
join livro_estilo le on le.id_estilo = e.id_estilo
join livro l on le.id_livro = l.id_livro
group by e.id_estilo;

-- EX 24 
select count(l.id_editora) as 'qntdd livro/CCCC' from editora e
join livro l on l.id_editora = e.id_editora
where e.nome = 'CCCC'
group by e.id_editora; 

-- EX 25 
select a.nome as 'autor', count(la.id_autor) as 'qntdd livro/J R R Tolkien' from autor a
join livro_autor la on la.id_autor = a.id_autor
join livro l on la.id_livro = l.id_livro 
where a.nome = 'J R R Tolkien'
group by a.id_autor;
