const express = require('express');
const router = express.Router();
const feesReceivableController = require('../controllers/feesReceivableController');

router.get('/fees-receivable/:codAccReceivable', feesReceivableController.getFeesReceivable);
router.post('/fees-receivable', feesReceivableController.addFeesReceivable);
router.delete('/fees-receivable/:codFeesReceivable', feesReceivableController.deleteFeesReceivable);

module.exports = router;
