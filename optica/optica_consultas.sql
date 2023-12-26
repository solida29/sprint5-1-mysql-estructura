-- OPTICA

-- Llista el total de compres d’un client/a
SELECT COUNT(cliente_id) AS total_ventas
FROM optica.ventas
WHERE cliente_id = 3;

-- Llista les diferents ulleres que ha venut un empleat durant un any.
SELECT vendedores.nombre, gafas.marca, COUNT(ventas.id_venta) AS total_ventas
FROM optica.vendedores
INNER JOIN optica.ventas
ON vendedores.id_vendedor = ventas.vendedor_id
INNER JOIN optica.gafas
ON ventas.gafas_id = gafas.id_gafas
WHERE YEAR(ventas.fecha) = YEAR(CURDATE())
GROUP BY vendedores.nombre, gafas.marca;

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
SELECT proveedores.nombre, COUNT(ventas.id_venta) AS total_ventas
FROM optica.proveedores
INNER JOIN optica.gafas
ON proveedores.id_proveedor = gafas.proveedor_id
INNER JOIN optica.ventas
ON gafas.id_gafas = ventas.gafas_id
GROUP BY proveedores.nombre;