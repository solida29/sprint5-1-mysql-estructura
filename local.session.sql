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
