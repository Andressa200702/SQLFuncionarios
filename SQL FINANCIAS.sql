create database funcionarios;
use funcionarios;

CREATE TABLE Funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    departamento VARCHAR(50),
    salario DECIMAL(10,2),
    data_admissao DATE
);

INSERT INTO Funcionarios (nome, cargo, departamento, salario, data_admissao) VALUES
('Marina Costa', 'Desenvolvedora', 'TI', 6500.00, '2022-03-15'),
('Rafael Mendes', 'Analista de Dados', 'TI', 5800.00, '2023-01-10'),
('Juliana Prado', 'Gerente', 'Vendas', 8200.00, '2020-07-01'),
('Lucas Ferreira', 'Vendedor', 'Vendas', 3200.00, '2023-06-20'),
('Camila Torres', 'Vendedora', 'Vendas', 3400.00, '2022-11-05'),
('Pedro Nogueira', 'Analista de RH', 'RH', 4100.00, '2021-09-12'),
('Fernanda Lopes', 'Gerente', 'RH', 7500.00, '2019-02-18'),
('Thiago Barros', 'Desenvolvedor', 'TI', 6900.00, '2021-05-30'),
('Bianca Martins', 'Estagiária', 'TI', 1800.00, '2024-02-01'),
('Gustavo Ribeiro', 'Assistente', 'RH', 2900.00, '2024-08-14');

-- Liste todos os funcionários do departamento de TI. --
select * from funcionarios
where departamento = 'TI';

-- Liste quem ganha mais de 5000, do maior salário pro menor. --
select *
from funcionarios
where salario > '5000'
order by salario desc;

-- Qual a média salarial de cada departamento? (GROUP BY) --
select departamento, AVG (salario) AS media_salarial
from funcionarios
group by departamento;

-- Quantos funcionários cada departamento tem? -- 
select departamento, count(cargo) as total_func
from funcionarios
group by departamento;

-- Quem foi admitido depois de 2023-01-01? --
select * from funcionarios
where data_admissao > '2023-01-01';

-- Qual o maior e o menor salário da empresa? (MAX e MIN) --
select  MAX(salario) AS salario_max, MIN(salario) AS salario_min 
from funcionarios;

-- Dê um aumento de 10% pra quem é do departamento de Vendas (UPDATE com WHERE) --
SET SQL_SAFE_UPDATES = 0;

UPDATE funcionarios
SET salario = salario * 1.10
WHERE departamento = 'Vendas';

SET SQL_SAFE_UPDATES = 1;

select * from funcionarios;

-- Liste os departamentos que têm média salarial acima de 5000 (HAVING) --
select departamentos, media_salarial
from funcionarios;

-- Liste todos os funcionários cujo nome começa com a letra M --

SELECT *
FROM funcionarios
WHERE nome LIKE 'M%';

-- Liste o nome, o cargo e o salário dos funcionários que ganham entre R$ 3.000 e R$ 6.000, incluindo os dois valores.
select nome, cargo, salario
from funcionarios
where salario between 3000 AND 6000;

-- Mostre todos os cargos diferentes existentes na empresa, sem repetir nenhum cargo.
select distinct cargo
from funcionarios;

-- Liste o nome e a data de admissão dos funcionários admitidos antes de 01/01/2022.
select nome, data_admissao
from funcionarios
where data_admissao < '01/01/2022';

-- Liste o nome, o departamento e o salário dos funcionários que ganham mais do que a média salarial de toda a empresa.
SELECT *
FROM funcionarios
WHERE salario > (
    SELECT AVG(salario)
    FROM funcionarios
);

-- Liste o nome e o salário de cada funcionário e crie uma coluna chamada faixa_salarial, seguindo estas regras:
-- Salário maior que R$ 6.000: "Salário alto".
-- Salário menor ou igual a R$ 6.000: "Salário não alto".

SELECT nome, salario,
       CASE
           WHEN salario > 6000 THEN 'Salário alto'
           ELSE 'Salário não alto'
       END AS faixa_salarial
FROM funcionarios;

-- LIKE + busca de texto: Liste os funcionários cujo nome contém a letra “a”.

-- AND + OR: Liste os funcionários do departamento de TI que ganham mais de R$ 6.000 ou os funcionários do departamento de RH que ganham mais de R$ 4.000.

-- ROUND + AVG: Calcule a média salarial de cada departamento e arredonde o resultado para duas casas decimais.

-- ORDER BY múltiplo: Liste todos os funcionários ordenados primeiro pelo departamento em ordem alfabética e depois pelo salário, do maior para o menor dentro de cada departamento.

-- GROUP BY + SUM: Descubra quanto a empresa gasta com salários em cada departamento. Mostre o departamento e o total da folha salarial.

-- Subconsulta + MAX: Liste o nome, o cargo e o salário do funcionário que recebe o maior salário da empresa. Resolva usando uma subconsulta com `MAX()`.

-- UPDATE + condição: Aumente em R$ 200,00 o salário de todos os funcionários cujo cargo seja “Estagiária”. Não se esqueça de usar `WHERE`.

-- DELETE + condição: Escreva o comando SQL para excluir o funcionário cujo `id` seja 10. Apenas escreva a consulta, sem executá-la.