CREATE TABLE clientes (
	idcliente varchar (10) primary key not null ,
	nombre varchar (20) ,
	direccion varchar (20) ,
	poblacion varchar (20) ,
	facturacion int ,
	fechaalta date ,	
	credito decimal(18,2)) 
    
    
    select * 
    from clientes
    
    select nombre, direccion
    from clientes
    
    select distinct poblacion
    from clientes
    
    
    Ej1:
SELECT  nombre cliente, direccion, facturacion, facturacion-1000 as 'FACTURACION REDUCIDA'
FROM clientes;
Ej2:  
SELECT nombre, direccion, facturacion, facturacion *0.1 AS "10% de facturacion"
FROM clientes;

SELECT CONCAT(nombre,'.',direccion,'@linkia.es'), facturacion
FROM clientes;

Ej2: 

SELECT  CONCAT('El cliente ', nombre, ' es de ', poblacion) AS 'PERTENECER'
FROM clientes; 

select SUBSTRING(nombre,2,4),direccion, poblacion from clientes;

select *
from clientes
where poblacion='Barcelona'

select * 
from clientes
where facturacion>5000

select nombre, facturacion, facturacion*0.2 as incrementada
from clientes
where facturacion>50000

Ej2: Mostrar los clientes cuya facturación está comprendida entre 100000 y 600000 €

SELECT nombre, direccion, poblacion, facturacion
FROM clientes
WHERE facturacion BETWEEN 1000 AND 60000;

Ej3: Mostrar los clientes que su población sea Barcelona o Madrid

SELECT nombre, direccion, poblacion, facturacion
FROM clientes
WHERE POBLACION IN('BARCELONA','MADRID','donosti')

select * from clientes

SELECT nombre, direccion, poblacion, facturacion
FROM clientes
WHERE facturacion IN(23000,5000,89000)

 
 Ej4: Mostrar los clientes cuya dirección está vacía (NULL)

SELECT nombre, direccion, poblacion, facturacion
FROM clientes
WHERE DIRECCION IS NULL

SELECT nombre, direccion, poblacion, facturacion
FROM clientes
WHERE DIRECCION IS NOT NULL

%  *
_   ?

SELECT nombre, direccion, poblacion, facturacion
FROM clientes
WHERE POBLACION LIKE 'B%'

SELECT nombre, direccion, poblacion, facturacion
FROM clientes
WHERE POBLACION ='B%'


SELECT nombre, direccion, poblacion, facturacion
FROM clientes
WHERE POBLACION LIKE 'B_R%'


SELECT * 
FROM clientes
WHERE poblacion='barcelona'
AND facturacion>25000;


SELECT * 
FROM clientes
WHERE poblacion='barcelona'
OR facturacion>25000;

SELECT nombre, direccion, poblacion, facturacion
FROM clientes
WHERE POBLACION NOT IN('BARCELONA','MADRID')

SELECT nombre, direccion, poblacion, facturacion
FROM clientes
WHERE facturacion NOT BETWEEN 1000 AND 60000;

SELECT nombre, direccion, poblacion, facturacion
FROM CLIENTES
ORDER BY NOMBRE DESC

SELECT nombre, direccion, poblacion, facturacion
FROM CLIENTES
ORDER BY 1 DESC


SELECT nombre, direccion, poblacion, facturacion
FROM CLIENTES
ORDER BY 3

SELECT POBLACION, nombre, direccion,  facturacion
FROM CLIENTES
ORDER BY POBLACION, nombre



SELECT * 
FROM clientes 
WHERE fechaalta<'2017-12-12'
Muestra los clientes que se han dado de alta antes del 12/12/2017 
SELECT * FROM clientes WHERE fechaalta = '2010-01-01';
Muestra los clientes que se han dado de alta el 15/08/2017;


SELECT CURRENT_DATE()
from clientes

Ej2:
Nos muestra el nombre y la fecha de alta de los clientes que se han dado de alta en la empresa el día de hoy.
SELECT nombre, fechaalta
FROM clientes
WHERE fechaalta=CURRENT_DATE()
