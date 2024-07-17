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
    FOREIGN KEY (id_prestador) REFERENCES Prestadores(id_prestador) ON DELETE CASCADE,
    FOREIGN KEY (id_dia) REFERENCES DiasSemana(id_dia) ON DELETE CASCADE
);
drop table prestadores;
drop table Tipo_Prestador;

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
    id_tipoprestador INT,
    tipo VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_tipoprestador),
    FOREIGN KEY (id_tipoprestador) REFERENCES Prestadores(id_prestador) ON DELETE CASCADE
);



INSERT INTO DiasSemana (nombre) VALUES 
('Lunes'), 
('Martes'), 
('Miércoles'), 
('Jueves'), 
('Viernes'), 
('Sábado'), 
('Domingo');

