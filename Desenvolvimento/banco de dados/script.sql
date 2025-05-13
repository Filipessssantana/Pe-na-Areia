CREATE DATABASE pe_na_areia;

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
nome varchar(70),
idade date,
primeira_musica varchar(70),
ultima_musica varchar(70)
);

INSERT INTO catalogoCantor VALUES
	(default, 'Thiaguinho', '11-03-1983', 'Buquê de Flores', 'Falta de Tudo'),
    (default, 'Péricles', '22-06-1969', 'Amei', 'Já é'),
    (default, 'Ferrugem', '20-10-1988', 'Climatizar', ''),
    (default, 'Belo', '11-03-1983', 'Desafio', ''),
    (default, 'Dilsinho', '11-03-1983', 'Se Quiser', ''),
    (default, 'Mumuzinho', '11-03-1983', 'Fala', ''),
    (default, 'Diogo Nogueira', '11-03-1983', 'Samba Meu', ''),
    (default, 'Ludmilla', '11-03-1983', 'Sem Querer', ''),
    (default, 'Márvilla', '11-03-1983', 'Buquê de Flores', ''),
    (default, 'Rodriguinho', '11-03-1983', 'Buquê de Flores', ''); 

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

CREATE TABLE catalogoGrupo (
idGrupo int primary key auto_increment,
nome varchar(70),
idade date,
primeira_musica varchar(70),
ultima_musica varchar(70)
);

INSERT INTO catalogoGrupo VALUES
	(default, 'Turma do Pagode', '11-03-1983', 'Buquê de Flores', 'Falta de Tudo'),
    (default, 'Exaltassamba', '22-06-1969', 'Amei', 'Já é'),
    (default, 'Menos é Mais', '20-10-1988', 'Climatizar', ''),
    (default, 'Pixote', '11-03-1983', 'Desafio', ''),
    (default, 'Grupo Revelação', '11-03-1983', 'Se Quiser', ''),
    (default, 'Mumuzinho', '11-03-1983', 'Fala', ''),
    (default, 'Diogo Nogueira', '11-03-1983', 'Samba Meu', ''),
    (default, 'Ludmilla', '11-03-1983', 'Sem Querer', ''),
    (default, 'Márvilla', '11-03-1983', 'Buquê de Flores', ''),
    (default, 'Rodriguinho', '11-03-1983', 'Buquê de Flores', ''); 

CREATE TABLE gruposFavoritos (
fkGrupo int,
fkUsuario int,
constraint pkCantoresFavoritos
	PRIMARY KEY (fkCantor, fkUsuario),
ranking int,
constraint fkGrupoUsuario
	foreign key (fkGrupo) references catalogoGrupor(idGrupo),
	foreign key (fkUsuario) references usuario(idUsuario)
);

CREATE TABLE quiz (
idQuiz int primary key auto_increment,
nome varchar(30),
tipo varchar(30),
dtQuiz datetime
);

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