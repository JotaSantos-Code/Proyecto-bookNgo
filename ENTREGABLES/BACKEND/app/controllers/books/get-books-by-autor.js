'use strict'

const {findBookByAuthor} = require('../../repositories/books-repository');

async function getBookByAuthor(req,res) {
    try {
        const {nameAuthor} = req.params;
        
        const books = await findBookByAuthor(nameAuthor);
        if (!books) {
            throw new Error('No se encontraron libros por el nombre del autor')
        }
        res.send(books);
    } catch (err) {
        res.status(400).send({ error: err.message });
    }
}
module.exports={getBookByAuthor}; 