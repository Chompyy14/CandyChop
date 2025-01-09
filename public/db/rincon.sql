-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 11-12-2023 a las 02:01:37
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rincon`
--
CREATE DATABASE IF NOT EXISTS rincon;
USE rincon;
drop database rincon;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

DROP TABLE IF EXISTS `carrito`;

CREATE TABLE IF NOT EXISTS `carrito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `fecha_creacion` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_producto` (`id_producto`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Chicloso'),
(2, 'Macizo'),
(3, 'Otro Tipo'),
(4, 'Gomita'),
(5, 'Chocolate');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;

CREATE TABLE IF NOT EXISTS `compras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `id_direccion` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `fk_compras_direccion` (`id_direccion`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_compra`
--

DROP TABLE IF EXISTS `detalles_compra`;

CREATE TABLE IF NOT EXISTS `detalles_compra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_compra` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad_comprada` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_compra` (`id_compra`),
  KEY `id_producto` (`id_producto`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;

CREATE TABLE IF NOT EXISTS `direcciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `calle` varchar(64) DEFAULT NULL,
  `numero_exterior` varchar(10) DEFAULT NULL,
  `ciudad` varchar(64) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  `colonia` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE IF NOT EXISTS `marcas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`) VALUES
(1, 'De la Rosa'),
(2, 'Dulces Vero'),
(3, 'Ricolino'),
(4, 'Hersheys'),
(5, 'Kinder');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;

CREATE TABLE IF NOT EXISTS `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) DEFAULT NULL,
  `categoria` varchar(64) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `descripcion` varchar(64) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `marca` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `categoria`, `stock`, `descripcion`, `imagen`, `precio`, `marca`) VALUES
(1, 'Mazapan', 'Otro Tipo', 45, 'Dulce de cacahuate molido con azucar glass', 'images/dulces/mazapan.png', '70.00', 'De la Rosa'),
(2, 'Aciduladito', 'Chicloso', 50, 'Caramelos suaves con un toque acidulado', 'images/dulces/aciduladito.jpg', '70.00', 'De la Rosa'),
(3, 'Gummy Pop', 'Gomita', 74, 'Gomita en forma de llave de varios sabores', 'images/dulces/gummypop.png', '65.00', 'De la Rosa'),
(4, 'Rellerindos', 'Macizo', 192, 'Dulce macizo a base de tamarindo relleno', 'images/dulces/rellerindo.jpg', '80.00', 'Dulces Vero'),
(5, 'Pica Fresa', 'Chicloso', 150, 'Dulce chicloso sabor fresa picosa', 'images/dulces/picafresa.jpg', '90.00', 'Dulces Vero'),
(6, 'Vero Mix', 'Otro Tipo', 30, 'Surtido de dulces de la marca "Dulces Vero"', 'images/dulces/veromix.jpg', '14.50', 'Dulces Vero'),
(7, 'Panditas', 'Gomita', 20, 'Gomita de varios sabores en forma de panda', 'images/dulces/panditas.jpg', '100.00', 'Ricolino'),
(8, 'Kranky', 'Chocolate', 72, 'Hojuela de maiz cubierta de chocolate', 'images/dulces/kranky.jpg', '102.00', 'Ricolino'),
(9, 'Bubulubu', 'Chocolate', 40, 'Chocolate relleno de bombón y jalea de fresa', 'images/dulces/bubulubu.jpg', '97.00', 'Ricolino'),
(10, 'Cookies & Cream', 'Chocolate', 60, 'Chocolate sabor cookies & cream', 'images/dulces/cookies.jpg', '300.00', 'Hersheys'),
(11, 'Dark', 'Chocolate', 45, 'Chocolate amargo', 'images/dulces/dark.jpg', '250.00', 'Hersheys'),
(12, 'Almonds', 'Chocolate', 90, 'Chocolate combinado con almendras', 'images/dulces/almond.jpg', '280.00', 'Hersheys'),
(13, 'Nugs', 'Chocolate', 70, 'Chocolate combinado con almendras', 'images/dulces/nugs.png', '67.00', 'De la Rosa'),
(14, 'Delice', 'Chocolate', 167, 'Panquesito cubierto de chocolate', 'images/dulces/delice.jpg', '179.00', 'Kinder'),
(15, 'Chocolate', 'Chocolate', 140, 'Chocolate blanco cubierto de un chocolate de leche', 'images/dulces/kinder.jpg', '140.00', 'Kinder'),
(16, 'Sorpresa', 'Chocolate', 100, 'Chocolate en forma de huevo con juguete dentro', 'images/dulces/sorpresa.jpeg', '200.00', 'Kinder'),
(17, 'Paquete Diversión', 'Otro Tipo', 20, 'Surtido de dulces de la marca "Ricolino"', 'images/dulces/diversion.jpeg', '175.00', 'Ricolino'),
(18, 'Tarrito', 'Macizo', 100, 'Dulce en forma de tarro de cerveza', 'images/dulces/tarrito.jpg', '95.00', 'Dulces Vero');

delete from productos where id = 17;
delete from productos where id = 13;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) DEFAULT NULL,
  `correo` varchar(64) DEFAULT NULL,
  `tipo` enum('administrador','editor','cliente') DEFAULT NULL,
  `contrasenia` varchar(255) DEFAULT NULL,
  `salt` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

select * from users;
select * from productos;
select * from marcas;
select * from carrito;
select * from categorias;
select * from direcciones;
select * from compras;

UPDATE users
SET tipo = 'administrador'
WHERE id = 28;

UPDATE users
SET tipo = 'editor'
WHERE id = 29;
