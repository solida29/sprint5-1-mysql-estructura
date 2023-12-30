-- SEGUNDO SCRIPT A EJECUTAR: DATOS

-- 1_direcciones datos -----------
INSERT INTO pizzeria.direcciones
(direccion, codigo_postal, ciudad, provincia) VALUES
('calle Primera, 100, 1º-3ª', '08001', 'Barcelona', 'Barcelona'),
('calle Segunda, 220, 6º-2ª', '08002', 'Barcelona', 'Barcelona'),
('calle Tercera, 330, 1º-2ª', '08003', 'Barcelona', 'Barcelona'),
('calle Cuarta, 140, 4º-4ª', '08850', 'Gava', 'Barcelona'),
('calle Quinta, 55, 2º-1ª', '08850', 'Gava', 'Barcelona'),
('calle Sexta, 60, principal-2ª', '08850', 'Gava', 'Barcelona'),
('calle Septima, 77, 5º-2ª', '08007', 'Barcelona', 'Barcelona'),
('calle Octava, 8B, principal-3ª', '08850', 'Gava', 'Barcelona'),
('calle Novena, 99, 3ª-2ª', '08009', 'Barcelona', 'Barcelona'),
('calle Decima, 10, principal-1ª', '08850', 'Gava', 'Barcelona')
;

-- 2_clientes datos -----------
INSERT INTO pizzeria.clientes
(nombre_cliente, apellido_cliente, direccion_id, telefono_cliente) VALUES
('Bart', 'Simpson', 1, '600 111 111'),
('Calvin', 'Hobbes', 2, '600 222 222'),
('Nico', 'Robin', 3, '600 333 333'),
('Charlie', 'Brown', 4, '600 444 444')
;

-- 3_categoria_pizzas datos-----------
INSERT INTO pizzeria.categorias_pizzas 
(nombre_categoria_pizza) VALUES
('Clásicas'),
('De temporada'),
('Especiales')
;

-- 4_productos datos -----------
INSERT INTO pizzeria.productos
(tipo_producto, nombre_producto, descripcion_producto, imagen_producto, precio_producto, categoria_pizza_id) VALUES
('Pizza', 'Margarita', 'Mozzarella, tomate y oregano', 'https://cdn.pixabay.com/photo/2020/06/08/16/49/pizza-5275191_1280.jpg', 9.00, 1),
('Pizza', 'Salami', 'Mozzarella, tomate, oregano y salami', 'https://cdn.pixabay.com/photo/2023/12/23/17/06/ai-generated-8465992_1280.jpg', 12.50, 1),
('Pizza', 'Vegetal', 'Mozzarella, tomate, pimiento rojo, pimiento verde, olivas negras y cebolla', 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_1280.jpg', 9.00, 2),
('Pizza', 'Del mar', 'Mozzarella, tomate, anchoas, olivas negras, parmesano, piñones y espinacas frescas', 'https://cdn.pixabay.com/photo/2017/09/30/15/10/plate-2802332_1280.jpg', 13.50, 2),
('Pizza', 'Vegana', 'Mozzarella, tomate, setas ostra, pimiento rojo y escarola', 'https://cdn.pixabay.com/photo/2018/04/07/15/03/pizza-3298685_1280.jpg', 13.50, 3),
('Pizza', 'Supremo', 'Mozzarella, tomate, jamon, burrata, oregano, olivas negras', 'https://cdn.pixabay.com/photo/2022/11/21/01/17/pizza-7605643_1280.jpg', 14.00, 3),
('Hamburguesa', 'Cheeseburger', 'Hamburguesa, queso, tomate y lechuga', 'https://cdn.pixabay.com/photo/2018/10/30/09/28/burger-3783181_1280.jpg', 8.00, NULL),
('Hamburguesa','Completa', ' Hamburguesa, queso, tomate, lechuga, huevo y cebolla', 'https://cdn.pixabay.com/photo/2017/12/09/23/04/bread-3008950_1280.jpg', 10.50, NULL),
('Hamburguesa', 'Double Burger', '2 hamburguesas, queso, tomate, lechuga, cebolla', 'https://cdn.pixabay.com/photo/2017/09/18/16/59/burger-2762431_1280.jpg', 13.00, NULL),
('Bebida', 'Agua', NULL, NULL, 1.00, NULL),
('Bebida', 'Coca Cola', NULL, NULL, 2.00, NULL),
('Bebida', 'Fanta', NULL, NULL, 2.00, NULL),
('Bebida', 'Cerveza', NULL, NULL, 2.00, NULL)
;

-- 5_tiendas datos  -----------
INSERT INTO pizzeria.tiendas
(nombre_tienda, direccion_id) VALUES
('Fast Food Bcn', 9),
('Fast Food Gava Playa',10)
;

-- 6_pedidos datos  -----------
INSERT INTO pizzeria.pedidos
(cliente_id, fecha_reparto, precio_total, tienda_id) VALUES
(1, current_timestamp, NULL, 1),
(2, current_timestamp, NULL, 1),
(3, current_timestamp, NULL, 1),
(4, current_timestamp, NULL, 2),
(1, current_timestamp, NULL, 1),
(2, current_timestamp, NULL, 1),
(1, current_timestamp, NULL, 1)
;

-- 7_cantidades_productos datos-----------
INSERT INTO pizzeria.cantidades_productos
(producto_id, cantidad, pedido_id) VALUES
(1, 2, 1),
(10, 1, 1),
(11, 1, 1),
(5, 2, 2),
(13, 2, 2),
(8, 1, 3),
(9, 1, 3),
(3, 1, 3),
(12, 2, 3),
(13, 1, 3),
(4, 2, 4),
(5, 1, 4),
(10, 2, 4),
(11, 2, 4),
(1, 1, 5),
(2, 3, 6),
(13, 3, 6),
(7, 1, 7),
(11, 1, 7)
;

-- 8_empleados datos -----------
INSERT INTO pizzeria.empleados
(nombre_empleado, apellido_empleado, nif, telefono, puesto, tienda_id) VALUES
('Janis', 'Joplin', 'E111', '601 000 111', 'cocinero', 1),
('Peter', 'Gabriel', 'E222', '602 000 222', 'cocinero', 1),
('James', 'Brown', 'E333', '603 000 333', 'repartidor', 1),
('Damon', 'Albarn', 'E444', '604 000 444', 'repartidor', 1),
('Jim', 'Morisson', 'E555', '605 000 555', 'cocinero', 2),
('Jimy', 'Hendrix', 'E666', '606 000 666', 'repartidor', 2)
;

-- 9_reparto_domicilio datos -----------
INSERT INTO pizzeria.repartos_domicilio
(pedido_id, empleado_id, fecha_hora_entrega) VALUES
(1, 3, current_timestamp),
(2, 4, current_timestamp),
(3, 3, current_timestamp),
(4, 6, current_timestamp),
(5, 3, current_timestamp),
(6, 4, current_timestamp),
(7, 3, current_timestamp)
;