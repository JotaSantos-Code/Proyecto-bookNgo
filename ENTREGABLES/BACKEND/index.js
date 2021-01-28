'use strict';
require('dotenv').config();
const booksRouter = require('./app/routes/books-routes');

const fs = require('fs');
const path = require('path');
const morgan = require('morgan');

const express = require('express');
const app = express();
app.use(express.json());

const port = process.env.SERVER_PORT || 3080;

const accessLogStream = fs.createWriteStream(path.join(__dirname,'./access.log'),{flags : 'a'});

app.use(morgan('combined', {stream:accessLogStream})); //combined, es lo mismo pero te da mas información.

app.use('/api/v1/books',booksRouter);

app.listen(port,() => console.log(`Listening  ${port}...`));
