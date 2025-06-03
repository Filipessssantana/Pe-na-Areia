CREATE DATABASE penaareia;

USE penaareia;

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
dtNasc date,
principalHit varchar(30)
);

INSERT INTO catalogoCantor VALUES
	(default, '../assets/thiaguinho.png', 'Thiaguinho', '1983-03-11', 'Ousadia e Alegria'),
    (default, '../assets/pericles.png', 'Péricles', '1969-06-22', 'Final de Tarde'),
    (default, '../assets/ferrugem.png', 'Ferrugem', '1988-10-20', 'Pirata e Tesouro'),
    (default, '../assets/belo.png', 'Belo', '1983-03-11', 'Desafio'),
    (default, '../assets/dilsinho.png', 'Dilsinho', '1983-03-11', 'Péssimo Negócio'),
    (default, '../assets/mumuzinho.png', 'Mumuzinho', '1983-03-11', 'Fulminante'),
    (default, '../assets/diogo_nogueira.png', 'Diogo Nogueira', '1983-03-11', 'Clareou'),
    (default, '../assets/ludmilla.png', 'Ludmilla', '1983-03-11', 'Hoje'),
    (default, '../assets/marvila.png', 'Márvila', '1983-03-11', 'Pode Apostar'),
    (default, '../assets/rodriguinho.png', 'Rodriguinho', '1983-03-11', 'Falta de Atenção');

CREATE TABLE cantoresFavoritos (
fkCantor int,
fkUsuario int,
constraint pkCantoresFavoritos
	PRIMARY KEY (fkCantor, fkUsuario),
ranking int,
constraint fkCantorUsuario
	foreign key (fkCantor) references catalogoCantor(idCantor),
	foreign key (fkUsuario) references usuario(idUsuario)
);

INSERT INTO cantoresFavoritos VALUES
	(1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 2, 3),
    (5, 2, 2),
    (3, 2, 1),
    (4, 3, 2),
    (3, 3, 3),
    (1, 3, 1);

CREATE TABLE catalogoGrupo (
idGrupo int primary key auto_increment,
foto varchar(50),
nome varchar(70),
dtNasc date,
principalHit varchar(30)
);

INSERT INTO catalogoGrupo VALUES
	(default, '../assets/turma_do_pagode.png', 'Turma do Pagode', '1983-03-11', 'Lancinho'),
    (default, '../assets/exaltassamba.png', 'Exaltassamba', '1983-03-11', 'Livre pra Voar'),
    (default, '../assets/menos_e_mais.png', 'Menos é Mais', '1983-03-11', 'Adorei'),
    (default, '../assets/pixote.png', 'Pixote', '1983-03-11', 'Insegurança'),
    (default, '../assets/grupo_revelacao.png', 'Grupo Revelação', '1983-03-11', 'Deixa Acontecer'),
    (default, '../assets/soweto.png', 'Soweto', '1983-03-11', 'Derê'),
    (default, '../assets/jeito_moleque.png', 'Jeito Moleque', '1983-03-11', 'Me Faz Feliz'),
    (default, '../assets/katinguele.png', 'Katinguelê', '1983-03-11', 'Inaraí'),
    (default, '../assets/bom_gosto.png', 'Bom Gosto', '1983-03-11', 'Patricinha do Olho Azul'),
    (default, '../assets/sorriso_maroto.png', 'Sorriso Maroto', '1983-03-11', 'Futuro Prometido'),
    (default, '../assets/di_proposito.png', 'Di Propósito', '1983-03-11', 'Manda Áudio');

CREATE TABLE gruposFavoritos (
fkGrupo int,
fkUsuario int,
constraint pkCantoresFavoritos
	PRIMARY KEY (fkGrupo, fkUsuario),
ranking int,
constraint fkGrupoUsuario
	foreign key (fkGrupo) references catalogoGrupo(idGrupo),
	foreign key (fkUsuario) references usuario(idUsuario)
);

INSERT INTO gruposFavoritos VALUES
	(1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 2, 1),
    (5, 2, 3),
    (6, 2, 2),
    (7, 3, 2),
    (8, 3, 3),
    (9, 3, 1);