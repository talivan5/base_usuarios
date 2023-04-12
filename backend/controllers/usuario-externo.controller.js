const conexionPG = require('../config/config-pg');
const Usuario = require('../models/usuario.model');
const bcrypt = require('bcrypt');
const crearUsuarioExt = async(req, res)=>{
    const body = new Usuario(req.body);
    // console.log(body)
    const {id_adm_sistema, id_entidad} = req.body;
    let {
        usr_usuario,
        usr_password,
        id_persona,
    } = body;
    let consulta = `insert into seguridad_v2.usuario(usuario, password, id_persona, id_entidad)
            values (trim($1), $2, $3, $4) RETURNING *`;
    try {
        let resultados = await conexionPG.query(consulta, [usr_usuario.toUpperCase(), bcrypt.hashSync(usr_password, 10), id_persona, id_entidad]);
        const {id_usuario} = resultados.rows[0];
        const consultaRol = `insert into seguridad_v2.usuario_rol(id_rol, id_usuario, id_sistema) values ($1, $2, $3) RETURNING *`;
        let asignar_rol = await conexionPG.query(consultaRol,[4,id_usuario,id_adm_sistema]);
        res.status(200).json({
            codigo: 1,
            mensaje: 'Se guardo correctamente'
        });
   } catch (error) {
        res.status(500).json({
            codigo: 0,
            mensaje: 'Ocurrio un error al Guardar'});
    }
}
const actualizarUsuarioExt = async(req, res)=>{
    const body = new Usuario(req.body);
    // console.log(body)
    const {id_adm_sistema, id_entidad} = req.body;
    let {
        id_usuario,
        usr_usuario,
        usr_password,
        id_persona,
    } = body;
    let consulta = `update seguridad_v2.usuario set usuario=trim($1), password=trim($2), id_persona=$3, id_entidad=$4 where id_usuario=$5`;
    try {
        let resultados = await conexionPG.query(consulta, [usr_usuario.toUpperCase(), bcrypt.hashSync(usr_password, 10), id_persona, id_entidad, id_usuario]);
        res.status(200).json({
            codigo: 1,
            mensaje: 'Se actualizo correctamente!!'
        });
    } catch (error) {
        res.status(500).json({
            codigo: 0,
            mensaje: 'Ocurrio un error al Guardar'});
    }
}
const obtenerUsuarioExt = async(req, res)=>{
    const body = new Usuario(req.body);
    // console.log(body)
    const {id_adm_sistema, id_entidad} = req.body;
    let consulta = `select * from seguridad_v2.usuario where id_entidad=$1`;
    try {
        let resultados = await conexionPG.query(consulta,[id_entidad]);
        res.status(200).json({
            codigo: 1,
            mensaje: 'Se actualizo correctamente',
            contenido: resultados.rows
        });
    } catch (error) {
        res.status(500).json({
            codigo: 0,
            mensaje: 'Ocurrio un error al Guardar'});
    }
}

module.exports ={
    crearUsuarioExt,
    actualizarUsuarioExt,
    obtenerUsuarioExt
}