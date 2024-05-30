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
use GardenDB;
select *
from pedido
inner join estadoPedido on estadoPedido.idEstado=pedido.idEstado
where fechaEntrega > fechaEsperada and estadoPedido.estado="Entregado";

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
inner join estadopedido as est on  est.idestado=pe.idEstado
where pe.fechaEntrega > pe.fechaEsperada and est.estado="Entregado";

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


select cli.nombre
from cliente as cli
INNER JOIN pedido as pe on pe.idCliente = cli.codigo
where cli.codigo not in (select idCliente from pedido);

