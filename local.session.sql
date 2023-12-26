-- Llista les diferents ulleres que ha venut un empleat durant un any.

SELECT gafas.marca, ventas.fecha, vendedores.nombre
FROM optica.gafas
LEFT JOIN optica.ventas ON gafas.id_gafas = ventas.gafas_id
LEFT JOIN optica.vendedores ON vendedores.id_vendedor = ventas.vendedor_id
WHERE YEAR(ventas.fecha) = YEAR(CURDATE());