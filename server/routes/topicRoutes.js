const express = require('express');
const router = express.Router();
const topicController = require('../controllers/topicController');


router.get('/', topicController.getTopicsByEmail);
router.get('/public', topicController.getPublicTopics);
router.get('/ranking', topicController.getRanking);
router.post('/', topicController.createTopic);
router.post('/delete', topicController.deleteTopic);
router.put('/', topicController.editTopic);
router.put('/visibility', topicController.editTopicVisibility);
router.post('/public', topicController.saveTopic);
router.put('/ranking', topicController.updateRanking);


module.exports =  router ;

