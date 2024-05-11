const express = require('express');
const router = express.Router();
const topicController = require('../controllers/topicController');


router.get('/', topicController.getTopicsByEmail);
router.post('/', topicController.createTopic);


module.exports =  router ;

