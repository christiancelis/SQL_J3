
drop database  GardenDB;
 create database GardenDB;

 use GardenDB;


 create table pais(
    idPais varchar(10) primary key,
    nombre varchar(30) not null,
    poblacion decimal
 );



 create table Departamento(
    idDepartamento varchar(10) primary key,
    idPais varchar(10) not null,
    nombre varchar(30) not null,
    Foreign Key (idPais) REFERENCES pais(idPais)
 ); 


 create table ciudad(
    idCiudad varchar(10) primary key,
    idRegion varchar(10) not null,
    nombre varchar(30) not null,
    codigoPostal varchar(20) not null,
    Foreign Key (idRegion) REFERENCES Departamento(idDepartamento)
 );

create table gamaproducto(
    gama varchar(50) primary key,
    descripcion_texto text ,
    descripcion_html text,
    imagen varchar(256)
);

create table proveedor(
    idProveedor int primary key,
    nombre varchar(50) not null
);

create table producto(
    codigo varchar(15) primary key,
    nombre varchar(70) not null,
    dimensiones varchar(25),
    descripcion text,
    cantidadstock SMALLINT(6),
    precioventa decimal(15,2),
    precioproveedor decimal(15,2),
    gama varchar(50) not null,
    idProveedor int,
    Foreign Key (gama) REFERENCES gamaproducto(gama),
    Foreign Key (idProveedor) REFERENCES proveedor(idProveedor)
);

create table tipodireccion(
    idtipo int primary key,
    tipo varchar(50) not null
);

create table direccion(
    idDireccion varchar(20) primary key,
    direccion varchar(100) not null,
    idtipo int not null,
    Foreign Key (idtipo) REFERENCES tipodireccion(idtipo)
);



create table oficina(
    codigo varchar(10) PRIMARY KEY,
    idCiudad varchar(10) not null,
    telefono varchar(30), 
    nombre varchar(100) not null,   
    Foreign Key (idCiudad) REFERENCES ciudad(idCiudad)
);


create table direccionOficina(
    idDireccion varchar(20),
    idOficina varchar(10),
    PRIMARY KEY(idDireccion,idOficina),
    Foreign Key (idDireccion) REFERENCES direccion(idDireccion),
    Foreign Key (idOficina) REFERENCES oficina(codigo)
);


create table empleado(
    codigo int(11) primary key,
    nombre varchar(30) not null,
    apellido1 varchar(50) not null,
    apellido2 varchar(50),
    extension varchar(10),
    email varchar(100) unique not null,
    codigoOficina varchar(10),
    codigoJefe int(11),
    Foreign Key (codigoJefe) REFERENCES empleado(codigo),
    Foreign Key (codigoOficina) REFERENCES oficina(codigo),
    puesto varchar(50)
);


create table cliente(
    codigo int(11) PRIMARY key,
    nombre varchar(50) not null,
    nombreContacto varchar(30) not null,
    apellidoContacto varchar(30),
    telefono varchar(30),
    fax varchar(30),
    idCiudad varchar(10) not null,
    limiteCredito decimal(15,2),
    codigoEmpleadoRepVentas int(11),
    Foreign Key (idCiudad) REFERENCES ciudad(idCiudad),
    Foreign Key (codigoEmpleadoRepVentas) REFERENCES empleado(codigo)
);

create table direccioncliente(
     idDireccion varchar(20),
     idCliente int(11),
     primary key(idDireccion,idCliente),
     Foreign Key (idDireccion) REFERENCES direccion(idDireccion),
     Foreign Key (idCliente) REFERENCES cliente(codigo)
);

create table pago(
    idTransaccion varchar(50) primary key,
    formaPago varchar(50) not null,
    fechaPago date not null,
    total decimal(15,2),
    codigocliente int(11),
    Foreign Key (codigocliente) REFERENCES cliente(codigo)
);

create table estadoPedido(
    idEstado int primary key AUTO_INCREMENT,
    estado varchar(30) not null
);

create table pedido(
    codigo int(11) PRIMARY KEY,
    fechaPedido date not null,
    fechaEsperada date not null,
    fechaEntrega date,
    idEstado int,
    comentario text,
    idCliente int(11),
    Foreign Key (idCliente) REFERENCES cliente(codigo),
    Foreign Key (idEstado) REFERENCES estadoPedido(idEstado) 
);


create table detallepedido(
    codigoPedido int(11),
    codigoProducto varchar(15),
    cantidad int(11) not null,
    precioUnidad decimal(15,2),
    numeroLinea SMALLINT(6),
    Foreign Key (codigoPedido) REFERENCES pedido(codigo),
    Foreign Key (codigoProducto) REFERENCES producto(codigo)
);


































