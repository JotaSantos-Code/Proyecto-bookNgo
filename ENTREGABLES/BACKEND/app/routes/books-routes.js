'use strict';

const express = require('express');
const {getBooks} = require('../controllers/books/get-books');
const {getBookByTitle} = require('../controllers/books/get-book-by-title');
const {getBookByAuthor} = require('../controllers/books/get-books-by-autor');
const {getBooksByCategory} = require('../controllers/books/get-books-by-category');
const {getBooksByEditorial} = require('../controllers/books/get-books-by-editorial');
const {getBooksByYearPublication} = require('../controllers/books/get-books-by-year-publication');
const router = express.Router();

router.route('/')
.get((req,res) => getBooks(req,res));
router.route('/title/:title')
.get((req,res)=>getBookByTitle(req,res));
router.route('/author/:nameAuthor')
.get((req,res)=>getBookByAuthor(req,res));
router.route('/category/nameCategory/:nameCategory')
.get((req,res)=>getBooksByCategory(req,res));
router.route('/editorial/:nameEditorial')
.get((req,res)=>getBooksByEditorial(req,res));
router.route('/yearpublication/:yearPublication')
.get((req,res)=>getBooksByYearPublication(req,res));

module.exports=router;