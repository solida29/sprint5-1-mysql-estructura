-- OPTICA

-- Llista el total de compres d’un client/a
SELECT COUNT(cliente_id) AS total_ventas
FROM optica.ventas
WHERE cliente_id = 3;

-- Llista les diferents ulleres que ha venut un empleat durant un any.
SELECT gafas.marca, ventas.fecha, vendedores.nombre
FROM optica.gafas
LEFT JOIN optica.ventas ON gafas.id_gafas = ventas.gafas_id
LEFT JOIN optica.vendedores ON vendedores.id_vendedor = ventas.vendedor_id
WHERE YEAR(ventas.fecha) = YEAR(CURDATE());

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
SELECT proveedores.nombre, COUNT(ventas.id_venta) AS total_ventas
FROM optica.proveedores
INNER JOIN optica.gafas
ON proveedores.id_proveedor = gafas.proveedor_id
INNER JOIN optica.ventas
ON gafas.id_gafas = ventas.gafas_id
GROUP BY proveedores.nombre;