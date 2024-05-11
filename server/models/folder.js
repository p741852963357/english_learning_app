const mongoose = require("mongoose");
const {Schema} = require("mongoose");


const folderSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true,
    },
    topics: [{
      type: Schema.Types.ObjectId,
      ref: "Topic",
    }],
    createdAt: {
        type: Date,
        default: Date.now,
    },
    owner: {
        type: String,
        required: true
    }
})

module.exports = mongoose.model("Folder", folderSchema);
