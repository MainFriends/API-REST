const mysqlConnect = require('../config');

const getDetail = (req, res) => {
    const sp = 'CALL SP_SELL_PURCHASE_DETAIL(?)';
    mysqlConnect.query(sp,[0], (err, result) => {
        if(err){
            res.status(500).send({message: "Error en el servidor."});
        }else{
            res.status(200).json(result[0]);
        }
    });
};

const getDetail = (req, res) => {
    const {codDetail} = req.params;
    const sp = 'CALL SP_SELL_PURCHASE_DETAIL(?)';
    mysqlConnect.query(sp, [codDetail] ,(err, result) => {
        if(err){
            res.status(500).send({message: "Error en el servidor."});
        }else{
            res.status(200).json(result[0])
        }
    });
};

const addDetail = (req,res)=>{
const {
    COD_INVOICE,
    COD_PRODUCT ,
    PRICE,
    CANT_PRODUCTS,
    DISCOUNT,
    TOTAL
}= req.body;

const sp = 'CALL SP_ADD_PURCHASE_DETAIL(?,?,?,?,?,?,?,?)';

mysqlConnect.query(sp,
[
    COD_INVOICE,
    COD_PRODUCT ,
    PRICE,
    CANT_PRODUCTS,
    DISCOUNT,
    TOTAL
], (err) => {
    if(err){
        res.status(400).send({message: err.message});
    }else{
        res.status(201).send({message: 'Accion completada.'});
    }
}); 
};  

const updateDetail = (req,res)=>{
    const {codDetail} = req.params;
    const {
        COD_INVOICE,
        COD_PRODUCT ,
        PRICE,
        CANT_PRODUCTS,
        DISCOUNT,
        TOTAL
    }= req.body;

    const sp = 'CALL SP_ADD_PURCHASE_PURCHASE(?,?,?,?,?,?,?,?)';

    mysqlConnect.query(sp,
        [
            COD_INVOICE,
            COD_PRODUCT ,
            PRICE,
            CANT_PRODUCTS,
            DISCOUNT,
            TOTAL
        ], (err) => {
            if(err){
                res.status(400).send({message: err.message});
            }else{
                res.status(201).send({message: 'Accion completada.'});
            }
        }); 
        };  

        const deleteDetail = (req, res) => {
            const {codDetail} = req.params;
            const sp = 'CALL SP_DEL_PURCHASE_DETAIL(?)';
            mysqlConnect.query(sp,[codDetail], (err) => {
                if(err){
                    res.status(304).send({message: err.message});
                }else{
                    res.status(200).send({message: 'Accion completada.'});
                }
            })
        };

        module.exports = {
            getDetail,
            getDetail,
            addDetail,
            updateDetail,
            deleteDetail
        };

