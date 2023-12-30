-- Pizzeria

-- total bebida vendida global
SELECT SUM(cantidad) AS total_ventas_bebidas
FROM pizzeria.cantidades_productos
WHERE producto_id BETWEEN 10 AND 13
;

-- 1. Llista quants productes de tipus “Begudes”. s'han venut en una determinada localitat.
SELECT SUM(cantidad) AS total_ventas_bebidas
FROM pizzeria.cantidades_productos
JOIN pizzeria.pedidos ON cantidades_productos.pedido_id = pedidos.id_pedido 
JOIN pizzeria.clientes ON pedidos.cliente_id = clientes.id_cliente 
JOIN pizzeria.direcciones ON clientes.direccion_id = direcciones.id_direccion 
WHERE producto_id BETWEEN 10 AND 13
AND direcciones.ciudad = 'Barcelona';

-- 2. Llista quantes comandes ha efectuat un determinat empleat/da.
SELECT COUNT(empleado_id) AS total_repartos
FROM pizzeria.repartos_domicilio
JOIN pizzeria.empleados ON repartos_domicilio.empleado_id = empleados.id_empleado
WHERE nombre_empleado = 'James';