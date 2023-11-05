CREATE DATABASE ATV1BD;

USE ATV1BD;

CREATE TABLE Departamento(
	IdDepartamento int auto_increment primary key,
    NomeDoDepartamento varchar(50) not null
);

CREATE TABLE Funcionarios(
	id int auto_increment primary key,
    nome varchar(150) NOT NULL,
    dataNascimento varchar(11) NOT NULL,
    Cargo varchar(50) NOT NULL,
    DepartID int,
    
    foreign key (DepartID) references Departamento(IdDepartamento)
);

INSERT INTO ATV1BD.Departamento(NomeDoDepartamento)
VALUES ('Tecnologia da Informação');
INSERT INTO ATV1BD.Departamento(NomeDoDepartamento)
VALUES ('Engenharia');
INSERT INTO ATV1BD.Departamento(NomeDoDepartamento)
VALUES ('Administração');

INSERT INTO ATV1BD.Funcionarios(nome, dataNascimento, Cargo, DepartID)
VALUES('Rodrigo Farra','12/11/2000' ,'Finanças', 3),
('Jorge Amado','05/02/1989' , 'Desenvolvedor Sênior', 1),
('Mariluce Pereira','26/07/1999' , 'Engenheira', 2),
('Mercedes Junior','18/01/2002' , 'Desenvolvedor Junior', 1),
('Carlos Araujo','10/06/2000' , 'Logística', 3),
('Amyy Maravilhosa','20/10/1987' , 'Gerente', 3);

CREATE VIEW vw_funcionarios_departamento AS 
SELECT  F.id , F.nome, F.Cargo, D.NomeDoDepartamento
FROM Funcionarios AS F
INNER JOIN Departamento AS D
ON F.DepartID = D.IdDepartamento
WHERE NomeDoDepartamento = 'Administração'
GROUP BY F.id;

DROP VIEW IF EXISTS vw_funcionarios_departamento;

SELECT * FROM Departamento;
SELECT * FROM Funcionarios; 

DROP DATABASE ATV1BD;