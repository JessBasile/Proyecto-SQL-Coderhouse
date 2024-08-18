USE Wifly;

SET GLOBAL local_infile = true;

LOAD DATA LOCAL INFILE '/sql_project/import_ventas.csv'
INTO TABLE VENTAS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_venta, id_factura, id_abono, id_equipo, id_operacion, id_pago, id_cliente, cantidad, costo_abono, precio_abono, costo_equipo, precio_equipo);