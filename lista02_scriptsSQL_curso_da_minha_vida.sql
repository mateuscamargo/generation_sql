-- CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

-- CRIAÇÃO DAS TABELAS
CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao_categoria TEXT,
    PRIMARY KEY(id_categoria)
);

CREATE TABLE tb_cursos (
    id_curso BIGINT AUTO_INCREMENT,
    nome_curso VARCHAR(150) NOT NULL,
    cargahoraria_curso INT,
    valor_curso DECIMAL(10,2),
    plataforma_curso VARCHAR(100),
    id_categoria BIGINT,
    PRIMARY KEY(id_curso),
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- INSERÇÕES NAS TABELAS
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Programação', 'Cursos voltados ao desenvolvimento de software'),
('Design', 'Cursos de design gráfico e UI/UX'),
('Marketing Digital', 'Estratégias de vendas e posicionamento online'),
('Negócios', 'Gestão, finanças e empreendedorismo'),
('Idiomas', 'Cursos para aprendizagem de idiomas estrangeiros');

INSERT INTO tb_cursos (nome_curso, cargahoraria_curso, valor_curso, plataforma_curso, id_categoria) VALUES
('Java para Iniciantes', 40, 650.00, 'Udemy', 1),
('Design Gráfico com Photoshop', 30, 480.00, 'Alura', 2),
('Marketing de Conteúdo', 25, 550.00, 'Hotmart', 3),
('Empreendedorismo Digital', 50, 999.90, 'Udemy', 4),
('Inglês para Viagens', 20, 400.00, 'Coursera', 5),
('JavaScript Avançado', 60, 1050.00, 'Alura', 1),
('Branding e Identidade Visual', 35, 720.00, 'Hotmart', 2),
('Gestão de Equipes', 45, 870.00, 'Udemy', 4);

/* SELEÇÕES DA LISTA */

-- RETORNA OS CURSOS COM VALOR MAIOR QUE R$ 500,00
SELECT * FROM tb_cursos
WHERE valor_curso > 500.00;

-- RETORNA OS CURSOS COM VALOR ENTRE R$ 600,00 E R$ 1000,00
SELECT * FROM tb_cursos
WHERE valor_curso BETWEEN 600.00 AND 1000.00;

-- RETORNA OS CURSOS COM A LETRA 'J' NO NOME
SELECT * FROM tb_cursos
WHERE nome_curso LIKE '%J%';

-- INNER JOIN ENTRE TB_CURSOS E TB_CATEGORIAS
SELECT c.*, cat.nome_categoria, cat.descricao_categoria
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id_categoria;
