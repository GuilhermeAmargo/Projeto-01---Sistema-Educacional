-- Comandos DDL
CREATE TABLE emails (
    idEmail serial PRIMARY KEY,
    email varchar(100)
);

CREATE TABLE telefones (
    idTelefone serial PRIMARY KEY,
    telefone varchar(100)
);

CREATE TABLE contatos (
    idContato serial PRIMARY KEY,
    idEmail integer REFERENCES emails (idEmail),
    idTelefone integer REFERENCES telefones (idTelefone)
);

CREATE TABLE enderecos (
    idEndereco serial PRIMARY KEY,
    logradouro varchar(50),
    numero integer,
    cidade varchar(50),
    UF varchar(50),
    pais varchar(50)
);

CREATE TABLE alunos (
    RA integer PRIMARY KEY,
    idEndereco integer REFERENCES enderecos (idEndereco),
    idContato integer REFERENCES contatos (idContato),
    nomeAluno varchar(50),
    cpfAluno varchar(11) UNIQUE,
    idadeAluno integer,
    formando boolean
);

CREATE TABLE departamentos (
    idDepartamento serial PRIMARY KEY,
    nomeDepartamento varchar (50)
);

CREATE TABLE cursos (
    idCurso serial PRIMARY KEY,
    nomeCurso varchar(50),
    idDepartamento integer REFERENCES departamentos (idDepartamento)
);

CREATE TABLE disciplinas (
    idDisciplina serial PRIMARY KEY,
    nomeDisciplina varchar (50),
    disciplinaOptativa boolean
);

CREATE TABLE alunos_cursos_disciplinas (
    idMatricula serial PRIMARY KEY,
    RA integer REFERENCES alunos (RA),
    idCurso integer REFERENCES cursos (idCurso),
    idDisciplina integer REFERENCES disciplinas (idDisciplina)
);

-- Comandos DML
INSERT INTO emails (email) VALUES 
('silvaana@gmail.com'),
('brunomar@hotmail.com'),
('carlosedu@gmail.com'),
('dianaribei@gmail.com'),
(''),
('felima@gmail.com'),
('gacosta@hotmail.com'),
('helegomes@gmail.com'),
(''),
('jupereira@gmail.com');

INSERT INTO telefones (telefone) VALUES 
('15998462345'),
(''),
('15971454634'),
('15998754786'),
('15997643284'),
('15998543298'),
(''),
('15998476452'),
('1598746549'),
('1599765432');

INSERT INTO contatos (idEmail, idTelefone) VALUES
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

INSERT INTO enderecos (logradouro, numero, cidade, UF, pais) VALUES 
('Rua Lima','342','Sorocaba','SP','Brasil'),
('Rua Nova Alvorada','125','Sorocaba','SP','Brasil'),
('Rua São Paulo','278','Sorocaba','SP','Brasil'),
('Rua Java','324','Sorocaba','SP','Brasil'),
('Rua Damasco','987','Sorocaba','SP','Brasil'),
('Rua Americana','542','Sorocaba','SP','Brasil'),
('Rua Salvação','432','Sorocaba','SP','Brasil'),
('Rua Esmeralda','654','Sorocaba','SP','Brasil'),
('Rua Lavanda','876','Sorocaba','SP','Brasil'),
('Rua Silva','564','Sorocaba','SP','Brasil');

INSERT INTO alunos (idEndereco, idContato, nomeAluno, cpfAluno, idadeAluno, formando) VALUES
(1, 1, 'Ana Silva', '12345678901', 20, false),
(2, 2, 'Bruno Martins', '23456789012', 22, true),
(3, 3, 'Carlos Eduardo', '34567890123', 21, false),
(4, 4, 'Diana Ribeiro', '45678901234', 23, true),
(5, 5, 'Eduardo Souza', '56789012345', 19, false),
(6, 6, 'Fernanda Lima', '67890123456', 24, true),
(7, 7, 'Gabriel Costa', '78901234567', 25, false),
(8, 8, 'Helena Gomes', '89012345678', 18, true),
(9, 9, 'Igor Santos', '90123456789', 27, false),
(10, 10, 'Julia Pereira', '01234567890', 26, true);

INSERT INTO departamentos (nomeDepartamento) VALUES
('Saúde'),
('Tecnologia'),
('Engenharia'),
('Humanas');

INSERT INTO cursos (nomeCurso, idDepartamento) VALUES
('Enfermagem', 1),
('Fisioterapia', 1),
('Odontologia', 1),
('Farmácia', 1),
('Ciência da Computação', 2),
('Sistemas de Informação', 2),
('Análise e Desenvolvimento de Sistemas', 2),
('Segurança da Informação', 2),
('Engenharia Elétrica', 3),
('Engenharia Mecânica', 3),
('Engenharia Química', 3),
('Engenharia de Produção', 3),
('Direito', 4),
('Psicologia', 4),
('Sociologia', 4),
('Letras', 4);

INSERT INTO disciplinas (nomeDisciplina, disciplinaOptativa) VALUES
('Cálculo I', false),
('Física I', false),
('História da Arte', true),
('Geografia Urbana', true),
('Biologia Celular', false),
('Inglês Avançado', true),
('Anatomia Humana', false),
('Desenho Arquitetônico', true),
('Química Orgânica', false),
('Ética e Cidadania', true);

INSERT INTO alunos_cursos_disciplinas (RA, idCurso, idDisciplina) VALUES
(1,7,1),
(1,7,6),
(2,11,9),
(3,8,1),
(4,3,5),
(4,3,7),
(5,6,1),
(6,2,7),
(7,14,10),
(8,9,2),
(9,10,2),
(10,1,5),
(10,1,7),
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- Comandos DQL
SELECT * FROM alunos
SELECT * FROM alunos_cursos_disciplinas
SELECT * FROM contatos
SELECT * FROM cursos
SELECT * FROM departamentos
SELECT * FROM disciplinas
SELECT * FROM emails
SELECT * FROM enderecos
SELECT * FROM telefones

-- Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.
SELECT cpfaluno,idadealuno,formando,logradouro,numero,cidade,uf,pais,email,telefone from (alunos natural inner join enderecos) inner join contatos USING (idcontato)
left join emails using (idEmail) left join telefones using (idTelefone)
WHERE nomealuno='Ana Silva' OR ra='1'

-- Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
SELECT nomecurso from (cursos natural inner join departamentos) where nomedepartamento='Tecnologia'

-- Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
SELECT nomeCurso from (alunos_cursos_disciplinas natural inner join cursos) inner join disciplinas USING (iddisciplina)
WHERE nomeDisciplina=''

-- Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
SELECT nomeDisciplina from (alunos_cursos_disciplinas natural inner join disciplinas) inner join alunos USING (ra)
WHERE cpfaluno='12345678901'

-- Filtrar todos os alunos matriculados em um determinado curso.
SELECT nomealuno FROM (alunos_cursos_disciplinas natural inner join alunos) inner join cursos USING (idcurso)
WHERE nomecurso='Odontologia'

-- Filtrar todos os alunos matriculados em determinada disciplina.
SELECT nomealuno FROM (alunos_cursos_disciplinas natural inner join alunos) inner join disciplinas USING (iddisciplina)
WHERE nomedisciplina=''

-- Filtrar alunos formados.
SELECT nomealuno FROM alunos WHERE formando=true

-- Filtrar alunos ativos.
SELECT nomealuno FROM alunos WHERE formando=false

-- Apresentar a quantidade de alunos ativos por curso.
SELECT COUNT(nomealuno) from (alunos_cursos_disciplinas natural inner join alunos) inner join cursos USING (idcurso)
WHERE nomecurso='Odontologia' AND formando=false

-- Apresentar a quantidade de alunos ativos por disciplina.
SELECT COUNT(nomealuno) from (alunos_cursos_disciplinas natural inner join alunos) inner join disciplinas USING (iddisciplina)
WHERE nomedisciplina='' AND formando=false