const express = require('express');
const router = express.Router();
const notificationsController = require('../controllers/notificationsController');

router.get('/notifications', notificationsController.getNotifications);
router.get('/notifications/:codNotification', notificationsController.getNotification);
router.post('/notifications', notificationsController.addNotification);

module.exports = router;