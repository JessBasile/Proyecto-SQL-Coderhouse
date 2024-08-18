USE Wifly;

-- CREACIÓN DE ROLES Y USUARIOS:
-- CREACIÓN DE ROLES:
CREATE ROLE 'administrador_role';
GRANT ALL PRIVILEGES ON Wifly.* TO 'administrador_role'
WITH GRANT OPTION;

CREATE ROLE 'admin_gral_role';
GRANT SELECT, INSERT, UPDATE ON Wifly.* TO 'admin_gral_role';

CREATE ROLE 'admin_compras_role';
GRANT SELECT, INSERT, UPDATE ON Wifly.PROVEEDORES TO 'admin_compras_role';
GRANT SELECT, INSERT, UPDATE ON Wifly.SUMINISTROS TO 'admin_compras_role';
GRANT SELECT, INSERT, UPDATE ON Wifly.EQUIPOS TO 'admin_compras_role';

CREATE ROLE 'visualizador_role';
GRANT SELECT ON Wifly.VENTAS TO 'visualizador_role';
GRANT SELECT ON Wifly.FACTURAS TO 'visualizador_role';
GRANT SELECT ON Wifly.EMPLEADOS TO 'visualizador_role';
GRANT SELECT ON Wifly.AREAS TO 'visualizador_role';

-- CREACION DE USUARIOS:
CREATE USER 'admin_compras'@'localhost' IDENTIFIED BY 'compras123'
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 3;

CREATE USER 'admin_general'@'localhost' IDENTIFIED BY 'general456'
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 3;

CREATE USER 'administrador'@'localhost' IDENTIFIED BY 'administrador789'
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 3;

CREATE USER 'estudio_contable'@'localhost' IDENTIFIED BY 'wiflyestudio'
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 3;

CREATE USER 'auditoria'@'localhost' IDENTIFIED BY 'wifly123'
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 3
PASSWORD EXPIRE INTERVAL 180 DAY;

-- ASIGNACIÓN DE ROLES A LOS USUARIOS Y ESTABLECER SU ROL POR DEFECTO EN CADA INICIO DE SESIÓN
GRANT 'administrador_role' TO 'administrador'@'localhost';
SET DEFAULT ROLE 'administrador_role' TO 'administrador'@'localhost';

GRANT 'admin_gral_role' TO 'admin_general'@'localhost';
SET DEFAULT ROLE 'admin_gral_role' TO 'admin_general'@'localhost';

GRANT 'admin_compras_role' TO 'admin_compras'@'localhost';
SET DEFAULT ROLE 'admin_compras_role' TO 'admin_compras'@'localhost';

GRANT 'visualizador_role' TO 'estudio_contable'@'localhost';
SET DEFAULT ROLE 'visualizador_role' TO 'estudio_contable'@'localhost';

GRANT 'visualizador_role' TO 'auditoria'@'localhost';
SET DEFAULT ROLE 'visualizador_role' TO 'auditoria'@'localhost';

FLUSH PRIVILEGES;