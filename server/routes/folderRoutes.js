const express = require('express');
const router = express.Router();
const folderController = require('../controllers/folderController');

router.post('/', folderController.createFolder);
router.get('/', folderController.getFoldersByEmail)

module.exports = router;
