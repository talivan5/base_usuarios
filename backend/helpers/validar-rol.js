const conexionPG = require("../config/config-pg");

const usuarioRolExiste = async (req, res, next) => {
  const { id_usuario, id_rol, id_sistema } = req.body;
  //console.log(`SELECT * FROM seguridad_v2.usuario_rol WHERE id_rol = ${id_rol} and id_usuario = ${id_usuario} and id_sistema=${id_sistema}`)
  let strQuery = `select * 
                  from seguridad_v2.usuario_sistema_modulo_rol 
                  where estado_registro = 1
                  and id_rol = $1 
                  and id_usuario = $2 
                  and id_sistema = $3;`;
  const usuarioExist = await conexionPG.query(strQuery, [
    id_rol,
    id_usuario,
    id_sistema,
  ]);
  // console.log(usuarioExist.rowCount)
  if (usuarioExist.rowCount > 0) {
    return res.status(401).json({
      codigo: 0,
      mensaje: `El usuario tiene ya tiene el rol asignado en el sistema`,
    });
  }
  next();
};

module.exports = {
  usuarioRolExiste,
};
