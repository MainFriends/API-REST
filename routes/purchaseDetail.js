const express = require('express');
const router = express.Router();
const purchaseDetailController = require('../controllers/purchaseDetailController');
const userExtractor = require('../middlewares/userExtractor');

router.get('/purchase-detail/:codDetail',userExtractor, purchaseDetailController.getDetail);
router.post('/purchase-detail',userExtractor, purchaseDetailController.addDetail);
router.put('/purchase-detail/:codDetail',userExtractor, purchaseDetailController.updateDetail);
router.delete('/purchase-detail/:codDetail',userExtractor, purchaseDetailController.deleteDetail);

module.exports = router;