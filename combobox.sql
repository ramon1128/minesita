-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2023 a las 21:18:46
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `combobox`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_localidad`
--

CREATE TABLE `t_localidad` (
  `id_localidad` int(11) NOT NULL,
  `id_municipio` int(45) DEFAULT NULL,
  `localidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_localidad`
--

INSERT INTO `t_localidad` (`id_localidad`, `id_municipio`, `localidad`) VALUES
(1, 3, 'González Catán'),
(2, 3, 'Virrey del Pino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_municipio`
--

CREATE TABLE `t_municipio` (
  `id_municipio` int(11) NOT NULL,
  `id_provincia` int(3) NOT NULL,
  `municipio` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_municipio`
--

INSERT INTO `t_municipio` (`id_municipio`, `id_provincia`, `municipio`) VALUES
(3, 1, 'La Matanza'),
(4, 1, 'Cañuelas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_provincia`
--

CREATE TABLE `t_provincia` (
  `id_provincia` int(11) NOT NULL,
  `provincia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_provincia`
--

INSERT INTO `t_provincia` (`id_provincia`, `provincia`) VALUES
(1, 'Buenos Aires'),
(2, 'CABA');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_localidad`
--
ALTER TABLE `t_localidad`
  ADD PRIMARY KEY (`id_localidad`),
  ADD KEY `id_municipio` (`id_municipio`);

--
-- Indices de la tabla `t_municipio`
--
ALTER TABLE `t_municipio`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `id_provincia` (`id_provincia`);

--
-- Indices de la tabla `t_provincia`
--
ALTER TABLE `t_provincia`
  ADD PRIMARY KEY (`id_provincia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `t_localidad`
--
ALTER TABLE `t_localidad`
  MODIFY `id_localidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_municipio`
--
ALTER TABLE `t_municipio`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `t_provincia`
--
ALTER TABLE `t_provincia`
  MODIFY `id_provincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_localidad`
--
ALTER TABLE `t_localidad`
  ADD CONSTRAINT `t_localidad_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `t_municipio` (`id_municipio`);

--
-- Filtros para la tabla `t_municipio`
--
ALTER TABLE `t_municipio`
  ADD CONSTRAINT `t_municipio_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `t_provincia` (`id_provincia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
