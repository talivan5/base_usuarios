const conexionPG = require('../config/config-pg');

const usuarioExiste = async(usuario = '')=>{

    const usuarioExist = await conexionPG.query(`SELECT usuario FROM seguridad_v2.usuario WHERE usuario = $1`,[usuario]);

    if(usuarioExist.rowCount > 0) {
        throw new Error(`Ya existe un usuario ${usuario}`);
    }
};
const idPersona = async(id_usario = 0)=>{
    const usuarioRegistrado = await conexionPG.query(`SELECT id_persona FROM seguridad_v2.usuario WHERE id_persona = $1`,[id_usario]);
    if(usuarioRegistrado.rowCount > 0) {
        throw new Error(`La persona ya cuenta con usuario registrado`);
    }
};
const idPersonaExiste = async(id_persona = 0)=>{
    const usuarioRegistrado = await conexionPG.query(`SELECT id_persona FROM seguridad_v2.persona WHERE id_persona = $1`,[id_persona]);
    if(usuarioRegistrado.rowCount <= 0) {
        throw new Error(`La persona no existe`);
    }
};
module.exports={
    usuarioExiste,
    idPersona,
    idPersonaExiste
}