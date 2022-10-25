DROP TABLE IF EXISTS departamentos CASCADE;
DROP TABLE IF EXISTS empleados CASCADE;

CREATE TABLE departamentos (
    id           bigserial    PRIMARY KEY,
    codigo       numeric(2)   NOT NULL UNIQUE,
    denominacion varchar(255) NOT NULL
);

CREATE TABLE empleados (
    id           bigserial    PRIMARY KEY,
    numero       numeric(4)   NOT NULL UNIQUE,
    nombre varchar(255) NOT NULL,
    salario numeric(7,2) NOT NULL,
    fecha_nac timestamp NOT NULL,
    departamento_id bigint NOT NULL REFERENCES departamentos(id)
);

-- Fixtures:

INSERT INTO departamentos (codigo, denominacion)
    VALUES (10, 'Informática'),
           (20, 'Administrativo'),
           (30, 'Prevención'),
           (40, 'Laboratorio'),
           (50, 'Automoción');

INSERT INTO empleados(numero, nombre, salario, fecha_nac, departamento_id)
    VALUES (1000, 'Ana Rodríguez', 3000, '1996-07-14', 1),
            (1001, 'María García', 2500, '1900-04-20', 2),
            (1002, 'Pepe Pérez', 1235, '1998-12-12', 3);