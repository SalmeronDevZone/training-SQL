/*
    ALUMNO: JESÚS SALMERÓN ARMARIO.
*/


-- EJERCICIO 1

-- 1:
CREATE DATABASE bdtareas;

use bdtareas;
-- 2:
CREATE TABLE tareas (
    Codigo INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(30),
    Descripcion VARCHAR(200),
    Usuario VARCHAR(30),
    Fecha DATE,
    Realizada CHAR(1) CHECK (Realizada IN ('S', 'N')),
    Horas TIME
);

go

INSERT INTO tareas (Nombre, Descripcion, Usuario, Fecha, Realizada, Horas)
VALUES 
('Reunión con el Ayuntamiento', 'Ana Mora nos comenta el día 12/10/2024 tiene una reunión con el ayuntamiento.', 'Ana Mora', '2024-10-12', 'N', '14:30:00'),
('Entrega de Informe', 'Preparar y entregar informe mensual de ventas.', 'Juan Pérez', '2024-10-15', 'S', '09:45:00'),
('Llamada con Cliente', 'Realizar llamada con el cliente para discutir requerimientos adicionales.', 'María Gómez', '2024-10-18', 'N', '11:00:00'),
('Preparación de Presentación', 'Preparar presentación para la reunión del equipo.', 'Carlos Rodríguez', '2024-10-20', 'N', '16:00:00'),
('Revisión de Código', 'Revisar el código fuente antes de la entrega del proyecto.', 'Laura Fernández', '2024-10-22', 'S', '13:30:00');


-- 3:

-- PRIMER USUARIO
CREATE LOGIN gestor WITH PASSWORD = 'Inception';
CREATE USER gestor FOR LOGIN gestor;
ALTER ROLE db_owner ADD MEMBER gestor;

-- SEGUNDO USUARIO
CREATE LOGIN administrativo WITH PASSWORD = 'Gladiator';
CREATE USER administrativo FOR LOGIN administrativo;
GRANT SELECT, INSERT, UPDATE ON tareas TO administrativo;
DENY DELETE ON tareas TO administrativo;

-- TERCER USUARIO
CREATE LOGIN tecnico WITH PASSWORD = 'Interstellar';
CREATE USER tecnico FOR LOGIN tecnico;
GRANT SELECT, INSERT ON tareas TO tecnico;
GRANT UPDATE (Realizada, Horas) ON tareas TO tecnico;


-- 4:
    -- A)
EXECUTE AS LOGIN = 'gestor';

SELECT SUSER_SNAME() AS UsuarioActual;  -- Comando para comprobar con que usuario estamos trabajando.

UPDATE tareas SET Nombre = 'Cambio reunión a oficinas.' WHERE Codigo = 1;

SELECT * FROM tareas;

REVERT;

    -- B)
EXECUTE AS LOGIN = 'administrativo';

SELECT SUSER_SNAME() AS UsuarioActual;

DELETE FROM tareas WHERE Codigo = 2;

INSERT INTO tareas (Nombre, Descripcion, Usuario, Fecha, Realizada, Horas)
VALUES ('Reunión producción', 'Reunicón con el equipo para comprobar el rodaje.', 'Pedro Lobato', '2024-10-25', 'N', '08:30:00');

UPDATE tareas SET Usuario = 'Jesus Salmeron' WHERE Codigo = 1;

SELECT * FROM tareas;

REVERT;

    -- C)
EXECUTE AS LOGIN = 'tecnico';

SELECT SUSER_SNAME() AS UsuarioActual;

UPDATE tareas SET Nombre = 'No podrás..' WHERE Codigo = 1;

UPDATE tareas SET Horas = '10:30:00' WHERE Codigo = 1;

SELECT * FROM tareas;

REVERT;


-- 5:

REVOKE INSERT ON tareas FROM tecnico;

EXECUTE AS LOGIN = 'tecnico';

SELECT SUSER_SNAME() AS UsuarioActual;

INSERT INTO tareas (Nombre, Descripcion, Usuario, Fecha, Realizada, Horas)
VALUES ('x', 'xxxx', 'xx', '2024-01-01', 'N', '10:00:00');

REVERT;

-- 6:

CREATE ROLE roltareas;

GRANT SELECT ON tareas TO roltareas;

-- 7:

CREATE LOGIN JSalmeron WITH PASSWORD = 'Oppenheimer';
CREATE USER JSalmeron FOR LOGIN JSalmeron;

ALTER ROLE roltareas ADD MEMBER JSalmeron;

EXECUTE AS LOGIN = 'JSalmeron';

SELECT * FROM tareas;

UPDATE tareas SET Nombre = 'xxx' WHERE Codigo = 1;

REVERT;


-- EJERCICIO 2

-- 1:
create database JSalmeron;

use JSalmeron;


-- 2:
CREATE TABLE Categorias (
    id INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);


CREATE TABLE Productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    idCategoria INT,
    Precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idCategoria) REFERENCES Categorias(id)
);



-- 3:
INSERT INTO Categorias (id, Nombre) VALUES 
(1, 'Electrónicos'),
(2, 'Ropa');


INSERT INTO Productos (id, nombre, idCategoria, Precio) VALUES (101, 'Smartphone', 1, 499.99),
(102, 'Laptop', 1, 1299.99),
(201, 'Camiseta', 2, 19.99);



-- 5:
INSERT INTO Productos (id, nombre, idCategoria, Precio) VALUES 
(301, 'Auriculares Inalámbricos', 1, 79.99),
(302, 'Tablet', 1, 299.99);



-- 7:
INSERT INTO Categorias (id, Nombre) VALUES (3, 'VideoConsolas');

INSERT INTO Productos (id, nombre, idCategoria, Precio) VALUES (500, 'FABLE', 3, 59.99);



-- 9:
INSERT INTO Categorias (id, Nombre) VALUES (4, 'Hogar');

INSERT INTO Productos (id, nombre, idCategoria, Precio) VALUES 
(401, 'Robot Aspirador', 4, 199.99),
(id, nombre, idCategoria, Precio) VALUES (402, 'Cafetera Programable', 4, 79.99);

DELETE FROM Productos WHERE id IN (101, 102);


-- 10:
DELETE FROM Productos;

DELETE FROM Categorias;