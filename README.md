[![Coder-House-Con-Foto-Perfil-YLogo-Wi-Fly.png](https://i.postimg.cc/SRzGSvNx/Coder-House-Con-Foto-Perfil-YLogo-Wi-Fly.png)](https://postimg.cc/BP4FNNKr)

# Entrega Proyecto SQL Coderhouse

## Segunda preentrega

Alumna: [Jesica Brenda Basile](https://www.linkedin.com/in/jesica-basile-749b46b3/)

Comisión: 57190

Tutor: Ariel Annone

Docente: Anderson Michel Torres

Presentación didáctica ([click aquí](https://view.genially.com/6682fc0815c608001450761e))

### Introducción: Descripción de la temática de la base de datos
___
La temática se encuentra inspirada en una empresa real que brinda servicios de internet, bajo el nombre ficticio de Wifly cuya diferenciación en el mercado radica en el nicho al que apunta, puesto que se orienta principalmente a brindar servicio a clientes ubicados en zonas rurales. 
El método de trabajo utilizado es por equipos de trabajo (en grupos compuestos por dos técnicos) a los que se les asignan distintas operaciones (instalaciones, reclamos, modificaciones/cambios y bajas) para efectuar a los clientes que contratan el servicio bajo con determinado paquete de servicio.

### Objetivo
___
Diseñar e implementar una base de datos relacional que satisfaga las necesidades para una adecuada gestión y organización en el sistema utilizado en la firma Wifly. La base de datos será eficiente, escalable, fácil de mantener, aportando agilidad y precisión en la asignación de operaciones (instalaciones, reclamos, modificaciones, bajas) a los distintos equipos de trabajo, y la acertada adjudicación de los equipos a los clientes de acuerdo al plan (o abono) que contrataron.

### Situación problemática
___
Se enfrenta la necesidad de la creación de una base de datos relacional eficiente que permita manejar adecuadamente la asignación de las diferentes operaciones (instalaciones, reclamos, modificaciones/cambios, bajas) a los distintos grupos de trabajo, con los equipos correpondientes a los planes adquiridos por los clientes. Asimismo, la base de datos deberá proporcionar ágilmente la información del proveedor que otorgó el equipamiento con su correspondiente costo y precio de venta.

### Descripción del problema:

1. Gestión de Operaciones y Empleados: Es necesaria una base de datos que permita identificar los equipos de trabajo a los que se les asignan las distintas operaciones para establecer un orden claro de las tareas a ejecutar por parte de los trabajadores.

2. Gestión del Equipamiento adquirido a los Proveedores: Es importante poder determinar y suministrar los equipos necesarios para los clientes que son adquiridos a los proveedores para satisfacer adecuadamente la necesidad del servicio que contrató el consumidor.

3. Gestión de Facturas y Medios de pago: La base de datos deberá proporcionar información certera para la emisión de las facturas, acorde a las operaciones efectuadas sobre cada cliente, de acuerdo a su costo y precio, a través del pago previsto por el mismo.

### Resolución de la problemática
___
El problema planteado logra resolverse a través del diseño e implementación de una base de datos que permita identificar con claridad y agilidad las operaciones asignadas a los diferentes técnicos, la respuesta obtenida por los mismos en cada ejecución, el tipo de equipo que adquirió cada cliente (en conocimiento del proveedor que lo suministró) y el abono que contrató en función de ese equipamiento instalado. Asimismo, la base proporcionará la información sobre los precios de los abonos y equipos para la emisión de las facturas, con los distintos medios de pago establecidos por los consumidores.

### Diagrama de entidad relación
___
### DER EFECTUADO EN [MIRO](https://miro.com/welcomeonboard/NW1tS2xNVTZzR0pNU2I1MWl1cUJ5Ymw2OVZHVmxONWVFaXRkWFM1clJuRFZFclhjZWVaSllJalR2WEJGOW0xZXwzNDU4NzY0NTU4MTkyNjc2ODAwfDI=?share_link_id=663161836839)

[![DER-Wi-Fly-correcto.jpg](https://i.postimg.cc/SK1TMTKL/DER-Wi-Fly-correcto.jpg)](https://postimg.cc/mcMyxSCh)

### DER EN DBEAVER

[![DER-Dbeaver.jpg](https://i.postimg.cc/T3rCt23P/DER-Dbeaver.jpg)](https://postimg.cc/PC5WxjZG)

Se puede observar la similitud de ambos diagramas, lo que demuestra un trabajo adecuado en la elaboración de la base de datos, las tablas y sus relaciones en DBeaver.
### Descripción de base de datos
___
Esta base de datos de la firma Wifly esta diseñada para gestionar las distintas operaciones ejecutadas por diferentes equipos de trabajo, hacia los clientes de acuerdo al tipo de abono contratado. Esta base de datos cumplirá con las características de ser eficiente, escalable, ágil y precisa para todos lo procesos abordados por la compañia.

**Tablas**

`EQUIPOS`  
+ Contiene información sobre los distintos equipos que utiliza la empresa para brindar servicio.  
+ Atributos: IDEQUIPO, MARCA, MODELO, COSTO EQUIPO, PRECIO EQUIPO, CANTIDAD.

`ABONOS`
+ Define los distintos tipos de abonos que ofrece la compañia.  
+ Atributos: IDABONO, TIPO DE ABONO, COSTO ABONO, PRECIO ABONO.

`CLIENTES`
+ Almacena información sobre todos los clientes que posee la organiación y el detalle de sus registros.
+ Atributos: IDCLIENTE, IDEQUIPO, IDABONO, FECHA DE ALTA, RAZON SOCIAL, DIRECCION, CELULAR, DNI, COORDENADAS, NUNERO DE IP, CORREO ELECTRONICO.

`TIPO_DE_PAGO`
+ Contiene información sobre los diferentes medios de pago disponibles para los cliente de Wifly.
+ Atributos: IDPAGO, TIPO DE PAGO.  

`FACTURAS`
+ Contiene información detallada sobre las facturas emitidas a los ditintos clientes.
+ Atributos: IDFACTURA, NRO FACTURA, FECHA, IDPAGO, IDCLIENTE.  

`PROVEEDORES`
+ Detalla información sobre los proveedores con los que opera la compañia.
+ Atributos: IDPROVEEDOR, RAZON SOCIAL, DIRECCION, TELEFONO, CORREO ELECTRONICO.  

`SUMINISTROS`
+ Comprende información sobre los equipos que suministran los distintos proveedores.
+ Atributos: IDPROVEEDOR, IDEQUIPO, FECHA DE SUMINISTRO.  

`OPERACIONES`
+ Alamacena información sobre las distintas operaciones que son abordadas por la firma y su descripción.
+ Atributos: IDOPERACION, IDCLIENTE, TIPO_OPERACION, DESCRIPCION, RESPUESTA, FECHA OPERACIONES.  

`AREAS`
+ Contiene información sobre las distintas áreas de trabajo que intervienen en la compañia (tales como: técnicos, administrativos, maestranza, etc).  
+ Atributos: IDAREA, AREA DE TRABAJO.  

`EMPLEADOS`
+ Contiene información sobre los empleados contratados que brindan servicio a la firma.
+ Atributos: IDEMPLEADO, IDAREA, APELLIDO, NOMBRE, DIRECCION, CELULAR, DNI, FECHA DE NACIMIENTO.  

`ASIGNACIONES`
+ Comprende información sobre las operaciones que le son asignadas a los distintos empleados (equipos de trabajo).
+ Atributos: IDEMPLEADO, IDOPERACION, FECHA DE ASIGNACION.  

`VENTAS`
+ Contiene información integral y detallada sobre todas las ventas realizadas en Wifly.
+ Atributos: IDVENTA, IDFACTURA, IDABONO, IDEQUIPO, IDOPERACION, IDPAGO, IDCLIENTE, CANTIDAD, COSTO ABONO, PRECIO ABONO, COSTO EQUIPO, PRECIO EQUIPO.

### Listado de las tablas con descripción de estructura
___

**Tabla Equipos**

| COLUMNA        | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                           |
|----------------|--------------|---------------|-------------------------------------------------------------------------------------------------------|
| ID EQUIPO      | INT          | PK            | No admite datos nulos y es autoincremental.                                                          |
| MARCA          | VARCHAR(100) |               | Por default coloca el equipo más pequeño de wifi (en caso de no ingresarse ese dato).                 |
| MODELO         | VARCHAR(100) |               | Por default coloca el modelo más económico de wifi (en caso de no ingresarse ese dato).                |
| COSTO EQUIPO   | INT          |               | Por default coloca el costo del equipo más barato (en caso de no ingresarse ese dato).                 |
| PRECIO EQUIPO  | INT          |               | Por default coloca el precio del equipo más barato (en caso de no ingresarse ese dato).                |
| CANTIDAD       | INT          |               | No admite datos nulos.                                                                              |


**Tabla Abonos**

| COLUMNA       | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                           |
|---------------|--------------|---------------|-------------------------------------------------------------------------------------------------------|
| ID ABONO      | INT          | PK            | No admite datos nulos y es autoincremental.                                                          |
| TIPO DE ABONO | VARCHAR(20)  |               | Por default coloca el tipo de equipo más bajo 10MB (en caso de no ingresarse ese dato).                |
| COSTO ABONO   | INT          |               | Por default coloca el costo del tipo de equipo más bajo 10MB (en caso de no ingresarse ese dato).      |
| PRECIO ABONO  | INT          |               | Por default coloca el precio del tipo de equipo más bajo 10MB (en caso de no ingresarse ese dato).     |

**Tabla Clientes**

| COLUMNA             | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                                               |
|---------------------|--------------|---------------|---------------------------------------------------------------------------------------------------------------------------|
| ID CLIENTE          | INT          | PK            | No admite datos nulos y es autoincremental.                                                                              |
| ID EQUIPO           | INT          | FK            | No admite datos nulos.                                                                                                    |
| ID ABONO            | INT          |               | No admite datos nulos.                                                                                                    |
| FECHA DE ALTA       | DATETIME     |               | Por default coloca fecha actual (en caso de no ingresarse ese dato).                                                        |
| RAZON SOCIAL        | VARCHAR(100) |               | No admite datos nulos, puede ser nombre y apellido.                                                                       |
| DIRECCION           | VARCHAR(100) |               | No admite datos nulos.                                                                                                    |
| CELULAR             | VARCHAR(100) |               | No admite datos nulos.                                                                                                    |
| DNI                 | VARCHAR(50)  |               | No admite datos nulos.                                                                                                    |
| COORDENADAS         | VARCHAR(30)  |               | Por default se incorporará la leyenda "Carga en domicilio", para que en caso que el cliente no lo proporcione, en la visita al domicilio los técnicos lo incorporen. |
| NUMERO IP           | VARCHAR(50)  |               | No admite datos nulos y debe ser único.                                                                                   |
| CORREO ELECTRONICO  | VARCHAR(100) |               | No admite datos nulos y debe ser único.                                                                                   |

**Tabla Tipo de Pago**

| COLUMNA       | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                                 |
|---------------|--------------|---------------|-------------------------------------------------------------------------------------------------------------|
| ID PAGO        | INT          | PK            | No admite datos nulos y es autoincremental.                                                                |
| TIPO DE PAGO   | VARCHAR(50)  |               | Por default se tomará el tipo de pago "Efectivo", para el caso que no se especifique otro medio de pago.  |

**Tabla Facturas**

| COLUMNA        | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                       |
|----------------|--------------|---------------|---------------------------------------------------------------------------------------------------|
| ID FACTURA     | INT          | PK            | No admite datos nulos y es autoincremental.                                                        |
| NRO FACTURA    | VARCHAR(100) |               | No admite datos nulos.                                                                            |
| FECHA          | DATETIME     |               | Por default coloca fecha actual (en caso de no ingresarse ese dato).                              |
| ID PAGO        | INT          | FK            | No admite datos nulos.                                                                            |
| ID CLIENTE     | INT          |               | No admite datos nulos.                                                                            |

**Tabla Proveedores**

| COLUMNA            | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                       |
|--------------------|--------------|---------------|---------------------------------------------------------------------------------------------------|
| ID PROVEEDOR       | INT          | PK            | No admite datos nulos y es autoincremental.                                                        |
| RAZON SOCIAL       | VARCHAR(100) |               | No admite datos nulos, y debe ser único (puede ser nombre y apellido).                          |
| DIRECCION          | VARCHAR(100) |               | No admite datos nulos.                                                                            |
| TELEFONO           | INT          |               | No admite datos nulos, y debe ser único.                                                          |
| CORREO ELECTRONICO | VARCHAR(100) |               | No admite datos nulos, y debe ser único.                                                          |

**Tabla Suministros**

| COLUMNA              | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                   |
|----------------------|--------------|---------------|-----------------------------------------------------------------------------------------------|
| ID PROVEEDOR         | INT          | PK            | No admite datos nulos.                                                                       |
| ID EQUIPO            | INT          | PK            | No admite datos nulos.                                                                       |
| FECHA DE SUMINISTRO  | DATETIME     |               | Por default coloca fecha actual (en caso de no ingresarse ese dato).                          |

**Tabla Operaciones**

| COLUMNA           | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                       |
|-------------------|--------------|---------------|---------------------------------------------------------------------------------------------------|
| ID OPERACIÓN      | INT          | PK            | No admite datos nulos y es autoincremental.                                                      |
| ID CLIENTE        | INT          |               | No admite datos nulos.                                                                          |
| TIPO OPERACIÓN    | VARCHAR(100) |               | No admite datos nulos.                                                                          |
| DESCRIPCION       | VARCHAR(300) |               | No admite datos nulos.                                                                          |
| RESPUESTA         | VARCHAR(200) |               | No admite datos nulos.                                                                          |
| FECHA OPERACIONES | DATETIME     |               | Por default coloca fecha actual (en caso de no ingresarse ese dato).                            |

**Tabla Áreas**

| COLUMNA          | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                             |
|------------------|--------------|---------------|---------------------------------------------------------|
| ID AREA          | INT          | PK            | No admite datos nulos y es autoincremental.            |
| AREA DE TRABAJO  | VARCHAR(50)  |               | No admite datos nulos.                                |

**Tabla Empleados**

| COLUMNA              | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                     |
|----------------------|--------------|---------------|-------------------------------------------------------------------------------------------------|
| ID EMPLEADO          | INT          | PK            | No admite datos nulos y es autoincremental.                                                    |
| ID AREA              | INT          | FK            | No admite datos nulos.                                                                        |
| APELLIDO             | VARCHAR(100) |               | No admite datos nulos.                                                                        |
| NOMBRE               | VARCHAR(100) |               | No admite datos nulos.                                                                        |
| DIRECCION            | VARCHAR(100) |               | No admite datos nulos.                                                                        |
| CELULAR              | VARCHAR(50)  |               | No admite datos nulos y debe ser único.                                                        |
| DNI                  | VARCHAR(50)  |               | No admite datos nulos.                                                                        |
| FECHA DE NACIMIENTO  | DATE         |               | No admite datos nulos.                                                                        |

**Tabla Asignaciones**

| COLUMNA              | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                   |
|----------------------|--------------|---------------|-----------------------------------------------------------------------------------------------|
| ID EMPLEADO          | INT          | PK            | No admite datos nulos.                                                                      |
| ID OPERACIÓN         | INT          | PK            | No admite datos nulos.                                                                      |
| FECHA DE ASIGNACION  | DATETIME     |               | Por default coloca fecha actual (en caso de no ingresarse ese dato).                        |

**Tabla Ventas**

| COLUMNA         | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                       |
|-----------------|--------------|---------------|---------------------------------------------------------------------------------------------------|
| ID VENTA        | INT          | PK            | No admite datos nulos y es autoincremental.                                                      |
| ID FACTURA      | INT          | FK            | No admite datos nulos.                                                                          |
| ID ABONO        | INT          | FK            | No admite datos nulos.                                                                          |
| ID EQUIPO       | INT          |               | No admite datos nulos.                                                                          |
| ID OPERACIÓN    | INT          | FK            | No admite datos nulos.                                                                          |
| ID PAGO         | INT          |               | No admite datos nulos.                                                                          |
| ID CLIENTE      | INT          | FK            | No admite datos nulos.                                                                          |
| CANTIDAD        | INT          |               | No admite datos nulos.                                                                          |
| COSTO ABONO     | INT          |               | No admite datos nulos.                                                                          |
| PRECIO ABONO    | INT          |               | No admite datos nulos.                                                                          |
| COSTO EQUIPO    | INT          |               | No admite datos nulos.                                                                          |
| PRECIO EQUIPO   | INT          |               | No admite datos nulos.                                                                          |

### Estructura e ingesta de Datos
___

### Instrucciones para habilitar permisos en MySQL y BDeaver

Antes de proceder a la importación de datos, fue imprescindible habilitar los permisos pertinentes en MySQL y DBeaver para poder efectuarlo sin inconvenientes. Para ello, inicialmente se procedió a habilitar el ´local_infile´ incluyendo un archivo de tipo ´my.ini´ tanto en la carpeta de instalación de MySQL Server 8.0, y también en la carpeta MySQL Workbench 8.0 CE. Esa extensión de archivo, contiene en su interior el comando: 
[mysqld]
local_infile=1
Posteriormente, para aplicar los cambios se procedió a reiniciar MySQL y DBeaver. En DBEaver se editó la pestaña “databases” en la sección propiedades, para modificar el valor "allowLoadLocalInfile" a “true”. Finalmente, para asegurar que realmente los cambios se efectuaron correctamente se efectuó una consulta con la siguiente sintaxis:
SHOW VARIABLES LIKE 'local_infile';
La respuesta fue: local_infile ON, lo cual indica que ya se encuentra habilitado para exportar los datos.

### Importación de datos con archivos extensión csv

Los Comandos utilizados para la cargar de datos desde archivos CSV fue la siguiente adaptada a cada tabla, por lo tanto, se repitió 12 veces (para incorporar datos en las 12 tablas):

LOAD DATA LOCAL INFILE 'ruta/al/archivo/nombre_archivo.csv'
INTO TABLE nombre_tabla
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

En mi Proyecto en particular los archivos tipo CSV importados, se encontraban dentro de una carpeta denominada “dataset_mysql” en disco D:/Documents.
Los archivos csv fueron creados con información ficticia pero semejante a la realidad para otorgar seriedad y coherencia al proyecto, dado que fue inspirado en una empresa real.
