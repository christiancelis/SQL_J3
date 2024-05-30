use GardenDB;

INSERT INTO pais (idPais, nombre, poblacion)
VALUES
('ES', 'España', 47351000),
('US', 'Estados Unidos', 331002650),
('CA', 'Canadá', 38518000),
('CN', 'China', 1444215690),
('JP', 'Japón', 125836000),
('AU', 'Australia', 26150717),
('DE', 'Alemania', 83783757),
('FR', 'Francia', 65273900),
('IT', 'Italia', 59483000),
('MX', 'México', 133379000),
('BR', 'Brasil', 212626932),
('AR', 'Argentina', 46387223),
('CO', 'Colombia', 50888000),
('ZA', 'Sudáfrica', 60142994),
('EG', 'Egipto', 102334400),
('IR', 'Irán', 85937588),
('ID', 'Indonesia', 273523615),
('PH', 'Filipinas', 112328963),
('PK', 'Pakistán', 235302000),
('VN', 'Vietnam', 98204838);


INSERT INTO Departamento (idDepartamento, idPais, nombre)
VALUES
('AND', 'ES', 'Andalucía'),
('CAT', 'ES', 'Cataluña'),
('MAD', 'ES', 'Comunidad de Madrid'),
('VAL', 'ES', 'Comunidad Valenciana'),
('NYC', 'US', 'Nueva York'),
('LA', 'US', 'Los Ángeles'),
('CHI', 'US', 'Chicago'),
('BC', 'CA', 'Columbia Británica'),
('ON', 'CA', 'Ontario'),
('QC', 'CA', 'Quebec'),
('BJ', 'CN', 'Pekín'),
('SH', 'CN', 'Shanghái'),
('GUA', 'CN', 'Guangdong'),
('TOK', 'JP', 'Tokio'),
('OSA', 'JP', 'Osaka'),
('KYO', 'JP', 'Kioto'),
('NSW', 'AU', 'Nueva Gales del Sur'),
('VIC', 'AU', 'Victoria'),
('QLD', 'AU', 'Queensland'),
('BW', 'DE', 'Baden-Wurtemberg'),
('NRW', 'DE', 'Renania del Norte-Westfalia'),
('BY', 'DE', 'Baviera'),
('IDF', 'FR', 'Isla de Francia'),
('ARA', 'FR', 'Auvernia-Ródano-Alpes'),
('PACA', 'FR', 'Provenza-Alpes-Costa Azul'),
('LOM', 'IT', 'Lombardía'),
('VEN', 'IT', 'Véneto'),
('CAM', 'IT', 'Campania'),
('CDMX', 'MX', 'Ciudad de México'),
('JAL', 'MX', 'Jalisco'),
('NL', 'MX', 'Nuevo León'),
('SP', 'BR', 'São Paulo'),
('RJ', 'BR', 'Rio de Janeiro'),
('MG', 'BR', 'Minas Gerais'),
('CBA', 'AR', 'Córdoba'),
('BA', 'AR', 'Buenos Aires'),
('SF', 'AR', 'Santa Fe'),
('ANT', 'CO', 'Antioquia'),
('CHO', 'CO', 'Chocó'),
('COR', 'CO', 'Córdoba'),
('GP', 'ZA', 'Gauteng'),
('WC', 'ZA', 'Cabo Occidental'),
('KN', 'ZA', 'KwaZulu-Natal'),
('CA', 'EG', 'El Cairo');

INSERT INTO ciudad (idCiudad, idRegion, nombre, codigoPostal)
VALUES
('MAD', 'MAD', 'Madrid', '28001'),
('BCN', 'CAT', 'Barcelona', '08001'),
('SEV', 'AND', 'Sevilla', '41001'),
('VAL', 'VAL', 'Valencia', '46001'),
('NYC', 'NYC', 'Nueva York', '10001'),
('LA', 'LA', 'Los Ángeles', '90001'),
('CHI', 'CHI', 'Chicago', '60601'),
('VAN', 'BC', 'Vancouver', 'V6C'),
('TOR', 'ON', 'Toronto', 'M5V'),
('BJ', 'BJ', 'Pekín', '100000'),
('SH', 'SH', 'Shanghái', '200000'),
('GZ', 'GUA', 'Guangzhou', '510000'),
('TOK', 'TOK', 'Tokio', '100-0001'),
('OSA', 'OSA', 'Osaka', '530-0001'),
('KYO', 'KYO', 'Kioto', '600-0001'),
('SYD', 'NSW', 'Sídney', '2000'),
('MEL', 'VIC', 'Melbourne', '3000'),
('BRI', 'QLD', 'Brisbane', '4000'),
('STU', 'BW', 'Stuttgart', '70000'),
('DU', 'NRW', 'Düsseldorf', '40000'),
('MU', 'BY', 'Múnich', '80000'),
('PAR', 'IDF', 'París', '75001'),
('LYO', 'ARA', 'Lyon', '69001'),
('MAR', 'PACA', 'Marsella', '13001'),
('MIL', 'LOM', 'Milán', '20121'),
('VEN', 'VEN', 'Venecia', '30121'),
('NAP', 'CAM', 'Nápoles', '80121'),
('CDMX', 'CDMX', 'Ciudad de México', '06000'),
('GDL', 'JAL', 'Guadalajara', '44100'),
('MTY', 'NL', 'Monterrey', '64000'),
('SP', 'SP', 'São Paulo', '01000');

INSERT INTO gamaproducto (gama, descripcion_texto, descripcion_html, imagen) VALUES
('Ornamentales', 'Plantas decorativas para jardines y espacios exteriores.', '<p>Plantas decorativas para jardines y espacios exteriores.</p>', 'ornamentales.jpg'),
('Herramientas', 'Herramientas de jardinería para el cuidado de plantas y césped.', '<p>Herramientas de jardinería para el cuidado de plantas y césped.</p>', 'herramientas.jpg'),
('Herbáceas', 'Plantas herbáceas para interiores y exteriores.', '<p>Plantas herbáceas para interiores y exteriores.</p>', 'herbaceas.jpg'),
('Frutales', 'Árboles frutales para huertos y jardines.', '<p>Árboles frutales para huertos y jardines.</p>', 'frutales.jpg');


INSERT INTO proveedor (idProveedor, nombre) VALUES
(1, 'Jardines S.A.'),
(2, 'Flores y Plantas del Norte'),
(3, 'Herramientas de Jardín Express'),
(4, 'Viveros Mediterráneo'),
(5, 'Árboles Frutales de la Sierra'),
(6, 'Semillas y Cultivos');

INSERT INTO producto (codigo, nombre, dimensiones, descripcion, cantidadstock, precioventa, precioproveedor, gama, idProveedor) VALUES
('PROD001', 'Rosa roja', '25x10 cm', 'Rosa roja de jardín con fragancia suave.', 100, 12.50, 8.75, 'Ornamentales', 1),
('PROD002', 'Podadora profesional', '30x15 cm', 'Podadora eléctrica con hoja de acero inoxidable.', 50, 65.00, 45.00, 'Herramientas', 3),
('PROD003', 'Tomate Cherry', '10x10 cm', 'Planta de tomate cherry para huertos urbanos.', 75, 5.00, 3.50, 'Frutales', 5),
('PROD004', 'Campanilla azul', '20x15 cm', 'Planta herbácea con flores azules en forma de campanilla.', 120, 8.75, 6.25, 'Herbáceas', 2),
('PROD005', 'Tulipán mixto', '30x10 cm', 'Bulbos de tulipán en variedad de colores.', 200, 3.50, 2.25, 'Ornamentales', 1),
('PROD006', 'Rastrillo de jardín', '40x10 cm', 'Rastrillo de acero inoxidable para limpiar jardines.', 30, 15.00, 10.50, 'Herramientas', 3),
('PROD007', 'Manzano Gala', '100x50 cm', 'Árbol frutal de manzanas Gala para huertos familiares.', 20, 40.00, 28.50, 'Frutales', 5),
('PROD008', 'Lavanda', '15x15 cm', 'Planta aromática de lavanda para jardines y macetas.', 80, 6.75, 4.75, 'Herbáceas', 2),
('PROD009', 'Cactus mixto', '10x10 cm', 'Colección de cactus en variedad de formas y tamaños.', 150, 9.50, 6.75, 'Ornamentales', 1),
('PROD010', 'Pala de jardín', '50x15 cm', 'Pala de jardín con mango ergonómico de madera.', 40, 18.50, 13.25, 'Herramientas', 3),
('PROD011', 'Naranjo Valencia', '120x80 cm', 'Árbol frutal de naranjas Valencia para huertos y jardines.', 15, 55.00, 38.75, 'Frutales', 5),
('PROD012', 'Romero', '20x20 cm', 'Planta aromática de romero para condimentar platos.', 90, 5.25, 3.75, 'Herbáceas', 2),
('PROD013', 'Rosales mixtos', '30x20 cm', 'Colección de rosales en variedad de colores y fragancias.', 100, 11.75, 8.25, 'Ornamentales', 1),
('PROD014', 'Tijeras de podar', '25x10 cm', 'Tijeras de podar profesionales con hoja de acero.', 60, 22.50, 15.75, 'Herramientas', 3),
('PROD015', 'Limón Eureka', '80x60 cm', 'Árbol frutal de limones Eureka para huertos y jardines.', 25, 35.00, 24.50, 'Frutales', 5),
('PROD016', 'Menta', '15x15 cm', 'Planta aromática de menta para infusiones y recetas.', 70, 4.50, 3.25, 'Herbáceas', 2),
('PROD017', 'Girasol', '40x30 cm', 'Planta ornamental de girasol para jardines y terrazas.', 110, 7.25, 5.00, 'Ornamentales', 1),
('PROD018', 'Cortacésped eléctrico', '100x50 cm', 'Cortacésped eléctrico para mantenimiento de césped.', 35, 95.00, 66.50, 'Herramientas', 3),
('PROD019', 'Pera Conference', '110x70 cm', 'Árbol frutal de peras Conference para huertos y jardines.', 18, 48.00, 33.75, 'Frutales', 5),
('PROD020', 'Albahaca', '20x20 cm', 'Planta aromática de albahaca para cocinar y decorar.', 85, 6.00, 4.25, 'Herbáceas', 2);

INSERT INTO tipodireccion (idtipo, tipo) VALUES
(1, 'Residencial'),
(2, 'Comercial'),
(3, 'Apartado Postal'),
(4, 'Apartamento'),
(5, 'Oficina');


INSERT INTO direccion (idDireccion, direccion, idtipo) VALUES
('DIR001', 'Calle Principal 123', 1),
('DIR002', 'Avenida Central 456', 2),
('DIR003', 'Apartado 789', 3),
('DIR004', 'Piso 1, Puerta A', 4),
('DIR005', 'Edificio Empresarial 789, Oficina 101', 5),
('DIR006', 'Plaza Mayor 321', 1),
('DIR007', 'Calle del Comercio 654', 2),
('DIR008', 'Apartado 987', 3),
('DIR009', 'Piso 2, Puerta B', 4),
('DIR010', 'Edificio Corporativo 987, Oficina 202', 5),
('DIR011', 'Avenida de la Libertad 789', 1),
('DIR012', 'Calle de las Flores 456', 2),
('DIR013', 'Apartado 654', 3),
('DIR014', 'Piso 3, Puerta C', 4),
('DIR015', 'Edificio Ejecutivo 654, Oficina 303', 5),
('DIR016', 'Calle de la Paz 789', 1),
('DIR017', 'Avenida de las Palmeras 456', 2),
('DIR018', 'Apartado 654', 3),
('DIR019', 'Piso 4, Puerta D', 4),
('DIR020', 'Edificio Administrativo 654, Oficina 404', 5);

INSERT INTO oficina (codigo, idCiudad, telefono, nombre)
VALUES
('OFI001', 'MAD', '+34 91 123 4567', 'Oficina Central'),  
('OFI002', 'BCN', '+33 1 23 45 67 89', 'Oficina París'),   
('OFI003', 'VAL', '+44 20 1234 5678', 'Oficina Londres'),  
('OFI004', 'TOK', '+49 30 1234567', 'Oficina Berlín'),    
('OFI005', 'OSA', '+44 161 123 4567', 'Oficina Manchester'), 
('OFI007', 'TOK', '+32 2 123 45 67', 'Oficina Tokio'),  
('OFI008', 'LA', '+43 1 123 4567', 'Oficina Los Angeles'),     
('OFI009', 'SH', '+46 8 123 45 67', 'Oficina Shangai'),  
('OFI010', 'MAR', '+45 33 12 34 56', 'Oficina Marsella'), 
('OFI012', 'LYO', '+33 4 56 78 90 12', 'Oficina Lyon'),    
('OFI013', 'MIL', '+39 02 123 4567', 'Oficina Milán'),    
('OFI014', 'BCN', '+32 2 987 65 43', 'Oficina Barcelona'), 
('OFI015', 'BRI', '+43 1 987 6543', 'Oficina Brishbane'),
('OFI016', 'MAD', '+31 20 123 4567', 'Oficina Madrid 2'),  
('OFI017', 'DU', '41 44 123 45 67', 'Oficina Düsseldorf'),    
('OFI018', 'BJ', '+48 22 123 45 67', 'Oficina Pekin'),  
('OFI019', 'NAP', '+47 21 12 34 56', 'Oficina Napoles');


INSERT INTO direccionOficina (idDireccion, idOficina) VALUES
('DIR001', 'OFI001'),
('DIR002', 'OFI002'),
('DIR003', 'OFI003'),
('DIR004', 'OFI004'),
('DIR005', 'OFI005'),
('DIR007', 'OFI007'),
('DIR008', 'OFI008'),
('DIR009', 'OFI009'),
('DIR010', 'OFI010'),
('DIR012', 'OFI012'),
('DIR013', 'OFI013'),
('DIR014', 'OFI014'),
('DIR015', 'OFI015'),
('DIR016', 'OFI016'),
('DIR017', 'OFI017'),
('DIR018', 'OFI018'),
('DIR019', 'OFI019');




INSERT INTO empleado (codigo, nombre, apellido1, apellido2, extension, email, codigoOficina, codigoJefe, puesto) VALUES
(1, 'Juan', 'García', 'López', '1234', 'juan.garcia@example.com', 'OFI001', NULL, 'Director General'),
(2, 'María', 'Martínez', 'Fernández', '2345', 'maria.martinez@example.com', 'OFI002', 1, 'Subdirector Marketing'),
(3, 'Pedro', 'Rodríguez', 'Gómez', '3456', 'pedro.rodriguez@example.com', 'OFI003', 2, 'Subdirector Ventas'),
(4, 'Ana', 'González', 'Pérez', '4567', 'ana.gonzalez@example.com', 'OFI004', 2, 'Secretaria'),
(5, 'Luis', 'Sánchez', 'Díaz', '5678', 'luis.sanchez@example.com', NULL, 3, 'Representante Ventas'),
(6, 'Elena', 'López', 'Hernández', '6789', 'elena.lopez@example.com', 'OFI019', 3, 'Representante Ventas'),
(7, 'Pablo', 'Fernández', 'Martín', '7890', 'pablo.fernandez@example.com', 'OFI007', 3, 'Representante Ventas'),
(8, 'Lucía', 'Pérez', 'García', '8901', 'lucia.perez@example.com', 'OFI008', 3, 'Representante Ventas'),
(11, 'Manuel', 'Gómez', 'López', '9012', 'manuel.gomez@example.com', 'OFI009', 3, 'Representante Ventas');


INSERT INTO cliente (codigo, nombre, nombreContacto, apellidoContacto, telefono, fax, idCiudad, limiteCredito, codigoEmpleadoRepVentas)
VALUES
('2001', 'Jardinería Verde', 'María', 'Fernández', '+34 91 234 5678', '+34 91 234 5679', 'MAD', 15000.00, 5),
('2002', 'Flores y Plantas S.A.', 'Pedro', 'Gómez', '+33 1 23 45 6789', '+33 1 23 45 6790', 'BCN', 20000.00, 6),
('2003', 'Herramientas de Jardín', 'Luisa', 'Hernández', '+44 20 1234 5678', '+44 20 1234 5679', 'VAL', 18000.00,7),
('2004', 'Analista de MarketingJardín del Edén', 'Eva', 'García', '+39 02 123 4567', '+39 02 123 4568', 'MIL', 23000.00, 6),
('2008', 'Plantas Exóticas', 'Diego', 'López', '+43 1 123 4567', '+43 1 123 4568', 'SEV', 21000.00, 7),
('2009', 'Verde y Más', 'Ana', 'Hernández', '+46 8 123 4567', '+46 8 123 4568', 'NYC', 24000.00, 8),
('2010', 'Jardín en Casa', 'José', 'Martín', '+45 33 12 3456', '+45 33 12 3457', 'STU', 26000.00, 11),
('2011', 'Jardines Modernos', 'Marta', 'Gómez', '+34 93 987 6543', '+34 93 987 6544', 'BCN', 17000.00, 5),
('2012', 'Flores Elegantes', 'Carlos', 'García', '+33 4 56 78 9012', '+33 4 56 78 9013', 'LYO', 21000.00, 6),
('2013', 'Jardines del Sur', 'Isabel', 'Hernández', '+39 02 123 4567', '+39 02 123 4568', 'MIL', 18000.00, 7),
('2014', 'Plantas Frescas', 'Juan', 'Martínez', '+32 2 987 6543', '+32 2 987 6544', 'OSA', 22000.00, 8),
('2015', 'Jardín Feliz', 'Laura', 'Sánchez', '+43 1 987 6543', '+43 1 987 6544', 'BRI', 25000.00, 11),
('2016', 'Plantas Vivas', 'Pablo', 'Gómez', '+31 20 123 4567', '+31 20 123 4568', 'MAD', 19000.00, 5),
("2017", 'Flores y Más', 'Cristina', 'Pérez', '+41 44 123 4567', '+41 44 123 4568', 'MEL', 23000.00, 6),
("2018", 'Jardines Urbanos', 'Javier', 'Hernández', '+48 22 123 4567', '+48 22 123 4568', 'SEV', 21000.00, 7),
("2019", 'Naturaleza en Casa', 'María', 'Martínez', '+47 21 12 3456', '+47 21 12 3457', 'CDMX', 24000.00, 8),
("2020", 'Plantas Decorativas', 'Antonio', 'García', '+358 9 123 4567', '+358 9 123 4568', 'MAD', 26000.00, 11);

INSERT INTO direccioncliente (idDireccion, idCliente) VALUES
('DIR001', 2001),
('DIR002', 2002),
('DIR003', 2003),
('DIR004', 2004),
('DIR009', 2009),
('DIR010', 2010),
('DIR011', 2011),
('DIR012', 2012),
('DIR013', 2013),
('DIR014', 2014),
('DIR015', 2015),
('DIR016', 2016),
('DIR017', 2017),
('DIR018', 2018),
('DIR019', 2019),
('DIR020', 2020);


INSERT INTO pago (idTransaccion, formaPago, fechaPago, total, codigocliente) VALUES
('TRANS001', 'Tarjeta de crédito', '2006-05-01', 150.00, 2001),
('TRANS002', 'Transferencia bancaria', '2007-05-02', 200.00, 2002),
('TRANS003', 'Cheque', '2008-05-03', 180.00, 2003),
('TRANS004', 'Paypal', '2008-05-04', 220.00, 2004),
('TRANS009', 'Tarjeta de crédito', '2010-05-09', 240.00, 2009),
('TRANS010', 'Tarjeta de débito', '2009-05-10', 260.00, 2010),
('TRANS011', 'Transferencia bancaria', '2008-05-11', 170.00, 2011),
('TRANS012', 'Paypal', '2008-05-12', 210.00, 2012),
('TRANS013', 'Efectivo', '2006-05-13', 180.00, 2013),
('TRANS014', 'Tarjeta de crédito', '2011-05-14', 220.00, 2014),
('TRANS015', 'Tarjeta de débito', '2010-05-15', 250.00, 2015),
('TRANS016', 'Transferencia bancaria', '2009-05-16', 190.00, 2016),
('TRANS017', 'Cheque', '2008-05-17', 230.00, 2017),
('TRANS018', 'Efectivo', '2007-05-18', 210.00, 2018),
('TRANS019', 'Tarjeta de crédito', '2012-05-19', 240.00, 2019),
('TRANS020', 'Tarjeta de débito', '2011-05-20', 260.00, 2020);

INSERT INTO estadoPedido (idEstado, estado) VALUES
(1, 'Pendiente'),
(2, 'Procesado'),
(3, 'Enviado'),
(4, 'Entregado'),
(5, 'Cancelado'),
(6, 'Devuelto'),
(7, 'En preparación'),
(8, 'Listo para enviar'),
(9, 'Reembolsado'),
(10, 'En revisión'),
(11, 'En espera de pago'),
(12, 'Pagado'),
(13, 'En almacén'),
(14, 'En tránsito'),
(15, 'Rechazado'),
(16, 'Aceptado'),
(17, 'En espera de confirmación'),
(18, 'Completado'),
(19, 'No disponible'),
(20, 'Faltante');


INSERT INTO pedido (codigo, fechaPedido, fechaEsperada, fechaEntrega, idEstado, comentario, idCliente) VALUES
(3001, '2006-01-17','2006-01-19','2006-01-19', 1, 'Pedido urgente', 2001),
(3002, '2007-10-23','2007-10-28','2007-10-26', 2, 'Entrega rápida', 2002),
(3003, '2008-06-20','2008-06-25',NULL,3, 'Cliente habitual', 2003),
(3004, '2008-11-09', '2008-05-08', '2008-05-07', 4, 'Primera compra', 2004),
(3008, '2008-05-08', '2008-05-12', '2024-05-11', 8, 'Pedido recurrente', 2008),
(3009, '2009-05-09', '2009-05-13', '2009-05-12', 9, 'Promoción especial', 2009),
(3010, '2008-05-10', '2008-05-14', '2008-05-13', 10, 'Cliente nuevo', 2010),
(3011, '2008-05-11', '2008-05-15', '2008-05-14', 11, 'Pedido prioritario', 2011),
(3012, '2009-05-12', '2009-05-16', '2009-05-15', 12, 'Entrega en tienda', 2012),
(3013, '2008-05-13', '2008-05-17', '2008-05-16', 13, 'Pedido de prueba', 2013),
(3014, '2007-05-14', '2007-05-18', '2007-05-17', 14, 'Pedido por teléfono', 2014),
(3015, '2010-05-15', '2010-05-19', '2010-05-18', 15, 'Pedido en línea', 2015),
(3016, '2011-05-16', '2011-05-20', '2011-05-19', 16, 'Cliente corporativo', 2016),
(3018, '2009-11-18', '2009-11-22', '2009-11-21', 18, 'Envío rápido', 2018),
(3019, '2010-03-19', '2010-03-23', '2010-05-22', 19, 'Pedido internacional', 2019),
(3020, '2010-07-20', '2010-07-24', '2010-07-23', 20, 'Entrega a domicilio', 2020);

INSERT INTO detallepedido (codigoPedido, codigoProducto, cantidad, precioUnidad, numeroLinea) VALUES
(3001, 'PROD001', 10, 50.00, 1), 
(3001, 'PROD002', 5, 25.00, 2),
(3002, 'PROD003', 15, 30.00, 1), 
(3002, 'PROD004', 10, 40.00, 2), 
(3003, 'PROD005', 8, 35.00, 1),
(3003, 'PROD006', 12, 45.00, 2), 
(3004, 'PROD007', 20, 20.00, 1), 
(3004, 'PROD008', 25, 15.00, 2), 
(3009, 'PROD017', 5, 90.00, 1),
(3009, 'PROD018', 7, 95.00, 2),
(3010, 'PROD019', 10, 100.00, 1),
(3010, 'PROD020', 12, 105.00, 2);
