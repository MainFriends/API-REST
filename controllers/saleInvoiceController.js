const mysqlConnect = require('../config');

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
    addInvoice
};