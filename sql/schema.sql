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

