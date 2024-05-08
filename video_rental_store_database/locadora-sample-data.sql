-- SELECT * FROM Generos;

-- Atores
-- INSERT INTO atores (nome) VALUES ('Brad Pitt');
-- INSERT INTO atores (nome) VALUES ('Angelina Jolie');
-- INSERT INTO atores (nome) VALUES ('Felicity Jones');
-- INSERT INTO atores (nome) VALUES ('Dwayne Johnson');

-- UPDATE atores SET id = 1 WHERE nome = 'Brad Pitt';
-- UPDATE atores SET id = 2 WHERE nome = 'Angelina Jolie';
-- UPDATE atores SET id = 3 WHERE nome = 'Felicity Jones';
-- UPDATE atores SET id = 4 WHERE nome = 'Dwayne Johnson';

-- Generos
-- INSERT INTO generos (genero) VALUES ('Ação');
-- INSERT INTO generos (genero) VALUES ('Drama');
-- INSERT INTO generos (genero) VALUES ('Ficção Científica');

-- UPDATE generos SET id = 1 WHERE genero = 'Ação';
-- UPDATE generos SET id = 2 WHERE genero = 'Drama';
-- UPDATE generos SET id = 3 WHERE genero = 'Ficção Científica';

-- Filmes
-- INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Clube da Luta', 2, 9.99);
-- INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Tomb Raider', 1, 8.99);
-- INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Star Wars', 3, 12.99);
-- INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Jumanji', 1, 8.99);

-- UPDATE filmes SET id = 1 WHERE titulo = 'Clube da Luta';
-- UPDATE filmes SET id = 2 WHERE titulo = 'Tomb Raider';
-- UPDATE filmes SET id = 3 WHERE titulo = 'Star Wars';
-- UPDATE filmes SET id = 4 WHERE titulo = 'Jumanji';

-- Dvds
-- INSERT INTO dvds (id_filme, num_dvd) VALUES (1, 2);
-- INSERT INTO dvds (id_filme, num_dvd) VALUES (2, 1);
-- INSERT INTO dvds (id_filme, num_dvd) VALUES (3, 2);
-- INSERT INTO dvds (id_filme, num_dvd) VALUES (4, 1);

-- UPDATE dvds SET id = 1 WHERE id_filme = 1;
-- UPDATE dvds SET id = 2 WHERE id_filme = 2;
-- UPDATE dvds SET id = 3 WHERE id_filme = 3;
-- UPDATE dvds SET id = 4 WHERE id_filme = 4;

-- Atores Filme
-- INSERT INTO atores_filme (id_filme, id_ator, personagem) VALUES (1, 1, 'Tyler Durden');
-- INSERT INTO atores_filme (id_filme, id_ator, personagem) VALUES (2, 2, 'Lara Croft');
-- INSERT INTO atores_filme (id_filme, id_ator, personagem) VALUES (3, 3, 'Jyn Erso');
-- INSERT INTO atores_filme (id_filme, id_ator, personagem) VALUES (4, 4, 'Spencer');

-- UPDATE atores_filme SET id = 1 WHERE id_filme = 1;
-- UPDATE atores_filme SET id = 2 WHERE id_filme = 2;
-- UPDATE atores_filme SET id = 3 WHERE id_filme = 3;
-- UPDATE atores_filme SET id = 4 WHERE id_filme = 4;

-- Clientes
-- INSERT INTO clientes (nome, sobrenome, telefone, endereco) VALUES ('Pedro', 'Silva', '2344-3344', 'Rua 1, 34');
-- INSERT INTO clientes (nome, sobrenome, telefone, endereco) VALUES ('Paula', 'Diniz', '4544-3345', 'Rua 2, 35');
-- INSERT INTO clientes (nome, sobrenome, telefone, endereco) VALUES ('Silvana', 'Souza', '6744-3346', 'Rua 3, 36');
-- INSERT INTO clientes (nome, sobrenome, telefone, endereco) VALUES ('João', 'Tavares', '4567-3347', 'Rua 4, 37');

-- Emprestimos
-- INSERT INTO emprestimos (data, id_cliente, foi_pago) VALUES ('2019-03-01', 1, True);
-- INSERT INTO emprestimos (data, id_cliente, foi_pago) VALUES ('2019-03-02', 2, False);
-- INSERT INTO emprestimos (data, id_cliente, foi_pago) VALUES ('2019-03-03', 3, False);
-- INSERT INTO emprestimos (data, id_cliente, foi_pago) VALUES ('2019-03-04', 4, True);

-- Filmes Emprestimo
-- INSERT INTO filmes_emprestimo (id_emprestimo, id_dvd) VALUES (1, 3);
-- INSERT INTO filmes_emprestimo (id_emprestimo, id_dvd) VALUES (1, 4);
-- INSERT INTO filmes_emprestimo (id_emprestimo, id_dvd) VALUES (2, 1);
-- INSERT INTO filmes_emprestimo (id_emprestimo, id_dvd) VALUES (3, 2);
-- INSERT INTO filmes_emprestimo (id_emprestimo, id_dvd) VALUES (3, 4);
-- INSERT INTO filmes_emprestimo (id_emprestimo, id_dvd) VALUES (4, 3);

-- Devolucoes
-- INSERT INTO devolucao (id_emprestimo, data) VALUES (1, '2019-03-08');
-- INSERT INTO devolucao (id_emprestimo, data) VALUES (2, '2019-03-08');
-- INSERT INTO devolucao (id_emprestimo, data) VALUES (3, '2019-03-10');
-- INSERT INTO devolucao (id_emprestimo, data) VALUES (4, '2019-03-10');

-- Filmes Devolucao
-- INSERT INTO filmes_devolucao (id_devolucao, id_filme_emprestimo, status_dvd) VALUES (1, 3, True);
-- INSERT INTO filmes_devolucao (id_devolucao, id_filme_emprestimo, status_dvd) VALUES (2, 4, True);
-- INSERT INTO filmes_devolucao (id_devolucao, id_filme_emprestimo, status_dvd) VALUES (3, 1, True);
-- INSERT INTO filmes_devolucao (id_devolucao, id_filme_emprestimo, status_dvd) VALUES (4, 2, True);
-- INSERT INTO filmes_devolucao (id_devolucao, id_filme_emprestimo, status_dvd) VALUES (1, 4, True);
-- INSERT INTO filmes_devolucao (id_devolucao, id_filme_emprestimo, status_dvd) VALUES (4, 2, True);

-- UPDATE filmes_devolucao SET id = 1 WHERE id_devolucao = 1 AND id_filme_emprestimo = 1;
-- UPDATE filmes_devolucao SET id = 2 WHERE id_devolucao = 1 AND id_filme_emprestimo = 2;
-- UPDATE filmes_devolucao SET id = 3 WHERE id_devolucao = 2 AND id_filme_emprestimo = 3;
-- UPDATE filmes_devolucao SET id = 4 WHERE id_devolucao = 3 AND id_filme_emprestimo = 4;
-- UPDATE filmes_devolucao SET id = 5 WHERE id_devolucao = 3 AND id_filme_emprestimo = 5;
-- UPDATE filmes_devolucao SET id = 6 WHERE id_devolucao = 4 AND id_filme_emprestimo = 6;