# Resolução Exercício 4.5.

--
-- Criando a tabela Estudante
--
CREATE TABLE Estudante (
    id_Estudante INT PRIMARY KEY,
    Nome VARCHAR(100),
    Sala INT,
    Instituto VARCHAR(50)
);

--
-- Criando a tabela Curso
--
CREATE TABLE Curso (
    id_Curso VARCHAR(20) PRIMARY KEY,
    Nome_Curso VARCHAR(100),
    Creditos_Aula INT,
    Departamento VARCHAR(50)
);

--
-- Criando a tabela Seção
--
-- 'id_Seção' é a chave primária
-- 'Nome_Curso' é uma chave estrangeira que referencia a tabela Curso
--
CREATE TABLE Seção (
    id_Seção INT PRIMARY KEY,
    Nome_Curso VARCHAR(20),
    Semestre VARCHAR(20),
    Ano INT,
    Professor VARCHAR(100),
    FOREIGN KEY (Nome_Curso) REFERENCES Curso(id_Curso)
);

--
-- Criando a tabela Grade
--
-- A chave primária é composta por (Num_Estudante, Num_Seção)
-- 'Num_Estudante' é uma chave estrangeira que referencia a tabela Estudante
-- 'Num_Seção' é uma chave estrangeira que referencia a tabela Seção
--
CREATE TABLE Grade (
    Num_Estudante INT,
    Num_Seção INT,
    Grade VARCHAR(2),
    PRIMARY KEY (Num_Estudante, Num_Seção),
    FOREIGN KEY (Num_Estudante) REFERENCES Estudante(id_Estudante),
    FOREIGN KEY (Num_Seção) REFERENCES Seção(id_Seção)
);

--
-- Criando a tabela Prerequisito
--
-- A chave primária é composta por (Num_Curso, Num_Prerequisito)
-- 'Num_Curso' é uma chave estrangeira que referencia a tabela Curso
-- 'Num_Prerequisito' também é uma chave estrangeira que referencia a tabela Curso
--
CREATE TABLE Prerequisito (
    Num_Curso VARCHAR(20),
    Num_Prerequisito VARCHAR(20),
    PRIMARY KEY (Num_Curso, Num_Prerequisito),
    FOREIGN KEY (Num_Curso) REFERENCES Curso(id_Curso),
    FOREIGN KEY (Num_Prerequisito) REFERENCES Curso(id_Curso)
);
