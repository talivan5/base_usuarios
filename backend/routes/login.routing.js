const { Router } = require("express");
const { check } = require("express-validator");
const { login } = require("../controllers/login.controller");
const { validarCampos } = require("../middlewares/validar-campos");
const { usuarioExiste, usurioSistema } = require("../helpers/validator");
const router = Router();

router.post('/', [
    check("usr_usuario", "El usuario es requerido").not().isEmpty(),
    check("usr_password", "La contraseña es requerida").not().isEmpty(),
    check("usr_password", "El pasword debe de ser mas de 6 letras").isLength({
      min: 3,
    }),
    validarCampos,
    usurioSistema,
  ],
  login
);

module.exports = router;
