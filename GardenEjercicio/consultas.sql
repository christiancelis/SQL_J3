use GardenDB;

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
select *
from pedido
inner join estadoPedido on estadoPedido.idEstado=pedido.idEstado
where fechaEntrega > fechaEsperada and estadoPedido.estado="Entregado";

-- 10. Devuelve un listado con el código de pedido, código de cliente, fecha
-- esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
-- menos dos días antes de la fecha esperada.










