const { registrarSubMenu, editarSubMenu, obtenerSubMenu } = require('../controllers/sub_menu.controller');
const {Router} = require('express');
const {validarJWT} = require("../middlewares/validar-jwt");
const {validarCampos} = require("../middlewares/validar-campos");
const {check} = require("express-validator");

const router = Router();

router.post('/sub-menu', [validarJWT,check('par_nombre', 'El nombre del menu es requerido').not().isEmpty(),check('par_url', 'La url es requerida').not().isEmpty(),validarCampos], registrarSubMenu);
router.put('/sub-menu',[validarJWT,check('par_menu', 'El menu es requerido').not().isEmpty(), check('par_nombre', 'El nombre del menu es requerido').not().isEmpty(),check('par_url', 'La url es requerida').not().isEmpty() ,validarCampos], editarSubMenu);
router.get('/sub-menu', [validarJWT], obtenerSubMenu);

module.exports = router;