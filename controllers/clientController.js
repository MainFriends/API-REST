const { NULL } = require('mysql/lib/protocol/constants/types');
const mysqlConnect= require('../config');


const getClients=(req,res) => {
    const query= 'SELECT * FROM CLIENT'
    mysqlConnect.query(query,(err,result) => {

        if(err){ 
            res.status(500). send({message:'ERROR EN EL SERVIDOR'});
        }else{
        res.status(200).json(result);
        }
    });
};
const AddClient=  (req,res) =>{
    const {
        IDENTITY,
        FIRST_NAME,
        LAST_NAME,
        ADDRESS ,
        NUM_PHONE_ONE,
        NUM_PHONE_TWO = NULL,
        RTN 
    } = req.body

    console.log(req.body)




    const sp= 'CALL SP_INS_CLIENT(?,?,?,?,?,?,?)';
    mysqlConnect.query(sp,[

        IDENTITY,
        FIRST_NAME,
        LAST_NAME,
        ADDRESS,
        NUM_PHONE_ONE,
        NUM_PHONE_TWO,
        RTN


    ], (err)=> {

        if(err){
            res.status(400). send({message: err.message});
        }else{
            res.status(201).send({message:'El cliente  no ha sido registrado correctamente'});
        }
    });

}

const UpdateClient= (req,res) =>{
    const {
        IDENTITY,
        FIRST_NAME,
        LAST_NAME,
        ADDRESS ,
        NUM_PHONE_ONE,
        NUM_PHONE_TWO=null,
        RTN= null

    } = req.body

    console.log(req.body)




    const sp= 'CALL SP_UPD_CLIENT (?,?,?,?,?,?,?)';
    mysqlConnect.query(sp,[

        IDENTITY,
        FIRST_NAME,
        LAST_NAME,
        ADDRESS ,
        NUM_PHONE_ONE,
        NUM_PHONE_TWO,
        RTN

    ], (err)=> {

        if(err){
            res.status(400). send({message: err.message});
        }else{
            res.status(201).send({message:'El cliente no ha sido actualizado correctamente'});
        }
    });

}
const deleteClient = (req, res) => {
    const {cod_client} = req.params;
    const sp = `CALL SP_DEL_CLIENT(?)`;
    mysqlConnect.query(sp, [cod_client], (err) => {
        if(err){
            res.status(304).send({message: err.message});
        }else{
            res.status(200).send({message: 'El cliente ha sido eliminado exitosamente.'});
        }
    })
};
module.exports={
    getClients,
    AddClient,
    UpdateClient,
    deleteClient
}


