const {
    registrarMenuSubMenu,
    editarMenuSubMenu,
    obtenerMenuSubMenu
} = require('../controllers/menu_sub_menu.controller');
const {Router} = require('express');
const {validarJWT} = require("../middlewares/validar-jwt");
const {validarCampos} = require("../middlewares/validar-campos");
const {check} = require("express-validator");

const router = Router();


router.post('/menu-sub-menu', [validarJWT,check('par_menu', 'El menu es requerido').not().isEmpty(),check('par_sub_menu', 'El sub menu es requerido').not().isEmpty(),validarCampos], registrarMenuSubMenu);
router.put('/menu-sub-menu',[validarJWT,check('par_menu', 'El menu es requerido').not().isEmpty(), check('par_sub_menu', 'El sub menu es requerido').not().isEmpty(),check('par_menu_sub_menu', 'El menu sub menu es requerido').not().isEmpty() ,validarCampos], editarMenuSubMenu);
router.get('/menu-sub-menu', [validarJWT], obtenerMenuSubMenu);

module.exports = router;