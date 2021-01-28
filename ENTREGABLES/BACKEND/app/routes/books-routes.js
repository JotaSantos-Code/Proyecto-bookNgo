'use strict';

const express = require('express');
const {getBooks} = require('../controllers/books/get-books');
const {getBookByTitle} = require('../controllers/books/get-book-by-title');
const {getBookByAuthor} = require('../controllers/books/get-books-by-autor');
const router = express.Router();

router.route('/')
.get((req,res) => getBooks(req,res));
router.route('/title/:title')
.get((req,res)=>getBookByTitle(req,res));
router.route('/author/:nameAuthor')
.get((req,res)=>getBookByAuthor(req,res));

module.exports=router;