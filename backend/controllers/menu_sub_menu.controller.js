const conexionPG = require('../config/config-pg')

const registrarMenuSubMenu = async (req, res )=>{
    const {par_menu, par_sub_menu} = req.body;
    const query = `INSERT INTO seguridad_v2.menu_sub_menu(id_menu, id_sub_menu) VALUES($1, $2)`
    try {
        const respuesta = await conexionPG.query(query, [par_menu, par_sub_menu]);
        res.status(200).json({
            estado:1,
            mensaje:'Se registro con exito!!'
        })
    } catch (error) {
        res.status(500).json({
            estado:0,
            mensaje:'Error en el servidor!!'
        })
    }
};

const editarMenuSubMenu = async (req, res )=>{
    const {par_menu_sub_menu, par_menu, par_sub_menu} = req.body;
    const query = `UPDATE seguridad_v2.menu_sub_menu SET id_menu=$1, id_sub_menu=$2 WHERE id_menu_sub_menu=$3`
    try {
        const respuesta = await conexionPG.query(query, [par_menu, par_sub_menu, par_menu_sub_menu]);
        res.status(200).json({
            estado:1,
            mensaje:'Se actualizo con exito!!'
        })
    } catch (error) {
        res.status(500).json({
            estado:0,
            mensaje:'Error en el servidor!!'
        })
    }
};

const obtenerMenuSubMenu = async (req, res )=>{
    const query = `select id_menu, id_sub_menu, id_menu_sub_menu from seguridad_v2.menu_sub_menu WHERE estado_registro=1`
    try {
        const respuesta = await conexionPG.query(query);
        res.status(200).json({
            estado:1,
            mensaje:'Se actualizo con exito!!',
            contenido: respuesta.rows
        })
    } catch (error) {
        res.status(500).json({
            estado:0,
            mensaje:'Error en el servidor!!'
        })
    }
}


module.exports = {
    registrarMenuSubMenu,
    editarMenuSubMenu,
    obtenerMenuSubMenu
}