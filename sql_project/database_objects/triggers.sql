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

-- VALIDACIÓN DEL PRECIO ABONO: Establece como precio mínimo 15.000 para la incorporación de nuevos abonos.
DROP TRIGGER IF EXISTS nuevo_abono;

DELIMITER //

CREATE TRIGGER nuevo_abono
BEFORE INSERT ON ABONOS
FOR EACH ROW
BEGIN
    IF NEW.precio_abono < 15000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio del abono debe ser superior a 15.000';
    END IF;
END //

DELIMITER ;
