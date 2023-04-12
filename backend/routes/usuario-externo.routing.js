const { Router } = require('express');
const { check } = require('express-validator');
const { crearUsuarioExt,  actualizarUsuarioExt,
    obtenerUsuarioExt } = require('../controllers/usuario-externo.controller');
const { usuarioExiste, idPersona, idPersonaExiste } = require('../helpers/validador-usuario');
const { validarCampos } = require('../middlewares/validar-campos');
const { validarJWT } = require('../middlewares/validar-jwt');
const { rol_admin, rol_supervisor, rol_consultas, rol_operador } = require('../helpers/verifica-role');
const router = Router();

router.post('/usuario-ext',[ validarJWT,
                                        rol_admin,
                                        check('usr_usuario','El usuario es requerido').not().isEmpty(),
                                        check('usr_password','La contraseña es requerida').not().isEmpty(),
                                        check('id_persona','El id de la persona es requerida').not().isEmpty(),
                                        check('usr_usuario').custom(usuarioExiste),
                                        check('id_persona').custom(idPersonaExiste),
                                        check('id_persona').custom(idPersona), validarCampos] ,crearUsuarioExt);
router.put('/usuario-ext',[ validarJWT,
    rol_admin,
    check('id_usuario','El usuario es requerido').not().isEmpty(),
    check('usr_usuario','El usuario es requerido').not().isEmpty(),
    check('usr_password','La contraseña es requerida').not().isEmpty(),
    check('id_persona','El id de la persona es requerida').not().isEmpty(),
     validarCampos] ,actualizarUsuarioExt);
router.get('/usuario-ext',[validarJWT, rol_admin] ,obtenerUsuarioExt);

module.exports = router;