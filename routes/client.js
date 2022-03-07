const express = require('express');
const router = express.Router();
const clientController = require('../controllers/clientController');

router.get('/client', clientController.getClient);
router.post('/client', clientController.AddClient);
router.put('/client' ,clientController.UpdateClient);
router.delete('/client',clientController.deleteClient);

module.exports = router;