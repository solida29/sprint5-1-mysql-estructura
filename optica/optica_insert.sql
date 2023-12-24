-- 1_direcciones datos ---------------
INSERT INTO optica.direcciones
(calle, numero, piso, puerta, ciudad, codigo_postal, pais) VALUES 
('Calle A', '10', 1, 2, 'Barcelona', '08001', 'España'),
('Calle B', '20', 5, 1, 'Barcelona', '08002', 'España'),
('Calle C', '30', 2, 1, 'Barcelona', '08003', 'España'),
('Calle D', '40', 7, 6, 'Barcelona', '08004', 'España'),
('Calle E', '50', 4, 2, 'Madrid', '08005', 'España'),
('Calle F', '60', 2, 1, 'Madrid', '08006', 'España'),
('Calle G', '70', 1, 1, 'Madrid', '08007', 'España'),
('Calle H', '80', 2, 1, 'Madrid', '08008', 'España'),
('Calle I', '90', 2, 1, 'San Sebastian', '08009', 'España'),
('Calle J', '100', 2, 1, 'San Sebastian', '08010', 'España'),
('Calle K', '110', 2, 1, 'San Sebastian', '08011', 'España'),
('Calle L', '120', 2, 1, 'San Sebastian', '08012', 'España'),
('Calle M', '130', 2, 1, 'Berlin', '08013', 'Alemania')
;

-- 2_proveedores datos ---------------
INSERT INTO optica.proveedores
(nombre, telefono, fax, nif, direccion_id) VALUES
('Proveedor1', '+34 600 111 111', NULL, 'P111',1),
('Proveedor2', '+34 600 222 222', NULL, 'P222',2),
('Proveedor3', '+34 600 333 333', NULL, 'P333',3)
;

-- 3_gafas datos ---------------------
INSERT INTO optica.gafas
(marca, precio, proveedor_id) VALUES
('Marca1', 100.00, 1),
('Marca2', 150.00, 1),
('Marca3', 50.50, 2),
('Marca4', 150.50, 2),
('Marca5', 100.00, 3),
('Marca6', 200.00, 3)
;


-- 4_montura datos ---------------------
INSERT INTO optica.montura 
(material, color, gafas_id) VALUES
('pasta', 'rojo', 1),
('flotante', 'plata', 2),
('metal', 'verde', 3),
('pasta', 'lila', 4),
('flotante', 'marron', 5),
('metal', 'azul', 6)
;

-- 5_cristales datos ---------------------
INSERT INTO optica.cristales
(izq_graduacion, izq_color, der_graduacion, der_color, gafas_id) VALUES
(1.00, 'transparente', 3.25, 'transparente', 1),
(2.00, 'oscuro', 1.05, 'oscuro', 2),
(3.00, 'oscuro', 0.25, 'oscuro', 3),
(4.00, 'transparente', 5.00, 'transparente', 4),
(5.00, 'transparente', 0.00, 'transparente', 5),
(6.00, 'oscuro', 3.25, 'oscuro', 6)
;

-- 6_clientes datos ---------------------
INSERT INTO optica.clientes
(nombre, apellido, direccion_id, telefono, email, fecha_registro, recomendacion_id) VALUES
('Steve', 'Mac Queen', 4, '600 111 222', 'steve@gmail.com', current_timestamp(), NULL),
('Kim', 'Basinger', 5, '600 333 444', 'kim@gmail.com', current_timestamp(), NULL),
('Axel', 'Rose', 6, '600 555 666', 'marc@gmail.com', current_timestamp(), NULL)
;

-- 7_vendedores datos ---------------------
INSERT INTO optica.vendedores
(nombre, apellido, dni, direccion_id, tiempo_ventas) VALUES
('Bob', 'Marley', 'V111', 7, '00:50:00'),
('Peter', 'Jackson', 'V222', 8, '00:20:00'),
('Lana', 'Del Rey', 'V333', 9, '01:00:00')
;

-- 8_ventas datos ---------------------
INSERT INTO optica.ventas
(fecha, gafas_id, cliente_id, vendedor_id) VALUES
(current_timestamp(), 1, 1, 1),
(current_timestamp(), 2, 1, 1),
(current_timestamp(), 3, 2, 2),
(current_timestamp(), 4, 2, 2),
(current_timestamp(), 5, 3, 1)
;
