DROP DATABASE IF EXISTS Wifly;

CREATE DATABASE Wifly; 

USE Wifly;

CREATE TABLE EQUIPOS (
    id_equipo int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    marca varchar(100) NOT NULL DEFAULT 'TP LINK',
    modelo varchar(100) NOT NULL DEFAULT '850N',
    costo_equipo int NOT NULL DEFAULT '32000',
    precio_equipo int NOT NULL DEFAULT '42000',
    cantidad int NOT NULL
);

CREATE TABLE ABONOS (
    id_abono int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo_de_abono varchar(20) NOT NULL DEFAULT '10MB',
    costo_abono int NOT NULL DEFAULT 7000,
    precio_abono int NOT NULL DEFAULT 15000
);

CREATE TABLE CLIENTES (
    id_cliente int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_equipo int NOT NULL,
    id_abono int NOT NULL,
    fecha_de_alta datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
    tipo_de_pago varchar(50) NOT NULL DEFAULT 'Efectivo'
);

CREATE TABLE FACTURAS (
    id_factura int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nro_factura varchar(100) NOT NULL,
    fecha datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
    fecha_de_suministrio datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_proveedor, id_equipo)
);

CREATE TABLE OPERACIONES (
    id_operacion int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_cliente int NOT NULL,
    instalacion varchar(100) NOT NULL,
    reclamo varchar(100) NOT NULL,
    modificacion varchar(200) NOT NULL,
    baja varchar(100) NOT NULL,
    descripcion varchar(300) NOT NULL,
    motivo varchar(200) NOT NULL,
    respuesta varchar(200) NOT NULL,
    fecha_operaciones datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
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
    fecha_de_asignacion datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
   
 ALTER TABLE CLIENTES ADD CONSTRAINT FK_CLIENTE_ABONO FOREIGN KEY (id_abono)
    REFERENCES ABONOS (id_abono);  
   
-- Referencia: TABLA FACTURAS
ALTER TABLE FACTURAS ADD CONSTRAINT FK_FACTURA_PAGO FOREIGN KEY (id_pago)
    REFERENCES TIPO_DE_PAGO (id_pago);

   ALTER TABLE FACTURAS ADD CONSTRAINT FK_FACTURA_CLIENTE FOREIGN KEY (id_cliente)
    REFERENCES CLIENTES (id_cliente);

-- Referencia: TABLA SUMINISTROS
ALTER TABLE SUMINISTROS ADD CONSTRAINT FK_SUMINISTRO_PROVEEDOR FOREIGN KEY (id_proveedor)
    REFERENCES PROVEEDORES (id_proveedor);
   
ALTER TABLE SUMINISTROS ADD CONSTRAINT FK_SUMINISTRO_EQUIPO FOREIGN KEY (id_equipo)
    REFERENCES EQUIPOS (id_equipo);
   
-- Referencia: TABLA OPERACIONES
ALTER TABLE OPERACIONES ADD CONSTRAINT FK_OPERACION_CLIENTE FOREIGN KEY (id_cliente)
    REFERENCES CLIENTES (id_cliente);
   
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
   
ALTER TABLE VENTAS ADD CONSTRAINT FK_VENTAS_EQUIPOS FOREIGN KEY (id_equipo)
    REFERENCES EQUIPOS (id_equipo);

ALTER TABLE VENTAS ADD CONSTRAINT FK_VENTAS_OPERACIONES FOREIGN KEY (id_operacion)
    REFERENCES OPERACIONES (id_operacion);
    
ALTER TABLE VENTAS ADD CONSTRAINT FK_VENTAS_PAGOS FOREIGN KEY (id_pago)
    REFERENCES TIPO_DE_PAGO (id_pago);
    
ALTER TABLE VENTAS ADD CONSTRAINT FK_VENTAS_CLIENTES FOREIGN KEY (id_cliente)
    REFERENCES CLIENTES (id_cliente);