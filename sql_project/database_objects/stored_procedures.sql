USE Wifly;

-- Creacion STORED PROCEDURES
-- PROCEDIMIENTO CON PARÁMETROS DE ENTRADA: Su finalidad es insertar un nuevo equipo en la tabla pertinente.
DROP PROCEDURE IF EXISTS Wifly.insertar_equipo;

DELIMITER //

CREATE PROCEDURE insertar_equipo (
    IN marca VARCHAR(100),
    IN modelo VARCHAR(100),
    IN costo_equipo INT,
    IN precio_equipo INT,
    IN cantidad INT
)
BEGIN
    DECLARE resultado INT DEFAULT 0;

    -- VALIDAR MARCA DEL EQUIPO
    IF marca = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La marca del equipo no puede estar vacía';
    ELSEIF LENGTH(marca) > 100 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La marca del equipo no puede tener más de 100 caracteres';
    END IF;

    -- VALIDAR MODELO DEL EQUIPO
    IF modelo = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El modelo del equipo no puede estar vacío';
    ELSEIF LENGTH(modelo) > 100 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El modelo del equipo no puede tener más de 100 caracteres';
    END IF;

    -- VALIDAR COSTO DEL EQUIPO
    IF costo_equipo <= 28000 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El costo del equipo debe ser mayor que 28.000';
    END IF;

    -- VALIDAR PRECIO DEL EQUIPO
    IF precio_equipo <= costo_equipo THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio del equipo debe ser mayor que su costo';
    END IF;

    -- VALIDAR CANTIDAD
    IF cantidad <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cantidad debe ser mayor que 0';
    END IF;

    -- INSERCIÓN DEL NUEVO EQUIPO
    INSERT INTO EQUIPOS (marca, modelo, costo_equipo, precio_equipo, cantidad)
    VALUES (marca, modelo, costo_equipo, precio_equipo, cantidad);

    -- NÚMERO DE FILAS AFECTADAS
    SET resultado = ROW_COUNT();

    -- VALIDAR INSERCIÓN
    IF resultado = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se insertó ningún equipo por no cumplir con los requisitos mínimos';
    END IF;

    -- MOSTRAR ÚLTIMO REGISTRO INSERTADO
    SELECT * FROM EQUIPOS ORDER BY id_equipo DESC LIMIT 1;

END //

DELIMITER ;

-- PROCEDIMIENTO CON PARÁMETROS DE ENTRADA Y SALIDA: Su finalidad es incorporar un nuevo abono y proporcionar el id_abono de ese nuevo registro.
DROP PROCEDURE IF EXISTS Wifly.registrar_abono;

DELIMITER //

CREATE PROCEDURE Wifly.registrar_abono (
    IN tipo_abono VARCHAR(50),
    IN costo_abono INT,
    IN precio_abono INT,
    OUT id_nuevo_abono INT
)
BEGIN
    -- VALOR DEL PARÁMETRO DE SALIDA
    SET id_nuevo_abono = -1;

    -- ESTABLECER Y VERIFICAR LAS CONDICIONES
    IF 
        -- COMPARAR EL NUEVO ABONO CON LAS CONDICIONES
        tipo_abono > '40MB' AND 
        costo_abono > 16000 AND 
        precio_abono > 36000
    THEN
        -- INSERCIÓN NUEVO ABONO
        INSERT INTO ABONOS (tipo_de_abono, costo_abono, precio_abono)
        VALUES (tipo_abono, costo_abono, precio_abono);

        -- OBTENER ID NUEVO ABONO
        SET id_nuevo_abono = LAST_INSERT_ID();
    END IF;
END //

DELIMITER ;
