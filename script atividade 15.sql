DROP DATABASE IF EXISTS bd_escola;
CREATE DATABASE IF NOT EXISTS bd_escola
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci; USE bd_escola;
CREATE TABLE tb_professor( pk_codprofessor INT (3) ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY, nome VARCHAR(40) NOT NULL, telefone VARCHAR(10) NOT NULL, email VARCHAR(40) NOT NULL
)ENGINE = INNODB;
CREATE TABLE tb_disciplina( pk_coddisciplina INT (3) ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY, nome VARCHAR(50) NOT NULL, carga_horaria DOUBLE NOT NULL
)ENGINE = INNODB;
CREATE TABLE tb_turno( pk_codturno CHAR(1) NOT NULL PRIMARY KEY, descricao VARCHAR(5) NOT NULL
)ENGINE = INNODB;
CREATE TABLE tb_turma( pk_codturma INT(4) ZEROFILL NOT NULL PRIMARY KEY, fk_codturno CHAR(1)  NOT NULL REFERENCES tb_turno(pk_codturno), ano_inicio INT(4) NOT NULL, semestre INT(2) ZEROFILL NOT NULL, fk_coddisciplina INT(3) ZEROFILL NOT NULL REFERENCES tb_disciplina(pk_coddisciplina), fk_codprofessor INT(3) ZEROFILL NOT NULL REFERENCES tb_professor(pk_codprofessor)
)ENGINE = INNODB;
CREATE TABLE tb_aluno( pk_matricula INT(7) NOT NULL PRIMARY KEY, nome VARCHAR(30) NOT NULL, telefone VARCHAR(12) NULL
)ENGINE = INNODB;
CREATE TABLE tb_aluno_Turma( fk_codturma INT(4) NOT NULL REFERENCES tb_turma(pk_codturma), fk_matricula INT(7) NOT NULL REFERENCES tb_aluno(pk_matricula),
n1 DOUBLE NOT NULL, n2 DOUBLE NOT NULL
)ENGINE = INNODB;

INSERT INTO tb_professor(nome,telefone,email)
VALUES
('Aline',95478521,'aline.zenker@qi.edu.br'),
('Andressa',94874787,'andressa.dellay@qi.edu.br'),
('Frodo',84214778,'leandro.silva@qi.edu.br'),
('Jonatas',94051980,'jonatas.alcalay@qi.edu.br'),  
('Rita',81245478,'rita.gaieski@qi.edu.br'); 

INSERT INTO tb_disciplina(nome,carga_horaria)
VALUES
('Logica de Programaçao',133),
('Internet I',67),
('Banco de Dados I','33.5'), ('Computacao Gráfica',67),
("Linguagem de Banco de Dados",'33.5'),
('Linguagem de Programacao Web',67);

INSERT INTO tb_turno(pk_codturno,descricao)
	VALUES 	('M','Manhã'), ('T','Tarde'), ('N','Noite');
    
INSERT INTO tb_turma(pk_codturma,fk_codturno,ano_inicio,semestre,fk_coddisciplina,fk_codprofessor)
VALUES
(0547,'M',2014,02,002,004),
(0235,'M',2015,01,001,001),
(1475,'T',2014,02,004,004),
(2698,'N',2015,01,006,002),
(2173,'N',2014,02,005,003);

INSERT INTO tb_aluno(pk_matricula,nome,telefone)
	VALUES	(2014159,'Cassio',34841598),
(2014324,'Amanda',34902476),
(2015817,'Cristiano',NULL),
(2015369,'Fernanda',34882014),
(2014474,'Pablo',34698720),
(2014198,'Luiza',NULL);

INSERT INTO tb_aluno_Turma(fk_codturma,fk_matricula,n1,n2)
VALUES
(2698,2015369,6,7),
(1475,2014159,10,8),
(0547,2014474,5.5,7 ),
(2698,2015817,10,10 ),
(2173,2015369,9.5,9.8 ), 
(2173,2014198,8,4.5);
