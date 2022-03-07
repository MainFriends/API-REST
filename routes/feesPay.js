const express = require('express');
const router = express.Router();
const feesPayController = require('../controllers/feesPayController');

router.get('/fees-pay/:codAccPay', feesPayController.getFeesPay);
router.post('/fees-pay', feesPayController.addFeesPay);
router.delete('/fees-pay/:codFeesPay', feesPayController.deleteFeesPay);

module.exports = router;