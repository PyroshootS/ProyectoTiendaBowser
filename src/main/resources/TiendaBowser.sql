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
(1, 'juan', '$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.', 'Juan', 'Castro Mora', 'jcastro@gmail.com', '4556-8978', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Juan_Diego_Madrigal.jpg/250px-Juan_Diego_Madrigal.jpg', true),
(2, 'rebeca', '$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi', 'Rebeca', 'Contreras Mora', 'acontreras@gmail.com', '5456-8789', 'https://upload.wikimedia.org/wikipedia/commons/0/06/Photo_of_Rebeca_Arthur.jpg', true),
(3, 'pedro', '$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO', 'Pedro', 'Mena Loria', 'lmena@gmail.com', '7898-8936', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Eduardo_de_Pedro_2019.jpg/480px-Eduardo_de_Pedro_2019.jpg?20200109230854', true);

INSERT INTO tiendabowser.categoria (id_categoria, descripcion, ruta_imagen, activo) VALUES 
(1, 'Aventura', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/695858/media/catalog/category/MONITORES.jpg', true),
(2, 'Terror', 'https://cnnespanol.cnn.com/wp-content/uploads/2022/04/teclado-mecanico.jpg', true),
(3, 'RPG', 'https://static-geektopia.com/storage/thumbs/784x311/788/7884251b/98c0f4a5.webp', true),
(4, 'Carreras', 'https://www.monumental.co.cr/wp-content/uploads/2022/03/X4J2Z6XQUZDO7O6QTDF4DIJ3VE.jpeg', false);

INSERT INTO tiendabowser.juego (id_juego, id_categoria, nombre, consola, precio, existencias, ruta_imagen, activo) VALUES
(1, 1, 'Elden Ring', 'PS4', 23000, 5, 'https://c.pxhere.com/images/ec/fd/d67b367ed6467eb826842ac81d3b-1453591.jpg!d', true),
(2, 2, 'Animal Crossing', 'Nintendo Switch', 27000, 2, 'https://c.pxhere.com/photos/17/77/Art_Calendar_Cc0_Creative_Design_High_Resolution_Mac_Stock-1622403.jpg!d', true),
(3, 3, 'Life is Strange', 'XBOX', 24000, 5, 'https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/09/LG-OLED-Flex-7-scaled.jpg', true),
(4, 4, 'Contrabant Police', 'PC', 27600, 2, 'https://www.lg.com/us/images/tvs/md08003300/gallery/D-01.jpg', true);

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
(6, 'ROLE_USER', 3);