DROP DATABASE IF EXISTS MotoGP;		-- Eliminamos la base de datos en caso de que exista.
CREATE DATABASE IF NOT EXISTS MotoGP;	-- Creamos la base de datos si no existe.

USE MotoGP;		-- Seleccionamos la base de datos MotoGP , creada en el comando anterior.


CREATE TABLE CEO (      -- Creamos la tabla CEO, omitimos 'create table if not exists' ya que acabamos de crear la base de datos.

    id_ceo  INT AUTO_INCREMENT PRIMARY KEY,   -- Omitimos not null al tener el campo auto_increment. No es necesario en mysql.  
    nombre VARCHAR (20) NOT NULL,
    ape1 VARCHAR (20) NOT NULL,
    ape2 VARCHAR (20) NOT NULL,
    fecha_nacimiento date NOT NULL,
    lugar_nac VARCHAR(20) NOT NULL,
    sueldo INT NOT NULL

);

CREATE TABLE Marcas (       -- Creación de la tabla Marcas.

    id_marca TINYINT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    fecha_fundacion DATE NOT NULL,
    pais VARCHAR(20),
    presupuesto int NOT NULL,
    id_ceo INT NOT NULL,
    CONSTRAINT fk_ceo FOREIGN KEY (id_ceo) REFERENCES CEO (id_ceo),     -- Al ser la relacion (1-n) entre ceo / Marcas, traemos el campo del 1 al n. (foreign key)
    CONSTRAINT ch_marca CHECK (LOWER (nombre) IN ('yamaha', 'honda', 'aprilia', 'suzuki', 'ducati'))    -- Aunque en competición hay mas equipos, de momento los omitimos. 
);

/*

En esta tabla hemos usado check() para comprobar que no se inserta un registro de una marca que no compita.
También hemos usado lower() para evitar un error en caso de escribir dicho registro en mayúscula.

*/

CREATE TABLE Pilotos(       -- Creación de la tabla pilotos.

    dorsal SMALLINT PRIMARY KEY,        -- Omitimos not null. Por regla general en mysql , si es primary key no es necesario poner not null.
    nombre VARCHAR (20) NOT NULL,
    apellido VARCHAR (20) NOT NULL,
    pais VARCHAR(20) NOT NULL,
    peso SMALLINT,
    altura SMALLINT,     -- Podríamos usar decimal(5,2) pero en los datos proporcionados no hay decimales.
    num_victorias SMALLINT NOT NULL,
    num_podios  SMALLINT NOT NULL,
    num_campeonatos TINYINT NOT NULL,
    id_marca TINYINT NOT NULL,
    CONSTRAINT fk_marca FOREIGN KEY (id_marca) REFERENCES Marcas (id_marca)     -- Al ser la relacion (n-1) entre Pilotos / Marcas, traemos el campo del 1 al n. (foreign key)


);

/*
Hemos dejado algunos campos sin not null, suponiendo que no es una información completamente básica y para experimentar mas situaciones en mysql.
Teniendo siempre como objetivo el aprendizaje.
*/


INSERT INTO CEO (nombre, ape1, ape2, fecha_nacimiento, lugar_nac, sueldo)   -- Insertamos los valores en la tabla CEO
VALUES
('Tokiro', 'Kato', 'Yoshimura', '1976-03-20', 'Osaka', 2000000),        -- Omitimos el primer campo al ser auto_increment.
('Fernando', 'Rodriguez', 'Espinosa', '1990-04-03', 'Barcelona', 700000),
('Helena', 'Smith', 'Romero', '1988-05-07', 'Barcelona', 2000000),
('Toshiro', 'Mifune', 'Cheng', '1992-05-04', 'Osaka', 120000),
('Sonia', 'Vela', 'Pitar', '1969-10-27', 'Teruel', 4000000);


/*
Debemos hacer los inserts en este orden, CEO - Marcas - Pilotos. 
Si no, obtendremos un error debido a las foreing key.
*/


INSERT INTO Marcas (id_marca, nombre, fecha_fundacion, pais, presupuesto, id_ceo)   -- Insertamos los valores en la tabla MARCAS
VALUES
(1,'YAMAHA', '1876-01-01', 'JAPON', 300000000, 1),
(2,'HONDA', '1890-02-01', 'JAPON', 400000000, 2),
(3,'APRILIA', '1990-08-07', 'ITALIA', 1000000000, 3),
(4,'SUZUKI', '1876-01-01', 'JAPON', 5000000, 4),
(5,'DUCATI', '1901-04-03', 'ITALIA', 100000000, 5);


INSERT INTO Pilotos (dorsal, nombre, apellido, pais, peso, altura, num_victorias, num_podios, num_campeonatos, id_marca)    -- Insertamos los valores en la tabla Pilotos
VALUES
(6, 'Pecco', 'Bagnalia', 'Italia', 63, 170, 0, 1, 0, 5),
(46, 'Pol', 'Espargaro', 'España', 65, 182, 86, 172, 7, 2),
(93, 'Marc', 'Marquez', 'España', 59, 168, 23, 37, 4, 2),
(4, 'Andrea', 'Dovicioso', 'Italia', 68, 175, 6, 39, 0, 3),
(1, 'Alberto', 'Milian', 'España', 60, 175, 90, 180, 8, 2);



    -- SENTENCIAS SQL.

 /*
 Mostrar el nombre del ceo junto con el nombre de la marca que dirige.
*/

SELECT c.nombre AS 'Nombre del CEO' , CONCAT ( ' Es el CEO de ' , m.nombre) AS ' Marca'	-- Concat para usar el mensaje de 'Es el CEO de' antes del registro nombre
	FROM CEO c INNER JOIN Marcas m 		-- Usamos Inner Join para seleccionar los campos que esten en ambas tablas.
ON c.id_ceo=m.id_ceo;		-- id_ceo es primary key de CEO y foreign key de Marcas.


/*
Generar una lista de correo electrónico para los CEO’s, que contendrá las cuatro primeras letras
 del nombre + “un guión bao”+ las tres primeras letras del primer apellido + las tres primeras del 
 segundo + “@motogp.com”.
*/

 SELECT CONCAT(LEFT(nombre,4), '-', LEFT(ape1,3), LEFT(ape2,3), '@motogp')AS 'Correo Electrónico'  FROM CEO ;   -- La función LEFT nos permite seleccionar las letras del lado izquiero incluyendo como parámetro el número de carácteres.

 
 /*
 Mostrar el nombre y apellido del CEO que más gana. (si hay más de uno que gana el máximo, deben salir todos)
 */

 SELECT Nombre, ape1 FROM CEO WHERE sueldo IN (SELECT MAX(sueldo) FROM CEO); -- Creamos una subconsulta donde extraemos el valor máximo del campo sueldo.


/*
Mostrar el nombre de los CEOS y su sueldo añadiendo la coletilla $.
*/

SELECT Nombre, CONCAT(sueldo,' $') AS 'Sueldo en Dólares' FROM CEO;

/*
Consulta que muestre todas las marcas fundadas en el siglo 20, ordenadas por el nombre de marca.
*/

SELECT nombre FROM Marcas
WHERE EXTRACT(YEAR FROM fecha_fundacion) BETWEEN 1900 AND 1999 ORDER BY nombre; -- Extraemos el año que este comprendido entre 1900 y 1999 ( Siglo 20)


/*
¿Cuántos CEOS hay de cada población?
*/

SELECT lugar_nac,  COUNT(lugar_nac) AS 'CEO POR CIUDADES' FROM CEO GROUP BY lugar_nac;


/*
Consulta que muestre el nombre y apellido del piloto que tenga más de 70 podios o que haya ganado dos o más campeonatos del mundo.
*/


SELECT nombre, apellido FROM Pilotos WHERE num_podios > 70 OR num_campeonatos >= 2;


/*
¿Cuántos pilotos tiene cada marca?
*/

SELECT m.nombre AS 'Equipos', COUNT(p.nombre) AS 'Total de Pilotos'
    FROM Marcas m INNER JOIN Pilotos p 
ON m.id_marca=p.id_marca
GROUP BY m.nombre;


/*
Mostrar todas las marcas con sus pilotos, si una marca no tiene pilotos, también ha de salir.
*/

SELECT m.nombre, IFNULL(p.nombre,'EQUIPO SIN PILOTO') AS ' NOMBRE', IFNULL(p.apellido,'-')	AS 'APELLIDO' -- En caso de nulo tendremos un mensaje de advertencia de que no hay piloto gracdias a la funcion IFNULL
    FROM Marcas m LEFT JOIN Pilotos p -- Usamos LEFT JOIN Dado que deben salir todos los equipos de MOTOGP.
ON m.id_marca=p.id_marca
ORDER BY m.nombre;


/*
Mostrar la media de presupuesto de las marcas japonesas.
*/

SELECT FORMAT(AVG(presupuesto), 0) AS 'Media de presupuesto' FROM Marcas WHERE UPPER(pais) ='JAPON'	-- Con format hacemos que el resultado sea mas legible para el ojo humano. El segundo parámetro, ( el 0) indica el númerop de decimales que vamos a incluir.


/*
Mostrar el total de podios por marca.
*/

SELECT m.nombre, SUM(p.num_podios) AS 'Total de Podios'
	FROM Marcas m INNER JOIN Pilotos p 
ON m.id_marca=p.id_marca
GROUP BY m.nombre;


/*
Cuál es la media de podios de los pilotos que pesan menos de 60 kilos?
*/

SELECT nombre, apellido, FORMAT(AVG(num_podios),0) AS 'MEDIA DE PODIOS' FROM Pilotos where peso < 60;


/*
Mostrar el número de campeonatos por marca (¿Cuántos?), siempre y cuando el número de campeonatos por marca sea superior a 5.
*/

SELECT m.nombre AS 'Equipo', SUM(p.num_campeonatos) AS 'Total de Campeonatos'
	FROM Marcas m INNER JOIN Pilotos p 
ON m.id_marca=p.id_marca
WHERE p.num_campeonatos > 5 GROUP BY m.nombre;  -- Esta es la única que estaba mal.




SELECT m.nombre AS 'Equipo', SUM(p.num_campeonatos) AS 'Total de Campeonatos'
	FROM Marcas m INNER JOIN Pilotos p 
ON m.id_marca=p.id_marca
group by m.nombre 
having SUM(p.num_campeonatos) > 5;





/*
Nombre de la marca que tiene mayor presupuesto.
*/


SELECT nombre , CONCAT('Es la que posee mayor presupuesto') FROM Marcas WHERE presupuesto = ( SELECT MAX(presupuesto) FROM Marcas);
