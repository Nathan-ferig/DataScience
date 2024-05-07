# Atualizando dados

SELECT * FROM tipos_produtos;
INSERT INTO tipos_produtos (tipo) VALUES ('Outros');

UPDATE tipos_produtos SET tipo = "Bijuterias" WHERE id = 4;

DELETE FROM tipos_produtos WHERE id = 5;