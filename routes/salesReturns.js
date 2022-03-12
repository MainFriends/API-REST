const express = require('express');
const router = express.Router();
const salesReturnsController = require('../controllers/salesReturnsController');

router.post('/sales-returns', salesReturnsController.addSalesReturn);
router.put('/sales-returns/:codReturn', salesReturnsController.updateSalesReturn);
router.get('/sales-returns', salesReturnsController.getSalesReturns);
router.get('/sales-returns/:codReturn', salesReturnsController.getSalesReturn);
router.delete('/sales-returns/:codReturn', salesReturnsController.deleteSalesReturn);

module.exports = router;