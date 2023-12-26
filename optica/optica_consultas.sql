-- OPTICA

-- Llista el total de compres d’un client/a
SELECT COUNT(cliente_id) AS total_ventas
FROM optica.ventas
WHERE cliente_id = 3;

-- Llista les diferents ulleres que ha venut un empleat durant un any
SELECT vendedores.nombre, gafas.marca, ventas.fecha
FROM optica.vendedores
LEFT JOIN optica.ventas ON vendedores.id_vendedor = ventas.vendedor_id
LEFT JOIN optica.gafas ON ventas.gafas_id = gafas.id_gafas
WHERE YEAR(ventas.fecha) = YEAR(CURDATE()) -- YEAR(CURDATE()) es para el año en curso, sino se pone el año directo
ORDER BY vendedores.nombre ASC; -- ordenar por los nombres de los vendedores de manera ascendente

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
SELECT proveedores.nombre, gafas.marca, ventas.fecha
FROM optica.proveedores
LEFT JOIN optica.gafas ON proveedores.id_proveedor = gafas.proveedor_id
INNER JOIN optica.ventas ON ventas.gafas_id = gafas.id_gafas
ORDER BY proveedores.nombre ASC;