'use strict';

const { findBookByCategory } = require('../../repositories/books-repository');

async function getBooksByCategory(req, res) {
    try {
        const { nameCategory } = req.params;
        const books = await findBookByCategory(nameCategory);
        console.log(books);
        if (!books) { // Preguntar por que no entra por este if
            throw new Error('No se encontraron libros para esa categoria')
        }
        res.send(books);
    } catch (err) {
        res.status(400).send({ error: err.message });
    }
}
module.exports= {getBooksByCategory}