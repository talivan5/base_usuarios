const conexionPG = require('../config/config-pg');
const Persona = require('../models/persona.model')
const crearPersona = async(req, res)=>{
    const body = new Persona(req.body);
    // console.log(body)
    let {
        per_nombres,
        per_primer_apellido,
        per_segundo_apellido,
        per_otro_apellido,
        per_fecha_nacimiento,
        per_email,
        per_direccion,
        per_numero_documento,
        par_genero,
        par_tipo_documento,
        par_nacionalidad,
        par_id_entidad
    } = body;
    const consulta = `insert into seguridad_v2.persona (nombres, primer_apellido, segundo_apellido, 
        otro_apellido, fecha_nacimiento, email, direccion,
        nro_documento, genero, tipo_documento, nacionalidad, id_entidad) 
        values (trim($1), trim($2), trim($3), trim($4), $5, $6, $7, $8, $9, $10, $11, $12) RETURNING *`;
    try {
        let resultados = await conexionPG.query(consulta, [per_nombres.toUpperCase(), per_primer_apellido.toUpperCase(), per_segundo_apellido.toUpperCase(),
            per_otro_apellido.toUpperCase(), per_fecha_nacimiento, per_email, per_direccion,
            per_numero_documento, par_genero, par_tipo_documento,par_nacionalidad, par_id_entidad]);
        res.status(200).json({
            codigo: 1,
            mensaje: 'Se guardo correctamente',
            contenido: resultados.rows[0]
        });
    } catch (error) {
        res.status(500).json({
            codigo: 0,
            mensaje: 'Ocurrio un error al Guardar'});
    }

}
const actualizarPersona = async(req, res)=>{
    const body = new Persona(req.body);
    // console.log(body)
    let {
        id_persona,
        per_nombres,
        per_primer_apellido,
        per_segundo_apellido,
        per_otro_apellido,
        per_fecha_nacimiento,
        per_email,
        per_direccion,
        per_numero_documento,
        par_genero,
        par_tipo_documento,
        par_nacionalidad,
        par_id_entidad
    } = body;
    const consulta = `update seguridad_v2.persona set nombres=trim($1), primer_apellido=trim($2), segundo_apellido=trim($3), 
        otro_apellido=trim($4), fecha_nacimiento=$5, email=$6, direccion=$7,
        nro_documento=$8, genero=$9, tipo_documento=$10, nacionalidad=$11, id_entidad=$12 where id_persona=$13`;
    try {
        let resultados = await conexionPG.query(consulta, [per_nombres.toUpperCase(), per_primer_apellido.toUpperCase(), per_segundo_apellido.toUpperCase(),
            per_otro_apellido.toUpperCase(), per_fecha_nacimiento, per_email, per_direccion,
            per_numero_documento, par_genero, par_tipo_documento,par_nacionalidad, par_id_entidad, id_persona]);
        res.status(200).json({
            codigo: 1,
            mensaje: 'Se guardo correctamente',
            contenido: resultados.rows[0]
        });
    } catch (error) {
        res.status(500).json({
            codigo: 0,
            mensaje: 'Ocurrio un error al Guardar'});
    }

}

module.exports ={
    crearPersona,
    actualizarPersona
}