const {Schema, model, mongoose} = require('mongoose');

const personaSchema = Schema({
    per_nombres:{
        type:String,
        require:[true, 'El nombre es obligatorio']
    },
    per_primer_apellido:{
        type:String,
        require:[true, 'El apellido es obligatorio']
    },
    per_segundo_apellido:{
        type:String,
        require:[true, 'El apellido es obligatorio']
    },
    per_otro_apellido:{
        type:String
    },
    per_fecha_nacimiento: {
        type: Date,
        required: [true, 'La fecha de nacimiento es obligatorio']
    },
    per_email: {
        type: String,
        required: [true, 'el email es obligatorio'],
        unique:true
    },
    per_direccion: {
        type: String,
        required: [true, 'La dirección es obligatorio']
    },
    per_estado_registro: {
        type: Number
    },
    per_numero_documento: {
        type: String,
        required: [true, 'La dirección es obligatorio']
    },
    par_genero: {
        type: String,
        required: [true, 'La dirección es obligatorio']
    },
    par_tipo_documento: {
        type: String,
        required: [true, 'La dirección es obligatorio']
    },
    par_nacionalidad: {
        type: String,
        required: [true, 'La dirección es obligatorio']
    },
    id_entidad: {
        type: Number
    },
    par_id_entidad:{
        type: Number
    }
});

personaSchema.methods.toJSON = function(){
    const { _id, ...persona} = this.toObject();
    persona.id_persona = _id;
    return persona;
}

module.exports = model('Persona', personaSchema)
