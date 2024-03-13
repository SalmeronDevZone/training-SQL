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