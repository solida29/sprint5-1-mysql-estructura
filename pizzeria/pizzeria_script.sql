CREATE DATABASE IF NOT EXISTS pizzeria;

-- 1_direcciones definition -----------
CREATE TABLE IF NOT EXISTS pizzeria.direcciones (
id_direccion INT(11) auto_increment NOT NULL,
direccion varchar(200) NOT NULL,
codigo_postal INT NULL,
ciudad varchar(100) NOT NULL,
provincia varchar(100) NOT NULL,
CONSTRAINT direcciones_PK PRIMARY KEY (id_direccion)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

