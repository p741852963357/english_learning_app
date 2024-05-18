const mongoose = require("mongoose");

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
},{
  toJSON: {virtuals: true},
});

userSchema.virtual('topics', {
  ref: "UserTopic",
  localField: 'email',
  foreignField: 'userEmail'
})

module.exports = mongoose.model("User", userSchema);
