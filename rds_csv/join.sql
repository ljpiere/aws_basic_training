CREATE TABLE autores (
    autor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100)
);
CREATE TABLE libros (
    libro_id SERIAL PRIMARY KEY,
    titulo VARCHAR(255),
    autor_id INTEGER,
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id)
);
-- Insertando autores
INSERT INTO autores (nombre) VALUES ('Gabriel García Márquez');
INSERT INTO autores (nombre) VALUES ('Julio Cortázar');
INSERT INTO autores (nombre) VALUES ('Isabel Allende');
INSERT INTO autores (nombre) VALUES ('Hector Abad');

-- Insertando libros
INSERT INTO libros (titulo, autor_id) VALUES ('Cien años de soledad', 4);
INSERT INTO libros (titulo, autor_id) VALUES ('El amor en los tiempos del cólera', 4);
INSERT INTO libros (titulo, autor_id) VALUES ('Rayuela', 5);
INSERT INTO libros (titulo, autor_id) VALUES ('La casa de los espíritus',6);



select  * from public.autores;
select  * from public.libros;


-- Sentencias SQL
-- INNER JOIN: Nos devolverá la interseccion
SELECT *
FROM autores a
INNER JOIN libros l ON a.autor_id = l.autor_id;

-- LEFT
SELECT a.nombre, l.titulo
FROM autores a
LEFT JOIN libros l ON a.autor_id = l.autor_id;

-- RIGHT
SELECT a.nombre, l.titulo
FROM autores a
RIGHT JOIN libros l ON a.autor_id = l.autor_id;

-- FULL
SELECT a.nombre, l.titulo
FROM autores a
FULL JOIN libros l ON a.autor_id = l.autor_id;