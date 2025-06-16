CREATE DATABASE db_recursoshumanos;

USE db_quitanda;

CREATE TABLE tb_colaborador(
id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    datanascimento DATE NOT NULL,
    cargo VARCHAR(255) NOT NULL,
    salario DECIMAL(19,2) NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO tb_colaborador (nome, cpf, datanascimento, cargo, salario) VALUES
('João Silva', '123.456.789-01', '1990-05-15', 'Desenvolvedor Full Stack', 7500.00),
('Maria Oliveira', '234.567.890-12', '1992-08-22', 'Analista de RH', 5200.50),
('Carlos Pereira', '345.678.901-23', '1985-11-30', 'Gerente de Projetos', 12000.00),
('Ana Costa', '456.789.012-34', '1998-02-10', 'Designer UX/UI', 6800.75),
('Rafael Souza', '567.890.123-45', '1995-07-18', 'Engenheiro de Dados', 8900.00),
('Fernanda Martins', '678.901.234-56', '2000-01-05', 'Estagiária de Marketing', 1800.00);

-- Seleciona todos os colaboradores cujo salário é MAIOR do que 2000.00
SELECT * FROM tb_colaborador WHERE salario > 2000.00;

-- Seleciona todos os colaboradores cujo salário é MENOR do que 2000.00
SELECT * FROM tb_colaborador WHERE salario < 2000.00;

-- Atualiza o salário de um colaborador específico
-- Neste exemplo, o salário do colaborador com id = 1 (João Silva) será alterado para 8000.00
UPDATE tb_colaborador SET salario = 8000.00 WHERE id = 1;
