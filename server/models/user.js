const mongoose = require("mongoose");
const { Schema } = require("mongoose");

const userSchema = new mongoose.Schema({
  email: {
    type: String,
    required: true,
  },
  password: {
    type: String,
    required: true,
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
  topics: [
    {
      topic: {
        type: Schema.Types.ObjectId,
        ref: "Topic",
      },
    },
  ],
  folders: [
    {
      folder: {
        type: Schema.Types.ObjectId,
        ref: "Folder",
      },
    },
  ],
});

module.exports = mongoose.model("User", userSchema);
