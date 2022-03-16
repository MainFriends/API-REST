const express = require('express');
const router = express.Router();
const purchaseInvoiceController = require('../controllers/purchaseInvoiceController');
const userExtractor = require('../middlewares/userExtractor');

router.get('/purchase-invoice',userExtractor, purchaseInvoiceController.getPurchases);
router.get('/purchase-invoice/:codInvoice',userExtractor, purchaseInvoiceController.getPurchase);
router.post('/purchase-invoice',userExtractor, purchaseInvoiceController.addPurchase);
router.put('/purchase-invoice/:codInvoice',userExtractor, purchaseInvoiceController.updatePurchase);
router.delete('/purchase-invoice/:codInvoice',userExtractor, purchaseInvoiceController.deletePurchase);

module.exports = router;

