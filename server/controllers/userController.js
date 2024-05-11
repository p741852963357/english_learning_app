const User = require("../models/user");

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

const findUser = async (req, res) => {};

module.exports = {
  createUser,
};
