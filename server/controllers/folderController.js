const Folder = require("../models/folder");
const Topic = require("../models/topic");
const mongoose = require("mongoose");

let createFolder = async (req, res) => {
  let { title, email } = req.body;
  let newFolder = new Folder({
    title: title,
    owner: email,
  });
  await newFolder.save();
  return res.status(201).json({
    message: "Folder created!",
    data: newFolder,
  });
};

let getFoldersByEmail = async (req, res) => {
  let email = req.query.email;
  const folders = await Folder.find({ owner: email })
    .sort({ createdAt: -1 })
    .populate("topics");
  return res.status(200).json({
    message: "Folder by email",
    data: folders,
  });
};

let deleteFolder = async (req, res) => {
  let id = req.body.id;
  await Folder.findOneAndDelete({ _id: id }, {});
  return res.status(200).json({
    message: "Folder Deleted",
  });
};
let editFolder = async (req, res) => {
  let { id, title } = req.body;
  const folder = await Folder.findOneAndUpdate(
    { _id: id },
    { title: title },
    { new: true },
  ).populate("topics");
  return res.status(200).json({
    message: "Folder Edited",
    data: folder,
  });
};

let editTopicsInFolder = async (req, res) => {
  let { topics, folder } = req.body;
  let f = await Folder.findOne({ _id: folder });
  let oldTopics = f.topics
  for (let oldTopic of oldTopics){
    if (!topics.includes(oldTopic.toString())) {
      oldTopics.splice(oldTopics.indexOf(oldTopic), 1);
      let t = await Topic.findOne({_id: oldTopic});
      let oldFolders = t.folders;
      oldFolders.splice(oldFolders.indexOf(folder), 1);
      t.folders = oldFolders;
      await t.save();
    }
  }
  for (let topic of topics){
    if (!oldTopics.includes(topic.toString())) {
      oldTopics.push(topic);
      const id = new mongoose.Types.ObjectId(topic);
      let t = await Topic.findOne({_id: id});
      t.folders.push(folder);
      await t.save();
    }
  }
  f.topics = topics;
  await f.save();
  f =  await f.populate('topics');
  return res.status(200).json({
    message: "Folder Edited",
    data: f,
  });
};

let removeTopicFromFolder = async (topics, folder) => {
  const f = await Folder.findOne({ _id: folder }).populate("topics");
}

module.exports = {
  createFolder,
  getFoldersByEmail,
  deleteFolder,
  editFolder,
  editTopicsInFolder,
};
