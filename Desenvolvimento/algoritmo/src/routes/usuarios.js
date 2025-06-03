var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

router.get("/listarCantores", function (req, res) {
    usuarioController.listarCantores(req, res);
})

router.get("/listarGrupos", function (req, res) {
    usuarioController.listarGrupos(req, res);
});

router.get("/listarCantorFavorito", function (req, res) {
    usuarioController.listarCantorFavorito(req, res);
});

router.get("/listarGrupoFavorito", function (req, res) {
    usuarioController.listarGrupoFavorito(req, res);
});

// router.post("/adicionarFavoritos", function (req, res) {
//     usuarioController.adicionarFavoritos(req, res);
// });

module.exports = router;