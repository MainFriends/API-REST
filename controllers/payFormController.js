const mysqlConnect = require('../config');

const getPayForms = (req, res) => {
    const query = "SELECT COD_PAY_FORM, FIRST_NAME, LAST_NAME, HOURS_WORKED, AMO_GROSS, BONUS, TOT_DEDUCTIONS, NET_SALARY, DAT_PAYMENT FROM PAY_FORM, USER WHERE USER.COD_USER = PAY_FORM.COD_USER";
    mysqlConnect.query(query, (err, result) => {
        if(err){
            res.status(500).send({message: 'Error en el servidor'});
        }else{
            res.status(200).json(result);
        }
    });
};

module.exports = {
    getPayForms
}