const express = require('express');
const router = express.Router();
const supplierController= require('../controllers/supplierController');

//crear route user
router.get('/supplier',supplierController.getSupplier);
router.post('/supplier',supplierController.AddSupplier);
router.put('/supplier/:codSupplier',supplierController.UpdateSupplier);

module.exports= router;