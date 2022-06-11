-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2022 a las 23:57:48
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `supermecado_eltio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id_Cargo` int(11) NOT NULL,
  `descripcion` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_Cargo`, `descripcion`) VALUES
(1, 'Administrador/a'),
(2, 'Cajero/a'),
(3, 'Domiciliario/a'),
(4, 'Bodeguero/a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_online`
--

CREATE TABLE `cliente_online` (
  `id_ClienteOnline` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle` int(11) NOT NULL,
  `id_Venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deuda`
--

CREATE TABLE `deuda` (
  `id_Deuda` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `saldo` int(11) NOT NULL,
  `fecha_Venta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucion`
--

CREATE TABLE `devolucion` (
  `id_Devolucion` int(11) NOT NULL,
  `id_ClienteOnline` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_Factura` int(11) NOT NULL,
  `id_Venta` int(11) NOT NULL,
  `id_Detalle` int(11) NOT NULL,
  `id_tipoPago` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `magnitud`
--

CREATE TABLE `magnitud` (
  `id_magnitud` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `abreviatura` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `magnitud`
--

INSERT INTO `magnitud` (`id_magnitud`, `nombre`, `abreviatura`) VALUES
(1, 'kilogramo', 'kg'),
(2, 'libra', 'lb'),
(3, 'unidad', 'und'),
(4, 'litro', 'lt'),
(5, 'mililitros', 'ml'),
(6, 'gramos', 'g');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_Pedido` int(11) NOT NULL,
  `id_Usuario` int(11) NOT NULL,
  `id_ClienetOnline` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `monto` int(11) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `precio` int(11) NOT NULL,
  `existencias` int(11) NOT NULL,
  `cant_minima` int(11) NOT NULL,
  `id_magnitud` int(11) NOT NULL,
  `id_tipoProducto` int(11) NOT NULL,
  `cant_maxima` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `precio`, `existencias`, `cant_minima`, `id_magnitud`, `id_tipoProducto`, `cant_maxima`) VALUES
(1, 'Panela La renta', 700, 32, 10, 3, 5, 50),
(2, 'Arroz Zulia', 3600, 43, 15, 1, 5, 70),
(3, 'Harina Arepasan', 3700, 28, 12, 1, 5, 50),
(4, 'Arroz Ideal', 3500, 32, 15, 1, 5, 70),
(5, 'Azucar Riopaila', 4500, 19, 15, 1, 5, 45),
(6, 'Espaguetti Pugliese', 4000, 23, 12, 1, 5, 50),
(7, 'Papel Higienico Familia GrandePlus', 3300, 14, 10, 3, 2, 35),
(8, 'Jabón Ariel', 6400, 12, 8, 1, 2, 30),
(9, 'Gatorade', 3500, 13, 5, 3, 6, 20),
(10, 'Atún Altamar', 4200, 15, 10, 3, 4, 25),
(11, 'Papa pastusa', 1200, 13, 5, 1, 3, 60),
(12, 'Manzana gala', 1000, 12, 5, 3, 3, 25),
(13, 'Carne de Asar', 25000, 8, 5, 1, 1, 20),
(14, 'Lomo de cerdo', 23000, 9, 5, 1, 1, 15),
(15, 'Pechuga amarilla', 16000, 8, 5, 1, 1, 15),
(16, 'Cachama', 12000, 8, 5, 1, 1, 15),
(17, 'Salchicha Zenu', 4200, 12, 5, 3, 4, 15),
(18, 'Coca cola 350', 1800, 13, 10, 5, 6, 25),
(19, 'Maiz tierno', 4500, 12, 5, 3, 4, 20),
(20, 'Leche La Mejor', 2200, 16, 15, 4, 6, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_pedido`
--

CREATE TABLE `producto_pedido` (
  `id_prodPedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `cantXproducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE `tipopago` (
  `id_tipoPago` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproducto`
--

CREATE TABLE `tipoproducto` (
  `id_tipo` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipoproducto`
--

INSERT INTO `tipoproducto` (`id_tipo`, `nombre`, `descripcion`) VALUES
(1, 'Carnes', 'Esta categoría contiene los productos carnícos del'),
(2, 'Aseo y limpieza', 'Esta categoría contiene los productos de aseo y li'),
(3, 'Frutas y verduras', 'Esta categoría contiene las frutas y verduras del '),
(4, 'Enlatados', 'Esta categoría contiene los productos enlatados qu'),
(5, 'Víveres', 'Esta categoría contiene los productos viveres del '),
(6, 'Bebidas', 'Esta categoría contiene las bebidas vendidas en el');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_Usuario` int(11) NOT NULL,
  `id_Cargo` int(11) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_Usuario`, `id_Cargo`, `clave`, `nombre`, `telefono`, `direccion`) VALUES
(1, 1, 'adminsupertio', 'Rafael Sanchez', '3123123222', 'cll 44 Mz 5 la flor'),
(2, 2, 'cajerasupertio', 'Edilia Duarte', '3125637838', 'cll 23 Mz 10 la flor'),
(3, 3, 'domiciliariosupertio', 'Eduardo García Lemus', '3132646733', 'cll 12 Mz 34 la flor'),
(4, 4, 'bodegasupertio', 'Miguel Antonio caceres', '3002435277', 'Av 4 Mz 12 la flor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_Venta` int(11) NOT NULL,
  `fecha_Venta` datetime NOT NULL,
  `id_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_Venta`, `fecha_Venta`, `id_Usuario`) VALUES
(1, '2022-05-23 02:43:56', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventadevolucion`
--

CREATE TABLE `ventadevolucion` (
  `id_ventaDevolucion` int(11) NOT NULL,
  `id_Venta` int(11) NOT NULL,
  `id_Devolucion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventaonline`
--

CREATE TABLE `ventaonline` (
  `id_ventaOnline` int(11) NOT NULL,
  `id_Pedido` int(11) NOT NULL,
  `fechaVenta` datetime NOT NULL,
  `comprobante` blob NOT NULL,
  `tipoEntrega` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_devolucion_producto`
--

CREATE TABLE `venta_devolucion_producto` (
  `id_ventaDevolucion_producto` int(11) NOT NULL,
  `id_ventaDevolucion` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_Cargo`);

--
-- Indices de la tabla `cliente_online`
--
ALTER TABLE `cliente_online`
  ADD PRIMARY KEY (`id_ClienteOnline`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle`),
  ADD UNIQUE KEY `FK_id_Venta` (`id_Venta`),
  ADD UNIQUE KEY `FK_id_Producto` (`id_producto`);

--
-- Indices de la tabla `deuda`
--
ALTER TABLE `deuda`
  ADD PRIMARY KEY (`id_Deuda`),
  ADD UNIQUE KEY `FK_id_Venta` (`id_venta`);

--
-- Indices de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD PRIMARY KEY (`id_Devolucion`),
  ADD KEY `FK_id_ClienteOnline` (`id_ClienteOnline`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_Factura`),
  ADD KEY `FK_id_Venta` (`id_Venta`),
  ADD KEY `FK_id_Detalle` (`id_Detalle`),
  ADD KEY `FK_id_tipoPago` (`id_tipoPago`);

--
-- Indices de la tabla `magnitud`
--
ALTER TABLE `magnitud`
  ADD PRIMARY KEY (`id_magnitud`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_Pedido`),
  ADD UNIQUE KEY `FK_pedido_Usuario` (`id_Usuario`),
  ADD KEY `FK_pedido_ClienetOnline` (`id_ClienetOnline`) USING BTREE;

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `FK_id_tipoProducto` (`id_tipoProducto`),
  ADD KEY `FK_id_Magnitud` (`id_magnitud`);

--
-- Indices de la tabla `producto_pedido`
--
ALTER TABLE `producto_pedido`
  ADD PRIMARY KEY (`id_prodPedido`),
  ADD KEY `FK_id_Producto` (`id_producto`),
  ADD KEY `FK_id_Pedido` (`id_pedido`);

--
-- Indices de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD PRIMARY KEY (`id_tipoPago`);

--
-- Indices de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_Usuario`),
  ADD KEY `FK_id_Cargo` (`id_Cargo`) USING BTREE;

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_Venta`),
  ADD KEY `FK_id_Usuario` (`id_Usuario`);

--
-- Indices de la tabla `ventadevolucion`
--
ALTER TABLE `ventadevolucion`
  ADD PRIMARY KEY (`id_ventaDevolucion`),
  ADD KEY `FK_id_Devolucion` (`id_Devolucion`),
  ADD KEY `FK_id_Venta` (`id_Venta`);

--
-- Indices de la tabla `ventaonline`
--
ALTER TABLE `ventaonline`
  ADD PRIMARY KEY (`id_ventaOnline`),
  ADD UNIQUE KEY `FK_id_Factura` (`id_factura`),
  ADD KEY `FK_id_Pedido` (`id_Pedido`);

--
-- Indices de la tabla `venta_devolucion_producto`
--
ALTER TABLE `venta_devolucion_producto`
  ADD PRIMARY KEY (`id_ventaDevolucion_producto`),
  ADD KEY `FK_id_Producto` (`id_producto`),
  ADD KEY `FK_id_VentaDevolucion` (`id_ventaDevolucion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_Cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cliente_online`
--
ALTER TABLE `cliente_online`
  MODIFY `id_ClienteOnline` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `deuda`
--
ALTER TABLE `deuda`
  MODIFY `id_Deuda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  MODIFY `id_Devolucion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_Factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `magnitud`
--
ALTER TABLE `magnitud`
  MODIFY `id_magnitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_Pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `producto_pedido`
--
ALTER TABLE `producto_pedido`
  MODIFY `id_prodPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  MODIFY `id_tipoPago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_Venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventadevolucion`
--
ALTER TABLE `ventadevolucion`
  MODIFY `id_ventaDevolucion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventaonline`
--
ALTER TABLE `ventaonline`
  MODIFY `id_ventaOnline` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_devolucion_producto`
--
ALTER TABLE `venta_devolucion_producto`
  MODIFY `id_ventaDevolucion_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `FK_detalle_Producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_detalle_Venta` FOREIGN KEY (`id_Venta`) REFERENCES `venta` (`id_Venta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `deuda`
--
ALTER TABLE `deuda`
  ADD CONSTRAINT `FK_deuda_Venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_Venta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD CONSTRAINT `FK_devolucion_ClienteOnline` FOREIGN KEY (`id_ClienteOnline`) REFERENCES `cliente_online` (`id_ClienteOnline`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `FK_factura_Detalle` FOREIGN KEY (`id_Detalle`) REFERENCES `detalle_venta` (`id_detalle`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_factura_Venta` FOREIGN KEY (`id_Venta`) REFERENCES `venta` (`id_Venta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_factura_tipoPago` FOREIGN KEY (`id_tipoPago`) REFERENCES `tipopago` (`id_tipoPago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_pedido_Usuario` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_pedido_ClienetOnline` FOREIGN KEY (`id_ClienetOnline`) REFERENCES `cliente_online` (`id_ClienteOnline`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_producto_Magnitud` FOREIGN KEY (`id_magnitud`) REFERENCES `magnitud` (`id_magnitud`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_producto_tipoProducto` FOREIGN KEY (`id_tipoProducto`) REFERENCES `tipoproducto` (`id_tipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto_pedido`
--
ALTER TABLE `producto_pedido`
  ADD CONSTRAINT `FK_pp_Pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_Pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pp_Producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_usuario_Cargo` FOREIGN KEY (`id_Cargo`) REFERENCES `cargo` (`id_Cargo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `FK_venta_Usuario` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventadevolucion`
--
ALTER TABLE `ventadevolucion`
  ADD CONSTRAINT `FK_ventad_Devolucion` FOREIGN KEY (`id_Devolucion`) REFERENCES `devolucion` (`id_Devolucion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ventad_Venta` FOREIGN KEY (`id_Venta`) REFERENCES `venta` (`id_Venta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventaonline`
--
ALTER TABLE `ventaonline`
  ADD CONSTRAINT `FK_ventaonline_Factura` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_Factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ventaonline_Pedido` FOREIGN KEY (`id_Pedido`) REFERENCES `pedido` (`id_Pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta_devolucion_producto`
--
ALTER TABLE `venta_devolucion_producto`
  ADD CONSTRAINT `FK_vdp_Producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_vdp_VentaDevolucion` FOREIGN KEY (`id_ventaDevolucion`) REFERENCES `ventadevolucion` (`id_ventaDevolucion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
