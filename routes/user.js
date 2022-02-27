const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

router.get('/user', userController.getUsers);
router.get('/user/:codUser', userController.getUser);
router.post('/user', userController.addUser);
router.put('/user/:codUser', userController.updateUser);
router.delete('/user/:codUser', userController.deleteUser);

module.exports = router;