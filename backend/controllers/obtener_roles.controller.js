const conexionPG = require('../config/config-pg');
const Persona = require('../models/persona.model')

const obtenerRoles = async(req, res)=>{
    try {
        res.status(200).json(
            req.body
        );
    } catch (error) {
        res.status(500).json({
            codigo: 0,
            mensaje: 'Ocurrio un error al Guardar'});
    }
}
module.exports ={
    obtenerRoles
}