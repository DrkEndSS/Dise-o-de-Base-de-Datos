CREATE DATABASE Hospital;
USE Hospital;

-- TABLA PERSONA
CREATE TABLE Persona(
idPersona INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
edad INT,
genero CHAR(1),
direccion VARCHAR(200),

fechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
usuarioCreacion VARCHAR(50),
fechaModificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuarioModificacion VARCHAR(50)
);

SELECT * FROM Persona;

-- TABLA PACIENTE
CREATE TABLE Paciente(
idPaciente INT AUTO_INCREMENT PRIMARY KEY,
numeroHistoriaClinica VARCHAR(50),
tipoPaciente VARCHAR(50),
idPersona INT,

fechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
usuarioCreacion VARCHAR(50),
fechaModificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuarioModificacion VARCHAR(50),

FOREIGN KEY (idPersona) REFERENCES Persona(idPersona)
);

-- Datos PERSONA y PACIENTE
INSERT INTO Persona (nombre, edad, genero, direccion, usuarioCreacion, usuarioModificacion)
VALUES ('Derek',20,'H','Av. Te','admin','admin');

INSERT INTO Paciente (numeroHistoriaClinica,tipoPaciente,idPersona,usuarioCreacion,usuarioModificacion)
VALUES ('HC001','General',LAST_INSERT_ID(),'admin','admin');

INSERT INTO Persona (nombre, edad, genero, direccion, usuarioCreacion, usuarioModificacion)
VALUES ('Diego',15,'H','Av. Te','admin','admin');

INSERT INTO Paciente (numeroHistoriaClinica,tipoPaciente,idPersona,usuarioCreacion,usuarioModificacion)
VALUES ('HC002','Recurrente',LAST_INSERT_ID(),'admin','admin');

INSERT INTO Persona (nombre, edad, genero, direccion, usuarioCreacion, usuarioModificacion)
VALUES ('Angel',32,'H','Av. Zacatenco','admin','admin');

INSERT INTO Paciente (numeroHistoriaClinica,tipoPaciente,idPersona,usuarioCreacion,usuarioModificacion)
VALUES ('HC003','Critico',LAST_INSERT_ID(),'admin','admin');

INSERT INTO Persona (nombre, edad, genero, direccion, usuarioCreacion, usuarioModificacion)
VALUES ('Leonardo',56,'H','Av. Te','admin','admin');

INSERT INTO Paciente (numeroHistoriaClinica,tipoPaciente,idPersona,usuarioCreacion,usuarioModificacion)
VALUES ('HC004','General',LAST_INSERT_ID(),'admin','admin');

INSERT INTO Persona (nombre, edad, genero, direccion, usuarioCreacion, usuarioModificacion)
VALUES ('Fernanda',25,'M','Av. Zacatenco','admin','admin');

INSERT INTO Paciente (numeroHistoriaClinica,tipoPaciente,idPersona,usuarioCreacion,usuarioModificacion)
VALUES ('HC005','General',LAST_INSERT_ID(),'admin','admin');

SELECT * FROM Paciente;
SELECT * FROM Persona;

-- Eliminar datos de Persona
DELETE FROM Persona WHERE idPersona = 1;
DELETE FROM Persona WHERE idPersona = 2;
DELETE FROM Persona WHERE idPersona = 3;
DELETE FROM Persona WHERE idPersona = 4;
DELETE FROM Persona WHERE idPersona = 5;
DELETE FROM Persona WHERE idPersona = LAST_INSERT_ID();

-- Eliminar datos de Paciente
DELETE FROM Paciente WHERE idPersona = 1;
DELETE FROM Paciente WHERE idPersona = 2;
DELETE FROM Paciente WHERE idPersona = 3;
DELETE FROM Paciente WHERE idPersona = 4;
DELETE FROM Paciente WHERE idPersona = 5;
DELETE FROM Paciente WHERE idPersona = LAST_INSERT_ID();

-- Agregar una nueva columna
ALTER TABLE Persona
ADD COLUMN telefono VARCHAR(15);

SELECT * FROM Persona;

-- Eliminar la columna agregada
ALTER TABLE Persona
DROP COLUMN telefono;

SELECT * FROM Persona;

-- TRANSACCION de Persona
START TRANSACTION;

UPDATE Persona
SET direccion = 'Av. Zacatenco',
usuarioModificacion = 'admin'
WHERE idPersona = 1;

COMMIT;
ROLLBACK;

SELECT * FROM Persona;


-- Eliminar llave foránea
ALTER TABLE Paciente
DROP FOREIGN KEY paciente_ibfk_1;

SELECT * FROM Paciente;

-- Volver a crear la llave foránea
ALTER TABLE Paciente
ADD CONSTRAINT fk_paciente_persona
FOREIGN KEY (idPersona)
REFERENCES Persona(idPersona);

SELECT * FROM Paciente;

-- Actualizar datos
UPDATE Paciente
SET tipoPaciente = 'Urgente'
WHERE idPaciente = 1;

SELECT * FROM Paciente;

-- Regresar valor anterior
UPDATE Paciente
SET tipoPaciente = 'General'
WHERE idPaciente = 1;

SELECT * FROM Paciente;


-- TABLA EMPLEADO
CREATE TABLE Empleado(
idEmpleado INT AUTO_INCREMENT PRIMARY KEY,
salario DOUBLE,
idPersona INT,

fechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
usuarioCreacion VARCHAR(50),
fechaModificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuarioModificacion VARCHAR(50),

FOREIGN KEY (idPersona) REFERENCES Persona(idPersona)
);

-- Datos PERSONA y EMPLEADO
INSERT INTO Persona (nombre,edad,genero,direccion,usuarioCreacion,usuarioModificacion)
VALUES ('Enid',56,'H','Av. Te','admin','admin');

INSERT INTO Empleado (salario,idPersona,usuarioCreacion,usuarioModificacion)
VALUES (3000,LAST_INSERT_ID(),'admin','admin');

INSERT INTO Persona (nombre,edad,genero,direccion,usuarioCreacion,usuarioModificacion)
VALUES ('Luis',40,'H','Av. Sur','admin','admin');

INSERT INTO Empleado (salario,idPersona,usuarioCreacion,usuarioModificacion)
VALUES (4000,LAST_INSERT_ID(),'admin','admin');

INSERT INTO Persona (nombre,edad,genero,direccion,usuarioCreacion,usuarioModificacion)
VALUES ('Ana',35,'M','Av. Norte','admin','admin');

INSERT INTO Empleado (salario,idPersona,usuarioCreacion,usuarioModificacion)
VALUES (3500,LAST_INSERT_ID(),'admin','admin');

INSERT INTO Persona (nombre,edad,genero,direccion,usuarioCreacion,usuarioModificacion)
VALUES ('Carlos',50,'H','Av. Centro','admin','admin');

INSERT INTO Empleado (salario,idPersona,usuarioCreacion,usuarioModificacion)
VALUES (4500,LAST_INSERT_ID(),'admin','admin');

INSERT INTO Persona (nombre,edad,genero,direccion,usuarioCreacion,usuarioModificacion)
VALUES ('Sofia',30,'M','Av. Este','admin','admin');

INSERT INTO Empleado (salario,idPersona,usuarioCreacion,usuarioModificacion)
VALUES (3800,LAST_INSERT_ID(),'admin','admin');

SELECT * FROM Empleado;
SELECT * FROM Persona;

-- Eliminar columna
ALTER TABLE Empleado
DROP COLUMN salario;

SELECT * FROM Empleado;

-- Recuperar la columna eliminada
ALTER TABLE Empleado
ADD COLUMN salario DOUBLE;

SELECT * FROM Empleado;

-- Eliminar datos de Persona
DELETE FROM Persona WHERE idPersona = 6;
DELETE FROM Persona WHERE idPersona = 7;
DELETE FROM Persona WHERE idPersona = 8;
DELETE FROM Persona WHERE idPersona = 9;
DELETE FROM Persona WHERE idPersona = 10;
DELETE FROM Persona WHERE idPersona = LAST_INSERT_ID();

-- Eliminar datos de Empleado
DELETE FROM Empleado WHERE idPersona = 1;
DELETE FROM Empleado WHERE idPersona = 2;
DELETE FROM Empleado WHERE idPersona = 3;
DELETE FROM Empleado WHERE idPersona = 4;
DELETE FROM Empleado WHERE idPersona = 5;
DELETE FROM Empleado WHERE idPersona = LAST_INSERT_ID();

-- TABLA DOCTOR
CREATE TABLE Doctor(
idDoctor INT AUTO_INCREMENT PRIMARY KEY,
especialidad VARCHAR(100),
licenciaMedica VARCHAR(50),
idEmpleado INT,

fechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
usuarioCreacion VARCHAR(50),
fechaModificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuarioModificacion VARCHAR(50),

FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);

-- TABLA ENFERMERO
CREATE TABLE Enfermero(
idEnfermero INT AUTO_INCREMENT PRIMARY KEY,
turno VARCHAR(50),
areaAsignada VARCHAR(100),
idEmpleado INT,

fechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
usuarioCreacion VARCHAR(50),
fechaModificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuarioModificacion VARCHAR(50),

FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);

-- Transacción de Persona
START TRANSACTION;

INSERT INTO Persona (nombre,edad,genero,direccion,usuarioCreacion,usuarioModificacion) VALUES
('Juan Pérez',45,'M','Av. Reforma 10','admin','admin'),
('María García',38,'F','Calle Juárez 25','admin','admin'),
('Carlos López',50,'M','Av. Insurgentes 100','admin','admin'),
('Ana Martínez',29,'F','Calle Hidalgo 5','admin','admin'),
('Luis Rodríguez',42,'M','Av. Universidad 80','admin','admin'),
('Elena Torres',33,'F','Calle Morelos 12','admin','admin'),
('Pedro Sánchez',40,'M','Av. Revolución 45','admin','admin'),
('Lucía Gómez',27,'F','Calle 5 de Mayo 9','admin','admin'),
('Roberto Díaz',35,'M','Av. Chapultepec 22','admin','admin'),
('Marta Ruiz',31,'F','Calle Victoria 14','admin','admin');

COMMIT;
ROLLBACK;

-- Datos EMPLEADOS
INSERT INTO Empleado (salario,idPersona,usuarioCreacion,usuarioModificacion) VALUES
(55000,1,'admin','admin'),
(48000,2,'admin','admin'),
(60000,3,'admin','admin'),
(52000,4,'admin','admin'),
(58000,5,'admin','admin'),
(32000,6,'admin','admin'),
(30000,7,'admin','admin'),
(34000,8,'admin','admin'),
(31000,9,'admin','admin'),
(33000,10,'admin','admin');

-- Datos DOCTORES
INSERT INTO Doctor (especialidad,licenciaMedica,idEmpleado,usuarioCreacion,usuarioModificacion) VALUES
('Cardiología','DOM-2026-01',1,'admin','admin'),
('Pediatría','DOM-2026-02',2,'admin','admin'),
('Ginecología','DOM-2026-03',3,'admin','admin'),
('Neurología','DOM-2026-04',4,'admin','admin'),
('Dermatología','DOM-2026-05',5,'admin','admin');

-- Modificar tamaño de columna
ALTER TABLE Doctor
MODIFY COLUMN especialidad VARCHAR(150);

SELECT * FROM Doctor;

-- Regresar al tamaño original
ALTER TABLE Doctor
MODIFY COLUMN especialidad VARCHAR(100);


-- DATOS ENFERMEROS
INSERT INTO Enfermero (turno,areaAsignada,idEmpleado,usuarioCreacion,usuarioModificacion) VALUES
('Matutino','Urgencias',6,'admin','admin'),
('Vespertino','Pediatría',7,'admin','admin'),
('Nocturno','Cuidados Intensivos',8,'admin','admin'),
('Matutino','Quirófano',9,'admin','admin'),
('Vespertino','Consulta Externa',10,'admin','admin');

SELECT * FROM Persona;
SELECT * FROM Empleado;
SELECT * FROM Doctor;
SELECT * FROM Enfermero;

-- Eliminar datos de Persona
DELETE FROM Persona WHERE idPersona = 11;
DELETE FROM Persona WHERE idPersona = 12;
DELETE FROM Persona WHERE idPersona = 13;
DELETE FROM Persona WHERE idPersona = 14;
DELETE FROM Persona WHERE idPersona = 15;
DELETE FROM Persona WHERE idPersona = LAST_INSERT_ID();

-- Eliminar datos de Empleado
DELETE FROM Empleado WHERE idPersona = 6;
DELETE FROM Empleado WHERE idPersona = 7;
DELETE FROM Empleado WHERE idPersona = 8;
DELETE FROM Empleado WHERE idPersona = 9;
DELETE FROM Empleado WHERE idPersona = 10;
DELETE FROM Empleado WHERE idPersona = LAST_INSERT_ID();

-- Eliminar datos de Doctor
DELETE FROM Doctor WHERE idEmpleado = 6;
DELETE FROM Doctor WHERE idEmpleado = 7;
DELETE FROM Doctor WHERE idEmpleado = 8;
DELETE FROM Doctor WHERE idEmpleado = 9;
DELETE FROM Doctor WHERE idEmpleado = 10;
DELETE FROM Doctor WHERE idEmpleado = LAST_INSERT_ID();

-- Eliminar datos de Enfermero
DELETE FROM Enfermero WHERE idEmpleado = 1;
DELETE FROM Enfermero WHERE idEmpleado = 2;
DELETE FROM Enfermero WHERE idEmpleado = 3;
DELETE FROM Enfermero WHERE idEmpleado = 4;
DELETE FROM Enfermero WHERE idEmpleado = 5;
DELETE FROM Enfermero WHERE idEmpleado = LAST_INSERT_ID();

-- TABLA ADMINISTRADOR
CREATE TABLE Administrador(
idAdmin INT AUTO_INCREMENT PRIMARY KEY,
idEmpleado INT,
usuario VARCHAR(50),
contrasena VARCHAR(50),

fechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
usuarioCreacion VARCHAR(50),
fechaModificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuarioModificacion VARCHAR(50),

FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);

-- Datos Administrador
INSERT INTO Administrador (idEmpleado,usuario,contrasena,usuarioCreacion,usuarioModificacion) VALUES
(2,'admin1','1234','admin','admin'),
(3,'admin2','abcd','admin','admin'),
(4,'admin3','pass123','admin','admin'),
(5,'admin4','qwerty','admin','admin'),
(5,'admin5','admin','admin','admin');

SELECT * FROM Administrador;

-- Eliminar datos de Administrador
DELETE FROM Administrador WHERE idEmpleado = 1;
DELETE FROM Administrador WHERE idEmpleado = 2;
DELETE FROM Administrador WHERE idEmpleado = 3;
DELETE FROM Administrador WHERE idEmpleado = 4;
DELETE FROM Administrador WHERE idEmpleado = 5;
DELETE FROM Administrador WHERE idEmpleado = LAST_INSERT_ID();

SELECT * FROM Administrador;

-- Recuperar el registro eliminado
INSERT INTO Administrador
(idAdmin,idEmpleado,usuario,contrasena,usuarioCreacion,usuarioModificacion)
VALUES
(1,2,'admin1','1234','admin','admin');


-- TABLA MANTENIMIENTO
CREATE TABLE Mantenimiento(
idMantenimiento INT AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR(100),
fecha DATE,
estado VARCHAR(50),
idEmpleado INT,

fechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
usuarioCreacion VARCHAR(50),
fechaModificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuarioModificacion VARCHAR(50),

FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);

-- Datos Mantenimiento
INSERT INTO Mantenimiento (descripcion,fecha,estado,idEmpleado,usuarioCreacion,usuarioModificacion) VALUES
('Equipo médico','2026-03-02','Completado',2,'admin','admin'),
('Aire acondicionado','2026-03-06','Pendiente',3,'admin','admin'),
('Computadoras','2026-03-08','Completado',4,'admin','admin'),
('Luces','2026-03-11','En proceso',5,'admin','admin'),
('Camillas','2026-03-14','Completado',5,'admin','admin');

SELECT * FROM Mantenimiento;

-- Eliminar datos de Mantenimiento
DELETE FROM Mantenimiento WHERE idEmpleado = 1;
DELETE FROM Mantenimiento WHERE idEmpleado = 2;
DELETE FROM Mantenimiento WHERE idEmpleado = 3;
DELETE FROM Mantenimiento WHERE idEmpleado = 4;
DELETE FROM Mantenimiento WHERE idEmpleado = 5;
DELETE FROM Mantenimiento WHERE idEmpleado = LAST_INSERT_ID();

-- TABLA CITAS
CREATE TABLE CitaMedica(
idCita INT AUTO_INCREMENT PRIMARY KEY,
fecha DATE,
hora TIME,
motivoConsulta VARCHAR(200),
idPaciente INT,
idDoctor INT,

fechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
usuarioCreacion VARCHAR(50),
fechaModificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuarioModificacion VARCHAR(50),

FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente),
FOREIGN KEY (idDoctor) REFERENCES Doctor(idDoctor)
);

-- Datos CitaMedica
INSERT INTO CitaMedica (fecha,hora,motivoConsulta,idPaciente,idDoctor,usuarioCreacion,usuarioModificacion) VALUES
('2026-04-05','09:00:00','Revisión general',1,1,'admin','admin'),
('2026-04-05','10:00:00','Dolor estomacal',2,2,'admin','admin'),
('2026-04-06','11:30:00','Chequeo anual',3,3,'admin','admin'),
('2026-04-06','12:00:00','Migraña constante',4,4,'admin','admin'),
('2026-04-07','13:15:00','Problema en la piel',5,5,'admin','admin');

SELECT * FROM CitaMedica;

-- Eliminar datos de CitaMedica
DELETE FROM CitaMedica WHERE idDoctor = 1;
DELETE FROM CitaMedica WHERE idDoctor = 2;
DELETE FROM CitaMedica WHERE idDoctor = 3;
DELETE FROM CitaMedica WHERE idDoctor = 4;
DELETE FROM CitaMedica WHERE idDoctor = 5;
DELETE FROM CitaMedica WHERE idDoctor = LAST_INSERT_ID();

-- TABLA RECETA
CREATE TABLE Receta(
idReceta INT AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR(200),
medicamentos VARCHAR(200),
indicaciones VARCHAR(200),
idCita INT,
idDoctor INT,

fechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
usuarioCreacion VARCHAR(50),
fechaModificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuarioModificacion VARCHAR(50),

FOREIGN KEY (idCita) REFERENCES CitaMedica(idCita),
FOREIGN KEY (idDoctor) REFERENCES Doctor(idDoctor)
);

-- Datos Receta
INSERT INTO Receta (descripcion,medicamentos,indicaciones,idCita,idDoctor,usuarioCreacion,usuarioModificacion) VALUES
('Dolor leve','Paracetamol 500mg','Tomar cada 8 horas por 3 días',1,1,'admin','admin'),
('Gastritis','Omeprazol','Tomar en ayunas durante 7 días',2,2,'admin','admin'),
('Vitaminas','Complejo B','Una cápsula diaria',3,3,'admin','admin'),
('Dolor de cabeza','Ibuprofeno','Cada 6 horas si persiste el dolor',4,4,'admin','admin'),
('Tratamiento dermatológico','Crema tópica','Aplicar dos veces al día',5,5,'admin','admin');

SELECT * FROM Receta;

-- Eliminar datos de Receta
DELETE FROM Receta WHERE idDoctor = 1;
DELETE FROM Receta WHERE idDoctor = 2;
DELETE FROM Receta WHERE idDoctor = 3;
DELETE FROM Receta WHERE idDoctor = 4;
DELETE FROM Receta WHERE idDoctor = 5;
DELETE FROM Receta WHERE idDoctor = LAST_INSERT_ID();

-- TABLA HISTORIAL MEDICO
CREATE TABLE HistorialMedico(
idHistorial INT AUTO_INCREMENT PRIMARY KEY,
idPaciente INT,
idDoctor INT,
fecha DATE,
diagnostico VARCHAR(100),
tratamiento VARCHAR(100),
observaciones TEXT,

fechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
usuarioCreacion VARCHAR(50),
fechaModificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuarioModificacion VARCHAR(50),

FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente),
FOREIGN KEY (idDoctor) REFERENCES Doctor(idDoctor)
);

-- Datos HistorialMedica
INSERT INTO HistorialMedico
(idHistorial,idPaciente,idDoctor,fecha,diagnostico,tratamiento,observaciones,usuarioCreacion,usuarioModificacion)
VALUES
(NULL,1,1,'2026-03-01','Gripe','Paracetamol','Reposo','admin','admin'),
(NULL,2,2,'2026-03-05','Infección','Antibióticos','Cada 8 horas','admin','admin'),
(NULL,3,3,'2026-03-10','Dolor de cabeza','Ibuprofeno','Evitar estrés','admin','admin'),
(NULL,4,4,'2026-03-12','Fiebre','Paracetamol','Monitoreo','admin','admin'),
(NULL,5,5,'2026-03-15','Alergia','Antihistamínico','Evitar polvo','admin','admin');

SELECT * FROM HistorialMedico;

-- Eliminar datos de HistorialMedico
DELETE FROM HistorialMedico WHERE idDoctor = 1;
DELETE FROM HistorialMedico WHERE idDoctor = 2;
DELETE FROM HistorialMedico WHERE idDoctor = 3;
DELETE FROM HistorialMedico WHERE idDoctor = 4;
DELETE FROM HistorialMedico WHERE idDoctor = 5;
DELETE FROM HistorialMedico WHERE idDoctor = LAST_INSERT_ID();


-- INNER JOIN
SELECT Persona.nombre, Paciente.tipoPaciente
FROM Persona
INNER JOIN Paciente
ON Persona.idPersona = Paciente.idPersona;

-- LEFT JOIN
SELECT Persona.nombre, Empleado.salario
FROM Persona
LEFT JOIN Empleado
ON Persona.idPersona = Empleado.idPersona;

-- RIGHT JOIN
SELECT Persona.nombre, Empleado.salario
FROM Persona
RIGHT JOIN Empleado
ON Persona.idPersona = Empleado.idPersona;

-- FULL JOIN
SELECT Persona.nombre, Empleado.salario
FROM Persona
LEFT JOIN Empleado
ON Persona.idPersona = Empleado.idPersona

UNION

SELECT Persona.nombre, Empleado.salario
FROM Persona
RIGHT JOIN Empleado
ON Persona.idPersona = Empleado.idPersona;


-- VIEW
CREATE VIEW VistaPacientes AS
SELECT 
Persona.nombre,
Persona.edad,
Paciente.numeroHistoriaClinica,
Paciente.tipoPaciente
FROM Persona
INNER JOIN Paciente
ON Persona.idPersona = Paciente.idPersona;

SELECT * FROM VistaPacientes;

-- Eliminar vista
DROP VIEW IF EXISTS VistaPacientes;



-- STORED PROCEDURE
DELIMITER //

CREATE PROCEDURE MostrarDoctores()
BEGIN
	SELECT 
	idDoctor,
	especialidad,
	licenciaMedica
	FROM Doctor;
END //

DELIMITER ;

-- Ejecutar procedimiento
CALL MostrarDoctores();

-- Eliminar procedimiento almacenado
DROP PROCEDURE IF EXISTS MostrarDoctores;



-- Eliminar Tablas
DROP TABLE IF EXISTS HistorialMedico;
DROP TABLE IF EXISTS Receta;
DROP TABLE IF EXISTS CitaMedica;
DROP TABLE IF EXISTS Administrador;
DROP TABLE IF EXISTS Mantenimiento;
DROP TABLE IF EXISTS Enfermero;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS Paciente;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Persona;

-- Eliminar Base de Datos
DROP DATABASE IF EXISTS Hospital;