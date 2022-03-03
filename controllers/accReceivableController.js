const mysqlConnect = require('../config');

const getAccReceivables = (req, res) => {
    const sp = "CALL SP_SEL_ACCOUNTS_RECEIVABLE(?)";
    mysqlConnect.query(sp, [0], (err, result) => {
        if(err) {
            res.status(500).send({message: 'Error en el servidor'});
        }else{
            res.status(200).json(result[0]);
        }
    })
}

const getAccReceivable = (req, res) => {
    const {codAccReceivable} = req.params;
    const sp = "CALL SP_SEL_ACCOUNTS_RECEIVABLE(?)";
    mysqlConnect.query(sp,[codAccReceivable], (err, result) => {
        if(err){
            res.status(500).send({message: 'Error en el servidor'});
        }else{
            res.status(200).json(result[0]);
        }
    });
}

const addAccReceivable = (req, res) => {
    const {
        COD_INVOICE,
        DESCRIPTION, 
        TOT_BALANCE,
        DAT_LIMIT
    } = req.body;

    const sp = "CALL SP_INS_ACCOUNTS_RECEIVABLE(?,?,?,?)";

    mysqlConnect.query(sp, [
        COD_INVOICE,
        DESCRIPTION, 
        TOT_BALANCE,
        DAT_LIMIT
    ], (err) => {
        if(err) {
            res.status(4000).send({message: err.message});
        }else{
            res.status(201).send({message: 'La planilla se ha registrado correctamente'});
        }
    })
}

module.exports = {
    getAccReceivables,
    getAccReceivable,
    addAccReceivable
}