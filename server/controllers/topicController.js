const Topic = require("../models/Topic");
const mongoose = require("mongoose");

const createTopic = async (req, res) => {
  let { title, vocabularies, owner } = req.body;
  const newTopic = new Topic({
    title: title,
    vocabularies: JSON.parse(vocabularies),
    owner: owner,
  });
  await newTopic.save();
  return res.status(201).json({
    message: "Topic Created.",
    topic: newTopic,
  });
};
const getTopicsByEmail = async (req, res) => {
  let email = req.query.email;
  const topics = await Topic.find({ owner: email }).sort({ createdAt: -1 });
  return res.status(200).json({
    message: "Topics by email",
    data: topics,
  });
};

const deleteTopic = async (req, res) => {
  let { id, email } = req.body;
  const result = await Topic.findOne({ owner: email, _id: id });
  if(result.folders){
    await result.populate('folders');
    for (let folder of result.folders){
      folder.topics.splice(folder.topics.indexOf(new mongoose.Types.ObjectId(id)), 1);
      await folder.save();
    }
  }
  await Topic.findOneAndDelete({ owner: email, _id: id });
  return res.status(200).json({
    message: "Topic Deleted",
  });
};

const editTopic = async (req, res) => {
  const topic = await Topic.findOneAndUpdate(
    { _id: req.body.topic.id, owner: req.body.email },
    {
      title: req.body.topic.title,
      vocabularies: JSON.parse(req.body.topic.vocabularies),
    },
    { new: true },
  );
  return res.status(200).json({
    message: "Topic Edited",
    data: topic,
  });
};

const editTopicVisibility = async (req, res) => {
  const {visibility, email, topicId} = req.body;
  const topic = await Topic.findOneAndUpdate(
      { _id: topicId, owner: email },
      {
        visibility: visibility
      },
      { new: true },
  );
  return res.status(200).json({
    message: "Topic Edited",
    data: topic,
  });
};

const getPublicTopics = async (req, res) => {
  let email = req.query.email;
  const topics = await Topic.find({ owner: { $ne : email } , visibility: true}).sort({ createdAt: -1 });
  return res.status(200).json({
    message: "Public topics",
    data: topics,
  });
}


module.exports = {
  createTopic,
  getTopicsByEmail,
  deleteTopic,
  editTopic,
  editTopicVisibility,
  getPublicTopics
};
