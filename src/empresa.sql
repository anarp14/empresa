DROP TABLE IF EXISTS usuarios CASCADE;
DROP TABLE IF EXISTS empleados CASCADE;
DROP TABLE IF EXISTS departamentos CASCADE;

CREATE TABLE departamentos (
id bigserial PRIMARY KEY,
codigo numeric(2) NOT NULL UNIQUE,
denominacion varchar(255) NOT NULL
);

CREATE TABLE empleados (
id bigserial PRIMARY KEY,
numero numeric(4) NOT NULL UNIQUE,
nombre varchar(255) NOT NULL,
salario numeric(7, 2) NOT NULL,
fecha_nac timestamp NOT NULL,
departamento_id bigint NOT NULL REFERENCES departamentos (id)
);

CREATE TABLE usuarios (
id bigserial PRIMARY KEY,
usuario varchar(255) NOT NULL UNIQUE,
password varchar(255) NOT NULL,
empleado_id bigint NOT NULL REFERENCES empleados(id),
validado bool NOT NULL
);

INSERT INTO departamentos (codigo, denominacion)
VALUES
(10, 'Informática'),
(20, 'Administrativo'),
(30, 'Prevención'),
(40, 'Laboratorio'),
(50, 'Automoción');

INSERT INTO empleados (numero, nombre, salario, fecha_nac, departamento_id)
VALUES
(1000, 'Pepito', 1240, '1982-07-05', 1),
(2000, 'María', 2035, '1999-01-01', 4),
(3000, 'Admin', 3000, '1980-01-01', 1);

INSERT INTO usuarios (usuario, password, empleado_id, validado)
VALUES
('admin', crypt('admin', gen_salt('bf', 10)), 3, true),
('pepe', crypt('pepe', gen_salt('bf', 10)), 1, true),
('maria', crypt('maria', gen_salt('bf', 10)), 2, true);;
