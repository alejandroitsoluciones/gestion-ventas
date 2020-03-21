# SQL Manager 2010 for MySQL 4.5.0.9
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : negocio


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;

SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `negocio`;

CREATE DATABASE `negocio`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `negocio`;

SET sql_mode = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

#
# Structure for the `clientes` table : 
#

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id_clientes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) NOT NULL,
  `apellido_cliente` varchar(50) NOT NULL,
  `direccion_cliente` varchar(50) NOT NULL,
  PRIMARY KEY (`id_clientes`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Structure for the `proveedores` table : 
#

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `id_proveedores` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(50) NOT NULL,
  `direccion_proveedor` varchar(50) NOT NULL,
  `cuit_proveedor` varchar(15) NOT NULL,
  `telefono_proveedor` varchar(15) NOT NULL,
  PRIMARY KEY (`id_proveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `compras` table : 
#

DROP TABLE IF EXISTS `compras`;

CREATE TABLE `compras` (
  `id_compras` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `fecha_compra` date NOT NULL,
  `total_compra` decimal(8,2) NOT NULL,
  `id_proveedores` int(11) NOT NULL,
  PRIMARY KEY (`id_compras`),
  KEY `id_proveedores` (`id_proveedores`),
  CONSTRAINT `compras_fk` FOREIGN KEY (`id_proveedores`) REFERENCES `proveedores` (`id_proveedores`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `marcas` table : 
#

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `id_marcas` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(50) NOT NULL,
  PRIMARY KEY (`id_marcas`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Structure for the `productos` table : 
#

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id_productos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(50) NOT NULL,
  `precio_producto` decimal(8,2) NOT NULL,
  `stock_producto` int(11) NOT NULL,
  `id_marcas` int(11) NOT NULL,
  PRIMARY KEY (`id_productos`),
  KEY `id_marcas` (`id_marcas`),
  CONSTRAINT `productos_fk` FOREIGN KEY (`id_marcas`) REFERENCES `marcas` (`id_marcas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

#
# Structure for the `detalle_compras` table : 
#

DROP TABLE IF EXISTS `detalle_compras`;

CREATE TABLE `detalle_compras` (
  `id_detalle_compras` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_compras` int(11) NOT NULL,
  `id_productos` int(11) NOT NULL,
  `cantidad_productos` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_compras`),
  KEY `id_compras` (`id_compras`),
  KEY `id_productos` (`id_productos`),
  CONSTRAINT `detalle_compras_fk` FOREIGN KEY (`id_compras`) REFERENCES `compras` (`id_compras`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detalle_compras_fk1` FOREIGN KEY (`id_productos`) REFERENCES `productos` (`id_productos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `usuarios` table : 
#

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  PRIMARY KEY (`id_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `empleados` table : 
#

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `id_empleados` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(50) NOT NULL,
  `apellido_empleado` varchar(50) NOT NULL,
  `dni_empleado` varchar(15) NOT NULL,
  `direccion_empleado` varchar(50) NOT NULL,
  `telefono_empleado` varchar(15) NOT NULL,
  `id_usuarios` int(11) NOT NULL,
  PRIMARY KEY (`id_empleados`),
  KEY `id_usuarios` (`id_usuarios`),
  CONSTRAINT `empleados_fk` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `ventas` table : 
#

DROP TABLE IF EXISTS `ventas`;

CREATE TABLE `ventas` (
  `id_ventas` int(11) NOT NULL AUTO_INCREMENT,
  `numero_factura` int(11) NOT NULL,
  `fecha_venta` datetime NOT NULL,
  `total_venta` decimal(8,2) NOT NULL,
  `id_clientes` int(11) NOT NULL,
  `id_empleados` int(11) NOT NULL,
  PRIMARY KEY (`id_ventas`),
  KEY `id_clientes` (`id_clientes`),
  KEY `id_empleados` (`id_empleados`),
  CONSTRAINT `ventas_fk` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ventas_fk1` FOREIGN KEY (`id_empleados`) REFERENCES `empleados` (`id_empleados`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `detalle_ventas` table : 
#

DROP TABLE IF EXISTS `detalle_ventas`;

CREATE TABLE `detalle_ventas` (
  `id_detalle_ventas` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ventas` int(11) NOT NULL,
  `id_productos` int(11) NOT NULL,
  `cantidad_producto` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_ventas`),
  KEY `id_ventas` (`id_ventas`),
  KEY `id_productos` (`id_productos`),
  CONSTRAINT `detalle_ventas_fk` FOREIGN KEY (`id_ventas`) REFERENCES `ventas` (`id_ventas`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detalle_ventas_fk1` FOREIGN KEY (`id_productos`) REFERENCES `productos` (`id_productos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

#
# Definition for the `ACTUALIZAR_STOCK` procedure : 
#

DELIMITER $$

DROP PROCEDURE IF EXISTS `ACTUALIZAR_STOCK`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `ACTUALIZAR_STOCK`(
        aPRO INT,
        aCANT INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
  UPDATE productos SET productos.stock_producto = productos.stock_producto - aCANT 
  WHERE productos.id_productos = aPRO; 
END$$

#
# Definition for the `ACTUALIZAR_STOCK_COMPRAS` procedure : 
#

DROP PROCEDURE IF EXISTS `ACTUALIZAR_STOCK_COMPRAS`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `ACTUALIZAR_STOCK_COMPRAS`(
        idPro INT,
        Cant INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	UPDATE `productos` SET `productos`.`stock_producto` = `productos`.`stock_producto` + Cant
    WHERE `productos`.`id_productos` = idPro;
END$$

#
# Definition for the `BUSCAR_CLIENTE` procedure : 
#

DROP PROCEDURE IF EXISTS `BUSCAR_CLIENTE`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `BUSCAR_CLIENTE`(
        nombre_cli VARCHAR(50)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SELECT * FROM `clientes` WHERE `clientes`.`nombre_cliente` LIKE nombre_cli;
END$$

#
# Definition for the `BUSCAR_EMPLEADO` procedure : 
#

DROP PROCEDURE IF EXISTS `BUSCAR_EMPLEADO`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `BUSCAR_EMPLEADO`(
        nombre_emp	VARCHAR(50)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SELECT * FROM `empleados` WHERE `empleados`.`nombre_empleado` LIKE nombre_emp;
END$$

#
# Definition for the `BUSCAR_MARCA` procedure : 
#

DROP PROCEDURE IF EXISTS `BUSCAR_MARCA`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `BUSCAR_MARCA`(
        nombre_mar VARCHAR(50)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SELECT * FROM `marcas` WHERE `marcas`.`nombre_marca` LIKE nombre_mar;
END$$

#
# Definition for the `BUSCAR_PRODUCTO` procedure : 
#

DROP PROCEDURE IF EXISTS `BUSCAR_PRODUCTO`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `BUSCAR_PRODUCTO`(
        nombre_pro VARCHAR(50)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SELECT productos.*, marcas.id_marcas AS marcasId, marcas.nombre_marca
	FROM productos
	INNER JOIN marcas
	ON productos.id_marcas = marcas.id_marcas
	WHERE productos.nombre_producto
	LIKE nombre_pro;
END$$

#
# Definition for the `BUSCAR_PROVEEDOR` procedure : 
#

DROP PROCEDURE IF EXISTS `BUSCAR_PROVEEDOR`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `BUSCAR_PROVEEDOR`(
        nombre_prov VARCHAR(50)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SELECT * FROM `proveedores` WHERE `proveedores`.`nombre_proveedor` LIKE nombre_prov;
END$$

#
# Definition for the `ELIMINAR_CLIENTE` procedure : 
#

DROP PROCEDURE IF EXISTS `ELIMINAR_CLIENTE`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `ELIMINAR_CLIENTE`(
        idCli INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	DELETE FROM `clientes` WHERE `clientes`.`id_clientes` = idCli;
END$$

#
# Definition for the `ELIMINAR_EMPLEADO` procedure : 
#

DROP PROCEDURE IF EXISTS `ELIMINAR_EMPLEADO`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `ELIMINAR_EMPLEADO`(
        idEmp INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	DELETE FROM `empleados` WHERE `empleados`.`id_empleados` = idEmp;
END$$

#
# Definition for the `ELIMINAR_MARCA` procedure : 
#

DROP PROCEDURE IF EXISTS `ELIMINAR_MARCA`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `ELIMINAR_MARCA`(
        idMar INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	DELETE FROM `marcas` WHERE `marcas`.`id_marcas` = idMar;
END$$

#
# Definition for the `ELIMINAR_PRODUCTO` procedure : 
#

DROP PROCEDURE IF EXISTS `ELIMINAR_PRODUCTO`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `ELIMINAR_PRODUCTO`(
        ID INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	DELETE FROM `productos` WHERE `productos`.`id_productos` = ID;
END$$

#
# Definition for the `ELIMINAR_PROVEEDOR` procedure : 
#

DROP PROCEDURE IF EXISTS `ELIMINAR_PROVEEDOR`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `ELIMINAR_PROVEEDOR`(
        idProv INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	DELETE FROM `proveedores` WHERE `proveedores`.`id_proveedores` = idProv;
END$$

#
# Definition for the `INSERTAR_CLIENTE` procedure : 
#

DROP PROCEDURE IF EXISTS `INSERTAR_CLIENTE`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `INSERTAR_CLIENTE`(
        nombre VARCHAR(50),
        apellido VARCHAR(50),
        direccion VARCHAR(50)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	INSERT INTO `clientes` (nombre_cliente, apellido_cliente, direccion_cliente)
    VALUES (nombre, apellido, direccion);
END$$

#
# Definition for the `INSERTAR_COMPRA` procedure : 
#

DROP PROCEDURE IF EXISTS `INSERTAR_COMPRA`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `INSERTAR_COMPRA`(
        num_pedido INT,
        fecha DATETIME,
        total DECIMAL(8,2),
        idProv INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	INSERT INTO `compras` (numero_pedido, fecha_compra, total_compra, id_proveedores)
    VALUES (num_pedido, fecha, total, idProv);
END$$

#
# Definition for the `INSERTAR_DETALLE_COMPRA` procedure : 
#

DROP PROCEDURE IF EXISTS `INSERTAR_DETALLE_COMPRA`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `INSERTAR_DETALLE_COMPRA`(
        idComp INT,
        idPro INT,
        cant INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	INSERT INTO `detalle_compras` (id_compras, id_productos, cantidad_productos)
    VALUES (idComp, idPro, cant);
END$$

#
# Definition for the `INSERTAR_DETALLE_VENTA` procedure : 
#

DROP PROCEDURE IF EXISTS `INSERTAR_DETALLE_VENTA`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `INSERTAR_DETALLE_VENTA`(
        dVENT INT,
        dPRO INT,
        dCANT INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
  INSERT INTO detalle_ventas (id_ventas, id_productos, cantidad_producto) 
  VALUES (dVENT, dPRO, dCANT);
END$$

#
# Definition for the `INSERTAR_EMPLEADO` procedure : 
#

DROP PROCEDURE IF EXISTS `INSERTAR_EMPLEADO`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `INSERTAR_EMPLEADO`(
        nombre VARCHAR(50),
        apellido VARCHAR(50),
        dni VARCHAR(20),
        direccion VARCHAR(50),
        telefono VARCHAR(20),
        idUser INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	INSERT INTO `empleados` (nombre_empleado, apellido_empleado, dni_empleado, direccion_empleado, telefono_empleado, id_usuarios) 
    VALUES (nombre, apellido, dni, direccion, telefono, idUser);
END$$

#
# Definition for the `INSERTAR_MARCA` procedure : 
#

DROP PROCEDURE IF EXISTS `INSERTAR_MARCA`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `INSERTAR_MARCA`(
        nombre_marca VARCHAR(50)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	INSERT INTO `marcas` (nombre_marca)
    VALUES (nombre_marca);
END$$

#
# Definition for the `INSERTAR_PRODUCTO` procedure : 
#

DROP PROCEDURE IF EXISTS `INSERTAR_PRODUCTO`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `INSERTAR_PRODUCTO`(
        nombre_pro VARCHAR(50),
        precio_pro DECIMAL(8,2),
        stock_pro INTEGER,
        fk_marca INTEGER
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	INSERT INTO productos (nombre_producto, precio_producto, stock_producto, id_marcas)
    VALUES (nombre_pro, precio_pro, stock_pro, fk_marca); 
END$$

#
# Definition for the `INSERTAR_PROVEEDOR` procedure : 
#

DROP PROCEDURE IF EXISTS `INSERTAR_PROVEEDOR`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `INSERTAR_PROVEEDOR`(
        nombre VARCHAR(50),
        direccion VARCHAR(50),
        cuit VARCHAR(50),
        telefono VARCHAR(50)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	INSERT INTO `proveedores` (nombre_proveedor, direccion_proveedor, cuit_proveedor, telefono_proveedor) 
    VALUES (nombre, direccion, cuit, telefono);
END$$

#
# Definition for the `INSERTAR_USUARIO` procedure : 
#

DROP PROCEDURE IF EXISTS `INSERTAR_USUARIO`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `INSERTAR_USUARIO`(
        u VARCHAR(100),
        p VARCHAR(100)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	INSERT INTO usuarios (usuario, clave) 
    VALUES (u, p);
END$$

#
# Definition for the `INSERTAR_VENTA` procedure : 
#

DROP PROCEDURE IF EXISTS `INSERTAR_VENTA`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `INSERTAR_VENTA`(
        vNF INT,
        vFH DATETIME,
        vTV DECIMAL(8,2),
        vCLI INT,
        vEMP INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
  INSERT INTO ventas (numero_factura, fecha_venta, total_venta, id_clientes, id_empleados) 
  VALUES (vNF, vFH, vTV, vCLI, vEMP);
END$$

#
# Definition for the `MODIFICAR_CLAVE` procedure : 
#

DROP PROCEDURE IF EXISTS `MODIFICAR_CLAVE`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `MODIFICAR_CLAVE`(
        idUser INT,
        clave VARCHAR(50)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	UPDATE `usuarios` SET `usuarios`.`clave` = clave
    WHERE `usuarios`.`id_usuarios` = idUser;
END$$

#
# Definition for the `MODIFICAR_CLIENTE` procedure : 
#

DROP PROCEDURE IF EXISTS `MODIFICAR_CLIENTE`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `MODIFICAR_CLIENTE`(
        nombre VARCHAR(50),
        apellido VARCHAR(50),
        direccion VARCHAR(50),
        idCli INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	UPDATE `clientes` SET `clientes`.`nombre_cliente` = nombre, `clientes`.`apellido_cliente` = apellido, `clientes`.`direccion_cliente` = direccion 
    WHERE `clientes`.`id_clientes` = idCli;
END$$

#
# Definition for the `MODIFICAR_EMPLEADO` procedure : 
#

DROP PROCEDURE IF EXISTS `MODIFICAR_EMPLEADO`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `MODIFICAR_EMPLEADO`(
        nombre VARCHAR(50),
        apellido VARCHAR(50),
        dni VARCHAR(50),
        direccion VARCHAR(50),
        telefono VARCHAR(20),
        idEmp INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	UPDATE `empleados` SET `empleados`.`nombre_empleado` = nombre, `empleados`.`apellido_empleado` = apellido, `empleados`.`dni_empleado` = dni, `empleados`.`direccion_empleado` = direccion, `empleados`.`telefono_empleado` = telefono 
    WHERE `empleados`.`id_empleados` = idEmp;
END$$

#
# Definition for the `MODIFICAR_MARCA` procedure : 
#

DROP PROCEDURE IF EXISTS `MODIFICAR_MARCA`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `MODIFICAR_MARCA`(
        marca VARCHAR(50),
        idMar INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	UPDATE `marcas` SET `marcas`.`nombre_marca` = marca WHERE `marcas`.`id_marcas` = idMar;
END$$

#
# Definition for the `MODIFICAR_PRODUCTO` procedure : 
#

DROP PROCEDURE IF EXISTS `MODIFICAR_PRODUCTO`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `MODIFICAR_PRODUCTO`(
        nombre_pro VARCHAR(50),
        precio_pro DECIMAL(8,2),
        stock_pro INTEGER,
        fk_marca INTEGER,
        idPro INTEGER
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	UPDATE productos SET productos.nombre_producto = nombre_pro, productos.precio_producto = precio_pro, productos.stock_producto = stock_pro, productos.id_marcas = fk_marca 
    WHERE productos.id_productos = idPro;
END$$

#
# Definition for the `MODIFICAR_PROVEEDOR` procedure : 
#

DROP PROCEDURE IF EXISTS `MODIFICAR_PROVEEDOR`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `MODIFICAR_PROVEEDOR`(
        nombre VARCHAR(50),
        direccion VARCHAR(50),
        cuit VARCHAR(50),
        telefono VARCHAR(50),
        idProv INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	UPDATE `proveedores` SET `proveedores`.`nombre_proveedor` = nombre, `proveedores`.`direccion_proveedor` = direccion, `proveedores`.`cuit_proveedor` = cuit, `proveedores`.`telefono_proveedor` = telefono
    WHERE `proveedores`.`id_proveedores` = idProv;
END$$

#
# Definition for the `SELECCIONAR_EMPLEADO` procedure : 
#

DROP PROCEDURE IF EXISTS `SELECCIONAR_EMPLEADO`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `SELECCIONAR_EMPLEADO`(
        eIdUser INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SELECT * FROM `empleados` WHERE `empleados`.`id_usuarios` = eIdUser;
END$$

#
# Definition for the `SELECCION_CLIENTE` procedure : 
#

DROP PROCEDURE IF EXISTS `SELECCION_CLIENTE`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `SELECCION_CLIENTE`(
        idCli INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SELECT * FROM clientes WHERE clientes.id_clientes = idCli;
END$$

#
# Definition for the `SELECCION_DETALLES` procedure : 
#

DROP PROCEDURE IF EXISTS `SELECCION_DETALLES`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `SELECCION_DETALLES`(
        idVent INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	select productos.id_productos as idpro, productos.nombre_producto, 
    productos.precio_producto, detalle_ventas.cantidad_producto, 
    detalle_ventas.id_productos, detalle_ventas.id_ventas, ventas.id_ventas 
    from ventas inner join detalle_ventas 
    on ventas.id_ventas = detalle_ventas.id_ventas 
    inner join productos 
    on productos.id_productos = detalle_ventas.id_productos 
    where ventas.id_ventas = idVent;
END$$

#
# Definition for the `SELECCION_EMPLEADO` procedure : 
#

DROP PROCEDURE IF EXISTS `SELECCION_EMPLEADO`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `SELECCION_EMPLEADO`(
        idEmp INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SELECT * FROM `empleados` WHERE `empleados`.`id_empleados` = idEmp;
END$$

#
# Definition for the `SELECCION_MARCA` procedure : 
#

DROP PROCEDURE IF EXISTS `SELECCION_MARCA`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `SELECCION_MARCA`(
        idMar INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SELECT * FROM `marcas` WHERE `marcas`.id_marcas = idMar;
END$$

#
# Definition for the `SELECCION_PRODUCTO` procedure : 
#

DROP PROCEDURE IF EXISTS `SELECCION_PRODUCTO`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `SELECCION_PRODUCTO`(
        idPro INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SELECT * FROM productos WHERE productos.id_productos = idPro;
END$$

#
# Definition for the `SELECCION_PROVEEDOR` procedure : 
#

DROP PROCEDURE IF EXISTS `SELECCION_PROVEEDOR`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `SELECCION_PROVEEDOR`(
        idProv INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SELECT * FROM `proveedores` WHERE `proveedores`.`id_proveedores` = idProv;
END$$

#
# Definition for the `SELECCION_VENTA` procedure : 
#

DROP PROCEDURE IF EXISTS `SELECCION_VENTA`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `SELECCION_VENTA`(
        idVent INT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SELECT * FROM `ventas` WHERE `ventas`.id_ventas = idVent;
END$$

#
# Definition for the `USUARIO_REPETIDO` procedure : 
#

DROP PROCEDURE IF EXISTS `USUARIO_REPETIDO`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `USUARIO_REPETIDO`(
        u VARCHAR(100)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SELECT count(*) usuario FROM usuarios 
    WHERE usuario = u;
END$$

#
# Definition for the `VALIDAR_IDENTIDAD` procedure : 
#

DROP PROCEDURE IF EXISTS `VALIDAR_IDENTIDAD`$$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `VALIDAR_IDENTIDAD`(
        dni VARCHAR(50)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SELECT COUNT(*) dni FROM `empleados` WHERE `empleados`.`dni_empleado` = dni;
END$$

DELIMITER ;

#
# Definition for the `sis_num_comprobante` view : 
#

DROP VIEW IF EXISTS `sis_num_comprobante`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW sis_num_comprobante AS 
  select 
    max(`ventas`.`numero_factura`) AS `num_comp` 
  from 
    `ventas`;

#
# Definition for the `sis_num_pedido` view : 
#

DROP VIEW IF EXISTS `sis_num_pedido`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW sis_num_pedido AS 
  select 
    max(`compras`.`numero_pedido`) AS `num_pedido` 
  from 
    `compras`;

#
# Definition for the `sis_productos` view : 
#

DROP VIEW IF EXISTS `sis_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW sis_productos AS 
  select 
    `productos`.`id_productos` AS `id_productos`,
    `productos`.`nombre_producto` AS `nombre_producto`,
    `productos`.`precio_producto` AS `precio_producto`,
    `productos`.`stock_producto` AS `stock_producto`,
    `productos`.`id_marcas` AS `id_marcas`,
    `marcas`.`id_marcas` AS `marcaId`,
    `marcas`.`nombre_marca` AS `nombre_marca` 
  from 
    (`productos` join `marcas` on((`productos`.`id_marcas` = `marcas`.`id_marcas`))) 
  order by 
    `productos`.`id_productos`;

#
# Definition for the `sis_productos_compras` view : 
#

DROP VIEW IF EXISTS `sis_productos_compras`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW sis_productos_compras AS 
  select 
    `sis_productos`.`id_productos` AS `id_productos`,
    `sis_productos`.`nombre_producto` AS `nombre_producto`,
    `sis_productos`.`precio_producto` AS `precio_producto`,
    `sis_productos`.`stock_producto` AS `stock_producto`,
    `sis_productos`.`id_marcas` AS `id_marcas`,
    `sis_productos`.`marcaId` AS `marcaId`,
    `sis_productos`.`nombre_marca` AS `nombre_marca` 
  from 
    `sis_productos` 
  where 
    ((`sis_productos`.`stock_producto` > 1) and (`sis_productos`.`stock_producto` < 100));

#
# Definition for the `sis_seleccionar_usuario` view : 
#

DROP VIEW IF EXISTS `sis_seleccionar_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW sis_seleccionar_usuario AS 
  select 
    max(`usuarios`.`id_usuarios`) AS `ultimo_usuario` 
  from 
    `usuarios`;

#
# Definition for the `sis_ultima_compra` view : 
#

DROP VIEW IF EXISTS `sis_ultima_compra`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW sis_ultima_compra AS 
  select 
    max(`compras`.`id_compras`) AS `id_compras` 
  from 
    `compras`;

#
# Definition for the `sis_ultima_venta` view : 
#

DROP VIEW IF EXISTS `sis_ultima_venta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW sis_ultima_venta AS 
  select 
    max(`ventas`.`id_ventas`) AS `id_ventas` 
  from 
    `ventas`;

#
# Data for the `clientes` table  (LIMIT 0,500)
#

INSERT INTO `clientes` (`id_clientes`, `nombre_cliente`, `apellido_cliente`, `direccion_cliente`) VALUES 
  (1,'LUIS','CRUZ','ALVARADO 200'),
  (2,'ABEL','PUCA','URQUIZA 400'),
  (3,'RICARDO','SALAS','ZUVIRIA 700'),
  (4,'BRUNO','GONZALES','ESPAÑA 200'),
  (5,'MAURICIO','SAAVEDRA','MITRE 600'),
  (6,'CECILIA','JIMENEZ','ALVARADO 915'),
  (7,'LEO','MARTINEZ','LERMA 200'),
  (8,'JULIAN','DIAZ','JUJUY 220'),
  (9,'ANALIA','SARA','SARAVIA 900'),
  (10,'CARLOS','GIMENEZ','JUJUY 150'),
  (11,'ELENA','ZARATE','BELGRANO 1600'),
  (12,'JOSE','PEREZ','CASEROS 1000'),
  (13,'LUCAS','CAMPOS','GUEMES 420');
COMMIT;

#
# Data for the `marcas` table  (LIMIT 0,500)
#

INSERT INTO `marcas` (`id_marcas`, `nombre_marca`) VALUES 
  (1,'ALIMENTOS'),
  (2,'BEBIDAS'),
  (3,'GOLOSINAS'),
  (4,'ARTICULOS DE LIMPIEZA'),
  (5,'ARTICULOS PARA EL HOGAR'),
  (6,'INDUMENTARIA'),
  (7,'ELECTRODOMESTICOS'),
  (8,'TECNOLOGIA');
COMMIT;

#
# Data for the `productos` table  (LIMIT 0,500)
#

INSERT INTO `productos` (`id_productos`, `nombre_producto`, `precio_producto`, `stock_producto`, `id_marcas`) VALUES 
  (1,'ARROZ - DOS HERMANOS 1KG',19.40,649,1),
  (2,'PURE DE TOMATE - LA CAMPAGNOLA 520G',13.90,5798,1),
  (3,'HAMBURGUESAS - PATY (CLASICO)',55.00,1998,1),
  (4,'CHOCOLATE - COFLER 170G',49.90,1000,3),
  (5,'BOMBONES SURTIDOS - SELECCION 258G',70.00,80,3),
  (6,'BOMBONES SURTIDOS - SURTIDO ESPECIAL 296G',41.00,260,3),
  (7,'CHOCOLATE - COFLER 55G',25.00,1000,3),
  (8,'BOMBONES SURTIDOS - BON BON 272G',59.00,240,3),
  (9,'BOMBONES DE FRUTA - MOGUL 500G',89.90,120,3),
  (10,'BOMBON - BON BON 16G',5.00,6200,3),
  (11,'CHOCOLATE - COFLER 100G',42.00,1400,3),
  (12,'CHUPETIN FRUTAL - MISTER POPS 50U',65.00,120,3),
  (13,'CARAMELOS FRUTALES - ARCOR 800G',95.00,80,3),
  (14,'CHUPETIN - PICO DULCE 5U',24.90,130,3),
  (15,'CARAMELOS - ARCOR 150G',29.00,940,3),
  (16,'CHOCOLATE - NUGATON 3U',27.50,330,3),
  (17,'ALFAJORES DE ARROZ - CHOCOARROZ 3U',34.90,450,3),
  (18,'CHOCOLATE - NUGATON 48G',19.90,200,3),
  (19,'OBLEA DE ARROZ - GALLO SNACKS 3U',39.00,560,3),
  (20,'OBLEA DE ARROZ - GALLO SNACKS 20G',15.90,1900,3),
  (21,'TABLETA DE DULCE DE LECHE - MILKA 135G',49.90,250,3),
  (22,'ALFAJOR DE CHOCOLATE - MILKA 6U',59.90,1200,3),
  (23,'CHICLE - BELDENT 7U',11.90,4700,3),
  (24,'ALMENDRAS - BONAFIDE VIZZIO 100G',79.00,120,3),
  (25,'BOMBONES - FERRERO ROCHER 200G',149.00,150,3),
  (26,'BARRA DE CHOCOLATE - KINDER 50G',22.00,300,3),
  (27,'BARRA DE CHOCOLATE - NESTLE 115G',49.00,1800,3),
  (28,'GALLETAS - PEPITOS 3U',35.90,4500,3),
  (29,'GALLETAS - CRIOLLITAS 5U',29.90,1699,1),
  (30,'BIZCOCHOS DE ARROZ - GALLO SNACKS 100G',23.50,798,1),
  (31,'ALMOHADITAS CRUJIENTES - 3ARROYOS 250G',39.90,260,1),
  (32,'DULCE DE LECHE - SAN IGNACIO 400G',25.90,759,1),
  (33,'PREMEZCLA CHIPA - LUCCHETTI 250G',30.00,380,1),
  (34,'POSTRE - ROYAL 75G',10.00,99,1),
  (35,'BIZCOCHUELO - GODET 480G',32.00,100,1),
  (36,'EDULCORANTE - HILERET 400CC',49.00,110,1),
  (37,'TE - LA VIRGINIA 100U',33.50,389,1),
  (38,'MATE COCIDO - UNION 100U',49.90,117,1),
  (39,'MERMELADA - NOEL 454G',25.00,158,1),
  (40,'CACAO EN POLVO - LA VIRGINIA 800G',69.90,240,1),
  (41,'BAÑO DE REPOSTERIA - AGUILA 150G',35.90,1400,1),
  (42,'YERBA MATE - PAYADITO 1KG',69.90,738,1),
  (43,'CAFE - NESTLE 170G',89.00,1689,1),
  (44,'FIDEOS - MATARAZZO 500G',17.90,10298,1),
  (45,'SABORIZADOR - KNOR 4U',12.90,1699,1),
  (46,'POLENTA INSTANTANEA - PRESTO PRONTA 400G',15.00,660,1),
  (47,'ARROZ INTEGRAL - DOS HERMANOS 1KG',17.90,170,1),
  (48,'ARROZ LARGO FINO - LUCCHETTI 1KG',17.90,1700,1),
  (49,'PREMEZCLA PIZZA - PUREZA 550G',19.50,136,1),
  (50,'ENSALADA DE FRUTAS - ARCOR 300G',13.90,2600,1),
  (51,'MAYONESA - HELLMANNS 950CC',43.00,377,1),
  (52,'LENTEJAS - LA CAMPAGNOLA 320G',18.90,80,1),
  (53,'POROTOS - ARCOR 350G',16.90,230,1),
  (54,'ANANA - BAHIA 850G',89.90,570,1),
  (55,'KETCHUP - HELLMANNS 400G',31.00,240,1),
  (56,'SAL FINA - DOS ANCLAS 500G',11.90,960,1),
  (57,'MOSTAZA - SAVORA 370G',25.90,240,1),
  (58,'MILANESA DE SOJA - LUCCHETTI 4U',30.00,760,1),
  (59,'PAN RALLADO - MAMA COCINA 500G',16.00,330,1),
  (60,'TAPA PARA EMPANADAS - LA SALTEÑA 550G',35.00,700,1),
  (61,'MARGARINA - QUALY 250G',25.90,210,1),
  (62,'BOCADITOS DE POLLO - GRANJA DEL SOL 800G',149.00,160,1),
  (63,'PIZZA A LA PIEDRA - SIBARITA 470G ',110.00,500,1),
  (64,'ALIMENTO CONCENTRADO - DANONINO 2U',17.50,1200,1),
  (65,'YOGUR ENTERO BEBIBLE - MILKAUT 1000CC',19.90,340,1),
  (66,'QUESO MASCARPONE - LA SERENISIMA',32.00,90,1),
  (67,'QUESO PORT SALUT - LA SERENISIMA ',17.90,299,1),
  (68,'DULCE DE MEMBRILLO - ESNAOLA 1KG',64.90,290,1),
  (69,'FILET DE MERLUZA - GRANJA DEL SOL 500G',134.00,980,1),
  (70,'PREPIZZA - CARREFOUR 250G',16.90,450,1),
  (71,'BUDIN TIPO EUROPEO',42.90,100,1),
  (72,'SORRENTINOS - CARRAFOUR 600G',36.90,90,1),
  (73,'PATAS DE POLLO 1KG',29.90,179,1),
  (74,'BIFE DE CHORIZO 1KG',139.00,200,1),
  (75,'PECETO 1KG',139.00,200,1),
  (76,'JUGO EN POLVO - ARCOR 20G',2.80,20695,1),
  (77,'BEBIDA ISOTONICA - GATORADE 1250CC',25.90,1998,2),
  (78,'AGUA MINERAL - ECO DE LOS ANDES 2000CC',13.90,2895,2),
  (79,'JUGO - BAGGIO 1500CC',25.00,237,2),
  (80,'CERVEZA NEGRA - STELLA ARTOIS 975CC',45.00,5497,2),
  (81,'CERVEZA BLANCA - SCHNEIDER 1000CC',29.00,735,2),
  (82,'BEBIDA ENERGIZANTE - SPEED 250CC',18.00,2300,2),
  (83,'CERVEZA BLANCA - BRAHMA 473CC',19.00,3500,2),
  (84,'VINO - POSTALES 750CC',99.00,160,2),
  (85,'VINO - BENJAMIN NIETO 750CC',95.00,1100,2),
  (86,'VINO - TRAPICHE 750CC',69.00,820,2),
  (87,'VINO - NIETO SENETINER 750CC',150.00,658,2),
  (88,'VINO - DADA 750CC',80.00,380,2),
  (89,'FRIZANTE - FRIZEE EVOLUTION 750CC',49.00,920,2),
  (90,'SHAMPOO/ACONDICIONADOR - PANTENE 400CC',75.00,5698,4),
  (91,'SHAMPOO/ACONDICIONADOR - LOREAL ELVIVE 400CC',79.90,2600,4),
  (92,'SHAMPOO/ACONDICIONADOR - SEDAL 340CC',39.00,7400,4),
  (93,'SHAMPOO/ACONDICIONADOR - HEAD & SHOULDERS 400CC',83.00,2400,4),
  (94,'SHAMPOO/ACONDICIONADOR - DOVE 400CC',85.00,6200,4),
  (95,'SHAMPOO/ACONDICIONADOR - HERBAL ESSENCE 300CC',44.00,900,4),
  (96,'DESODORANTE AEROSOL - VERITAS 282G',61.00,560,4),
  (97,'CREMA DENTAL - COLGATE',39.50,2800,4),
  (98,'ANTITRANSPIRANTE AEROSOL - DOVE 150G',49.00,7198,4),
  (99,'CREMA DENTAL - COLSE UP 180G',69.90,510,4),
  (100,'ESPUMA PARA AFEITAR - VERITAS 214CC',49.00,100,4);
COMMIT;

#
# Data for the `usuarios` table  (LIMIT 0,500)
#

INSERT INTO `usuarios` (`id_usuarios`, `usuario`, `clave`) VALUES 
  (1,'ADMINISTRADOR','admin12345');
COMMIT;

#
# Data for the `empleados` table  (LIMIT 0,500)
#

INSERT INTO `empleados` (`id_empleados`, `nombre_empleado`, `apellido_empleado`, `dni_empleado`, `direccion_empleado`, `telefono_empleado`, `id_usuarios`) VALUES 
  (1,'NOMBRE ADMINISTRADOR','APELLIDO ADMINISTRADOR','12345678','DIRECCION ADMINISTRADOR','12345678',1);
COMMIT;

#
# Data for the `ventas` table  (LIMIT 0,500)
#

INSERT INTO `ventas` (`id_ventas`, `numero_factura`, `fecha_venta`, `total_venta`, `id_clientes`, `id_empleados`) VALUES 
  (1,1,'2017-08-11 11:43:13',2073.80,12,1);
COMMIT;

#
# Data for the `detalle_ventas` table  (LIMIT 0,500)
#

INSERT INTO `detalle_ventas` (`id_detalle_ventas`, `id_ventas`, `id_productos`, `cantidad_producto`) VALUES 
  (1,1,1,1),
  (2,1,67,1),
  (3,1,3,2),
  (4,1,38,3),
  (5,1,39,2),
  (6,1,42,2),
  (7,1,43,1),
  (8,1,51,3),
  (9,1,45,1),
  (10,1,49,4),
  (11,1,44,2),
  (12,1,37,1),
  (13,1,32,1),
  (14,1,2,2),
  (15,1,30,2),
  (16,1,34,1),
  (17,1,87,2),
  (18,1,78,5),
  (19,1,98,2),
  (20,1,90,2),
  (21,1,76,5),
  (22,1,73,1),
  (23,1,77,2),
  (24,1,79,3),
  (25,1,81,5),
  (26,1,80,3),
  (27,1,29,1);
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;