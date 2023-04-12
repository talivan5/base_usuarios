const conexionPG = require('../config/config-pg');

const registrarSubMenu = async (req, res) =>{
    const { par_nombre, par_url, par_icon, par_sistema } = req.body;
    const query = `INSERT INTO seguridad_v2.sub_menu(nombre, url, icon, id_sistema) VALUES ($1, $2, $3, $4)`;
    try{
        let respuesta = await conexionPG.query(query, [par_nombre, par_url, par_icon, par_sistema]);
        res.status(200).json({
            estado:1,
            mensaje:'Registro exitoso!!'
        })
    }catch (error) {
        res.status(500).json({
            estado:0,
            mensaje:'Error en el servidor!!'
        })
    }
}
const editarSubMenu = async (req, res) =>{
    const { par_sub_menu, par_nombre, par_url, par_icon, par_sistema } = req.body;
    const query = `UPDATE seguridad_v2.sub_menu SET nombre=$1, url=$2, icon=$3, id_sistema=$4 WHERE id_sub_menu=$5`;
    try{
        let respuesta = await conexionPG.query(query, [par_nombre, par_url, par_icon, par_sistema,par_sub_menu]);
        res.status(200).json({
            estado:1,
            mensaje:'Registro exitoso!!'
        })
    }catch (error) {
        res.status(500).json({
            estado:0,
            mensaje:'Error en el servidor!!'
        })
    }
}
const obtenerSubMenu = async (req, res) =>{

    const query = `SELECT id_sub_menu, nombre, url, icon, id_sistema from seguridad_v2.sub_menu  WHERE estado_registro=1`;
 //   try{
        let respuesta = await conexionPG.query(query);

        res.status(200).json({
            estado:1,
            mensaje:'Consulta exitosa!!',
            contenido:respuesta.rows
        })
   /* }catch (error) {
        res.status(500).json({
            estado:0,
            mensaje:'Error en el servidor!!'
        })
    }*/
}

module.exports = {
    registrarSubMenu,
    editarSubMenu,
    obtenerSubMenu
}