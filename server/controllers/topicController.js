const Topic = require("../models/Topic");

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
  const topics = await Topic.find({ owner: email });
  return res.status(200).json({
    message: "Topics by email",
    data: topics,
  });
};

module.exports = {
  createTopic,
  getTopicsByEmail,
};
