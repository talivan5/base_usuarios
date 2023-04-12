const conexionPG = require('../config/config-pg');
const bcrypt = require('bcrypt');
const crearUsuarioRol = async(req, res)=>{
    //const body = new Usuario(req.body);
    // console.log(body)
    let {
        id_rol,
        id_usuario,
        id_sistema
    } = req.body;
    let consulta = `insert into seguridad_v2.usuario_rol(id_rol, id_usuario, id_sistema)
            values ($1, $2, $3) RETURNING *`;
     try {
    let resultados = await conexionPG.query(consulta, [id_rol, id_usuario, id_sistema]);
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
}

module.exports ={
    crearUsuarioRol
}