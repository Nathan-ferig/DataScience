-- Select Simples -- 
/*
SELECT * FROM atores;
SELECT * FROM clientes;
SELECT * FROM filmes;
SELECT * FROM generos;
*/

-- Junção de produt cartesiano --
/*
SELECT f.id, f.titulo, g.genero, f.valor 
	FROM filmes AS f, generos AS g
	WHERE f.id_genero = g.id;

SELECT * FROM atores_filme;
SELECT af.id AS codigo, f.titulo AS filme, a.nome AS ator, af.personagem
	FROM atores_filme AS af, atores AS a, filmes AS f
	WHERE af.id_filme = f.id AND af.id_ator = a.id;
*/

-- Filtros --
/*
SELECT * FROM generos WHERE id = 2;
SELECT * FROM generos WHERE genero = 'Drama';
*/

-- Funções de agregação --
/*
SELECT SUM(valor) FROM filmes;
SELECT MAX(valor) FROM filmes;
SELECT MIN(valor) FROM filmes;
*/

-- Subconsultas --
/*
SELECT * FROM filmes WHERE valor IN ( SELECT MAX(valor) FROM filmes);
SELECT * FROM filmes WHERE valor IN ( SELECT MIN(valor) FROM filmes);
*/

-- União de consultas
/*
SELECT * FROM filmes WHERE valor IN ( SELECT MAX(valor) FROM filmes)
UNION
SELECT * FROM filmes WHERE valor IN ( SELECT MIN(valor) FROM filmes);
*/

-- Encontrando filmes de determinado ator
/*
Select f.titulo, g.genero, af.personagem
	FROM atores_filme AS af, filmes AS f, generos AS g, atores AS a
	WHERE f.id = af.id_filme AND g.id = f.id_genero AND a.id = af.id_ator
	AND a.nome = 'Brad Pitt'

Select f.titulo, a.nome, af.personagem
	FROM atores_filme AS af, filmes AS f, generos AS g, atores AS a
	WHERE f.id = af.id_filme AND g.id = f.id_genero AND a.id = af.id_ator
	AND g.genero = 'Ficção Científica'
*/

-- Verificar qual cliente alugou qual filme
SELECT e.id,
	c.nome || ' ' || c.sobrenome AS cliente,
	e.data, f.titulo, g.genero
	FROM emprestimos AS e, clientes AS c, filmes AS f, generos AS g, dvds AS d, filmes_emprestimo AS fe
	WHERE fe.id_emprestimo = e.id AND e.id_cliente = c.id AND f.id = d.id_filme
	AND fe.id_dvd = d.id AND f.id_genero = g.id;

-- Verificar se os clientes devolveram os dvds
SELECT de.id,
	c.nome || ' ' || c.sobrenome AS cliente,
	e.data AS data_emprestimo,
	de.data AS data_devolução,  
	f.titulo, g.genero, fd.status_dvd, e.foi_pago
	FROM devolucao AS de, clientes AS c, filmes As f, filmes_devolucao AS fd, dvds AS d,
	emprestimos AS e, filmes_emprestimo AS fe, generos AS g
	WHERE fd.id_filme_emprestimo = fe.id AND fd.id_devolucao = de.id AND de.id_emprestimo = e.id
	AND e.id_cliente = c.id AND fe.id_dvd = d.id AND f.id_genero = g.id AND d.id_filme = f.id;

-- Verificar quanto cada cliente pagou
SELECT e.id,
	c.nome || ' ' || c.sobrenome AS cliente,
	SUM(valor)
	FROM filmes_devolucao AS fd, clientes AS c, dvds AS d, filmes AS f, devolucao AS de,
	emprestimos AS e, filmes_emprestimo AS fe
	WHERE fd.id_filme_emprestimo = fe.id AND fd.id_devolucao = de.id AND de.id_emprestimo = e.id
	AND e.id_cliente = c.id AND fe.id_dvd = d.id AND d.id_filme = f.id
	GROUP BY e.id, cliente
	ORDER BY e.id ASC;