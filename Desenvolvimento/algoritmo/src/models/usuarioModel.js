var database = require("../database/config")

// ele faz a requisição ao banco de dados e retorna ao controller

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
        SELECT idUsuario, nome, email FROM usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO usuario (nome, email, senha) VALUES ('${nome}', '${email}', '${senha}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function listarCantores() {
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        SELECT catalogoCantor.idCantor,
        catalogoCantor.foto,
        catalogoCantor.nome,
	   catalogoCantor.principalHit,
       catalogoCantor.dtNasc,
	   TIMESTAMPDIFF(YEAR, dtNasc, CURDATE()) AS idade
       FROM catalogoCantor;`
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql); 
}

function listarGrupos() {
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        SELECT catalogoGrupo.idGrupo,
        catalogoGrupo.foto,
        catalogoGrupo.nome,
	   catalogoGrupo.principalHit,
       catalogoGrupo.dtNasc,
	   TIMESTAMPDIFF(YEAR, dtNasc, CURDATE()) AS idade
       FROM catalogoGrupo;`
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql); 
}

function listarCantorFavorito() {
    var instrucaoSql = `
        SELECT catalogoCantor.nome,
	   fkCantor, COUNT(*) AS qtdEscolhidoCantor
	   FROM cantoresFavoritos JOIN
	   catalogoCantor
       ON idCantor = fkCantor
        GROUP BY fkCantor
        ORDER BY qtdEscolhidoCantor;`
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql); 
}

function listarGrupoFavorito() {
    var instrucaoSql = `
        SELECT catalogoGrupo.nome,
	   fkGrupo, COUNT(*) AS qtdEscolhidoGrupo
	   FROM gruposFavoritos JOIN
	   catalogoGrupo
       ON idGrupo = fkGrupo
        GROUP BY fkGrupo
        ORDER BY qtdEscolhidoGrupo;`
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function adicionarFavoritos(fkCantor, fkUsuario, ranking) {
    var instrucaoSql = `
        INSERT INTO cantoresFavoritos (fkCantor, fkUsuario) VALUES ('${fkCantor}', '${fkUsuario}', '${ranking}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar,
    listarCantores,
    listarGrupos,
    listarCantorFavorito,
    listarGrupoFavorito,
    adicionarFavoritos
};