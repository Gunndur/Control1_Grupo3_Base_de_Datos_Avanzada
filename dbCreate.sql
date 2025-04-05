-- Tabla: Comuna
CREATE TABLE Comuna (
    id_comuna SERIAL PRIMARY KEY,
    nombre_comuna VARCHAR(30) NOT NULL
);

-- Tabla: Cliente
CREATE TABLE Cliente (
    id_cliente SERIAL PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    contrasena_cliente VARCHAR(100),
    correo_cliente VARCHAR(100),
    genero VARCHAR(20),
    fecha_nacimiento DATE,
    id_comuna INT REFERENCES Comuna(id_comuna)
);

-- Tabla: Peluqueria
CREATE TABLE Peluqueria (
    id_peluqueria SERIAL PRIMARY KEY,
    nombre_peluqueria VARCHAR(50),
    direccion_peluqueria VARCHAR(100),
    telefono_peluqueria VARCHAR(30),
    correo_peluqueria VARCHAR(100),
    id_comuna INT REFERENCES Comuna(id_comuna)
);

-- Tabla: Cliente_Pelu
CREATE TABLE Cliente_Pelu (
    id_cliente_peluqueria SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES Cliente(id_cliente),
    id_peluqueria INT REFERENCES Peluqueria(id_peluqueria)
);

-- Tabla: Sueldo
CREATE TABLE Sueldo (
    id_sueldo SERIAL PRIMARY KEY,
    monto INT,
    fecha_pago DATE
);

-- Tabla: Peluquero
CREATE TABLE Peluquero (
    id_peluquero SERIAL PRIMARY KEY,
    nombre_peluquero VARCHAR(100),
    contrasena_peluquero VARCHAR(50)
);

-- Tabla: Empleado
CREATE TABLE Empleado (
    id_empleado SERIAL PRIMARY KEY,
    nombre_empleado VARCHAR(100),
    contrasena_empleado VARCHAR(50),
    id_peluqueria INT REFERENCES Peluqueria(id_peluqueria),
    id_sueldo INT REFERENCES Sueldo(id_sueldo),
    id_peluquero INT REFERENCES Peluquero(id_peluquero)
);

-- Tabla: Horario
CREATE TABLE Horario (
    id_horario SERIAL PRIMARY KEY,
    horario_inicio TIME,
    horario_fin TIME
);

-- Tabla: Servicio
CREATE TABLE Servicio (
    id_servicio SERIAL PRIMARY KEY,
    nombre_servicio VARCHAR(50),
    precio_servicio INT,
    descripcion VARCHAR(100)
);

-- Tabla: Producto
CREATE TABLE Producto (
    id_producto SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(50),
    precio_producto INT
);

-- Tabla: Pago
CREATE TABLE Pago (
    id_pago SERIAL PRIMARY KEY,
    monto INT,
    metodo_pago VARCHAR(50),
    fecha_pago DATE
);

-- Tabla: Detalles
CREATE TABLE Detalles (
    id_detalle SERIAL PRIMARY KEY,
    id_producto INT REFERENCES Producto(id_producto),
    id_servicio INT REFERENCES Servicio(id_servicio),
    id_pago INT REFERENCES Pago(id_pago)
);

-- Tabla: Cita
CREATE TABLE Cita (
    id_cita SERIAL PRIMARY KEY,
    fecha_cita TIMESTAMP,
    duracion INT,
    id_cliente INT REFERENCES Cliente(id_cliente),
    id_peluqueria INT REFERENCES Peluqueria(id_peluqueria),
    id_horario INT REFERENCES Horario(id_horario),
    id_detalle INT REFERENCES Detalles(id_detalle),
    id_peluquero INT REFERENCES Peluquero(id_peluquero)
);
