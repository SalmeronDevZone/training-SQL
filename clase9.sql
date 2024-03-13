CREATE TABLE clientes (
	idcliente varchar (10) primary key not null ,
	nombre varchar (20) ,
	direccion varchar (20) ,
	poblacion varchar (20) ,
	facturacion int ,
	fechaalta date ,	
	credito decimal(18,2)) 



Ej1: Introducimos todos los campos.

insert into clientes
values('221','Alberto Milián', 'Rbla Poblenou 54', 'Barcelona',1300, '2015-09-30',1200.45)

Ej2: Introducimos algunos campos

insert into clientes (idcliente,nombre)
values('222','clicky')

Ej3: Introducir varios registros con el mismo INSERT.

insert into clientes
values('223','linkia', 'Pelai 8', 'Barcelona',1300, '2015-12-30',1200.45),
('224','Montalban', 'Av. Madrid 17', 'Teruel',1500, '2015-07-30',1700.45)

INSERT INTO clientes
SET idcliente='226', nombre = 'AYUNTAMIENTO BCN'



CREATE TABLE clientes_barcelona
AS SELECT * FROM clientes
WHERE poblacion='barcelona'

drop table clientes_barcelona

1.1.2. COPIAR REGISTROS DE OTRA TABLA(EXISTE TABLA DESTINO)
Dada esta tabla(misma BBDD que ejercicios anteriores)


CREATE TABLE clientes_barcelona (
idcliente varchar (10) primary key not null ,
nombre varchar (20) ,
direccion varchar (20) ,
poblacion varchar (20) ,
Facturacion int ,
fechaalta datetime ,
credito numeric(18,2)) 

-- No usamos la cláusula VALUES y ponemos un SELECT como si fuese una subconsulta


insert into clientes_barcelona
(idcliente,nombre,poblacion,facturacion,credito)
select idcliente,nombre,poblacion,facturacion,credito 
from clientes
where poblacion='barcelona'

ORDEN UPDATE


SELECT * FROM CLIENTES
EJEMPLO 1

UPDATE CLIENTES
SET CREDITO=CREDITO+1000







WHERE IDCLIENTE='221'

UPDATE CLIENTES
SET CREDITO=CREDITO+1000
WHERE POBLACION='BARCELONA'



select * from clientes



DELETE

DELETE FROM CLIENTES
WHERE POBLACION='BARCELONA'





Incrementar el crédito un 10% a todos los clientes cuya facturación esté entre 100000 y 200000 euros


UPDATE CLIENTES
SET credito=credito*1.1
WHERE FACTURACION BETWEEN 100000 AND 200000

truncate table clientes    
