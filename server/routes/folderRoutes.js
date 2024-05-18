const express = require("express");
const router = express.Router();
const folderController = require("../controllers/folderController");

router.post("/", folderController.createFolder);
router.get("/", folderController.getFoldersByEmail);
router.post("/delete", folderController.deleteFolder);
router.put("/", folderController.editFolder);
router.put('/topics', folderController.editTopicsInFolder);

module.exports = router;
