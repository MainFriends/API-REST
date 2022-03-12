const express = require('express');
const router = express.Router();
const salesDiscountsController = require('../controllers/salesDiscountController');

router.get('/sales-discounts', salesDiscountsController.getSalesDiscounts);
router.get('/sales-discounts/:codDiscount', salesDiscountsController.getSalesDiscount);

module.exports = router;