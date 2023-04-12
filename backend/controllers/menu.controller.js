const conexionPG = require('../config/config-pg');


    const registrarMenu = async (req, res)=> {
        const {par_nombre, par_url, par_icon, par_modulo} = req.body;
        const query = `INSERT INTO seguridad_v2.menu(nombre, url, icon, id_modulo) VALUES ($1, $2, $3, $4)`
        try {
            const respuesta = await conexionPG.query(query, [par_nombre, par_url, par_icon, par_modulo]);
            res.status(200).json({
                estado: 1,
                mensaje: 'Se registro con exito!!'
            })
        } catch (error) {
            res.status(500).json({
                estado: 1,
                mensaje: 'Error al registrar'
            })
        }
    }

    const editarMenu = async (req, res)=> {
        const {par_menu, par_nombre, par_url, par_icon, par_modulo} = req.body;
        const query = `UPDATE seguridad_v2.menu SET nombre=$1, url=$2, icon=$3, id_modulo=$4 WHERE id_menu=$5`
        try {
            const respuesta = await conexionPG.query(query, [par_nombre, par_url, par_icon, par_modulo, par_menu]);
            res.status(200).json({
                estado: 1,
                mensaje: 'Se actualizo con exito!!'
            })
        } catch (error) {
            res.status(500).join({
                estado: 1,
                mensaje: 'Error al registrar'
            })
        }
    }
    const obtenerMenu = async (req, res)=> {
        const query = `SELECT id_menu, nombre, url, icon, id_modulo from seguridad_v2.menu WHERE estado_registro=1`
        try {
            const respuesta = await conexionPG.query(query);
            res.status(200).json({
                estado: 1,
                mensaje: 'Respuesta con exito!!',
                contenido: respuesta.rows
            })
        } catch (error) {
            res.status(500).json({
                estado: 1,
                mensaje: 'Error al registrar'
            })
        }
    }

    module.exports ={
        registrarMenu,
        editarMenu,
        obtenerMenu
    }