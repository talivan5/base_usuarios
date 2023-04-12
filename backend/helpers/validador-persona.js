const conexionPG = require('../config/config-pg');
const Persona = require('../models/persona.model')
const { response, request } = require('express');
const personaExiste= async (req, res, next)=>{
    const body = new Persona(req.body);
    const {per_nombres,per_primer_apellido, per_segundo_apellido, per_numero_documento}=body;
    //console.log(per_nombres,per_primer_apellido, per_segundo_apellido, per_numero_documento);
    const usuarioExist = await conexionPG.query(`SELECT * FROM seguridad_v2.persona WHERE nombres = trim($1) and primer_apellido=trim($2) and segundo_apellido=trim($3) and nro_documento=$4`,[per_nombres.toUpperCase(), per_primer_apellido.toUpperCase(), per_segundo_apellido.toUpperCase(), per_numero_documento]);
    if(usuarioExist.rowCount > 0) {
        return res.status(401).json({
            codigo: 0,
            mensaje:`La persona ${per_nombres} ${per_primer_apellido} ${per_segundo_apellido} con CI: ${per_numero_documento} ya se encuentra registrada`
        })
    }
    next();
};

module.exports={
    personaExiste
}