'use strict';

const { findBookByEditorial } = require('../../repositories/books-repository');

async function getBooksByEditorial(req, res) {
    try {
        const { nameEditorial } = req.params;
        const books = await findBookByEditorial(nameEditorial);
        if (!books) { // Preguntar por que no entra por este if
            throw new Error('No se encontraron libros para esa editorial')
        }
        res.send(books);
    } catch (err) {
        res.status(400).send({ error: err.message });
    }
}
module.exports = {getBooksByEditorial};