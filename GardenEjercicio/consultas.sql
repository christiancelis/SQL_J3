use GardenDB;

## Consultas sobre una tabla

-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

select ofi.codigo as Oficina, ciu.nombre as Ciudad
from oficina as ofi, ciudad as ciu
where ofi.idciudad = ciu.idciudad
order by ofi.codigo;

--2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

select ciu.nombre as Ciudad, ofi.telefono as telefono
from oficina as ofi
inner join ciudad as ciu on ciu.idCiudad=ofi.idCiudad
inner join Departamento as dep on dep.idDepartamento=ciu.idRegion
inner join pais as pa on pa.idPais= dep.idPais
where pa.nombre="España";

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
-- jefe tiene un código de jefe igual a 7.
select emp.nombre, emp.apellido1,emp.apellido2,emp.email
from empleado as emp
inner join empleado as jf on jf.codigo=emp.codigoJefe
where jf.codigoJefe=7;

-- 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
-- empresa.
select *
from empleado
where codigoJefe is null;


--5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
--empleados que no sean representantes de ventas.

select nombre, apellido1, apellido2, puesto from empleado
where puesto <> "Representante Ventas";


--6. Devuelve un listado con el nombre de los todos los clientes españoles.
select ciu.nombre as Ciudad, cli.nombre as Cliente
from cliente as cli
inner join ciudad as ciu on ciu.idCiudad=cli.idCiudad
inner join Departamento as dep on dep.idDepartamento=ciu.idRegion
inner join pais as pa on pa.idPais= dep.idPais
where pa.nombre="España";


-- 7. Devuelve un listado con los distintos estados por los que puede pasar un
-- pedido.
select estado from estadoPedido;



-- 8. Devuelve un listado con el código de cliente de aquellos clientes que
-- realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
-- aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:


-- utilizando year
select cli.nombre, cli.codigo, pa.fechaPago
from cliente as cli , pago as pa
where cli.codigo = pa.codigocliente and year(pa.fechaPago) = "2008";

-- utilizando date_format
select cli.nombre, cli.codigo, pa.fechaPago
from cliente as cli , pago as pa
where cli.codigo = pa.codigocliente and DATE_FORMAT(fechaPago,"%Y")="2008";


--sin utilizar las funciones anteriores;

select cli.nombre, cli.codigo, pa.fechaPago
from cliente as cli , pago as pa
where cli.codigo = pa.codigocliente and fechaPago BETWEEN "2008/01/01" and "2008/12/31";

-- 9. Devuelve un listado con el código de pedido, código de cliente, fecha
-- esperada y fecha de entrega de los pedidos que no han sido entregados a
-- tiempo.

select pe.codigo,pe.idCliente, pe.fechaEsperada,pe.FechaEntrega
from pedido as pe
inner join estadoPedido as ep on ep.idEstado=pe.idEstado
where pe.fechaEntrega > pe.fechaEsperada and ep.estado="Entregado";

-- 10. Devuelve un listado con el código de pedido, código de cliente, fecha
-- esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
-- menos dos días antes de la fecha esperada.

select pe.codigo,cli.codigo,pe.fechaEsperada,pe.fechaEntrega
from cliente as cli
inner join pedido as pe on pe.idCliente = cli.codigo
where pe.fechaEntrega <= ADDDATE(pe.fechaEsperada, INTERVAL -2 DAY);

select pe.codigo,cli.codigo,pe.fechaEsperada,pe.fechaEntrega
from cliente as cli
inner join pedido as pe on pe.idCliente = cli.codigo
where datediff(pe.fechaEsperada,pe.fechaEntrega)>=2;

select  pe.codigo,cli.codigo,pe.fechaEsperada,pe.fechaEntrega,
pe.fechaEntrega, (day(pe.fechaEntrega)-day(pe.fechaEsperada)) as diferencia
from cliente as cli
inner join pedido as pe on pe.idCliente = cli.codigo
where  day(pe.fechaEntrega)-day(pe.fechaEsperada) <= -2 and month(pe.fechaEntrega) <= month(pe.fechaEsperada) ;

-- 11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

select codigo,fechaPedido, fechaEsperada, fechaEntrega
from pedido
where year(fechaPedido)="2009";

-- 12. Devuelve un listado de todos los pedidos que han sido entregados en el
-- mes de enero de cualquier año.


select codigo,fechaPedido, fechaEsperada, fechaEntrega
from pedido
where month(fechaPedido)="01";


-- 13. Devuelve un listado con todos los pagos que se realizaron en el
-- año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

select *
from pago
where year(fechaPago)="2008" and formaPago="Paypal"
ORDER BY total desc;


-- 14. Devuelve un listado con todas las formas de pago que aparecen en la
-- tabla pago. Tenga en cuenta que no deben aparecer formas de pago
-- repetidas.


select distinct(formaPago)
from pago;


-- 15. Devuelve un listado con todos los productos que pertenecen a la
-- gama Ornamentales y que tienen más de 100 unidades en stock. El listado
-- deberá estar ordenado por su precio de venta, mostrando en primer lugar
-- los de mayor precio.

select pro.gama,pro.nombre
from producto as pro
inner join gamaproducto as gp on gp.gama=pro.gama
where gp.gama ="Ornamentales" and pro.cantidadstock >100
order by pro.precioventa desc;



-- 16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
-- cuyo representante de ventas tenga el código de empleado 11 o 30.


select cli.codigo,cli.nombre as cliente, cli.nombrecontacto as contacto
from cliente as cli
inner join ciudad as ci on ci.idciudad=cli.idciudad
where ci.nombre="Madrid" and cli.codigoEmpleadoRepVentas = 11 or cli.codigoEmpleadoRepVentas = 30;

-- Consultas multitabla (Composición interna)

-- 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
-- representante de ventas.

select c.nombre as Cliente,  e.nombre as "Representante ventas", concat(e.apellido1," ",e.apellido2) as Apellidos
from cliente as c
inner Join empleado as e on c.codigoEmpleadoRepVentas = e.codigo;


-- 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el
-- nombre de sus representantes de ventas.


select c.nombre, e.nombre as "Representante ventas"
from cliente as c
inner Join empleado as e on c.codigoEmpleadoRepVentas = e.codigo
where c.codigo in(select c.codigo from pago);


-- 3. Muestra el nombre de los clientes que no hayan realizado pagos junto con
-- el nombre de sus representantes de ventas.


select cli.nombre as cliente, emp.nombre as "Representante ventas"
from cliente as cli
inner join empleado as emp on cli.codigoEmpleadoRepVentas = emp.codigo
where cli.codigo not in(select codigocliente from pago);


-- 4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
-- representantes junto con la ciudad de la oficina a la que pertenece el
-- representante.

select cli.nombre, emp.nombre as "Representante ventas", city.nombre as "Ubicacion OFICINA"
from cliente as cli
inner Join empleado as emp on cli.codigoEmpleadoRepVentas = emp.codigo
inner Join oficina as ofi on ofi.codigo = emp.codigoOficina
inner join ciudad as city on city.idciudad=ofi.idciudad
where cli.codigo in(select codigocliente from pago) ;


-- 5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre
-- de sus representantes junto con la ciudad de la oficina a la que pertenece el
-- representante.

select cli.nombre, emp.nombre as "Representante ventas", city.nombre as "Ubicacion OFICINA"
from cliente as cli
inner Join empleado as emp on cli.codigoEmpleadoRepVentas = emp.codigo
inner Join oficina as ofi on ofi.codigo = emp.codigoOficina
inner join ciudad as city on city.idciudad=ofi.idciudad
where cli.codigo not in(select codigocliente from pago);


-- 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

    select ofi.nombre, dir.direccion
    from oficina as ofi
    inner join direccionOficina as dofi on dofi.idOficina=ofi.codigo
    inner join direccion as dir on dir.idDireccion=dofi.idDireccion
    where dir.direccion="Fuenlabrada";


-- 7. Devuelve el nombre de los clientes y el nombre de sus representantes junto
-- con la ciudad de la oficina a la que pertenece el representante.


select cli.nombre, emp.nombre as "Representante ventas", city.nombre as "Ubicacion OFICINA"
from cliente as cli
inner Join empleado as emp on cli.codigoEmpleadoRepVentas = emp.codigo
inner Join oficina as ofi on ofi.codigo = emp.codigoOficina
inner join ciudad as city on city.idciudad=ofi.idciudad;

-- 8. Devuelve un listado con el nombre de los empleados junto con el nombre
-- de sus jefes.

select emp.nombre as empleado, jf.nombre as jefe
from empleado as emp
inner join empleado as jf on emp.codigoJefe=jf.codigo;

-- 9. Devuelve un listado que muestre el nombre de cada empleados, el nombre
-- de su jefe y el nombre del jefe de sus jefe.


select emp.nombre as empleado,jf.nombre as jefe,jf2.nombre as jefedelJefe
from empleado as emp
inner join empleado as jf on emp.codigoJefe=jf.codigo
inner join empleado as jf2 on jf.codigoJefe=jf2.codigo;

-- 10. Devuelve el nombre de los clientes a los que no se les ha entregado a
-- tiempo un pedido.

select cli.nombre
from cliente as cli
inner join pedido as pe on pe.idCliente=cli.codigo
inner join estadoPedido as est on  est.idestado=pe.idEstado
where pe.fechaEntrega > pe.fechaEsperada and est.estado="Entregado";
show tables;
-- 11. Devuelve un listado de las diferentes gamas de producto que ha comprado
-- cada cliente.


select cli.nombre, gp.gama, count(gp.gama) as "Numero de productos"
from cliente as cli
INNER JOIN pedido as pe on pe.idCliente = cli.codigo
inner join detallepedido as dt on dt.codigoPedido = pe.codigo
inner join producto as pro on pro.codigo = dt.codigoProducto
inner join gamaproducto as gp on gp.gama = pro.gama
group by cli.nombre, gp.gama
order by cli.nombre;


-- Consultas multitabla (Composición externa)


-- 1. Devuelve un listado que muestre solamente los clientes que no han
-- realizado ningún pago.

select cli.nombre as cliente
from cliente as cli
left join pago as pa on pa.codigocliente=cli.codigo
where pa.codigocliente is null;

-- 2. Es la misma consulta

-- 3. Devuelve un listado que muestre los clientes que no han realizado ningún
-- pago y los que no han realizado ningún pedido.

select cliente.nombre as cliente
from cliente
left join pago on cliente.codigo = pago.codigocliente
left join pedido ON cliente.codigo = pedido.idCliente
where pago.idTransaccion is null or pedido.codigo is null;

-- 4. Devuelve un listado que muestre solamente los empleados que no tienen
-- una oficina asociada.

select empleado.codigo, empleado.nombre as empleado,empleado.apellido1,empleado.apellido2
from empleado
left join oficina on empleado.codigoOficina = oficina.codigo
where oficina.codigo is null;

-- 5. Devuelve un listado que muestre solamente los empleados que no tienen un
-- cliente asociado.
select empleado.*
from empleado
left join cliente on empleado.codigo  = cliente.codigoEmpleadoRepVentas
where cliente.codigoEmpleadoRepVentas is null;

-- 6. Devuelve un listado que muestre solamente los empleados que no tienen un
-- cliente asociado junto con los datos de la oficina donde trabajan.

select empleado.puesto,empleado.nombre,empleado.apellido1,empleado.apellido2, oficina.*
from empleado
left join cliente on empleado.codigo  = cliente.codigoEmpleadoRepVentas
left join oficina on empleado.codigoOficina  = oficina.codigo
where cliente.codigoEmpleadoRepVentas is null;

-- 7. Devuelve un listado que muestre los empleados que no tienen una oficina
-- asociada y los que no tienen un cliente asociado.

select distinct(empleado.codigo), empleado.nombre, empleado.codigoOficina, cliente.codigoEmpleadoRepVentas
from empleado
left join cliente on empleado.codigo  = cliente.codigoEmpleadoRepVentas
where cliente.codigoEmpleadoRepVentas is null or empleado.codigoOficina is null;



-- 8. Devuelve un listado de los productos que nunca han aparecido en un
-- pedido.

select producto.nombre, detallepedido.codigoProducto
from producto
left join detallepedido on producto.codigo = detallepedido.codigoProducto
where detallepedido.codigoPedido is null;


-- 9. Devuelve un listado de los productos que nunca han aparecido en un
-- pedido. El resultado debe mostrar el nombre, la descripción y la imagen del
-- producto.
select producto.nombre, producto.descripcion, gamaproducto.imagen
from  producto
left join detallepedido on producto.codigo = detallepedido.codigoProducto
left join gamaproducto on producto.gama = gamaproducto.gama
where detallepedido.codigoPedido is null;

-- 10. Devuelve las oficinas donde no trabajan ninguno de los empleados que
-- hayan sido los representantes de ventas de algún cliente que haya realizado
-- la compra de algún producto de la gama Frutales.
select *
from oficina
where oficina.codigo not in (
    select oficina.codigo
    from oficina
    inner join empleado on oficina.codigo = empleado.codigoOficina
    inner join cliente on empleado.codigo = cliente.codigoEmpleadoRepVentas
    inner join pedido on cliente.codigo = pedido.idCliente
    inner join detallepedido on pedido.codigo = detallepedido.codigoPedido
    inner join producto on detallepedido.codigoProducto = producto.codigo
    where producto.gama = 'Frutales'
);


-- 11. Devuelve un listado con los clientes que han realizado algún pedido pero no
-- han realizado ningún pago.
select cliente.nombre as cliente from cliente
left join pago on cliente.codigo = pago.codigocliente
left join pedido on cliente.codigo = pedido.idCliente
where pedido.idCliente = cliente.codigo and pago.idTransaccion is null;


-- 12. Devuelve un listado con los datos de los empleados que no tienen clientes
-- asociados y el nombre de su jefe asociado.
select empleado.*, jefe.nombre as nombre_jefe
from empleado
left join empleado as jefe on empleado.codigoJefe = jefe.codigo
left join cliente on empleado.codigo  = cliente.codigoEmpleadoRepVentas
where cliente.codigoEmpleadoRepVentas is null;

-- Consultas resumen

-- 1. ¿Cuántos empleados hay en la compañía?

select count(emp.codigo) as "Cantidad Empleados"
from empleado as emp;

-- 2. ¿Cuántos clientes tiene cada país?


select pa.nombre, count(cli.codigo) as "Cantidad Clientes por Pais"
from cliente as cli
inner join ciudad as city on city.idCiudad=cli.idCiudad
inner join Departamento as dept on dept.idDepartamento=city.idRegion
inner join Pais as pa on pa.idPais= dept.idPais
group by pa.nombre;

-- 3. ¿Cuál fue el pago medio en 2009?


select avg(total) as "Promedio Pago 2009"
from pago
where year(fechaPago)="2009";


-- 4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma
-- descendente por el número de pedidos.

select est.estado, count(pe.codigo) as "Cantidad"
from pedido as pe
inner join estadopedido as est on est.idEstado=pe.idEstado
group by est.estado;


-- 5. Calcula el precio de venta del producto más caro y más barato en una
-- misma consulta.

select codigo, nombre, precioventa
from producto
where precioventa in ( select max(precioventa) from producto) or precioventa in (select min(precioventa)
from producto)
order by precioventa desc;

-- 6. Calcula el número de clientes que tiene la empresa.

select count(codigo) as "Cantidad Clientes"
from cliente;

-- 7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
select city.nombre , count(cli.codigo) as "Cantidad"
from cliente as cli
inner join ciudad as city on city.idCiudad=cli.idCiudad
group by city.nombre
having city.nombre="Madrid";


-- 8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan
-- por M?
select city.nombre , count(cli.codigo) as "Cantidad"
from cliente as cli
inner join ciudad as city on city.idCiudad=cli.idCiudad
group by city.nombre
having city.nombre like "M%";


-- 9. Devuelve el nombre de los representantes de ventas y el número de clientes
-- al que atiende cada uno.


select emp.nombre , count(cli.codigo)
from empleado as emp
inner join cliente as cli on cli.codigoEmpleadoRepVentas=emp.codigo
group by emp.nombre;

-- 10. Calcula el número de clientes que no tiene asignado representante de
-- ventas.

select count(cli.codigo) as "Cantidad"
from empleado as emp
inner join cliente as cli on cli.codigoEmpleadoRepVentas=emp.codigo
where cli.codigoEmpleadoRepVentas is null;

-- 11. Calcula la fecha del primer y último pago realizado por cada uno de los
-- clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

select cli.nombre, cli.nombreContacto,cli.apellidoContacto, min(pa.fechapago) as "Primer Pago",max(pa.fechapago) as "Ultimo Pago"
from cliente as cli
inner join pago as pa on pa.codigocliente= cli.codigo
group by cli.nombre, cli.nombreContacto,cli.apellidoContacto;


-- 12. Calcula el número de productos diferentes que hay en cada uno de los
-- pedidos.


select pe.codigo,count(pro.codigo) as "Cantidad"
from pedido as pe
inner join detallepedido as dt on dt.codigopedido= pe.codigo
inner join producto as pro on pro.codigo= dt.codigoProducto
group by pe.codigo;


-- 13. Calcula la suma de la cantidad total de todos los productos que aparecen en
-- cada uno de los pedidos.

select pe.codigo,count(pro.codigo) as "Cantidad", sum(dt.precioUnidad*dt.cantidad) as total
from pedido as pe
inner join detallepedido as dt on dt.codigopedido= pe.codigo
inner join producto as pro on pro.codigo= dt.codigoProducto
group by pe.codigo;

-- 14. Devuelve un listado de los 20 productos más vendidos y el número total de
-- unidades que se han vendido de cada uno. El listado deberá estar ordenado
-- por el número total de unidades vendidas.


select pro.nombre, dt.cantidad
from pedido as pe
inner join detallepedido as dt on dt.codigopedido= pe.codigo
inner join producto as pro on pro.codigo= dt.codigoProducto
order by dt.cantidad desc
limit 20;


-- 15. La facturación que ha tenido la empresa en toda la historia, indicando la
-- base imponible, el IVA y el total facturado. La base imponible se calcula
-- sumando el coste del producto por el número de unidades vendidas de la
-- tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la
-- suma de los dos campos anteriores.


select  sum(dt.precioUnidad*dt.cantidad) as "Base imponible", sum((dt.precioUnidad*dt.cantidad)*0.21) as  "Iva", sum((dt.precioUnidad*dt.cantidad)+(dt.precioUnidad*dt.cantidad)*0.21) as total
from pedido as pe
inner join detallepedido as dt on dt.codigopedido= pe.codigo
inner join producto as pro on pro.codigo= dt.codigoProducto;

-- 16. La misma información que en la pregunta anterior, pero agrupada por
-- código de producto.

select dt.codigoProducto,sum(dt.precioUnidad*dt.cantidad) as "Base imponible", sum((dt.precioUnidad*dt.cantidad)*0.21) as  "Iva", sum((dt.precioUnidad*dt.cantidad)+(dt.precioUnidad*dt.cantidad)*0.21) as total
from pedido as pe
inner join detallepedido as dt on dt.codigopedido= pe.codigo
inner join producto as pro on pro.codigo= dt.codigoProducto
group by dt.codigoProducto;

-- 17. La misma información que en la pregunta anterior, pero agrupada por
-- código de producto filtrada por los códigos que empiecen por OR.

select dt.codigoProducto,sum(dt.precioUnidad*dt.cantidad) as "Base imponible", sum((dt.precioUnidad*dt.cantidad)*0.21) as  "Iva", sum((dt.precioUnidad*dt.cantidad)+(dt.precioUnidad*dt.cantidad)*0.21) as total
from pedido as pe
inner join detallepedido as dt on dt.codigopedido= pe.codigo
inner join producto as pro on pro.codigo= dt.codigoProducto
group by dt.codigoProducto
having dt.codigoproducto like "OR%";


-- 18. Lista las ventas totales de los productos que hayan facturado más de 3000
-- euros. Se mostrará el nombre, unidades vendidas, total facturado y total
-- facturado con impuestos (21% IVA).


select dt.codigoProducto, pro.nombre, dt.cantidad, sum(dt.precioUnidad*dt.cantidad) as "Base imponible", sum((dt.precioUnidad*dt.cantidad)+(dt.precioUnidad*dt.cantidad)*0.21) as total
from pedido as pe
inner join detallepedido as dt on dt.codigopedido= pe.codigo
inner join producto as pro on pro.codigo= dt.codigoProducto
group by dt.codigoProducto, pro.nombre, dt.cantidad
having total>3000;



-- 19. Muestre la suma total de todos los pagos que se realizaron para cada uno
-- de los años que aparecen en la tabla pagos.


select year(fechaPago), sum(total) as "Total Pagos"
from pago
group by year(fechaPago);


-- Subconsultas
-- Con operadores básicos de comparación

-- 1. Devuelve el nombre del cliente con mayor límite de crédito.

select cli.nombre, limiteCredito
from cliente as cli
where limiteCredito = (select max(limiteCredito) from cliente);

-- 2. Devuelve el nombre del producto que tenga el precio de venta más caro.

select pro.nombre
from producto as pro
where precioVenta = (select max(precioVenta) from producto);


-- 3. Devuelve el nombre del producto del que se han vendido más unidades.
-- (Tenga en cuenta que tendrá que calcular cuál es el número total de
-- unidades que se han vendido de cada producto a partir de los datos de la
-- tabla detalle_pedido)


select dt.codigoProducto,dt.cantidad
from detallepedido as dt
inner join producto as pro on pro.codigo= dt.codigoProducto
order by dt.cantidad desc
limit 1;


-- 4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya
-- realizado. (Sin utilizar INNER JOIN).

select codigo, nombre
from cliente as cli
where limiteCredito > (select total
from pago where codigocliente=cli.codigo);


-- 5. Devuelve el producto que más unidades tiene en stock.
select nombre, cantidadstock
from producto
where cantidadstock = (select max(cantidadstock) from producto);


-- 6. Devuelve el producto que menos unidades tiene en stock.

select nombre, cantidadstock
from producto
where cantidadstock = (select min(cantidadstock) from producto);

-- 7. Devuelve el nombre, los apellidos y el email de los empleados que están a
-- cargo de Alberto Soria.

select nombre,apellido1,apellido2, email
from empleado
where codigo= (select codigoJefe
from empleado
where nombre = "Alberto" and apellido1="Soria"
);


-- Subconsultas con ALL y ANY


-- 8. Devuelve el nombre del cliente con mayor límite de crédito.

select codigo, nombre
from cliente as cli
where limiteCredito = any (select max(limiteCredito)
from cliente);


-- 9. Devuelve el nombre del producto que tenga el precio de venta más caro.


select pro.nombre
from producto as pro
where precioVenta = any (select max(precioVenta) from producto);


-- 10. Devuelve el producto que menos unidades tiene en stock.
select nombre, cantidadstock
from producto
where cantidadstock = any(select min(cantidadstock) from producto);


-- Subconsultas con IN y NOT IN

-- 11. Devuelve el nombre, apellido1 y cargo de los empleados que no
-- representen a ningún cliente.

select nombre, apellido1, puesto
from empleado
where codigo not in (select codigoEmpleadoRepVentas from cliente);


-- 12. Devuelve un listado que muestre solamente los clientes que no han
-- realizado ningún pago.

select nombre
from cliente where codigo not in (select codigocliente
from pago);

-- 13. Devuelve un listado que muestre solamente los clientes que sí han realizado
-- algún pago.

select nombre
from cliente where codigo in (select codigocliente
from pago);


-- 14. Devuelve un listado de los productos que nunca han aparecido en un
-- pedido.

select nombre
from producto where codigo not in(select codigoProducto
from detallepedido);

-- 15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
-- empleados que no sean representante de ventas de ningún cliente.

select emp.*, (select telefono from oficina as ofi where ofi.codigo=emp.codigoOficina) as telefono
from empleado as emp
where emp.puesto="Representante Ventas" and emp.codigo not in (select codigoEmpleadoRepVentas from cliente);

-- 16. Devuelve las oficinas donde no trabajan ninguno de los empleados que
-- hayan sido los representantes de ventas de algún cliente que haya realizado
-- la compra de algún producto de la gama Frutales.

select *
from oficina
where oficina.codigo not in (
    select oficina.codigo
    from oficina
    inner join empleado on oficina.codigo = empleado.codigoOficina
    inner join cliente on empleado.codigo = cliente.codigoEmpleadoRepVentas
    inner join pedido on cliente.codigo = pedido.idCliente
    inner join detallepedido on pedido.codigo = detallepedido.codigoPedido
    inner join producto on detallepedido.codigoProducto = producto.codigo
    where producto.gama = 'Frutales'
);

-- 17. Devuelve un listado con los clientes que han realizado algún pedido pero no
-- han realizado ningún pago.


select nombre
from cliente
where codigo in (select idcliente from pedido) and codigo not in(select codigocliente from pago);


-- Subconsultas con EXISTS y NOT EXISTS

-- 18. Devuelve un listado que muestre solamente los clientes que no han
-- realizado ningún pago.

select nombre
from cliente as cli
where not exists(select codigocliente from pago where cli.codigo=codigocliente);

-- 19. Devuelve un listado que muestre solamente los clientes que sí han realizado
-- algún pago.
select nombre
from cliente as cli
where exists(select codigocliente from pago where cli.codigo=codigocliente);


-- 20. Devuelve un listado de los productos que nunca han aparecido en un
-- pedido.


select nombre
from producto as pro
where not exists (select codigoProducto from detallepedido where pro.codigo=codigoProducto);

-- 21. Devuelve un listado de los productos que han aparecido en un pedido
-- alguna vez.

select nombre
from producto as pro
where exists (select codigoProducto from detallepedido where pro.codigo=codigoProducto);


-- Subconsultas correlacionadas
-- Consultas variadas

-- 1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos
-- pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no
-- han realizado ningún pedido.

select c.nombre AS nombre_cliente,  (select  COUNT(p.codigo) AS numero_pedidos  from pedido as p where p.idcliente=c.codigo) as NumeroPedidos
from cliente as c;


-- 2. Devuelve un listado con los nombres de los clientes y el total pagado por
-- cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han
-- realizado ningún pago.

select cli.nombre , (select sum(total) from pago as pa where pa.codigocliente=cli.codigo)
from cliente as cli;

-- 3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008
-- ordenados alfabéticamente de menor a mayor.

select distinct(cli.nombre) as cliente
from cliente as cli
where cli.codigo = (select pe.idcliente from pedido as pe where pe.idcliente=cli.codigo and year(pe.fechaPedido)="2008")
order by cli.nombre asc;


-- 4. Devuelve el nombre del cliente, el nombre y primer apellido de su
-- representante de ventas y el número de teléfono de la oficina del
-- representante de ventas, de aquellos clientes que no hayan realizado ningún
-- pago.

select cli.nombre as cliente,emp.nombre as nombre_rep_ventas, emp.apellido1 as apellido_rep_ventas, ofi.telefono AS telefono_oficina
from cliente as cli , empleado as emp, oficina as ofi
where cli.codigoEmpleadoRepVentas=emp.codigo and
 emp.codigoOficina=ofi.codigo and not exists (select pa.codigocliente from pago as pa where pa.codigocliente=cli.codigo);


-- 5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el
-- nombre y primer apellido de su representante de ventas y la ciudad donde
-- está su oficina.


SELECT c.nombre AS nombre_cliente, e.nombre AS nombre_rep_ventas, e.apellido1 AS apellido_rep_ventas, ci.nombre AS ciudad_oficina
FROM cliente c
JOIN empleado e ON c.codigoEmpleadoRepVentas = e.codigo
JOIN oficina o ON e.codigoOficina = o.codigo
JOIN ciudad ci ON o.idCiudad = ci.idCiudad;



-- 6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
-- empleados que no sean representante de ventas de ningún cliente.

SELECT e.nombre AS nombre_empleado, e.apellido1 AS apellido1_empleado, e.apellido2 AS apellido2_empleado, e.puesto, o.telefono AS telefono_oficina
FROM empleado e
JOIN oficina o ON e.codigoOficina = o.codigo
LEFT JOIN cliente c ON e.codigo = c.codigoEmpleadoRepVentas
WHERE c.codigoEmpleadoRepVentas IS NULL;


-- 7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el
-- número de empleados que tiene.

SELECT ci.nombre AS ciudad, COUNT(e.codigo) AS numero_empleados
FROM oficina o
JOIN ciudad ci ON o.idCiudad = ci.idCiudad
JOIN empleado e ON e.codigoOficina = o.codigo
GROUP BY ci.nombre;