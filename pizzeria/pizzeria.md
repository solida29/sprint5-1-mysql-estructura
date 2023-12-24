# clientes

id_cliente
nombre
apellido
numero_telefono

-> puede realizar muchos pedidos (one to many, FK en pedidos)

# 1_direcciones OK

direccion
cp
ciudad
provincia

# pedidos

id_pedido
fecha y hora
reparto a domicilio/recogida en tienda
cantidad de producto de cada tipo
precio total

-> pedido puede tener 1 o varios productos
-> one to many: FK en pizzas, hamburguesas, bebidas)

# pizzas

id_pizza
hamburguesas
id_hamburguesa
bebidas
id_bebida

# productos

id_producto
nombre
descripcion
imagen
precio

# categoria de pizzas

id_categoria_pizzas
nombre

> > one to many: puede tener varias pizzas

# tienda

-> one to many: puede gestionar varios pedidos
id_tienda
direccion
cp
ciudad
provincia
pedido_id
one to many: puede tener varios empleados

# empleados

id_empleados
nombre
apellido
nif
telefono
puesto: cocinero o repartidor (enum)

# entrega a domicilio

empleado_id
pedido_id
fecha y hora de la entrega
