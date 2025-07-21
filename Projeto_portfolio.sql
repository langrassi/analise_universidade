-- Criação da base de dados:

CREATE DATABASE Alunos;
USE Alunos;

-- Criação das tabelas:

DROP TABLE IF EXISTs Aluno, Professor, Disciplina, Sala, aluno_disc, Aula, Prof_disc;

CREATE TABLE Aluno (
    RA INT NOT NULL AUTO_INCREMENT,
    primeiro_nome VARCHAR(255),
    ultimo_nome VARCHAR(255),
    data_de_nascimento DATE,
    turno VARCHAR(255) NOT NULL,
    PRIMARY KEY (RA)
);

CREATE TABLE Professor (
    cod_prof TINYINT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    PRIMARY KEY (cod_prof)
);

CREATE TABLE Disciplina (
    cod_disc TINYINT NOT NULL AUTO_INCREMENT,
    nome_disc VARCHAR(255),
    PRIMARY KEY (cod_disc)
);

CREATE TABLE Aluno_disc (
    cod_disc TINYINT NOT NULL,
    RA INT NOT NULL,
    p1 FLOAT(4, 2) NULL,
    p2 FLOAT(4, 2) NULL,
    FOREIGN KEY (cod_disc)
        REFERENCES Disciplina (cod_disc),
    FOREIGN KEY (RA)
        REFERENCES Aluno (RA),
    PRIMARY KEY (RA , cod_disc)
); 	

CREATE TABLE Sala (
    no_sala TINYINT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (no_sala)
);

CREATE TABLE Aula (
    no_sala TINYINT NOT NULL,
    cod_disc TINYINT NOT NULL,
    FOREIGN KEY (no_sala)
        REFERENCES Sala (no_sala)
        ON DELETE CASCADE,
    FOREIGN KEY (cod_disc)
        REFERENCES Disciplina (cod_disc)
        ON DELETE CASCADE,
    PRIMARY KEY (no_sala , cod_disc)
);

CREATE TABLE Prof_disc (
	cod_prof TINYINT NOT NULL,
    cod_disc TINYINT NOT NULL,
    PRIMARY KEY(cod_prof, cod_disc),
    FOREIGN KEY (cod_prof)
		REFERENCES Professor (cod_prof)
        ON DELETE CASCADE,
	FOREIGN KEY (cod_disc)
		REFERENCES Disciplina (cod_disc)
        ON DELETE CASCADE
);