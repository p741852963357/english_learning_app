const express = require('express');
const connectDB = require('./config/connectDB');
const topicRouter = require('./routes/topicRoutes');
const userRouter = require('./routes/userRoutes');
const folderRouter = require('./routes/folderRoutes');

const port = process.env.PORT || 3000;

const app = express();
app.use(express.json());

app.use('/api/topics', topicRouter);
app.use('/api/users', userRouter);
app.use('/api/folders', folderRouter);

app.listen(port, () => {
    console.log(`App listening on http://localhost:${port}`);
})
