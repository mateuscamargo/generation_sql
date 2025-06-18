
-- CRIAÇÃO DA BASE DE DADOS
CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

-- CRIAÇÃO DA TABELAS
CREATE TABLE tb_classes (
	id_classe BIGINT AUTO_INCREMENT,
    nome_classe VARCHAR(255) NOT NULL,
    descricao_classe TEXT,
    PRIMARY KEY(id_classe)
);
CREATE TABLE tb_personagens (
	id_personagem BIGINT AUTO_INCREMENT,
    nome_personagem VARCHAR(100) NOT NULL,
    nivel_personagem INT DEFAULT 1,
    poderataque_personagem INT,
    poderdefesa_personagem INT,
    id_classe BIGINT,
    PRIMARY KEY(id_personagem),
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe)
);

-- INSERÇÕES NAS TABELAS
INSERT INTO tb_classes (nome_classe, descricao_classe) VALUES
('Guerreiro', 'Especialista em combate corpo a corpo'),
('Mago', 'Usa magias poderosas para atacar à distância'),
('Arqueiro', 'Perito em ataques rápidos e precisos de longa distância'),
('Cavaleiro', 'Alta defesa e uso de espadas pesadas'),
('Assassino', 'Ataques furtivos e velocidade extrema');

INSERT INTO tb_personagens (nome_personagem, nivel_personagem, poderataque_personagem, poderdefesa_personagem, id_classe) VALUES
('Arthur', 10, 2500, 1800, 1),
('Merlin', 12, 3000, 900, 2),
('Cassandra', 8, 2100, 1500, 3),
('Leon', 15, 1800, 2200, 4),
('Shadow', 20, 3200, 700, 5),
('Clarissa', 7, 1950, 1600, 3),
('Caelum', 11, 2050, 1200, 2),
('Brutus', 9, 1500, 1700, 1);

/* SELEÇÕES DA LISTA */

-- RETORNA OS PERSONAGENS COM PODER DE ATAQUE MAIOR QUE 2000
SELECT * FROM tb_personagens
WHERE poderataque_personagem > 2000;

-- RETORNA OS PERSONAGENS COM PODER DE DEFESA ENTRE 1000 E 2000
SELECT * FROM tb_personagens
WHERE poderdefesa_personagem BETWEEN 1000 AND 2000;

-- RETORNA OS PERSONAGENS COM A LETRA 'C' NO NOME
SELECT * FROM tb_personagens
WHERE nome_personagem LIKE '%C%';

-- INNER JOIN ENTRE TB_PERSONAGENS E TB_CLASSES
SELECT p.*, c.nome_classe, c.descricao_classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id_classe;

-- INNER JOIN FILTRANDO APENAS PERSONAGENS DA CLASSE 'ARQUEIRO'
SELECT p.*, c.nome_classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id_classe
WHERE c.nome_classe = 'Arqueiro';
