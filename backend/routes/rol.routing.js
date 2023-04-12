const { Router } = require('express');
const { check } = require('express-validator');
const { crearUsuarioRol } = require('../controllers/rol.controller');
const { usuarioRolExiste } = require('../helpers/validar-rol');
const { validarCampos } = require('../middlewares/validar-campos');
const { validarJWT } = require('../middlewares/validar-jwt');
const { rol_admin, rol_supervisor, rol_consultas, rol_operador } = require('../helpers/verifica-role');
const router = Router();

router.post('/roles',[ validarJWT,
                                     rol_admin,
    check('id_rol','El usuario es requerido').not().isEmpty(),
    check('id_usuario','La contraseña es requerida').not().isEmpty(),
    check('id_sistema','El id del sistema es requerido').not().isEmpty(),
    usuarioRolExiste,
     validarCampos] ,crearUsuarioRol);


module.exports = router;