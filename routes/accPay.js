const express = require('express');
const router = express.Router();
const accPayController = require('../controllers/accPayController');

router.get('/accounts-pay', accPayController.getAccPays);
router.get('/accounts-pay/:codAccPay', accPayController.getAccPay);
router.post('/accounts-pay', accPayController.addAccPay);
router.put('/accounts-pay/:codAccPay', accPayController.updateAccPay);

module.exports = router;