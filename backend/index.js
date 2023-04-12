require('dotenv').config();
//const express = require('express');
//const app = express();
const Server = require('./routes/index');

const server = new Server();




server.listen();
