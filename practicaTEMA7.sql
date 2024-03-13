-- Ejercicio 1:

drop database if exists transacciones;
CREATE DATABASE if not exists transacciones; 
use transacciones;

CREATE TABLE personas (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  mail VARCHAR(30) NOT NULL
);
-- añadir datos a personas
INSERT INTO personas VALUES(1,'Pedro Martinez', 'pmartinez@gmail.com');
INSERT INTO personas VALUES(2,'Isabel Luque','iluque@gmail.com');
INSERT INTO personas VALUES(3,'Susana Iglesias','siglesias@gmail.com');

/*
Inicia una transacción, añade a la tabla personas tus datos y después realizas un rollback ¿Qué ha sucedido?
*/

start transaction;

insert into personas (nombre, mail)
values
('Jesús Salmerón', 'jesussalmeronecde@linkiafp.online');

rollback;

select * from personas;

/*
Inicia una transacción, añade a la tabla personas un registro y después realizas un commit. 
¿Qué ha sucedido en este caso?
*/

start transaction;

insert into personas (nombre, mail)
values
('Diego Simeone', 'cholo@atleti.com');

commit;

select * from personas;

/*
Inicia una transacción, modifica el nombre de la primera persona por el tuyo.
 Define un paso de control llamado PASO1. Borra todos los registros exceptuando el primero.
Haz un ROLLBACK al PASO1, y luego realiza un COMMIT. Comprueba y comenta que ha sucedido.
*/

SET SQL_SAFE_UPDATES = 0;

start transaction;

UPDATE personas
SET nombre = 'Jesus'
WHERE codigo = 1;

savepoint paso1;

DELETE FROM personas
WHERE codigo <> 1;

rollback to paso1;

commit;


/*
Explica la diferencia entre bloquear para escritura y lectura. 
Bloquea la tabla personas primero para escritura y luego para lectura.
 Intenta modificar alguna fila de datos. Comprobar y comentar los resultados.
*/


-- Bloqueo Write
LOCK TABLES personas WRITE;

UPDATE personas
SET nombre = 'KokeResurreción' 
WHERE codigo = 1;

UNLOCK TABLES;


-- Bloqueo Read
LOCK TABLES personas READ;

UPDATE personas 
SET nombre = 'Jimmy Hasselbaink' 
WHERE codigo = 1;

UNLOCK TABLES;