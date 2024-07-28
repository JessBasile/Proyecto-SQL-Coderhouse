USE Wifly;

-- Creación FUNCIONES
-- FUNCIÓN DE GANANCIA ANUAL POR CLIENTE: Arroja la ganancia anual por el tipo de abono que tiene asignado cada id_cliente.
DROP FUNCTION IF EXISTS Wifly.ganancia_anual_cliente;

DELIMITER //

CREATE FUNCTION ganancia_anual_cliente(id_cliente INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ganancia_mensual INT;
    DECLARE ganancia_anual INT;
    SELECT 
       v.precio_abono - v.costo_abono
    INTO ganancia_mensual
    FROM VENTAS v
    WHERE v.id_cliente = id_cliente;
    SET ganancia_anual = ganancia_mensual * 12;

    RETURN ganancia_anual;
END //

DELIMITER ;

-- FUNCIÓN DE CANTIDAD EQUIPOS VENDIDOS: Arroja la cantidad total vendida por id equipo.

DROP FUNCTION IF EXISTS Wifly.cantidad_vendida_por_equipo

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
