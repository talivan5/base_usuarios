const conexionPG = require('../config/config-pg');
const bcrypt = require('bcrypt');
const registrarSistema = async(req, res)=>{
    let {
        cod_sistema,
        nombre,
        cliente,
        descripcion
    } = req.body;
    let consulta = `insert into seguridad_v2.sistema(cod_sistema, nombre, descripcion,cliente)
            values ($1, $2, $3, $4) RETURNING *`;
    try {
        let resultados = await conexionPG.query(consulta, [cod_sistema, nombre, descripcion,cliente]);
        res.status(200).json({
            codigo: 1,
            mensaje: 'Se asigno rol correctamente',
            contenido: resultados.rows[0]
        });
    } catch (error) {
        res.status(500).json({
            codigo: 0,
            mensaje: 'Ocurrio un error al Guardar'});
    }
};
const actualizarSistema = async(req, res)=>{
    let {
        id_sistema,
        cod_sistema,
        nombre,
        cliente,
        descripcion
    } = req.body;
    let consulta = `update seguridad_v2.sistema set cod_sistema=$1, nombre=$2, descripcion=$3,cliente=$4 where id_sistema=$5`;
    try {
        let resultados = await conexionPG.query(consulta, [cod_sistema, nombre, descripcion,cliente, id_sistema]);
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
const obtenerSistemas = async(req, res)=>{
    let {
        cod_sistema,
        nombre,
        cliente,
        descripcion
    } = req.body;
    let consulta = `select * from seguridad_v2.sistemas where estado_registro=1`;
    try {
        let resultados = await conexionPG.query(consulta);
        res.status(200).json({
            codigo: 1,
            mensaje: 'Se asigno rol correctamente',
            contenido: resultados.rows
        });
    } catch (error) {
        res.status(500).json({
            codigo: 0,
            mensaje: 'Ocurrio un error'});
    }
}
const actualizarLlaveSistema = async(req, res)=>{
    let {
        id_sistema,
        cliente
    } = req.body;
    let consulta = `update seguridad_v2.sistemas set cliente=$1 where id_sistema=$2`;
    try {
        let resultados = await conexionPG.query(consulta,[cliente, id_sistema]);
        res.status(200).json({
            codigo: 1,
            mensaje: 'Se actualizo correctamente',
            contenido: resultados.rows
        });
    } catch (error) {
        res.status(500).json({
            codigo: 0,
            mensaje: 'Ocurrio un error'});
    }
}
module.exports ={
    registrarSistema,
    actualizarSistema,
    obtenerSistemas,
    actualizarLlaveSistema
}