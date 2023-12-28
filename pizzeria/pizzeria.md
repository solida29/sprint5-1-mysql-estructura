# 1_direcciones OK

- direccion
- cp
- ciudad
- provincia

# 2_clientes OK

- id_cliente
- nombre
- apellido
- numero_telefono
- direccion_id

> > CONSTRAINT clientes_FK_direccion FOREIGN KEY (direccion_id) REFERENCES direcciones (id_direccion)
> > puede realizar muchos pedidos (one to many, FK en pedidos cliente_id)

# 3_categoria_pizzas

- id_categoria_pizzas
- nombre

# 4_productos OK

- id_producto
- categoria_producto ENUM("pizza", "Hamburguesa", "Bebida")
- nombre
- descripcion
- imagen
- precio
- categoria_pizza_id VARCHAR(100) NULL

> > CONSTRAINT pizzas_FK_categoria FOREIGN KEY (categoria_pizza_id) REFERENCES categoria_pizza(id_categoria_pizza)

# 5_pedidos

- id_pedido
- cliente_id
- fecha y hora
- reparto a domicilio/recogida en tienda
- precio_total

> > one to many: un cliente puede tener varios pedidos pero un pedido puede ser realizado por un único cliente

# 6_cantidad_producto

- id_cantidad_producto INT
- producto_id INT
- cantidad INT
- precio
- pedido_id

> > CONSTRAINT cantidad_producto_FK_producto FOREIGN KEY (producto_id) REFERENCES productos(id_producto)
> > CONSTRAINT cantidad_producto_FK_pedido FOREIGN KEY (pedido_id) REFERENCES productos(id_pedido)
> > one to many: pedido puede tener 1 o varios productos: FK pedido_id

# 7_tiendas

- id_tienda
- direccion_id
- pedido_id

> > CONSTRAINT tiendas_FK_direccion FOREIGN KEY (direccion_id) REFERENCES direcciones(id_direccion)
> > CONSTRAINT tiendas_FK_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(id_pedido)

> > one to many: puede gestionar varios pedidos
> > one to many: puede tener varios empleados

# 8_empleados

- id_empleados
- nombre_empleado
- apellido
- nif
- telefono
- puesto ENUM('cocinero', 'repartidor')
- tienda_id

> > one to many: un empleado en una sola tienda pero una tienda puede tener muchos empleados
> > FK tienda_id

# 9_entrega_domicilio

- id_entrega
- empleado_id
- pedido_id
- fecha y hora de la entrega
