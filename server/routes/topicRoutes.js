const express = require('express');
const router = express.Router();
const topicController = require('../controllers/topicController');
const userController = require("../controllers/userController");


router.get('/', topicController.getTopicsOfUser);
router.get('/ranking', topicController.getRanking);
router.post('/', topicController.createTopic);
router.post('/delete', topicController.deleteTopic);
router.put('/', topicController.editTopic);
router.put('/visibility', topicController.editTopicVisibility);

router.put('/ranking', topicController.updateRanking);

router.post('/public', topicController.saveTopic);
router.get('/public', topicController.getPublicTopics);
router.post('/public/delete', userController.removePublicTopicOfUser);


module.exports =  router ;

