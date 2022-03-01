const express = require('express');
const router = express.Router();
const saleInvoiceController = require('../controllers/saleInvoiceController');

router.post('/sale-invoice', saleInvoiceController.addInvoice);

module.exports = router;