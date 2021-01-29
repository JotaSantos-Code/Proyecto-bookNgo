'use strict'
const database = require('../infrastructure/database');

async function readAll() {
    const pool = await database.getPool();
    console.log('jose');
    const query= 'select * from libro';
    console.log(query);
    const [books] = await pool.query(query);
    console.log(books);
    return books;
}

async function findByName (nombre) {
    const pool = await database.getPool();
    const query = 'select * from libro where titulo=?';
    const [books] = await pool.query(query,nombre);
    return books;
}

async function findBookByAuthor (nombreAutor) {
    const pool = await database.getPool();
    const query = 'select l.idlibro,l.idcategoria,l.idusuario,l.titulo,l.stock,l.precio from libro l inner join autor aut on l.idautor = aut.idautor where aut.nombreautor=?';
    const [books] = await pool.query(query,nombreAutor);
    return books;
}
module.exports={readAll,findByName,findBookByAuthor};