CREATE DATABASE pe_na_areia;

-- drop database pe_na_areia;

USE pe_na_areia;

CREATE TABLE usuario (
idUsuario int primary key auto_increment,
nome varchar(70),
email varchar(70) unique,
senha varchar(30)
);

INSERT INTO usuario VALUES
	(default, 'Fernando Ramirez', 'fernando.gutierrez@sptech.school', 'senha001'),
    (default, 'Diogo Procópio', 'diogo.procopio@sptech.school', 'senha002'),
    (default, 'André Lacerda', 'andre.lacerda@sptech.school', 'senha003');

CREATE TABLE catalogoCantor (
idCantor int primary key auto_increment,
foto varchar(50),
nome varchar(70),
idade date,
principalHit varchar(30),
qtdFavorito int
);

INSERT INTO catalogoCantor VALUES
	(default, '../assets/thiaguinho.png', 'Thiaguinho', '1983-03-11', 'Ousadia e Alegria', null),
    (default, '../assets/pericles.png', 'Péricles', '1969-06-22', 'Final de Tarde', null),
    (default, '../assets/ferrugem.png', 'Ferrugem', '1988-10-20', 'Pirata e Tesouro', null),
    (default, '../assets/belo.png', 'Belo', '1983-03-11', 'Desafio', null),
    (default, '../assets/dilsinho.png', 'Dilsinho', '1983-03-11', 'Péssimo Negócio', null),
    (default, '../assets/mumuzinho.png', 'Mumuzinho', '1983-03-11', 'Fulminante', null),
    (default, '../assets/diogo_nogueira.png', 'Diogo Nogueira', '1983-03-11', 'Clareou', null),
    (default, '../assets/ludmilla.png', 'Ludmilla', '1983-03-11', 'Hoje', null),
    (default, '../assets/marvila.png', 'Márvila', '1983-03-11', 'Pode Apostar', null),
    (default, '../assets/rodriguinho.png', 'Rodriguinho', '1983-03-11', 'Falta de Atenção', null);

CREATE TABLE cantoresFavoritos (
fkCantor int,
fkUsuario int,
constraint pkCantoresFavoritos
	PRIMARY KEY (fkCantor, fkUsuario),
-- ranking int,
constraint fkCantorUsuario
	foreign key (fkCantor) references catalogoCantor(idCantor),
	foreign key (fkUsuario) references usuario(idUsuario)
);

INSERT INTO cantoresFavoritos VALUES
	(1, 1),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 2),
    (3, 2),
    (4, 3),
    (3, 3),
    (1, 3);

CREATE TABLE catalogoGrupo (
idGrupo int primary key auto_increment,
foto varchar(50),
nome varchar(70),
idade date,
principalHit varchar(30),
qtdFavorito int
);

INSERT INTO catalogoGrupo VALUES
	(default, '../assets/turma_do_pagode.png', 'Turma do Pagode', '1983-03-11', 'Lancinho', null),
    (default, '../assets/exaltassamba.png', 'Exaltassamba', '1983-03-11', 'Livre pra Voar', null),
    (default, '../assets/menos_e_mais.png', 'Menos é Mais', '1983-03-11', 'Adorei', null),
    (default, '../assets/pixote.png', 'Pixote', '1983-03-11', 'Insegurança'),
    (default, '../assets/grupo_revelacao.png', 'Grupo Revelação', '1983-03-11', 'Deixa Acontecer', null),
    (default, '../assets/soweto.png', 'Soweto', '1983-03-11', 'Derê', null),
    (default, '../assets/jeito_moleque.png', 'Jeito Moleque', '1983-03-11', 'Me Faz Feliz', null),
    (default, '../assets/katinguele.png', 'Katinguelê', '1983-03-11', 'Inaraí', null),
    (default, '../assets/bom_gosto.png', 'Bom Gosto', '1983-03-11', 'Patricinha do Olho Azul', null),
    (default, '../assets/sorriso_maroto.png', 'Sorriso Maroto', '1983-03-11', 'Futuro Prometido', null),
    (default, '../assets/di_proposito.png', 'Di Propósito', '1983-03-11', 'Manda Áudio', null);

CREATE TABLE gruposFavoritos (
fkGrupo int,
fkUsuario int,
constraint pkCantoresFavoritos
	PRIMARY KEY (fkGrupo, fkUsuario),
-- ranking int,
constraint fkGrupoUsuario
	foreign key (fkGrupo) references catalogoGrupo(idGrupo),
	foreign key (fkUsuario) references usuario(idUsuario)
);

INSERT INTO gruposFavoritos VALUES
	(1, 1),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 2),
    (6, 2),
    (7, 3),
    (8, 3),
    (9, 3);

CREATE TABLE quiz (
idQuiz int primary key auto_increment,
nome varchar(30),
tipo varchar(30),
dtQuiz datetime
);

INSERT INTO quiz(nome, tipo) VALUES
	('Qual é a música?', 'música'),
    ('Quem é o cantor?', 'cantor'),
    ('Complete a música?', 'completar'),
    ('De quando é?', 'data');

CREATE TABLE pontuacao (
fkQuiz int,
fkUsuario int,
idPontuacao int,
constraint pkQuizUsuario
	PRIMARY KEY (fkQuiz, fkUsuario, idPontuacao),
acertos int,
erros int,
constraint fkQuizUsuario
	foreign key (fkQuiz) references quiz(idQuiz),
	foreign key (fkUsuario) references usuario(idUsuario)
);

INSERT INTO pontuacao VALUES
	(1, 1, 1, 6, 4),
    (2, 1, 2, 7, 3),
    (3, 2, 3, 3, 7),
    (4, 3, 4, 5, 5);
    
SELECT usuario.nome as 'Nome do Usuário',
	   usuario.email as 'Email',
       catCantor.nome as 'Cantor',
       catCantor.idade as 'Idade'
       FROM usuario JOIN cantoresFavoritos as cantorFav
       ON idUsuario = fkUsuario
       JOIN catalogoCantor as catCantor
       ON idCantor = fkCantor;
       
SELECT * FROM usuario;

SELECT * FROM catalogoCantor;

SELECT * FROM catalogoGrupo;

SELECT * FROM cantoresFavoritos;

SELECT count(fkCantor) FROM cantoresFavoritos;

SELECT catalogoCantor.nome,
	   fkCantor, COUNT(*) AS qtdEscolhido
	   FROM cantoresFavoritos JOIN
	   catalogoCantor
       ON idCantor = fkCantor
GROUP BY fkCantor
ORDER BY qtdEscolhido DESC;