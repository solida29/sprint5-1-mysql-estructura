-- SEGUNDO SCRIPT A EJECUTAR: DATOS

-- 1_direcciones datos -----------
INSERT INTO pizzeria.direcciones
(direccion, codigo_postal, ciudad, provincia) VALUES
('calle Primera, 12, 1º-3ª', 08001, 'Barcelona', 'Barcelona'),
('calle Segunda, 244, 6º-2ª', 08002, 'Barcelona', 'Barcelona'),
('calle Tercera, 287, 1º-2ª', 08003, 'Barcelona', 'Barcelona'),
('calle Cuarta, 170, 4º-4ª', 08004, 'Gava', 'Barcelona'),
('calle Quinta, 66, 2º-1ª', 08005, 'Gava', 'Barcelona'),
('calle Sexta, 12, principal-2ª', 08006, 'Gava', 'Barcelona'),
('calle Septima, 34, 5º-2ª', 08006, 'Gava', 'Barcelona'),
('calle Octava, 12B, principal-3ª', 08006, 'Gava', 'Barcelona'),
('calle Novena, 63, 3ª-2ª', 08006, 'Gava', 'Barcelona'),
('calle Decima, 289, principal-1ª', 08006, 'Gava', 'Barcelona')
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
(tipo_producto, nombre_producto, descripcion_product, imagen_producto, precio_producto, categoria_pizza_id) VALUES
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

-- 5_pedidos datos  -----------
INSERT INTO pizzeria.pedidos
(cliente_id, fecha_reparto, precio_total) VALUES
(1, current_timestamp, NULL),
(2, current_timestamp, NULL),
(3, current_timestamp, NULL),
(4, current_timestamp, NULL),
(1, current_timestamp, NULL),
(2, current_timestamp, NULL),
(1, current_timestamp, NULL)
;

-- 6_cantidades_productos datos-----------
INSERT INTO pizzeria.cantidades_productos
(producto_id, cantidad, pedido_id) VALUES
(1, 2, 1),
(10, 1, 1),
(11, 1, 1),

;