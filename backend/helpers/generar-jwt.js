const jwt = require('jsonwebtoken');

const generarJWT = ( data = '' ) => {

    return new Promise( (resolve, reject) => {

        jwt.sign( data, process.env.SECRET_KEY, {
            expiresIn: process.env.CADUCIDAD_TOKEN
        }, (err, token) => {
            if( err ){
                // console.log(err);
                reject('No se pudo generar token')
            } else {
                resolve(token);
            }
        })
    })
};

module.exports = {
    generarJWT
};