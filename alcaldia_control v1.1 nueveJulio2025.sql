-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-07-2025 a las 18:59:39
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alcaldia_control`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_personal`
--

CREATE TABLE `catalogo_personal` (
  `id` int(11) NOT NULL,
  `numero_empleado` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `puesto` varchar(100) NOT NULL,
  `departamento_jud` varchar(100) DEFAULT NULL,
  `dire_fisica` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `catalogo_personal`
--

INSERT INTO `catalogo_personal` (`id`, `numero_empleado`, `nombre`, `puesto`, `departamento_jud`, `dire_fisica`, `telefono`, `fecha_registro`, `ultima_actualizacion`) VALUES
(1, 'TEMP-1', 'LORENA', 'SECRETARIA', 'DESARROLLO DE SISTEMAS', NULL, NULL, '2025-05-21 17:43:29', '2025-06-26 18:57:07'),
(2, 'TEMP-2', 'a santiago', 'AUX SISTEMAS', 'DESARROLLO DE SISTEMAS', 'CALLE MONEDA SIN NUMERO', '5548857963', '2025-05-21 17:51:50', '2025-06-26 18:57:07'),
(5, 'TEMP-5', 'A SANTIAGO', 'AUX', 'DESARROLLO DE SISTEMAS', 'MONEDA SIN NUMERO', '556699887766', '2025-05-21 18:01:16', '2025-06-26 18:57:07'),
(7, 'TEMP-7', 'EMI', 'AUX', 'DESARROLLO DE SISTEMAS', 'MONEDA SIN NUMERO', '5566778899', '2025-05-21 18:05:22', '2025-06-26 18:57:07'),
(9, 'TEMP-9', 'RICARDO', 'AUX SISTEMAS', 'SOPORTE TECNICO', '', '', '2025-05-21 18:13:45', '2025-06-26 18:57:07'),
(24, 'TEMP-24', 'A SANTIAGO', 'PROGRAMACION', 'J.U.D. de Desarrollo de Sistemas', 'MONEDA S/NUMERO', '55112233665544', '2025-05-27 19:54:26', '2025-06-26 18:57:07'),
(25, 'TEMP-25', 'A SANTIAGO', 'AUX DE SERVICIOS', 'JUD de Desarrollo de Sistemas', 'MONEDA S/NUMERO', '55112233665544', '2025-05-28 18:37:17', '2025-06-26 18:57:07'),
(26, 'TEMP-26', 'a santiago', 'aux de sistemas', 'Desarrollo', 'av moneda s/numero', '548648653', '2025-06-03 20:27:05', '2025-06-26 18:57:07'),
(36, 'TEMP-36', 'BERNAL', 'AUX DE SERVICIOS', 'JUD de Desarrollo de Sistemas', 'CALLE MONEDA S/NUMERO', '454545466', '2025-06-12 20:35:34', '2025-06-26 18:57:07'),
(37, 'TEMP-37', 'luis', 'captura', 'Subdirección de Servicios Generales', 'MONEDA S/NUMERO', '787897845585', '2025-06-13 18:19:02', '2025-06-26 18:57:07'),
(38, 'TEMP-38', 'SERV', 'PROGRAMACION', 'J.U.D. de Desarrollo de Sistemas', 'MONEDA S/NUMERO', '528532554752575', '2025-06-13 19:53:13', '2025-06-26 18:57:07'),
(41, 'TEMP-41', 'DIRECTOR', 'DIRECTOR', 'DIRECCIÓN GENERAL DE ADMINISTRACIÓN Y FINANZAS', 'MONEDA S/NUMERO', '554565454642414', '2025-06-13 20:40:01', '2025-06-26 18:57:07'),
(42, 'TEMP-42', 'DIRECTOR', 'SUBDIRECTOR', 'Subdirección de Tecnologías de la Información y Comunicaciones', 'MONEDA S/NUMERO', '55112233665544', '2025-06-13 20:42:25', '2025-06-26 18:57:07'),
(43, 'TEMP-43', 'Jesus Melgoza', 'JUD DESARROLLO DE SISTEMAS', 'Subdirección de Tecnologías de la Información y Comunicaciones', 'MONEDA S/NUMERO', '4563214', '2025-06-25 18:06:50', '2025-06-26 18:57:07'),
(50, 'TEMP-50', 'Jesus Melgoza', 'JUD DESARROLLO DE SISTEMAS', 'Subdirección de Tecnologías de la Información y Comunicaciones', 'MONEDA S/NUMERO', '5521741979', '2025-06-26 18:28:41', '2025-06-26 18:57:07'),
(51, 'TEMP-51', 'Jesus Melgoza', 'JUD SOPORTE TECNICO', 'Subdirección de Tecnologías de la Información y Comunicaciones', 'MONEDA S/NUMERO', '4563214', '2025-06-26 18:31:52', '2025-06-26 18:57:07'),
(52, 'TEMP-52', 'A SANTIAGO', 'JUD SOPORTE TECNICO', 'Subdirección de Tecnologías de la Información y Comunicaciones', 'MONEDA S/NUMERO', '4563214', '2025-06-26 18:34:00', '2025-06-26 18:57:07'),
(53, 'TEMP-53', 'Jesus Melgoza', 'JUD SOPORTE TECNICO', 'Subdirección de Tecnologías de la Información y Comunicaciones', 'MONEDA S/NUMERO', '528532554752575', '2025-06-26 18:35:53', '2025-06-26 18:57:07'),
(55, 'TEMP-55', 'A SANTIAGO', 'AUX DE SERVICIOS', 'J.U.D. de Modernización Administrativa', 'MONEDA S/NUMERO', '4563214', '2025-06-26 18:37:38', '2025-06-26 18:57:07'),
(56, 'TEMP-56', 'A SANTIAGO', 'AUX DE SERVICIOS', 'Dirección de Administración de Capital Humano', 'MONEDA S/NUMERO', '4563214', '2025-06-26 18:38:46', '2025-06-26 18:57:07'),
(57, '1996', 'A SANTIAGO', 'AUX DE SERVICIOS', 'J.U.D. de Desarrollo de Sistemas', 'MONEDA S/NUMERO', '5510060676', '2025-06-26 19:42:48', '2025-06-26 19:42:48'),
(58, '1197767', 'Alexis Santiago Pérez', 'Desarrollo de sistemas', 'J.U.D. de Desarrollo de Sistemas', 'av moneda s/numero', '5548857306', '2025-07-08 16:49:14', '2025-07-08 16:49:14'),
(59, '1234567', 'jesus melgoza', 'JUD Desarrollo de sistemas', 'J.U.D. de Desarrollo de Sistemas', 'av moneda s/numero', '5548857355', '2025-07-08 21:01:09', '2025-07-08 21:01:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `valor` text NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `editable` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id` int(11) NOT NULL,
  `fecha_entrega` date NOT NULL,
  `fecha_recepcion` date DEFAULT NULL,
  `numero_oficio` varchar(50) NOT NULL,
  `remitente` varchar(100) NOT NULL,
  `cargo_remitente` varchar(100) NOT NULL,
  `depto_remitente` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `asunto` text NOT NULL,
  `tipo` enum('OFICIO','TURNO','CIRCULAR','NOTA_INFORMATIVA','CONOCIMIENTO') NOT NULL,
  `estatus` enum('SEGUIMIENTO','ATENDIDO','TURNADO') NOT NULL,
  `pdf_url` varchar(255) NOT NULL,
  `etapa` enum('RECIBIDO','RESPUESTA','ACUSE') DEFAULT 'RECIBIDO',
  `fecha_respuesta` date DEFAULT NULL,
  `destinatario` varchar(255) DEFAULT NULL,
  `usuario_responde` int(11) DEFAULT NULL,
  `usuario_acusa` int(11) DEFAULT NULL,
  `fecha_acuse` date DEFAULT NULL,
  `dire_fisica` varchar(255) DEFAULT NULL,
  `usuario_registra` int(11) DEFAULT NULL,
  `jud_destino` varchar(100) DEFAULT NULL,
  `numero_empleado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id`, `fecha_entrega`, `fecha_recepcion`, `numero_oficio`, `remitente`, `cargo_remitente`, `depto_remitente`, `telefono`, `asunto`, `tipo`, `estatus`, `pdf_url`, `etapa`, `fecha_respuesta`, `destinatario`, `usuario_responde`, `usuario_acusa`, `fecha_acuse`, `dire_fisica`, `usuario_registra`, `jud_destino`, `numero_empleado`) VALUES
(1, '2025-05-19', NULL, 'OFICINA1', 'A SANTIAGO', 'AUX SISTEMAS', 'DESARROLLO DE SISTEMAS', NULL, 'PRUEBA EN OFICINA 1', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/REVISION_DE_SERVIDOR_PARA_SIPS_2025_ALEXIS_SANTIAGO.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2025-05-19', NULL, 'PRUEBA2', 'SSANTIAGO', 'AUX SISTEMAS', 'DESARROLLO DE SISTEMAS', NULL, 'PRUEBA2 PARA VER CARGA CORRECTA PDF', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/REVISION_DE_SERVIDOR_PARA_SIPS_2025_ALEXIS_SANTIAGO.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2025-05-21', NULL, 'PRUBEA3', 'A SANTIAGO', 'AUX SISTEMAS', 'DESARROLLO DE SISTEMAS', NULL, 'PRUEBA 3 EN OTRO DIA PARA INICIAR NUEVAS PRUEBAS EL DIA DE HOY', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/Programacion-con-PHP.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2025-05-21', NULL, 'PRUEBA4', 'A SANTIAGO', 'AUX SISTEMAS', 'DESARROLLO DE SISTEMAS', NULL, 'SEGUNDA PRUEBA DEL DIA DE HOY PARA VER SU COMPORTAMIENTO', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/ServidorWebCentosNgix_v2.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2025-05-21', NULL, 'prueba 5', 'LORENA', 'SECRETARIA', 'DESARROLLO DE SISTEMAS', NULL, 'VERIFICACION PERSONAL JUDDS', 'NOTA_INFORMATIVA', 'TURNADO', 'pdfs/Algoritmo_SIPS_MAYO_2025.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2025-05-21', NULL, 'prueba 6', 'a santiago', 'AUX SISTEMAS', 'DESARROLLO DE SISTEMAS', NULL, 'VERIFICACION DE AUTOCPLETADO CATALOGO PERSONAL', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/CASO_DE_USO.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '2025-05-21', NULL, 'PRUEBA 6', 'A SANTIAGO', 'AUX SISTEMAS', 'DESARROLLO DE SISTEMAS', NULL, 'VERIFICACION DE AUTOCPLETADO PERSONA NO GUARDA ALGUNOS', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/NOTA_INFORMATIVA_ALEXIS_SANTIAGO_NIVEL_5_RH_.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2025-05-21', NULL, 'PRUEBA 7', 'A SANTIAGO', 'AUX SISTEMAS', 'DE', NULL, 'NO SE GUARDAN INFO EN AUTOCOMPLEETADO', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/Algoritmo_SIPS_MAYO_2025.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2025-05-22', NULL, '8', 'A SANTIAGO', 'AUX', 'DESARROLLO DE SISTEMAS', NULL, 'VERIFICACION DE AUTOCOMPLETADO', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/sabadoSIPS_POR_JESUS.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '2025-05-21', NULL, 'PRUEBA 9', 'A SANTIAGO', 'AUX SISTEMAS', 'DESARROLLO DE SISTEMAS', NULL, 'NO SE GUARDAN O SE RESCRIBEN', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/sabadoSIPS_POR_JESUS.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2025-05-21', NULL, 'PRUEBA 10', 'EMI', 'AUX', 'DESARROLLO DE SISTEMAS', NULL, 'SE SOOBREESCRIBEN DATOS AL PARECER', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/NOTA_INFORMATIVA_ALEXIS_SANTIAGO_NIVEL_5_RH_.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2025-05-21', NULL, 'PRUEBA 11', 'EMI', 'AUX', 'DESARROLLO DE SISTEMAS', NULL, 'SE SIGUE VERIFICANDO USO', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/NOTA_INFORMATIVA_ALEXIS_SANTIAGO_NIVEL_5_RH_.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2025-05-21', NULL, 'PRUEBA 12', 'RICARDO', 'AUX SISTEMAS', 'DESARROLLO DE SISTEMAS', NULL, 'SE SIGUEN LAS PRUEBAS DE SOBREESCRITURA', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/sabadoSIPS_POR_JESUS.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2024-05-22', NULL, 'prueba 13', 'A SANTIAGO', 'AUX SISTEMAS', 'Soporte tecnivo', NULL, 'PRUEBA DE ACTUALIZACION E HISTORIAL DE USUARIO', 'NOTA_INFORMATIVA', 'TURNADO', '', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '2025-05-22', NULL, 'PRUEBA 14', 'A SANTIAGO', 'AUX SISTEMAS', 'Soporte tecnivo', NULL, 'PRUEBA DE ACTUALIZACION E HISTORIAL DE USUARIO en el 13 no se reflejaba el pdf subido ni se actualiza la base de datos catalogo', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', '', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '2025-05-22', NULL, 'prueba 15', 'A SANTIAGO', 'AUX SISTEMAS', 'MODERNIZACION', NULL, 'PRUEBA DE ACTUALIZACION E HISTORIAL DE USUARIO en el 13 no se reflejaba el pdf subido ni se actualiza la base de datos DOCUMENTOS NO APARECE EL PDF_URL', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/doc_20250522_195703_682f656f3d988.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '2025-05-22', NULL, 'prueba 16', 'RICARDO', 'AUX SISTEMAS', 'SOPORTE TECNICO', NULL, 'PRUEBA DE ACTUALIZACION E HISTORIAL DE USUARIO en el 14 no se reflejaba el pdf subiDO', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250522_200421_682f6725eabe8.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '2025-05-27', NULL, 'PRUEBA 17', 'A SANTIAGO', 'AUX SISTEMAS', 'DESARROLLO DE SISTEMAS', '5548857963', 'SE AGREGAN USUARIOS, SE CORRIE SUBIDA PDF ADEMAS DE AGREGAR CARACTERISITICAS ADICIONALES', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250527_215058_683617a23ff9e.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, 'CALLE MONEDA SIN NUMERO', 1, NULL, NULL),
(19, '2025-05-27', NULL, 'prueba 18', 'A SANTIAGO', 'PROGRAMACION', 'ALCALDIA TLALPAN', '5548899665', 'SE CREA USUARIO ADMIN, PDF CORRECTO, HISTORIAL DE USUARIO,SE AGREGA TELEFONO Y SE REALIZAN PRUEBAS', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/doc_20250527_215426_683618725d2a2.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, 'VIVANCO SIN NUMERO', 1, NULL, NULL),
(20, '2025-05-28', NULL, 'PRUEBA 19', 'A SANTIAGO', 'AUX DE SERVICIOS', 'DESARROLLO DE SISTEMAS', '5513697876', 'SE AGREGAN MODULOS, SESIONES Y PRUEBAS DE SUBIDA PDF', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/doc_20250528_203717_683757dd0112a.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, 'CALLE MONEDA SIN NUMERO', 1, NULL, NULL),
(21, '2025-06-03', NULL, '20', 'a santiago', 'aux de sistemas', 'Desarrollo', '5565655625', 'prueba no me deja subir desde admin por falta de permisos', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/doc_20250603_222705_683f5a9932bd2.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, 'vivanco s/numero', 2, NULL, NULL),
(22, '2025-06-03', NULL, '21', 'a santiago', 'aux de sistemas', 'Desarrollo', '548648653', 'SI ME DEJA SUBIRLO DESDE JUDDS\r\nSISTEMAS NO\r\nSE REALIZA DESDE CAPTURISTA1', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250603_222907_683f5b1379e3d.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, 'av moneda s/numero', 3, NULL, NULL),
(23, '2025-06-06', NULL, '22', 'A SANTIAGO', 'AUX DE SERVICIOS', 'DESARROLLO DE SISTEMAS', '5548857606', 'Prueba de captura de datos, carga pdf y complementos de usuario desde judds\r\nADMIN MARCA PERMISOS DENEGADOS', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/doc_20250606_182852_684317442dcf3.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, 'MONEDA S/NUMERO', 2, NULL, NULL),
(24, '2025-06-06', NULL, '23', 'A SANTIAGO', 'AUX DE SERVICIOS', 'DESARROLLO DE SISTEMAS', '5548857606', 'Se debe ingresar con capturista1\r\nPrueba de carga de pdf', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/doc_20250606_184006_684319e66739c.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, 'MONEDA S/NUMERO', 3, NULL, NULL),
(25, '2025-06-09', NULL, '24', 'A SANTIAGO', 'AUX DE SERVICIOS', 'DESARROLLO DE SISTEMAS', '5548857606', 'captura de datos y carga de pdf\r\nDESDE ADMIN SIGUE DENEGANDO PERMISOS', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250609_220056_68473d7883290.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, 'MONEDA S/NUMERO', 2, NULL, NULL),
(26, '2025-06-09', NULL, '25', 'A SANTIAGO', 'AUX DE SERVICIOS', 'DESARROLLO DE SISTEMAS', '5548857606', 'captura de datos y carga de pdf \r\nADMIN NO SE PUEDE\r\nJUDDS SI SE PUEDE\r\nAHORA SE INTENTA POR CAPTURISTA1', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250609_220226_68473dd25356a.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, 'MONEDA S/NUMERO', 3, NULL, NULL),
(27, '2025-06-09', NULL, '25', 'A SANTIAGO', 'AUX DE SERVICIOS', 'DESARROLLO DE SISTEMAS', '55112233665544', 'Se realizan cambios y verificaciones para poder capturar y subir pdf desde usuario ADMIN/SISTEMAS', 'NOTA_INFORMATIVA', 'SEGUIMIENTO', 'pdfs/doc_20250609_224409_68474799dec7c.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, NULL, NULL),
(28, '2025-06-09', NULL, '26', 'A SANTIAGO', 'AUX DE SERVICIOS', 'DESARROLLO DE SISTEMAS', '55112233665544', 'Ya se puede capturar y subir desde usuario Admin/Sistemas, pero al momento de ir al historial no aparece en el, pero si en oficios registrados\r\nESTA PRUEBA ES DESDE JUDDS', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250609_224752_68474878bc18d.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, 'MONEDA S/NUMERO', 2, NULL, NULL),
(29, '2025-06-09', NULL, '27', 'A SANTIAGO', 'AUX DE SERVICIOS', 'DESARROLLO DE SISTEMAS', '55112233665544', 'Se logra capturar, guardar pdf e ingresar al historial desde cualquier usuario', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250609_225629_68474a7d2d64c.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, 'MONEDA S/NUMERO', 2, NULL, NULL),
(30, '2025-06-12', NULL, '28', 'A SANTIAGO', 'AUX DE SERVICIOS', 'JUD de Desarrollo de Sistemas', '55112233665544', 'SE AGREGAN CAMPOS \"JUD REMITENTE\" \"JUD DESTINO\"\r\nSE AGREGAN TAMBIEN EN LOS APARTADOS DE CATALOGO E HISTORIAL\r\nSE AGREGAN NOMBRES ACTUALES DE ORGANIGRAMA ALCALDIA PARA TENER LOS NOMBRES DE JUD\r\nSE REALIZAN PRUEBAS', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250612_223415_684b39c72affe.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, NULL, NULL),
(31, '2025-06-12', NULL, '29', 'BERNAL', 'AUX DE SERVICIOS', 'JUD de Desarrollo de Sistemas', '454545466', 'SE HACEN SEGUNDA PRUEBA PARA VER SU CARGA EN CATALOGO', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250612_223534_684b3a1680d81.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, 'CALLE MONEDA S/NUMERO', 1, NULL, NULL),
(32, '2025-06-13', NULL, '29', 'luis', 'captura', 'Subdirección de Servicios Generales', '787897845585', 'SE AGREGA ESTRUCUTRA DE 8. DIRECCIÓN GENERAL DE ADMINISTRACIÓN Y FINANZAS\r\n- NO SE REFLEJAN CAPTURAS EN APARTADO DE HISTORIAL Y CATALOGO\r\n', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250613_201902_684c6b9699d73.pdf', 'RECIBIDO', NULL, NULL, NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, NULL, NULL),
(33, '2025-06-13', NULL, '30', 'SERV', 'PROGRAMACION', 'J.U.D. de Desarrollo de Sistemas', '528532554752575', 'ESTE ES UNA PRUEBA PARA SABER SI SE GUARDA EN EL CATALOGO CORRECTAMENTE, ADEMAS DE\\r\\nQUITAR LA OPCION DE CAMBIAR EL DEPTO JUD EN EL MISMO CATALOGO, YA QUE ES \\r\\nEXCLUSIVAMENTE PARA VER EL HISTORIAL Y CAMBIO DE DEPTO DE LOS EMPLEADOS', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250613_215628_684c826c85910.pdf', 'RECIBIDO', NULL, 'PRUEBA', NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, 'J.U.D. de Soporte Técnico', NULL),
(34, '2025-06-13', NULL, '31', 'A SANTIAGO', 'PROGRAMACION', 'J.U.D. de Desarrollo de Sistemas', '55112233665544', 'SE AGREGA NUMERO DE EMPLEADO Y SE HACE EL IDENTIFICADOR\\r\\nSE COMPLEMENTA EL CATALOGO\\r\\nSE AGREGAN NOMBRES DE JUDS\\r\\n', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250613_223610_684c8bbac8863.pdf', 'RECIBIDO', NULL, 'PRUEBA', NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, 'Subdirección de Tecnologías de la Información y Comunicaciones', NULL),
(35, '2025-06-13', NULL, '32', 'DIRECTOR', 'DIRECTOR', 'DIRECCIÓN GENERAL DE ADMINISTRACIÓN Y FINANZAS', '554565454642414', 'ESTO ES UNA PRUEBA PARA VER SI SE GUARDAN DE MANERA INCREMENTAL LOS NUMEROS DE EMPLEADO\\r\\nYA QUE EN LA PRUEBA31 CON N° DE EMPLEADO 20 NO SE VE REFLEJADO EN EL CATALOGO DE PERSONAL\\r\\nEN EL HISTORIAL SI SE VE REFLEJADO PERO SIN EL NUMERO DE EMPLEADO', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250613_224001_684c8ca1c1da0.pdf', 'RECIBIDO', NULL, 'JESUS', NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, 'J.U.D. de Desarrollo de Sistemas', NULL),
(36, '2025-06-13', NULL, '32', 'DIRECTOR', 'SUBDIRECTOR', 'Subdirección de Tecnologías de la Información y Comunicaciones', '55112233665544', 'LA PRUEBA 31 NO SE VE REFLEJADO EL NUMERO (PORQUE SI SE VE EN DICHO CATALOGO)\\r\\nAHORA SE UTILIZA EL MISMO NUMEOR DE EMPLEADO 1 PARA VER SI ACTUALIZA SU DEPARTAMENTO AL QUE PERTENECE', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250613_224225_684c8d3120292.pdf', 'RECIBIDO', NULL, 'PRUEBA', NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, 'J.U.D. de Desarrollo de Sistemas', NULL),
(37, '2025-06-25', NULL, '33', 'Jesus Melgoza', 'JUD DESARROLLO DE SISTEMAS', 'J.U.D. de Desarrollo de Sistemas', '4563214', 'SE REALIZAN PRUEBAS DE CAPTURA DE DATOS PARA VERIFICAR FUNCIONAMIENTO;\\r\\nSe debe agregar el NUMERO DE EMPLEADO, esto para que se actualice su historial\\r\\nEsto se debe ver reflejado tanto en el historial como en el catalogo.\\r\\n', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250625_200650_685c3abac3182.pdf', 'RECIBIDO', NULL, 'A PRUEBA DE CATALOGO', NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, 'J.U.D. de Desarrollo de Sistemas', NULL),
(38, '2025-06-25', NULL, '34', 'Jesus Melgoza', 'JUD DESARROLLO DE SISTEMAS', 'J.U.D. de Desarrollo de Sistemas', '4563214', 'no se ve reflado el numero de empleado en catalogo esto para llevar su correcto historial de usuario.\\r\\n', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250625_205944_685c4720719de.pdf', 'RECIBIDO', NULL, 'A PRUEBA DE CATALOGO', NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, 'J.U.D. de Desarrollo de Sistemas', NULL),
(39, '2025-06-25', NULL, '35', 'Jesus Melgoza', 'JUD DESARROLLO DE SISTEMAS', 'J.U.D. de Desarrollo de Sistemas', '787897845585', 'Se hacen pruebas para ver si en jud destinatario aparece el destino correctamente.\\r\\n', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250625_221028_685c57b418372.pdf', 'RECIBIDO', NULL, 'A PRUEBA DE CATALOGO', NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, 'Subdirección de Tecnologías de la Información y Comunicaciones', NULL),
(40, '2025-06-25', NULL, '36', 'Jesus Melgoza', 'JUD DESARROLLO DE SISTEMAS', 'J.U.D. de Desarrollo de Sistemas', '4563214', 'se realizan pruebas exitosas aparecen ya los  recuadros con informacion correcta\\r\\nFALTA AÑADIR EL NUMERO DE EMPLEADO QUE SIGUE SIN APARECER PARA PODER INICIAR EL STATUS.\\r\\nTANTO CATALOGO COMO HISTORIAL FUNCIONAN CORRECTAMENTE', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250625_222740_685c5bbc22671.pdf', 'RECIBIDO', NULL, 'A PRUEBA DE CATALOGO', NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, 'Subdirección de Tecnologías de la Información y Comunicaciones', NULL),
(41, '2025-06-26', NULL, '37', 'Jesus Melgoza', 'JUD DESARROLLO DE SISTEMAS', 'J.U.D. de Desarrollo de Sistemas', '5521741979', 'se realizan pruebas de implementacion de N° empleado\\r\\n-Debe reflejarse en catalogo de personal\\r\\n-Ademas con esta funcion se podra ubicar el oficio segun el numero de empleado', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250626_202841_685d9159c7fb6.pdf', 'RECIBIDO', NULL, 'A PRUEBA DE CATALOGO', NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, 'Subdirección de Tecnologías de la Información y Comunicaciones', NULL),
(42, '2025-06-26', NULL, '37', 'Jesus Melgoza', 'JUD SOPORTE TECNICO', 'J.U.D. de Soporte Técnico', '4563214', '-SE LOGRA REGISTRAR NUMERO DE EMPLEADO\\r\\n-SE REVISA SI SE LLEVA EL HISTORIAL DE EMPLEADO CORRECTAMENTE ', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250626_203152_685d921841291.pdf', 'RECIBIDO', NULL, 'A PRUEBA DE CATALOGO', NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, 'Subdirección de Tecnologías de la Información y Comunicaciones', NULL),
(43, '2025-06-26', NULL, '38', 'A SANTIAGO', 'JUD SOPORTE TECNICO', 'J.U.D. de Soporte Técnico', '4563214', '-NO SE REGISTRO EL N° DE EMPLEADO Y SEPARA EL HISTORIAL AL CAMBIAR DE JUD', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250626_203400_685d92984c163.pdf', 'RECIBIDO', NULL, 'A PRUEBA DE CATALOGO', NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, 'Subdirección de Tecnologías de la Información y Comunicaciones', NULL),
(44, '2025-06-26', NULL, '39', 'Jesus Melgoza', 'JUD SOPORTE TECNICO', 'J.U.D. de Soporte Técnico', '528532554752575', 'NO SE REGISTRO EL N° DE EMPLEADO Y SEPARA EL HISTORIAL AL CAMBIAR DE JUD', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250626_203553_685d9309cb025.pdf', 'RECIBIDO', NULL, 'A PRUEBA DE CATALOGO', NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, 'Subdirección de Tecnologías de la Información y Comunicaciones', NULL),
(45, '2025-06-26', NULL, '40', 'A SANTIAGO', 'AUX DE SERVICIOS', 'J.U.D. de Desarrollo de Sistemas', '4563214', 'NO SE REGISTRO EL N° DE EMPLEADO Y SEPARA EL HISTORIAL', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250626_203738_685d937284e14.pdf', 'RECIBIDO', NULL, 'A PRUEBA DE CATALOGO', NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, 'J.U.D. de Modernización Administrativa', NULL),
(46, '2025-06-26', NULL, '41', 'A SANTIAGO', 'AUX DE SERVICIOS', 'J.U.D. de Soporte Técnico', '4563214', 'NO SE REGISTRO EL N° DE EMPLEADO Y SEPARA EL HISTORIAL AL CAMBIAR DE JUD', 'TURNO', 'SEGUIMIENTO', 'pdfs/doc_20250626_203846_685d93b69bb0f.pdf', 'RECIBIDO', NULL, 'A PRUEBA DE CATALOGO', NULL, NULL, NULL, 'MONEDA S/NUMERO', 1, 'Dirección de Administración de Capital Humano', NULL),
(47, '2025-07-08', NULL, 'OF-00052', 'Alexis Santiago Pérez', 'Desarrollo de sistemas', 'J.U.D. de Desarrollo de Sistemas', '5548857306', 'SIGUEN SIN REFLEJARSE LAS CAPTURAS DE DATOS', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250708_220154_686d79320ad66.pdf', 'RECIBIDO', NULL, 'Jesus Melgoza', NULL, NULL, NULL, 'av moneda s/numero', 1, 'J.U.D. de Servicios Generales y Apoyo Logístico', '1197767'),
(48, '2025-07-08', NULL, 'OF-00062', 'Alexis Santiago Pérez', 'Desarrollo de sistemas', 'J.U.D. de Desarrollo de Sistemas', '5548857306', 'SIGUEN SIN REFLEJARSE CAMBIOS', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250708_231114_686d897254994.pdf', 'RECIBIDO', NULL, 'PRUEBA', NULL, NULL, NULL, 'av moneda s/numero', 1, 'J.U.D. de Registro y Movimientos de Personal', '1197767'),
(49, '2025-07-08', NULL, 'OF-00063', 'Alexis Santiago Pérez', 'Desarrollo de sistemas', 'J.U.D. de Desarrollo de Sistemas', '5548857306', 'se reflejan cptura de datos\r\nSe intenta agregar historial correctamente', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250708_232020_686d8b9431726.pdf', 'RECIBIDO', NULL, 'PRUEBA', NULL, NULL, NULL, 'av moneda s/numero', 1, 'J.U.D. de Registro y Movimientos de Personal', '1197767'),
(50, '2025-07-08', NULL, 'OF-00064', 'Alexis Santiago Pérez', 'Desarrollo de sistemas', 'J.U.D. de Desarrollo de Sistemas', '5548857306', 'se reflejan cptura de datos\r\nSe intenta agregar historial correctamente 2', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250708_232145_686d8be997b82.pdf', 'RECIBIDO', NULL, 'PRUEBA', NULL, NULL, NULL, 'av moneda s/numero', 1, 'J.U.D. de Registro y Movimientos de Personal', '1197767'),
(51, '2025-07-08', NULL, 'OF-00068', 'Alexis Santiago Pérez', 'Desarrollo de sistemas', 'J.U.D. de Desarrollo de Sistemas', '5548857306', 'se reflejan cptura de datos Se intenta agregar historial correctamente 2', 'OFICIO', 'SEGUIMIENTO', 'pdfs/doc_20250708_234001_686d9031d7548.pdf', 'RECIBIDO', NULL, 'Jesus Melgoza', NULL, NULL, NULL, 'av moneda s/numero', 1, 'J.U.D. de Servicios Generales y Apoyo Logístico', '1197767');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_departamentos`
--

CREATE TABLE `historial_departamentos` (
  `id` int(11) NOT NULL,
  `personal_id` int(11) NOT NULL,
  `departamento_anterior` varchar(100) DEFAULT NULL,
  `departamento_nuevo` varchar(100) DEFAULT NULL,
  `fecha_cambio` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_registra` int(11) NOT NULL,
  `documento_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_departamentos`
--

INSERT INTO `historial_departamentos` (`id`, `personal_id`, `departamento_anterior`, `departamento_nuevo`, `fecha_cambio`, `usuario_registra`, `documento_id`) VALUES
(1, 2, 'DESARROLLO DE SISTEMAS', 'Soporte tecnivo', '2025-05-22 17:06:52', 0, NULL),
(2, 2, 'Soporte tecnivo', 'MODERNIZACION', '2025-05-22 17:47:04', 0, NULL),
(3, 9, 'DESARROLLO DE SISTEMAS', 'SOPORTE TECNICO', '2025-05-22 18:04:21', 0, NULL),
(4, 25, 'DESARROLLO DE SISTEMAS', 'JUD de Desarrollo de Sistemas', '2025-06-12 20:34:15', 1, NULL),
(5, 38, 'J.U.D. de Desarrollo de Sistemas', 'J.U.D. de Desarrollo de Sistemas', '2025-06-13 19:56:28', 1, NULL),
(6, 24, 'J.U.D. de Desarrollo de Sistemas', 'J.U.D. de Desarrollo de Sistemas', '2025-06-13 20:36:10', 1, NULL),
(7, 41, 'DIRECCIÓN GENERAL DE ADMINISTRACIÓN Y FINANZAS', 'DIRECCIÓN GENERAL DE ADMINISTRACIÓN Y FINANZAS', '2025-06-13 20:40:01', 1, NULL),
(8, 42, 'Subdirección de Tecnologías de la Información y Comunicaciones', 'Subdirección de Tecnologías de la Información y Comunicaciones', '2025-06-13 20:42:25', 1, NULL),
(9, 43, 'J.U.D. de Desarrollo de Sistemas', 'J.U.D. de Desarrollo de Sistemas', '2025-06-25 18:06:50', 1, NULL),
(10, 43, 'J.U.D. de Desarrollo de Sistemas', 'J.U.D. de Desarrollo de Sistemas', '2025-06-25 18:59:44', 1, NULL),
(11, 43, 'Subdirección de Tecnologías de la Información y Comunicaciones', 'J.U.D. de Desarrollo de Sistemas', '2025-06-25 20:10:28', 1, NULL),
(12, 43, 'Subdirección de Tecnologías de la Información y Comunicaciones', 'J.U.D. de Desarrollo de Sistemas', '2025-06-25 20:27:40', 1, NULL),
(13, 50, 'Subdirección de Tecnologías de la Información y Comunicaciones', 'J.U.D. de Desarrollo de Sistemas', '2025-06-26 18:28:41', 1, NULL),
(14, 51, 'Subdirección de Tecnologías de la Información y Comunicaciones', 'J.U.D. de Soporte Técnico', '2025-06-26 18:31:52', 1, NULL),
(15, 52, 'Subdirección de Tecnologías de la Información y Comunicaciones', 'J.U.D. de Soporte Técnico', '2025-06-26 18:34:00', 1, NULL),
(16, 53, 'Subdirección de Tecnologías de la Información y Comunicaciones', 'J.U.D. de Soporte Técnico', '2025-06-26 18:35:53', 1, NULL),
(17, 55, 'J.U.D. de Modernización Administrativa', 'J.U.D. de Desarrollo de Sistemas', '2025-06-26 18:37:38', 1, NULL),
(18, 56, 'Dirección de Administración de Capital Humano', 'J.U.D. de Soporte Técnico', '2025-06-26 18:38:46', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_laboral`
--

CREATE TABLE `historial_laboral` (
  `id` int(11) NOT NULL,
  `personal_id` int(11) NOT NULL,
  `accion` varchar(50) NOT NULL,
  `detalles` text DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_laboral`
--

INSERT INTO `historial_laboral` (`id`, `personal_id`, `accion`, `detalles`, `usuario_id`, `fecha`) VALUES
(1, 58, 'REGISTRO_OFICIO', 'Registro de oficio OF-00048. Departamento: J.U.D. de Desarrollo de Sistemas, Asunto: se siguen realizando pruebas...', 1, '2025-07-08 19:15:26'),
(2, 58, 'REGISTRO_OFICIO', 'Registro de oficio OF-00049. Departamento: J.U.D. de Desarrollo de Sistemas, Asunto: se siguen haciendo pruebas ya que no se refleja en catalogo, en la parteinferior de index, o histori...', 1, '2025-07-08 19:36:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jud_departamentos`
--

CREATE TABLE `jud_departamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `responsable` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jud_departamentos`
--

INSERT INTO `jud_departamentos` (`id`, `nombre`, `responsable`, `activo`) VALUES
(1, 'DIRECCIÓN GENERAL DE ADMINISTRACIÓN Y FINANZAS', NULL, 1),
(2, 'Dirección de Administración de Capital Humano', NULL, 1),
(3, 'Subdirección de Nóminas y Registro de Personal', NULL, 1),
(4, 'J.U.D. de Registro y Movimientos de Personal', NULL, 1),
(5, 'Subdirección de Relaciones Laborales y Capacitación', NULL, 1),
(6, 'J.U.D. de Capacitación y Desarrollo de Personal', NULL, 1),
(7, 'J.U.D. de Relaciones Laborales y Prestaciones', NULL, 1),
(8, 'Dirección de Autogenerados', NULL, 1),
(9, 'L.C.P. de Seguimiento e Informes', NULL, 1),
(10, 'Dirección de Finanzas', NULL, 1),
(11, 'Subdirección de Contabilidad', NULL, 1),
(12, 'J.U.D. de Registro Contable', NULL, 1),
(13, 'Subdirección de Programación y Presupuesto', NULL, 1),
(14, 'J.U.D. de Control Presupuestal', NULL, 1),
(15, 'Subdirección de Tesorería', NULL, 1),
(16, 'Dirección de Modernización Administrativa y Tecnologías de la Información y Comunicaciones', NULL, 1),
(17, 'Subdirección de Tecnologías de la Información y Comunicaciones', NULL, 1),
(18, 'J.U.D. de Modernización Administrativa', NULL, 1),
(19, 'J.U.D. de Desarrollo de Sistemas', NULL, 1),
(20, 'J.U.D. de Soporte Técnico', NULL, 1),
(21, 'Subdirección de Cumplimiento de Auditorías y Rendición de Cuentas', NULL, 1),
(22, 'Subdirección de Seguimiento de Proyectos Administrativos y Control de Gestión', NULL, 1),
(23, 'L.C.P. de Gestión Documental', NULL, 1),
(24, 'Dirección de Recursos Materiales y Servicios Generales', NULL, 1),
(25, 'J.U.D. de Almacenes e Inventarios', NULL, 1),
(26, 'Subdirección de Adquisiciones', NULL, 1),
(27, 'Subdirección de Servicios Generales', NULL, 1),
(28, 'J.U.D. de Control Vehicular, Talleres y Combustible', NULL, 1),
(29, 'J.U.D. de Servicios Generales y Apoyo Logístico', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs_sistema`
--

CREATE TABLE `logs_sistema` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `accion` varchar(100) NOT NULL,
  `detalles` text DEFAULT NULL,
  `ip` varchar(45) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `logs_sistema`
--

INSERT INTO `logs_sistema` (`id`, `usuario_id`, `accion`, `detalles`, `ip`, `fecha`) VALUES
(1, 1, 'DOCUMENTO_CREADO', 'Oficio 30', '::1', '2025-06-13 19:56:28'),
(2, 1, 'DOCUMENTO_CREADO', 'Oficio 31', '::1', '2025-06-13 20:36:10'),
(3, 1, 'DOCUMENTO_CREADO', 'Oficio 32', '::1', '2025-06-13 20:40:01'),
(4, 1, 'DOCUMENTO_CREADO', 'Oficio 32', '::1', '2025-06-13 20:42:25'),
(5, 1, 'DOCUMENTO_CREADO', 'Oficio 33', '::1', '2025-06-25 18:06:50'),
(6, 1, 'DOCUMENTO_CREADO', 'Oficio 34', '::1', '2025-06-25 18:59:44'),
(7, 1, 'DOCUMENTO_CREADO', 'Oficio 35', '::1', '2025-06-25 20:10:28'),
(8, 1, 'DOCUMENTO_CREADO', 'Oficio 36', '::1', '2025-06-25 20:27:40'),
(9, 1, 'DOCUMENTO_CREADO', 'Oficio 37', '::1', '2025-06-26 18:28:41'),
(10, 1, 'DOCUMENTO_CREADO', 'Oficio 37', '::1', '2025-06-26 18:31:52'),
(11, 1, 'DOCUMENTO_CREADO', 'Oficio 38', '::1', '2025-06-26 18:34:00'),
(12, 1, 'DOCUMENTO_CREADO', 'Oficio 39', '::1', '2025-06-26 18:35:53'),
(13, 1, 'DOCUMENTO_CREADO', 'Oficio 40', '::1', '2025-06-26 18:37:38'),
(14, 1, 'DOCUMENTO_CREADO', 'Oficio 41', '::1', '2025-06-26 18:38:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `usuario_id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `nivel_acceso` enum('LECTURA','ESCRITURA','TOTAL') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secuencia_oficios`
--

CREATE TABLE `secuencia_oficios` (
  `id` int(11) NOT NULL,
  `ultimo_numero` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `secuencia_oficios`
--

INSERT INTO `secuencia_oficios` (`id`, `ultimo_numero`) VALUES
(1, 68),
(2, 68);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temp_catalogo`
--

CREATE TABLE `temp_catalogo` (
  `id` int(11) DEFAULT NULL,
  `numero_empleado` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `puesto` varchar(100) NOT NULL,
  `departamento_jud` varchar(100) DEFAULT NULL,
  `dire_fisica` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `temp_catalogo`
--

INSERT INTO `temp_catalogo` (`id`, `numero_empleado`, `nombre`, `puesto`, `departamento_jud`, `dire_fisica`, `telefono`) VALUES
(5, NULL, 'A SANTIAGO', 'AUX', 'DESARROLLO DE SISTEMAS', 'MONEDA SIN NUMERO', '556699887766'),
(56, NULL, 'A SANTIAGO', 'AUX DE SERVICIOS', 'Dirección de Administración de Capital Humano', 'MONEDA S/NUMERO', '4563214'),
(55, NULL, 'A SANTIAGO', 'AUX DE SERVICIOS', 'J.U.D. de Modernización Administrativa', 'MONEDA S/NUMERO', '4563214'),
(25, NULL, 'A SANTIAGO', 'AUX DE SERVICIOS', 'JUD de Desarrollo de Sistemas', 'MONEDA S/NUMERO', '55112233665544'),
(26, NULL, 'a santiago', 'aux de sistemas', 'Desarrollo', 'av moneda s/numero', '548648653'),
(2, NULL, 'a santiago', 'AUX SISTEMAS', 'DESARROLLO DE SISTEMAS', 'CALLE MONEDA SIN NUMERO', '5548857963'),
(52, NULL, 'A SANTIAGO', 'JUD SOPORTE TECNICO', 'Subdirección de Tecnologías de la Información y Comunicaciones', 'MONEDA S/NUMERO', '4563214'),
(24, NULL, 'A SANTIAGO', 'PROGRAMACION', 'J.U.D. de Desarrollo de Sistemas', 'MONEDA S/NUMERO', '55112233665544'),
(36, NULL, 'BERNAL', 'AUX DE SERVICIOS', 'JUD de Desarrollo de Sistemas', 'CALLE MONEDA S/NUMERO', '454545466'),
(41, NULL, 'DIRECTOR', 'DIRECTOR', 'DIRECCIÓN GENERAL DE ADMINISTRACIÓN Y FINANZAS', 'MONEDA S/NUMERO', '554565454642414'),
(42, NULL, 'DIRECTOR', 'SUBDIRECTOR', 'Subdirección de Tecnologías de la Información y Comunicaciones', 'MONEDA S/NUMERO', '55112233665544'),
(7, NULL, 'EMI', 'AUX', 'DESARROLLO DE SISTEMAS', 'MONEDA SIN NUMERO', '5566778899'),
(43, NULL, 'Jesus Melgoza', 'JUD DESARROLLO DE SISTEMAS', 'Subdirección de Tecnologías de la Información y Comunicaciones', 'MONEDA S/NUMERO', '4563214'),
(50, NULL, 'Jesus Melgoza', 'JUD DESARROLLO DE SISTEMAS', 'Subdirección de Tecnologías de la Información y Comunicaciones', 'MONEDA S/NUMERO', '5521741979'),
(51, NULL, 'Jesus Melgoza', 'JUD SOPORTE TECNICO', 'Subdirección de Tecnologías de la Información y Comunicaciones', 'MONEDA S/NUMERO', '4563214'),
(53, NULL, 'Jesus Melgoza', 'JUD SOPORTE TECNICO', 'Subdirección de Tecnologías de la Información y Comunicaciones', 'MONEDA S/NUMERO', '528532554752575'),
(1, NULL, 'LORENA', 'SECRETARIA', 'DESARROLLO DE SISTEMAS', NULL, NULL),
(37, NULL, 'luis', 'captura', 'Subdirección de Servicios Generales', 'MONEDA S/NUMERO', '787897845585'),
(9, NULL, 'RICARDO', 'AUX SISTEMAS', 'SOPORTE TECNICO', '', ''),
(38, NULL, 'SERV', 'PROGRAMACION', 'J.U.D. de Desarrollo de Sistemas', 'MONEDA S/NUMERO', '528532554752575');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nombre_completo` varchar(100) DEFAULT NULL,
  `rol` enum('SISTEMAS','ADMIN','CAPTURISTA') DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultimo_acceso` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `nombre_completo`, `rol`, `departamento`, `activo`, `fecha_creacion`, `ultimo_acceso`) VALUES
(1, 'admin', '$2y$10$WBCaSgMZraXILd65Bnym..2P3S2QZTWmXApQjkSGYhG4ks6Ya90Oi', 'Administrador Principal', 'SISTEMAS', NULL, 1, '2025-05-29 17:15:33', NULL),
(2, 'judds', '$2y$10$2W7JFfRstQhcswqYgJHXyuZchIELRpGoTBETXzbg1lG2hL5/yV8UO', 'Administrador JUDDS', 'ADMIN', NULL, 1, '2025-05-29 17:15:33', NULL),
(3, 'capturista1', '$2y$10$OrPW2kExuEpctZUKO74X9eW3w/VfVuKxJZ7yLmsvqXLueZ93ubwBK', 'Capturista Principal', 'CAPTURISTA', NULL, 1, '2025-05-29 17:15:33', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catalogo_personal`
--
ALTER TABLE `catalogo_personal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_empleado` (`numero_empleado`),
  ADD UNIQUE KEY `uk_numero_empleado` (`numero_empleado`),
  ADD UNIQUE KEY `numero_empleado_2` (`numero_empleado`),
  ADD UNIQUE KEY `numero_empleado_3` (`numero_empleado`),
  ADD KEY `unique_nombre_puesto` (`nombre`,`puesto`) USING BTREE;

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clave` (`clave`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_departamentos`
--
ALTER TABLE `historial_departamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documento_id` (`documento_id`),
  ADD KEY `fk_personal` (`personal_id`);

--
-- Indices de la tabla `historial_laboral`
--
ALTER TABLE `historial_laboral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `fk_personal_lab` (`personal_id`);

--
-- Indices de la tabla `jud_departamentos`
--
ALTER TABLE `jud_departamentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `logs_sistema`
--
ALTER TABLE `logs_sistema`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`usuario_id`,`modulo_id`),
  ADD KEY `modulo_id` (`modulo_id`);

--
-- Indices de la tabla `secuencia_oficios`
--
ALTER TABLE `secuencia_oficios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catalogo_personal`
--
ALTER TABLE `catalogo_personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `historial_departamentos`
--
ALTER TABLE `historial_departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `historial_laboral`
--
ALTER TABLE `historial_laboral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `jud_departamentos`
--
ALTER TABLE `jud_departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `logs_sistema`
--
ALTER TABLE `logs_sistema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `secuencia_oficios`
--
ALTER TABLE `secuencia_oficios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial_departamentos`
--
ALTER TABLE `historial_departamentos`
  ADD CONSTRAINT `fk_personal` FOREIGN KEY (`personal_id`) REFERENCES `catalogo_personal` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historial_departamentos_ibfk_1` FOREIGN KEY (`personal_id`) REFERENCES `catalogo_personal` (`id`),
  ADD CONSTRAINT `historial_departamentos_ibfk_2` FOREIGN KEY (`documento_id`) REFERENCES `documentos` (`id`);

--
-- Filtros para la tabla `historial_laboral`
--
ALTER TABLE `historial_laboral`
  ADD CONSTRAINT `fk_personal_lab` FOREIGN KEY (`personal_id`) REFERENCES `catalogo_personal` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historial_laboral_ibfk_1` FOREIGN KEY (`personal_id`) REFERENCES `catalogo_personal` (`id`),
  ADD CONSTRAINT `historial_laboral_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `logs_sistema`
--
ALTER TABLE `logs_sistema`
  ADD CONSTRAINT `logs_sistema_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
