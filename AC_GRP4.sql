-- Gurpo 4
	-- integrantes 
      -- Eduardo Jacob - matricula : 202402824058
      -- Eduardo Andrade - matricula : 
      -- Guilherme de Moraes - matricula : 202401632473
      -- Felipe - matricula :



-- CRIAÇÃO DO SCHEMA
CREATE SCHEMA Loja_Grupo4;
USE Loja_Grupo4;



-- CRIAÇÃO DAS TABELAS

DROP TABLE IF EXISTS possui;
DROP TABLE IF EXISTS compra;
DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS fabricante;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS cliente;

CREATE TABLE cliente (
    codcliente INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    estado CHAR(2),
    genero VARCHAR(10),
    dt_nascimento DATE,
    estadocivil CHAR(1)
);

CREATE TABLE funcionario (
    cod_funcionario INT PRIMARY KEY,
    nome VARCHAR(100),
    genero VARCHAR(10),
    dtnascimento DATE,
    estadocivil CHAR(1),
    cidade VARCHAR(100),
    estado CHAR(2),
    cargo VARCHAR(50)
);

CREATE TABLE fabricante (
    cod_fabricante INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    site VARCHAR(100)
);

CREATE TABLE produto (
    cod_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    preco DECIMAL(10, 2),
    cod_fabricante INT,
    FOREIGN KEY (cod_fabricante) REFERENCES fabricante(cod_fabricante)
);

CREATE TABLE compra (
    cod_compra INT PRIMARY KEY,
    hora TIME,
    data DATE,
    codcliente INT,
    cod_funcionario INT,
    FOREIGN KEY (codcliente) REFERENCES cliente(codcliente),
    FOREIGN KEY (cod_funcionario) REFERENCES funcionario(cod_funcionario)
);

-- Tabela compra_produto se refere ao relacionamento "possui" no diagrama
CREATE TABLE compra_produto (
    cod_compra INT,
    cod_produto INT,
    qtd INT,
    valor_desconto DECIMAL(10, 2),
    PRIMARY KEY (cod_compra, cod_produto),
    FOREIGN KEY (cod_compra) REFERENCES compra(cod_compra),
    FOREIGN KEY (cod_produto) REFERENCES produto(cod_produto)
);

  -- INSERIR DADOS NAS TABELAS
  
INSERT INTO cliente (codcliente, nome, cidade, estado, genero, dt_nascimento, estadocivil) VALUES
(1, 'Maria Silva', 'São Paulo', 'SP', 'Feminino', '1985-06-17', 'C'),
(2, 'João Pereira', 'Porto Alegre', 'RS', 'Masculino', '1990-09-25', 'S'),
(3, 'Ana Lima', 'Niterói', 'RJ', 'Feminino', '1988-02-10', 'D'),
(4, 'Carlos Souza', 'Curitiba', 'PR', 'Masculino', '1992-12-15', 'V'),
(5, 'Lúcia Fernandes', 'Florianópolis', 'SC', 'Feminino', '1980-03-05', 'C'),
(6, 'Roberto Costa', 'Rio de Janeiro', 'RJ', 'Masculino', '1984-07-07', 'S'),
(7, 'Beatriz Gomes', 'Belo Horizonte', 'MG', 'Feminino', '1978-01-21', 'C'),
(8, 'Guilherme Almeida', 'São Luís', 'MA', 'Masculino', '1995-06-30', 'S'),
(9, 'Sofia Vieira', 'Vitória', 'ES', 'Feminino', '1991-05-20', 'D'),
(10, 'Lucas Barbosa', 'Manaus', 'AM', 'Masculino', '1999-11-19', 'S'),
(11, 'Viviane Mendes', 'Recife', 'PE', 'Feminino', '1986-10-09', 'V'),
(12, 'Paulo Andrade', 'Salvador', 'BA', 'Masculino', '1994-08-15', 'C'),
(13, 'Jessica Moura', 'Fortaleza', 'CE', 'Feminino', '1983-12-13', 'S'),
(14, 'Eduardo Sá', 'Brasília', 'DF', 'Masculino', '1987-01-02', 'C'),
(15, 'Fernanda Rocha', 'São Paulo', 'SP', 'Feminino', '1993-04-25', 'D'),
(16, 'Renato Borges', 'Campinas', 'SP', 'Masculino', '1981-08-12', 'C'),
(17, 'Larissa Neves', 'Belém', 'PA', 'Feminino', '1996-11-02', 'S'),
(18, 'Bruno Tavares', 'João Pessoa', 'PB', 'Masculino', '1989-04-18', 'D'),
(19, 'Camila Faria', 'Natal', 'RN', 'Feminino', '1992-06-07', 'S'),
(20, 'Felipe Martins', 'Aracaju', 'SE', 'Masculino', '1986-01-29', 'C');

INSERT INTO funcionario (cod_funcionario, nome, genero, dtnascimento, estadocivil, cidade, estado, cargo) VALUES
(1, 'Carlos Augusto', 'Masculino', '1980-02-22', 'C', 'Rio de Janeiro', 'RJ', 'Gerente'),
(2, 'Marcela Dias', 'Feminino', '1995-12-12', 'S', 'São Paulo', 'SP', 'Vendedora'),
(3, 'Rafael Oliveira', 'Masculino', '1982-06-03', 'V', 'Curitiba', 'PR', 'Supervisor'),
(4, 'Tatiana Melo', 'Feminino', '1990-11-23', 'S', 'Porto Alegre', 'RS', 'Assistente'),
(5, 'Alberto Lima', 'Masculino', '1988-05-15', 'S', 'Fortaleza', 'CE', 'Analista'),
(6, 'Claudia Santos', 'Feminino', '1985-07-27', 'C', 'Recife', 'PE', 'Coordenadora'),
(7, 'Igor Rocha', 'Masculino', '1993-03-19', 'D', 'Salvador', 'BA', 'Técnico'),
(8, 'Helena Cruz', 'Feminino', '1991-09-14', 'S', 'Belo Horizonte', 'MG', 'Analista'),
(9, 'Rodrigo Pires', 'Masculino', '1983-03-03', 'C', 'Maceió', 'AL', 'Técnico'),
(10, 'Luciana Prado', 'Feminino', '1987-12-22', 'D', 'São Luís', 'MA', 'Assistente');

INSERT INTO fabricante (cod_fabricante, nome, email, site) VALUES
(1, 'Tech Corp', 'contato@techcorp.com', 'http://www.techcorp.com'),
(2, 'Inova Ltda', 'vendas@inovaltda.com', 'http://www.inovaltda.com'),
(3, 'Fabrica ABC', 'info@fabricaabc.com', 'http://www.fabricaabc.com'),
(4, 'GigaTech', 'suporte@gigatech.com', 'http://www.gigatech.com'),
(5, 'Eletronix', 'contato@eletronix.com', 'http://www.eletronix.com'),
(6, 'Digital World', 'contato@digitalworld.com', 'http://www.digitalworld.com'),
(7, 'MaxTech', 'atendimento@maxtech.com', 'http://www.maxtech.com');

INSERT INTO produto (cod_produto, nome, descricao, preco, cod_fabricante) VALUES
(1, 'Notebook X', 'Notebook com 16GB RAM', 4500.00, 1),
(2, 'Smartphone Y', 'Smartphone com 128GB de memória', 2300.00, 2),
(3, 'Tablet Z', 'Tablet 10 polegadas', 1200.00, 3),
(4, 'Monitor 4K', 'Monitor 27 polegadas 4K', 1500.00, 1),
(5, 'Impressora', 'Impressora multifuncional', 600.00, 4),
(6, 'Câmera Digital', 'Câmera de 20MP', 1700.00, 5),
(7, 'Teclado Mecânico', 'Teclado mecânico RGB', 350.00, 3),
(8, 'Mouse Wireless', 'Mouse sem fio', 150.00, 1),
(9, 'Projetor', 'Projetor HD', 2900.00, 2),
(10, 'Fone Bluetooth', 'Fone de ouvido Bluetooth', 250.00, 4),
(11, 'Webcam HD', 'Webcam com microfone embutido', 300.00, 6),
(12, 'Hub USB', 'Hub com 4 portas USB 3.0', 120.00, 7),
(13, 'SSD 1TB', 'SSD de 1TB velocidade alta', 650.00, 6),
(14, 'Placa de Vídeo', 'GPU de última geração', 2500.00, 7),
(15, 'Fonte 600W', 'Fonte para PC 600W', 400.00, 6);

INSERT INTO compra (cod_compra, hora, data, codcliente, cod_funcionario) VALUES
(1, '10:00', '2024-01-15', 1, 1),
(2, '11:20', '2024-02-10', 2, 2),
(3, '14:30', '2024-03-05', 3, 3),
(4, '09:00', '2024-04-12', 4, 4),
(5, '16:45', '2024-05-20', 5, 5),
(6, '13:15', '2024-03-11', 6, 6),
(7, '15:50', '2025-01-23', 7, 7),
(8, '08:40', '2025-03-16', 8, 1),
(9, '12:35', '2025-03-21', 9, 2),
(10, '17:25', '2025-02-25', 10, 3),
(11, '09:30', '2025-03-05', 11, 4),
(12, '15:00', '2025-01-31', 12, 4),
(13, '10:10', '2025-04-01', 13, 5),
(14, '14:45', '2025-04-15', 14, 6),
(15, '11:20', '2025-05-21', 15, 7),
(16, '09:00', '2025-03-22', 1, 1),
(17, '10:30', '2025-02-10', 2, 2),
(18, '16:50', '2025-02-18', 3, 3),
(19, '13:40', '2025-03-12', 4, 4),
(20, '15:25', '2025-04-05', 5, 5),
(21, '14:00', '2025-05-30', 6, 6),
(22, '11:15', '2025-05-10', 7, 7),
(23, '12:55', '2025-04-29', 8, 1),
(24, '11:40', '2025-05-15', 9, 2),
(25, '10:05', '2025-05-25', 10, 3),
(26, '14:10', '2025-05-10', 16, 8),
(27, '16:40', '2025-05-11', 17, 9),
(28, '10:20', '2025-05-12', 18, 10),
(29, '12:15', '2025-05-13', 19, 1),
(30, '09:55', '2025-05-14', 20, 2);


INSERT INTO compra_produto (cod_compra, cod_produto, qtd, valor_desconto) VALUES
(1, 1, 2, 50.00),
(1, 2, 1, 0.00),
(2, 3, 1, 20.00),
(3, 4, 3, 10.00),
(4, 5, 1, 5.00),
(5, 6, 1, 15.00),
(6, 7, 4, 0.00),
(7, 8, 2, 10.00),
(8, 9, 1, 25.00),
(9, 10, 3, 0.00),
(10, 1, 2, 30.00),
(11, 2, 1, 5.00),
(12, 3, 3, 0.00),
(13, 4, 1, 20.00),
(14, 5, 1, 10.00),
(15, 6, 2, 15.00),
(16, 7, 3, 0.00),
(17, 8, 1, 20.00),
(18, 9, 1, 5.00),
(19, 10, 2, 0.00),
(20, 1, 4, 25.00),
(21, 2, 3, 10.00),
(22, 3, 1, 0.00),
(23, 4, 2, 10.00),
(24, 5, 1, 5.00),
(25, 6, 2, 20.00),
(26, 11, 2, 10.00),
(26, 12, 1, 0.00),
(27, 13, 1, 50.00),
(28, 14, 1, 100.00),
(29, 15, 2, 20.00),
(30, 1, 1, 30.00),
(30, 10, 1, 10.00);
  
  
-- EXERCICIOS

-- 🔤 Letra A) - Recupere o nome, a cidade e o estado dos clientes, exceto daqueles que vivem na região sul (RS, SC, PR):

SELECT nome, cidade, estado
FROM cliente
WHERE estado != 'RS'
  AND estado != 'SC'
  AND estado != 'PR';



-- 🔤 Letra B) - Recupere o nome dos clientes e o estado civil (por extenso), daqueles que moram na cidade de Niterói:

SELECT nome, estadocivil, 
	CASE 
		WHEN estadocivil = 'S' THEN 'Solteiro'
		WHEN estadocivil = 'C' THEN 'Casado'
        WHEN estadocivil = 'D' THEN 'Divorciado'
		WHEN estadocivil = 'V' THEN 'Viúvo'
	END
FROM cliente
WHERE cidade = 'Niterói';




-- 🔤 Letra C) - Recupere o nome dos clientes que não realizaram compras no ano de 2024:

SELECT nome
FROM cliente
WHERE codcliente NOT IN (
    SELECT codcliente
    FROM compra
    WHERE YEAR(data) = 2024
);


-- 🔤 letra D) -  Nome do cliente, funcionário e produto comprado

SELECT 
    cl.nome AS nome_cliente,
    fu.nome AS nome_funcionario,
    pr.nome AS nome_produto
FROM compra AS co
JOIN cliente AS cl ON co.codcliente = cl.codcliente
JOIN funcionario AS fu ON co.cod_funcionario = fu.cod_funcionario
JOIN compra_produto AS cp ON co.cod_compra = cp.cod_compra
JOIN produto AS pr ON cp.cod_produto = pr.cod_produto;


-- letra E) -  Total de funcionários por idade
SELECT YEAR(CURDATE()) - YEAR(dtnascimento) AS idade,
       COUNT(*) AS total
FROM funcionario
GROUP BY idade
ORDER BY idade;

-- letra F) -  5 compras mais caras
SELECT cp.cod_compra,
       SUM(p.preco) AS total
FROM compra_produto cp
JOIN produto p ON cp.cod_produto = p.cod_produto
GROUP BY cp.cod_compra
ORDER BY total DESC
LIMIT 5;

-- letra G) -  Total de produtos por fabricante
SELECT f.nome AS fabricante,
       COUNT(p.cod_produto) AS total_produtos
FROM produto p
JOIN fabricante f ON p.cod_fabricante = f.cod_fabricante
GROUP BY f.nome
ORDER BY total_produtos DESC;

-- letra H) -  Produtos vendidos mais de uma vez (ordem alfabética)
SELECT p.nome
FROM compra_produto cp
JOIN produto p ON cp.cod_produto = p.cod_produto
GROUP BY p.nome
HAVING COUNT(cp.cod_compra) > 1
ORDER BY p.nome ASC;

-- letra I) -  Valor total de compras por cliente
SELECT c.nome,
       SUM(p.preco) AS total_compras
FROM cliente c
JOIN compra co ON c.codcliente = co.codcliente
JOIN compra_produto cp ON co.cod_compra = cp.cod_compra
JOIN produto p ON cp.cod_produto = p.cod_produto
GROUP BY c.nome
ORDER BY total_compras DESC;

-- letra J) - "Alto" e "Baixo" em relação ao valor médio de compras
SELECT 
    cp.cod_compra,
    SUM(p.preco * cp.qtd) AS valor_total,
    CASE
        WHEN SUM(p.preco * cp.qtd) > (
            SELECT AVG(total)
            FROM (
                SELECT SUM(p.preco * cp2.qtd) AS total
                FROM compra_produto cp2
                JOIN produto p ON cp2.cod_produto = p.cod_produto
                GROUP BY cp2.cod_compra
            ) AS totais
        ) THEN 'Alto'
        ELSE 'Baixo'
    END AS classificacao
FROM compra_produto cp
JOIN produto p ON cp.cod_produto = p.cod_produto
GROUP BY cp.cod_compra;