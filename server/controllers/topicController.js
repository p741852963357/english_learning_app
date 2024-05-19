
const Topic = require("../models/Topic");
const UserTopic = require("../models/UserTopic");

const mongoose = require("mongoose");
const  User = require("../models/User");
const express = require("express");

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

const updateRanking = async (req, res) => {
  let data = req.body;
  const topic = await Topic.findOne({ _id: data.id });
  topic.ranking.push({
    user: data.email,
    start: data.start,
    end: data.end,
    createdAt: Date.now(),
  });
  await topic.save()
  return res.status(200).json({
    message: "Topic Updated",
  });
}

const getRanking = async (req, res) => {
  let data = req.body;
  const topic = await Topic.findOne({ _id: data.id });
  await  topic.
  topic.ranking.sort(function(a,b){return (b.end - b.start)  - (a.end - a.start)})
  return res.status(200).json({
    message: "Ranking ",
    data: topic
  });
}

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
  await UserTopic.findOneAndDelete({ topicId: id });
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

const saveTopic = async (req, res) => {
  let { email, id } = req.body;

  await UserTopic.updateOne({topicId: id, userEmail: email},{},{upsert: true})
  let user = await User.findOne({email: email}).populate({path: 'topics', populate :{ path : 'topicId'}});
  return res.status(200).json({
    message: "topics saved",
    data: user.topics,
  });
}


module.exports = {
  createTopic,
  getTopicsByEmail,
  deleteTopic,
  editTopic,
  editTopicVisibility,
  getPublicTopics,
  saveTopic,
  updateRanking
};
