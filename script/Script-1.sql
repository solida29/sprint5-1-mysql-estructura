CREATE TABLE optica.ventas (
	id_ventas INT auto_increment NOT NULL,
	gafas_id INT NOT NULL,
	cliente_id INT NOT NULL,
	vendedor_id INT NOT NULL,
	fecha_venta TIMESTAMP current_timestamp NULL,
	CONSTRAINT ventas_PK PRIMARY KEY (id_ventas)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_spanish_ci;
