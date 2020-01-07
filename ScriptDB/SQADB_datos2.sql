-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-05-2018 a las 18:15:30
-- Versión del servidor: 5.7.20
-- Versión de PHP: 7.1.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `SQADB`
--

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(112, 'Can add site', 28, 'add_site'),
(113, 'Can change site', 28, 'change_site'),
(114, 'Can delete site', 28, 'delete_site'),
(115, 'Can add log entry', 1, 'add_logentry'),
(116, 'Can change log entry', 1, 'change_logentry'),
(117, 'Can delete log entry', 1, 'delete_logentry'),
(118, 'Can add group', 2, 'add_group'),
(119, 'Can change group', 2, 'change_group'),
(120, 'Can delete group', 2, 'delete_group'),
(121, 'Can add permission', 3, 'add_permission'),
(122, 'Can change permission', 3, 'change_permission'),
(123, 'Can delete permission', 3, 'delete_permission'),
(124, 'Can add user', 4, 'add_user'),
(125, 'Can change user', 4, 'change_user'),
(126, 'Can delete user', 4, 'delete_user'),
(127, 'Can add content type', 5, 'add_contenttype'),
(128, 'Can change content type', 5, 'change_contenttype'),
(129, 'Can delete content type', 5, 'delete_contenttype'),
(130, 'Can add session', 6, 'add_session'),
(131, 'Can change session', 6, 'change_session'),
(132, 'Can delete session', 6, 'delete_session'),
(133, 'Can add fase', 7, 'add_fase'),
(134, 'Can change fase', 7, 'change_fase'),
(135, 'Can delete fase', 7, 'delete_fase'),
(136, 'Puede actualizar archivos de la fase de análisis', 7, 'can_update_analisis_file'),
(137, 'Puede actualizar archivos de la fase de evaluación', 7, 'can_update_evaluacion_file'),
(138, 'Puede actualizar archivos de la fase de diseño', 7, 'can_update_diseno_file'),
(139, 'Puede actualizar archivos de la fase de desarrollo', 7, 'can_update_desarrollo_file'),
(140, 'Puede actualizar archivos de la fase de pruebas', 7, 'can_update_pruebas_file'),
(141, 'Puede actualizar archivos de la fase de liberación', 7, 'can_update_liberacion_file'),
(142, 'Puede actualizar archivos de la fase de cierre', 7, 'can_update_cierre_file'),
(143, 'Can add estatus de productos', 9, 'add_estatusdeproductos'),
(144, 'Can change estatus de productos', 9, 'change_estatusdeproductos'),
(145, 'Can delete estatus de productos', 9, 'delete_estatusdeproductos'),
(146, 'Can add metrica', 10, 'add_metrica'),
(147, 'Can change metrica', 10, 'change_metrica'),
(148, 'Can delete metrica', 10, 'delete_metrica'),
(149, 'Can add rol', 11, 'add_rol'),
(150, 'Can change rol', 11, 'change_rol'),
(151, 'Can delete rol', 11, 'delete_rol'),
(152, 'Can add historico de metrica', 27, 'add_historicodemetrica'),
(153, 'Can change historico de metrica', 27, 'change_historicodemetrica'),
(154, 'Can delete historico de metrica', 27, 'delete_historicodemetrica'),
(155, 'Can add producto de trabajo de fase', 23, 'add_productodetrabajodefase'),
(156, 'Can change producto de trabajo de fase', 23, 'change_productodetrabajodefase'),
(157, 'Can delete producto de trabajo de fase', 23, 'delete_productodetrabajodefase'),
(158, 'Puede actualizar el archivo del producto de trabajo', 23, 'can_update_file'),
(159, 'Puede autorizar cumplimiento de criterios', 23, 'can_commit_acceptance_criteria'),
(160, 'Can add estatus de acciones correctivas', 31, 'add_estatusdeaccionescorrectivas'),
(161, 'Can change estatus de acciones correctivas', 31, 'change_estatusdeaccionescorrectivas'),
(162, 'Can delete estatus de acciones correctivas', 31, 'delete_estatusdeaccionescorrectivas'),
(163, 'Can add criterio de producto', 13, 'add_criteriodeproducto'),
(164, 'Can change criterio de producto', 13, 'change_criteriodeproducto'),
(165, 'Can delete criterio de producto', 13, 'delete_criteriodeproducto'),
(166, 'Puede actualizar el estatus del criterio de producto', 13, 'can_update_product_criteria'),
(167, 'Can add evento de proyecto', 14, 'add_eventodeproyecto'),
(168, 'Can change evento de proyecto', 14, 'change_eventodeproyecto'),
(169, 'Can delete evento de proyecto', 14, 'delete_eventodeproyecto'),
(170, 'Can add metrica de producto', 15, 'add_metricadeproducto'),
(171, 'Can change metrica de producto', 15, 'change_metricadeproducto'),
(172, 'Can delete metrica de producto', 15, 'delete_metricadeproducto'),
(173, 'Can add accion correctiva de metrica', 30, 'add_accioncorrectivademetrica'),
(174, 'Can change accion correctiva de metrica', 30, 'change_accioncorrectivademetrica'),
(175, 'Can delete accion correctiva de metrica', 30, 'delete_accioncorrectivademetrica'),
(176, 'Ver las acciones correctivas realizadas.', 30, 'can_see_actions'),
(177, 'Can add criterio de aceptacion', 16, 'add_criteriodeaceptacion'),
(178, 'Can change criterio de aceptacion', 16, 'change_criteriodeaceptacion'),
(179, 'Can delete criterio de aceptacion', 16, 'delete_criteriodeaceptacion'),
(180, 'Can add rol de proyecto', 18, 'add_roldeproyecto'),
(181, 'Can change rol de proyecto', 18, 'change_roldeproyecto'),
(182, 'Can delete rol de proyecto', 18, 'delete_roldeproyecto'),
(183, 'Can add evento', 19, 'add_evento'),
(184, 'Can change evento', 19, 'change_evento'),
(185, 'Can delete evento', 19, 'delete_evento'),
(186, 'Can add fase de proyecto', 20, 'add_fasedeproyecto'),
(187, 'Can change fase de proyecto', 20, 'change_fasedeproyecto'),
(188, 'Can delete fase de proyecto', 20, 'delete_fasedeproyecto'),
(189, 'Can add rango de metrica', 29, 'add_rangodemetrica'),
(190, 'Can change rango de metrica', 29, 'change_rangodemetrica'),
(191, 'Can delete rango de metrica', 29, 'delete_rangodemetrica'),
(192, 'Can add formato', 26, 'add_formato'),
(193, 'Can change formato', 26, 'change_formato'),
(194, 'Can delete formato', 26, 'delete_formato'),
(195, 'Can add producto de trabajo', 22, 'add_productodetrabajo'),
(196, 'Can change producto de trabajo', 22, 'change_productodetrabajo'),
(197, 'Can delete producto de trabajo', 22, 'delete_productodetrabajo'),
(198, 'Can add proyecto', 24, 'add_proyecto'),
(199, 'Can change proyecto', 24, 'change_proyecto'),
(200, 'Can delete proyecto', 24, 'delete_proyecto');

--
-- Volcado de datos para la tabla `criterios_de_aceptacion`
--

INSERT INTO `criterios_de_aceptacion` (`id`, `nombre`, `descripcion`, `tipo`) VALUES
(1, 'Nivel de alcance de requisitos', 'Que los requisitos sean alcanzables en el contexto de tiempo y tecnología del equipo y proyecto.', 'documentación'),
(2, 'Nivel de detalle', 'Que contenga los campos adecuados que permitan identificar quien lo hizo, para que, cuando, quien involucra, que acuerdos se tomaron, que compromisos se adquirieron, etc.', 'Documentación'),
(3, 'Completitud', 'Evaluar que todos los campos obligatorios estén correctamente llenados.', 'Documentación'),
(7, 'Revisión por pares', 'Un compañero revisa el contenido o funcionamiento del producto para verificar el cumplimiento de los requisitos.', 'Funcional'),
(8, 'No ambigüedad', 'Que sea claramente identificable, verificable y medible.', 'Documentación'),
(9, 'Formato correcto', 'Que el formato utilizado para el documento sea acorde al contexto de la empresa.', 'Documentación'),
(10, 'Credenciales de acceso correctas', 'Evaluar que el nivel de acceso de los usuarios sea el adecuado con respecto a sus funciones.', 'Seguridad'),
(11, 'Pruebas en diferentes ambientes', 'Realizar pruebas de despliegue en varios ambientes de producción.', 'Funcionalidad'),
(12, 'Politicas de seguridad', 'Revisar que se apliquen políticas de seguridad adecuadas al contexto del proyecto en la elaboración y manejo del producto de trabajo.', 'Seguridad'),
(14, 'Revisiones de diseño', 'Realizar pruebas de concepto a la interfaz de usuario del sistema.', 'Usabilidad'),
(15, 'Revisión de código', 'Un compañero revisa el contenido de los módulos de código para verificar la estructura y estilo.', 'Mantenimiento'),
(16, 'Pruebas de seguridad', 'Se ejecutan pruebas para verificar adecuada protección a ataques como: fuerza bruta, cross scripting, etc.', 'Seguridad'),
(17, 'Manejo de excepciones', 'Se revisa que en los módulos de código se haga uso de excepciones para controlar acciones criticas o vulnerables a fallos en el sistema.', 'Funcionamiento'),
(18, 'Conocimiento técnico', 'Revisar que los desarrolladores cuenten con el conocimiento técnico necesario para realizar la funcionalidad requerida.', ''),
(19, 'Comunicación adecuada', 'Verificar que existan canales adecuados para la comunicación entre el equipo y hacia el cliente, en la elaboración de este producto de trabajo.', 'Equipo');

--
-- Volcado de datos para la tabla `estatus_de_acciones_correctivas`
--

INSERT INTO `estatus_de_acciones_correctivas` (`id`, `valor`, `nombre`) VALUES
(1, 0, 'En ejecución'),
(2, 1, 'Aplicado sin resultados'),
(3, 2, 'Aplicado con resultados postivos');

--
-- Volcado de datos para la tabla `estatus_de_productos`
--

INSERT INTO `estatus_de_productos` (`id`, `valor`, `nombre`, `descripcion`) VALUES
(1, 0, 'Inicializado', 'El producto ya fue registrado pero falta ajustar o agregar documento físico.'),
(2, 1, 'Producto agregado', 'El documento se encuentra disponible para revisar.'),
(3, 2, 'Revisado internamente', 'El documento fue revisado por el equipo de trabajo.'),
(4, 3, 'Autorizado por cliente', 'Vestibulum hendrerit consequat finibus. Aliquam sit amet accumsan nunc. Sed condimentum, leo in accumsan malesuada, metus ex dictum purus, nec rutrum metus lacus at arcu. Aliquam erat volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent gravida lacus sed mauris ornare laoreet. Nunc viverra finibus dapibus. Suspendisse pellentesque mi tortor, nec volutpat massa venenatis ut. Quisque lobortis mi orci.'),
(5, 4, 'Verificado', 'El documento se encuentra autorizado y autorizado por el cliente.'),
(6, 5, 'Cerrado', 'El documento ya se encuentra finalizado y no se permiten cambios.');

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Reunión interna', 'Se realiza con las personas que participan en el proyecto tanto equipo de trabajo como administradores de proyecto.'),
(2, 'Reunion externa', 'Se realiza con el cliente o personas externas a la organización que están involucradas en el proyecto.'),
(3, 'Revisión', 'Se realiza con el equipo de trabajo y el cliente.'),
(4, 'Liberación de módulo', 'Se entrega un fragmento funcional del sistema.'),
(5, 'Entrega de producto', 'Se entrega el producto final al cliente para finalizar el proyecto.'),
(6, 'Auditoria interna', 'Se realiza por responsables del seguimiento que pertenecen a la organización.'),
(7, 'Auditoria externa', 'Se realiza por revisores externos a la organización.'),
(8, 'Termino de fase', 'Se da por terminado un periodo de tiempo en el proyecto que contiene una serie de entregables y producto.'),
(9, 'Cierre de proyecto', 'Se da por terminado el desarrollo y se formaliza el cierre de proyecto.');

--
-- Volcado de datos para la tabla `fases`
--

INSERT INTO `fases` (`id`, `nombre`, `objetivo`, `permiso_de_fase_id`) VALUES
(1, 'Evaluación', 'Evaluar los documentos de gestión de riesgos, el cual es verificado contra los criterios de aceptación establecidos y se evalúan los resultados de medición de los documentos de gestión de riesgos.', 137),
(3, 'Análisis', 'Verificar y validar requisitos, verificar contenido de documento de requisitos, así como evaluar las mediciones realizadas.', 136),
(4, 'Desarrollo', 'Evaluar el cumplimiento de los requisitos y diseño del sistema contra el código fuente y el cumplimiento de los criterios de aceptación.', 139),
(6, 'Diseño', 'Verificar y validar el diseño del sistema y evaluar resultados de medición en diseño de sistema.', 138),
(7, 'Pruebas', 'Evaluar los resultados de las pruebas y contenido de reportes de pruebas, obtener los indices de calidad asociados a las pruebas.', 140),
(9, 'Liberación', 'Evaluar el procedimiento de entrega y evidencia generada.', 141),
(10, 'Cierre', 'Evaluar contenido en el documento de cierre del proyecto.', 142);

--
-- Volcado de datos para la tabla `fases_productos_de_trabajo`
--

INSERT INTO `fases_productos_de_trabajo` (`id`, `fase_id`, `productodetrabajo_id`) VALUES
(13, 1, 2),
(14, 3, 1),
(15, 4, 1),
(16, 4, 3),
(17, 4, 6),
(18, 6, 1),
(19, 6, 6),
(21, 7, 1),
(22, 7, 7),
(20, 7, 8),
(23, 9, 9),
(24, 10, 10);

--
-- Volcado de datos para la tabla `fases_roles`
--

INSERT INTO `fases_roles` (`id`, `fase_id`, `rol_id`) VALUES
(26, 1, 5),
(27, 1, 6),
(28, 3, 1),
(29, 3, 6),
(30, 4, 3),
(31, 4, 6),
(32, 6, 2),
(33, 6, 6),
(34, 7, 4),
(35, 7, 6),
(36, 9, 5),
(37, 9, 6),
(38, 10, 5),
(39, 10, 6);

--
-- Volcado de datos para la tabla `formatos`
--

INSERT INTO `formatos` (`id`, `mimeType`, `extension`, `programa`) VALUES
(1, 'application/msword', 'doc', 'Microsoft Word'),
(2, 'image/jpeg', 'jpg', 'JPG images'),
(3, 'application/pdf', 'pdf', 'Portable Document Format (PDF)'),
(4, 'application/vnd.ms-excel', 'xls', 'Microsoft Excel'),
(5, 'application/zip', 'zip', 'ZIP archive'),
(6, 'text/plain', 'txt', 'Text document'),
(7, 'text/x-python-script', 'py', 'Python document'),
(8, 'image/jpeg', 'jpeg', 'JPEG images');

--
-- Volcado de datos para la tabla `metricas`
--

INSERT INTO `metricas` (`id`, `nombre`, `descripcion`, `comando`, `codigo`, `tipo`) VALUES
(2, 'Grado de validación de requisitos', 'Porcentaje total de requisitos validados por el cliente.', NULL, 'GVR', 'M'),
(3, 'Defectos identificados', 'Número de defectos detectados en el producto de trabajo.', NULL, NULL, 'M'),
(7, 'Lineas de código', 'Lineas de código total por archivo.', 'radon raw path', 'LOC', 'A'),
(10, 'Complejidad ciclomática', 'Indice de condicionales o ciclos anidados.\r\n\r\nTabla de indices\r\n0 - 5	A	bajo - bloques sencillos\r\n6 - 10	B	bajo- bloques bien estructurados y estables\r\n11 - 20	C	moderado - bloques significativamente complejos\r\n21 - 30	D	más que moderado - bloques más complejos\r\n31 - 40	E	Alto - alarma, bloques complejos\r\n41+	F	Muy alto - bloques inestables propensos a errores', 'radon cc path -a', 'CC', 'A'),
(11, 'Eficiencia de eliminación de defectos', 'Tiempo que se tarda en resolver defectos a partir de que fueron detectados.', NULL, 'EED', 'M'),
(13, 'Capacidad de verificación', 'Nivel en el que un documento es susceptible a ser verificado.', NULL, NULL, 'M'),
(14, 'Comprensión', 'Nivel en el que un documento es claramente legible.', NULL, NULL, 'M'),
(15, 'Cohesión', 'Distancia en lineas de código entre módulos que tienen relación.', NULL, NULL, 'M'),
(16, 'Acoplamiento', 'Nivel de dependencia entre funciones de diferentes módulos.', NULL, 'AC', 'M'),
(17, 'Mantenibilidad', 'Capacidad del código para ser modificado.\r\n\r\nTabla de indices de mantenibilidad\r\n100 - 20	A	Muy alto\r\n19 - 10	B	Medio\r\n9 - 0	C	Extremadamente bajo', 'radon mi -s path', 'MI', 'A'),
(18, 'Desviación del estándar de código', 'Errores de sintaxis de acuerdo al estándar pep8.', 'pycodestyle --first path', 'DEC', 'A'),
(19, 'Lineas lógicas de código', 'lineas de código correspondientes a sentencias.', 'radon raw path', 'LLOC', 'A'),
(20, 'Completitud', '', NULL, NULL, 'M');

--
-- Volcado de datos para la tabla `productos_de_trabajo`
--

INSERT INTO `productos_de_trabajo` (`id`, `nombre`, `descripcion`, `imagen`, `plantilla`) VALUES
(1, 'Documento de requisitos', 'Repositorio central que contiene la información actualizada de cada uno de los requisitos detectados.\r\n Descripción de los requisitos del cliente que deben ser satisfechos por el equipo de desarrollo.', '', 'formats/Jurans_Quality_Hanfbook_Fifth_Edition.pdf'),
(2, 'Documento de gestión de riesgos', 'Permite identificar riesgos potenciales que afecten el cumplimiento de los objetivos del proyecto y medidas para poder prevenir o reducir su impacto en el proyecto.', '', 'formats/Inscripcion_Semestral_FORM__18-2.pdf'),
(3, 'Código fuente', 'Son unidades de código fuente que agrupan funcionalidad del sistema.', '', 'formats/views.py'),
(6, 'Diagrama de diseño de sistema', 'Documentación que define la arquitectura de la solución e identifica todos los componentes del sistema.', '', ''),
(7, 'Plan de pruebas', 'Documentación que describe las pruebas que serán llevadas a cabo para demostrar al cliente que la solución satisface los requerimientos definidos.', '', ''),
(8, 'Reporte de pruebas', 'Documentación que describe los resultados de las pruebas, los cuales ayudarán a comprobar el “buen” funcionamiento del software.', '', ''),
(9, 'Procedimiento de entrega', 'Documento que proporciona el conjunto de actividades necesarias para llevar a cabo las entregas software y de documentación asociada.', '', ''),
(10, 'Documento de cierre de proyecto', 'En el se formaliza el cierre del proyecto y da por cumplido los requisitos y obligaciones establecidos en el contrato.', '', '');

--
-- Volcado de datos para la tabla `productos_de_trabajo_formatos`
--

INSERT INTO `productos_de_trabajo_formatos` (`id`, `productodetrabajo_id`, `formato_id`) VALUES
(7, 1, 1),
(8, 1, 4),
(11, 2, 1),
(12, 2, 3),
(1, 3, 6),
(2, 3, 7),
(3, 6, 2),
(4, 6, 3),
(9, 7, 1),
(10, 7, 3),
(16, 8, 1),
(17, 8, 3),
(13, 9, 1),
(14, 9, 3),
(15, 9, 6),
(5, 10, 1),
(6, 10, 3);

--
-- Volcado de datos para la tabla `productos_de_trabajo_metricas`
--

INSERT INTO `productos_de_trabajo_metricas` (`id`, `productodetrabajo_id`, `metrica_id`) VALUES
(18, 1, 2),
(19, 1, 3),
(25, 2, 3),
(27, 2, 13),
(28, 2, 14),
(1, 3, 3),
(3, 3, 7),
(6, 3, 10),
(7, 3, 15),
(8, 3, 16),
(9, 3, 17),
(10, 3, 18),
(11, 3, 19),
(12, 6, 2),
(13, 6, 3),
(15, 6, 15),
(21, 7, 3),
(23, 7, 14),
(31, 8, 3),
(33, 8, 13),
(29, 9, 13),
(16, 10, 2);

--
-- Volcado de datos para la tabla `rangos_de_metricas`
--

INSERT INTO `rangos_de_metricas` (`id`, `limite_superior`, `limite_inferior`, `etiqueta`, `metrica_id`) VALUES
(2, 100, 20, 'A - Muy alto', 17),
(3, 19, 10, 'B - Medio', 17),
(4, 9, 0, 'C - Extremadamente bajo', 17),
(7, 5, 0, 'A Bajo - bloques sencillos', 10),
(8, 10, 6, 'B Bajo- bloques bien estructurados y estables', 10),
(9, 20, 11, 'C Moderado - bloques significativamente complejos', 10),
(10, 30, 21, 'D Más que moderado - bloques más complejos', 10),
(11, 40, 31, 'E Alto - alarma, bloques complejos', 10),
(12, 100, 41, 'F Muy alto - bloques inestables propensos a errores', 10);

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Analista', 'Es la persona encargada de abstraer las características y funcionalidad deseada, por lo que es el responsable de identificar los requisitos, es importante que se apoye con el cliente y equipo de trabajo para la validación y verificación de los requisitos.'),
(2, 'Arquitecto', 'Este rol es el encargado de seleccionar la arquitectura adecuada para el proyecto y diseñar los módulos que componen el sistema, se recomienda que esta persona tenga conocimiento teórico de las diferentes arquitecturas y tecnologías para ser implementadas en el diseño.'),
(3, 'Desarrollador', 'Es el encargado de implementar en código la funcionalidad indicada en los requisitos, se recomienda que este tenga experiencia de haber desarrollado por lo menos un proyecto con la tecnología seleccionada para el actual proyecto.'),
(4, 'Tester', 'Es el encargado de ejecutar el plan de pruebas, se recomienda que esta persona tenga conocimiento en los tipos y técnicas de prueba de software.'),
(5, 'Líder de proyecto', 'Es el responsable de coordinar los esfuerzos del equipo de desarrollo y dirigirlos para obtener el máximo rendimiento posible, así como dar solución en primer nivel de las no conformidades identificadas.'),
(6, 'Gerente de calidad', 'Es el responsable de verificar los productos de trabajo y valorar su calidad, este debe tener conocimiento de los estándares que implementa la organización, así como conocimiento general de estándares y modelos de calidad.'),
(7, 'Cliente', 'Persona que solicita el proyecto y es el encargado de dar la aprobación final del producto.');

--
-- Volcado de datos para la tabla `roles_permisos`
--

INSERT INTO `roles_permisos` (`id`, `rol_id`, `permission_id`) VALUES
(71, 1, 136),
(74, 1, 158),
(72, 1, 173),
(73, 1, 174),
(70, 1, 176),
(76, 2, 138),
(79, 2, 158),
(77, 2, 173),
(78, 2, 174),
(75, 2, 176),
(66, 3, 139),
(67, 3, 155),
(68, 3, 173),
(69, 3, 174),
(65, 3, 176),
(97, 4, 140),
(98, 4, 173),
(99, 4, 174),
(96, 4, 176),
(85, 5, 136),
(86, 5, 137),
(87, 5, 138),
(88, 5, 139),
(89, 5, 140),
(92, 5, 141),
(94, 5, 142),
(95, 5, 158),
(90, 5, 173),
(91, 5, 174),
(93, 5, 176),
(83, 6, 173),
(84, 6, 174),
(82, 6, 176),
(81, 7, 159),
(80, 7, 176);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
