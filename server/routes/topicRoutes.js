const express = require('express');
const router = express.Router();
const topicController = require('../controllers/topicController');


router.get('/', topicController.getTopicsByEmail);
router.get('/public', topicController.getPublicTopics);
router.post('/', topicController.createTopic);
router.post('/delete', topicController.deleteTopic);
router.put('/', topicController.editTopic);
router.put('/visibility', topicController.editTopicVisibility);


module.exports =  router ;

