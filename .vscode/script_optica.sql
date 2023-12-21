CREATE DATABASE IF NOT EXISTS opt_cul_ampolla;
USE opt_cul_ampolla;

-- direcciones definition ---------------
CREATE TABLE IF NOT EXISTS direcciones (
	id_direccion INT auto_increment NOT NULL,
	calle varchar(100) NOT NULL,
	numero SMALLINT NULL,
	piso SMALLINT NULL,
	puerta SMALLINT NULL,
	ciudad varchar(100) NOT NULL,
	codigo_postal INT NULL,
	pais varchar(100) NOT NULL,
	CONSTRAINT direcciones_PK PRIMARY KEY (id_direccion)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

-- gafas definition ---------------------
CREATE TABLE IF NOT EXISTS gafas (
	id_gafas INT auto_increment NOT NULL,
	marca varchar(100) NOT NULL,
	precio DECIMAL(10,2) NOT NULL,
	proveedor_id INT NULL,
	venta_id INT NULL,
	CONSTRAINT gafas_PK PRIMARY KEY (id_gafas)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

-- montura definition ---------------------
CREATE TABLE IF NOT EXISTS montura (
  `material` enum('pasta','metal','flotante') NOT NULL,
  `color` varchar(50) NOT NULL,
  `gafas_id` int(11) NOT NULL,
  KEY `montura_FK` (`gafas_id`),
  CONSTRAINT `montura_FK` FOREIGN KEY (`gafas_id`) REFERENCES `gafas` (`id_gafas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- cristales definition ---------------------
CREATE TABLE IF NOT EXISTS cristales (
  `izq_graduacion` float DEFAULT NULL,
  `izq_color` varchar(50) DEFAULT NULL,
  `der_graduacion` float DEFAULT NULL,
  `der_color` varchar(50) DEFAULT NULL,
  `gafas_id` int(11) DEFAULT NULL,
  KEY `cristal_izquierdo_FK` (`gafas_id`),
  CONSTRAINT `cristal_izquierdo_FK` FOREIGN KEY (`gafas_id`) REFERENCES `gafas` (`id_gafas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ventas definition ---------------------
CREATE TABLE IF NOT EXISTS ventas (
	id_venta INT auto_increment NOT NULL,
	fecha TIMESTAMP DEFAULT current_timestamp NOT NULL,
	gafas_id INT NOT NULL,
	cliente_id INT NOT NULL,
	vendedor_id INT NOT NULL,
	CONSTRAINT ventas_PK PRIMARY KEY (id_venta),
	CONSTRAINT ventas_FK FOREIGN KEY (gafas_id) REFERENCES gafas(id_gafas)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

-- clientes definition ---------------------
CREATE TABLE IF NOT EXISTS clientes (
	id_cliente INT auto_increment NOT NULL,
	nombre varchar(100) NOT NULL,
	apellido varchar(100) NOT NULL,
	direccion_id INT NULL,
	telefono varchar(20) NOT NULL,
	email varchar(100) NULL,
	fecha_registro TIMESTAMP DEFAULT current_timestamp NOT NULL,
	recomendacion_id INT NULL,
	venta_id INT NULL,
	CONSTRAINT clientes_PK PRIMARY KEY (id_cliente),
	CONSTRAINT clientes_FK_venta FOREIGN KEY (venta_id) REFERENCES ventas(id_venta),
	CONSTRAINT clientes_FK_direccion FOREIGN KEY (direccion_id) REFERENCES direcciones(id_direccion),
    CONSTRAINT clientes_FK_recomendacion FOREIGN KEY (recomendacion_id) REFERENCES clientes(id_cliente)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

-- vendedores definition ---------------------
CREATE TABLE IF NOT EXISTS vendedores (
  `id_vendedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `dni` varchar(100) NOT NULL,
  `direccion_id` int(11) DEFAULT NULL,
  `venta_id` int(11) DEFAULT NULL,
  `tiempo_ventas` time DEFAULT NULL,
  PRIMARY KEY (`id_vendedor`),
  UNIQUE KEY `vendedores_UN` (`dni`),
  KEY `vendedores_FK` (`venta_id`),
  KEY `vendedores_FK_1` (`direccion_id`),
  CONSTRAINT `vendedores_FK` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id_venta`),
  CONSTRAINT `vendedores_FK_1` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`id_direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

