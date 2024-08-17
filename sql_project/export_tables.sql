USE Wifly;

-- Exportar tabla VENTAS
SELECT * FROM VENTAS
INTO OUTFILE '/var/lib/mysql-files/ventas_export.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- Exportar tabla CLIENTES
SELECT * FROM CLIENTES
INTO OUTFILE '/var/lib/mysql-files/clientes_export.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

