const { response, request } = require("express");
const jwt = require("jsonwebtoken");
const conexionPG = require("../config/config-pg");
const Usuario = require("../models/usuario.model");

const validarJWT = async (req = request, res = response, next) => {
  try {
    const token = req.header("token");
    if (!token) {
      return res.status(401).json({
        estado: 0,
        mensaje: "No hay token en la peticion",
      });
    }

    const {
      id_usuario,
      id_entidad,
      id_sistema,
      usuario,
      cod_oficina,
      id_oficina,
      nombre_oficina,
    } = jwt.verify(token, process.env.SECRET_KEY);

    let strQry = `select u.id_usuario, u.id_persona, u.usuario, p.nombres, p.primer_apellido, p.segundo_apellido, p.genero, u.estado_registro  
                  from seguridad_v2.usuario u
                  join seguridad_v2.persona p on (p.id_persona = u.id_persona)
                  where u.estado_registro = 1
                  and p.estado_registro = 1
                  and u.id_usuario = $1`;
    const usuariores = await conexionPG.query(strQry, [id_usuario]);

    if (!usuariores.rows[0].estado_registro) {
      return res.status(401).json({
        estado: 0,
        mensaje: "Usuario no activo",
      });
    }

    let nombresOperador = usuariores.rows[0].nombres;
    let primerApellidoOperador = usuariores.rows[0].primer_apellido;
    let segundoApellidoOperador = usuariores.rows[0].segundo_apellido;
    let generoOperador = usuariores.rows[0].genero;

    let query = `select id_rol, id_sistema, id_modulo
                  from seguridad_v2.usuario_sistema_modulo_rol 
                  where estado_registro = 1 
                  and id_usuario = $1 
                  and id_sistema = $2`;

    let roles = await conexionPG.query(query, [id_usuario, id_sistema]);
    roles = roles.rows;

    let strQuery = `select a.id_area, a.cod_area, a.nombre as nombre_area, 
                    (select tipo_oficina from seguridad_v2.areas where cod_area = a.dependencia) as tipo_oficina_dependencia,
                    (select nombre from seguridad_v2.areas where cod_area = a.dependencia) as dependencia, 
                    a.dependencia as cod_area_dependencia, c.titulo as cargo  
                    from seguridad_v2.usuario u 
                    join seguridad_v2.usuario_departamento_oficina_areas udoa on (udoa.id_usuario = u.id_usuario) 
                    join seguridad_v2.areas a on (a.id_area = udoa.id_area)
                    join seguridad_v2.persona_grado_cargo pgc on (pgc.id_persona = u.id_persona)
                    join seguridad_v2.cargo c on (c.id_cargo = pgc.id_cargo)
                    where u.estado_registro = 1
                    and udoa.estado_registro = 1
                    and a.estado_registro = 1
                    and pgc.estado_registro = 1
                    and u.id_usuario = $1`;

    let areas = await conexionPG.query(strQuery, [id_usuario]);
    areas = areas.rows;
    
    req.body.id_entidad = id_entidad;
    req.body.id_oficina = id_oficina;
    req.body.usuario = usuario;
    req.body.id_usuario = id_usuario;
    req.body.cod_oficina = cod_oficina;
    req.body.id_area = areas[0].id_area;
    req.body.nombre_oficina = nombre_oficina;
    req.body.id_adm_sistema = id_sistema;
    req.body.nombres = nombresOperador;
    req.body.primer_apellido = primerApellidoOperador;
    req.body.segundo_apellido = segundoApellidoOperador;
    req.body.genero = generoOperador;
    req.body.cod_area = areas[0].cod_area;
    req.body.nombre_area = areas[0].nombre_area;
    req.body.tipo_oficina_dependencia = areas[0].tipo_oficina_dependencia;
    req.body.dependencia = areas[0].dependencia;
    req.body.cod_area_dependencia = areas[0].cod_area_dependencia;
    req.body.cargo = areas[0].cargo;
    req.body.roles = roles;
    
    next();
  } catch (error) {
    return res.status(401).json({
      estado: 0,
      mensaje: "Token no válido",
    });
  }
};

module.exports = {
  validarJWT,
};
