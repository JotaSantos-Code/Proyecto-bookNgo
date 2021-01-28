'use strict'

const bookRepository = require('../../repositories/books-repository');

async function getBooks(req,res) {
    const books = await bookRepository.readAll();
    res.send(books);
}
module.exports={getBooks};