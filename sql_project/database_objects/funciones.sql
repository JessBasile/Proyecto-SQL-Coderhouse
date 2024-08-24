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

-- FUNCIÓN DESCUENTO SOBRE ABONOS: Se utiliza para el caso de bonificaciones especiales a clientes que sufieron cortes reiterados o baja señal del servicio sostenida, a fin de evitar emisión de nota de crédito para resarcir su disconformidad.
DROP FUNCTION IF EXISTS Wifly.descuento_abono;

DELIMITER //

CREATE FUNCTION descuento_abono(p_id_abono INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE precio_origen INT;
    DECLARE precio_descuento INT;

    -- PRECIO ORIGINAL SEGÚN ABONO PROPORCIONADO
    SELECT precio_abono INTO precio_origen
    FROM ABONOS
    WHERE id_abono = p_id_abono;

    -- CALCULAR EL 10% CON DESCUENTO
    SET precio_descuento = precio_origen * 0.5;

    -- RETORNAR EL PRECIO CON EL DESCUENTO
    RETURN precio_descuento;
END //

DELIMITER ;
