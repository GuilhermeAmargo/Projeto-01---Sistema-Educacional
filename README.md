# Projeto 01 - Sistema Educacional
Você foi contratado para projetar o banco de dados relacional de um sistema educacional para uma universidade.

O sistema deve coletar as seguintes informações de cada aluno: 
* nome
* cpf
* idade
* endereço
* contato (email ou telefone, ou ambos). 

Além disso o sistema deve gerar um RA (Registro de Aluno) para cada aluno.

Cada curso ofertado no sistema é associado a um departamento da instituição de ensino, que agrupa os cursos em áreas.

Áreas de atuação da universidade:
* Saúde
* Tecnologia
* Engenharia
* Humanas
  
Cada curso possui suas respectivas disciplinas, sendo algumas optativas. Algumas disciplinas podem pertencer a mais de um curso, como por exemplo Cálculo que é comum a todos os cursos de engenharia.

Este sistema permite que o aluno, após matriculado em um curso, monte sua própria grade, escolhendo as disciplinas disponíveis no semestre corrente do curso ao qual foi matriculado.

Cada aluno pode se matricular em mais de um curso.

A instituição deve manter os dados de seus alunos na plataforma mesmo após sua colação de grau.

**Para esta etapa do projeto você deverá apresentar o diagrama entidade relacionamento (DER) do banco de dados para validação com o cliente.**

Os desenvolvedores responsáveis por desenvolver o front-end deste sistema, ficaram incumbidos de criar uma tela onde os colaboradores da secretaria da universidade, consigam aplicar filtros aos dados trazendo as seguintes informações:
* Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.
* Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
* Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
* Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
* Filtrar todos os alunos matriculados em um determinado curso.
* Filtrar todos os alunos matriculados em determinada disciplina.
* Filtrar alunos formados.
* Filtrar alunos ativos.
* Apresentar a quantidade de alunos ativos por curso.
* Apresentar a quantidade de alunos ativos por disciplina.

Você deve criar todas as querys que realizam os filtros mencionados acima, os dados gerados por essas querys em SQL serão envidas através do back-end para preencher os campos do front-end.

**Para esta etapa do projeto você deverá submeter um arquivo .sql com TODAS as querys realizadas durante TODOS os processos de implementação do BD. Organize seu documento usando comentários para separar comandos DDL, DML e DQL.**

**A ENTREGA DESTA ATIVIDADE DEVE CONTER DOIS ARQUIVOS: Uma imagem JPG ou PNG com o diagrama ER e um arquivo SQL com as querys.**
