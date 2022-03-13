const express = require('express');
const router = express.Router();
const clientController = require('../controllers/clientController');

router.get('/client', clientController.getClients);
router.get('/client/:codClient', clientController.getClient);
router.post('/client', clientController.AddClient);
router.put('/client/:codClient' ,clientController.UpdateClient);
router.delete('/client/:codClient',clientController.deleteClient);

module.exports = router;