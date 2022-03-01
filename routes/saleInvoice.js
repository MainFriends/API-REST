const express = require('express');
const router = express.Router();
const saleInvoiceController = require('../controllers/saleInvoiceController');

router.get('/sale-invoice', saleInvoiceController.getInvoice);
router.post('/sale-invoice', saleInvoiceController.addInvoice);

module.exports = router;