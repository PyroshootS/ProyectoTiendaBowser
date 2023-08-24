drop schema if exists tiendabowser;
drop user if exists usuario;
CREATE SCHEMA  tiendabowser;

-- Elimina la base de datos si existe
DROP SCHEMA IF EXISTS tiendabowser;

-- Crea la base de datos
CREATE SCHEMA tiendabowser;

-- Establece la conexión y otorga permisos
CREATE USER 'usuario'@'%' IDENTIFIED BY 'clave';
GRANT ALL PRIVILEGES ON tiendabowser.* TO 'usuario'@'%';
FLUSH PRIVILEGES;

-- Define las tablas
CREATE TABLE tiendabowser.categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(30) NOT NULL,
  ruta_imagen VARCHAR(1024),
  activo BOOLEAN,
  PRIMARY KEY (id_categoria)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE tiendabowser.juego (
  id_juego INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  consola VARCHAR(1600) NOT NULL,
  precio DOUBLE,
  existencias INT,
  ruta_imagen VARCHAR(1024),
  activo BOOLEAN,
  PRIMARY KEY (id_juego),
  FOREIGN KEY fk_producto_categoria (id_categoria) REFERENCES tiendabowser.categoria(id_categoria)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE tiendabowser.accesorio (
  id_accesorio INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  precio DOUBLE,
  existencias INT,
  ruta_imagen VARCHAR(1024),
  activo BOOLEAN,
  PRIMARY KEY (id_accesorio),
  FOREIGN KEY fk_producto_categoria (id_categoria) REFERENCES tiendabowser.categoria(id_categoria)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE tiendabowser.consola (
  id_consola INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL,
  consola VARCHAR(1600) NOT NULL,
  precio DOUBLE,
  existencias INT,
  ruta_imagen VARCHAR(1024),
  activo BOOLEAN,
  PRIMARY KEY (id_consola)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE tiendabowser.usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(20) NOT NULL,
  password VARCHAR(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(25),
  telefono VARCHAR(15),
  ruta_imagen VARCHAR(1024),
  activo BOOLEAN,
  PRIMARY KEY (id_usuario)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE tiendabowser.factura (
  id_factura INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha DATE,
  total DOUBLE,
  estado INT,
  PRIMARY KEY (id_factura),
  FOREIGN KEY fk_factura_usuario (id_usuario) REFERENCES tiendabowser.usuario(id_usuario)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE tiendabowser.venta (
  id_venta INT NOT NULL AUTO_INCREMENT,
  id_factura INT NOT NULL,
  id_juego INT NOT NULL,
  precio DOUBLE,
  cantidad INT,
  PRIMARY KEY (id_venta),
  FOREIGN KEY fk_ventas_factura (id_factura) REFERENCES tiendabowser.factura(id_factura),
  FOREIGN KEY fk_ventas_producto (id_juego) REFERENCES tiendabowser.juego(id_juego)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE tiendabowser.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20),
  id_usuario INT,
  PRIMARY KEY (id_rol),
  FOREIGN KEY fk_rol_usuario (id_usuario) REFERENCES tiendabowser.usuario(id_usuario)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

-- Inserta los datos
INSERT INTO tiendabowser.usuario (id_usuario, username, password, nombre, apellidos, correo, telefono, ruta_imagen, activo) VALUES 
(1, 'oscar', '$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.', 'Oscar', 'Reina V', 'oscarg@gmail.com', '4556-8978', 'https://i.pinimg.com/1200x/06/ce/86/06ce86d3a2b00678ab7b6b06ffe776de.jpg', true),
(2, 'adri', '$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi', 'Adri', 'Viquez J', 'adrigs@gmail.com', '5456-8789', 'https://tierragamer.com/wp-content/uploads/2021/03/zerotwo01.jpg', true),
(3, 'ron', '$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO', 'Ronald', 'Mendoza W', 'ronaldg@gmail.com', '7898-8936', 'https://m.media-amazon.com/images/I/41NdRO84PYL._SX300_SY300_QL70_FMwebp_.jpg', true);

INSERT INTO tiendabowser.categoria (id_categoria, descripcion, ruta_imagen, activo) VALUES 
(1, 'Aventura', 'https://i.blogs.es/ab965a/nintendoswitch_tlozbreathofthewild_artwork_illustration_01.0/1366_2000.jpeg', true),
(2, 'Terror', 'https://ipadizate.com/hero/2021/12/apertura-mejores-juegos-terror-iphone-ipad.jpg', true),
(3, 'RPG', 'https://ipadizate.com/hero/2023/03/los-10-mejores-juegos-rpg-para-iphone-y-ipad-de-la-app-store-1.jpg', true),
(4, 'Carreras', 'https://hardzone.es/app/uploads-hardzone.es/2023/02/juegos-coches.jpg', false),
(5, 'PS5', 'https://www.intelec.co.cr/image/cache/catalog/catalogo/Juegos/CFI-1015B-800x800.jpg' , true),
(6, 'PS4' , 'https://m.media-amazon.com/images/I/71XY2MwEvlL.jpg' , true),
(7, 'NSwitch' , 'https://www.ubuy.cr/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNjEtUGJsWW50c0wuX0FDX1NMMTUwMF8uanBn.jpg' , true),
(8, 'Xbox' , 'https://www.intelec.co.cr/image/cache/catalog/catalogo/Juegos/RRT-00001-800x800h.jpg' , true);

INSERT INTO tiendabowser.juego (id_juego, id_categoria, nombre, consola, precio, existencias, ruta_imagen, activo) VALUES
(1, 1, 'Elden Ring', 'PS4', 23000, 5, 'https://images-ext-2.discordapp.net/external/7Cy4fRAYMHFbJc3JHmFbmKyH2a2TM8hji_zdyrUNnWo/https/playtecgames.com/wp-content/uploads/2022/04/ELDENRINGps4le.jpg?width=518&height=702', true),
(2, 2, 'Animal Crossing', 'Nintendo Switch', 27000, 2, 'https://images-ext-2.discordapp.net/external/5QsB-Ff_hYSKNaxq6O8O1ofQ4GOXhBbKxyl5NBR7gPc/%3Fv%3D1650999119/https/tecnopro.cl/cdn/shop/products/JuegosAnimalCrossingNewHorizonsStandardEditionNintendoSwitchFisico-01_700x700.jpg', true),
(3, 3, 'Life is Strange', 'Xbox', 24000, 5, 'https://images-ext-1.discordapp.net/external/00SiA6No-nkRwc9P6oWk28MxMJYo_VzZAixeVwo-NxU/https/images-na.ssl-images-amazon.com/images/I/81YtTaEYd3L._AC_UL600_SR600%2C600_.jpg', true),
(4, 4, 'Contrabant Police', 'PC', 27600, 2, 'https://i.3djuegos.com/juegos/17740/contraband_police/fotos/ficha/contraband_police-5797835.jpg', true),
(5, 1, 'Persona 5', 'PS5', 25000, 2, 'https://media.discordapp.net/attachments/1076136998408044605/1118238399862673428/730865220328.jpg', true),
(6, 1, 'Red Dead Redemption II', 'PS5', 35000, 2, 'https://media.discordapp.net/attachments/1076136998408044605/1118238399229345893/710425478949.jpg', true),
(7, 4, 'NFS Unbound', 'PS5', 45000, 2, 'https://media.discordapp.net/attachments/1076136998408044605/1118231628540559370/014633747911.jpg', true);

INSERT INTO tiendabowser.accesorio (id_accesorio, id_categoria, nombre, precio, existencias, ruta_imagen, activo) VALUES
(1, 6, 'Control PS4', 15000, 5, 'https://www.steren.cr/media/catalog/product/cache/b69086f136192bea7a4d681a8eaf533d/image/21703fcd6/control-inalambrico-compatible-con-ps4.jpg', true),
(2, 7, 'Controles Joy-Cons', 19000, 2, 'https://www.intelec.co.cr/image/cache/catalog/catalogo/Juegos/JOYCON-NEON-800x800h.jpg.webp', true),
(3, 8, 'Control Xbox', 20000, 5, 'https://s3-hc-files-prod.s3.amazonaws.com/wp-content/uploads/2023/06/QAT-00001-5.jpg', true),
(4, 5, 'Control PS5', 23000, 2, 'https://www.pcinvasion.com/wp-content/uploads/2023/01/feature-best-custom-ps5-controller.jpg', true);

INSERT INTO tiendabowser.consola (id_consola, nombre, consola, precio, existencias, ruta_imagen, activo) VALUES
(1, 'PS4', 'PlayStation 4', '250000', 2, 'https://m.media-amazon.com/images/I/71XY2MwEvlL.jpg', true),
(2, 'Xbox', 'Xbox Series X', '450000', 5, 'https://www.intelec.co.cr/image/cache/catalog/catalogo/Juegos/RRT-00001-800x800h.jpg', true),
(3, 'Nintendo Switch', 'Nintendo Switch', '350000', 4, 'https://www.ubuy.cr/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNjEtUGJsWW50c0wuX0FDX1NMMTUwMF8uanBn.jpg', true),
(4, 'PS5', 'PlayStation 5', '500000', 2, 'https://www.intelec.co.cr/image/cache/catalog/catalogo/Juegos/CFI-1015B-800x800.jpg', true);

INSERT INTO tiendabowser.factura (id_factura, id_usuario, fecha, total, estado) VALUES
(1, 1, '2022-01-05', 211560, 2),
(2, 2, '2022-01-07', 554340, 2),
(3, 3, '2022-01-07', 871000, 2),
(4, 1, '2022-01-15', 244140, 1),
(5, 2, '2022-01-17', 414800, 1),
(6, 3, '2022-01-21', 420000, 1);

INSERT INTO tiendabowser.venta (id_venta, id_factura, id_juego, precio, cantidad) VALUES
(1, 1, 1, 23000, 3),
(2, 1, 3, 24000, 2),
(3, 1, 4, 27600, 3),
(4, 2, 1, 23000, 1),
(5, 2, 2, 27000, 3),
(6, 2, 4, 27600, 3),
(7, 3, 1, 23000, 1),
(8, 3, 3, 24000, 1),
(9, 3, 4, 27600, 2);

INSERT INTO tiendabowser.rol (id_rol, nombre, id_usuario) VALUES
(1, 'ROLE_ADMIN', 1),
(2, 'ROLE_VENDEDOR', 1),
(3, 'ROLE_USER', 1),
(4, 'ROLE_VENDEDOR', 2),
(5, 'ROLE_USER', 2),
(6, 'ROLE_USER', 3)