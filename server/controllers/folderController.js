const Folder = require('../models/folder');


let createFolder = async (req, res) => {
    let {title, email} = req.body;
    let newFolder = new Folder({
        title: title,
        owner: email,
    })
    await newFolder.save();
    return res.status(201).json({
        message: 'Folder created!',
        data: newFolder
    })
}

let getFoldersByEmail = async (req, res) => {
    let email = req.query.email;
    console.log(email)
    const folders = await Folder.find({ owner: email });
    console.log(folders);
    return res.status(200).json({
        message: "Folder by email",
        data: folders,
    });
}

module.exports = {
    createFolder,
    getFoldersByEmail
}
