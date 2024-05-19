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
  OTP: {
    type: String
  },
  OTPCreatedAt: {
    type: Date
  },
},{
  toJSON: {virtuals: true},
});

userSchema.set('toJSON', {virtuals: true});
userSchema.set('toObject', {virtuals: true});

userSchema.virtual('topics', {
  ref: "UserTopic",
  localField: 'email',
  foreignField: 'userEmail'
})



module.exports = mongoose.models.User || mongoose.model("User", userSchema);
