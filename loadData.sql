---------------- POBLADO DE DATOS ---------------------------

INSERT INTO Comuna (id_comuna, nombre_comuna) VALUES 
(1, 'Santiago'),
(2, 'Providencia');

INSERT INTO Cliente (id_cliente, nombre_cliente, contrasena_cliente, correo_cliente, genero, fecha_nacimiento, id_comuna) VALUES 
(1, 'Juan Pérez', 'pass123', 'juan@gmail.com', 'Masculino', '1990-05-20', 1),
(2, 'María Gómez', 'clave456', 'maria@gmail.com', 'Femenino', '1985-08-10', 2),
(3, 'Francisco Garcia', 'pass1223', 'fran@gmail.com', 'Masculino', '1996-05-20', 1),
(4, 'Ana Rodríguez', 'ana789', 'ana@gmail.com', 'Femenino', '1992-11-15', 2),
(5, 'Carlos Sánchez', 'carlitos321', 'carlos@gmail.com', 'Masculino', '1988-07-25', 2),
(6, 'Laura Fernández', 'laura654', 'laura@gmail.com', 'Femenino', '1994-03-30', 2),
(7, 'Pedro Ramírez', 'pedro000', 'pedro@gmail.com', 'Masculino', '1991-09-12', 1),
(8, 'Lucía Herrera', 'lucy963', 'lucia@gmail.com', 'Femenino', '1993-06-18', 2),
(9, 'Diego Torres', 'dieguito555', 'diego@gmail.com', 'Masculino', '1995-12-05', 2),
(10, 'Gabriela Castro', 'gaby789', 'gaby@gmail.com', 'Femenino', '1987-04-22', 2);


INSERT INTO Peluqueria (id_peluqueria, nombre_peluqueria, direccion_peluqueria, telefono_peluqueria, correo_peluqueria, id_comuna) VALUES 
(1, 'Peluquería Bella 1', 'Av. Santiago 123', '2223344', 'bella.stgo@peluqueria.com', 1),
(2, 'Peluquería Bella 2', 'Av. Providencia 456', '3334455', 'bella.provi@peluqueria.com', 2);

INSERT INTO Cliente_Pelu (id_cliente, id_peluqueria) VALUES 
(1, 1), -- Todos los clientes han visitado las dos peluquerias
(1, 2), 
(2, 1), 
(2, 2),
(3, 1),
(3, 2),
(4, 1), 
(4, 2), 
(5, 2),
(5, 1),
(6, 2),
(6, 1), 
(7, 1), 
(7, 2),
(8, 1),
(8, 2),
(9, 2), 
(9, 1), 
(10, 2),
(10, 1);




INSERT INTO Peluquero (id_peluquero, nombre_peluquero, contrasena_peluquero) VALUES 
(1, 'Carlos Jara', 'corte123'),
(2, 'Ana Urzua', 'tijera123'),
(3, 'Pedro Fuentes', 'style456'),
(4, 'María López', 'hair789'),
(5, 'Javier Ríos', 'look101'),
(6, 'Camila Torres', 'scissors202'),
(7, 'Felipe Vega', 'haircut303'),
(8, 'Valentina Araya', 'beauty404'),
(9, 'Daniel Muñoz', 'shave505'),
(10, 'Fernanda Castillo', 'glamour606'),
(11, 'Gonzalo Herrera', 'barber707'),
(12, 'Sofía Miranda', 'chic808'),
(13, 'Rodrigo Pino', 'fashion909'),
(14, 'Isidora Alarcón', 'elegance1010');


INSERT INTO Sueldo (id_sueldo, monto, fecha_pago) VALUES 
(1, 700000, '2025-03-01'),
(2, 650000, '2025-03-01');

INSERT INTO Empleado (id_empleado, nombre_empleado, contrasena_empleado, id_peluqueria, id_sueldo, id_peluquero) VALUES 
(1, 'Carlos Jara', 'corte123', 1, 2, 1),
(2, 'Ana Urzua', 'tijera123', 2, 1, 2),
(3, 'Pedro Fuentes', 'style456', 1, 2, 3),
(4, 'María López', 'hair789', 1, 1, 4),
(5, 'Javier Ríos', 'look101', 1, 1, 5),
(6, 'Camila Torres', 'scissors202', 1, 1, 6),
(7, 'Felipe Vega', 'haircut303', 1, 1, 7),
(8, 'Valentina Araya', 'beauty404', 2, 2, 8),
(9, 'Daniel Muñoz', 'shave505', 2, 2, 9),
(10, 'Fernanda Castillo', 'glamour606', 2, 2, 10),
(11, 'Gonzalo Herrera', 'barber707', 2, 2, 11),
(12, 'Sofía Miranda', 'chic808', 2, 2, 12),
(13, 'Rodrigo Pino', 'fashion909', 2, 2, 13),
(14, 'Isidora Alarcón', 'elegance1010', 2, 2, 14),

(15, 'Rodrigo Garcia', 'fashion999', 2, 2, NULL),
(16, 'Isidora Villanueva', 'Hence1010', 2, 1, NULL);


INSERT INTO Horario (id_horario, horario_inicio, horario_fin) VALUES 
(1, '09:00', '10:00'),
(2, '10:30', '11:30'),
(3, '12:00', '13:00');

INSERT INTO Servicio (id_servicio, nombre_servicio, precio_servicio, descripcion) VALUES 
(1, 'Corte de Pelo', 10000, 'Corte clásico'),
(2, 'Lavado de Pelo', 5000, 'Lavado con productos naturales'),
(3, 'Tenir cabello', 30000, 'Tine tu cabello del color que gustes'),
(4, 'Corte de barba', 5000, 'Corte clásico de la barba'),
(5, 'Corte de pelo + barba', 15000, 'Corte clásico de pelo más barba');


INSERT INTO Producto (id_producto, nombre_producto, precio_producto) VALUES 
(1, 'Gel Fijador', 2000),
(2, 'Champú Anticaída', 4500);

INSERT INTO Pago (id_pago, monto, metodo_pago, fecha_pago) VALUES
(1, 10000, 'Efectivo', '2019-05-01'), 
(2, 5000, 'Efectivo', '2019-05-01'), 
(3, 5000, 'Débito', '2019-05-01'),
(12, 30000, 'Débito', '2019-05-01'),

(4, 10000, 'Efectivo', '2019-05-02'), 
(5, 10000, 'Efectivo', '2019-05-02'), 
(6, 5000, 'Efectivo', '2019-05-02'), 

(7, 5000, 'Efectivo', '2019-05-02'),
(8, 9500, 'Efectivo', '2019-05-02'),

(9, 7000, 'Efectivo', '2019-05-02'),
(10, 10000, 'Efectivo', '2019-05-02'),

(11, 7000, 'Efectivo', '2019-05-02'),

(25, 5000, 'Efectivo', '2020-01-10'), -- Servicio barba
(26, 5000, 'Efectivo', '2020-01-11'), -- Servicio barba





--Pago pelu 2

(13, 10000, 'Débito', '2019-06-10'), --Cliente 1
(14, 5000, 'Débito', '2019-06-10'), -- Cliente 2
(15, 30000, 'Débito', '2019-06-10'), -- Cliente 3

(16, 30000, 'Débito', '2019-06-10'), -- Cliente 4
(17, 30000, 'Débito', '2019-06-10'), --Cliente 5
(18, 30000, 'Débito', '2019-06-10'), -- Cliente 6

(19, 30000, 'Débito', '2019-06-10'), -- Cliente 7
(20, 30000, 'Débito', '2019-06-10'), -- Cliente 8
(21, 30000, 'Débito', '2019-06-10'), -- Cliente 9

(22, 30000, 'Débito', '2019-06-10'), --	Cliente 10
(23, 10000, 'Débito', '2019-06-10'), -- Cliente 10
(24, 5000, 'Débito', '2019-06-10'), -- Cliente 10

(27, 15000, 'Efectivo', '2020-01-12'); -- Servicio barba mas pelo


INSERT INTO Detalles (id_detalle, id_producto, id_servicio, id_pago) VALUES 
(1, NULL, 1, 1),
(2, NULL, 2, 2),
(3, NULL, 2, 3),
(4, NULL, 1, 4),
(5, NULL, 1, 5),
(6, NULL, 2, 6),
(7, NULL, 2, 7),
(8, 2, 2, 8),
(9, 1, 2, 9),
(10, NULL, 2, 10),
(11, 1, 1, 11),

(12, NULL, 3, 12),
(13, NULL, 1, 13),
(14, NULL, 2, 14),
(15, NULL, 3, 15),
(16, NULL, 3, 16),
(17, NULL, 3, 17),
(18, NULL, 3, 18),
(19, NULL, 3, 19),
(20, NULL, 3, 20),
(21, NULL, 3, 21),
(22, NULL, 3, 22),
(23, NULL, 1, 23),
(24, NULL, 2, 24),
(25, NULL, 4, 25),
(26, NULL, 4, 26),
(27, NULL, 5, 27);




INSERT INTO Cita (id_cita, fecha_cita, duracion, id_cliente, id_peluqueria, id_horario, id_detalle, id_peluquero) VALUES
(1, '2019-05-01 09:00:00', 30, 1, 1, 1, 1, 1),
(2, '2019-05-01 10:30:00', 30, 2, 1, 2, 2, 1),
(3, '2019-05-01 11:00:00', 30, 3, 1, 2, 3, 3),
(12, '2019-05-01 12:30:00', 30, 10, 1, 3, 1, 1),

(4, '2019-05-02 10:30:00', 30, 1, 1, 2, 4, 1),
(5, '2019-05-02 10:30:00', 30, 2, 1, 2, 5, 3),
(6, '2019-05-02 10:30:00', 30, 3, 1, 2, 6, 4),
(7, '2019-05-02 11:00:00', 30, 4, 1, 2, 7, 5),
(8, '2019-05-02 11:00:00', 30, 5, 1, 2, 8, 6),
(9, '2019-05-02 12:30:00', 30, 6, 1, 3, 9, 7),
(10, '2019-05-02 12:30:00', 30, 7, 1, 3, 10, 3),
(11, '2019-05-02 09:00:00', 30, 10, 1, 1, 11, 1),

(25, '2020-01-10 09:00:00', 30, 1, 1, 1, 25, 1),
(26, '2020-01-11 09:00:00', 30, 7, 1, 1, 26, 1),


--Pelu 2
(13, '2019-06-10 09:30:00', 30, 1, 2, 1, 13, 2),
(14, '2019-06-10 09:30:00', 30, 2, 2, 1, 14, 8),
(15, '2019-06-10 09:30:00', 30, 3, 2, 1, 15, 9),
(16, '2019-06-10 09:00:00', 30, 4, 2, 1, 16, 10),
(17, '2019-06-10 09:10:00', 30, 5, 2, 1, 17, 11),

(18, '2019-06-10 10:30:00', 30, 6, 2, 2, 18, 12),
(19, '2019-06-10 10:30:00', 30, 7, 2, 2, 19, 13),
(20, '2019-06-10 10:45:00', 30, 8, 2, 2, 20, 14),
(21, '2019-06-10 11:00:00', 30, 9, 2, 2, 21, 2),

(22, '2019-06-10 12:30:00', 30, 10, 2, 3, 22, 8),
(23, '2019-06-10 12:20:00', 30, 4, 2, 3, 23, 12),
(24, '2019-06-10 12:15:00', 30, 4, 2, 3, 24, 10),

(27, '2020-01-12 09:00:00', 30, 5, 2, 1, 27, 6);

-- Citas para 2021
INSERT INTO Cita (id_cita, fecha_cita, duracion, id_cliente, id_peluqueria, id_horario, id_detalle, id_peluquero) VALUES
-- Enero
(30, '2021-01-05 09:00:00', 30, 1, 1, 1, 1, 1),
(31, '2021-01-10 10:00:00', 30, 2, 1, 2, 2, 1),
(32, '2021-01-12 11:00:00', 30, 3, 1, 2, 3, 2),
-- Febrero
(33, '2021-02-03 09:00:00', 30, 4, 1, 1, 4, 1),
(34, '2021-02-08 10:00:00', 30, 5, 1, 2, 5, 2),
(35, '2021-02-15 11:00:00', 30, 6, 1, 2, 6, 2),
-- Marzo
(36, '2021-03-01 09:00:00', 30, 1, 2, 1, 7, 3),
(37, '2021-03-05 09:30:00', 30, 2, 2, 1, 8, 3),
(38, '2021-03-15 11:00:00', 30, 3, 2, 2, 9, 3),
(39, '2021-03-20 12:00:00', 30, 4, 2, 3, 10, 4),
-- Abril
(40, '2021-04-02 10:00:00', 30, 5, 2, 2, 11, 5),
(41, '2021-04-10 11:00:00', 30, 6, 2, 2, 12, 5),
(42, '2021-04-18 12:30:00', 30, 7, 2, 3, 13, 5),
(43, '2021-04-22 13:00:00', 30, 8, 2, 3, 14, 5),
-- Mayo
(44, '2021-05-03 09:00:00', 30, 9, 1, 1, 15, 1),
(45, '2021-05-05 10:00:00', 30, 10, 1, 2, 16, 2),
(46, '2021-05-07 11:00:00', 30, 1, 1, 2, 17, 2),
(47, '2021-05-12 12:00:00', 30, 2, 1, 3, 18, 1);
