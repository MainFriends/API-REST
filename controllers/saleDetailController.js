const mysqlConnect = require('../config');

const getDetail = (req, res) => {
    const {codInvoice} = req.params;
    const query = `SELECT COD_DETAIL, COD_INVOICE, INVENTORY.COD_PRODUCT, NAM_PRODUCT, PRICE, CANT_PRODUCTS, DISCOUNT, TOTAL
    FROM SALE_DETAIL, INVENTORY
    WHERE INVENTORY.COD_PRODUCT = SALE_DETAIL.COD_PRODUCT
    AND COD_INVOICE = ${codInvoice}`;

    mysqlConnect.query(query, (err, result) => {
        if(err){
            res.status(500).send({message: "Error en el servidor."});
        }else{
            res.status(200).json(result);
        }
    })
};

const addDetail = (req, res) => {
    const data = req.body;
    const sp = 'CALL SP_INS_SALE_DETAIL(?,?,?,?,?)';
    
    data.forEach(detail => {
        const {
            COD_PRODUCT,
            PRICE,
            CANT_PRODUCTS,
            DISCOUNT,
            TOTAL
        } = detail;

        mysqlConnect.query(sp, [
            COD_PRODUCT,
            PRICE,
            CANT_PRODUCTS,
            DISCOUNT,
            TOTAL
        ]);
    })

    res.status(201).send({message: 'Transacción completada.'})
};

module.exports = {
    getDetail,
    addDetail
}