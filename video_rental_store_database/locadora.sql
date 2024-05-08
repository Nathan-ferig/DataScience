-- CREATE DATABASE locadora

CREATE TABLE "generos" (
  "id" serial PRIMARY KEY,
  "genero" varchar(50) NOT NULL
);

CREATE TABLE "filmes" (
  "id" serial PRIMARY KEY,
  "titulo" varchar(100) NOT NULL,
  "id_genero" int NOT NULL,
  "valor" decimal(8,2) NOT NULL
);

CREATE TABLE "dvds" (
  "id" serial PRIMARY KEY,
  "id_filme" int NOT NULL,
  "num_dvd" int NOT NULL
);

CREATE TABLE "atores" (
  "id" serial PRIMARY KEY,
  "nome" varchar(100) NOT NULL
);

CREATE TABLE "atores_filme" (
  "id" serial PRIMARY KEY,
  "id_filme" int NOT NULL,
  "id_ator" int NOT NULL,
  "personagem" varchar(100) NOT NULL
);

CREATE TABLE "clientes" (
  "id" serial PRIMARY KEY,
  "nome" varchar(50) NOT NULL,
  "sobrenome" varchar(50) NOT NULL,
  "telefone" varchar(20) NOT NULL,
  "endereco" varchar(100) NOT NULL
);

CREATE TABLE "emprestimos" (
  "id" serial PRIMARY KEY,
  "data" date NOT NULL,
  "id_cliente" int NOT NULL,
  "foi_pago" boolean NOT NULL
);

CREATE TABLE "filmes_emprestimo" (
  "id" serial PRIMARY KEY,
  "id_emprestimo" int NOT NULL,
  "id_dvd" int NOT NULL
);

CREATE TABLE "devolucao" (
  "id" serial PRIMARY KEY,
  "id_emprestimo" int NOT NULL,
  "data" date NOT NULL
);

CREATE TABLE "filmes_devolucao" (
  "id" serial PRIMARY KEY,
  "id_devolucao" int NOT NULL,
  "id_filme_emprestimo" int NOT NULL,
  "status_dvd" boolean NOT NULL
);

ALTER TABLE "filmes" ADD FOREIGN KEY ("id_genero") REFERENCES "generos" ("id");

ALTER TABLE "dvds" ADD FOREIGN KEY ("id_filme") REFERENCES "filmes" ("id");

ALTER TABLE "atores_filme" ADD FOREIGN KEY ("id_filme") REFERENCES "filmes" ("id");

ALTER TABLE "atores_filme" ADD FOREIGN KEY ("id_ator") REFERENCES "atores" ("id");

ALTER TABLE "emprestimos" ADD FOREIGN KEY ("id_cliente") REFERENCES "clientes" ("id");

ALTER TABLE "filmes_emprestimo" ADD FOREIGN KEY ("id_emprestimo") REFERENCES "emprestimos" ("id");

ALTER TABLE "filmes_emprestimo" ADD FOREIGN KEY ("id_dvd") REFERENCES "dvds" ("id");

ALTER TABLE "devolucao" ADD FOREIGN KEY ("id_emprestimo") REFERENCES "emprestimos" ("id");

ALTER TABLE "filmes_devolucao" ADD FOREIGN KEY ("id_devolucao") REFERENCES "devolucao" ("id");

ALTER TABLE "filmes_devolucao" ADD FOREIGN KEY ("id_filme_emprestimo") REFERENCES "filmes_emprestimo" ("id");
