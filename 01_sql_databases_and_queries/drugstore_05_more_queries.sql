# Consulta complexa

-- Compras
SELECT * FROM compras;

SELECT com.id AS "ID Compra", cli.nome AS "Cliente", com.data AS "Data Compra"
FROM compras AS com, clientes AS cli
WHERE com.id_cliente = cli.id;

SELECT * FROM produtos_compra;

SELECT proc.id AS "Produto Compra",
	com.id AS "Compra",
	prod.produto AS "Produto",
	prod.preco_venda AS "Preço",
	proc.quantidade AS "Quantidade",
    (prod.preco_venda * proc.quantidade) AS "Total Produto Compra"
FROM produtos_compra AS proc, produtos AS prod, compras AS com
WHERE com.id = proc.id_compra AND prod.id = proc.id_produto;

SELECT com.id AS "Venda",
    com.data AS "Data da Compra",
	cli.nome AS "Cliente",
    SUM(prod.preco_venda * proc.quantidade) AS "Total"
FROM produtos_compra AS proc, produtos AS prod, compras AS com, clientes AS cli
WHERE com.id = proc.id_compra AND prod.id = proc.id_produto AND cli.id = com.id_cliente
GROUP BY com.id;

