USE Wifly;

-- Creacion Vistas
-- VISTA PARA ADMINISTRACIÓN: permite ver el modelo del equipo que tiene asignado e instalado c/cliente y el proveedor que lo suministro con la fecha del suministro y de la factura.
CREATE OR REPLACE VIEW Wifly.view_admin_equipos_adquiridos_fecha AS
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
CREATE OR REPLACE VIEW Wifly.view_admin_abonos_clientes AS
(SELECT
	c.id_cliente,
	c.razon_social AS 'Nombre Cliente',
	c.id_abono,
	a.tipo_de_abono AS 'Tipo de Abono',
	a.precio_abono
FROM CLIENTES c
JOIN ABONOS a ON c.id_abono = a.id_abono);

-- VISTA PARA ADMINISTRACIÓN: permite ver las operaciones que se le asignaron a los distintos empleados y su respuesta.
CREATE OR REPLACE VIEW Wifly.view_admin_operaciones_respuesta AS
(SELECT
	o.tipo_operacion,
	o.fecha_operaciones,
	CONCAT(e.nombre,' ', e.apellido) AS 'Empleado',
	o.respuesta
FROM OPERACIONES o
JOIN ASIGNACIONES a ON o.id_operacion = a.id_operacion
JOIN EMPLEADOS e ON a.id_empleado = e.id_empleado);

-- VISTA PARA CEO Y ADMINISTRACIÓN: permite visualizar las bajas efectuadas con su fecha y los clientes que la efectuaron.
CREATE OR REPLACE VIEW Wifly.view_bajas_clientes AS
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
CREATE OR REPLACE VIEW Wifly.view_reclamos_respuesta AS
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

-- VISTA PARA GERENCIA: permite ver en forma concisa la ganancia obtenida por los equipos vendidos a cada cliente.
CREATE OR REPLACE VIEW Wifly.view_gerencia_ganancia_equipos AS
(SELECT
	v.id_cliente,
	SUM(v.precio_equipo - v.costo_equipo) AS 'Ganancia Equipos',
	c.razon_social
FROM VENTAS v
JOIN CLIENTES c ON v.id_cliente = c.id_cliente
GROUP BY v.id_cliente, c.razon_social
ORDER BY SUM(v.precio_equipo - v.costo_equipo) DESC);
