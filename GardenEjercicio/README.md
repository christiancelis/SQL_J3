## EJERCICIO BASE DE DATOS GARDEN
 
 - AUTOR: CHRISTIAN CELIS
## Consultas sobre una tabla


1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

``` sql
select ofi.nombre as Oficina, ciu.nombre as Ciudad
from oficina as ofi, ciudad as ciu
where ofi.idciudad = ciu.idciudad;
```
~~~
+---------+------------+
| OFI001  | Madrid     |
| OFI002  | París      |
| OFI003  | Roma       |
| OFI004  | Berlín     |
| OFI005  | Londres    |
| OFI006  | Lisboa     |
| OFI007  | Bruselas   |
| OFI008  | Viena      |
| OFI009  | Estocolmo  |
| OFI010  | Copenhague |
| OFI011  | Barcelona  |
| OFI012  | Lyon       |
| OFI013  | Milán      |
| OFI014  | Munich     |
| OFI015  | Manchester |
| OFI016  | Ámsterdam  |
| OFI017  | Zúrich     |
| OFI018  | Varsovia   |
| OFI019  | Oslo       |
| OFI020  | Helsinki   |
+---------+------------+
~~~

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.



``` sql

select ciu.nombre as Ciudad, ofi.telefono as telefono
from oficina as ofi
inner join ciudad as ciu on ciu.idCiudad=ofi.idCiudad
inner join Departamento as dep on dep.idDepartamento=ciu.idRegion
inner join pais as pa on pa.idPais= dep.idPais
where pa.nombre="España";

```
~~~
+-----------+-------------------+
| Ciudad    | telefono          |
+-----------+-------------------+
| Barcelona | +33 1 23 45 67 89 |
| Barcelona | +32 2 987 65 43   |
| Madrid    | +34 91 123 4567   |
| Madrid    | +31 20 123 4567   |
| Valencia  | +44 20 1234 5678  |
+-----------+-------------------+

~~~


3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
jefe tiene un código de jefe igual a 7.


4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
empresa.


``` sql
select *
from empleado
where codigoJefe is null;
```

~~~
+--------+--------+-----------+-----------+-----------+-------------------------+---------------+------------+------------------+
| codigo | nombre | apellido1 | apellido2 | extension | email                   | codigoOficina | codigoJefe | puesto           |
+--------+--------+-----------+-----------+-----------+-------------------------+---------------+------------+------------------+
|   1001 | Juan   | García    | López     | 1234      | juan.garcia@example.com | OFI001        |       NULL | Director General |
+--------+--------+-----------+-----------+-----------+-------------------------+---------------+------------+------------------+
~~~


5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
empleados que no sean representantes de ventas.


``` sql
select nombre, apellido1, apellido2, puesto from empleado
where puesto <> "Representante Ventas";
```

~~~
+--------+------------+------------+-----------------------+
| nombre | apellido1  | apellido2  | puesto                |
+--------+------------+------------+-----------------------+
| Juan   | García     | López      | Director General      |
| María  | Martínez   | Fernández  | Subdirector Marketing |
| Pedro  | Rodríguez  | Gómez      | Subdirector Ventas    |
| Ana    | González   | Pérez      | Secretaria            |
+--------+------------+------------+-----------------------+
~~~


6. Devuelve un listado con el nombre de los todos los clientes españoles.

``` sql
select ciu.nombre as Ciudad, cli.nombre as Cliente
from cliente as cli
inner join ciudad as ciu on ciu.idCiudad=cli.idCiudad
inner join Departamento as dep on dep.idDepartamento=ciu.idRegion
inner join pais as pa on pa.idPais= dep.idPais
where pa.nombre="España";
```
~~~
+-----------+-------------------------+
| Ciudad    | Cliente                 |
+-----------+-------------------------+
| Sevilla   | Plantas Exóticas        |
| Sevilla   | Jardines Urbanos        |
| Barcelona | Flores y Plantas S.A.   |
| Barcelona | Jardines Modernos       |
| Madrid    | Jardinería Verde        |
| Madrid    | Plantas Vivas           |
| Valencia  | Herramientas de Jardín  |
+-----------+-------------------------+
~~~

7. Devuelve un listado con los distintos estados por los que puede pasar un
pedido.

``` sql
select nombre from estadoPedido;

```
~~~
+----------------------------+
| estado                     |
+----------------------------+
| Pendiente                  |
| Procesado                  |
| Enviado                    |
| Entregado                  |
| Cancelado                  |
| Devuelto                   |
| En preparación             |
| Listo para enviar          |
| Reembolsado                |
| En revisión                |
| En espera de pago          |
| Pagado                     |
| En almacén                 |
| En tránsito                |
| Rechazado                  |
| Aceptado                   |
| En espera de confirmación  |
| Completado                 |
| No disponible              |
| Faltante                   |
+----------------------------+
~~~


8. Devuelve un listado con el código de cliente de aquellos clientes que
realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:

### **Utilizando year**
``` sql
select cli.nombre, cli.codigo, pa.fechaPago
from cliente as cli , pago as pa
where cli.codigo = pa.codigocliente and year(pa.fechaPago) = "2008";
```

### **Utilizando date_format**

``` sql
select cli.nombre, cli.codigo, pa.fechaPago
from cliente as cli , pago as pa
where cli.codigo = pa.codigocliente and DATE_FORMAT(fechaPago,"%Y")="2008";

```
### **sin utilizar funciones**

``` sql
select cli.nombre, cli.codigo, pa.fechaPago
from cliente as cli , pago as pa
where cli.codigo = pa.codigocliente and fechaPago BETWEEN "2008/01/01" and "2008/12/31";


```


~~~
+-------------------------+--------+------------+
| nombre                  | codigo | fechaPago  |
+-------------------------+--------+------------+
| Herramientas de Jardín  |   2003 | 2008-05-03 |
| Jardines Modernos       |   2011 | 2008-05-11 |
| Flores y Más            |   2017 | 2008-05-17 |
+-------------------------+--------+------------+
~~~




9. Devuelve un listado con el código de pedido, código de cliente, fechaesperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

``` sql
select *
from pedido
inner join estadoPedido on estadoPedido.idEstado=pedido.idEstado
where fechaEntrega > fechaEsperada and estadoPedido.estado="Entregado";
```

10. Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
menos dos días antes de la fecha esperada.

### **Utilizando la función ADDDATE de MySQL.**

``` sql
select codigoPedido,codigoCliente,fechaEsperada,
fechaEntrega
from pedido
where fechaEntrega <= ADDDATE(fechaEsperada, INTERVAL -2 DAY);

```

### **Utilizando la función DATEDIFF de MySQL.**

``` sql
select codigoPedido,codigoCliente,fechaEsperada,
fechaEntrega
from pedido
where datediff(fechaEntrega,fechaEsperada)>=2;
```

### **¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?**

``` sql
select codigoPedido,codigoCliente,fechaEsperada,
fechaEntrega, (day(fechaEntrega)-day(fechaEsperada)) as diferencia
from pedido
where  day(fechaEntrega)-day(fechaEsperada) <= -2 and month(fechaEntrega) <= month(fechaEsperada) ;

```

~~~

~~~


