const express = require('express');
const router = express.Router();
const saleDetailController = require('../controllers/saleDetailController');

router.get('/sale-detail/:codInvoice', saleDetailController.getDetail);
router.post('/sale-detail', saleDetailController.addDetail);

module.exports = router;