USE Wifly;

-- Exportar tablas a CSV
SELECT * FROM AREAS
INTO OUTFILE '/sql_project/export_csv/areas.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT * FROM TIPO_DE_PAGO
INTO OUTFILE '/sql_project/export_csv/tipo_de_pago.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT * FROM ABONOS
INTO OUTFILE '/sql_project/export_csv/abonos.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT * FROM PROVEEDORES
INTO OUTFILE '/sql_project/export_csv/proveedores.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT * FROM EQUIPOS
INTO OUTFILE '/sql_project/export_csv/equipos.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT * FROM CLIENTES
INTO OUTFILE '/sql_project/export_csv/clientes.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT * FROM EMPLEADOS
INTO OUTFILE '/sql_project/export_csv/empleados.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT * FROM FACTURAS
INTO OUTFILE '/sql_project/export_csv/facturas.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT * FROM OPERACIONES
INTO OUTFILE '/sql_project/export_csv/operaciones.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT * FROM ASIGNACIONES
INTO OUTFILE '/sql_project/export_csv/asignaciones.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT * FROM SUMINISTROS
INTO OUTFILE '/sql_project/export_csv/suministros.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT * FROM VENTAS
INTO OUTFILE '/sql_project/export_csv/ventas.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';
SHOW VARIABLES LIKE 'secure_file_priv';
