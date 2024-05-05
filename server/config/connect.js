const connect = require("mongoose");

connect
    .connect("mongodb://127.0.0.1:27017/db")
    .then(() => {
        console.log("Mongoose Connected");
    })
    .catch((err) => {
        console.log(err);
    });

module.exports = connect;
