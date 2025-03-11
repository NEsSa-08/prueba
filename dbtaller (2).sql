-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-03-2025 a las 13:59:54
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbtaller`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

DROP TABLE IF EXISTS `alumno`;
CREATE TABLE IF NOT EXISTS `alumno` (
  `num_control` varchar(15) NOT NULL,
  `nombre_alumno` varchar(50) NOT NULL,
  `clave_proyecto` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`num_control`),
  KEY `clave_proyecto` (`clave_proyecto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`num_control`, `nombre_alumno`, `clave_proyecto`) VALUES
('21270161', 'Jose Enrique Villanueva Cruz', '2402-11'),
('21270158', 'Alejandro Penagos Gutiérrez', '2402-11'),
('19270181', 'Carlos Angel Selvas Gómez', '2402-01'),
('L20270250', 'Ángel Alberto Montejo Sánchez', '2402-17'),
('20271018', 'Mario Gamaliel Vicente Domínguez', '2402-17'),
('21270153', 'Anthony Hernández Rodríguez', '2402-14'),
('19270578', 'Luz elena Salas Wong', '2402-02'),
('21270185', 'Emanuel Nisi Pineda Rojas', '2402-04'),
('21270194', 'Jorge Eduardo Solar Zambrano', '2402-04'),
('20270267', 'José Armando Guillén Guillén', '2402-06'),
('21270168', 'Miguel Ángel González Rodríguez', '2402-06'),
('21270166', 'Armando de Jesús Arizmendis Nucamendi', '2402-22'),
('21270178', 'Luis Fernando Niño Morales', '2402-22'),
('20270762', 'Cristhian Josiane Cruz Moreno', '2402-07'),
('C15270381', 'Emmanuel Ruíz Valencia', '2402-07'),
('21270155', 'Alejandra Guadalupe López Jiménez', '2402-19'),
('19270137', 'Gema Yatzyri Gómez Sauceda', '2402-19'),
('21270162', 'Carlos Guillermo Zepeda Ortiz', '2402-23'),
('20270279', 'Wilver Adrián Garrido López', '2402-21'),
('20270266', 'Fabiola Janeth González López', '2402-21'),
('20270816', 'Anthony Yahir Pérez González', '2402-13'),
('20270805', 'Gabriel Hernández Conde', '2402-13'),
('20270763', 'Alexander Pérez Del Porte', '2402-15'),
('20270820', 'Heder Santiago Aguilar', '2402-15'),
('20270807', 'Fabián Hérnadez Zambrano', '2402-20'),
('21270189', 'Sherlyn Sánchez Pérez', '2402-20'),
('21270188', 'Yair Alejandro Ruíz Rodríguez', '2402-05'),
('20270769', 'José Alexander Gómez López', '2402-05'),
('20270256', 'José Carlos Pérez Franco', '2402-03'),
('20270259', 'Daniel Eduardo Suárez Navarro', '2402-03'),
('21270193', 'Ángel Eduardo Solano Gamboa', '2402-16'),
('21270169', 'Carlos Enrique Hernández de la Cruz', '2402-16'),
('21270320', 'Diego Ameth Hernández López', '2402-10'),
('20270825', 'Rodrigo Villatoro Ramos', '2402-10'),
('21270154', 'Cristian Eduardo Isidro Quiroz', '2402-08'),
('21270181', 'Juan Ovando Toledo', '2402-08'),
('21270183', 'Victor Abad Peña Rashid', '2402-09'),
('21270190', 'Osvaldo Sánchez Sánchez', '2402-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `derechos_acceso`
--

DROP TABLE IF EXISTS `derechos_acceso`;
CREATE TABLE IF NOT EXISTS `derechos_acceso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `objeto` varchar(255) DEFAULT NULL,
  `id_permiso` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_permiso` (`id_permiso`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `derechos_acceso`
--

INSERT INTO `derechos_acceso` (`id`, `id_usuario`, `objeto`, `id_permiso`) VALUES
(1, 1, 'proyecto', 4),
(2, 1, 'alumno', 4),
(3, 1, 'profesor', 4),
(4, 2, 'proyecto', 1),
(5, 2, 'proyecto', 3),
(6, 3, 'proyecto', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineainv`
--

DROP TABLE IF EXISTS `lineainv`;
CREATE TABLE IF NOT EXISTS `lineainv` (
  `clave_linea` int NOT NULL AUTO_INCREMENT,
  `nombre_linea` varchar(50) NOT NULL,
  PRIMARY KEY (`clave_linea`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `lineainv`
--

INSERT INTO `lineainv` (`clave_linea`, `nombre_linea`) VALUES
(1, 'RCISP'),
(2, 'TDWM'),
(3, 'DSIR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `id_permiso` int NOT NULL AUTO_INCREMENT,
  `nombre_permiso` enum('SELECT','INSERT','UPDATE','DELETE') NOT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permiso`, `nombre_permiso`) VALUES
(1, 'SELECT'),
(2, 'INSERT'),
(3, 'UPDATE'),
(4, 'DELETE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

DROP TABLE IF EXISTS `profesor`;
CREATE TABLE IF NOT EXISTS `profesor` (
  `clave_profesor` int NOT NULL AUTO_INCREMENT,
  `nombre_profesor` varchar(50) NOT NULL,
  PRIMARY KEY (`clave_profesor`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`clave_profesor`, `nombre_profesor`) VALUES
(1, 'Néstor Antonio Morales Navarro'),
(2, 'Madaín Pérez Patricio'),
(3, 'Aída Guillermina Cossio Martínez'),
(4, 'Germán Ríos Toledo'),
(5, 'Rosy Ilda Basave Torres'),
(6, 'Jesús Carlos Sánchez Guzmán'),
(7, 'Francisco de Jesús Suárez Ruíz'),
(8, 'Enrique Abel Sánchez Velázquez'),
(9, 'María Candelaria Gutiérrez Gómez'),
(10, 'Walter Torres Robledo'),
(11, 'Jorge Octavio Guzmán Sánchez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE IF NOT EXISTS `proyecto` (
  `clave_proyecto` varchar(10) NOT NULL,
  `nombre_proyecto` varchar(100) NOT NULL,
  `clave_linea` int DEFAULT NULL,
  `clave_tipo` int DEFAULT NULL,
  `clave_asesor` int DEFAULT NULL,
  `clave_revisor1` int DEFAULT NULL,
  `clave_revisor2` int DEFAULT NULL,
  PRIMARY KEY (`clave_proyecto`),
  KEY `clave_linea` (`clave_linea`),
  KEY `clave_tipo` (`clave_tipo`),
  KEY `clave_asesor` (`clave_asesor`),
  KEY `clave_revisor1` (`clave_revisor1`),
  KEY `clave_revisor2` (`clave_revisor2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`clave_proyecto`, `nombre_proyecto`, `clave_linea`, `clave_tipo`, `clave_asesor`, `clave_revisor1`, `clave_revisor2`) VALUES
('2402-11', 'Estimación de peso de ganado bovino mediante aprendizaje profundo', 1, 1, 1, 2, 3),
('2402-01', 'Sistema de prevención de alertas usando imágenes satelitales para desastres naturales', 1, 1, 2, 1, 4),
('2402-17', 'Prototipo de un vehículo robótico para la detección de malezas usando algoritmos de inteligencia art', 1, 1, 1, 2, 4),
('2402-14', 'Sistema en la Nube para la gestión y control de inventario mediante lectura de códigos QR', 2, 1, 5, 6, 7),
('2402-02', 'Diseño de infraestructura de redes y comunicaciones para el IEPC', 3, 1, 8, 6, 1),
('2402-04', 'PersonalFitnes: Aplicación web para rutinas de ejercicios personalizadas', 2, 1, 7, 6, 5),
('2402-06', 'Sistema de cotizaciones para la empresa \"Nativo, Texturas y Acabados\" con control de inventario de m', 3, 1, 6, 9, 7),
('2402-22', 'Plataforma web educativa para la enseñanza de prácticas en tecnologías IoT para la empresa Raccoon', 2, 1, 9, 6, 10),
('2402-07', 'Sistema de monitoreo para el desarrollo y cultivo de Pleurotus Ostreatus', 3, 1, 10, 11, 6),
('2402-19', 'Sistema administrativo web para el control de flujo de información de la empresa (SAE)', 2, 1, 12, 13, 14),
('2402-23', 'Prototipo de aplicación móvil para gestión de inscripciones anuales para la institución Colegio de I', 2, 1, 13, 14, 15),
('2402-21', 'Sistema de registro y análisis de partidas de ajedrez', 1, 1, 16, 14, 17),
('2402-13', 'Aplicación móvil para evaluación del desempeño de operaciones de operadores mediante la toma de tiem', 2, 1, 18, 4, 19),
('2402-15', 'Prototipo de modulo medidor de nivel de combustible y geolocalización de camiones de carga de la dis', 3, 1, 5, 7, 9),
('2402-20', 'Sistema de administración y control para un centro de análisis', 3, 1, 8, 1, 11),
('2402-05', 'Sistema de consulta de productos agrícolas mediante bases de datos vectoriales en ChromaDB', 1, 1, 4, 20, 19),
('2402-18', 'Sistema de información para la secundaria Juan Sabines en Tuxtla Gutiérrez', 2, 1, 16, 21, 17),
('2402-12', 'Sistema de control y seguimiento de actividades complementarias (ACOM 4)', 3, 1, 7, 9, 5),
('2402-03', 'Sistema de validación para facturación contable de la CFE', 2, 2, 22, 17, 21),
('2402-16', 'Aplicación web de gestión de tareas para proyectos de arquitectura integrada con Revit', 2, 1, 23, 21, 24),
('2402-10', 'Sistema de gestión de inventarios y ventas para la Ganadera la Herradura', 3, 1, 23, 21, 24),
('2402-08', 'Aplicación web para el CLE y su gestión del alumnado del ITTG', 2, 1, 12, 25, 23),
('2402-09', 'Diseño de la aplicación móvil para el CLE y la gestión de calificaciones del alumnado del ITTG', 2, 1, 12, 25, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Profesor'),
(3, 'Alumno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproyec`
--

DROP TABLE IF EXISTS `tipoproyec`;
CREATE TABLE IF NOT EXISTS `tipoproyec` (
  `clave_tipo` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`clave_tipo`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipoproyec`
--

INSERT INTO `tipoproyec` (`clave_tipo`, `nombre_tipo`) VALUES
(1, 'DT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `id_rol` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_rol` (`id_rol`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `id_rol`) VALUES
(1, 'admin1', 1),
(2, 'profesor1', 2),
(3, 'alumno1', 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
