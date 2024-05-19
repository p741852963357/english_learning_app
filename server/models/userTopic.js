const mongoose = require('mongoose');

const userTopicSchema = new mongoose.Schema({
    topicId : {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Topic',
        required: true
    },
    userEmail: {
        type: String,
        ref: 'User',
        required: true
    },
    starVocabularies: [
        {
            term: {
                type: String,
            },
            definition: {
                type: String,
            },
        },
    ],
})

module.exports = mongoose.models.UserTopic || mongoose.model("UserTopic", userTopicSchema);
