const conexionPG = require("../config/config-pg");
const Usuario = require("../models/usuario.model");
const bcrypt = require("bcrypt");
const { trim } = require("validator");

const crearUsuario = async (req, res) => {
  const body = new Usuario(req.body);
  let { usr_usuario, usr_password, id_persona, id_oficina, id_entidad } = body;
  let consulta = `insert into seguridad_v2.usuario(usuario, password, id_persona, id_oficina,id_entidad)
            values (trim($1), $2, $3, $4, $5) RETURNING *`;
  try {
    let resultados = await conexionPG.query(consulta, [
      usr_usuario.toUpperCase(),
      bcrypt.hashSync(usr_password, 10),
      id_persona,
      id_oficina,
      id_entidad,
    ]);
    res.status(200).json({
      codigo: 1,
      mensaje: "Se guardo correctamente",
      contenido: resultados.rows[0],
    });
  } catch (error) {
    res.status(500).json({
      codigo: 0,
      mensaje: "Ocurrio un error al Guardar",
    });
  }
};

const obtenerCargoUsusarios = async (req, res) => {
  const { id } = req.body;
  console.log(id);
  const query = `select trim(c.abreviacion || ' ' || initcap(b.nombres) ||' '|| initcap(b.primer_apellido) || ' ' || initcap(b.segundo_apellido)) as nombre, e.descripcion from seguridad_v2.usuario a
    INNER JOIN seguridad_v2.persona b ON a.id_persona= b.id_persona
    INNER JOIN seguridad_v2.grado c ON b.id_grado = c.id_grado
    INNER JOIN seguridad_v2.usuario_cargo d ON d.id_usuario = a.id_usuario
    INNER JOIN seguridad_v2.cargo e ON d.id_cargo = e.id_cargo
    WHERE d.id_cargo in (${id})`;
  try {
    let resultados = await conexionPG.query(query);
    res.status(200).json({
      codigo: 1,
      mensaje: "Datos obtenidos correctamente",
      contenido: resultados.rows,
    });
  } catch (error) {
    res.status(500).json({
      codigo: 0,
      mensaje: "Ocurrio un error en la consulta",
    });
  }
};

const obtenerCargoUsuario = async (req, res) => {
  const { id } = req.params;
  const query = `select trim(c.abreviacion || ' ' || initcap(b.nombres) ||' '|| initcap(b.primer_apellido) || ' ' || initcap(b.segundo_apellido)) as nombre, e.descripcion from seguridad_v2.usuario a
    INNER JOIN seguridad_v2.persona b ON a.id_persona= b.id_persona
    INNER JOIN seguridad_v2.grado c ON b.id_grado = c.id_grado
    INNER JOIN seguridad_v2.usuario_cargo d ON d.id_usuario = a.id_usuario
    INNER JOIN seguridad_v2.cargo e ON d.id_cargo = e.id_cargo
    WHERE d.id_usuario = $1;`;

  try {
    let resultados = await conexionPG.query(query, [id]);
    res.status(200).json({
      codigo: 1,
      mensaje: "Datos obtenidos correctamente",
      contenido: resultados.rows,
    });
  } catch (error) {
    res.status(500).json({
      codigo: 0,
      mensaje: "Ocurrio un error en la consulta",
    });
  }
};

const obtenerUsuarioModuloRol = async (req, res) => {
  const { id_usuario, id_sistema } = req.params;
  const strQuery = `select um.id_modulo, m.cod_modulo, me.id_menu, me.nombre as nombre_menu, me.url, me.icon, me.id_padre, me.titulo  
                    from seguridad_v2.usuario u 
                    join seguridad_v2.usuario_sistema_modulo_rol um on (um.id_usuario = u.id_usuario)
                    join seguridad_v2.modulos m on (m.id_modulo = um.id_modulo)
                    join seguridad_v2.menu me on (me.id_modulo = m.id_modulo)
                    where u.estado_registro = 1
                    and um.estado_registro = 1
                    and m.estado_registro = 1
                    and me.estado_registro = 1
                    and um.id_usuario = $1
                    and um.id_sistema = $2
                    order by me.orden asc;`;

  try {
    let result = await conexionPG.query(strQuery, [id_usuario, id_sistema]);
    let contenido = '';
    if(result.rowCount > 0){
      contenido = result.rows;
    }
    
    res.status(200).json({
      codigo: 1,
      mensaje: "Datos obtenidos correctamente",
      contenido
    });
  } catch (error) {
    res.status(500).json({
      codigo: 0,
      mensaje: "Ocurrio un error en la consulta",
      contenido
    });
  }
};
const encripta = (req, res) => {
  let usr_password = req.body.usr_password;

  res.status(200).json({
    codigo: 1,
    mensaje: "contraseña encriptada:",
    contenido: bcrypt.hashSync(usr_password, 10),
  });
};

module.exports = {
  crearUsuario,
  obtenerCargoUsusarios,
  obtenerCargoUsuario,
  obtenerUsuarioModuloRol,
  encripta
};
