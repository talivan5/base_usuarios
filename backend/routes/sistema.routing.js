const { Router } = require('express');
const { check } = require('express-validator');
const { validarJWT } = require('../middlewares/validar-jwt');
const {validarCampos} = require('../middlewares/validar-campos')
const {
    registrarSistema,
    actualizarSistema,
    obtenerSistemas,
    actualizarLlaveSistema } = require('../controllers/sistema.controller')
const { rol_admin, rol_supervisor, rol_consultas, rol_operador } = require('../helpers/verifica-role');
const router = Router();

router.post('/sistema',[ validarJWT, rol_admin,
    check('cod_sistema','El usuario es requerido').not().isEmpty(),
    check('nombre','La contraseña es requerida').not().isEmpty(),
    check('cliente','El id del sistema es requerido').not().isEmpty(),
    check('descripcion','El id del sistema es requerido').not().isEmpty(),
    validarCampos] ,registrarSistema);

router.put('/sistema',[ validarJWT, rol_admin,
    check('id_sistema','El el id del sistema es requerido').not().isEmpty(),
    check('cod_sistema','El usuario es requerido').not().isEmpty(),
    check('nombre','La contraseña es requerida').not().isEmpty(),
    check('cliente','El id del sistema es requerido').not().isEmpty(),
    check('descripcion','El id del sistema es requerido').not().isEmpty(),
    validarCampos] ,actualizarSistema);

router.put('/sistema-cliente',[ validarJWT, rol_admin,
    check('id_sistema','El el id del sistema es requerido').not().isEmpty(),
    check('cliente','El id del sistema es requerido').not().isEmpty(),
    validarCampos] ,actualizarLlaveSistema);

router.get('/sistema',[ validarJWT, rol_admin] ,obtenerSistemas);
module.exports = router;