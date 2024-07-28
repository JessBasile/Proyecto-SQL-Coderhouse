USE Wifly;

-- IMPORTANTE PARA QUE ENTIENDA QUE DEBE HACER LA IMPORTACION
SET GLOBAL local_infile = true;

-- IMPORTACIÓN DE DATOS DESDE ARCHIVO CSV

LOAD DATA LOCAL INFILE '/sql_project/data_csv/areas.csv'
INTO TABLE AREAS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_area, area_de_trabajo);

LOAD DATA LOCAL INFILE '/sql_project/data_csv/tipo_de_pago.csv'
INTO TABLE TIPO_DE_PAGO
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_pago, tipo_de_pago);

LOAD DATA LOCAL INFILE '/sql_project/data_csv/abonos.csv'
INTO TABLE ABONOS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_abono, tipo_de_abono, costo_abono, precio_abono);

LOAD DATA LOCAL INFILE '/sql_project/data_csv/proveedores.csv'
INTO TABLE PROVEEDORES
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_proveedor, razon_social, direccion, telefono, correo_electronico);

LOAD DATA LOCAL INFILE '/sql_project/data_csv/equipos.csv'
INTO TABLE EQUIPOS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_equipo, marca, modelo, costo_equipo, precio_equipo, cantidad);

LOAD DATA LOCAL INFILE '/sql_project/data_csv/clientes.csv'
INTO TABLE CLIENTES
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_cliente, id_equipo, id_abono, fecha_de_alta, razon_social, direccion, celular, dni, coordenadas, numero_ip, correo_electronico);

LOAD DATA LOCAL INFILE '/sql_project/data_csv/empleados.csv'
INTO TABLE EMPLEADOS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_empleado, id_area, apellido, nombre, direccion, celular, dni, fecha_de_nacimiento);

LOAD DATA LOCAL INFILE '/sql_project/data_csv/facturas.csv'
INTO TABLE FACTURAS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_factura, nro_factura, fecha,id_pago, id_cliente);

LOAD DATA LOCAL INFILE '/sql_project/data_csv/operaciones.csv'
INTO TABLE OPERACIONES
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_operacion, id_cliente, tipo_operacion, descripcion, respuesta, fecha_operaciones);

LOAD DATA LOCAL INFILE '/sql_project/data_csv/asignaciones.csv'
INTO TABLE ASIGNACIONES
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_empleado, id_operacion, fecha_de_asignacion);

LOAD DATA LOCAL INFILE '/sql_project/data_csv/suministros.csv'
INTO TABLE SUMINISTROS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_proveedor, id_equipo, fecha_de_suministro);

LOAD DATA LOCAL INFILE '/sql_project/data_csv/ventas.csv'
INTO TABLE VENTAS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_venta, id_factura, id_abono, id_equipo, id_operacion, id_pago, id_cliente, cantidad, costo_abono, precio_abono, costo_equipo, precio_equipo);
