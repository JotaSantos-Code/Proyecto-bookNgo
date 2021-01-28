'use strict';

const {findByName} = require('../../repositories/books-repository');

async function getBookByTitle(req,res) {
    try {
        const {title} = req.params;
        const book = await findByName(title);
        if (!book) {
            throw new Error('No se encontraron libros con ese titulo');
        }
        res.send(book);
    } catch (err) {
        res.status(400).send({ error: err.message });
    }
}
module.exports = {getBookByTitle};