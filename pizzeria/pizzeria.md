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

# 5_cantidad_producto

- id_cantidad_producto INT
- producto_id INT
- cantidad INT
- precio

> > CONSTRAINT cantidad_producto_FK_producto FOREIGN KEY (producto_id) REFERENCES productos(id_producto)

> > one to many: puede tener varias pizzas

# tiendas

- id_tienda
- direccion_id
- pedido_id

> > CONSTRAINT tiendas_FK_direccion FOREIGN KEY (direccion_id) REFERENCES direcciones(id_direccion)
> > CONSTRAINT tiendas_FK_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(id_pedido)

> > one to many: puede gestionar varios pedidos
> > one to many: puede tener varios empleados

# empleados

- id_empleados
- nombre
- apellido
- nif
- telefono
- puesto ENUM('cocinero', 'repartidor')

# entrega_domicilio

- id_entrega
- empleado_id
- pedido_id
- fecha y hora de la entrega

# pedidos

- id_pedido
- fecha y hora
- reparto a domicilio/recogida en tienda
- cantidad de producto de cada tipo
- precio total

> > one to many: pedido puede tener 1 o varios productos
> > FK en pizzas, hamburguesas, bebidas
