const mysqlConnect = require('../config');

const getUsers = (req, res) => {
    query = 'SELECT * FROM USER';
    mysqlConnect.query(query, (err, result) => {
        if(err){
            res.status(500).send({message: "Error en el servidor."});
        }else{
            res.status(200).json(result);
        }
    });
};

const getUser = (req, res) => {
    const {codUser} = req.params;
    query = `SELECT * FROM USER WHERE COD_USER = ${codUser}`;
    mysqlConnect.query(query, (err, result) => {
        if(err){
            res.status(500).send({message: "Error en el servidor."});
        }else{
            res.status(200).json(result)
        }
    });
};

const addUser = (req, res) => {
    const {
        IDENTITY,
        FIRST_NAME,
        MIDDLE_NAME,
        LAST_NAME,
        GENDER,
        NUM_PHONE_ONE,
        NUM_PHONE_TWO = null,
        NUM_PHONE_REFERENCE,
        DAT_BIRTHDAY,
        NAM_CITY,
        ADDRESS,
        IMG_USER = null,
        COD_ROLE,
        USER_EMAIL,
        USER_PASSWORD
    } = req.body;

    const sp = 'CALL SP_INS_USER(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)';

    mysqlConnect.query(sp,
    [
        IDENTITY,
        FIRST_NAME,
        MIDDLE_NAME,
        LAST_NAME,
        GENDER,
        NUM_PHONE_ONE,
        NUM_PHONE_TWO,
        NUM_PHONE_REFERENCE,
        DAT_BIRTHDAY,
        NAM_CITY,
        ADDRESS,
        IMG_USER,
        COD_ROLE,
        USER_EMAIL,
        USER_PASSWORD
    ], (err) => {
        if(err){
            res.status(400).send({message: err.message});
        }else{
            res.status(201).send({message: 'El usuario ha sido creado correctamente.'});
        }
    });
};

const updateUser = (req, res) => {
    const {codUser} = req.params;
    const {
        IDENTITY,
        FIRST_NAME,
        MIDDLE_NAME,
        LAST_NAME,
        GENDER,
        NUM_PHONE_ONE,
        NUM_PHONE_TWO = null,
        NUM_PHONE_REFERENCE,
        DAT_BIRTHDAY,
        NAM_CITY,
        ADDRESS,
        IMG_USER = null,
        COD_ROLE,
        USER_EMAIL,
        USER_PASSWORD
    } = req.body;

    const sp = 'CALL SP_UPD_USER(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)';

    mysqlConnect.query(sp,
        [   
            codUser,
            IDENTITY,
            FIRST_NAME,
            MIDDLE_NAME,
            LAST_NAME,
            GENDER,
            NUM_PHONE_ONE,
            NUM_PHONE_TWO,
            NUM_PHONE_REFERENCE,
            DAT_BIRTHDAY,
            NAM_CITY,
            ADDRESS,
            IMG_USER,
            COD_ROLE,
            USER_EMAIL,
            USER_PASSWORD
        ], (err) => {
            if(err){
                res.status(304).send({message: err.message});
            }else{
                res.status(200).send({message: 'El usuario ha sido modificado.'});
            }
        });
}

const deleteUser = (req, res) => {
    const {codUser} = req.params;
    const query = `DELETE FROM USER WHERE COD_USER = ${codUser}`;
    mysqlConnect.query(query, (err) => {
        if(err){
            res.status(304).send({message: err.message});
        }else{
            res.status(200).send({message: 'El usuario ha sido eliminado exitosamente.'});
        }
    })
};

module.exports = {
    getUsers,
    getUser,
    addUser,
    updateUser,
    deleteUser
};