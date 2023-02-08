--DDL - CRIA AS ESTRUTURAS

CREATE DATABASE RpgOnlineBD

USE RpgOnlineBD

CREATE TABLE Usuarios(
	UsuarioID INT PRIMARY KEY IDENTITY
	,Email VARCHAR(100) UNIQUE NOT NULL -- Deve ser preenchido
	,Senha VARCHAR(255) NOT NULL
)

CREATE TABLE Classes(
	ClassesID INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(50) UNIQUE NOT NULL
	,Descricao VARCHAR(255)
)

CREATE TABLE Personagens(
	PersonagemID INT PRIMARY KEY IDENTITY
	,NomePersonagem VARCHAR(15) UNIQUE NOT NULL
	,UsuarioID INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioID)
	,ClasseID INT FOREIGN KEY REFERENCES Classes(ClassesID)
)

CREATE TABLE Habilidades(
	HabilidadesID INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE ClasseHabilidade(
	ClasseID INT FOREIGN KEY REFERENCES Classes(ClassesID)
	,HabilidadesID INT FOREIGN KEY REFERENCES Habilidades(HabilidadesID)
)

ALTER TABLE Personagens
ALTER COLUMN NomePersonagem VARCHAR(100);


--DML - COLOCAR DADOS
INSERT INTO Usuarios VALUES ('benigno@benigno.com', '123456')
INSERT INTO Classes VALUES ('Barbaro','Ele realmente é bárbaro')
INSERT INTO Usuarios (Email, Senha) VALUES ('manoel@manoel.com', HASHBYTES('SHA2_512','23456'))
INSERT INTO Habilidades VALUES ('Muquetada na Costela'), ('Dedo molhado no ouvido'), ('Cuecão'), ('Pedala Robinho')
INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseID) VALUES ('Klebin', 1, 2)
INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseID) VALUES ('Klebin_Cabeca_de_Lampada', 5, 2)
INSERT INTO ClasseHabilidade (ClasseID, HabilidadesID) VALUES (2, 3), (2, 2), (2, 1)

UPDATE Usuarios
SET Senha = '987565'
WHERE UsuarioID = 1



--DQL - CONSULTAS
SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade

SELECT * FROM Personagens
INNER JOIN Classes
ON Personagens.ClasseID = Classes.ClassesID

--Exemplo de JOIN

CREATE DATABASE ExemplosJOIN

USE ExemplosJOIN


--DDL
CREATE TABLE TabelaA(
	Nome VARCHAR(50) NULL
)

CREATE TABLE TabelaB(
	Nome VARCHAR(50) NULL
)

--DML

INSERT INTO TabelaA VALUES ('Fernanda')
INSERT INTO TabelaA VALUES ('Josefa')
INSERT INTO TabelaA VALUES ('Luiz')
INSERT INTO TabelaA VALUES ('Fernando')

INSERT INTO TabelaB VALUES ('Carlos'), ('Manoel'), ('Luiz'), ('Fernando')

--DQL
SELECT * FROM TabelaA
SELECT * FROM TabelaB

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA -- AS é um apelido para colunas
INNER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA -- AS é um apelido para colunas
LEFT JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA -- AS é um apelido para colunas
RIGHT JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA -- AS é um apelido para colunas
FULL OUTER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome