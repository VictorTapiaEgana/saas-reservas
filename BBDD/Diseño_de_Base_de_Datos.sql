CREATE TABLE Empresas (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo ENUM('belleza', 'estetica', 'bienestar') NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_empresa INT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2),
    duracion INT NOT NULL, -- Duración en minutos
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa) ON DELETE CASCADE
);

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_servicio INT,
    id_prestador INT,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_servicio) REFERENCES Servicios(id_servicio) ON DELETE CASCADE,
    FOREIGN KEY (id_prestador) REFERENCES Prestadores(id_prestador) ON DELETE CASCADE,
    UNIQUE (id_prestador, fecha, hora)
);

CREATE TABLE DiasSemana (
    id_dia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Horarios (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    id_prestador INT,
    id_dia INT,
    hora_inicio TIME,
    hora_fin TIME,
    FOREIGN KEY (id_prestador) REFERENCES Prestadores(id_prestador),
    FOREIGN KEY (id_dia) REFERENCES DiasSemana(id_dia) 
);

CREATE TABLE Prestadores (
    id_prestador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_empresa INT,
    especialidad VARCHAR(100),
    telefono VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa) ON DELETE SET NULL
);

CREATE TABLE Tipo_Prestador (
    id_tipoprestador INT AUTO_INCREMENT,
    tipo VARCHAR(40) NOT NULL,
    PRIMARY KEY (id_tipoprestador)  
);

CREATE TABLE users (	
    id  int auto_increment primary key,
    nombre varchar(60),
    pass varchar (255)
);

ALTER TABLE Empresas
ADD COLUMN imagen VARCHAR(200);

ALTER TABLE Prestadores
ADD COLUMN imagen VARCHAR(200);

INSERT INTO users ( nombre,pass) VALUES ('admin','admin123');

INSERT INTO DiasSemana (nombre) VALUES 
('Lunes'), 
('Martes'), 
('Miércoles'), 
('Jueves'), 
('Viernes'), 
('Sábado'), 
('Domingo');

INSERT INTO tipo_prestador (tipo) VALUES
('esteticista'),
('psicologo(a)'),
('trumatologo(a)'),
('barbero(a)'),
('terapeuta'),
('entrenador(a)');

INSERT INTO Empresas (id_empresa, nombre, tipo, direccion, telefono, created_at) VALUES
(1, 'Belleza Total', 'belleza', 'Calle 1', '123456789', CURRENT_TIMESTAMP),
(2, 'Salud y Estética', 'estetica', 'Calle 2', '987654321', CURRENT_TIMESTAMP),
(3, 'Gimnasio Fit', 'bienestar', 'Calle 3', '456123789', CURRENT_TIMESTAMP),
(4, 'Spa Relax', 'estetica', 'Calle 4', '789456123', CURRENT_TIMESTAMP),
(5, 'Yoga Zen', 'bienestar', 'Calle 5', '321654987', CURRENT_TIMESTAMP);

INSERT INTO Prestadores (id_prestador, nombre, id_empresa, especialidad, telefono, created_at) VALUES
(1, 'Juan Perez', 1, 'Estilista', '111111111', CURRENT_TIMESTAMP),
(2, 'Maria Lopez', 1, 'Colorista', '222222222', CURRENT_TIMESTAMP),
(3, 'Carlos Sanchez', 2, 'Esteticista', '333333333', CURRENT_TIMESTAMP),
(4, 'Ana Gomez', 2, 'Masajista', '444444444', CURRENT_TIMESTAMP),
(5, 'Pedro Ramirez', 3, 'Entrenador', '555555555', CURRENT_TIMESTAMP),
(6, 'Laura Torres', 3, 'Instructor de Pilates', '666666666', CURRENT_TIMESTAMP),
(7, 'Diego Fernandez', 4, 'Masajista', '777777777', CURRENT_TIMESTAMP),
(8, 'Sara Ortiz', 4, 'Esteticista', '888888888', CURRENT_TIMESTAMP),
(9, 'Luis Castillo', 5, 'Instructor de Yoga', '999999999', CURRENT_TIMESTAMP),
(10, 'Elena Martinez', 5, 'Instructor de Meditación', '101010101', CURRENT_TIMESTAMP);

INSERT INTO Tipo_Prestador (id_tipoprestador, tipo) VALUES
(7, 'masajista'),
(8, 'esteticista'),
(9, 'instructor de yoga'),
(10, 'instructor de meditación');

INSERT INTO Clientes (id_cliente, nombre, email, telefono, created_at) VALUES
(1, 'Cliente Uno', 'cliente1@example.com', '111222333', CURRENT_TIMESTAMP),
(2, 'Cliente Dos', 'cliente2@example.com', '444555666', CURRENT_TIMESTAMP),
(3, 'Cliente Tres', 'cliente3@example.com', '777888999', CURRENT_TIMESTAMP),
(4, 'Cliente Cuatro', 'cliente4@example.com', '101112131', CURRENT_TIMESTAMP),
(5, 'Cliente Cinco', 'cliente5@example.com', '141516171', CURRENT_TIMESTAMP);

INSERT INTO Servicios (id_servicio, id_empresa, nombre, descripcion, precio, duracion, created_at) VALUES
(1, 1, 'Corte de Pelo', 'Corte de pelo estilista', 20.00, 30, CURRENT_TIMESTAMP),
(2, 2, 'Masaje Relajante', 'Masaje de una hora', 50.00, 60, CURRENT_TIMESTAMP),
(3, 3, 'Entrenamiento Personal', 'Sesión de entrenamiento', 30.00, 45, CURRENT_TIMESTAMP),
(4, 4, 'Spa Completo', 'Sesión completa de spa', 80.00, 90, CURRENT_TIMESTAMP),
(5, 5, 'Clase de Yoga', 'Clase de yoga en grupo', 15.00, 60, CURRENT_TIMESTAMP);

INSERT INTO Reservas (id_reserva, id_cliente, id_servicio, id_prestador, fecha, hora, created_at) VALUES
(1, 1, 1, 1, '2024-08-01', '09:00:00', CURRENT_TIMESTAMP),
(2, 2, 2, 3, '2024-08-01', '10:00:00', CURRENT_TIMESTAMP),
(3, 3, 3, 5, '2024-08-01', '11:00:00', CURRENT_TIMESTAMP),
(4, 4, 4, 7, '2024-08-02', '12:00:00', CURRENT_TIMESTAMP),
(5, 5, 5, 9, '2024-08-02', '13:00:00', CURRENT_TIMESTAMP);

INSERT INTO Horarios (id_horario, id_prestador, id_dia, hora_inicio, hora_fin) VALUES
(1, 1, 1, '09:00:00', '17:00:00'),
(2, 2, 2, '10:00:00', '18:00:00'),
(3, 3, 3, '09:00:00', '15:00:00'),
(4, 4, 4, '12:00:00', '20:00:00'),
(5, 5, 5, '08:00:00', '16:00:00'),
(6, 6, 6, '07:00:00', '15:00:00'),
(7, 7, 1, '11:00:00', '19:00:00'),
(8, 8, 2, '09:00:00', '17:00:00'),
(9, 9, 3, '10:00:00', '18:00:00'),
(10, 10, 4, '08:00:00', '16:00:00');

