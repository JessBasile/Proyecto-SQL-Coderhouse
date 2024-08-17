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

-- CONTROL DE TRANSACCIONES (TCL)
-- CONTROL DE TRANSACCIÓN POR ACTUALIZACIÓN DE DIRECCIÓN Y N° IP DEL CLIENTE A TRAVÉS DE UN PROCEDIMIENTO: 
DROP PROCEDURE IF EXISTS Wifly.actualizar_domicilio_ip_cliente;

DELIMITER //

CREATE PROCEDURE Wifly.actualizar_domicilio_ip_cliente(
    IN p_id_cliente INT,
    IN p_nueva_direccion VARCHAR(100),
    IN p_nueva_ip VARCHAR(50)
)
BEGIN
    -- INICIO DE TCL
    START TRANSACTION;

    -- VERIFICAR SI EL CLIENTE EXISTE
    IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE id_cliente = p_id_cliente) THEN
        -- ERROR SI EL CLIENTE NO EXISTE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no existe, deberá darlo de alta';

    ELSE
        -- MODIFICAR DIRECCIÓN CLIENTE
        UPDATE CLIENTES
        SET direccion = p_nueva_direccion
        WHERE id_cliente = p_id_cliente;

        -- SAVEPOINT DESPUÉS DE MODIFICAR DIRECCIÓN
        SAVEPOINT direccion_modificada;

        -- VERIFICAR SI LA IP ESTÁ EN USO
        IF EXISTS (SELECT 1 FROM CLIENTES WHERE numero_ip = p_nueva_ip AND id_cliente <> p_id_cliente) THEN
            -- REVERTIR TRANSACCIÓN HASTA SAVEPOINT
            ROLLBACK TO SAVEPOINT direccion_modificada;

            -- ERROR POR IP EN USO
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La IP ya está en uso por otro cliente';

        ELSE
            -- ACTUALIZAR IP CLIENTE
            UPDATE CLIENTES
            SET numero_ip = p_nueva_ip
            WHERE id_cliente = p_id_cliente;

            -- CONFIRMAR TRANSACCIÓN EXITOSA
            COMMIT;
        END IF;
    END IF;

END //

DELIMITER ;

-- CONTROL DE TRANSACCIÓN PARA INSERTAR NUEVO CLIENTE (SOLO EN CASO QUE NO EXISTA PREVIAMENTE) Y FACTURA A TRAVÉS DE UN PROCEDIMIENTO (PARA CLIENTE YA EXISTENTE O NUEVO).
DROP PROCEDURE IF EXISTS Wifly.insertar_cliente_y_factura;

DELIMITER //

CREATE PROCEDURE Wifly.insertar_cliente_y_factura(
    IN p_id_cliente INT,
    IN p_id_equipo INT,
    IN p_id_abono INT,
    IN p_razon_social VARCHAR(100),
    IN p_direccion VARCHAR(100),
    IN p_celular VARCHAR(100),
    IN p_dni VARCHAR(50),
    IN p_numero_ip VARCHAR(50),
    IN p_correo_electronico VARCHAR(100),
    IN p_nro_factura VARCHAR(100),
    IN p_id_pago INT
)
BEGIN
    -- INICIO DE TCL
    START TRANSACTION;

    -- VERIFICAR EXISTENCIA EQUIPO
    IF NOT EXISTS (SELECT 1 FROM EQUIPOS WHERE id_equipo = p_id_equipo) THEN
        -- ERROR SI EL EQUIPO NO EXISTE
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El equipo especificado no existe.';
    END IF;

    -- VERIFICAR EXISTENCIA ABONO
    IF NOT EXISTS (SELECT 1 FROM ABONOS WHERE id_abono = p_id_abono) THEN
        -- ERROR SI EL ABONO NO EXISTE
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El tipo de abono especificado no existe.';
    END IF;

    -- VERIFICAR EXISTENCIA CLIENTE
    IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE id_cliente = p_id_cliente) THEN
        -- SI EL CLIENTE NO EXISTE, SE INSERTA UN NUEVO CLIENTE
        INSERT INTO CLIENTES (
            id_cliente, id_equipo, id_abono, razon_social, direccion, celular, dni, numero_ip, correo_electronico
        ) VALUES (
            p_id_cliente, p_id_equipo, p_id_abono, p_razon_social, p_direccion, p_celular, p_dni, p_numero_ip, p_correo_electronico
        );
    END IF;

    -- SAVEPOINT DESPUÉS DE INSERTAR CLIENTE O VERIFICAR EXISTENCIA
    SAVEPOINT cliente_verificado;

    -- VERIFICAR EXISTENCIA TIPO DE PAGO
    IF NOT EXISTS (SELECT 1 FROM TIPO_DE_PAGO WHERE id_pago = p_id_pago) THEN
        -- ERROR SI EL TIPO DE PAGO NO EXISTE
        ROLLBACK TO SAVEPOINT cliente_verificado;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El tipo de pago especificado no existe.';
    END IF;

    -- VERIFICAR SI EL NÚMERO DE FACTURA YA EXISTE
    IF p_nro_factura IS NOT NULL THEN
        IF EXISTS (SELECT 1 FROM FACTURAS WHERE nro_factura = p_nro_factura) THEN
            -- ERROR SI EL NÚMERO DE FACTURA YA EXISTE
            ROLLBACK TO SAVEPOINT cliente_verificado;
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El número de factura ya existe.';
        END IF;

        -- INSERTAR NUEVA FACTURA
        INSERT INTO FACTURAS (nro_factura, id_pago, id_cliente)
        VALUES (p_nro_factura, p_id_pago, p_id_cliente);
    END IF;

    -- CONFIRMAR LA TRANSACCIÓN
    COMMIT;
END //

DELIMITER ;
