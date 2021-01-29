'use strict';

const { findBookByYearPublication } = require('../../repositories/books-repository');

async function getBooksByYearPublication(req, res) {
    try {
        const { yearPublication } = req.params;
        const books = await findBookByYearPublication(yearPublication);
        if (!books) { // Preguntar por que no entra por este if
            throw new Error('No se encontraron libros para esa editorial')
        }
        res.send(books);
    } catch (error) {
        res.status(400).send({ error: err.message });
    }
}
module.exports = { getBooksByYearPublication };