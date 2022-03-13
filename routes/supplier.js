const express = require('express');
const router = express.Router();
const supplierController= require('../controllers/supplierController');

//crear route user
router.get('/supplier',supplierController.getSuppliers);
router.get('/supplier/:codSupplier',supplierController.getSupplier);
router.post('/supplier',supplierController.AddSupplier);
router.put('/supplier/:codSupplier',supplierController.UpdateSupplier);
router.delete('/supplier/:codSupplier',supplierController.deleteSupplier);

module.exports= router;