const { registrarMenu,
        editarMenu,
        obtenerMenu} = require('../controllers/menu.controller');
const {Router} = require('express');
const {validarJWT} = require("../middlewares/validar-jwt");
const {validarCampos} = require("../middlewares/validar-campos");
const {check} = require("express-validator");

const router = Router();


router.post('/menu', [validarJWT,check('par_nombre', 'El nombre del menu es requerido').not().isEmpty(),check('par_url', 'La url es requerida').not().isEmpty(), check('par_modulo', 'El modulo es requerido').not().isEmpty() ,validarCampos], registrarMenu)
    .put('/menu',[validarJWT,check('par_menu', 'El menu es requerido').not().isEmpty(), check('par_nombre', 'El nombre del menu es requerido').not().isEmpty(),check('par_url', 'La url es requerida').not().isEmpty(), check('par_modulo', 'El modulo es requerido').not().isEmpty() ,validarCampos], editarMenu)
    .get('/menu', [validarJWT], obtenerMenu);

module.exports = router;