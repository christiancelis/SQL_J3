## EJERCICIO BASE DE DATOS GARDEN
 
 - AUTOR: CHRISTIAN CELIS
## Consultas sobre una tabla


1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

    ``` sql
    select ofi.nombre as Oficina, ciu.nombre as Ciudad
    from oficina as ofi, ciudad as ciu
    where ofi.idciudad = ciu.idciudad;
    ```
    ```bash
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
    ```

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

    ``` sql
    select ciu.nombre as Ciudad, ofi.telefono as telefono
    from oficina as ofi
    inner join ciudad as ciu on ciu.idCiudad=ofi.idCiudad
    inner join Departamento as dep on dep.idDepartamento=ciu.idRegion
    inner join pais as pa on pa.idPais= dep.idPais
    where pa.nombre="España";
    ```
    ```bash
    +-----------+-------------------+
    | Ciudad    | telefono          |
    +-----------+-------------------+
    | Barcelona | +33 1 23 45 67 89 |
    | Barcelona | +32 2 987 65 43   |
    | Madrid    | +34 91 123 4567   |
    | Madrid    | +31 20 123 4567   |
    | Valencia  | +44 20 1234 5678  |
    +-----------+-------------------+
    ``` 
3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
jefe tiene un código de jefe igual a 7.


4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
empresa.

    ``` sql
    select *
    from empleado
    where codigoJefe is null;
    ```

    ```bash
    +--------+--------+-----------+-----------+-----------+-------------------------+---------------+------------+------------------+
    | codigo | nombre | apellido1 | apellido2 | extension | email                   | codigoOficina | codigoJefe | puesto           |
    +--------+--------+-----------+-----------+-----------+-------------------------+---------------+------------+------------------+
    |   1001 | Juan   | García    | López     | 1234      | juan.garcia@example.com | OFI001        |       NULL | Director General |
    +--------+--------+-----------+-----------+-----------+-------------------------+---------------+------------+------------------+
    ``` 
5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
empleados que no sean representantes de ventas.

    ``` sql
    select nombre, apellido1, apellido2, puesto from empleado
    where puesto <> "Representante Ventas";
    ```
    ```bash
    +--------+------------+------------+-----------------------+
    | nombre | apellido1  | apellido2  | puesto                |
    +--------+------------+------------+-----------------------+
    | Juan   | García     | López      | Director General      |
    | María  | Martínez   | Fernández  | Subdirector Marketing |
    | Pedro  | Rodríguez  | Gómez      | Subdirector Ventas    |
    | Ana    | González   | Pérez      | Secretaria            |
    +--------+------------+------------+-----------------------+
    ``` 
6. Devuelve un listado con el nombre de los todos los clientes españoles.

    ``` sql
    select ciu.nombre as Ciudad, cli.nombre as Cliente
    from cliente as cli
    inner join ciudad as ciu on ciu.idCiudad=cli.idCiudad
    inner join Departamento as dep on dep.idDepartamento=ciu.idRegion
    inner join pais as pa on pa.idPais= dep.idPais
    where pa.nombre="España";
    ```
    ``` bash
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
    ``` 

7. Devuelve un listado con los distintos estados por los que puede pasar un
pedido.

    ```sql
    select nombre from estadoPedido;
    ```
    ```bash 
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
    ``` 


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
    ```bash 
    +-------------------------+--------+------------+
    | nombre                  | codigo | fechaPago  |
    +-------------------------+--------+------------+
    | Herramientas de Jardín  |   2003 | 2008-05-03 |
    | Jardines Modernos       |   2011 | 2008-05-11 |
    | Flores y Más            |   2017 | 2008-05-17 |
    +-------------------------+--------+------------+
    ``` 

9. Devuelve un listado con el código de pedido, código de cliente, fechaesperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

    ``` sql
    select pe.codigo,pe.idCliente, pe.fechaEsperada,pe.FechaEntrega
    from pedido as pe
    inner join estadoPedido as ep on ep.idEstado=pe.idEstado
    where pe.fechaEntrega > pe.fechaEsperada and ep.estado="Entregado";
    ```
    ```bash
        +--------+-----------+---------------+--------------+
    | codigo | idCliente | fechaEsperada | FechaEntrega |
    +--------+-----------+---------------+--------------+
    |   3001 |      2001 | 2008-12-27    | 2008-12-28   |
    |   3004 |      2004 | 2009-01-14    | 2009-01-15   |
    +--------+-----------+---------------+--------------+
    ``` 

10. Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
menos dos días antes de la fecha esperada.

    ### **Utilizando la función ADDDATE de MySQL.**

    ``` sql
    select pe.codigo,cli.codigo,pe.fechaEsperada,pe.fechaEntrega
    from cliente as cli 
    inner join pedido as pe on pe.idCliente = cli.codigo
    where pe.fechaEntrega <= ADDDATE(pe.fechaEsperada, INTERVAL -2 DAY);
    ```
    ### **Utilizando la función DATEDIFF de MySQL.**

    ``` sql
    select pe.codigo,cli.codigo,pe.fechaEsperada,pe.fechaEntrega
    from cliente as cli 
    inner join pedido as pe on pe.idCliente = cli.codigo
    where datediff(pe.fechaEsperada,pe.fechaEntrega)>=2;
    ```
    ### **¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?**

    ``` sql
    select  pe.codigo,cli.codigo,pe.fechaEsperada,pe.fechaEntrega,
    pe.fechaEntrega, (day(pe.fechaEntrega)-day(pe.fechaEsperada)) as diferencia
    from cliente as cli 
    inner join pedido as pe on pe.idCliente = cli.codigo
    where  day(pe.fechaEntrega)-day(pe.fechaEsperada) <= -2 and month(pe.fechaEntrega) <= month(pe.fechaEsperada) ;
    ```
    ```bash
    +--------+--------+---------------+--------------+
    | codigo | codigo | fechaEsperada | fechaEntrega |
    +--------+--------+---------------+--------------+
    |   3002 |   2002 | 2007-10-28    | 2007-10-26   |
    +--------+--------+---------------+--------------+
    ``` 

11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

    ``` sql
    select codigo,fechaPedido, fechaEsperada, fechaEntrega
    from pedido
    where year(fechaPedido)="2009";
    ```

    ```bash
    +--------+-------------+---------------+--------------+
    | codigo | fechaPedido | fechaEsperada | fechaEntrega |
    +--------+-------------+---------------+--------------+
    |   3004 | 2009-01-12  | 2009-01-14    | 2009-01-15   |
    |   3009 | 2009-05-09  | 2009-05-13    | 2009-05-12   |
    |   3012 | 2009-05-12  | 2009-05-16    | 2009-05-15   |
    |   3018 | 2009-11-18  | 2009-11-22    | 2009-11-21   |
    +--------+-------------+---------------+--------------+
    ```

12. Devuelve un listado de todos los pedidos que han sido entregados en el
mes de enero de cualquier año.

    ``` sql
    select codigo,fechaPedido, fechaEsperada, fechaEntrega
    from pedido
    where month(fechaPedido)="01";
    ```
    ```bash
    +--------+-------------+---------------+--------------+
    | codigo | fechaPedido | fechaEsperada | fechaEntrega |
    +--------+-------------+---------------+--------------+
    |   3004 | 2009-01-12  | 2009-01-14    | 2009-01-15   |
    +--------+-------------+---------------+--------------+
    ```

13. Devuelve un listado con todos los pagos que se realizaron en el
año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

    ``` sql
    select *
    from pago
    where year(fechaPago)="2008" and formaPago="Paypal"
    ORDER BY total desc;
    ```
    ```bash
    +---------------+-----------+------------+--------+---------------+
    | idTransaccion | formaPago | fechaPago  | total  | codigocliente |
    +---------------+-----------+------------+--------+---------------+
    | TRANS004      | Paypal    | 2008-05-04 | 220.00 |          2004 |
    | TRANS012      | Paypal    | 2008-05-12 | 210.00 |          2012 |
    +---------------+-----------+------------+--------+---------------+
    ```

14. Devuelve un listado con todas las formas de pago que aparecen en la
tabla pago. Tenga en cuenta que no deben aparecer formas de pago
repetidas.

    ``` sql
    select distinct(formaPago)
    from pago;
    ```
    ```bash
    +------------------------+
    | formaPago              |
    +------------------------+
    | Tarjeta de crédito     |
    | Transferencia bancaria |
    | Cheque                 |
    | Paypal                 |
    | Tarjeta de débito      |
    | Efectivo               |
    +------------------------+
    ```

15. Devuelve un listado con todos los productos que pertenecen a la
gama Ornamentales y que tienen más de 100 unidades en stock. El listado
deberá estar ordenado por su precio de venta, mostrando en primer lugar
los de mayor precio.

    ```sql
    select pro.gama,pro.nombre
    from producto as pro 
    inner join gamaproducto as gp on gp.gama=pro.gama
    where gp.gama ="Ornamentales" and pro.cantidadstock >100
    order by pro.precioventa desc;
    ```
    ```bash
    +--------------+----------------+
    | gama         | nombre         |
    +--------------+----------------+
    | Ornamentales | Cactus mixto   |
    | Ornamentales | Girasol        |
    | Ornamentales | Tulipán mixto  |
    +--------------+----------------+
    ```


16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
cuyo representante de ventas tenga el código de empleado 11 o 30.
    
    ```sql
    select cli.codigoEmpleadoRepVentas, cli.codigo,cli.nombre as cliente, cli.nombrecontacto as contacto
    from cliente as cli 
    inner join ciudad as ci on ci.idciudad=cli.idciudad
    where ci.nombre="Madrid" and cli.codigoEmpleadoRepVentas = 11 or cli.codigoEmpleadoRepVentas = 30;
    ```
    ```bash
    +-------------------------+--------+---------------------+----------+
    | codigoEmpleadoRepVentas | codigo | cliente             | contacto |
    +-------------------------+--------+---------------------+----------+
    |                      11 |   2020 | Plantas Decorativas | Antonio  |
    ```

## Consultas multitabla (Composición interna)

1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
representante de ventas.

    ```sql
    select c.nombre as Cliente,  e.nombre as "Representante ventas", concat(e.apellido1," ",e.apellido2) as Apellidos
    from cliente as c
    inner Join empleado as e on c.codigoEmpleadoRepVentas = e.codigo;
    ```

    ```bash
    +----------------------------------------+----------------------+--------------------+
    | Cliente                                | Representante ventas | Apellidos          |
    +----------------------------------------+----------------------+--------------------+
    | Jardinería Verde                       | Luis                 | Sánchez Díaz       |
    | Flores y Plantas S.A.                  | Elena                | López Hernández    |
    | Herramientas de Jardín                 | Pablo                | Fernández Martín   |
    | Analista de MarketingJardín del Edén   | Elena                | López Hernández    |
    | Plantas Exóticas                       | Pablo                | Fernández Martín   |
    | Verde y Más                            | Lucía                | Pérez García       |
    | Jardín en Casa                         | Manuel               | Gómez López        |
    | Jardines Modernos                      | Luis                 | Sánchez Díaz       |
    | Flores Elegantes                       | Elena                | López Hernández    |
    | Jardines del Sur                       | Pablo                | Fernández Martín   |
    | Plantas Frescas                        | Lucía                | Pérez García       |
    | Jardín Feliz                           | Manuel               | Gómez López        |
    | Plantas Vivas                          | Luis                 | Sánchez Díaz       |
    | Flores y Más                           | Elena                | López Hernández    |
    | Jardines Urbanos                       | Pablo                | Fernández Martín   |
    | Naturaleza en Casa                     | Lucía                | Pérez García       |
    | Plantas Decorativas                    | Manuel               | Gómez López        |
    +----------------------------------------+----------------------+--------------------+
    ```

2. Muestra el nombre de los clientes que hayan realizado pagos junto con el
nombre de sus representantes de ventas.

    ```sql
    select c.nombre, e.nombre as "Representante ventas"
    from cliente as c
    inner Join empleado as e on c.codigoEmpleadoRepVentas = e.codigo
    where c.codigo in(select c.codigo from pago);
    ```
    ```bash
    +----------------------------------------+----------------------+
    | nombre                                 | Representante ventas |
    +----------------------------------------+----------------------+
    | Jardinería Verde                       | Luis                 |
    | Jardines Modernos                      | Luis                 |
    | Plantas Vivas                          | Luis                 |
    | Flores y Plantas S.A.                  | Elena                |
    | Analista de MarketingJardín del Edén   | Elena                |
    | Flores Elegantes                       | Elena                |
    | Flores y Más                           | Elena                |
    | Herramientas de Jardín                 | Pablo                |
    | Plantas Exóticas                       | Pablo                |
    | Jardines del Sur                       | Pablo                |
    | Jardines Urbanos                       | Pablo                |
    | Verde y Más                            | Lucía                |
    | Plantas Frescas                        | Lucía                |
    | Naturaleza en Casa                     | Lucía                |
    | Jardín en Casa                         | Manuel               |
    | Jardín Feliz                           | Manuel               |
    | Plantas Decorativas                    | Manuel               |
    +----------------------------------------+----------------------+
    ```

3. Muestra el nombre de los clientes que no hayan realizado pagos junto con
el nombre de sus representantes de ventas.

    ```sql
    select cli.nombre as cliente, emp.nombre as "Representante ventas"
    from cliente as cli
    inner join empleado as emp on cli.codigoEmpleadoRepVentas = emp.codigo
    where cli.codigo not in(select codigocliente from pago);
    ```
    ```bash
    +-------------------+----------------------+
    | cliente           | Representante ventas |
    +-------------------+----------------------+
    | Plantas Exóticas  | Pablo                |
    +-------------------+----------------------+
    ```


4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
representantes junto con la ciudad de la oficina a la que pertenece el
representante.

    ```sql
    select cli.nombre, emp.nombre as "Representante ventas", city.nombre as "Ubicacion OFICINA"
    from cliente as cli
    inner Join empleado as emp on cli.codigoEmpleadoRepVentas = emp.codigo
    inner Join oficina as ofi on ofi.codigo = emp.codigoOficina
    inner join ciudad as city on city.idciudad=ofi.idciudad
    where cli.codigo in(select codigocliente from pago);
    ```
    ```bash
    +----------------------------------------+----------------------+-------------------+
    | nombre                                 | Representante ventas | Ubicacion OFICINA |
    +----------------------------------------+----------------------+-------------------+
    | Jardines Urbanos                       | Pablo                | Tokio             |
    | Jardines del Sur                       | Pablo                | Tokio             |
    | Herramientas de Jardín                 | Pablo                | Tokio             |
    | Naturaleza en Casa                     | Lucía                | Los Ángeles       |
    | Plantas Frescas                        | Lucía                | Los Ángeles       |
    | Verde y Más                            | Lucía                | Los Ángeles       |
    | Plantas Decorativas                    | Manuel               | Shanghái          |
    | Jardín Feliz                           | Manuel               | Shanghái          |
    | Jardín en Casa                         | Manuel               | Shanghái          |
    | Flores y Más                           | Elena                | Nápoles           |
    | Flores Elegantes                       | Elena                | Nápoles           |
    | Analista de MarketingJardín del Edén   | Elena                | Nápoles           |
    | Flores y Plantas S.A.                  | Elena                | Nápoles           |
    +----------------------------------------+----------------------+-------------------+
    ```

5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

    ```sql
    select cli.nombre, emp.nombre as "Representante ventas", city.nombre as "Ubicacion OFICINA"
    from cliente as cli
    inner Join empleado as emp on cli.codigoEmpleadoRepVentas = emp.codigo
    inner Join oficina as ofi on ofi.codigo = emp.codigoOficina
    inner join ciudad as city on city.idciudad=ofi.idciudad
    where cli.codigo not in(select codigocliente from pago);
    ```
    ```bash
    +-------------------+----------------------+-------------------+
    | nombre            | Representante ventas | Ubicacion OFICINA |
    +-------------------+----------------------+-------------------+
    | Plantas Exóticas  | Pablo                | Tokio             |
    +-------------------+----------------------+-------------------+
        
    ```
6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
    
    ```sql

    ```

7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

    ```sql
    select cli.nombre, emp.nombre as "Representante ventas", city.nombre as "Ubicacion OFICINA"
    from cliente as cli
    inner Join empleado as emp on cli.codigoEmpleadoRepVentas = emp.codigo
    inner Join oficina as ofi on ofi.codigo = emp.codigoOficina
    inner join ciudad as city on city.idciudad=ofi.idciudad;
    ```
    ```bash
    +----------------------------------------+----------------------+-------------------+
    | nombre                                 | Representante ventas | Ubicacion OFICINA |
    +----------------------------------------+----------------------+-------------------+
    | Flores y Plantas S.A.                  | Elena                | Nápoles           |
    | Analista de MarketingJardín del Edén   | Elena                | Nápoles           |
    | Flores Elegantes                       | Elena                | Nápoles           |
    | Flores y Más                           | Elena                | Nápoles           |
    | Herramientas de Jardín                 | Pablo                | Tokio             |
    | Plantas Exóticas                       | Pablo                | Tokio             |
    | Jardines del Sur                       | Pablo                | Tokio             |
    | Jardines Urbanos                       | Pablo                | Tokio             |
    | Verde y Más                            | Lucía                | Los Ángeles       |
    | Plantas Frescas                        | Lucía                | Los Ángeles       |
    | Naturaleza en Casa                     | Lucía                | Los Ángeles       |
    | Jardín en Casa                         | Manuel               | Shanghái          |
    | Jardín Feliz                           | Manuel               | Shanghái          |
    | Plantas Decorativas                    | Manuel               | Shanghái          |
    +----------------------------------------+----------------------+-------------------+
    ```

8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
    ```sql
    select emp.nombre as empleado, jf.nombre as jefe
    from empleado as emp
    inner join empleado as jf on emp.codigoJefe=jf.codigo;
    ```
    ```bash
    +----------+--------+
    | empleado | jefe   |
    +----------+--------+
    | María    | Juan   |
    | Pedro    | María  |
    | Ana      | María  |
    | Luis     | Pedro  |
    | Elena    | Pedro  |
    | Pablo    | Pedro  |
    | Lucía    | Pedro  |
    | Manuel   | Pedro  |
    +----------+--------+
    ```
9. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

    ```sql
    select emp.nombre as empleado,jf.nombre as jefe,jf2.nombre as jefedelJefe
    from empleado as emp
    inner join empleado as jf on emp.codigoJefe=jf.codigo
    inner join empleado as jf2 on jf.codigoJefe=jf2.codigo;
    ```
    ```bash
    +----------+--------+-------------+
    | empleado | jefe   | jefedelJefe |
    +----------+--------+-------------+
    | Pedro    | María  | Juan        |
    | Ana      | María  | Juan        |
    | Luis     | Pedro  | María       |
    | Elena    | Pedro  | María       |
    | Pablo    | Pedro  | María       |
    | Lucía    | Pedro  | María       |
    | Manuel   | Pedro  | María       |
    +----------+--------+-------------+
    ```

10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
    ```sql
    select cli.nombre
    from cliente as cli
    inner join pedido as pe on pe.idCliente=cli.codigo
    inner join estadoPedido as est on  est.idestado=pe.idEstado
    where pe.fechaEntrega > pe.fechaEsperada and est.estado="Entregado";
    ```
    ```bash
    +----------------------------------------+
    | nombre                                 |
    +----------------------------------------+
    | Jardinería Verde                       |
    | Analista de MarketingJardín del Edén   |
    +----------------------------------------+
    ```
11. Devuelve un listado de las diferentes gamas de producto que ha comprado
cada cliente.

    ```sql 
    select cli.nombre, gp.gama, count(gp.gama) as "Numero de productos"
    from cliente as cli
    INNER JOIN pedido as pe on pe.idCliente = cli.codigo
    inner join detallepedido as dt on dt.codigoPedido = pe.codigo
    inner join producto as pro on pro.codigo = dt.codigoProducto
    inner join gamaproducto as gp on gp.gama = pro.gama
    group by cli.nombre, gp.gama
    order by cli.nombre;
    ```
    ```bash 
    +----------------------------------------+--------------+---------------------+
    | nombre                                 | gama         | Numero de productos |
    +----------------------------------------+--------------+---------------------+
    | Analista de MarketingJardín del Edén   | Frutales     |                   1 |
    | Analista de MarketingJardín del Edén   | Herbáceas    |                   1 |
    | Flores y Plantas S.A.                  | Frutales     |                   1 |
    | Flores y Plantas S.A.                  | Herbáceas    |                   1 |
    | Herramientas de Jardín                 | Herramientas |                   1 |
    | Herramientas de Jardín                 | Ornamentales |                   1 |
    | Jardín en Casa                         | Frutales     |                   1 |
    | Jardín en Casa                         | Herbáceas    |                   1 |
    | Jardinería Verde                       | Herramientas |                   1 |
    | Jardinería Verde                       | Ornamentales |                   1 |
    | Verde y Más                            | Herramientas |                   1 |
    | Verde y Más                            | Ornamentales |                   1 |
    +----------------------------------------+--------------+---------------------+
    ```

## Consultas multitabla (Composición externa)

1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

    ```sql
    select cli.nombre as cliente
    from cliente as cli
    left join pago as pa on pa.codigocliente=cli.codigo
    where pa.codigocliente is null;
    ```
    ```bash
    +-------------------+
    | cliente           |
    +-------------------+
    | Plantas Exóticas  |
    +-------------------+
    ```
2. Es la misma consulta

3. Devuelve un listado que muestre los clientes que no han realizado ningúnpago y los que no han realizado ningún pedido.

    ```sql
    select cliente.nombre as cliente
    from cliente 
    left join pago on cliente.codigo = pago.codigocliente 
    left join pedido ON cliente.codigo = pedido.idCliente 
    where pago.idTransaccion is null or pedido.codigo is null;
    ```
    ```bash
    +-------------------+
    | cliente           |
    +-------------------+
    | Plantas Exóticas  |
    | Flores y Más      |
    +-------------------+
    ```
4. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
    ```sql
    select empleado.codigo, empleado.nombre as empleado,empleado.apellido1,empleado.apellido2
    from empleado 
    left join oficina on empleado.codigoOficina = oficina.codigo 
    where oficina.codigo is null;
    ```
    ```bash
    +--------+----------+-----------+-----------+
    | codigo | empleado | apellido1 | apellido2 |
    +--------+----------+-----------+-----------+
    |      5 | Luis     | Sánchez   | Díaz      |
    +--------+----------+-----------+-----------+
    ```
5. Devuelve un listado que muestre solamente los empleados que no tienen un
cliente asociado.
    ```sql
    select empleado.*
    from empleado
    left join cliente on empleado.codigo  = cliente.codigoEmpleadoRepVentas  
    where cliente.codigoEmpleadoRepVentas is null;
    ```
    ```bash
    +--------+--------+------------+------------+-----------+-----------------------------+---------------+------------+-----------------------+
    | codigo | nombre | apellido1  | apellido2  | extension | email                       | codigoOficina | codigoJefe | puesto                |
    +--------+--------+------------+------------+-----------+-----------------------------+---------------+------------+-----------------------+
    |      1 | Juan   | García     | López      | 1234      | juan.garcia@example.com     | OFI001        |       NULL | Director General      |
    |      2 | María  | Martínez   | Fernández  | 2345      | maria.martinez@example.com  | OFI002        |          1 | Subdirector Marketing |
    |      3 | Pedro  | Rodríguez  | Gómez      | 3456      | pedro.rodriguez@example.com | OFI003        |          2 | Subdirector Ventas    |
    |      4 | Ana    | González   | Pérez      | 4567      | ana.gonzalez@example.com    | OFI004        |          2 | Secretaria            |
    +--------+--------+------------+------------+-----------+-----------------------------+---------------+------------+-----------------------+
    ```
6. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.
    ```sql
    select empleado.puesto,empleado.nombre,empleado.apellido1,empleado.apellido2, oficina.*
    from empleado
    left join cliente on empleado.codigo  = cliente.codigoEmpleadoRepVentas 
    left join oficina on empleado.codigoOficina  = oficina.codigo 
    where cliente.codigoEmpleadoRepVentas is null;    
    ```
    ```bash
    +-----------------------+--------+------------+------------+--------+----------+-------------------+-----------------+
    | puesto                | nombre | apellido1  | apellido2  | codigo | idCiudad | telefono          | nombre          |
    +-----------------------+--------+------------+------------+--------+----------+-------------------+-----------------+
    | Director General      | Juan   | García     | López      | OFI001 | MAD      | +34 91 123 4567   | Oficina Central |
    | Subdirector Marketing | María  | Martínez   | Fernández  | OFI002 | BCN      | +33 1 23 45 67 89 | Oficina París   |
    | Subdirector Ventas    | Pedro  | Rodríguez  | Gómez      | OFI003 | VAL      | +44 20 1234 5678  | Oficina Londres |
    | Secretaria            | Ana    | González   | Pérez      | OFI004 | TOK      | +49 30 1234567    | Oficina Berlín  |
    +-----------------------+--------+------------+------------+--------+----------+-------------------+-----------------+
    ```
7. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

    ```sql
    select distinct(empleado.codigo), empleado.nombre, empleado.codigoOficina, cliente.codigoEmpleadoRepVentas
    from empleado
    left join cliente on empleado.codigo  = cliente.codigoEmpleadoRepVentas  
    where cliente.codigoEmpleadoRepVentas is null or empleado.codigoOficina is null;
    ```
    ```bash
    +--------+--------+---------------+-------------------------+
    | codigo | nombre | codigoOficina | codigoEmpleadoRepVentas |
    +--------+--------+---------------+-------------------------+
    |      1 | Juan   | OFI001        |                    NULL |
    |      2 | María  | OFI002        |                    NULL |
    |      3 | Pedro  | OFI003        |                    NULL |
    |      4 | Ana    | OFI004        |                    NULL |
    |      5 | Luis   | NULL          |                       5 |
    +--------+--------+---------------+-------------------------+
    ```
8. Devuelve un listado de los productos que nunca han aparecido en un pedido.

    ```sql
    select producto.nombre, detallepedido.codigoProducto
    from producto
    left join detallepedido on producto.codigo = detallepedido.codigoProducto 
    where detallepedido.codigoPedido is null;
    ```
    ```bash
        +------------------+----------------+
    | nombre           | codigoProducto |
    +------------------+----------------+
    | Cactus mixto     | NULL           |
    | Pala de jardín   | NULL           |
    | Naranjo Valencia | NULL           |
    | Romero           | NULL           |
    | Rosales mixtos   | NULL           |
    | Tijeras de podar | NULL           |
    | Limón Eureka     | NULL           |
    | Menta            | NULL           |
    +------------------+----------------+
    ```
9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

    ```sql
    select producto.nombre, producto.descripcion, gamaproducto.imagen
    from  producto
    left join detallepedido on producto.codigo = detallepedido.codigoProducto 
    left join gamaproducto on producto.gama = gamaproducto.gama
    where detallepedido.codigoPedido is null;
    ```
    ```bash
    +------------------+-------------------------------------------------------------+------------------+
    | nombre           | descripcion                                                 | imagen           |
    +------------------+-------------------------------------------------------------+------------------+
    | Cactus mixto     | Colección de cactus en variedad de formas y tamaños.        | ornamentales.jpg |
    | Pala de jardín   | Pala de jardín con mango ergonómico de madera.              | herramientas.jpg |
    | Naranjo Valencia | Árbol frutal de naranjas Valencia para huertos y jardines.  | frutales.jpg     |
    | Romero           | Planta aromática de romero para condimentar platos.         | herbaceas.jpg    |
    | Rosales mixtos   | Colección de rosales en variedad de colores y fragancias.   | ornamentales.jpg |
    | Tijeras de podar | Tijeras de podar profesionales con hoja de acero.           | herramientas.jpg |
    | Limón Eureka     | Árbol frutal de limones Eureka para huertos y jardines.     | frutales.jpg     |
    | Menta            | Planta aromática de menta para infusiones y recetas.        | herbaceas.jpg    |
    +------------------+-------------------------------------------------------------+------------------+
    ```

10. Devuelve las oficinas donde no trabajan ninguno de los empleados que
hayan sido los representantes de ventas de algún cliente que haya realizado
la compra de algún producto de la gama Frutales.

    ```sql
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
    ```
    ```bash
    +--------+----------+-------------------+---------------------+
    | codigo | idCiudad | telefono          | nombre              |
    +--------+----------+-------------------+---------------------+
    | OFI001 | MAD      | +34 91 123 4567   | Oficina Central     |
    | OFI002 | BCN      | +33 1 23 45 67 89 | Oficina París       |
    | OFI003 | VAL      | +44 20 1234 5678  | Oficina Londres     |
    | OFI004 | TOK      | +49 30 1234567    | Oficina Berlín      |
    | OFI005 | OSA      | +44 161 123 4567  | Oficina Manchester  |
    | OFI007 | TOK      | +32 2 123 45 67   | Oficina Tokio       |
    | OFI008 | LA       | +43 1 123 4567    | Oficina Los Angeles |
    | OFI010 | MAR      | +45 33 12 34 56   | Oficina Marsella    |
    | OFI012 | LYO      | +33 4 56 78 90 12 | Oficina Lyon        |
    | OFI013 | MIL      | +39 02 123 4567   | Oficina Milán       |
    | OFI014 | BCN      | +32 2 987 65 43   | Oficina Barcelona   |
    | OFI015 | BRI      | +43 1 987 6543    | Oficina Brishbane   |
    | OFI016 | MAD      | +31 20 123 4567   | Oficina Madrid 2    |
    | OFI017 | DU       | 41 44 123 45 67   | Oficina Düsseldorf  |
    | OFI018 | BJ       | +48 22 123 45 67  | Oficina Pekin       |
    +--------+----------+-------------------+---------------------+
    ```

11. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

    ```sql
    select cliente.nombre as cliente from cliente 
    left join pago on cliente.codigo = pago.codigocliente 
    left join pedido on cliente.codigo = pedido.idCliente 
    where pedido.idCliente = cliente.codigo and pago.idTransaccion is null;
    ```
    ```bash
    +-------------------+
    | cliente           |
    +-------------------+
    | Plantas Exóticas  |
    +-------------------+
    ```

12. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

    ```sql
    select empleado.*, jefe.nombre as nombre_jefe
    from empleado
    left join empleado as jefe on empleado.codigoJefe = jefe.codigo
    left join cliente on empleado.codigo  = cliente.codigoEmpleadoRepVentas
    where cliente.codigoEmpleadoRepVentas is null;
    ```
    ```bash
    +--------+--------+------------+------------+-----------+-----------------------------+---------------+------------+-----------------------+-------------+
    | codigo | nombre | apellido1  | apellido2  | extension | email                       | codigoOficina | codigoJefe | puesto                | nombre_jefe |
    +--------+--------+------------+------------+-----------+-----------------------------+---------------+------------+-----------------------+-------------+
    |      1 | Juan   | García     | López      | 1234      | juan.garcia@example.com     | OFI001        |       NULL | Director General      | NULL        |
    |      2 | María  | Martínez   | Fernández  | 2345      | maria.martinez@example.com  | OFI002        |          1 | Subdirector Marketing | Juan        |
    |      3 | Pedro  | Rodríguez  | Gómez      | 3456      | pedro.rodriguez@example.com | OFI003        |          2 | Subdirector Ventas    | María       |
    |      4 | Ana    | González   | Pérez      | 4567      | ana.gonzalez@example.com    | OFI004        |          2 | Secretaria            | María       |
    +--------+--------+------------+------------+-----------+-----------------------------+---------------+------------+-----------------------+-------------+
    ```

## Consultas resumen

1. ¿Cuántos empleados hay en la compañía?

    ```sql
    select count(emp.codigo) as "Cantidad Empleados"
    from empleado as emp;
    ```
    ```bash
    +--------------------+
    | Cantidad Empleados |
    +--------------------+
    |                  9 |
    +--------------------+
    ```

2. ¿Cuántos clientes tiene cada país?

    ```sql
    select pa.nombre, count(cli.codigo) as "Cantidad Clientes por Pais"
    from cliente as cli
    inner join ciudad as city on city.idCiudad=cli.idCiudad
    inner join Departamento as dept on dept.idDepartamento=city.idRegion
    inner join pais as pa on pa.idPais= dept.idPais
    group by pa.nombre;
    ```
    ```bash
    +----------------+----------------------------+
    | nombre         | Cantidad Clientes por Pais |
    +----------------+----------------------------+
    | España         |                          8 |
    | Australia      |                          2 |
    | México         |                          1 |
    | Francia        |                          1 |
    | Italia         |                          2 |
    | Estados Unidos |                          1 |
    | Japón          |                          1 |
    | Alemania       |                          1 |
    +----------------+----------------------------+
    ```

3. ¿Cuál fue el pago medio en 2009?

    ```sql
    select avg(total) as "Promedio Pago 2009"
    from pago
    where year(fechaPago)="2009";
    ```
    ```bash
    +--------------------+
    | Promedio Pago 2009 |
    +--------------------+
    |         225.000000 |
    +--------------------+
    ```

4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
    ```sql
    select est.estado, count(pe.codigo) as "Cantidad"
    from pedido as pe
    inner join estadoPedido as est on est.idEstado=pe.idEstado
    group by est.estado;
    ```
    ```bash
    +-------------------+----------+
    | estado            | Cantidad |
    +-------------------+----------+
    | Procesado         |        1 |
    | Enviado           |        1 |
    | Entregado         |        2 |
    | Listo para enviar |        1 |
    | Reembolsado       |        1 |
    | En revisión       |        1 |
    | En espera de pago |        1 |
    | Pagado            |        1 |
    | En almacén        |        1 |
    | En tránsito       |        1 |
    | Rechazado         |        1 |
    | Aceptado          |        1 |
    | Completado        |        1 |
    | No disponible     |        1 |
    | Faltante          |        1 |
    +-------------------+----------+
    ```
5. Calcula el precio de venta del producto más caro y más barato en una
misma consulta.

    ```sql
    select codigo, nombre, precioventa
    from producto
    where precioventa in ( select max(precioventa) from producto) or precioventa in (select min(precioventa) 
    from producto)
    order by precioventa desc; 
    ```
    ```bash
    +---------+-------------------------+-------------+
    | codigo  | nombre                  | precioventa |
    +---------+-------------------------+-------------+
    | PROD018 | Cortacésped eléctrico   |       95.00 |
    | PROD005 | Tulipán mixto           |        3.50 |
    +---------+-------------------------+-------------+
    ```


6. Calcula el número de clientes que tiene la empresa.

    ```sql
    select count(codigo) as "Cantidad Clientes"
    from cliente;
    ```
    ```bash
    +-------------------+
    | Cantidad Clientes |
    +-------------------+
    |                17 |
    +-------------------+
    ```
7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

    ```sql
    select city.nombre , count(cli.codigo) as "Cantidad"
    from cliente as cli
    inner join ciudad as city on city.idCiudad=cli.idCiudad
    group by city.nombre
    having city.nombre="Madrid";
    ```
    ```bash
    +--------+----------+
    | nombre | Cantidad |
    +--------+----------+
    | Madrid |        3 |
    +--------+----------+
    ```

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan
por M?
    ```sql
    select city.nombre , count(cli.codigo) as "Cantidad"
    from cliente as cli
    inner join ciudad as city on city.idCiudad=cli.idCiudad
    group by city.nombre
    having city.nombre like "M%";
    ```
    ```bash
    +-----------+----------+
    | nombre    | Cantidad |
    +-----------+----------+
    | Madrid    |        3 |
    | Melbourne |        1 |
    | Milán     |        2 |
    +-----------+----------+
    ```

9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
    ```sql
    select emp.nombre , count(cli.codigo)
    from empleado as emp
    inner join cliente as cli on cli.codigoEmpleadoRepVentas=emp.codigo
    group by emp.nombre;
    ```
    ```bash
    +--------+-------------------+
    | nombre | count(cli.codigo) |
    +--------+-------------------+
    | Luis   |                 3 |
    | Elena  |                 4 |
    | Pablo  |                 4 |
    | Lucía  |                 3 |
    | Manuel |                 3 |
    +--------+-------------------+
    ```


10. Calcula el número de clientes que no tiene asignado representante de ventas.

    ```sql
    select count(cli.codigo) as "Cantidad"
    from empleado as emp
    inner join cliente as cli on cli.codigoEmpleadoRepVentas=emp.codigo
    where cli.codigoEmpleadoRepVentas is null;
    ```
    ```bash
    +----------+
    | Cantidad |
    +----------+
    |        0 |
    +----------+
    ```

11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
    ```sql
    select cli.nombre, cli.nombreContacto,cli.apellidoContacto, min(pa.fechapago) as "Primer Pago",max(pa.fechapago) as "Ultimo Pago"
    from cliente as cli
    inner join pago as pa on pa.codigocliente= cli.codigo
    group by cli.nombre, cli.nombreContacto,cli.apellidoContacto;
    ```
    ```bash
    +----------------------------------------+----------------+------------------+-------------+-------------+
    | nombre                                 | nombreContacto | apellidoContacto | Primer Pago | Ultimo Pago |
    +----------------------------------------+----------------+------------------+-------------+-------------+
    | Jardinería Verde                       | María          | Fernández        | 2006-05-01  | 2006-05-01  |
    | Flores y Plantas S.A.                  | Pedro          | Gómez            | 2007-05-02  | 2007-05-02  |
    | Herramientas de Jardín                 | Luisa          | Hernández        | 2008-05-03  | 2008-05-03  |
    | Analista de MarketingJardín del Edén   | Eva            | García           | 2008-05-04  | 2008-05-04  |
    | Verde y Más                            | Ana            | Hernández        | 2010-05-09  | 2010-05-09  |
    | Jardín en Casa                         | José           | Martín           | 2009-05-10  | 2009-05-10  |
    | Jardines Modernos                      | Marta          | Gómez            | 2008-05-11  | 2008-05-11  |
    | Flores Elegantes                       | Carlos         | García           | 2008-05-12  | 2008-05-12  |
    | Jardines del Sur                       | Isabel         | Hernández        | 2006-05-13  | 2006-05-13  |
    | Plantas Frescas                        | Juan           | Martínez         | 2011-05-14  | 2011-05-14  |
    | Jardín Feliz                           | Laura          | Sánchez          | 2010-05-15  | 2010-05-15  |
    | Plantas Vivas                          | Pablo          | Gómez            | 2009-05-16  | 2009-05-16  |
    | Flores y Más                           | Cristina       | Pérez            | 2008-05-17  | 2008-05-17  |
    | Jardines Urbanos                       | Javier         | Hernández        | 2007-05-18  | 2007-05-18  |
    | Naturaleza en Casa                     | María          | Martínez         | 2012-05-19  | 2012-05-19  |
    | Plantas Decorativas                    | Antonio        | García           | 2011-05-20  | 2011-05-20  |
    +----------------------------------------+----------------+------------------+-------------+-------------+
    ```

12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.

    ```sql
    select pe.codigo,count(pro.codigo) as "Cantidad"
    from pedido as pe 
    inner join detallepedido as dt on dt.codigopedido= pe.codigo
    inner join producto as pro on pro.codigo= dt.codigoProducto
    group by pe.codigo;
    ```
    ```bash
    +--------+----------+
    | codigo | Cantidad |
    +--------+----------+
    |   3001 |        2 |
    |   3002 |        2 |
    |   3003 |        2 |
    |   3004 |        2 |
    |   3009 |        2 |
    |   3010 |        2 |
    +--------+----------+
    ```

13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.

    ```sql
    select pe.codigo,count(pro.codigo) as "Cantidad", sum(dt.precioUnidad*dt.cantidad) as total
    from pedido as pe 
    inner join detallepedido as dt on dt.codigopedido= pe.codigo
    inner join producto as pro on pro.codigo= dt.codigoProducto
    group by pe.codigo;
    ```
    ```bash
    +--------+----------+---------+
    | codigo | Cantidad | total   |
    +--------+----------+---------+
    |   3001 |        2 |  625.00 |
    |   3002 |        2 |  850.00 |
    |   3003 |        2 |  820.00 |
    |   3004 |        2 |  775.00 |
    |   3009 |        2 | 1115.00 |
    |   3010 |        2 | 2260.00 |
    +--------+----------+---------+
    ```
14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.

    ```sql
    select pro.nombre, dt.cantidad
    from pedido as pe 
    inner join detallepedido as dt on dt.codigopedido= pe.codigo
    inner join producto as pro on pro.codigo= dt.codigoProducto
    order by dt.cantidad desc
    limit 20;
    ```
    ```bash
    +-------------------------+----------+
    | nombre                  | cantidad |
    +-------------------------+----------+
    | Lavanda                 |       25 |
    | Manzano Gala            |       20 |
    | Tomate Cherry           |       15 |
    | Rastrillo de jardín     |       12 |
    | Albahaca                |       12 |
    | Rosa roja               |       10 |
    | Campanilla azul         |       10 |
    | Pera Conference         |       10 |
    | Tulipán mixto           |        8 |
    | Cortacésped eléctrico   |        7 |
    | Podadora profesional    |        5 |
    | Girasol                 |        5 |
    +-------------------------+----------+
    ```
15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.

    ```sql
    select  sum(dt.precioUnidad*dt.cantidad) as "Base imponible", sum((dt.precioUnidad*dt.cantidad)*0.21) as  "Iva", sum((dt.precioUnidad*dt.cantidad)+(dt.precioUnidad*dt.cantidad)*0.21) as total
    from pedido as pe 
    inner join detallepedido as dt on dt.codigopedido= pe.codigo
    inner join producto as pro on pro.codigo= dt.codigoProducto;
    ```
    ```bash
    +----------------+-----------+-----------+
    | Base imponible | Iva       | total     |
    +----------------+-----------+-----------+
    |        6445.00 | 1353.4500 | 7798.4500 |
    +----------------+-----------+-----------+
    ```
16. La misma información que en la pregunta anterior, pero agrupada por código de producto.
    ```sql
    select dt.codigoProducto,sum(dt.precioUnidad*dt.cantidad) as "Base imponible", sum((dt.precioUnidad*dt.cantidad)*0.21) as  "Iva", sum((dt.precioUnidad*dt.cantidad)+(dt.precioUnidad*dt.cantidad)*0.21) as total
    from pedido as pe 
    inner join detallepedido as dt on dt.codigopedido= pe.codigo
    inner join producto as pro on pro.codigo= dt.codigoProducto
    group by dt.codigoProducto;
    ```
    ```bash
    +----------------+----------------+----------+-----------+
    | codigoProducto | Base imponible | Iva      | total     |
    +----------------+----------------+----------+-----------+
    | PROD001        |         500.00 | 105.0000 |  605.0000 |
    | PROD002        |         125.00 |  26.2500 |  151.2500 |
    | PROD003        |         450.00 |  94.5000 |  544.5000 |
    | PROD004        |         400.00 |  84.0000 |  484.0000 |
    | PROD005        |         280.00 |  58.8000 |  338.8000 |
    | PROD006        |         540.00 | 113.4000 |  653.4000 |
    | PROD007        |         400.00 |  84.0000 |  484.0000 |
    | PROD008        |         375.00 |  78.7500 |  453.7500 |
    | PROD017        |         450.00 |  94.5000 |  544.5000 |
    | PROD018        |         665.00 | 139.6500 |  804.6500 |
    | PROD019        |        1000.00 | 210.0000 | 1210.0000 |
    | PROD020        |        1260.00 | 264.6000 | 1524.6000 |
    +----------------+----------------+----------+-----------+
    ```
17. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.

```sql
select dt.codigoProducto,sum(dt.precioUnidad*dt.cantidad) as "Base imponible", sum((dt.precioUnidad*dt.cantidad)*0.21) as  "Iva", sum((dt.precioUnidad*dt.cantidad)+(dt.precioUnidad*dt.cantidad)*0.21) as total
from pedido as pe 
inner join detallepedido as dt on dt.codigopedido= pe.codigo
inner join producto as pro on pro.codigo= dt.codigoProducto
group by dt.codigoProducto
having dt.codigoproducto like "OR%";
```
```bash
adicionar valor;
```

18. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).

    ```sql
    select dt.codigoProducto, pro.nombre, dt.cantidad, sum(dt.precioUnidad*dt.cantidad) as "Base imponible", sum((dt.precioUnidad*dt.cantidad)+(dt.precioUnidad*dt.cantidad)*0.21) as total
    from pedido as pe 
    inner join detallepedido as dt on dt.codigopedido= pe.codigo
    inner join producto as pro on pro.codigo= dt.codigoProducto
    group by dt.codigoProducto, pro.nombre, dt.cantidad
    having total>3000;
    ```
    ```bash
    adicionar valor
    ```
19. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.

    ```sql
    select year(fechaPago), sum(total) as "Total Pagos"
    from pago
    group by year(fechaPago);
    ```
    ```bash
    +-----------------+-------------+
    | year(fechaPago) | Total Pagos |
    +-----------------+-------------+
    |            2006 |      330.00 |
    |            2007 |      410.00 |
    |            2008 |     1010.00 |
    |            2010 |      490.00 |
    |            2009 |      450.00 |
    |            2011 |      480.00 |
    |            2012 |      240.00 |
    +-----------------+-------------+
    ```

## Subconsultas Con operadores básicos de comparación

1. Devuelve el nombre del cliente con mayor límite de crédito.

    ```sql
    select cli.nombre, limiteCredito
    from cliente as cli
    where limiteCredito = (select max(limiteCredito) from cliente);
    ```
    ```bash
    +---------------------+---------------+
    | nombre              | limiteCredito |
    +---------------------+---------------+
    | Jardín en Casa      |      26000.00 |
    | Plantas Decorativas |      26000.00 |
    +---------------------+---------------+
    ```
2. Devuelve el nombre del producto que tenga el precio de venta más caro.

    ```sql
    select pro.nombre
    from producto as pro
    where precioVenta = (select max(precioVenta) from producto);
    ```
    ```bash
    +-------------------------+
    | nombre                  |
    +-------------------------+
    | Cortacésped eléctrico   |
    +-------------------------+
    ```

3. Devuelve el nombre del producto del que se han vendido más unidades.
(Tenga en cuenta que tendrá que calcular cuál es el número total de
unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)

    ```sql
    select pro.nombre,dt.codigoProducto,dt.cantidad
    from detallepedido as dt
    inner join producto as pro on pro.codigo= dt.codigoProducto
    order by dt.cantidad desc
    limit 1;
    ```
    ```bash
    +---------+----------------+----------+
    | nombre  | codigoProducto | cantidad |
    +---------+----------------+----------+
    | Lavanda | PROD008        |       25 |
    +---------+----------------+----------+
    ```

4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).

```sql
select codigo, nombre
from cliente as cli
where limiteCredito > (select total
from pago where codigocliente=cli.codigo);
```
```bash
+--------+----------------------------------------+
| codigo | nombre                                 |
+--------+----------------------------------------+
|   2001 | Jardinería Verde                       |
|   2002 | Flores y Plantas S.A.                  |
|   2003 | Herramientas de Jardín                 |
|   2004 | Analista de MarketingJardín del Edén   |
|   2009 | Verde y Más                            |
|   2010 | Jardín en Casa                         |
|   2011 | Jardines Modernos                      |
|   2012 | Flores Elegantes                       |
|   2013 | Jardines del Sur                       |
|   2014 | Plantas Frescas                        |
|   2015 | Jardín Feliz                           |
|   2016 | Plantas Vivas                          |
|   2017 | Flores y Más                           |
|   2018 | Jardines Urbanos                       |
|   2019 | Naturaleza en Casa                     |
|   2020 | Plantas Decorativas                    |
+--------+----------------------------------------+
```

5. Devuelve el producto que más unidades tiene en stock.

    ```sql
    select nombre, cantidadstock
    from producto
    where cantidadstock = (select max(cantidadstock) from producto);
    ```
    ```bash
    +----------------+---------------+
    | nombre         | cantidadstock |
    +----------------+---------------+
    | Tulipán mixto  |           200 |
    +----------------+---------------+
    ```
6. Devuelve el producto que menos unidades tiene en stock.

    ```sql
    select nombre, cantidadstock
    from producto
    where cantidadstock = (select min(cantidadstock) from producto);
    ```
    ```bash
    +------------------+---------------+
    | nombre           | cantidadstock |
    +------------------+---------------+
    | Naranjo Valencia |            15 |
    +------------------+---------------+
    ```

7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.
    ```sql
    select nombre,apellido1,apellido2, email
    from empleado
    where codigo= (select codigoJefe
    from empleado 
    where nombre = "Alberto" and apellido1="Soria" );
    ```
    ```bash
    agregar valor
    ```

## Subconsultas con ALL y ANY

8. Devuelve el nombre del cliente con mayor límite de crédito.

```sql
select codigo, nombre
from cliente as cli
where limiteCredito = any (select max(limiteCredito)
from cliente);
```
```bash
+--------+---------------------+
| codigo | nombre              |
+--------+---------------------+
|   2010 | Jardín en Casa      |
|   2020 | Plantas Decorativas |
+--------+---------------------+
```

9. Devuelve el nombre del producto que tenga el precio de venta más caro.

    ```sql
    select pro.nombre
    from producto as pro
    where precioVenta = any (select max(precioVenta) from producto);
    ```
    ```bash
    +-------------------------+
    | nombre                  |
    +-------------------------+
    | Cortacésped eléctrico   |
    +-------------------------+
    ```
10. Devuelve el producto que menos unidades tiene en stock.
    ```sql
    select nombre, cantidadstock
    from producto
    where cantidadstock = any(select min(cantidadstock) from producto);
    ```
    ```bash
    +------------------+---------------+
    | nombre           | cantidadstock |
    +------------------+---------------+
    | Naranjo Valencia |            15 |
    +------------------+---------------+
    ```

## Subconsultas con IN y NOT IN

11. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.

    ```sql
    select nombre, apellido1, puesto
    from empleado
    where codigo not in (select codigoEmpleadoRepVentas from cliente);
    ```
    ```bash 
    +--------+------------+-----------------------+
    | nombre | apellido1  | puesto                |
    +--------+------------+-----------------------+
    | Juan   | García     | Director General      |
    | María  | Martínez   | Subdirector Marketing |
    | Pedro  | Rodríguez  | Subdirector Ventas    |
    | Ana    | González   | Secretaria            |
    +--------+------------+-----------------------+
    ```

12. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pago.

    ```sql
    select nombre
    from cliente where codigo not in (select codigocliente
    from pago);
    ```
    ```bash
    +-------------------+
    | nombre            |
    +-------------------+
    | Plantas Exóticas  |
    +-------------------+
    ```
13. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

    ```sql
    select nombre
    from cliente where codigo in (select codigocliente
    from pago);
    ```
    ```bash
    +----------------------------------------+
    | nombre                                 |
    +----------------------------------------+
    | Jardinería Verde                       |
    | Flores y Plantas S.A.                  |
    | Herramientas de Jardín                 |
    | Analista de MarketingJardín del Edén   |
    | Verde y Más                            |
    | Jardín en Casa                         |
    | Jardines Modernos                      |
    | Flores Elegantes                       |
    | Jardines del Sur                       |
    | Plantas Frescas                        |
    | Jardín Feliz                           |
    | Plantas Vivas                          |
    | Flores y Más                           |
    | Jardines Urbanos                       |
    | Naturaleza en Casa                     |
    | Plantas Decorativas                    |
    +----------------------------------------+
    ```

14. Devuelve un listado de los productos que nunca han aparecido en un pedido.

    ```sql
    select nombre 
    from producto where codigo not in(select codigoProducto
    from detallepedido);
    ```
    ```bash
    +------------------+
    | nombre           |
    +------------------+
    | Cactus mixto     |
    | Pala de jardín   |
    | Naranjo Valencia |
    | Romero           |
    | Rosales mixtos   |
    | Tijeras de podar |
    | Limón Eureka     |
    | Menta            |
    +------------------+
    ```


15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
```sql
select codigoEmpleadoRepVentas
from cliente
where codigoEmpleadoRepVentas not in (select codigo
from empleado
where puesto="Representante Ventas");
```
```bash
insertar valor
```

16. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

    ```sql
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
        where producto.gama = 'Frutales');
    ```
    ```bash
    +--------+----------+-------------------+---------------------+
    | codigo | idCiudad | telefono          | nombre              |
    +--------+----------+-------------------+---------------------+
    | OFI001 | MAD      | +34 91 123 4567   | Oficina Central     |
    | OFI002 | BCN      | +33 1 23 45 67 89 | Oficina París       |
    | OFI003 | VAL      | +44 20 1234 5678  | Oficina Londres     |
    | OFI004 | TOK      | +49 30 1234567    | Oficina Berlín      |
    | OFI005 | OSA      | +44 161 123 4567  | Oficina Manchester  |
    | OFI007 | TOK      | +32 2 123 45 67   | Oficina Tokio       |
    | OFI008 | LA       | +43 1 123 4567    | Oficina Los Angeles |
    | OFI010 | MAR      | +45 33 12 34 56   | Oficina Marsella    |
    | OFI012 | LYO      | +33 4 56 78 90 12 | Oficina Lyon        |
    | OFI013 | MIL      | +39 02 123 4567   | Oficina Milán       |
    | OFI014 | BCN      | +32 2 987 65 43   | Oficina Barcelona   |
    | OFI015 | BRI      | +43 1 987 6543    | Oficina Brishbane   |
    | OFI016 | MAD      | +31 20 123 4567   | Oficina Madrid 2    |
    | OFI017 | DU       | 41 44 123 45 67   | Oficina Düsseldorf  |
    | OFI018 | BJ       | +48 22 123 45 67  | Oficina Pekin       |
    +--------+----------+-------------------+---------------------+
    ```

17. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

    ```sql
    select nombre
    from cliente
    where codigo in (select idcliente from pedido) and codigo not in(select codigocliente from pago);
    ```
    ```bash
    +-------------------+
    | nombre            |
    +-------------------+
    | Plantas Exóticas  |
    +-------------------+
    ```

## Subconsultas con EXISTS y NOT EXISTS

18. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

```sql
select nombre
from cliente as cli
where not exists(select codigocliente from pago where cli.codigo=codigocliente);
```
```bash
+-------------------+
| nombre            |
+-------------------+
| Plantas Exóticas  |
+-------------------+
```
19. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

    ```sql
    select nombre
    from cliente as cli
    where exists(select codigocliente from pago where cli.codigo=codigocliente);
    ```
    ```bash
    +----------------------------------------+
    | nombre                                 |
    +----------------------------------------+
    | Jardinería Verde                       |
    | Flores y Plantas S.A.                  |
    | Herramientas de Jardín                 |
    | Analista de MarketingJardín del Edén   |
    | Verde y Más                            |
    | Jardín en Casa                         |
    | Jardines Modernos                      |
    | Flores Elegantes                       |
    | Jardines del Sur                       |
    | Plantas Frescas                        |
    | Jardín Feliz                           |
    | Plantas Vivas                          |
    | Flores y Más                           |
    | Jardines Urbanos                       |
    | Naturaleza en Casa                     |
    | Plantas Decorativas                    |
    +----------------------------------------+
    ```

20. Devuelve un listado de los productos que nunca han aparecido en un pedido.

    ```sql
    select nombre
    from producto as pro
    where not exists (select codigoProducto from detallepedido where pro.codigo=codigoProducto);
    ```
    ```bash
    +------------------+
    | nombre           |
    +------------------+
    | Cactus mixto     |
    | Pala de jardín   |
    | Naranjo Valencia |
    | Romero           |
    | Rosales mixtos   |
    | Tijeras de podar |
    | Limón Eureka     |
    | Menta            |
    +------------------+
    ```

21. Devuelve un listado de los productos que han aparecido en un pedido alguna vez.

    ```sql
    select nombre
    from producto as pro
    where exists (select codigoProducto from detallepedido where pro.codigo=codigoProducto);
    ```
    ```bash
    +-------------------------+
    | nombre                  |
    +-------------------------+
    | Rosa roja               |
    | Podadora profesional    |
    | Tomate Cherry           |
    | Campanilla azul         |
    | Tulipán mixto           |
    | Rastrillo de jardín     |
    | Manzano Gala            |
    | Lavanda                 |
    | Girasol                 |
    | Cortacésped eléctrico   |
    | Pera Conference         |
    | Albahaca                |
    +-------------------------+
    ```

## Subconsultas correlacionadas
## Consultas variadas

1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.

    ```sql
    select c.nombre AS nombre_cliente,  (select  COUNT(p.codigo) AS numero_pedidos  from pedido as p where p.idcliente=c.codigo) as NumeroPedidos
    from cliente as c;
    ```
    ```bash
    +----------------------------------------+---------------+
    | nombre_cliente                         | NumeroPedidos |
    +----------------------------------------+---------------+
    | Jardinería Verde                       |             1 |
    | Flores y Plantas S.A.                  |             1 |
    | Herramientas de Jardín                 |             1 |
    | Analista de MarketingJardín del Edén   |             1 |
    | Plantas Exóticas                       |             1 |
    | Verde y Más                            |             1 |
    | Jardín en Casa                         |             1 |
    | Jardines Modernos                      |             1 |
    | Flores Elegantes                       |             1 |
    | Jardines del Sur                       |             1 |
    | Plantas Frescas                        |             1 |
    | Jardín Feliz                           |             1 |
    | Plantas Vivas                          |             1 |
    | Flores y Más                           |             0 |
    | Jardines Urbanos                       |             1 |
    | Naturaleza en Casa                     |             1 |
    | Plantas Decorativas                    |             1 |
    +----------------------------------------+---------------+
    ```

2. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.

```sql
select cli.nombre ,(select sum(total) from pago as pa where pa.codigocliente=cli.codigo)
from cliente as cli;
```
```bash
+----------------------------------------+-----------------------------------------------------------------------+
| nombre                                 | (select sum(total) from pago as pa where pa.codigocliente=cli.codigo) |
+----------------------------------------+-----------------------------------------------------------------------+
| Jardinería Verde                       |                                                                150.00 |
| Flores y Plantas S.A.                  |                                                                200.00 |
| Herramientas de Jardín                 |                                                                180.00 |
| Analista de MarketingJardín del Edén   |                                                                220.00 |
| Plantas Exóticas                       |                                                                  NULL |
| Verde y Más                            |                                                                240.00 |
| Jardín en Casa                         |                                                                260.00 |
| Jardines Modernos                      |                                                                170.00 |
| Flores Elegantes                       |                                                                210.00 |
| Jardines del Sur                       |                                                                180.00 |
| Plantas Frescas                        |                                                                220.00 |
| Jardín Feliz                           |                                                                250.00 |
| Plantas Vivas                          |                                                                190.00 |
| Flores y Más                           |                                                                230.00 |
| Jardines Urbanos                       |                                                                210.00 |
| Naturaleza en Casa                     |                                                                240.00 |
| Plantas Decorativas                    |                                                                260.00 |
+----------------------------------------+-----------------------------------------------------------------------+
```
3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.

```sql
select distinct(cli.nombre) as cliente
from cliente as cli
where cli.codigo = (select pe.idcliente from pedido as pe where pe.idcliente=cli.codigo and year(pe.fechaPedido)="2008")
order by cli.nombre asc;
```
```bash
+-------------------------+
| cliente                 |
+-------------------------+
| Herramientas de Jardín  |
| Jardín en Casa          |
| Jardinería Verde        |
| Jardines del Sur        |
| Jardines Modernos       |
| Plantas Exóticas        |
+-------------------------+
```

4. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.

    ```sql
    select cli.nombre as cliente,emp.nombre as nombre_rep_ventas, emp.apellido1 as apellido_rep_ventas, ofi.telefono AS telefono_oficina
    from cliente as cli , empleado as emp, oficina as ofi
    where cli.codigoEmpleadoRepVentas=emp.codigo and
    emp.codigoOficina=ofi.codigo and not exists (select pa.codigocliente from pago as pa where pa.codigocliente=cli.codigo);
    ```
    ```bash
    +-------------------+-------------------+---------------------+------------------+
    | cliente           | nombre_rep_ventas | apellido_rep_ventas | telefono_oficina |
    +-------------------+-------------------+---------------------+------------------+
    | Plantas Exóticas  | Pablo             | Fernández           | +32 2 123 45 67  |
    +-------------------+-------------------+---------------------+------------------+
    ```

5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.

    ```sql
    SELECT c.nombre AS nombre_cliente, e.nombre AS nombre_rep_ventas, e.apellido1 AS apellido_rep_ventas, ci.nombre AS ciudad_oficina
    FROM cliente c
    JOIN empleado e ON c.codigoEmpleadoRepVentas = e.codigo
    JOIN oficina o ON e.codigoOficina = o.codigo
    JOIN ciudad ci ON o.idCiudad = ci.idCiudad;
    ```
    ```bash
    +----------------------------------------+-------------------+---------------------+----------------+
    | nombre_cliente                         | nombre_rep_ventas | apellido_rep_ventas | ciudad_oficina |
    +----------------------------------------+-------------------+---------------------+----------------+
    | Flores y Plantas S.A.                  | Elena             | López               | Nápoles        |
    | Analista de MarketingJardín del Edén   | Elena             | López               | Nápoles        |
    | Flores Elegantes                       | Elena             | López               | Nápoles        |
    | Flores y Más                           | Elena             | López               | Nápoles        |
    | Herramientas de Jardín                 | Pablo             | Fernández           | Tokio          |
    | Plantas Exóticas                       | Pablo             | Fernández           | Tokio          |
    | Jardines del Sur                       | Pablo             | Fernández           | Tokio          |
    | Jardines Urbanos                       | Pablo             | Fernández           | Tokio          |
    | Verde y Más                            | Lucía             | Pérez               | Los Ángeles    |
    | Plantas Frescas                        | Lucía             | Pérez               | Los Ángeles    |
    | Naturaleza en Casa                     | Lucía             | Pérez               | Los Ángeles    |
    | Jardín en Casa                         | Manuel            | Gómez               | Shanghái       |
    | Jardín Feliz                           | Manuel            | Gómez               | Shanghái       |
    | Plantas Decorativas                    | Manuel            | Gómez               | Shanghái       |
    +----------------------------------------+-------------------+---------------------+----------------+
    ```


6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

    ```sql
    SELECT e.nombre AS nombre_empleado, e.apellido1 AS apellido1_empleado, e.apellido2 AS apellido2_empleado, e.puesto, o.telefono AS telefono_oficina
    FROM empleado e
    JOIN oficina o ON e.codigoOficina = o.codigo
    LEFT JOIN cliente c ON e.codigo = c.codigoEmpleadoRepVentas
    WHERE c.codigoEmpleadoRepVentas IS NULL;
    ```
    ```bash
    +-----------------+--------------------+--------------------+-----------------------+-------------------+
    | nombre_empleado | apellido1_empleado | apellido2_empleado | puesto                | telefono_oficina  |
    +-----------------+--------------------+--------------------+-----------------------+-------------------+
    | Juan            | García             | López              | Director General      | +34 91 123 4567   |
    | María           | Martínez           | Fernández          | Subdirector Marketing | +33 1 23 45 67 89 |
    | Pedro           | Rodríguez          | Gómez              | Subdirector Ventas    | +44 20 1234 5678  |
    | Ana             | González           | Pérez              | Secretaria            | +49 30 1234567    |
    +-----------------+--------------------+--------------------+-----------------------+-------------------+
    ```

7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.

    ```sql
    SELECT ci.nombre AS ciudad, COUNT(e.codigo) AS numero_empleados
    FROM oficina o
    JOIN ciudad ci ON o.idCiudad = ci.idCiudad
    JOIN empleado e ON e.codigoOficina = o.codigo
    GROUP BY ci.nombre;
    ```
    ```bash
    +--------------+------------------+
    | ciudad       | numero_empleados |
    +--------------+------------------+
    | Madrid       |                1 |
    | Barcelona    |                1 |
    | Valencia     |                1 |
    | Tokio        |                2 |
    | Los Ángeles  |                1 |
    | Shanghái     |                1 |
    | Nápoles      |                1 |
    +--------------+------------------+
    ```



