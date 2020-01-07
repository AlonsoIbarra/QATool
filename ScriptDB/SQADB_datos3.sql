-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-08-2018 a las 16:21:51
-- Versión del servidor: 8.0.12
-- Versión de PHP: 7.1.16

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

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$0vWgJHBDaanh$n/FG02686PBltMYuFW9YucGHK+pfWmnziPE5izGnQ0s=', '2018-08-20 18:12:56.550341', 1, 'root', '', '', 'saul.ibarra@cimat.mx', 1, 1, '2018-08-14 01:33:09.884780'),
(2, 'pbkdf2_sha256$36000$WVixsVcmNm2c$wqr8jqu5rIDb740ofQ/R/z7VWwvFEyFQHIGfXpJ1NqQ=', '2018-08-14 03:51:42.694816', 0, 'saul', '', '', 'isaul37@hotmail.es', 0, 1, '2018-08-14 01:39:40.660220'),
(3, 'pbkdf2_sha256$36000$nvSvzB0jUBBn$pkipKoEdFBCMjqiZwLYQuN1hLeuIG+k6YsiGZD7VojA=', '2018-08-20 14:57:35.201237', 0, 'alonso', '', '', 'saul.drago@gmail.com', 0, 1, '2018-08-14 01:40:49.253016');

--
-- Volcado de datos para la tabla `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(2, 1, 25),
(6, 1, 26),
(5, 1, 27),
(4, 1, 28),
(8, 1, 29),
(7, 1, 30),
(3, 1, 31),
(9, 2, 28);

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
-- Volcado de datos para la tabla `criterios_de_producto`
--

INSERT INTO `criterios_de_producto` (`id`, `estatus`, `criterio_id`, `producto_id`) VALUES
(6, 0, 9, 7),
(7, 0, 1, 7),
(8, 0, 2, 8);

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2018-08-14 03:38:47.336040', '3', 'Desarrollador', 2, '[{\"changed\": {\"fields\": [\"permisos\"]}}]', 12, 1),
(2, '2018-08-14 03:38:55.720587', '1', 'Analista', 2, '[{\"changed\": {\"fields\": [\"permisos\"]}}]', 12, 1),
(3, '2018-08-14 03:39:03.809902', '2', 'Arquitecto', 2, '[{\"changed\": {\"fields\": [\"permisos\"]}}]', 12, 1),
(4, '2018-08-14 03:42:23.518664', '5', 'Líder de proyecto', 2, '[{\"changed\": {\"fields\": [\"permisos\"]}}]', 12, 1),
(5, '2018-08-14 03:42:33.346708', '4', 'Tester', 2, '[{\"changed\": {\"fields\": [\"permisos\"]}}]', 12, 1),
(6, '2018-08-14 03:42:45.908644', '6', 'Gerente de calidad', 2, '[{\"changed\": {\"fields\": [\"permisos\"]}}]', 12, 1),
(7, '2018-08-14 03:43:27.175521', '7', 'Cliente', 2, '[{\"changed\": {\"fields\": [\"permisos\"]}}]', 12, 1),
(8, '2018-08-14 16:12:22.022277', '21', 'Número de requisitos', 1, '[{\"added\": {}}]', 10, 1),
(9, '2018-08-14 16:12:22.198278', '22', 'Número de requisitos', 1, '[{\"added\": {}}]', 10, 1),
(10, '2018-08-14 16:13:07.240902', '23', 'Número de requisitos validados', 1, '[{\"added\": {}}]', 10, 1),
(11, '2018-08-14 16:13:22.186442', '2', 'Grado de validación de requisitos', 2, '[{\"changed\": {\"fields\": [\"tipo\", \"metricas_relacionadas\"]}}]', 10, 1),
(12, '2018-08-15 16:21:27.895950', '24', 'Profundidad de árbol de herencia', 1, '[{\"added\": {}}]', 10, 1),
(13, '2018-08-15 16:22:37.242448', '25', 'Número de hijos', 1, '[{\"added\": {}}]', 10, 1),
(14, '2018-08-15 16:23:10.155568', '24', 'Profundidad de árbol de herencia', 2, '[{\"changed\": {\"fields\": [\"comando\"]}}]', 10, 1),
(15, '2018-08-15 16:23:20.145698', '25', 'Número de hijos', 2, '[{\"changed\": {\"fields\": [\"codigo\"]}}]', 10, 1),
(16, '2018-08-15 16:24:29.483968', '26', 'Respuesta para una clase', 1, '[{\"added\": {}}]', 10, 1),
(17, '2018-08-15 16:27:48.341264', '15', 'Cohesión entre métodos', 2, '[{\"changed\": {\"fields\": [\"nombre\", \"codigo\"]}}]', 10, 1),
(18, '2018-08-15 16:29:47.601762', '21', 'Número de requisitos', 3, '', 10, 1),
(19, '2018-08-15 16:32:22.452174', '27', 'Densidad de defectos', 1, '[{\"added\": {}}]', 10, 1),
(20, '2018-08-15 16:33:46.667300', '28', 'Inyección de defectos', 1, '[{\"added\": {}}]', 10, 1),
(21, '2018-08-15 16:35:59.120602', '29', 'Eliminación de defectos', 1, '[{\"added\": {}}]', 10, 1),
(22, '2018-08-15 16:35:59.262872', '30', 'Eliminación de defectos', 1, '[{\"added\": {}}]', 10, 1),
(23, '2018-08-15 16:37:11.428133', '31', 'Esfuerzo estimado', 1, '[{\"added\": {}}]', 10, 1),
(24, '2018-08-15 16:37:49.430937', '32', 'Tareas realizadas', 1, '[{\"added\": {}}]', 10, 1),
(25, '2018-08-15 16:39:39.217273', '33', 'Tareas restantes', 1, '[{\"added\": {}}]', 10, 1),
(26, '2018-08-15 16:40:47.999123', '32', 'Tareas realizadas', 2, '[{\"changed\": {\"fields\": [\"descripcion\", \"codigo\"]}}]', 10, 1),
(27, '2018-08-15 16:41:03.055921', '33', 'Tareas restantes', 2, '[]', 10, 1),
(28, '2018-08-15 16:43:04.361486', '34', 'Trabajo en proceso', 1, '[{\"added\": {}}]', 10, 1),
(29, '2018-08-15 16:43:04.462451', '35', 'Trabajo en proceso', 1, '[{\"added\": {}}]', 10, 1),
(30, '2018-08-15 16:44:15.606757', '36', 'Tiempo de espera', 1, '[{\"added\": {}}]', 10, 1),
(31, '2018-08-15 16:45:51.427637', '10', 'Complejidad ciclomática', 2, '[]', 10, 1);

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'admin', 'logentry'),
(3, 'auth', 'group'),
(4, 'auth', 'permission'),
(5, 'auth', 'user'),
(6, 'contenttypes', 'contenttype'),
(17, 'inicio', 'accioncorrectivademetrica'),
(18, 'inicio', 'criteriodeaceptacion'),
(14, 'inicio', 'criteriodeproducto'),
(9, 'inicio', 'estatusdeproductos'),
(20, 'inicio', 'evento'),
(15, 'inicio', 'eventodeproyecto'),
(8, 'inicio', 'fase'),
(21, 'inicio', 'fasedeproyecto'),
(13, 'inicio', 'historicodemetrica'),
(10, 'inicio', 'metrica'),
(16, 'inicio', 'metricadeproducto'),
(23, 'inicio', 'productodetrabajo'),
(24, 'inicio', 'productodetrabajodefase'),
(25, 'inicio', 'proyecto'),
(22, 'inicio', 'rangodemetrica'),
(12, 'inicio', 'rol'),
(19, 'inicio', 'roldeproyecto'),
(11, 'inicio', 'tokendecontrasena'),
(7, 'sessions', 'session'),
(1, 'sites', 'site');

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-08-14 01:03:04.449613'),
(2, 'auth', '0001_initial', '2018-08-14 01:03:05.117010'),
(3, 'admin', '0001_initial', '2018-08-14 01:03:05.469422'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-08-14 01:03:05.540159'),
(5, 'contenttypes', '0002_remove_content_type_name', '2018-08-14 01:03:05.700523'),
(6, 'auth', '0002_alter_permission_name_max_length', '2018-08-14 01:03:05.785286'),
(7, 'auth', '0003_alter_user_email_max_length', '2018-08-14 01:03:05.867607'),
(8, 'auth', '0004_alter_user_username_opts', '2018-08-14 01:03:05.886448'),
(9, 'auth', '0005_alter_user_last_login_null', '2018-08-14 01:03:05.965691'),
(10, 'auth', '0006_require_contenttypes_0002', '2018-08-14 01:03:05.970563'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2018-08-14 01:03:05.990429'),
(12, 'auth', '0008_alter_user_username_max_length', '2018-08-14 01:03:06.208832'),
(13, 'inicio', '0001_initial', '2018-08-14 01:03:10.023664'),
(14, 'inicio', '0002_auto_20180521_1250', '2018-08-14 01:03:10.052991'),
(15, 'inicio', '0003_auto_20180521_1416', '2018-08-14 01:03:10.385280'),
(16, 'inicio', '0004_auto_20180522_1540', '2018-08-14 01:03:10.582228'),
(17, 'inicio', '0005_auto_20180522_1542', '2018-08-14 01:03:10.763376'),
(18, 'inicio', '0006_auto_20180528_1201', '2018-08-14 01:03:11.018353'),
(19, 'inicio', '0007_auto_20180528_1310', '2018-08-14 01:03:11.167946'),
(20, 'inicio', '0008_auto_20180531_1011', '2018-08-14 01:03:11.385369'),
(21, 'inicio', '0009_auto_20180531_1022', '2018-08-14 01:03:11.588870'),
(22, 'inicio', '0010_auto_20180531_1022', '2018-08-14 01:03:11.711561'),
(23, 'inicio', '0011_auto_20180601_1208', '2018-08-14 01:03:12.035733'),
(24, 'inicio', '0012_auto_20180601_1211', '2018-08-14 01:03:12.466269'),
(25, 'inicio', '0013_auto_20180601_1213', '2018-08-14 01:03:12.665423'),
(26, 'inicio', '0014_auto_20180601_1214', '2018-08-14 01:03:12.888338'),
(27, 'inicio', '0015_auto_20180601_1214', '2018-08-14 01:03:13.008309'),
(28, 'inicio', '0016_auto_20180601_1221', '2018-08-14 01:03:13.186442'),
(29, 'inicio', '0017_auto_20180601_1222', '2018-08-14 01:03:13.415536'),
(30, 'inicio', '0018_auto_20180601_1223', '2018-08-14 01:03:13.649012'),
(31, 'inicio', '0019_auto_20180601_1315', '2018-08-14 01:03:13.762170'),
(32, 'inicio', '0020_auto_20180813_1321', '2018-08-14 01:03:13.983294'),
(33, 'inicio', '0021_auto_20180813_1404', '2018-08-14 01:03:14.107722'),
(34, 'inicio', '0022_auto_20180813_1420', '2018-08-14 01:03:14.225260'),
(35, 'inicio', '0023_auto_20180813_1523', '2018-08-14 01:03:14.357191'),
(36, 'inicio', '0024_auto_20180813_1524', '2018-08-14 01:03:14.480779'),
(37, 'inicio', '0025_auto_20180813_2002', '2018-08-14 01:03:14.718464'),
(38, 'sessions', '0001_initial', '2018-08-14 01:03:14.775974'),
(39, 'sites', '0001_initial', '2018-08-14 01:03:14.802304'),
(40, 'sites', '0002_alter_domain_unique', '2018-08-14 01:03:14.828515');

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('12d6df2wribhshao7rm7ek07c2f5josk', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:26:38.673807'),
('1pu2ge84avb6z2efqtbdsgyl1fwyzdbx', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:51:42.148824'),
('20czzasvcf962fjl3lj6en49d48rof2v', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 01:35:03.241313'),
('285z4sf9o3m3ein8gl3h3rharui6ohu9', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:05:27.601531'),
('2jmshunaycfvxcu43cm4kxmb6et2hi14', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:20:41.225653'),
('2u8vt8kf7x7tkaiw14do5ekfmparljfw', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:05:19.882416'),
('33rpcy5mqtw579269dla1bgk0iotxh50', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 01:34:24.360137'),
('3db9zy2mxy7wyhzvx0t0w04vbvxpgjkk', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:02:52.789454'),
('3elurmaqhmneux94pt2efcvdj2ne998n', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:05:45.123703'),
('3obffiwscv519fk4oi2v59x4jafc35rf', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:26:57.260445'),
('47dgccmner8wdakrgclqflfbb7d4g6nx', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:44:39.360850'),
('4aoqwrosa0lw7qrqupnt90ujdytyph6s', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 01:34:19.168962'),
('5rpj90nkcu9rax732p33uql7x0harwan', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:05:39.403654'),
('5yrnm7tuvqsdivuaudfqn33s116d6akj', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 01:33:57.075305'),
('6dr6ka7t44fnimdxz2ifdxtgt5spk39c', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:50:42.611188'),
('74qc5sidvwzqwnim4u62qzq5dht1at9h', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 01:34:29.599351'),
('74s8yyca6z03d0r8szar6jrpnva1cndm', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 01:34:34.827732'),
('7epoom9u2b5yfgzu2vr3z7ulx6mhfwbs', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:02:46.503462'),
('7g7t86jbxcq86xolvunnmug1iuexbkwl', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:02:41.858097'),
('7nxnh2c1jbzmyd7ydsahkf8d1ghcvna8', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:06:07.309252'),
('8iu6jgdq1193rde309erjrqabfknq5gw', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:20:26.189924'),
('951x5bn4sqndlolyq6ir3vnmb3epci1i', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:51:25.510541'),
('ad3bk2ml867ta7zsh30pz8f6j4gcr6cc', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:45:09.962810'),
('b7ucksf2uaqn6m72s89vtwgclz1laupe', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:52:19.481280'),
('b8l3xtbboqmajfdidyx4rls4x94v2mmz', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:27:08.159418'),
('cmij3a0vrs0qu5l0yvo86hh6pt6ksq5a', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:51:07.333970'),
('daobpjyd1gq4hhdw2h7scjt3xd1mjjmg', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 01:34:51.325493'),
('e0xl9wzui0hljzhrichwezcvf2we0nuh', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:26:48.055729'),
('ewt4a28lekjotj01s9ed6esjdtsod9gs', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:20:03.381755'),
('fdgcn6lk44dnzcxk8ju8iahxevn2eyb6', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:05:56.226752'),
('fdj86ccgcqf7vkb25mxp61lfslniz8he', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:32:47.392781'),
('fipa9ehaftoga2xm8f7r9yka47514vcp', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:33:12.570060'),
('g2kz64nkfhmuhch7pfe2po52jyosqvtv', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:26:13.562682'),
('g4x23j2t1r61itvt6i6zfhwazncnhv2k', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:44:49.736303'),
('gccqwbnwsqu8qo8eoxob508o073ty08o', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:27:27.361708'),
('gfypvc3q1ek1dgw9l9k5mdbf92b0qwqg', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 01:34:57.549791'),
('h1mw1o4xkt2bfwmyo4xu0k00sc7om8sw', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-09-03 18:12:56.561299'),
('hgn9ob2ry71mydiet0jcp62ia8e42s4y', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:27:35.182993'),
('hj2zbshklm7cjw13347vugprwjoz5409', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:21:05.203443'),
('i5ipz65pt1zn8l4f3a4vwsfmyfzyiyek', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:33:40.646273'),
('j33z48s7r3d1ozp15x12j07e4f2zli20', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:45:19.481847'),
('j8ds65ets3zxf0d1dh3l92cs0dx938wh', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 01:33:49.052152'),
('jcygu9f9cigw3nbjvg0ks2d9afb52068', 'NWYxOTUzYjM1NzNjZDc1OTQ3NmJmOGQ1ZTlkOGYxOGQ3OGFiNTkyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiODgzYjYyZjM5YTQzM2E3NDdlY2E5YTVkMTUzYmJiMDM2MWQxYWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2018-08-28 03:06:14.205062'),
('jdatqf0agg52f92sn1yrt6cgf560nal8', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:06:20.357548'),
('k0vlch2p1c3jdp8v5ggqy1jxthbl3gk3', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 01:34:08.487560'),
('ke7l1gc68gtu8ear9egq7z0d5inv8813', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:32:54.797583'),
('kf6hdknq7g58l9m3wxaturqyb9ds1kl9', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:26:29.892666'),
('ktir5tgneb370tyyannl66qf4709p0h2', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:27:18.809809'),
('l0jqn49ntu8dg2g61w5xqyobnxi8c9i6', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:33:25.651721'),
('lb7ty93l94sscyvw78g0fea5dj80e3pi', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:20:16.013205'),
('lfch466ekr1kbslxzzbs7732dq3c8rax', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:06:57.482540'),
('lujojnph6wx2wlryvvm8i6l9ldtpn7oa', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:05:15.079722'),
('m9fik9ebc8dcaj0c61i9war9acqral5n', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:04:53.401986'),
('mmt5hvglsso64hk8ciqfflzn35vsa1kw', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:51:32.973334'),
('mpwy8rgp3g1lhi6chmtnjn6afu1hpvjl', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:45:03.107313'),
('mwdx4cewaxncz6upohby7htbyhi0x999', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:33:05.860924'),
('okqyro3s0mu5zy4uiebolou3pa0e886r', 'MWQwOGIzMTM5YTc5NGRhNDk4Y2JiZTA3ZTkyNzE4NWQ2NjIyYWI4NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUyYjI1ZDE2ODAxODliMDlhZmJjOTFkMWE5Yzg5ZDdjMGVmM2U4MmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=', '2018-08-28 03:51:00.242201'),
('ov7mzqjqne4zyrca75e1naywe8tpvh2y', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:44:56.679958'),
('p10kt73dqn4d2wnjauhi98zfbb5b7i9f', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 01:33:44.028617'),
('pqt1hvmd1edowaulomrtmaojxx81zqam', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:06:46.407574'),
('q8bgzsf0r5srf1r5n9y3yzwj1ote9d9e', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:33:32.916396'),
('qs54rhqwwbxe3la0g6mdcgr6h914mcqb', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 01:34:02.598716'),
('rwwwi9aw37044osvv9zds0xsid5lr45x', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:52:26.374541'),
('snp6p7dt1tpoz5gksdt7hgxvmuuw3yoq', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:05:33.144360'),
('syaa6j06rkx58dyrxtjg8xpbt39py5ra', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:32:42.364696'),
('t26x17mumqykli6w8luplncog7symw3w', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:33:18.976342'),
('t2dx0gzlt30v7nungzq791gwf1y61a4m', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:05:50.680035'),
('t75a3rxlqh1qs044trzqoybezbsa5jte', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:06:51.990696'),
('tqtwcr9vcqa3qg8hnd2u4pk4vs29at81', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:20:08.411997'),
('tvzgrxjm62z55n2uicj8szh5kc4mws49', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:51:50.973792'),
('uf9re78440j4i7qvdozd26f6zy7l4tv0', 'NWYxOTUzYjM1NzNjZDc1OTQ3NmJmOGQ1ZTlkOGYxOGQ3OGFiNTkyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiODgzYjYyZjM5YTQzM2E3NDdlY2E5YTVkMTUzYmJiMDM2MWQxYWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2018-08-28 03:51:42.700361'),
('ujkasrkhkwrywdf3z42a4p2376qgtdsj', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:06:40.998440'),
('usd65naae1g3vmhc8fjaakytpuxpbvsq', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:27:42.658291'),
('uzhq4jhz0m7pffyldgfqdz4t4dg2qo3w', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:20:56.951259'),
('v3jow1f2kwrlfj9llvjowjdxvyi79moo', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:44:25.739187'),
('vfzj0lakq6k3tmgbgqqsr6xgxczzzban', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:45:31.376196'),
('vt76eib6f5xvi4sr1c3l4nnd66ih2ts3', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:20:48.953464'),
('w3byx93oipje0wpf26k2bjzusrycm59h', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:07:08.850509'),
('w3g4151k25j2ph68o8xy871uiq08bpha', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:44:31.077873'),
('wf0ypf9aw3zrua2abdci5fgeb6lzw8en', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:06:01.484568'),
('whsdm0jri7ybk2mkwr63xpntk6g95qlb', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 01:34:14.156868'),
('wmjrahuiqdxa41mdld5x8l5f17cfsxqa', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:51:16.631153'),
('wtue8acyu43dsxh19f1vwivazkgfhlby', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:07:03.171376'),
('xtgh9ap5aasmu3qbp02oowohroyijdqy', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:06:34.797404'),
('xwurlor9rlk49n6f9ia14h369l98eiib', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 01:34:44.930244'),
('y3kgmu6ldd5mg59pkssd1dlgz7dyl7ka', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:20:34.844613'),
('y8fjonbq5hsyqwrch379emfe63v4g8qj', 'NWYxOTUzYjM1NzNjZDc1OTQ3NmJmOGQ1ZTlkOGYxOGQ3OGFiNTkyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiODgzYjYyZjM5YTQzM2E3NDdlY2E5YTVkMTUzYmJiMDM2MWQxYWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2018-08-28 03:26:21.002535'),
('zshxcqqbc871wle6atuqt69ktqsaba2m', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:52:32.993421'),
('zwlp9o2i0xakwlnz6gen8cyxznkz4geu', 'OGRjMDI5YTA3MGQ5ZWFmMjgzNDJkNzUzMmY5ZGRiMDQyYzM0ZmIxNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMGYxYzhlNGJkOGUyZmQxMGViMDg2NTEzNTEyNzQwMGFjNWQwODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-28 03:06:27.770421');

--
-- Volcado de datos para la tabla `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

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
(1, 'Evaluación', 'Evaluar los documentos de gestión de riesgos, el cual es verificado contra los criterios de aceptación establecidos y se evalúan los resultados de medición de los documentos de gestión de riesgos.', 26),
(3, 'Análisis', 'Verificar y validar requisitos, verificar contenido de documento de requisitos, así como evaluar las mediciones realizadas.', 25),
(4, 'Desarrollo', 'Evaluar el cumplimiento de los requisitos y diseño del sistema contra el código fuente y el cumplimiento de los criterios de aceptación.', 28),
(6, 'Diseño', 'Verificar y validar el diseño del sistema y evaluar resultados de medición en diseño de sistema.', 27),
(7, 'Pruebas', 'Evaluar los resultados de las pruebas y contenido de reportes de pruebas, obtener los indices de calidad asociados a las pruebas.', 29),
(9, 'Liberación', 'Evaluar el procedimiento de entrega y evidencia generada.', 30),
(10, 'Cierre', 'Evaluar contenido en el documento de cierre del proyecto.', 31);

--
-- Volcado de datos para la tabla `fases_de_proyecto`
--

INSERT INTO `fases_de_proyecto` (`id`, `fecha_de_inicio`, `fecha_de_cierre`, `fase_id`, `proyecto_id`) VALUES
(7, '2018-09-10', '2018-10-27', 3, 10),
(8, '2018-10-20', '2018-12-02', 6, 10);

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
-- Volcado de datos para la tabla `metricas`
--

INSERT INTO `metricas` (`id`, `nombre`, `descripcion`, `tipo`, `codigo`, `comando`) VALUES
(2, 'Grado de validación de requisitos', 'Porcentaje total de requisitos validados por el cliente.', 'I', 'GVR', NULL),
(3, 'Defectos identificados', 'Número de defectos detectados en el producto de trabajo.', 'M', NULL, NULL),
(7, 'Lineas de código', 'Lineas de código total por archivo.', 'A', 'LOC', 'radon raw path'),
(10, 'Complejidad ciclomática', 'Indice de condicionales o ciclos anidados.\r\n\r\nTabla de indices\r\n0 - 5	A	bajo - bloques sencillos\r\n6 - 10	B	bajo- bloques bien estructurados y estables\r\n11 - 20	C	moderado - bloques significativamente complejos\r\n21 - 30	D	más que moderado - bloques más complejos\r\n31 - 40	E	Alto - alarma, bloques complejos\r\n41+	F	Muy alto - bloques inestables propensos a errores', 'A', 'CC', 'radon cc path -a'),
(11, 'Eficiencia de eliminación de defectos', 'Tiempo que se tarda en resolver defectos a partir de que fueron detectados.', 'M', 'EED', NULL),
(13, 'Capacidad de verificación', 'Nivel en el que un documento es susceptible a ser verificado.', 'M', NULL, NULL),
(14, 'Comprensión', 'Nivel en el que un documento es claramente legible.', 'M', NULL, NULL),
(15, 'Cohesión entre métodos', 'Distancia en lineas de código entre módulos que tienen relación.', 'M', 'LCOM', NULL),
(16, 'Acoplamiento', 'Nivel de dependencia entre funciones de diferentes módulos.', 'M', 'AC', NULL),
(17, 'Mantenibilidad', 'Capacidad del código para ser modificado.\r\n\r\nTabla de indices de mantenibilidad\r\n100 - 20	A	Muy alto\r\n19 - 10	B	Medio\r\n9 - 0	C	Extremadamente bajo', 'A', 'MI', 'radon mi -s path'),
(18, 'Desviación del estándar de código', 'Errores de sintaxis de acuerdo al estándar pep8.', 'A', 'DEC', 'pycodestyle --first path'),
(19, 'Lineas lógicas de código', 'lineas de código correspondientes a sentencias.', 'A', 'LLOC', 'radon raw path'),
(20, 'Completitud', '', 'M', NULL, NULL),
(22, 'Número de requisitos', 'Total de requisitos licitados para el proyecto', 'M', 'NR', NULL),
(23, 'Número de requisitos validados', 'Total de requisitos que han sido validados por el cliente', 'M', 'NRV', NULL),
(24, 'Profundidad de árbol de herencia', 'Indica el máximo número de niveles de herencia heredados desde una clase particular hacia su clase padre. Esta es una medición de cuantas clases padre puede potencialmente afectar esta clase.', 'M', NULL, 'DIT'),
(25, 'Número de hijos', 'Es una medida de la cantidad de sub clases que heredarás de la clase padre.', 'M', 'NOC', NULL),
(26, 'Respuesta para una clase', 'Indica el número de métodos que son llamados en respuesta a un mensaje recibido por un objeto de una clase. Esta métrica muestra cuanto una clase se comunica con otras clases.', 'M', 'RFC', NULL),
(27, 'Densidad de defectos', 'Densidad de defectos de un archivo de código.', 'I', NULL, NULL),
(28, 'Inyección de defectos', 'Cantidad de defectos inyectados en el componente.', 'M', 'IDEF', NULL),
(29, 'Eliminación de defectos', 'Total de defectos eliminados en el componente.', 'M', 'EDEF', NULL),
(30, 'Eliminación de defectos', 'Total de defectos eliminados en el componente.', 'M', 'EDEF', NULL),
(31, 'Esfuerzo estimado', 'Esfuerzo estimado por historias del componente en ideal par de días.', 'M', 'EE', NULL),
(32, 'Tareas realizadas', 'Tareas del componente que han sido finalizadas e integradas a un entregable.', 'M', 'CT', NULL),
(33, 'Tareas restantes', 'Tareas restantes del componente por ejecutar y que no se encuentran en proceso de ejecución.', 'M', 'RT', NULL),
(34, 'Trabajo en proceso', 'Tareas del componente que se encuentra en ejecución.', 'M', 'WIP', NULL),
(35, 'Trabajo en proceso', 'Tareas del componente que se encuentra en ejecución.', 'M', 'WIP', NULL),
(36, 'Tiempo de espera', 'Tiempo promedio que toma para una tarea o requisito del componente pasar por todo el proceso desde el inicio hasta finalizar.', 'M', 'LT', NULL);

--
-- Volcado de datos para la tabla `metricas_de_producto`
--

INSERT INTO `metricas_de_producto` (`id`, `indice`, `desviacion`, `metrica_id`, `producto_id`, `limite_inferior`, `limite_superior`) VALUES
(5, 0, NULL, 3, 7, 0, 0),
(6, 5, NULL, 15, 8, 0, 10);

--
-- Volcado de datos para la tabla `metricas_metricas_relacionadas`
--

INSERT INTO `metricas_metricas_relacionadas` (`id`, `from_metrica_id`, `to_metrica_id`) VALUES
(1, 2, 22),
(2, 2, 23),
(7, 3, 27),
(8, 7, 27),
(3, 22, 2),
(4, 23, 2),
(5, 27, 3),
(6, 27, 7);

--
-- Volcado de datos para la tabla `productos_de_trabajo`
--

INSERT INTO `productos_de_trabajo` (`id`, `nombre`, `descripcion`, `plantilla`, `imagen`) VALUES
(1, 'Documento de requisitos', 'Repositorio central que contiene la información actualizada de cada uno de los requisitos detectados.\r\n Descripción de los requisitos del cliente que deben ser satisfechos por el equipo de desarrollo.', 'formats/Jurans_Quality_Hanfbook_Fifth_Edition.pdf', ''),
(2, 'Documento de gestión de riesgos', 'Permite identificar riesgos potenciales que afecten el cumplimiento de los objetivos del proyecto y medidas para poder prevenir o reducir su impacto en el proyecto.', 'formats/Inscripcion_Semestral_FORM__18-2.pdf', ''),
(3, 'Código fuente', 'Son unidades de código fuente que agrupan funcionalidad del sistema.', 'formats/views.py', ''),
(6, 'Diagrama de diseño de sistema', 'Documentación que define la arquitectura de la solución e identifica todos los componentes del sistema.', '', ''),
(7, 'Plan de pruebas', 'Documentación que describe las pruebas que serán llevadas a cabo para demostrar al cliente que la solución satisface los requerimientos definidos.', '', ''),
(8, 'Reporte de pruebas', 'Documentación que describe los resultados de las pruebas, los cuales ayudarán a comprobar el “buen” funcionamiento del software.', '', ''),
(9, 'Procedimiento de entrega', 'Documento que proporciona el conjunto de actividades necesarias para llevar a cabo las entregas software y de documentación asociada.', '', ''),
(10, 'Documento de cierre de proyecto', 'En el se formaliza el cierre del proyecto y da por cumplido los requisitos y obligaciones establecidos en el contrato.', '', '');

--
-- Volcado de datos para la tabla `productos_de_trabajo_de_fase`
--

INSERT INTO `productos_de_trabajo_de_fase` (`id`, `ultima_actualizacion`, `archivo`, `estatus_id`, `fase_id`, `producto_id`, `plantilla`) VALUES
(7, '2018-08-21 01:29:52.484875', '', 1, 7, 1, ''),
(8, '2018-08-21 15:48:11.532935', '', 1, 8, 6, '');

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
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `nombre`, `cliente`, `nombre_del_equipo`, `metodologia`, `estatus`, `usuario_registro_id`) VALUES
(8, 'Proyecto 1', 'Procesadora de productos SA de CV', 'Team 1', 'Hibrida', 0, 3),
(10, 'proyecto test', 'Envasadora de Zacatecas SA de CV', 'Equipo 1', 'hibrida', 0, 1);

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
-- Volcado de datos para la tabla `roles_de_proyecto`
--

INSERT INTO `roles_de_proyecto` (`id`, `enterado`, `fecha_de_enterado`, `proyecto_id`, `rol_id`, `usuario_id`) VALUES
(13, 0, NULL, 10, 2, 1),
(14, 0, NULL, 10, 1, 1),
(15, 0, NULL, 10, 5, 1),
(16, 0, NULL, 10, 6, 1);

--
-- Volcado de datos para la tabla `roles_permisos`
--

INSERT INTO `roles_permisos` (`id`, `rol_id`, `permission_id`) VALUES
(2, 1, 25),
(3, 2, 27),
(1, 3, 28),
(11, 4, 29),
(4, 5, 25),
(5, 5, 26),
(6, 5, 27),
(7, 5, 28),
(8, 5, 29),
(9, 5, 30),
(10, 5, 31),
(12, 6, 25),
(13, 6, 26),
(14, 6, 27),
(15, 6, 28),
(16, 6, 29),
(17, 6, 30),
(18, 6, 31),
(19, 7, 83);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
