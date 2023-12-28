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
    id_cliente INT(11) auto_increment NOT NULL,
    nombre_cliente VARCHAR(100),
    apellido_cliente VARCHAR(100),
    direccion_id INT(11),
    telefono_cliente VARCHAR(20),
    PRIMARY KEY (id_cliente),
    CONSTRAINT clientes_FK_direccion 
    FOREIGN KEY (direccion_id) REFERENCES direcciones (id_direccion)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 3_categoria_pizzas definition -----------
CREATE TABLE IF NOT EXISTS pizzeria.categorias_pizzas (
    id_categoria_pizza INT(11) auto_increment NOT NULL,
    nombre_categoria_pizza VARCHAR(100),
    PRIMARY KEY (id_categoria_pizza)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 4_productos definition -----------
CREATE TABLE IF NOT EXISTS pizzeria.productos (
    id_producto INT(11) auto_increment NOT NULL,
    tipo_producto  ENUM('Pizza', 'Hamburguesa', 'Bebida'),
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion_producto VARCHAR(100) NULL,
    imagen_producto VARCHAR(100) NULL,
    precio_producto  DECIMAL(10,2),
    categoria_pizza_id INT(11) NULL,
    PRIMARY KEY (id_producto),
    CONSTRAINT productos_FK_categoria 
    FOREIGN KEY (categoria_pizza_id) REFERENCES categorias_pizzas (id_categoria_pizza)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 5_pedidos definition  -----------
CREATE TABLE IF NOT EXISTS pizzeria.pedidos (
    id_pedido INT(11) auto_increment NOT NULL,
    cliente_id INT(11),
    fecha_reparto TIMESTAMP DEFAULT current_timestamp,
    precio_total DECIMAL (10,2),
    PRIMARY KEY (id_pedido),
    CONSTRAINT pedidos_FK_cliente
    FOREIGN KEY (cliente_id) REFERENCES clientes (id_cliente)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 6_cantidades_productos definition -----------
CREATE TABLE IF NOT EXISTS pizzeria.cantidades_productos (
    id_cantidad INT(11) auto_increment NOT NULL,
    producto_id INT(11),
    cantidad SMALLINT,
    pedido_id INT(11),
    PRIMARY KEY (id_cantidad),
    CONSTRAINT cant_productos_FK_producto FOREIGN KEY (producto_id) REFERENCES productos(id_producto),
    CONSTRAINT cant_productos_FK_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(id_pedido)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 7_tiendas definition  -----------
CREATE TABLE IF NOT EXISTS pizzeria.tiendas (
    id_tienda INT(11) auto_increment NOT NULL,
    direccion_id INT(11),
    pedido_id INT(11),
    PRIMARY KEY (id_tienda),
    CONSTRAINT tiendas_FK_direccion FOREIGN KEY (direccion_id) REFERENCES direcciones(id_direccion),
    CONSTRAINT tiendas_FK_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(id_pedido)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 8_empleados definition -----------
CREATE TABLE IF NOT EXISTS pizzeria.empleados (
    id_empleado INT(11) auto_increment NOT NULL,
    nombre_empleado VARCHAR(100) NOT NULL,
    apellido_empleado VARCHAR(100) NOT NULL,
    nif VARCHAR(50),
    telefono VARCHAR(50),
    puesto ENUM('cocinero', 'repartidor'),
    tienda_id INT(11),
    PRIMARY KEY (id_empleado),
    CONSTRAINT empleados_FK_tienda FOREIGN KEY (tienda_id) REFERENCES tiendas(id_tienda)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 9_reparto_domicilio definition -----------
CREATE TABLE IF NOT EXISTS pizzeria.repartos_domicilio (
    id_reparto INT(11) auto_increment NOT NULL,
    empleado_id INT(11),
    pedido_id INT(11),
    fecha_hora_entrega TIMESTAMP DEFAULT current_timestamp,
    PRIMARY KEY (id_reparto),
    CONSTRAINT rep_domicilio_FK_empleado FOREIGN KEY (empleado_id) REFERENCES empleados(id_empleado),
    CONSTRAINT rep_domicilio_FK_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(id_pedido)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
