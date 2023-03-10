import express from "express";

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }))

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => console.log(`Server is running on port ${PORT}`));

app.use('/api/report', require('./routes/report'));
app.use('/api/transfer', require('./routes/transfer'));

