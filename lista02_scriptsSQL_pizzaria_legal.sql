-- CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;
USE db_pizzaria_legal;

-- CRIAÇÃO DAS TABELAS
CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao_categoria TEXT,
    PRIMARY KEY(id_categoria)
);

CREATE TABLE tb_pizzas (
    id_pizza BIGINT AUTO_INCREMENT,
    nome_pizza VARCHAR(150) NOT NULL,
    tamanho_pizza VARCHAR(50),
    preco_pizza DECIMAL(10,2),
    tempo_preparo INT,
    id_categoria BIGINT,
    PRIMARY KEY(id_pizza),
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- INSERÇÕES NAS TABELAS
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Salgada', 'Pizzas com recheios salgados tradicionais'),
('Doce', 'Pizzas com recheios doces, sobremesas'),
('Vegetariana', 'Pizzas sem carne, com vegetais e queijos'),
('Especial', 'Pizzas gourmet ou especiais da casa'),
('Calabresa', 'Pizzas com sabor calabresa');

INSERT INTO tb_pizzas (nome_pizza, tamanho_pizza, preco_pizza, tempo_preparo, id_categoria) VALUES
('Margherita', 'Médio', 40.00, 25, 3),
('Calabresa', 'Grande', 55.00, 30, 5),
('Chocolate', 'Pequeno', 35.00, 20, 2),
('Portuguesa', 'Grande', 60.00, 35, 1),
('Frango com Catupiry', 'Médio', 50.00, 28, 1),
('Romeu e Julieta', 'Pequeno', 42.00, 22, 2),
('Quatro Queijos', 'Grande', 65.00, 33, 4),
('Palmito', 'Médio', 48.00, 27, 3);

/* SELEÇÕES DA LISTA */

-- RETORNA AS PIZZAS COM PREÇO MAIOR QUE R$ 45,00
SELECT * FROM tb_pizzas
WHERE preco_pizza > 45.00;

-- RETORNA AS PIZZAS COM PREÇO ENTRE R$ 50,00 E R$ 100,00
SELECT * FROM tb_pizzas
WHERE preco_pizza BETWEEN 50.00 AND 100.00;

-- RETORNA AS PIZZAS COM A LETRA 'M' NO NOME
SELECT * FROM tb_pizzas
WHERE nome_pizza LIKE '%M%';

-- INNER JOIN ENTRE TB_PIZZAS E TB_CATEGORIAS
SELECT p.*, c.nome_categoria, c.descricao_categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

-- INNER JOIN FILTRANDO APENAS PIZZAS DA CATEGORIA 'DOCE'
SELECT p.*, c.nome_categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Doce';
