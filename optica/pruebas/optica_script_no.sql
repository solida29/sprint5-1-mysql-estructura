-- optica_cul_ampolla.direcciones definition ---------------
CREATE TABLE optica_cul_ampolla.direcciones (
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

-- optica_cul_ampolla.proveedores definition ---------------
CREATE TABLE optica_cul_ampolla.proveedores (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `nif` varchar(10) NOT NULL,
  `direccion_id` int(11) DEFAULT NULL,
  `gafas_id` int(11) NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `proveedores_UN` (`nif`),
  KEY `proveedores_FK` (`direccion_id`),
  KEY `proveedores_FK_1` (`gafas_id`),
  CONSTRAINT `proveedores_FK` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`id_direccion`),
  CONSTRAINT `proveedores_FK_1` FOREIGN KEY (`gafas_id`) REFERENCES `gafas` (`id_gafas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- optica_cul_ampolla.gafas definition ---------------------
CREATE TABLE optica_cul_ampolla.gafas (
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

-- optica_cul_ampolla.montura definition ---------------------
CREATE TABLE optica_cul_ampolla.montura (
  `material` enum('pasta','metal','flotante') NOT NULL,
  `color` varchar(50) NOT NULL,
  `gafas_id` int(11) NOT NULL,
  KEY `montura_FK` (`gafas_id`),
  CONSTRAINT `montura_FK` FOREIGN KEY (`gafas_id`) REFERENCES `gafas` (`id_gafas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- optica_cul_ampolla.cristal_izquierdo definition ---------------------
CREATE TABLE optica_cul_ampolla.cristal_izquierdo (
  `graduacion` float DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `gafas_id` int(11) DEFAULT NULL,
  KEY `cristal_izquierdo_FK` (`gafas_id`),
  CONSTRAINT `cristal_izquierdo_FK` FOREIGN KEY (`gafas_id`) REFERENCES `gafas` (`id_gafas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- optica_cul_ampolla.cristal_derecho definition ---------------------
CREATE TABLE optica_cul_ampolla.cristal_derecho (
	graduacion FLOAT NULL,
	color varchar(50) NULL,
	gafas_id INT NULL,
	CONSTRAINT cristal_derecho_FK FOREIGN KEY (gafas_id) REFERENCES optica_cul_ampolla.gafas(id_gafas)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

-- optica_cul_ampolla.ventas definition ---------------------
CREATE TABLE optica_cul_ampolla.ventas (
	id_venta INT auto_increment NOT NULL,
	fecha TIMESTAMP DEFAULT current_timestamp NOT NULL,
	gafas_id INT NOT NULL,
	cliente_id INT NOT NULL,
	vendedor_id INT NOT NULL,
	CONSTRAINT ventas_PK PRIMARY KEY (id_venta),
	CONSTRAINT ventas_FK FOREIGN KEY (gafas_id) REFERENCES optica_cul_ampolla.gafas(id_gafas)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

-- optica_cul_ampolla.clientes definition ---------------------
CREATE TABLE optica_cul_ampolla.clientes (
	id_cliente INT auto_increment NOT NULL,
	nombre varchar(100) NOT NULL,
	apellido varchar(100) NOT NULL,
	direccion_id INT NULL,
	telefono varchar(20) NOT NULL,
	email varchar(100) NULL,
	fecha_registro TIMESTAMP DEFAULT current_timestamp NOT NULL,
	recomendacion varchar(100) NULL,
	venta_id INT NULL,
	CONSTRAINT clientes_PK PRIMARY KEY (id_cliente),
	CONSTRAINT clientes_FK_venta FOREIGN KEY (venta_id) REFERENCES optica_cul_ampolla.ventas(id_venta),
	CONSTRAINT clientes_FK_direcc FOREIGN KEY (direccion_id) REFERENCES optica_cul_ampolla.direcciones(id_direccion)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

-- optica_cul_ampolla.vendedores definition ---------------------
CREATE TABLE optica_cul_ampolla.vendedores (
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

