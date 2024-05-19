const express = require('express');
const userController = require('../controllers/userController');
const router = express.Router();

router.post('/', userController.createUser);
router.get('/public', userController.getUserPublicTopics);
router.post('/login', userController.loginUser);
router.post('/generate-otp', userController.generateOTP);
router.post('/reset-password', userController.resetPassword);

module.exports = router;
