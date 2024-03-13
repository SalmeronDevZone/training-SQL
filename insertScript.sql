INSERT INTO casas (nombre, direccion, telefono, categoria) VALUES
('Casa del Bosque', 'Calle Principal 34', '987654321', 'B'),
('Casa del Lago', 'Avenida del Lago 56', '123456789', 'C'),
('Casa de Montaña', 'Calle Montaña 78', '567890123', 'D'),
('Casa del Sol', 'Calle del Sol 90', '999111222', 'A'),
('Casa de Playa', 'Avenida Playa 2', '777333555', 'B'),
('Casa de Campo', 'Camino Campo 7', '111000444', 'C'),
('Casa del Mar', 'Calle del Mar 45', '222333444', 'D'),
('Casa de la Colina', 'Colina Alta 33', '555888999', 'A'),
('Casa del Río', 'Río Verde 25', '444555666', 'B'),
('Casa de la Montaña', 'Montaña Blanca 11', '666777888', 'C'),
('Casa del Viento', 'Viento Fresco 12', '888999111', 'D'),
('Casa de la Ciudad', 'Centro Urbano 9', '222444666', 'A'),
('Casa del Parque', 'Parque Central 17', '333444555', 'B'),
('Casa del Jardín', 'Jardín Bonito 8', '555666777', 'C'),
('Casa del Arroyo', 'Arroyo Sereno 14', '999000111', 'D');


INSERT INTO cliente (nombre, personacontacto, nif, tipo) VALUES
('Escuela Secundaria García', 'Ana Pérez', '87654321B', 'escuela'),
('Cliente Particular 1', 'Cliente 1', '11111111X', 'particular'),
('Cliente Particular 2', 'Cliente 2', '22222222Y', 'particular'),
('Escuela de Idiomas ABC', 'Laura García', '33333333Z', 'escuela'),
('Cliente Particular 3', 'Cliente 3', '44444444A', 'particular'),
('Cliente Particular 4', 'Cliente 4', '55555555B', 'particular'),
('Escuela de Arte XYZ', 'Carlos Martínez', '66666666C', 'escuela'),
('Cliente Particular 5', 'Cliente 5', '77777777D', 'particular'),
('Cliente Particular 6', 'Cliente 6', '88888888E', 'particular'),
('Escuela de Música 123', 'Sara López', '99999999F', 'escuela'),
('Cliente Particular 7', 'Cliente 7', '00000000G', 'particular'),
('Cliente Particular 8', 'Cliente 8', '12345678H', 'particular'),
('Escuela de Ciencias 789', 'Daniel Rodríguez', '23456789I', 'escuela'),
('Cliente Particular 9', 'Cliente 9', '34567890J', 'particular'),
('Cliente Particular 10', 'Cliente 10', '45678901K', 'particular');


INSERT INTO reserva (idcasa, idcliente, freserva, fentrada, fsalida, regimen) VALUES
(2, 2, '2023-12-05', '2024-02-10', '2024-02-15', 'AD'),
(3, 3, '2023-11-20', '2024-01-05', '2024-01-15', 'SA'),
(4, 4, '2023-10-15', '2024-03-01', '2024-03-10', 'MP'),
(5, 5, '2023-11-25', '2024-06-20', '2024-07-05', 'PC'),
(1, 6, '2023-12-01', '2024-04-10', '2024-04-20', 'AD'),
(2, 7, '2023-12-10', '2024-05-15', '2024-05-25', 'SA'),
(3, 8, '2023-11-15', '2024-02-01', '2024-02-10', 'MP'),
(4, 9, '2023-10-20', '2024-04-05', '2024-04-15', 'PC'),
(5, 10, '2023-11-05', '2024-03-10', '2024-03-20', 'AD'),
(1, 11, '2023-12-20', '2024-06-05', '2024-06-15', 'SA'),
(2, 12, '2023-11-30', '2024-05-01', '2024-05-10', 'MP'),
(3, 13, '2023-10-25', '2024-04-15', '2024-04-25', 'PC'),
(4, 14, '2023-11-15', '2024-02-20', '2024-03-01', 'AD'),
(5, 15, '2023-11-10', '2024-01-20', '2024-01-30', 'SA');



INSERT INTO habitacion (numhabitacion, tipo, banyo, precio, idcasa) VALUES
('B-34', 'i', 's', 75.50, 2),
('C-56', 't', 'n', 60.25, 3),
('D-78', 'c', 's', 85.00, 4),
('E-12', 'd', 'n', 70.75, 5),
('F-34', 'i', 's', 55.00, 1),
('G-56', 't', 'n', 45.25, 2),
('H-78', 'c', 's', 80.50, 3),
('I-12', 'd', 'n', 65.75, 4),
('J-34', 'i', 's', 72.00, 5),
('K-56', 't', 'n', 62.25, 1),
('L-78', 'c', 's', 88.50, 2),
('M-12', 'd', 'n', 73.75, 3),
('N-34', 'i', 's', 58.00, 4),
('O-56', 't', 'n', 49.25, 5),
('P-78', 'c', 's', 82.50, 1);


INSERT INTO actividad (nombre, descripcion, nivel) VALUES
( 'Ciclismo', 'Ruta de montaña de 4 horas', 3),
( 'Natación', 'Clases de natación para principiantes', 1),
( 'Escalada en Roca', 'Excursión de escalada en una montaña local', 4),
( 'Yoga', 'Clases de yoga para relajación y flexibilidad', 2),
( 'Paseo en Kayak', 'Exploración en kayak en un río cercano', 3),
( 'Fútbol', 'Partido de fútbol recreativo', 4),
( 'Patinaje en Línea', 'Recorrido por el parque en patines', 2),
( 'Clases de Cocina', 'Aprende a cocinar platos deliciosos', 1),
( 'Visita a Museo', 'Tour cultural en un museo local', 2),
( 'Tiro con Arco', 'Lecciones de tiro con arco', 4),
( 'Observación de Aves', 'Excursión de avistamiento de aves', 3),
( 'Paintball', 'Combate de paintball en el bosque', 5),
( 'Buceo', 'Inmersiones submarinas en arrecifes', 5),
( 'Paseo a Caballo', 'Recorrido a caballo por el campo', 3),
( 'Clases de Baile', 'Aprende a bailar diferentes estilos', 2);


INSERT INTO realizaactividad (idactividad, idcasa, dia) VALUES
(2, 2, 'Viernes'),
(3, 3, 'Sábado'),
(4, 4, 'Domingo'),
(5, 5, 'Lunes'),
(1, 6, 'Martes'),
(2, 7, 'Miércoles'),
(3, 8, 'Jueves'),
(4, 9, 'Viernes'),
(5, 10, 'Sábado'),
(1, 11, 'Domingo'),
(2, 12, 'Lunes'),
(3, 13, 'Martes'),
(4, 14, 'Miércoles'),
(5, 15, 'Jueves');
