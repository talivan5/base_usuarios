const { Router } = require('express');
const { check } = require('express-validator');
const { obtenerRoles } = require('../controllers/obtener_roles.controller');
const { validarCampos } = require('../middlewares/validar-campos');
const { personaExiste } = require('../helpers/validador-persona');
const { validarJWT } = require('../middlewares/validar-jwt');
const { rol_admin } = require('../helpers/verifica-role');
const {validarSistema} = require("../helpers/validator");
const router = Router();

router.get('/obtener-roles',[validarJWT, validarSistema, validarCampos], obtenerRoles );

module.exports = router;