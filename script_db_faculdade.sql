use db_faculdade;

CREATE TABLE Aluno (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  data_nascimento DATE,
  matricula VARCHAR(20)
);

CREATE TABLE Professor (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  cpf VARCHAR(14),
  area_atuacao VARCHAR(100)
);

CREATE TABLE Curso (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  carga_horaria INT
);

CREATE TABLE Disciplina (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  carga_horaria INT,
  id_curso INT NOT NULL,
  FOREIGN KEY (id_curso) REFERENCES Curso(id)
);

CREATE TABLE Turma (
  id INT PRIMARY KEY,
  id_disciplina INT NOT NULL,
  id_professor INT NOT NULL,
  semestre VARCHAR(10),
  FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id),
  FOREIGN KEY (id_professor) REFERENCES Professor(id)
);

CREATE TABLE Matricula (
  id_aluno INT,
  id_turma INT,
  nota DECIMAL(4,2),
  PRIMARY KEY (id_aluno, id_turma),
  FOREIGN KEY (id_aluno) REFERENCES Aluno(id),
  FOREIGN KEY (id_turma) REFERENCES Turma(id)
);