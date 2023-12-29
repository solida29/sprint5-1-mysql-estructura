CREATE DATABASE IF NOT EXISTS optica;

-- 1_direcciones definition ---------------
CREATE TABLE IF NOT EXISTS optica.direcciones (
  id_direccion INT(11) auto_increment NOT NULL,
  calle VARCHAR(200) NOT NULL,
  numero SMALLINT NULL,
  piso SMALLINT NULL,
  puerta VARCHAR(5) NULL,
  ciudad VARCHAR(100) NOT NULL,
  codigo_postal VARCHAR(5) NULL,
  pais VARCHAR(100) NOT NULL,
  CONSTRAINT direcciones_PK PRIMARY KEY (id_direccion)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 2_proveedores definition ---------------
CREATE TABLE IF NOT EXISTS optica.proveedores (
  id_proveedor INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  fax VARCHAR(20) DEFAULT NULL,
  nif VARCHAR(10) NOT NULL UNIQUE,
  direccion_id int(11) DEFAULT NULL,
  PRIMARY KEY (id_proveedor),
  CONSTRAINT proveedores_FK FOREIGN KEY (direccion_id) REFERENCES direcciones (id_direccion)
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 3_vendedores definition ---------------------
CREATE TABLE IF NOT EXISTS optica.vendedores (
  id_vendedor INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  dni VARCHAR(100) NOT NULL UNIQUE,
  direccion_id int(11) DEFAULT NULL,
  tiempo_ventas time DEFAULT NULL,
  PRIMARY KEY (id_vendedor)
  )
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 4_clientes definition ---------------------
CREATE TABLE IF NOT EXISTS optica.clientes (
  id_cliente INT(11) auto_increment NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  direccion_id INT(11) NULL,
  telefono VARCHAR(20) NOT NULL,
  email VARCHAR(100) NULL,
  fecha_registro TIMESTAMP DEFAULT current_timestamp NOT NULL,
  recomendacion_id INT NULL,
  CONSTRAINT clientes_PK PRIMARY KEY (id_cliente),
  CONSTRAINT clientes_FK_direccion FOREIGN KEY (direccion_id) REFERENCES direcciones(id_direccion),
  CONSTRAINT clientes_FK_recomendacion FOREIGN KEY (recomendacion_id) REFERENCES clientes(id_cliente)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 5_ventas definition ---------------------
CREATE TABLE IF NOT EXISTS optica.ventas (
	id_venta INT(11) auto_increment NOT NULL,
	fecha TIMESTAMP DEFAULT current_timestamp NOT NULL,
	cliente_id INT NOT NULL,
	vendedor_id INT NOT NULL,
	CONSTRAINT ventas_PK PRIMARY KEY (id_venta),
	CONSTRAINT ventas_FK_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id_cliente),
  CONSTRAINT ventas_FK_vendedor FOREIGN KEY (vendedor_id) REFERENCES vendedores(id_vendedor)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 6_gafas definition ---------------------
CREATE TABLE IF NOT EXISTS optica.gafas (
  id_gafas INT(11) auto_increment NOT NULL,
  marca VARCHAR(100) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  proveedor_id INT(11),
  venta_id INT(11) NULL,
  CONSTRAINT gafas_PK PRIMARY KEY (id_gafas),
  CONSTRAINT gafas_proveedores_FK FOREIGN KEY (proveedor_id) REFERENCES proveedores(id_proveedor),
  CONSTRAINT gafas_ventas_FK FOREIGN KEY (venta_id) REFERENCES ventas(id_venta)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 7_montura definition ---------------------
CREATE TABLE IF NOT EXISTS optica.montura (
  material enum('pasta','metal','flotante') NOT NULL,
  color VARCHAR(50) NOT NULL,
  gafas_id INT(11) NOT NULL,
  KEY montura_FK (gafas_id),
  CONSTRAINT montura_FK FOREIGN KEY (gafas_id) REFERENCES gafas (id_gafas)
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 8_cristales definition ---------------------
CREATE TABLE IF NOT EXISTS optica.cristales (
  `izq_graduacion` float DEFAULT NULL,
  `izq_color` VARCHAR(50) DEFAULT NULL,
  `der_graduacion` float DEFAULT NULL,
  `der_color` VARCHAR(50) DEFAULT NULL,
  `gafas_id` INT(11) DEFAULT NULL,
  KEY `cristal_izquierdo_FK` (`gafas_id`),
  CONSTRAINT `cristal_izquierdo_FK` FOREIGN KEY (`gafas_id`) REFERENCES `gafas` (`id_gafas`)
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
