CREATE DATABASE actividad4;
USE actividad4;
CREATE TABLE tareas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    descripcion VARCHAR(255)
);
INSERT INTO tareas(titulo,descripcion) VALUES ('compras','comprar los materiales del proyecto');