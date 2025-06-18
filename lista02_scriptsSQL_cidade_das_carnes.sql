-- CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS db_cidade_das_carnes;
USE db_cidade_das_carnes;

-- CRIAÇÃO DAS TABELAS
CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao_categoria TEXT,
    PRIMARY KEY(id_categoria)
);

CREATE TABLE tb_produtos (
    id_produto BIGINT AUTO_INCREMENT,
    nome_produto VARCHAR(150) NOT NULL,
    peso_produto DECIMAL(7,3),
    preco_produto DECIMAL(10,2),
    validade_produto DATE,
    id_categoria BIGINT,
    PRIMARY KEY(id_produto),
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- INSERÇÕES NAS TABELAS
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Carnes Bovinas', 'Produtos derivados da carne bovina'),
('Carnes Suínas', 'Produtos derivados da carne suína'),
('Aves', 'Produtos derivados de frango, peru, etc.'),
('Peixes', 'Produtos derivados do peixe'),
('Embutidos', 'Linguiças, salsichas e outros embutidos');

INSERT INTO tb_produtos (nome_produto, peso_produto, preco_produto, validade_produto, id_categoria) VALUES
('Filé Mignon', 1.200, 85.90, '2025-07-10', 1),
('Picanha', 1.500, 120.50, '2025-07-12', 1),
('Costela Suína', 2.000, 60.00, '2025-07-08', 2),
('Coxa de Frango', 1.800, 40.00, '2025-07-05', 3),
('Salsicha Viena', 0.500, 25.00, '2025-08-01', 5),
('Peito de Frango', 1.000, 55.00, '2025-07-15', 3),
('Salmão Fresco', 0.900, 70.00, '2025-07-06', 4),
('Linguiça Toscana', 1.200, 45.00, '2025-07-20', 5);

/* SELEÇÕES DA LISTA */

-- RETORNA OS PRODUTOS COM PREÇO MAIOR QUE R$ 50,00
SELECT * FROM tb_produtos
WHERE preco_produto > 50.00;

-- RETORNA OS PRODUTOS COM PREÇO ENTRE R$ 50,00 E R$ 150,00
SELECT * FROM tb_produtos
WHERE preco_produto BETWEEN 50.00 AND 150.00;

-- RETORNA OS PRODUTOS COM A LETRA 'C' NO NOME
SELECT * FROM tb_produtos
WHERE nome_produto LIKE '%C%';

-- INNER JOIN ENTRE TB_PRODUTOS E TB_CATEGORIAS
SELECT p.*, c.nome_categoria, c.descricao_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

-- INNER JOIN FILTRANDO APENAS PRODUTOS DA CATEGORIA 'AVES'
SELECT p.*, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Aves';
