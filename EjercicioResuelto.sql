
-- se elimina la bdd
drop database COLONIAS;

-- creamos bdd
create database  if not exists COLONIAS;

-- confirma que se ha creado la base de dato
show databases;

-- usamos la base de datos COLONIAS
use COLONIAS;

--  creamos la tabla casa en caso de que no exista
create table if not exists casas (

-- atributos de la tabla casa

idCasa int primary key auto_increment, 
nombre varchar (50) not null, 
direccion varchar (50) not null, 
telefono int (12) not null, 
categoria char (1) check (categoria in ('A', 'B', 'C', 'D', 'E'))
);

-- creamos la tabla actividad con sus atributos
create table actividades (
id_actividad int primary key auto_increment, 
nombre varchar (50) not null, 
-- el nivel sólo podra ser entre 1 y 5
nivel  int (1)  check ( nivel in (1-5)), 
descripcion varchar (50) not null);

-- creamos la tabla cliente con sus atributos
create table CLIENTE (
idCliente int primary key auto_increment,
NIF varchar (20)  not null, 
Nombre varchar (50)  not null, 
persona_contacto varchar (50), 
-- creamos que por defecto el tipo de cliente sea escuela y sólo pueda ser "escuela o particular"
tipo varchar (10) default 'escuela' check (tipo in ('escuela', 'particular')),
mail varchar (200) not null);

-- creamos la tabla habitacion 
create table habitacion (
Numhabitacion int primary key, 
-- el limite será de 1 sóla letra y sólo podra ser S o N
baño  char (1) check (baño in ('S', 'N')),
-- el precio será de 8 dígitocs, 6 enteros y 2 decimales, siempre mayor a 0
precio decimal (8,2) check (precio > 0 ),
-- el tipo de habitación será por defecto D
tipo_habitacion char (1) default 'D' check (tipo_habitacion in ('I','D','T','C')),
idCasa int,
-- explicamos la clave foránea (fk) referenciandolo con la tabla casa y su columna idCasa
constraint fk_idCasa foreign key (idCasa) references casas (idCasa)
);


create table realiza (
idcasa int auto_increment, 
dia date not null, 
idactividad int auto_increment,
-- se refleja la primary key, mediante constraint cuyo nombre será pk_realizaactividad
constraint pk_realizaactividad primary key (idCasa, idactividad),
-- a continuación se ve las FK con las referencias de diferentes tablas y sus respectivas columnas
constraint fk_realiza_act FOREIGN KEY (idCasa) REFERENCES CASAS (idCasa),
constraint fk_realiza_casa FOREIGN KEY (idactividad) REFERENCES actividades (id_actividad));


create table RESERVA (
idCasa int, 
idCliente int not null, 
f_reserva date not null,
f_entrada date not null,
f_salida date not null,
regimen varchar  (2) not null default 'PC' check (regimen in ('SA', 'AD', 'MP', 'PC')),

-- aquí se puede ver las  primary key 
constraint pk_reserva primary key (idCasa, idCliente),
-- a continuación se observa las foreign key
constraint fk_cliente foreign key (idcasa) references CASAS (idcasa),
constraint fk_casas foreign key (idCliente) references CLIENTE (idCliente),
-- se crea un límite que las fecha de salida siempre sean mayor a las fechas de entradas
check  ( f_entrada< f_salida));




