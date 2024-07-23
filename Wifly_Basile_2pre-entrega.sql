DROP DATABASE IF EXISTS Wifly;

CREATE DATABASE Wifly; 

USE Wifly;

CREATE TABLE EQUIPOS (
    id_equipo int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    marca varchar(100) DEFAULT 'TP LINK',
    modelo varchar(100) DEFAULT '850N',
    costo_equipo int DEFAULT '32000',
    precio_equipo int DEFAULT '42000',
    cantidad int NOT NULL
);

CREATE TABLE ABONOS (
    id_abono int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo_de_abono varchar(20) DEFAULT '10MB',
    costo_abono int DEFAULT 7000,
    precio_abono int DEFAULT 15000
);

CREATE TABLE CLIENTES (
    id_cliente int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_equipo int NOT NULL,
    id_abono int NOT NULL,
    fecha_de_alta datetime DEFAULT CURRENT_TIMESTAMP,
    razon_social varchar(100) NOT NULL,
    direccion varchar(100) NOT NULL,
    celular varchar(100) NOT NULL,
    dni varchar(50) NOT NULL,
    coordenadas varchar(30) DEFAULT 'Cargar en domicilio',
    numero_ip varchar(50) NOT NULL UNIQUE,
    correo_electronico varchar(100) NOT NULL UNIQUE
);

CREATE TABLE TIPO_DE_PAGO (
    id_pago int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo_de_pago varchar(50) DEFAULT 'Efectivo'
);

CREATE TABLE FACTURAS (
    id_factura int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nro_factura varchar(100) NOT NULL,
    fecha datetime DEFAULT CURRENT_TIMESTAMP,
    id_pago int NOT NULL,
    id_cliente int NOT NULL
);

CREATE TABLE PROVEEDORES (
    id_proveedor int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    razon_social varchar(100) NOT NULL UNIQUE,
    direccion varchar(100) NOT NULL,
    telefono varchar(50) NOT NULL UNIQUE,
    correo_electronico varchar(100) NOT NULL UNIQUE
);

-- Tabla intermedia
CREATE TABLE SUMINISTROS (
    id_proveedor int NOT NULL,
    id_equipo int NOT NULL,
    fecha_de_suministro datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_proveedor, id_equipo)
);

CREATE TABLE OPERACIONES (
    id_operacion int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_cliente int NOT NULL,
    tipo_operacion varchar(100) NOT NULL,
    descripcion varchar(300) NOT NULL,
    respuesta varchar(200) NOT NULL,
    fecha_operaciones datetime DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE AREAS (
    id_area int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    area_de_trabajo varchar(50) NOT NULL
);

CREATE TABLE EMPLEADOS (
    id_empleado int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_area int NOT NULL,
    apellido varchar(100) NOT NULL,
    nombre varchar(100) NOT NULL,
    direccion varchar(100) NOT NULL,
    celular varchar(50) NOT NULL UNIQUE,
    dni varchar(50) NOT NULL,
    fecha_de_nacimiento date NOT NULL
);

-- Tabla intermedia
CREATE TABLE ASIGNACIONES (
    id_empleado int NOT NULL,
    id_operacion int NOT NULL,
    fecha_de_asignacion datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_empleado, id_operacion)
);

CREATE TABLE VENTAS (
    id_venta int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_factura int NOT NULL,
    id_abono int NOT NULL,
    id_equipo int NOT NULL,
    id_operacion int NOT NULL,
    id_pago int NOT NULL,
    id_cliente int NOT NULL,
    cantidad int NOT NULL,
    costo_abono int NOT NULL,
    precio_abono int NOT NULL,
    costo_equipo int NOT NULL,
    precio_equipo int NOT NULL
);
    
-- foreign keys
-- Referencia: TABLA CLIENTES
ALTER TABLE CLIENTES ADD CONSTRAINT FK_CLIENTE_EQUIPO FOREIGN KEY (id_equipo)
    REFERENCES EQUIPOS (id_equipo); 
   
-- Referencia: TABLA FACTURAS
ALTER TABLE FACTURAS ADD CONSTRAINT FK_FACTURA_PAGO FOREIGN KEY (id_pago)
    REFERENCES TIPO_DE_PAGO (id_pago);

-- Referencia: TABLA SUMINISTROS
ALTER TABLE SUMINISTROS ADD CONSTRAINT FK_SUMINISTRO_PROVEEDOR FOREIGN KEY (id_proveedor)
    REFERENCES PROVEEDORES (id_proveedor);
   
ALTER TABLE SUMINISTROS ADD CONSTRAINT FK_SUMINISTRO_EQUIPO FOREIGN KEY (id_equipo)
    REFERENCES EQUIPOS (id_equipo);
   
-- Referencia: TABLA EMPLEADOS
ALTER TABLE EMPLEADOS ADD CONSTRAINT FK_EMPLEADO_AREA FOREIGN KEY (id_area)
    REFERENCES AREAS (id_area);

-- Referencia: TABLA ASIGNACIONES
ALTER TABLE ASIGNACIONES ADD CONSTRAINT FK_ASIGNACIONES_OPERACIONES FOREIGN KEY (id_operacion)
    REFERENCES OPERACIONES (id_operacion);

ALTER TABLE ASIGNACIONES ADD CONSTRAINT FK_ASIGNACIONES_EMPLEADOS FOREIGN KEY (id_empleado)
    REFERENCES EMPLEADOS (id_empleado);
   
-- Referencia: TABLA VENTAS
ALTER TABLE VENTAS ADD CONSTRAINT FK_VENTAS_FACTURAS FOREIGN KEY (id_factura)
    REFERENCES FACTURAS (id_factura);

ALTER TABLE VENTAS ADD CONSTRAINT FK_VENTAS_ABONOS FOREIGN KEY (id_abono)
    REFERENCES ABONOS (id_abono);

ALTER TABLE VENTAS ADD CONSTRAINT FK_VENTAS_OPERACIONES FOREIGN KEY (id_operacion)
    REFERENCES OPERACIONES (id_operacion);
    
ALTER TABLE VENTAS ADD CONSTRAINT FK_VENTAS_CLIENTES FOREIGN KEY (id_cliente)
    REFERENCES CLIENTES (id_cliente);
    
-- Creacion Vistas
-- VISTA PARA ADMINISTRACIÓN: permite ver el modelo del equipo que tiene asignado e instalado c/cliente y el proveedor que lo suministro con la fecha del suministro y de la factura.
CREATE VIEW view_admin_equipos_adquiridos_fecha AS
SELECT 
    c.id_cliente, 
    c.razon_social AS 'Nombre Cliente',
    e.id_equipo, 
    e.marca, 
    e.modelo,
    s.id_proveedor,
    p.razon_social AS 'Nombre Proveedor',
    s.fecha_de_suministro,
    f.fecha AS fecha_factura
FROM CLIENTES c
JOIN EQUIPOS e ON c.id_equipo = e.id_equipo
JOIN FACTURAS f ON c.id_cliente = f.id_cliente AND e.id_equipo = (SELECT id_equipo FROM CLIENTES WHERE id_cliente = c.id_cliente)
JOIN SUMINISTROS s ON e.id_equipo = s.id_equipo
JOIN PROVEEDORES p ON s.id_proveedor = p.id_proveedor
WHERE s.fecha_de_suministro = (
    SELECT s2.fecha_de_suministro
    FROM SUMINISTROS s2
    WHERE s2.id_equipo = e.id_equipo
    ORDER BY ABS(TIMESTAMPDIFF(DAY, s2.fecha_de_suministro, f.fecha))
    LIMIT 1
)
ORDER BY c.id_cliente, e.id_equipo;

-- VISTA PARA ADMINISTRACION: permite observar el tipo de abono que tiene contratado cada cliente y el precio.
CREATE VIEW view_admin_abonos_clientes AS
(SELECT
	c.id_cliente,
	c.razon_social AS 'Nombre Cliente',
	c.id_abono,
	a.tipo_de_abono AS 'Tipo de Abono',
	a.precio_abono
FROM CLIENTES c
JOIN ABONOS a ON c.id_abono = a.id_abono);

-- VISTA PARA ADMINISTRACIÓN: permite ver las operaciones que se le asignaron a los distintos empleados y su respuesta.
CREATE VIEW view_admin_operaciones_respuesta AS
(SELECT
	o.tipo_operacion,
	o.fecha_operaciones,
	CONCAT(e.nombre,' ', e.apellido) AS 'Empleado',
	o.respuesta
FROM OPERACIONES o
JOIN ASIGNACIONES a ON o.id_operacion = a.id_operacion
JOIN EMPLEADOS e ON a.id_empleado = e.id_empleado);

-- VISTA PARA CEO Y ADMINISTRACIÓN: permite visualizar las bajas efectuadas con su fecha y los clientes que la efectuaron.
CREATE VIEW view_bajas_clientes AS
SELECT 
    c.id_cliente, 
    c.razon_social AS 'Nombre Cliente',
    o.id_operacion, 
    o.tipo_operacion AS 'Descripcion Operacion',
    o.fecha_operaciones AS 'Fecha Operacion'
FROM CLIENTES c
JOIN OPERACIONES o ON c.id_cliente = o.id_cliente
WHERE o.tipo_operacion LIKE '%Baja%'
ORDER BY c.id_cliente, o.fecha_operaciones;

-- VISTA PARA CEO Y ADMINISTRACIÓN: permite observar los reclamos asentados, y las respuestas efectuadas en los mismos.
CREATE VIEW view_reclamos_respuesta AS
SELECT 
    o.id_operacion,
    o.descripcion AS 'Descripción Reclamo',
    o.respuesta AS 'Respuesta',
    o.fecha_operaciones AS 'Fecha',
    c.id_cliente,
    c.razon_social AS 'Nombre Cliente'
FROM OPERACIONES o
JOIN CLIENTES c ON o.id_cliente = c.id_cliente
WHERE o.tipo_operacion = 'Reclamo'
ORDER BY o.fecha_operaciones;

-- VISTA PARA GERENCIA: permite ver en forma concisa la ganancia obtenida por abonos y equipos por cada cliente.
CREATE VIEW view_gerencia_ganancia AS
(SELECT
	v.id_cliente,
	SUM(v.precio_abono - v.costo_abono) AS 'Ganancia Abonos',
	SUM(v.precio_equipo - v.costo_equipo) AS 'Ganancia Equipos',
	c.razon_social
FROM VENTAS v
JOIN CLIENTES c ON v.id_cliente = c.id_cliente
GROUP BY v.id_cliente, c.razon_social
ORDER BY SUM(v.precio_abono - v.costo_abono) + SUM(v.precio_equipo - v.costo_equipo) DESC);

-- Creación TRIGGERS
-- VALIDACIÓN DE CANTIDAD DE EQUIPOS: verifica que la cantidad de equipos esten disponibles cuando se realiza una venta.

DELIMITER //

CREATE TRIGGER verificar_cantidad_equipo
BEFORE INSERT ON VENTAS
FOR EACH ROW
BEGIN
    DECLARE cantidad_disponible INT;

    -- Obtener la cantidad disponible del equipo que se va a vender
    SELECT cantidad INTO cantidad_disponible
    FROM EQUIPOS
    WHERE id_equipo = NEW.id_equipo;

    -- Verificar si hay suficiente cantidad
    IF cantidad_disponible < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay suficiente cantidad en stock para el equipo seleccionado.';
    END IF;
END //

DELIMITER ;

-- VALIDACIÓN DE EMPLEADO-OPERACIÓN: permite verificar que el empleado y la operación existe antes de asignarla.
DELIMITER //

CREATE TRIGGER before_insert_assignment
BEFORE INSERT ON ASIGNACIONES
FOR EACH ROW
BEGIN
    DECLARE employee_exists INT;
    DECLARE operation_exists INT;
    
    SELECT COUNT(*) INTO employee_exists
    FROM EMPLEADOS
    WHERE id_empleado = NEW.id_empleado;
    
    SELECT COUNT(*) INTO operation_exists
    FROM OPERACIONES
    WHERE id_operacion = NEW.id_operacion;
    
    IF employee_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Empleado no existe';
    END IF;
    
    IF operation_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Operación no existe';
    END IF;
END;

DELIMITER;

-- Creación FUNCIONES
-- FUNCIÓN DE GANANCIA POR CLIENTE: Arroja la ganancia total (sin discriminar por abono y equipos) según id cliente.
DELIMITER //

CREATE FUNCTION calcular_ganancia_cliente(id_cliente INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ganancia_total INT;
    
    SELECT 
        SUM(v.precio_abono - v.costo_abono) + SUM(v.precio_equipo - v.costo_equipo)
    INTO ganancia_total
    FROM VENTAS v
    WHERE v.id_cliente = id_cliente;

    RETURN ganancia_total;
END //

DELIMITER ;

-- FUNCIÓN DE CANTIDAD EQUIPOS VENDIDOS: Arroja la cantidad total vendida por id equipo.
DELIMITER //

CREATE FUNCTION cantidad_vendida_por_equipo(id_equipo INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad_vendida INT;
    
    SELECT SUM(cantidad) INTO cantidad_vendida
    FROM VENTAS
    WHERE id_equipo = id_equipo;
    
    RETURN cantidad_vendida;
END //

DELIMITER ;

-- IMPORTACIÓN DE DATOS DESDE ARCHIVO CSV

LOAD DATA LOCAL INFILE 'D:/Documents/dataset_mysql/areas.csv'
INTO TABLE AREAS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_area, area_de_trabajo);

LOAD DATA LOCAL INFILE 'D:/Documents/dataset_mysql/tipo_de_pago.csv'
INTO TABLE TIPO_DE_PAGO
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_pago, tipo_de_pago);

LOAD DATA LOCAL INFILE 'D:/Documents/dataset_mysql/abonos.csv'
INTO TABLE ABONOS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_abono, tipo_de_abono, costo_abono, precio_abono);

LOAD DATA LOCAL INFILE 'D:/Documents/dataset_mysql/proveedores.csv'
INTO TABLE PROVEEDORES
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_proveedor, razon_social, direccion, telefono, correo_electronico);

LOAD DATA LOCAL INFILE 'D:/Documents/dataset_mysql/equipos.csv'
INTO TABLE EQUIPOS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_equipo, marca, modelo, costo_equipo, precio_equipo, cantidad);

LOAD DATA LOCAL INFILE 'D:/Documents/dataset_mysql/clientes.csv'
INTO TABLE CLIENTES
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_cliente, id_equipo, id_abono, fecha_de_alta, razon_social, direccion, celular, dni, coordenadas, numero_ip, correo_electronico);

LOAD DATA LOCAL INFILE 'D:/Documents/dataset_mysql/empleados.csv'
INTO TABLE EMPLEADOS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_empleado, id_area, apellido, nombre, direccion, celular, dni, fecha_de_nacimiento);

LOAD DATA LOCAL INFILE 'D:/Documents/dataset_mysql/facturas.csv'
INTO TABLE FACTURAS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_factura, nro_factura, fecha,id_pago, id_cliente);

LOAD DATA LOCAL INFILE 'D:/Documents/dataset_mysql/operaciones.csv'
INTO TABLE OPERACIONES
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_operacion, id_cliente, tipo_operacion, descripcion, respuesta, fecha_operaciones);

LOAD DATA LOCAL INFILE 'D:/Documents/dataset_mysql/asignaciones.csv'
INTO TABLE ASIGNACIONES
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_empleado, id_operacion, fecha_de_asignacion);

LOAD DATA LOCAL INFILE 'D:/Documents/dataset_mysql/suministros.csv'
INTO TABLE SUMINISTROS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_proveedor, id_equipo, fecha_de_suministro);

LOAD DATA LOCAL INFILE 'D:/Documents/dataset_mysql/ventas.csv'
INTO TABLE VENTAS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_venta, id_factura, id_abono, id_equipo, id_operacion, id_pago, id_cliente, cantidad, costo_abono, precio_abono, costo_equipo, precio_equipo);

-- Creacion STORED PROCEDURES Y EVENTOS
-- EVENTO PARA

-- PROCEDIMIENTO PARA
