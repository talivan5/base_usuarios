const { Router } = require('express');
const { check } = require('express-validator');
const { crearPersona } = require('../controllers/persona.controller');
const { validarCampos } = require('../middlewares/validar-campos');
const { personaExiste } = require('../helpers/validador-persona');
const { validarJWT } = require('../middlewares/validar-jwt');
const { rol_admin } = require('../helpers/verifica-role');
const router = Router();

router.post('/persona',[
    validarJWT,
    rol_admin,
    check('per_nombres','Los nombres son requeridos').not().isEmpty(),
    check('per_primer_apellido','El primer apellido es requerido').not().isEmpty(),
    check('per_fecha_nacimiento','La fecha de nacimiento es requerido').not().isEmpty(),
    check('per_email','El email es requerido').not().isEmpty(),
    check('per_numero_documento','El numero de documento es requerido').not().isEmpty(),
    check('par_id_entidad','La entidad es requerida').not().isEmpty(),
    personaExiste,
    validarCampos
], crearPersona);
module.exports = router;