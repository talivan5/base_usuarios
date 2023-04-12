const conexionPG = require("../config/config-pg");
const { response, request } = require("express");
const usuarioExiste = async (usr_usuario = "") => {
  let strQuery = `SELECT usuario FROM seguridad_v2.usuario WHERE usuario = $1 and estado_registro = 1;`;
  const existeUsuario = await conexionPG.query( strQuery, [usr_usuario]);
  if (existeUsuario.rowCount > 0) {
    throw new Error(`El usuario ${usr_usuario} ya se encuentra registrado`);
  }
};

const usurioSistema = async (req, res, next) => {
  try {
    let strQuery  =`SELECT id_usuario FROM seguridad_v2.usuario WHERE usuario = $1 and estado_registro = 1;`;
    const respuesta = await conexionPG.query( strQuery, [req.body.usr_usuario]);

    if (respuesta.rowCount <= 0) {
      return res.status(401).json({
        codigo: 0,
        mensaje: `El usuario ${req.body.usr_usuario} no se encuentra registrado`,
      });
    }
    const { id_usuario } = respuesta.rows[0];
    let query = `SELECT id_sistema FROM seguridad_v2.sistemas WHERE cliente = $1 and estado_registro = 1;`;
    const respuestaAux = await conexionPG.query( query, [req.headers.userclient]);

    if (respuestaAux.rowCount <= 0) {
      return res.status(401).json({
        codigo: 0,
        mensaje: `La llave no es valida`,
      });
    }
    const { id_sistema } = respuestaAux.rows[0];
    let strQry = `SELECT * from seguridad_v2.usuario_sistema_modulo_rol where id_usuario = $1 and id_sistema = $2 and estado_registro = 1;`;
    const existeusurioRol = await conexionPG.query(strQry, [id_usuario, id_sistema]);
    if (existeusurioRol.rowCount <= 0) {
      return res.status(401).json({
        codigo: 0,
        mensaje: `El usuario ${req.body.usr_usuario} no esta habilitado en el sistema`,
      });
    }
    req.body.id_usuario = id_usuario;
    req.body.id_sistema = id_sistema;
    next();
  } catch (error) {
    return res.status(401).json({
      codigo: 0,
      mensaje: `Error en el servidor core`,
    });
  }
};

validarSistema = async (req, res, next) => {
  let strQuery = `SELECT id_sistema FROM seguridad_v2.sistemas WHERE cliente = $1 and estado_registro = 1;`;
  const respuestaAux = await conexionPG.query( strQuery, [req.headers.userclient]);
  const { id_sistema } = respuestaAux.rows[0];
  if (respuestaAux.rowCount <= 0) {
    return res.status(401).json({
      codigo: 0,
      mensaje: `La llave no es valida`,
    });
  }
  next();
};

module.exports = {
  usuarioExiste,
  usurioSistema,
  validarSistema,
};
