const express = require('express');
const userController = require('../controllers/userController');
const router = express.Router();

router.post('/', userController.createUser);
router.post('/login', userController.loginUser);
router.post('/generate-otp', userController.generateOTP);
router.post('/reset-password', userController.resetPassword);
router.post('/change-password', userController.changePassword);
router.get('/public', userController.getPublicTopicsOfUser);


module.exports = router;
