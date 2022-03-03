const mysqlConnect = require('../config');

const getPurchaseinv = (req, res) => {
    query = 'SELECT * FROM PURCHASE_INVOICE';
    mysqlConnect.query(query, (err, result) => {
        if(err){
            res.status(500).send({message: "Error en el servidor."});
        }else{
            res.status(200).json(result);
        }
    });
};

const getPurchaseinv = (req, res) => {
    const {codInvoice} = req.params;
    query = `SELECT * FROM PURCHASE_INVOICE WHERE COD_INVOICE = ${codInvoice}`;
    mysqlConnect.query(query, (err, result) => {
        if(err){
            res.status(500).send({message: "Error en el servidor."});
        }else{
            res.status(200).json(result)
        }
    });
};

const addPurchase = (req,res)=>{
const {
    SUBTOTAL,
    TOT_DISCOUNT ,
    TOT_ISV,
    TOT_PURCHASE,
    TYP_TO_PURCHASE,
    COD_TYP_PAY,
    DAT_INVOICE,
    COD_ORDER
}= req.body;

const sp = 'CALL SP_ADD_PURCHASE_INVOICE(?,?,?,?,?,?,?,?)';

mysqlConnect.query(sp,
[
    SUBTOTAL,
    TOT_DISCOUNT ,
    TOT_ISV,
    TOT_PURCHASE,
    TYP_TO_PURCHASE,
    COD_TYP_PAY,
    DAT_INVOICE,
    COD_ORDER
], (err) => {
    if(err){
        res.status(400).send({message: err.message});
    }else{
        res.status(201).send({message: 'La factura se ha creado correctamente.'});
    }
}); 
};  

const updatePurchase = (req,res)=>{
    const {codInvoice} = req.params;
    const {
        SUBTOTAL,
        TOT_DISCOUNT ,
        TOT_ISV,
        TOT_PURCHASE,
        TYP_TO_PURCHASE,
        COD_TYP_PAY,
        DAT_INVOICE,
        COD_ORDER
    }= req.body;

    const sp = 'CALL SP_ADD_PURCHASE_INVOICE(?,?,?,?,?,?,?,?)';

    mysqlConnect.query(sp,
        [
            SUBTOTAL,
            TOT_DISCOUNT ,
            TOT_ISV,
            TOT_PURCHASE,
            TYP_TO_PURCHASE,
            COD_TYP_PAY,
            DAT_INVOICE,
            COD_ORDER
        ], (err) => {
            if(err){
                res.status(400).send({message: err.message});
            }else{
                res.status(201).send({message: 'La factura se ha actualizado correctamente.'});
            }
        }); 
        };  





