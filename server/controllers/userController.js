const User = require("../models/user");
const Topic = require("../models/topic");
const UserTopic = require("../models/userTopic");
const otp = require("../config/otp");

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
    .json({ message: "User created successfully.", user: newUser});
};

const getPublicTopicsOfUser = async (req, res) => {
  let email = req.query.email;
  let user = await User.findOne({ email: email }).populate({
    path: "topics",
    populate: { path: "topicId" },
  });
  if (!user.topics) {
    return res.status(200).json({
      message: "Get public topics successfully",
      data: [],
    });
  }
  return res.status(200).json({
    message: "Get public topics successfully",
    data: user.topics,
  });
};

const removePublicTopicOfUser = async (req, res) => {
  let { email, id } = req.body;
  await UserTopic.findOneAndDelete({ userEmail: email, topicId: id });
  return res.status(200).json({
    message: "public topic is removed",
  });
};

const loginUser = async (req, res) => {
  const { email, password } = req.body;
  const user = await User.findOne({ email: email });
  if (!user) {
    return res.status(400).send({
      message: "User not found!",
    });
  }
  if (user.password !== password) {
    return res.status(400).send({
      message: "Incorrect password!",
    });
  }
  return res.status(200).json({
    message: "Login successful.",
    user: user,
  });
};
const generateOTP = async (req, res) => {
  const { email } = req.body;
  const user = await User.findOne({ email });

  if (!user) {
    return res.status(400).json({ message: "User not found!" });
  }
  const OTP = otp.generateOTP();
  user.OTP = OTP;
  user.OTPCreatedAt = new Date();
  await user.save();
  otp.sendOTP(email, OTP);
  return res.status(200).json({ message: "OTP sent successfully." });
};
const resetPassword = async (req, res) => {
  const { email, OTP, newPassword } = req.body;
  const user = await User.findOne({ email });
  if (!user || user.OTP !== OTP) {
    return res.status(400).json({ message: "Invalid OTP." });
  }
  const currentTime = new Date();
  const OTPExpiry = new Date(user.OTPCreatedAt);
  OTPExpiry.setMinutes(OTPExpiry.getMinutes() + 5);
  if (currentTime > OTPExpiry) {
    return res
      .status(400)
      .json({ message: "OTP expired. Please request a new one." });
  }
  user.password = newPassword;
  user.OTP = undefined;
  user.OTPCreatedAt = undefined;
  await user.save();

  return res.status(200).json({ message: "Password reset successfully." });
};
const changePassword = async (req, res) => {
  const { email, currentPassword, newPassword } = req.body;

  const user = await User.findOne({ email });

  if (!user) {
    return res.status(400).json({ message: "User not found!" });
  }

  if (user.password !== currentPassword) {
    return res.status(400).json({ message: "Current password is incorrect!" });
  }

  user.password = newPassword;
  await user.save();

  return res.status(200).json({ message: "Password changed successfully." });
};

module.exports = {
  createUser,
  getPublicTopicsOfUser,
  removePublicTopicOfUser,
  loginUser,
  generateOTP,
  resetPassword,
  changePassword
};
