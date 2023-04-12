const {Schema, model, mongoose} = require('mongoose');

const usuarioSchema = Schema({
    usr_usuario:{
        type:String,
        require:[true, 'El usuario es obligatorio']
    },
    usr_password:{
        type:String,
        require:[true, 'El password es obligatorio']
    },
    id_persona:{
        type:Number
    },
    id_oficina: {
        type: Number
    },
    id_entidad: {
        type: Number
    },
    id_usuario: {
        type: Number
    }
});

usuarioSchema.methods.toJSON = function(){
    const { _id, ...usuario} = this.toObject();
    usuario.id_persona = _id;
    return usuario;
}

module.exports = model('Usuario', usuarioSchema)
