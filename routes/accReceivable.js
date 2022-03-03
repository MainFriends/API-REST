const express = require('express');
const router = express.Router();
const accReceivableController = require('../controllers/accReceivableController');

router.get('/accounts-receivable', accReceivableController.getAccReceivables);
router.get('/accounts-receivable/:codAccReceivable', accReceivableController.getAccReceivable);
router.post('/accounts-receivable', accReceivableController.addAccReceivable);

module.exports = router;