const mysqlConnect = require('../config');

const getInvoices = (req, res) => {
    const query = `SELECT COD_INVOICE, CONCAT(CLIENT.FIRST_NAME, ' ', CLIENT.LAST_NAME) CLIENT, 
    CONCAT(USER.FIRST_NAME, ' ', USER.LAST_NAME) USER,
    SUBTOTAL, TOT_DISCOUNT, TOT_ISV, TYP_TO_SALE, NAM_TYPE_PAY, DAT_INVOICE
    FROM CLIENT, USER, SALES_INVOICE, TYPE_TO_PAY
    WHERE CLIENT.COD_CLIENT = SALES_INVOICE.COD_CLIENT
    AND USER.COD_USER = SALES_INVOICE.COD_USER
    AND TYPE_TO_PAY.COD_TYP_PAY = SALES_INVOICE.COD_TYP_PAY`;

    mysqlConnect.query(query, (err, result) => {
        if(err){
            res.status(500).send({message: "Error en el servidor."});
        }else{
            res.status(200).json(result);
        }
    })
}

const getInvoice = (req, res) => {
    const {codInvoice} = req.params;

    const query = `SELECT COD_INVOICE, CONCAT(CLIENT.FIRST_NAME, ' ', CLIENT.LAST_NAME) CLIENT, 
    CONCAT(USER.FIRST_NAME, ' ', USER.LAST_NAME) USER,
    SUBTOTAL, TOT_DISCOUNT, TOT_ISV, TYP_TO_SALE, NAM_TYPE_PAY, DAT_INVOICE
    FROM CLIENT, USER, SALES_INVOICE, TYPE_TO_PAY
    WHERE CLIENT.COD_CLIENT = SALES_INVOICE.COD_CLIENT
    AND USER.COD_USER = SALES_INVOICE.COD_USER
    AND TYPE_TO_PAY.COD_TYP_PAY = SALES_INVOICE.COD_TYP_PAY
    AND COD_INVOICE = ${codInvoice}`;

    mysqlConnect.query(query, (err, result) => {
        if(err){
            res.status(500).send({message: "Error en el servidor."});
        }else{
            res.status(200).json(result);
        }
    })
}

const addInvoice = (req, res) => {
    const {
        COD_CLIENT,
        COD_USER, 
        SUBTOTAL,
        TOT_DISCOUNT,
        TOT_ISV,
        TOT_SALE,
        TYP_TO_SALE,
        COD_TYP_PAY 
    } = req.body;

    const sp = 'CALL SP_INS_SALE_INVOICE(?,?,?,?,?,?,?,?)';

    mysqlConnect.query(sp, [
        COD_CLIENT,
        COD_USER, 
        SUBTOTAL,
        TOT_DISCOUNT,
        TOT_ISV,
        TOT_SALE,
        TYP_TO_SALE,
        COD_TYP_PAY 
    ], (err) => {
        if(err){
            res.status(400).send({message: err.message});
        }else{
            res.status(201).send({message: 'Transacción completada.'});
        }
    })
}

module.exports = {
    getInvoices,
    getInvoice,
    addInvoice
};