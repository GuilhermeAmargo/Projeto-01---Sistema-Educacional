-- DDL

CREATE TABLE alunos (
    cpf varchar(15) primary key,
    nome varchar(50) not null,
    idade int,
    rua text,
    numero varchar(10),
    bairro varchar(20),
    cidade varchar(20),
    estado varchar(20),
    cep int,
    pais varchar(20)
);

CREATE TABLE telefones (
    cpf varchar(15) REFERENCES alunos,
    cod_pais int,
    ddd int,
    numero int
);

CREATE TABLE emails (
    cpf varchar(15) REFERENCES alunos,
    email varchar(64),
    dominio varchar(20)
);

CREATE TABLE departamentos (
    id_dpto serial primary key,
    sigla_dpto varchar(4),
    nome_dpto varchar(10)
);

CREATE TABLE cursos (
    id_curso serial primary key,
    nome_curso varchar(50),
    id_dpto serial REFERENCES departamentos
);

CREATE TABLE matriculas (
    ra serial PRIMARY KEY,
    cpf varchar(15) REFERENCES alunos,
    status varchar(10),
    id_curso int REFERENCES cursos
);

CREATE TABLE disciplinas (
    id_disciplina serial PRIMARY KEY,
    nome_disciplina varchar(50),
    optativa boolean
);

CREATE TABLE cursos_disciplinas (
    id_curso serial REFERENCES cursos,
    id_disciplina serial REFERENCES disciplinas
);

CREATE TABLE matriculas_cursos (
    ra serial REFERENCES matriculas,
    id_disciplina serial REFERENCES disciplinas
);

-- DML
INSERT INTO alunos (cpf, nome, idade, rua, numero, bairro, cidade, estado, cep, pais) 
VALUES 
('111.222.333-44', 'Ana Clara Santos', 24, 'Rua das Flores', '123', 'Centro', 'São Paulo', 'SP', 01234567, 'Brasil'),
('222.333.444-55', 'Pedro Henrique Oliveira', 28, 'Av. das Palmeiras', '456', 'Botafogo', 'Rio de Janeiro', 'RJ', 20000000, 'Brasil'),
('333.444.555-66', 'Mariana Ferreira Costa', 22, 'Rua dos Andradas', '789', 'Centro', 'Porto Alegre', 'RS', 45678912, 'Brasil'),
('444.555.666-77', 'Felipe Santos Silva', 26, 'Av. Paulista', '987', 'Bela Vista', 'São Paulo', 'SP', 12345678, 'Brasil'),
('555.666.777-88', 'Carolina Oliveira Alves', 23, 'Rua da Lapa', '654', 'Lapa', 'Rio de Janeiro', 'RJ', 23000000, 'Brasil'),
('666.777.888-99', 'Lucas Oliveira Lima', 25, 'Rua da Paz', '111', 'Centro', 'Campinas', 'SP', 13000000, 'Brasil'),
('777.888.999-00', 'Gabriela Pereira Rodrigues', 27, 'Av. Brasil', '222', 'Ipanema', 'Porto Alegre', 'RS', 45678901, 'Brasil'),
('888.999.000-11', 'Rafaela Silva Souza', 30, 'Rua dos Coqueiros', '333', 'Barra', 'Salvador', 'BA', 40000000, 'Brasil'),
('999.000.111-22', 'Fernando Almeida Martins', 29, 'Av. das Acácias', '444', 'Jardins', 'Belo Horizonte', 'MG', 30123456, 'Brasil'),
('000.111.222-33', 'Gustavo Costa Santos', 31, 'Rua das Árvores', '555', 'Campos Elíseos', 'Curitiba', 'PR', 80000000, 'Brasil');

INSERT INTO telefones (cpf, cod_pais, ddd, numero) 
VALUES 
('111.222.333-44', 55, 11, 987654321),
('222.333.444-55', 55, 21, 123456789),
('333.444.555-66', 55, 51, 987654321),
('444.555.666-77', 55, 11, 123456789),
('555.666.777-88', 55, 21, 987654321),
('666.777.888-99', 55, 11, 123456789),
('777.888.999-00', 55, 21, 987654321),
('888.999.000-11', 55, 51, 123456789),
('999.000.111-22', 55, 11, 987654321),
('000.111.222-33', 55, 21, 123456789);

INSERT INTO emails (cpf, email, dominio) 
VALUES 
('111.222.333-44', 'anaclara.santos@gmail.com', 'gmail.com'),
('222.333.444-55', 'pedro.oliveira@yahoo.com', 'yahoo.com'),
('333.444.555-66', 'mariana.ferreira@outlook.com', 'outlook.com'),
('444.555.666-77', 'felipe.silva@live.com', 'live.com'),
('555.666.777-88', 'carolina.alves@hotmail.com', 'hotmail.com'),
('666.777.888-99', 'lucas.oliveira@icloud.com', 'icloud.com'),
('777.888.999-00', 'gabriela.rodrigues@aol.com', 'aol.com'),
('888.999.000-11', 'rafaela.souza@protonmail.com', 'protonmail.com'),
('999.000.111-22', 'fernando.martins@yandex.com', 'yandex.com'),
('000.111.222-33', 'gustavo.santos@zoho.com', 'zoho.com');

INSERT INTO departamentos (sigla_dpto, nome_dpto)
VALUES 
('SAU', 'Saúde'),
('TEC', 'Tecnologia'),
('ENG', 'Engenharia'),
('HUM', 'Humanas');

INSERT INTO cursos (nome_curso, id_dpto)
VALUES 
('Enfermagem', 1),
('Sistemas de Informação', 2),
('Engenharia Elétrica', 3),
('Direito', 4),
('Arquitetura', 3),
('Psicologia', 4),
('Administração de Empresas', 2),
('Biomedicina', 1),
('Engenharia de Produção', 3),
('Letras', 4);

INSERT INTO matriculas (cpf, status, id_curso) 
VALUES 
('111.222.333-44', 'Ativo', 1),
('222.333.444-55', 'Ativo', 2),
('333.444.555-66', 'Ativo', 3),
('444.555.666-77', 'Inativo', 1),
('555.666.777-88', 'Formado', 2),
('666.777.888-99', 'Ativo', 1),
('777.888.999-00', 'Inativo', 3),
('888.999.000-11', 'Ativo', 1),
('999.000.111-22', 'Formado', 2),
('000.111.222-33', 'Ativo', 3);

INSERT INTO disciplinas (nome_disciplina, optativa)
VALUES 
('Anatomia', FALSE),
('Algoritmos', FALSE),
('Construção Civil', FALSE),
('Direito Constitucional', FALSE),
('Física Quântica', FALSE),
('Marketing Digital', FALSE),
('Psicologia Social', FALSE),
('Desenho Arquitetônico', FALSE),
('Gestão de Projetos', FALSE),
('Literatura Brasileira', FALSE);

INSERT INTO cursos_disciplinas (id_curso, id_disciplina)
VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4),
(5, 3), 
(6, 7), 
(7, 6),
(8, 1), 
(9, 9), 
(10, 10);

INSERT INTO matriculas_cursos (ra, id_disciplina)
VALUES 
(1, 1), 
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- DQL
SELECT * FROM alunos;
SELECT * FROM telefones;
SELECT * FROM emails;
SELECT * FROM departamentos;
SELECT * FROM cursos;
SELECT * FROM matriculas;
SELECT * FROM disciplinas;
SELECT * FROM cursos_disciplinas;
SELECT * FROM matriculas_cursos;

-- Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.
SELECT cpf,nome,idade,rua,alunos.numero,bairro,cidade,estado,cep,pais,cod_pais,ddd,telefones.numero,email,dominio from (matriculas natural inner join alunos) inner join
telefones using (cpf) inner join emails using (cpf)
WHERE nome='Ana Clara Santos' OR ra=1

-- Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
SELECT nome_curso from (cursos natural inner join departamentos) where nome_dpto='Tecnologia'

-- Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
SELECT nome_curso from (cursos natural inner join cursos_disciplinas) inner join disciplinas USING (id_disciplina)
WHERE nome_disciplina='Anatomia'

-- Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
SELECT disciplinas.nome_disciplina
FROM disciplinas
INNER JOIN matriculas_cursos ON disciplinas.id_disciplina = matriculas_cursos.id_disciplina
INNER JOIN matriculas ON matriculas_cursos.ra = matriculas.ra
WHERE matriculas.cpf = '111.222.333-44'

-- Filtrar todos os alunos matriculados em um determinado curso.
SELECT nome FROM (alunos natural inner join matriculas) inner join cursos USING (id_curso)
WHERE nome_curso='Enfermagem'

-- Filtrar todos os alunos matriculados em determinada disciplina.
SELECT nome FROM (alunos natural inner join matriculas) natural inner join matriculas_cursos inner join
disciplinas using (id_disciplina)
WHERE nome_disciplina='Anatomia'

-- Filtrar alunos formados.
SELECT nome FROM (alunos natural inner join matriculas) WHERE status='Formado'

-- Filtrar alunos ativos.
SELECT nome FROM (alunos natural inner join matriculas)  WHERE status='Ativo'

-- Apresentar a quantidade de alunos ativos por curso.
SELECT cursos.nome_curso, COUNT(matriculas.cpf) AS quantidade_alunos_ativos
FROM cursos
LEFT JOIN matriculas ON cursos.id_curso = matriculas.id_curso
AND matriculas.status = 'Ativo'
GROUP BY cursos.nome_curso
ORDER BY cursos.nome_curso;


-- Apresentar a quantidade de alunos ativos por disciplina.
SELECT disciplinas.nome_disciplina, COUNT(matriculas.cpf) AS quantidade_alunos_ativos
FROM disciplinas
LEFT JOIN matriculas_cursos ON disciplinas.id_disciplina = matriculas_cursos.id_disciplina
LEFT JOIN matriculas ON matriculas_cursos.ra = matriculas.ra
AND matriculas.status = 'Ativo'
GROUP BY disciplinas.nome_disciplina
ORDER BY disciplinas.nome_disciplina;
