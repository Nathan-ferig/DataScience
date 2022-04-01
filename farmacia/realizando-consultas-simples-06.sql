# Realizando consultas simples

-- Tipos Produtos
SELECT * FROM tipos_produtos;
SELECT * FROM tipos_produtos ORDER BY id DESC;
SELECT * FROM tipos_produtos ORDER BY tipo DESC;

-- Produtos
SELECT * FROM produtos;

-- Produtos Compra
SELECT * FROM produtos_compra;
SELECT * FROM produtos_compra WHERE quantidade > 2;


-- Compras
SELECT * FROM compras;
SELECT * FROM compras ORDER BY data DESC;

-- Clientes
SELECT * FROM clientes;

-- Medicos
SELECT * FROM medicos;

-- Receitas Medica
SELECT * FROM receitas_medica;