create database estudiantes;
	use estudiantes;
    
    CREATE TABLE calificaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(100),
    nombre VARCHAR(100),
    nota  float
);

INSERT INTO calificaciones (cedula,nombre,nota) VALUES 
('108160789', 'Keylor Soto', '80');

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160790', 'Carlos Pérez', '55');  

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160791', 'Ana García', '68');  

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160792', 'Luis Rodríguez', '72');  

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160793', 'Marta López', '63');  

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160794', 'José Fernández', '66');  

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160795', 'Claudia Torres', '90'); 

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160796', 'Sergio Ramírez', '60');  

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160797', 'Patricia González', '74');  
INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160798', 'Juliana Castro', '67'); 

