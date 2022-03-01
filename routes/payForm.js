const express = require('express');
const router = express.Router();
const payFormController = require('../controllers/payFormController');

router.get('/payForm', payFormController.getPayForms);

module.exports = router;