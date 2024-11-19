create database tareas;
use tareas;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    lastName varchar(255),
    firstName varchar(255),
    email varchar(255),
    pwd varchar(255),
    creationDate datetime,
    PRIMARY KEY (id)
);
INSERT INTO users (lastName, firstName, email, pwd, creationDate)
VALUES ('joseph', 'joseph', 'joseph@gmail.com', '111', CURDATE());

CREATE TABLE tareas (
		id INT AUTO_INCREMENT ,
		titulo VARCHAR(255) ,
		descripcion VARCHAR(255),
        creationDate datetime,
        usuario VARCHAR(255),
        PRIMARY KEY (id)
		);
INSERT INTO tareas (titulo, descripcion, creationDate, usuario)
VALUES ('Pagar recibo', 'pago de luz', curdate(), 'Joseph');



        