drop database if exists colonias;
create database if not exists colonias;

use colonias;

create table casas (
	
    idcasa mediumint auto_increment,
	nombre varchar(20) not null,
    direccion varchar(20) not null,
    telefono varchar(20) not null,
    categoria enum('A','B','C','D','E'),
    constraint pk_alojamiento primary key(idcasa)
    
    );
    
insert into casas values (1, 'Casa del pinar', 'Avnd Robledo 12', '958121212', 'A');


create table cliente (

	idcliente mediumint auto_increment,
    nombre varchar(30) not null,
    personacontacto varchar(20) not null,
    nif varchar(9) not null unique,
    tipo enum ('escuela','particular') default 'escuela',
    constraint pk_cliente primary key (idcliente)
    
    );
    
    
insert into cliente values(1,'Escuela Primaria Cervantes','Miguel Vazquez','12345678A','escuela');
    
    
create table if not exists reserva (

	idcasa mediumint not null,
    idcliente mediumint  not null,
    freserva date not null,
    fentrada date not null,
    fsalida date not null,
    regimen enum ('SA','AD','MP','PC') default 'PC',
    constraint pk_reserva primary key( idcasa, idcliente, freserva),
    constraint fk_cliente foreign key(idcasa) references cliente(idcliente),
    constraint fk_casa foreign key(idcasa) references casas(idcasa),
    check (fentrada<fsalida)
    
    );
    
    
insert into reserva values (1,1,'2023-11-10','2024-05-05','2024-05-23','PC');
    
    
create table if not exists habitacion (

	numhabitacion varchar(5),
    tipo varchar(40) not null check (tipo in ('i','d','t','c')),
    banyo varchar(1)  not null check (banyo in ('s','n')),
    precio decimal(6,2) not null,
    idcasa mediumint not null,
    constraint pk_habitacion primary key (idcasa, numhabitacion),
    constraint fk_habitacion foreign key (idcasa) references casas(idcasa)
    
    );
    
    
insert into habitacion values ('A-12','d','n',53,1);



create table if not exists actividad (

	idactividad mediumint auto_increment,
    nombre varchar (20) not null,
    descripcion varchar (200) not null,
    nivel smallint not null check(nivel>=1 and nivel =<5),
    constraint pk_actividad primary key (idactividad)
    
    );
    

insert into actividad values ( 1, 'Senderismo', 'Ruta circular de 3h con inicio y salida', 2);



create table realizaactividad (
	
    idactividad mediumint not null,
    idcasa mediumint not null,
    dia varchar (15) not null,
    constraint pk_realizaactividad primary key (idcasa, idactividad),
    constraint fk_realiza_act foreign key (idactitividad) references actividad(idactividad),
    constraint fk_realiza_casa foreign key (idcasa) references casas(idcasa)
    
    );
    
    
    
  insert into realizaactividad values (1,1,'Jueves');  