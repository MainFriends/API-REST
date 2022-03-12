const express = require('express');
const router = express.Router();
const payFormController = require('../controllers/payFormController');

router.get('/pay-form', payFormController.getPayForms);
router.get('/pay-form/:codPayForm', payFormController.getPayForm);
router.post('/pay-form', payFormController.addPayForm);
router.put('/pay-form/:codPayForm', payFormController.updatePayForm);
router.delete('/pay-form/:codPayForm', payFormController.deletePayForm);

module.exports = router;