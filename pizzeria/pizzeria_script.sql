CREATE DATABASE IF NOT EXISTS pizzeria;

-- 1_direcciones definition -----------
CREATE TABLE IF NOT EXISTS pizzeria.direcciones (
    id_direccion INT(11) auto_increment NOT NULL,
    direccion varchar(200) NOT NULL,
    codigo_postal INT NULL,
    ciudad varchar(100) NOT NULL,
    provincia varchar(100) NOT NULL,
    PRIMARY KEY (id_direccion)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 2_clientes definition -----------
CREATE TABLE IF NOT EXISTS pizzeria.clientes (
    id_cliente INT(11) auto_increment, NOT NULL,
    nombre_cliente VARCHAR(100),
    apellido_cliente VARCHAR(100),
    direccion_id,
    telefono_cliente VARCHAR(20),
    PRIMARY KEY (id_cliente),
    CONSTRAINT clientes_FK_direccion 
    FOREIGN KEY (direccion_id) REFERENCES direcciones (id_direccion)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- categoria_pizzas definition -----------
CREATE IF NOT EXISTS pizzeria.categorias_pizzas (
    id_categoria_pizza INT(11) auto_increment NOT NULL,
    nombre_categoria_pizza VARCHAR(100);
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- productos definition -----------
CREATE TABLE IF NOT EXISTS pizzeria.productos (
    id_producto INT(11) auto_increment NOT NULL,
    tipo_producto  ENUM('Pizza', 'Hamburguesa', 'Bebida'),
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion_producto VARCHAR(100) NULL,
    imagen_producto VARCHAR(100) NULL,
    precio_producto  DECIMAL(10,2),
    categoria_pizza_id VARCHAR(100) NULL,
    PRIMARY KEY (id_producto),
    CONSTRAINT pizzas_FK_categoria 
    FOREIGN KEY (categoria_pizza_id) REFERENCES categoria_pizza(id_categoria_pizza)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- cantidades_productos definition -----------
CREATE TABLE IF NOT EXISTS pizzeria.cantidades_productos (
    id_cantidad INT(11) auto_increment NOT NULL,
    producto_id INT(11),
    cantidad TINYINT,
    precio_cantidad DECIMAL(10,2),
    PRIMARY KEY (id_cantidad),
    CONSTRAINT cantidades_productos FOREIGN KEY (producto_id) REFERENCES productos (id_producto)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

