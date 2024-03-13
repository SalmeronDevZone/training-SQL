-- Incrementar el crédito un 10% a todos los clientes cuya facturación este comprendida entre 100000 y 200000


select * from clientes

update clientes
set credito = credito*1.1
where facturacion between 100000 and 200000

select * from filial

-- Borrar las filiales de acs(es el cliente 3)
delete from filial
where idcliente=(select idcliente from clientes where nombre='acs')

drop database asixlinkia2
create database asixlinkia2

CREATE TABLE CLIENTES
(CIF varchar(9) primary key not null,
nombre varchar(30) not null,
direccion varchar(50),
poblacion set ('Barcelona','Teruel','Badajoz'),
web varchar(60),
correo varchar(40)) 

CREATE TABLE facturas
(Idfactura int auto_increment primary key not null,
Fechafactura datetime ,
total decimal(12,2),
iva decimal(10,2),
descuento decimal(10,2),
cif varchar(9) not null,
constraint fk_clientes_facturas foreign key(cif) references clientes(cif) on update cascade)

-- Transacciones

delete  from clientes

start transaction

insert into clientes (idcliente, nombre)
values('1003','pepe3')
-- Si ahora pasa algo, el sistema cuando lo levante pepe3 no estará
insert into clientes (idcliente, nombre)
values('1004','pepe4')

rollback

select * from clientes


-- Ejemplo ppt

start transaction;
insert into clientes(idcliente,nombre,poblacion) values (10001,'cli40','Barcelona');
savepoint P1;
insert into clientes(idcliente,nombre,poblacion) values (11002,'cli50','Barcelona');
savepoint P2; 
insert into clientes(idcliente,nombre,poblacion) values (12003,'cli60','Barcelona'); 
SELECT * FROM clientes; 
rollback TO P1;  -- Deshacemos los insert de 'cli5' y 'cli6' SELECT * FROM clientes; rollback TO P2; /* Dará error (al haber hecho rollback a P1 desaparece P2) */
 commit;



select * from clientes

update
-- Bloqueo con read
LOCK TABLE clientes READ

INSERT INTO CLIENTES (idcliente, nombre) VALUES (789, 'pedrito');  -- Al estar bloqueada no nos deja modificarla

SELECT * FROM CLIENTES filial           -- Sí que podemos leerla

UNLOCK TABLES

-- Bloqueo con WRITE
LOCK TABLE clientes WRITE
INSERT INTO CLIENTES (idcliente, nombre) VALUES (7890, 'pedrito2'); -- Al estar bloqueada WRITE nos dejará actualizar

SELECT * FROM CLIENTES  -- Sí que podemos leerla

UNLOCK TABLES
describe clientes

 Ejemplo 1: Adición de una columna:
 
ALTER TABLE CLIENTES
ADD codrep varchar(20) NULL

Ejemplo 2: Añadir una columna en un sitio en concreto, en este caso después de dirección

ALTER TABLE CLIENTES
ADD TELEFONO varchar(12)
AFTER direccion

Ejemplo 3: Añadir una columna como primer campo de una tabla

ALTER TABLE CLIENTES
ADD column CIF_CLIENTE2 VARCHAR(15)
FIRST


Ejemplo 4: Supresión de restricción FOREIGN KEY:  
 
ALTER TABLE filial
DROP FOREIGN KEY FK_FILIAL_CLIENTES


Ejemplo 5: Añadir una restricción 

ALTER TABLE filial
ADD CONSTRAINT FK_FILIAL_CLIENTES 
FOREIGN KEY(idcliente) REFERENCES clientes(idcliente) 
ON DELETE CASCADE 
ON UPDATE CASCADE


select * from clientes
select * from filial
PASO 1: Creo el campo PRESUPUESTO en la tabla FILIAL

ALTER TABLE FILIAL
ADD COLUMN (presupuesto DECIMAL (12,2) NOT NULL);

PASO 2: Actualizamos dicha columna con el 10% del presupuesto del cliente

UPDATE filial f JOIN clientes c
ON f.idcliente=c.idcliente
SET f.presupuesto = (c.facturacion * 0.10);

-- vistas

select * from clientes



CREATE VIEW clientebarna 
AS 
SELECT * FROM clientes
WHERE poblacion='barcelona'



select * from clientebarna 

INSERT INTO clientebarna(idcliente, nombre,poblacion) VALUES (791, 'chotis','Teruel'); 


-- with check option
drop view clientebarna 

CREATE VIEW clientebarna 
AS 
SELECT * FROM clientes
WHERE poblacion='barcelona'
with check option


select * from clientebarna 

INSERT INTO clientebarna(idcliente, nombre,poblacion) VALUES (792, 'chotis3','madrid'); 

create database pepe


create table clientes
as
select * from asixlinkia.clientes


