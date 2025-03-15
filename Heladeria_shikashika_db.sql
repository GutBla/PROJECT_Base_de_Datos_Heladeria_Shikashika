CREATE DATABASE IF NOT EXISTS HeladeriaShikaShika;
USE HeladeriaShikaShika;

CREATE TABLE IF NOT EXISTS Pagos(
	id_pago			INT NOT NULL AUTO_INCREMENT, 
    metodo_pago		VARCHAR (20) NOT NULL,
    total_pedido	DECIMAL (10,2) NOT NULL,
    id_pedido		INT NOT NULL,
    PRIMARY KEY 	(id_pago)
);

CREATE TABLE IF NOT EXISTS Pedidos(
	id_pedido			INT NOT NULL AUTO_INCREMENT,
    fecha_hora_pedido	DATETIME NOT NULL,
    estado_pedido		ENUM("ENTREGADO","CANCELADO","EN PROCESO") NOT NULL,
	id_cliente			INT NOT NULL,
    PRIMARY KEY 		(id_pedido)
);
CREATE TABLE IF NOT EXISTS DetallePedidos(
	id_detalle_pedido	INT NOT NULL AUTO_INCREMENT,
    cantidad			INT(5) NOT NULL, 
    id_pedido			INT NOT NULL,
    PRIMARY KEY 		(id_detalle_pedido)
);
CREATE TABLE IF NOT EXISTS Clientes(
	carnet_identidad	INT NOT NULL,
    nombre				VARCHAR (25) NOT NULL,
    apellido_paterno	VARCHAR (30) NOT NULL,
    apellido_materno	VARCHAR (30) NOT NULL,
    telefono			INT (11),
    correo_electronico	VARCHAR (50) ,
    PRIMARY KEY 		(carnet_identidad)
);
CREATE TABLE IF NOT EXISTS Helados(
	id_helado			INT NOT NULL AUTO_INCREMENT,
    tipo_helado			ENUM("PERSONALIZADO","PREDEFINIDO"),
    precio				DECIMAL(10,2) NOT NULL,
    id_vaso				INT NOT NULL,
    id_detalle_pedido	INT NOT NULL,
    PRIMARY KEY 		(id_helado)
);
CREATE TABLE IF NOT EXISTS Vasos(
	id_vaso				INT NOT NULL AUTO_INCREMENT,
    tamaño				VARCHAR(10) NOT NULL,
    precio				DECIMAL(10,2) NOT NULL,
    cantidad_disponible	INT NOT NULL,
    direccion_imagen	VARCHAR(100) NOT NULL,
    PRIMARY KEY 		(id_vaso)
);
CREATE TABLE IF NOT EXISTS HeladosToppings(
	id_helado	INT NOT NULL,
    id_topping	INT NOT NULL
);
CREATE TABLE IF NOT EXISTS Ingredientes(
	id_ingrediente			INT NOT NULL AUTO_INCREMENT,
    tipo_ingrediente		ENUM("TOPPING","EDULCORANTE","SABORIZANTE","LECHE") NOT NULL,
    cantidad_disponible		INT NOT NULL,
    precio_uso_por_porcion	DECIMAL(10,2) NOT NULL,
    direccion_imagen		VARCHAR(100) NOT NULL,
    PRIMARY KEY				(id_ingrediente)
);
CREATE TABLE IF NOT EXISTS HeladosPersonalizados(
	id_helado_personalizado	INT NOT NULL AUTO_INCREMENT,
    id_helado				INT NOT NULL,
    PRIMARY KEY 			(id_helado_personalizado)
);
CREATE TABLE IF NOT EXISTS HeladosPredefinidos(
	id_helado_predefinido	INT NOT NULL AUTO_INCREMENT,
    descripcion				VARCHAR(255),
    nombre_helado			VARCHAR(30) NOT NULL,
    direccion_imagen		VARCHAR(100) NOT NULL,
    id_helado				INT NOT NULL,
    PRIMARY	KEY				(id_helado_predefinido)
); 
CREATE TABLE IF NOT EXISTS HeladosBolasHelado(
	id_helado	INT NOT NULL,
    id_bola_helado	INT NOT NULL
);
CREATE TABLE IF NOT EXISTS Toppings(
	id_topping		INT NOT NULL AUTO_INCREMENT,
    nombre_topping	VARCHAR(30) NOT NULL,
	tipo_topping	VARCHAR(30) NOT NULL,
    id_ingrediente	INT NOT NULL,
    PRIMARY	KEY		(id_topping)
);
CREATE TABLE IF NOT EXISTS Edulcorantes(
	id_edulcorante		INT NOT NULL AUTO_INCREMENT,
    nombre_edulcorante	VARCHAR(30) NOT NULL,
    id_ingrediente		INT NOT NULL,
    PRIMARY KEY			(id_edulcorante)
);
CREATE TABLE IF NOT EXISTS Saborizantes(
	id_saborizante		INT NOT NULL AUTO_INCREMENT,
    nombre_saborizante	VARCHAR(30) NOT NULL,
    id_ingrediente		INT NOT NULL,
    PRIMARY KEY			(id_saborizante)
);
CREATE TABLE IF NOT EXISTS Leches(
	id_leche		INT NOT NULL AUTO_INCREMENT,
    tipo_leche		VARCHAR(30) NOT NULL,
    id_ingrediente	INT NOT NULL,
    PRIMARY KEY		(id_leche)
); 
CREATE TABLE IF NOT EXISTS BolasHelado(
	id_bola_helado	INT NOT NULL AUTO_INCREMENT,
    id_leche		INT NOT NULL,
    id_saborizante	INT NOT NULL,
    id_edulcorante	INT NOT NULL,
    PRIMARY KEY		(id_bola_helado)
); 

ALTER TABLE Pagos
	ADD FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido);
    
ALTER TABLE Pedidos
	ADD FOREIGN KEY (id_cliente) REFERENCES Clientes(carnet_identidad);

ALTER TABLE DetallePedidos
	ADD FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido);

ALTER TABLE Helados
	ADD FOREIGN KEY (id_detalle_pedido) REFERENCES DetallePedidos(id_detalle_pedido),
    ADD FOREIGN KEY (id_vaso) REFERENCES Vasos(id_vaso);

ALTER TABLE HeladosBolasHelado
	ADD FOREIGN KEY (id_helado) REFERENCES Helados(id_helado),
    ADD FOREIGN KEY (id_bola_helado) REFERENCES BolasHelado(id_bola_helado);
    
ALTER TABLE HeladosToppings
	ADD FOREIGN KEY (id_helado) REFERENCES Helados(id_helado),
    ADD FOREIGN KEY (id_topping) REFERENCES Toppings(id_topping);

ALTER TABLE HeladosPersonalizados
	ADD FOREIGN KEY (id_helado) REFERENCES Helados(id_helado);

ALTER TABLE HeladosPredefinidos
	ADD FOREIGN KEY (id_helado) REFERENCES Helados(id_helado);
    
ALTER TABLE Toppings
	ADD FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes(id_ingrediente);

ALTER TABLE Edulcorantes
	ADD FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes(id_ingrediente);

ALTER TABLE Saborizantes
	ADD FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes(id_ingrediente);

ALTER TABLE Leches
	ADD FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes(id_ingrediente);
    
ALTER TABLE BolasHelado
	ADD FOREIGN KEY (id_leche) REFERENCES Leches(id_leche),
    ADD FOREIGN KEY (id_saborizante) REFERENCES Saborizantes(id_saborizante),
    ADD FOREIGN KEY (id_edulcorante) REFERENCES Edulcorantes(id_edulcorante);

INSERT INTO Clientes (carnet_identidad, nombre, apellido_paterno, apellido_materno, telefono, correo_electronico) VALUES
('1234567', 'Juan', 'Pérez', 'García', '12345678', 'juan.perez@gmail.com'),
('2345678', 'María', 'López', 'Fernández', '23456789', 'maria.lopez@gmail.com'),
('3456789', 'Carlos', 'Gómez', 'Hernández', '34567890', 'carlos.gomez@gmail.com'),
('4567890', 'Ana', 'Martínez', 'Rodríguez', '45678901', 'ana.martinez@gmail.com'),
('5678901', 'Luis', 'Díaz', 'Pérez', '56789012', 'luis.diaz@gmail.com'),
('6789012', 'Laura', 'Sánchez', 'García', '67890123', 'laura.sanchez@gmail.com'),
('7890123', 'Pedro', 'Romero', 'López', '78901234', 'pedro.romero@gmail.com'),
('8901234', 'Sofía', 'Cruz', 'Martínez', '89012345', 'sofia.cruz@gmail.com'),
('9012345', 'José', 'Flores', 'González', '90123456', 'jose.flores@gmail.com'),
('0123456', 'Elena', 'Mendoza', 'Torres', '01234567', 'elena.mendoza@gmail.com');

SELECT * FROM Clientes;


INSERT INTO Pedidos (id_pedido, fecha_hora_pedido, id_cliente, estado_pedido) VALUES
(1, '2024-09-15 14:30:00', 1234567, 'ENTREGADO'),
(2, '2024-09-16 10:15:00', 2345678, 'CANCELADO'),
(3, '2024-09-17 16:45:00', 3456789, 'EN PROCESO'),
(4, '2024-09-18 13:00:00', 4567890, 'ENTREGADO'),
(5, '2024-09-19 18:30:00', 5678901, 'ENTREGADO'),
(6, '2024-09-20 11:20:00', 6789012, 'CANCELADO'),
(7, '2024-09-21 09:05:00', 7890123, 'EN PROCESO'),
(8, '2024-09-22 15:40:00', 8901234, 'ENTREGADO'),
(9, '2024-09-23 17:15:00', 9012345, 'ENTREGADO'),
(10, '2024-09-24 12:00:00', 0123456, 'CANCELADO'),
(11, '2024-10-01 14:30:00', 6789012, 'ENTREGADO'),
(12, '2024-10-02 10:15:00', 7890123, 'CANCELADO'),
(13, '2024-10-03 16:45:00', 8901234, 'EN PROCESO'),
(14, '2024-10-04 13:00:00', 9012345, 'ENTREGADO'),
(15, '2024-10-05 18:30:00', 0123456, 'ENTREGADO'),
(16, '2024-10-06 11:20:00', 1234567, 'CANCELADO'),
(17, '2024-10-07 09:05:00', 2345678, 'EN PROCESO'),
(18, '2024-10-08 15:40:00', 3456789, 'ENTREGADO'),
(19, '2024-10-09 17:15:00', 4567890, 'ENTREGADO'),
(20, '2024-10-10 12:00:00', 5678901, 'CANCELADO');

SELECT * FROM Pedidos;

INSERT INTO Pagos (id_pago, id_pedido, metodo_pago, total_pedido) VALUES
(1, 1, 'Tarjeta de crédito', 20.00),
(2, 2, 'Efectivo', 25.50),
(3, 3, 'Tarjeta de débito', 15.00),
(4, 4, 'Transferencia', 30.75),
(5, 5, 'Efectivo', 18.90),
(6, 6, 'Tarjeta de crédito', 22.50),
(7, 7, 'Transferencia', 27.00),
(8, 8, 'Tarjeta de débito', 20.25),
(9, 9, 'Efectivo', 32.40),
(10, 10, 'Tarjeta de crédito', 19.95),
(11, 11, 'Transferencia', 15.00),
(12, 12, 'Efectivo', 20.50),
(13, 13, 'Tarjeta de débito', 12.00),
(14, 14, 'Tarjeta de crédito', 25.75),
(15, 15, 'Efectivo', 30.00),
(16, 16, 'Transferencia', 18.90),
(17, 17, 'Tarjeta de crédito', 22.50),
(18, 18, 'Efectivo', 16.25),
(19, 19, 'Tarjeta de débito', 28.40),
(20, 20, 'Transferencia', 19.95);

SELECT * FROM Pagos;

INSERT INTO DetallePedidos (id_detalle_pedido, id_pedido,cantidad) VALUES
(1, 1, 1),
(2, 1, 5),
(3, 2, 2),
(4, 2, 6),
(5, 3, 3),
(6, 3, 7),
(7, 4, 4),
(8, 4, 8),
(9, 5, 5),
(10, 5, 9),
(11, 6, 1),
(12, 6, 3),
(13, 7, 2),
(14, 7, 4),
(15, 8, 3),
(16, 8, 5),
(17, 9, 6),
(18, 9, 7),
(19, 10, 8),
(20, 10, 9),
(21, 11, 1),
(22, 11, 5),
(23, 12, 2),
(24, 12, 6),
(25, 13, 3),
(26, 13, 7),
(27, 14, 4),
(28, 14, 8),
(29, 15, 5),
(30, 15, 9);

SELECT * FROM DetallePedidos;

INSERT INTO Vasos (id_vaso, tamaño, precio, cantidad_disponible, direccion_imagen) VALUES
(1, 'Pequeño', 3.50, 100, '/img/vaso_pequeño.png'),
(2, 'Mediano', 4.00, 200, '/img/vaso_mediano.png'),
(3, 'Grande', 4.50, 150, '/img/vaso_grande.png');

SELECT * FROM Vasos;

INSERT INTO Helados (id_helado, tipo_helado, id_vaso, id_detalle_pedido, precio) VALUES
(1, 'predefinido', 1, 1, 3.50),
(2, 'personalizado', 2, 2, 5.45),
(3, 'predefinido', 3, 3, 3.50),
(4, 'personalizado', 1, 4, 7.12),
(5, 'predefinido', 2, 5, 6.17),
(6, 'personalizado', 3, 6, 8.01),
(7, 'predefinido', 1, 7, 7.98),
(8, 'personalizado', 2, 8, 7.00),
(9, 'predefinido', 3, 9, 4.35),
(10, 'personalizado', 1, 10, 2.20);

SELECT * FROM Helados;

INSERT INTO Ingredientes (tipo_ingrediente, cantidad_disponible, precio_uso_por_porcion, direccion_imagen)
VALUES
('Saborizante', 100, 0.50, 'imagen_vainilla.jpg'),
('Saborizante', 120, 0.60, 'imagen_fresa.jpg'),
('Saborizante', 80, 0.55, 'imagen_chocolate.jpg'),
('Saborizante', 90, 0.70, 'imagen_coco.jpg'),
('Saborizante', 110, 0.50, 'imagen_menta.jpg'),
('Saborizante', 95, 0.60, 'imagen_limon.jpg'),
('Saborizante', 85, 0.65, 'imagen_naranja.jpg'),
('Saborizante', 130, 0.50, 'imagen_dulce_de_leche.jpg'),
('Saborizante', 100, 0.60, 'imagen_platano.jpg'),
('Saborizante', 105, 0.50, 'imagen_frambuesa.jpg'),
('Saborizante', 115, 0.70, 'imagen_mora.jpg'),
('Saborizante', 90, 0.65, 'imagen_mango.jpg'),
('Saborizante', 100, 0.60, 'imagen_pistacho.jpg'),
('Saborizante', 80, 0.70, 'imagen_pasas_al_ron.jpg'),
('Saborizante', 75, 0.55, 'imagen_cafe.jpg'),
('Saborizante', 120, 0.65, 'imagen_durazno.jpg'),
('Saborizante', 100, 0.60, 'imagen_piña.jpg'),
('Saborizante', 110, 0.50, 'imagen_oreo.jpg'),
('Saborizante', 90, 0.70, 'imagen_algodon_de_azucar.jpg'),
('Saborizante', 105, 0.55, 'imagen_canela.jpg'),
('Saborizante', 85, 0.65, 'imagen_arandano.jpg'),
('Saborizante', 115, 0.50, 'imagen_cereza.jpg'),
('Saborizante', 100, 0.60, 'imagen_almendra.jpg'),
('Saborizante', 95, 0.70, 'imagen_chicle.jpg'),
('Saborizante', 80, 0.55, 'imagen_calabaza.jpg'),
('Leche', 200, 1.00, 'imagen_leche_natural.jpg'),
('Leche', 150, 1.10, 'imagen_leche_deslactosada.jpg'),
('Leche', 180, 1.05, 'imagen_leche_light.jpg'),
('Leche', 160, 1.20, 'imagen_leche_descremada.jpg'),
('Leche', 140, 1.30, 'imagen_leche_soya.jpg'),
('Leche', 170, 1.15, 'imagen_leche_almendra.jpg'),
('Leche', 190, 1.25, 'imagen_leche_arroz.jpg'),
('Leche', 200, 1.10, 'imagen_leche_coco.jpg');

INSERT INTO Ingredientes (id_ingrediente, tipo_ingrediente, cantidad_disponible, precio_uso_por_porcion, direccion_imagen) VALUES
(34, 'topping', 120, 0.50, 'imagenes/topping1.png'),
(35, 'topping', 200, 0.30, 'imagenes/topping2.png'),
(36, 'topping', 150, 0.70, 'imagenes/topping3.png'),
(37, 'topping', 100, 0.80, 'imagenes/topping4.png'),
(38, 'topping', 90, 0.60, 'imagenes/topping5.png'),
(39, 'topping', 250, 0.25, 'imagenes/topping6.png'),
(40, 'topping', 175, 0.75, 'imagenes/topping7.png'),
(41, 'topping', 80, 0.85, 'imagenes/topping8.png'),
(42, 'topping', 110, 0.55, 'imagenes/topping9.png'),
(43, 'topping', 220, 0.35, 'imagenes/topping10.png'),
(44, 'topping', 130, 0.65, 'imagenes/topping11.png'),
(45, 'topping', 95, 0.90, 'imagenes/topping12.png'),
(46, 'topping', 105, 0.50, 'imagenes/topping13.png'),
(47, 'topping', 180, 0.40, 'imagenes/topping14.png'),
(48, 'topping', 140, 0.70, 'imagenes/topping15.png'),
(49, 'topping', 70, 0.80, 'imagenes/topping16.png'),
(50, 'topping', 130, 0.55, 'imagenes/topping17.png'),
(51, 'topping', 160, 0.30, 'imagenes/topping18.png'),
(52, 'topping', 160, 0.75, 'imagenes/topping19.png'),
(53, 'topping', 60, 0.85, 'imagenes/topping20.png'),
(54, 'topping', 140, 0.50, 'imagenes/topping21.png'),
(55, 'topping', 210, 0.35, 'imagenes/topping22.png'),
(56, 'topping', 170, 0.65, 'imagenes/topping23.png'),
(57, 'topping', 125, 0.55, 'imagenes/topping24.png'),
(58, 'topping', 190, 0.30, 'imagenes/topping25.png'),
(59, 'topping', 155, 0.70, 'imagenes/topping26.png'),
(60, 'topping', 75, 0.80, 'imagenes/topping27.png'),
(61, 'topping', 115, 0.60, 'imagenes/topping28.png'),
(62, 'topping', 240, 0.25, 'imagenes/topping29.png'),
(63, 'topping', 135, 0.75, 'imagenes/topping30.png'),
(64, 'topping', 100, 0.50, 'imagenes/topping31.png'),
(65, 'topping', 210, 0.40, 'imagenes/topping32.png'),
(66, 'topping', 145, 0.70, 'imagenes/topping33.png'),
(67, 'topping', 130, 0.60, 'imagenes/topping34.png'),
(68, 'topping', 190, 0.35, 'imagenes/topping35.png'),
(69, 'topping', 220, 0.30, 'imagenes/topping36.png'),
(70, 'topping', 160, 0.80, 'imagenes/topping37.png'),
(71, 'topping', 80, 0.75, 'imagenes/topping38.png'),
(72, 'edulcorante', 200, 0.30, 'imagenes/edulcorante1.png'),
(73, 'edulcorante', 150, 0.25, 'imagenes/edulcorante2.png'),
(74, 'edulcorante', 175, 0.35, 'imagenes/edulcorante3.png');

SELECT * FROM Ingredientes;

INSERT INTO Saborizantes (nombre_saborizante, id_ingrediente) VALUES
('Vainilla', 1),
('Fresa', 2),
('Chocolate', 3),
('Coco', 4),
('Menta', 5),
('Limon', 6),
('Naranja', 7),
('Dulce de leche', 8),
('Platano', 9),
('Frambuesa', 10),
('Mora', 11),
('Mango', 12),
('Pistacho', 13),
('Pasas al Ron', 14),
('Cafe', 15),
('Durazno', 16),
('Piña', 17),
('Oreo', 18),
('Algodon de Azucar', 19),
('Canela', 20),
('Arandano', 21),
('Cereza', 22),
('Almendra', 23),
('Chicle', 24),
('Calabaza', 25);
 
 SELECT * FROM Saborizantes;

INSERT INTO Leches (tipo_leche, id_ingrediente) VALUES
('Leche Natural', 26),
('Leche Deslactosada', 27),
('Leche Light', 28),
('Leche Descremada', 29),
('Leche de Soya', 30),
('Leche de Almentra', 31),
('Leche de Arroz', 32),
('Leche de Coco', 33);

SELECT * FROM Leches;


INSERT INTO Toppings (nombre_topping, id_ingrediente, tipo_topping) VALUES
('Almendras', 34, 'sólido'),
('Arándano', 35, 'sólido'),
('Castañas', 36, 'sólido'),
('Chips de colores', 37, 'sólido'),
('Frambuesa', 38, 'sólido'),
('Fresas', 39, 'sólido'),
('Galletas de chocolate', 40, 'sólido'),
('Kiwi', 41, 'sólido'),
('Mango', 42, 'sólido'),
('Nueces', 43, 'sólido'),
('Piña', 44, 'sólido'),
('Plátanos', 45, 'sólido'),
('Salsa de chocolate', 46, 'líquido'),
('Virutas de chocolate', 47, 'sólido'),
('Chocolate', 48, 'sólido'),
('Dulce de leche', 49, 'líquido'),
('Cereales Chocapic', 50, 'sólido'),
('Cereza', 51, 'sólido'),
('Ciruela', 52, 'sólido'),
('Durazno', 53, 'sólido'),
('Cereal Zucaritas', 54, 'sólido'),
('Limón', 55, 'sólido'),
('Mandarina', 56, 'sólido'),
('Manzana', 57, 'sólido'),
('Melón', 58, 'sólido'),
('Naranja', 59, 'sólido'),
('Pera', 60, 'sólido'),
('Pomelo', 61, 'sólido'),
('Coco rallado', 62, 'sólido'),
('Galletas Oreo', 63, 'sólido'),
('Dulces de Menta', 64, 'sólido'),
('Gomitas de osos', 65, 'sólido'),
('Mini marshmallows', 66, 'sólido'),
('Cereales Froot Loops', 67, 'sólido'),
('Botones de chocolate', 68, 'sólido'),
('Sandía', 69, 'sólido'),
('Barquillos', 70, 'sólido'),
('Maní', 71, 'sólido');

SELECT * FROM Toppings;

INSERT INTO Edulcorantes (nombre_edulcorante, id_ingrediente) VALUES
("Azucar",72),
("Stevia",73),
("Azucar Monera",74);

SELECT * FROM Edulcorantes;

INSERT INTO HeladosPersonalizados (id_helado)
VALUES
(2), 
(4), 
(6), 
(8), 
(10);

SELECT * FROM HeladosPersonalizados;

INSERT INTO BolasHelado (id_bola_helado, id_leche, id_saborizante, id_edulcorante) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 2),
(4, 4, 4, 2),
(5, 5, 5, 3),
(6, 6, 6, 1),
(7, 7, 7, 1),
(8, 8, 8, 2),
(9, 1, 9, 2),
(10, 2, 10, 3),
(11, 3, 11, 1),
(12, 4, 12, 1),
(13, 5, 13, 2),
(14, 6, 14, 2),
(15, 7, 15, 3),
(16, 8, 16, 1),
(17, 1, 17, 1),
(18, 2, 18, 2),
(19, 3, 19, 2),
(20, 4, 20, 3),
(21, 5, 21, 1),
(22, 6, 22, 1),
(23, 7, 23, 2),
(24, 8, 24, 3),
(25, 1, 25, 1);

SELECT * FROM BolasHelado;

INSERT INTO HeladosBolasHelado (id_helado, id_bola_helado)
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5);

SELECT * FROM HeladosBolasHelado;

INSERT INTO HeladosPredefinidos (id_helado,descripcion, nombre_helado, direccion_imagen)
VALUES
(1,"Helado intenso de chocolate, cubierto con galletas de chocolate y chispas de colores.","Choco Explosión","/imagenes/choco.jpg"), 
(3,"Helado cremoso de caramelo, decorado con dulce de leche y galletas trituradas.","Caramelo Travieso","/imagenes/caramelo_travieso.jpg"), 
(5,"Helado de Oreo con trozos de galletas y crema batida, ideal para los amantes del chocolate.","Oreo Monstruoso","/imagenes/oreos_monster.jpg"), 
(7,"Combinación de pasas al ron con chocolate y un toque de canela.","Pasas Locas","/imagenes/pasas_locas.jpg"), 
(9,"Exótico helado de mango, decorado con trozos de frutas tropicales.","Mango Dinamita","/imagenes/mango_dinamita.jpg");

SELECT * FROM HeladosPredefinidos;

INSERT INTO HeladosToppings (id_helado, id_topping) VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 7),
(5, 8),
(5, 9),
(6, 10),
(6, 11),
(6, 12),
(7, 13),
(8, 14),
(8, 15),
(9, 16),
(9, 17),
(9, 18),
(10, 19);

SELECT * FROM HeladosToppings;

-- Visualizar los helados predefinidos ---------------------------------
SELECT 
    hp.nombre_helado AS helado,
    hp.direccion_imagen,
    hp.descripcion,
    CASE
        WHEN MIN(ing.cantidad_disponible) > 0 THEN 'Disponible'
        ELSE 'No disponible'
    END AS disponibilidad
FROM HeladosPredefinidos hp
JOIN Helados h ON hp.id_helado = h.id_helado
JOIN HeladosBolasHelado hb ON h.id_helado = hb.id_helado
JOIN BolasHelado bh ON hb.id_bola_helado = bh.id_bola_helado
JOIN Leches l ON bh.id_leche = l.id_leche
JOIN Saborizantes s ON bh.id_saborizante = s.id_saborizante
JOIN Edulcorantes e ON bh.id_edulcorante = e.id_edulcorante
LEFT JOIN HeladosToppings ht ON h.id_helado = ht.id_helado
LEFT JOIN Toppings t ON ht.id_topping = t.id_topping
LEFT JOIN Ingredientes ing ON ing.id_ingrediente = t.id_ingrediente 
    OR ing.id_ingrediente = l.id_ingrediente 
    OR ing.id_ingrediente = s.id_ingrediente 
    OR ing.id_ingrediente = e.id_ingrediente
GROUP BY hp.nombre_helado, hp.direccion_imagen, hp.descripcion;

-- Total de ventas por dia (de Fecha a Fecha)-----------------------
SELECT DATE(p.fecha_hora_pedido) AS fecha, SUM(pa.total_pedido) AS total_ventas
FROM Pedidos p
JOIN Pagos pa ON p.id_pedido = pa.id_pedido
WHERE p.estado_pedido = 'ENTREGADO'
AND p.fecha_hora_pedido BETWEEN '2024-09-15' AND '2024-09-24'
GROUP BY DATE(p.fecha_hora_pedido);

-- Visualizar el total de venta con respecto a los vasos --------------------
SELECT Vasos.tamaño, COUNT(Vasos.tamaño) AS cantidad_vendidos, SUM(Helados.precio) AS total_ventas
FROM Helados
JOIN Vasos ON Helados.id_vaso = Vasos.id_vaso
JOIN DetallePedidos ON Helados.id_detalle_pedido = DetallePedidos.id_detalle_pedido
JOIN Pedidos ON DetallePedidos.id_pedido = Pedidos.id_pedido
GROUP BY Vasos.tamaño;
GROUP BY DATE(p.fecha_hora_pedido);

-- Visualizar los 3 helados mas vendidos ---------------------------------
SELECT nombre_helado, COUNT(Helados.id_helado) AS cantidad_vendidos
FROM Helados
JOIN HeladosPredefinidos ON Helados.id_helado = HeladosPredefinidos.id_helado
GROUP BY nombre_helado
ORDER BY cantidad_vendidos DESC
LIMIT 3;
-- ---------------------------------------------------------------
SELECT 
    hp.nombre_helado AS nombre,
    hp.direccion_imagen AS direccion_imagen,
    hp.descripcion AS descripcion,
    COUNT(h.id_helado) AS cantidad_vendidos
FROM Helados h
JOIN HeladosPredefinidos hp ON h.id_helado = hp.id_helado
JOIN DetallePedidos dp ON h.id_detalle_pedido = dp.id_detalle_pedido
JOIN Pedidos p ON dp.id_pedido = p.id_pedido
WHERE p.estado_pedido = 'ENTREGADO'
GROUP BY hp.nombre_helado, hp.direccion_imagen, hp.descripcion
ORDER BY cantidad_vendidos DESC
LIMIT 3;

-- Mostrar que pedidos se cancelaron --------------------------
SELECT id_pedido, fecha_hora_pedido, id_cliente 
FROM Pedidos 
WHERE estado_pedido = 'CANCELADO';
-- ---------------------------------------------------------------
SELECT 
    p.id_pedido AS id_pedido,
    p.fecha_hora_pedido AS fecha_hora_pedido,
    CONCAT(c.nombre, ' ', c.apellido_paterno, ' ', c.apellido_materno) AS nombre_cliente,
    p.estado_pedido AS estado_pedido
FROM Pedidos p
JOIN Clientes c ON p.id_cliente = c.carnet_identidad
WHERE p.estado_pedido = 'CANCELADO'
ORDER BY p.fecha_hora_pedido DESC;

-- Mostrar los saborizantes disponibles y no disponibles ----------
SELECT 
    s.nombre_saborizante AS nombre,
    ing.direccion_imagen,
    CASE
        WHEN ing.cantidad_disponible > 0 THEN 'Disponible'
        ELSE 'No disponible'
    END AS disponibilidad
FROM Saborizantes s
JOIN Ingredientes ing ON s.id_ingrediente = ing.id_ingrediente;

-- Mostrar los toppings disponibles y no disponibles-----------
SELECT 
    t.nombre_topping AS nombre,
    ing.direccion_imagen,
    CASE
        WHEN ing.cantidad_disponible > 0 THEN 'Disponible'
        ELSE 'No disponible'
    END AS disponibilidad
FROM Toppings t
JOIN Ingredientes ing ON t.id_ingrediente = ing.id_ingrediente;

-- Mostrar los edulcorantes disponibles y no disponibles-------------
SELECT 
    e.nombre_edulcorante AS nombre,
    ing.direccion_imagen,
    CASE
        WHEN ing.cantidad_disponible > 0 THEN 'Disponible'
        ELSE 'No disponible'
    END AS disponibilidad
FROM Edulcorantes e
JOIN Ingredientes ing ON e.id_ingrediente = ing.id_ingrediente;

-- Mostrar las leches disponibles y no disponibles---------------
SELECT 
    l.tipo_leche AS nombre,
    ing.direccion_imagen,
    CASE
        WHEN ing.cantidad_disponible > 0 THEN 'Disponible'
        ELSE 'No disponible'
    END AS disponibilidad
FROM Leches l
JOIN Ingredientes ing ON l.id_ingrediente = ing.id_ingrediente;
