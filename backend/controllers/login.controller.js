const conexionPG = require("../config/config-pg");
const bcrypt = require("bcryptjs");
const { generarJWT } = require("../helpers/generar-jwt");
const e = require("express");

const login = async (req, res) => {
  try {
    const { usr_usuario, usr_password, id_usuario, id_sistema } = req.body;
    let strQuery = `select a.usuario, a.password, a.id_entidad, a.id_oficina, b.cod_oficina, b.nombre as nombre_oficina 
                    from seguridad_v2.usuario a 
                    join seguridad_v2.oficinas b ON (a.id_oficina = b.id_oficina) 
                    where a.estado_registro = 1
                    and b.estado_registro = 1
                    and a.id_usuario = $1;`;

    const userDate = await conexionPG.query(strQuery, [id_usuario.toUpperCase()]);
    let strQry = `select id_rol,id_sistema 
                  from seguridad_v2.usuario_sistema_modulo_rol 
                  where estado_registro = 1 
                  and id_usuario = $1 
                  and id_sistema = $2;`;

    const roles = await conexionPG.query(strQry, [id_usuario, id_sistema]);
    let rolArr = roles.rows;
    let arrAux = [];
    rolArr.forEach((e) => arrAux.push(e.id_rol));

    const validaContrasenia = bcrypt.compareSync(
      usr_password,
      userDate.rows[0].password
    );

    if (!validaContrasenia) {
      return res.status(400).json({
        codigo: 0,
        mensaje: "Usuario Password no son correctos - password",
      });
    }

    const { usuario, id_entidad, id_oficina, cod_oficina, nombre_oficina } = userDate.rows[0];
    const tokendata = {
      id_usuario,
      id_entidad,
      id_sistema,
      id_oficina,
      usuario,
      cod_oficina,
      nombre_oficina
    };
    
    const token = await generarJWT(tokendata);
    const usuariores = { usuario, id_entidad, cod_oficina, nombre_oficina };

    function clean(obj) {
      for (let propName in obj) {
        for (let pok in obj[propName]) {
          obj[propName][pok];
          if (obj[propName][pok][0] == null) {
            delete obj[propName][pok];
          }
        }
      }
      return obj;
    }

    res.json({
      codigo: 1,
      mensaje: "Login correcto",
      usuariores,
      token,
    });
  } catch (error) {
    res.status(500).json({
      codigo: 0,
      mensaje: "Error en el servidor",
    });
  }
};

module.exports = {
  login,
};