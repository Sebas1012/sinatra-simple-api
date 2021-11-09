-- Creacion de la base de datos.
CREATE DATABASE test
GO
USE test
GO

-- Creacion de la tabla para testear.
CREATE TABLE users(
	id int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	username varchar(30) NOT NULL,
	description varchar(60) NOT NULL
)
GO

-- Inserciones de ejemplo.
INSERT INTO users(username, description) VALUES
('Jhon Doe', 'Soy el primer registro :v.'),
('Oscar Suarez', 'Esta es mi descripcion.'),
('Susana Perez', 'Jmmmm.'),
('Paluca Omel', 'Jmmm x2.');