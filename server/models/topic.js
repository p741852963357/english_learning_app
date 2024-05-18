const mongoose = require('mongoose');

const topicSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
  },
  owner: {
    type: String,
    required: true,
  },
  visibility: {
    type: Boolean,
    default: false,
  },
  folders: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: "Folder",
  }],
  vocabularies: [
    {
      term: {
        type: String,
      },
      definition: {
        type: String,
      },
    },
  ],
  termLanguage: {
    type: String,
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
},{
  toJSON : {virtuals: true},
});

topicSchema.virtual('users', {
  ref: "UserTopic",
  localField: '_id',
  foreignField: 'topicId',
})

module.exports = mongoose.models.Topic || mongoose.model("Topic", topicSchema);
