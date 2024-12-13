create database estudiantes;
	use estudiantes;
    
    CREATE TABLE calificaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(100),
    nombre VARCHAR(100),
    nota  float
);

INSERT INTO calificaciones (cedula,nombre,nota) VALUES 
('108160789', 'Keylor Soto', null);

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160790', 'Carlos Pérez', null);  

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160791', 'Ana García', null);  

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160792', 'Luis Rodríguez', null);  

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160793', 'Marta López', null);  

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160794', 'José Fernández', null);  

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160795', 'Claudia Torres', null); 

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160796', 'Sergio Ramírez', null);  

INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160797', 'Patricia González', null);  
INSERT INTO calificaciones (cedula, nombre, nota) VALUES 
('108160798', 'Juliana Castro', null); 


