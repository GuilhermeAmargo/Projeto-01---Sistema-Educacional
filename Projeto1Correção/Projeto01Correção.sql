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
)

CREATE TABLE telefones (
    cpf varchar(15) REFERENCES alunos,
    cod_pais int
    ddd int,
    numero int
)

CREATE TABLE emails (
    cpf varchar(15) REFERENCES alunos,
    email varchar(64),
    dominio varchar(20)
)

CREATE TABLE departamentos (
    id_dpto serial primary key,
    sigla_dpto varchar(4),
    nome_dpto varchar(10)
)

CREATE TABLE cursos (
    id_curso serial,
    nome_curso varchar(10),
    id_dpto serial REFERENCES departamentos
)

CREATE TABLE matriculas (
    ra serial PRIMARY KEY,
    cpf varchar(15) REFERENCES alunos,
    status varchar(10),
    id_curso int REFERENCES cursos
)

CREATE TABLE disciplinas (
    id_disciplina serial PRIMARY KEY,
    nome_disciplina varchar(10),
    optativa boolean
)

CREATE TABLE cursos_disciplinas (
    id_curso serial REFERENCES cursos,
    id_disciplina serial REFERENCES disciplinas
)

CREATE TABLE matriculas_cursos (
    ra serial REFERENCES matriculas,
    id_disciplina serial REFERENCES disciplinas
)

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

INSERT INTO departamentos (sigla_dpto, nome_dpto)
VALUES 
('SAU', 'Saúde'),
('TEC', 'Tecnologia'),
('ENG', 'Engenharia'),
('HUM', 'Humanas');

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


INSERT INTO cursos_disciplinas (id_curso, id_disciplina)
VALUES 
(5, 1), 
(5, 3), 
(6, 2), 
(6, 4),
(7, 1), 
(7, 5), 
(8, 4),
(8, 7), 
(9, 1), 
(9, 3), 
(10, 7), 
(10, 9), 
(11, 4), 
(11, 6), 
(12, 1), 
(12, 10), 
(13, 9), 
(13, 3), 
(14, 10), 
(14, 8); 
 
 SELECT * FROM alunos;
 SELECT * FROM telefones;
 SELECT * FROM emails;
 SELECT * FROM departamentos;
 SELECT * FROM cursos;
 SELECT * FROM matriculas;
SELECT * FROM disciplinas;
SELECT * FROM cursos_disciplinas;
SELECT * FROM matriculas_cursos;










