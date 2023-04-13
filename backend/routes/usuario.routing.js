const { Router } = require("express");
const { check } = require("express-validator");
const { crearUsuario, obtenerCargoUsusarios, obtenerCargoUsuario, obtenerUsuarioModuloRol, encripta } = require("../controllers/usuario.controller");
const { usuarioExiste, idPersona, idPersonaExiste, } = require("../helpers/validador-usuario");
const { validarCampos } = require("../middlewares/validar-campos");
const { validarJWT } = require("../middlewares/validar-jwt");
const { rol_admin, rol_supervisor, rol_consultas, rol_operador, } = require("../helpers/verifica-role");
const { usurioSistema } = require("../helpers/validator");
const router = Router();

router.post("/usuario", [
    validarJWT,
    rol_admin,
    check("usr_usuario", "El usuario es requerido").not().isEmpty(),
    check("usr_password", "La contraseña es requerida").not().isEmpty(),
    check("id_persona", "El id de la persona es requerida").not().isEmpty(),
    check("id_oficina", "La oficina es requerida").not().isEmpty(),
    check("id_entidad", "La entidad es requerida").not().isEmpty(),
    check("usr_usuario").custom(usuarioExiste),
    check("id_persona").custom(idPersonaExiste),
    check("id_persona").custom(idPersona),
    validarCampos,
  ],
  crearUsuario
);

router.post("/usuarios-cargo", [
  validarJWT, check("id", "El id del usuario es requerido").not().isEmpty(), validarCampos],
  obtenerCargoUsusarios
);

router.get("/usuario-cargo/:id", [
  validarJWT, check("id", "El id del usuario es requerido").not().isEmpty(), validarCampos],
  obtenerCargoUsuario
);

router.get('/usuarioModuloRol/:id_usuario/:id_sistema', 
  [
    validarJWT, 
    check("id_usuario", "El id del usuario es requerido").not().isEmpty(), 
    check("id_sistema", "El id del sistema es requerido").not().isEmpty(), validarCampos
  ], 
  obtenerUsuarioModuloRol
);

router.get('/encripta',encripta)

module.exports = router;