-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-07-2024 a las 01:56:15
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sis_ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idprod` int(11) NOT NULL,
  `empresa` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idprod`, `empresa`) VALUES
(1, 'VIVA'),
(2, 'TIGO'),
(3, 'ENTEL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `cod` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`cod`, `nom`, `edad`) VALUES
(1, 'Juan Perez', 30),
(2, 'Maria Gomez', 25),
(3, 'Luis Rodriguez', 28),
(4, 'Ana Morales', 35),
(5, 'Carlos Fernandez', 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `IDcorrelativo` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `cod` int(11) DEFAULT NULL,
  `idprod` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`IDcorrelativo`, `fecha`, `cod`, `idprod`, `valor`, `cantidad`) VALUES
(1, '2024-07-01', 1, 1, 100.00, 2),
(2, '2024-07-02', 2, 2, 150.50, 1),
(3, '2024-07-03', 3, 3, 200.75, 3),
(4, '2024-07-04', 4, 1, 50.25, 5),
(5, '2024-07-05', 5, 2, 300.10, 1),
(6, '2024-07-06', 1, 3, 120.60, 2),
(7, '2024-07-07', 2, 1, 90.90, 3),
(8, '2024-07-08', 3, 2, 80.40, 4),
(9, '2024-07-09', 4, 3, 110.30, 2),
(10, '2024-07-10', 5, 1, 60.50, 1),
(11, '2024-07-04', 5, 1, 5000.00, 2000),
(12, '2024-07-05', 5, 1, 500.90, 50),
(16, '2024-07-04', 3, 1, 500.00, 50),
(17, '2024-07-04', 3, 1, 500.00, 50),
(18, '2024-07-05', 4, 1, 666.00, 66);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idprod`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cod`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`IDcorrelativo`),
  ADD KEY `cod` (`cod`),
  ADD KEY `idprod` (`idprod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `IDcorrelativo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cod`) REFERENCES `usuarios` (`cod`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`idprod`) REFERENCES `productos` (`idprod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
