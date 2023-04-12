const express = require('express');
const cors = require('cors');
const { conexionPG } = require('../config/config-pg');
const app = express();
const server = require('http').Server(app);

class Server {
    constructor(){
        this.app = express()
        this.port = process.env.APP_PORT;
        this.path='/api';
        this.loginPath = '/api/login';
        this.externoPath = '/wsconvenio/api/';

       // console.log(this.loginPath)
        this.middelwares();
        //Ruras de mi aplicacion
        this.routes();

    }
    middelwares(){
        //CORS
        this.app.use(cors());
        // Lectura y parseo del body
        this.app.use( express.json() );//todo se cambiara a Json
        //Directorio publico
        this.app.use(express.static('public'));
    }
    routes(){
        this.app.use(this.loginPath, require('./login.routing'));
        this.app.use(this.path, require('./persona.routing'));
        this.app.use(this.path, require('./usuario.routing'));
        this.app.use(this.path, require('./obtener-roles.routing'))
        this.app.use(this.path, require('./rol.routing'));
        this.app.use(this.path, require('../routes/sistema.routing'));
        this.app.use(this.path, require('../routes/menu.routing'));
        this.app.use(this.path, require('../routes/sub-menu.routing'));
        this.app.use(this.path, require('../routes/menu_sub_menu.routing'));
        //servecios externos
        this.app.use(this.externoPath, require('./persona-externo.routing'));
        this.app.use(this.externoPath, require('./usuario-externo.routing'));
    }
    listen() {
        this.app.listen(this.port, () => {
            console.log('Servidor corriendo en puerto', this.port);
        });
    }
}



module.exports = Server;
