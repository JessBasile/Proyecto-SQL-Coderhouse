USE Wifly;

-- Creación TRIGGERS
-- VALIDACIÓN DE CANTIDAD DE EQUIPOS: verifica que la cantidad de equipos esten disponibles cuando se realiza una venta.
DROP TRIGGER IF EXISTS Wifly.verificar_cantidad_equipo;

DELIMITER //

CREATE TRIGGER verificar_cantidad_equipo
BEFORE INSERT ON VENTAS
FOR EACH ROW
BEGIN
    DECLARE cantidad_disponible INT;

    SELECT cantidad INTO cantidad_disponible
    FROM EQUIPOS
    WHERE id_equipo = NEW.id_equipo;

    IF cantidad_disponible < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay suficiente cantidad en stock para el equipo seleccionado.';
    END IF;
END //

DELIMITER ;

-- VERIFICACIÓN FECHAS FUTURAS EN OPERACIONES: Evita insertar operaciones con fechas futuras que superen los 6 meses.
DROP TRIGGER IF EXISTS chequear_fecha_futura;

DELIMITER //

CREATE TRIGGER chequear_fecha_futura
BEFORE INSERT ON operaciones
FOR EACH ROW
BEGIN
    DECLARE fecha_limite DATETIME;
    DECLARE mensaje_error TEXT;

    -- OBTENER FECHA ACTUAL Y FECHA LIMITE
    SET fecha_limite = DATE_ADD(NOW(), INTERVAL 6 MONTH);

    -- MENSAJE DE ERROR
    SET mensaje_error = CONCAT('La fecha de la operación no puede superar los 6 meses desde ahora. La fecha límite es: ', fecha_limite, '.');

    -- VERIFICACIÓN DE FECHA ACTUAL SUPERA FECHA LIMITE
    IF NEW.fecha_operaciones > fecha_limite THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mensaje_error;
    END IF;
END //

DELIMITER ;