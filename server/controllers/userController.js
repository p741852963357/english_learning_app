const User = require("../models/user");
const Topic = require("../models/topic");
const UserTopic = require("../models/userTopic");

const createUser = async (req, res) => {
  const { email, password } = req.body;
  const user = await User.findOne({ email: email });
  if (user) {
    return res.status(400).send({
      message: "User already exists!",
    });
  }
  const newUser = new User({
    email: email,
    password: password,
  });
  await newUser.save();
  return res
    .status(201)
    .json({ message: "User created successfully.", user: newUser });
};

const getUserPublicTopics = async (req, res) => {
  let email = req.query.email;
  const user = await User.find({ email: email }).populate({
    path: 'topics',
    populate: { path: 'topicId' }
  });
  if(!user.topics){
    return res.status(200).json({
      message: "User public topics",
      data: [],
    });
  }
  return res.status(200).json({
    message: "User public topics",
    data: user.topics,
  });
}

const findUser = async (req, res) => {};

module.exports = {
  createUser,
  getUserPublicTopics
};
