[![Coder-House-Con-Foto-Perfil-YLogo-Wi-Fly.png](https://i.postimg.cc/SRzGSvNx/Coder-House-Con-Foto-Perfil-YLogo-Wi-Fly.png)](https://postimg.cc/BP4FNNKr)

# Entrega Final Proyecto SQL Coderhouse: Caso Wifly

<img align="right" alt="qr_wifly" width="200" src="https://github.com/JessBasile/Proyecto-SQL-Coderhouse/blob/main/imagenes/qr_wifly.png?raw=true">
<p>Alumna: <a href="https://www.linkedin.com/in/jesica-basile-749b46b3/" target="_blank">Jesica Brenda Basile</a></p>

<p>Comisión: 57190</p>

<p>Tutor: Ariel Annone</p>

<p>Docente: Anderson Michel Torres</p>

<p>Presentación didáctica (<a href="https://view.genially.com/6682fc0815c608001450761e" target="_blank">click aquí</a>)</p>

### Introducción: Descripción de la temática de la base de datos
___
La temática se encuentra inspirada en una empresa real que brinda servicios de internet, bajo el nombre ficticio de Wifly cuya diferenciación en el mercado radica en el nicho al que apunta, puesto que se orienta principalmente a brindar servicio a clientes ubicados en zonas rurales. 
El método de trabajo utilizado es por equipos de trabajo (en grupos compuestos por dos técnicos) a los que se les asignan distintas operaciones (instalaciones, reclamos, modificaciones/cambios y bajas) para efectuar a los clientes que contratan el servicio bajo determinado paquete de servicio.

### Objetivo
___
Diseñar e implementar una base de datos relacional que satisfaga las necesidades para una adecuada gestión y organización en el sistema utilizado en la firma Wifly. La base de datos será eficiente, escalable, fácil de mantener, aportando agilidad y precisión en la asignación de operaciones (instalaciones, reclamos, modificaciones, bajas) a los distintos equipos de trabajo, y la acertada adjudicación de los equipos (routers) a los clientes de acuerdo al plan (o abono) que contrataron.

### Situación problemática
___
Se enfrenta la necesidad de la creación de una base de datos relacional eficiente que permita manejar adecuadamente la asignación de las diferentes operaciones (instalaciones, reclamos, modificaciones/cambios, bajas) a los distintos grupos de técnicos que trabajan en conjunto, con los equipos correpondientes a los planes adquiridos por los clientes. Asimismo, la base de datos deberá proporcionar ágilmente la información del proveedor que otorgó el equipamiento con su correspondiente costo y precio de venta.

### Descripción del problema:

1. Gestión de Operaciones y Empleados: Es necesaria una base de datos que permita identificar los equipos de trabajo a los que se les asignan las distintas operaciones para establecer un orden claro de las tareas a ejecutar por parte de los técnicos.

2. Gestión del Equipamiento adquirido a los Proveedores: Es importante poder determinar con precisión los disponitivos que fueron proporcionados por cada proveedor y suministrar los equipos necesarios para los clientes para satisfacer adecuadamente la necesidad del servicio que contrató el consumidor.

3. Gestión de Facturas y Medios de pago: La base de datos deberá proporcionar información certera para la emisión de las facturas, acorde a las operaciones efectuadas sobre cada cliente, de acuerdo a su costo y precio, a través del tipo de pago previsto por el mismo.

### Resolución de la problemática
___
El problema planteado logra resolverse a través del diseño e implementación de una base de datos que permita identificar con claridad y agilidad las operaciones asignadas a los diferentes técnicos, la respuesta obtenida por los mismos en cada ejecución, el tipo de equipo que adquirió cada cliente (en conocimiento del proveedor que lo suministró) y el abono que contrató en función de ese equipamiento instalado. Asimismo, la base proporcionará la información sobre los precios de los abonos y equipos para la emisión de las facturas, con los distintos medios de pago establecidos por los consumidores. Por último, el CEO podrá acceder a información específica sobre las ganancias obtenidas en las operaciones comerciales efectuadas, entre otros reportes importantes.

### Diagrama de entidad relación
___
### DER EFECTUADO EN [MIRO](https://miro.com/welcomeonboard/NW1tS2xNVTZzR0pNU2I1MWl1cUJ5Ymw2OVZHVmxONWVFaXRkWFM1clJuRFZFclhjZWVaSllJalR2WEJGOW0xZXwzNDU4NzY0NTU4MTkyNjc2ODAwfDI=?share_link_id=663161836839)

[![DER-Wi-Fly-correcto.jpg](https://i.postimg.cc/SK1TMTKL/DER-Wi-Fly-correcto.jpg)](https://postimg.cc/mcMyxSCh)

### DER EN DBEAVER

[![DER-Dbeaver.jpg](https://i.postimg.cc/T3rCt23P/DER-Dbeaver.jpg)](https://postimg.cc/PC5WxjZG)

Se puede observar la similitud de ambos diagramas, lo que demuestra un trabajo adecuado en la elaboración de la base de datos, las tablas y sus relaciones en DBeaver.
### Descripción de base de datos
___
La base de datos de la firma Wifly esta diseñada para gestionar las distintas operaciones ejecutadas por diferentes equipos de trabajo, hacia los clientes de acuerdo al tipo de abono contratado. Esta base de datos cumplirá con las características de ser eficiente, escalable, ágil y precisa para todos lo procesos abordados por la compañia.

**Tablas**

`EQUIPOS`  
+ Contiene información sobre los distintos equipos que utiliza la empresa para brindar servicio.  
+ _Atributos_: IDEQUIPO, MARCA, MODELO, COSTO EQUIPO, PRECIO EQUIPO, CANTIDAD.

`ABONOS`
+ Define los distintos tipos de abonos que ofrece la compañia.  
+ _Atributos_: IDABONO, TIPO DE ABONO, COSTO ABONO, PRECIO ABONO.

`CLIENTES`
+ Almacena información sobre todos los clientes que posee la organiación y el detalle de sus registros.
+ _Atributos_: IDCLIENTE, IDEQUIPO, IDABONO, FECHA DE ALTA, RAZON SOCIAL, DIRECCION, CELULAR, DNI, COORDENADAS, NUNERO DE IP, CORREO ELECTRONICO.

`TIPO_DE_PAGO`
+ Contiene información sobre los diferentes medios de pago disponibles para los cliente de Wifly.
+ _Atributos_: IDPAGO, TIPO DE PAGO.  

`FACTURAS`
+ Contiene información detallada sobre las facturas emitidas a los ditintos clientes.
+ _Atributos_: IDFACTURA, NRO FACTURA, FECHA, IDPAGO, IDCLIENTE.  

`PROVEEDORES`
+ Detalla información sobre los proveedores con los que opera la compañia.
+ _Atributos_: IDPROVEEDOR, RAZON SOCIAL, DIRECCION, TELEFONO, CORREO ELECTRONICO.  

`SUMINISTROS`
+ Comprende información sobre los equipos que suministran los distintos proveedores.
+ _Atributos_: IDPROVEEDOR, IDEQUIPO, FECHA DE SUMINISTRO.  

`OPERACIONES`
+ Alamacena información sobre las distintas operaciones que son abordadas por la firma y su descripción.
+ _Atributos_: IDOPERACION, IDCLIENTE, TIPO_OPERACION, DESCRIPCION, RESPUESTA, FECHA OPERACIONES.  

`AREAS`
+ Contiene información sobre las distintas áreas de trabajo que intervienen en la compañia (tales como: técnicos, administrativos, maestranza, etc).  
+ _Atributos_: IDAREA, AREA DE TRABAJO.  

`EMPLEADOS`
+ Contiene información sobre los empleados contratados que brindan servicio a la firma.
+ _Atributos_: IDEMPLEADO, IDAREA, APELLIDO, NOMBRE, DIRECCION, CELULAR, DNI, FECHA DE NACIMIENTO.  

`ASIGNACIONES`
+ Comprende información sobre las operaciones que le son asignadas a los distintos empleados (equipos de trabajo).
+ _Atributos_: IDEMPLEADO, IDOPERACION, FECHA DE ASIGNACION.  

`VENTAS`
+ Contiene información integral y detallada sobre todas las ventas realizadas en Wifly.
+ _Atributos_: IDVENTA, IDFACTURA, IDABONO, IDEQUIPO, IDOPERACION, IDPAGO, IDCLIENTE, CANTIDAD, COSTO ABONO, PRECIO ABONO, COSTO EQUIPO, PRECIO EQUIPO.

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

## Habilitación de permisos en MySQL y BDeaver para la importación de datos

Antes de proceder a la importación de datos, fue imprescindible habilitar los permisos pertinentes en MySQL y DBeaver para poder efectuarlo sin inconvenientes. Para ello, inicialmente se procedió a habilitar el ´local_infile´ incluyendo un archivo de tipo ´my.ini´ tanto en la carpeta de instalación de MySQL Server 8.0, y también en la carpeta MySQL Workbench 8.0 CE. Esa extensión de archivo, contiene en su interior el comando: 
```sql
[mysqld]
local_infile=1
```
Posteriormente, para aplicar los cambios se procedió a reiniciar MySQL y DBeaver. En DBeaver se editó la pestaña “databases” en la sección propiedades, para modificar el valor "allowLoadLocalInfile" a “true”. Finalmente, para asegurar que realmente los cambios se efectuaron correctamente se procede a realizar las siguientes consultas en su respectivo orden para aplicar la habilitación global, y luego la verificación de la configuración que debe arrojar la leyenda ON, tal como se oberserva en la siguiente sintaxis detallada:
```sql
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
La respuesta fue: local_infile ON, lo cual indica que ya se encuentra habilitado para exportar los datos.
```
## Importación de datos con archivos extensión csv

Los Comandos utilizados para la cargar de datos desde archivos CSV fue la siguiente adaptada a cada tabla, por lo tanto, se repitió 12 veces (para incorporar datos en las 12 tablas):
```sql
LOAD DATA LOCAL INFILE 'ruta/al/archivo/nombre_archivo.csv'
INTO TABLE nombre_tabla
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
```
En mi Proyecto en particular los archivos tipo CSV importados, se encontraban dentro de una carpeta denominada “dataset_mysql” en disco C:/Documents. En el caso de codespace, el archivo que contiene todos los comandos de importación se encuentran dentro de la carpeta `sql_project`, se denomina `population.sql` y los archivos `.csv` se encuentran alojados en la carpeta `sql_project/data_csv`.
Los archivos csv fueron creados con información ficticia pero semejante a la realidad para otorgar seriedad y coherencia al proyecto, dado que fue inspirado en una empresa real.
Los 12 archivos tupo csv se denominan: abonos, areas, asignaciones, clientes, empleados, equipos, facturas, operaciones, proveedores, suministros, tipo_de_pago y ventas.

## Importación CSV en Codespace 
La importación en Codespace se realiza en forma automatizada y generalmente expone el número de registros con exactitud y precisión, tal como se observa en la siguiente captura:

<img align="right" alt="test_db_codespace" src="https://github.com/JessBasile/Proyecto-SQL-Coderhouse/blob/main/imagenes/test-db_codespace.png?raw=true">
&nbsp;<br>

De todos modos, en determinadas oportunidades puede presentar algunas discrepancias en el `test-db` sobre el conteo de registros en la tabla de hechos o alguna otra por razones desconocidas que pueden vincularse con cuestiones de compatibilidad con Workbench, entre otros posibles motivos, es por ello que se incorporó en el testeo un conteo adicional de registros sobre dos tablas, para subsanar esa información errónea que exporádicamente codespace muestra. Los cambios se implementaron a través de la modificación del archivo "Makefile" y se especificó que el conteo de registros se ejecute únicamente durante el test-db.
A continuación se expone la muestra de como se observa en coderpace:

```sql
+--------------+
| Total_Ventas |
+--------------+
| VENTAS: 50   |
+--------------+

+-------------------+
| Total_Operaciones |
+-------------------+
| OPERACIONES: 110  |
+-------------------+
```

De este modo, no caben dudas que las tablas cuentan con la información en su totalidad, aunque el testing en algunas oportunidades muestre una información incompatible y distorcionada.

### Objetos de la base de datos
___
## Vistas

En el proyecto de Wifly las vistas se efectuaron previo a la importación de datos, puesto que se dominaba información sobre los requerimientos necesarios para cada sector. Se diseñaron un total de 6 vistas para diferentes áreas y con distinta finalidad, a continuación se detallan:
1. `Nombre de la vista:` "view_admin_equipos_adquiridos_fecha"
+ _Descripción_: Esta vista permite visualizar el modelo del equipo que tiene asignado e instalado cada cliente y el proveedor que lo suministro con la fecha en la que fué dquirido, y la fecha en la que fué efectivamente facturado al cliente (siempre la fecha en la que se adquirió será anterior a la fecha de facturación).
+ _Objetivo_: Sirve para identificar con exactitud la marca y modelo de equipo que tiene instalado cada cliente; el dominio de esa información por parte de los administrativos y los técnicos es importante, ya que en caso de un reclamo o fallas, al momento de ir hacia el domicilio a revisar podrán tener una noción del modelo de router que se trata, y por experiencia de reportes sobre fallos anteriores en los mismos equipos, identificar con mayor facilidad el problema para solucionarlo reestableciendo el servicio lo antes posible.
+ _Columnas que la componen_: id_cliente, Nombre Cliente, id_equipo, marca, modelo, id_proveedor, Nombre Proveedor, fecha_de_suministro y fecha_factura.
+ _Ejemplo de consulta sobre un cliente en específico:_
```sql
SELECT *
FROM Wifly.view_admin_equipos_adquiridos_fecha
WHERE `Nombre Cliente` = 'Constructora del Norte SA';
```
2. `Nombre de la vista:` "view_admin_abonos_clientes"
+ _Descripción_: Esta vista permite a los administrativos observar el tipo de abono que tiene contratado cada cliente y el precio.
+ _Objetivo_: Es útil para los administrativos y técnicos estar en conocimiento sobre el tipo de abono que tiene contratado el cliente, puesto que mientras mayor ancho de banda se proporcione, mayor será su precio, y permite identificar tendencias en los patrones de consumo y preferencias. 
+ _Columnas que la componen_: id_cliente, Nombre Cliente, id_abono, Tipo de Abono y precio_abono.
+ _Ejemplo de consulta sobre los clientes que tienen contratado el abono más caro:_
```sql
SELECT *
FROM Wifly.view_admin_abonos_clientes
WHERE `Tipo de Abono` = '40MB';
```
3. `Nombre de la vista:` "view_admin_operaciones_respuesta"
+ _Descripción_: El diseño de esta vista permite visualizar las operaciones que fueron asignadas a los distintos empleados y su respuesta.
+ _Objetivo_: Es relevante, dado que los administrativos necesitan estar en conocimiento del "estado" de los reclamos, y el seguimiento de como fueron solucionados los inconvenientes. Asimismo, el dominio de esa información refleja el desempeño obtenido por los técnicos en sus visitas a los domicilios, asi como también, identificar la distribución en el volumen de tareas a cada grupo de trabajo.
+ _Columnas que la componen_: tipo_operacion, fecha_operaciones, "Empleado" (una concatenación de su nombre y apellido) y respuesta.
+ _Ejemplo de consultas:_

- [x] _General_:
```sql
SELECT * FROM Wifly.view_admin_operaciones_respuesta;
```
- [x] _Específica sobre un técnico/empleado_:
```sql
SELECT *   
   FROM view_admin_operaciones_respuesta
   WHERE `Empleado`= 'Juan Perez';
```
4. `Nombre de la vista:` "view_bajas_clientes"
+ _Descripción_: Esta vista permite visualizar los clientes dados de baja con la fecha, destinada principalmente al el CEO y los administrativos.
+ _Objetivo_: Es útil para ambos sectores (CEO y Administración) dado que si el volumen de bajas en muy grande o se eleva, se requerirá indagar para evitar la fuga de clientes hacia la competencia.
+ _Columnas que la componen_: id_cliente, Nombre Cliente, id_operacion, Descripcion Operacion y Fecha Operacion.
+ _Ejemplo de consulta de la vista completa:_
```sql
SELECT * FROM view_bajas_clientes;
```
+ _Ejemplo consulta específica por fecha:_
```sql
SELECT 
    id_cliente, 
    `Nombre Cliente`,
    id_operacion, 
    `Descripcion Operacion`,
    `Fecha Operacion`
FROM Wifly.view_bajas_clientes
WHERE `Fecha Operacion` BETWEEN '2023-01-01' AND '2023-12-31'
ORDER BY id_cliente, `Fecha Operacion`;
```
5. `Nombre de la vista:` "view_reclamos_respuesta"
+ _Descripción_: Muestra los reclamos asentados en la base de datos, y las respuestas efectuadas por los técnicos en las visitas realizadas a los domicilios.
+ _Objetivo_: Es funcional para el Ceo y la Administración poder observar los reclamos registrados, y las respuestas proporcionadas por los técnicos, para analizar en profundidad los motivos que generan mayor disconformidad en los clientes y aplicar medidas para reverir las debilidades identificadas.
+ _Columnas que la componen_: id_peracion, Descripción Reclamo, Respuesta, Fecha, id_cliente y Nombre Cliente.
+ _Ejemplo de consultas_:

- [x] _General_:
```sql
SELECT * FROM view_reclamos_respuesta;
```
- [x] _Específica sobre el último año_:
```sql
SELECT * 
FROM view_reclamos_respuesta
WHERE `Fecha` > '2023-12-31';
```
6. `Nombre de la vista:` "view_gerencia_ganancia_equipos"
+ _Descripción_: Esta vista permite ver en forma concisa la ganancia total obtenida por la suma de los equipos suministrados y agrupados por cliente.
+ _Objetivo_: Proporciona a la Gerencia información sobre la ganancia total agrupada por cliente, y permite tomar decisiones sobre inversiones y distribución de dividendos.
+ _Columnas que la componen_: id_cliente, Ganancia Equipos y razon_social.
+ _Ejemplo de consulta general de la vista_:
```sql
SELECT * FROM view_gerencia_ganancia_equipos;
```
+ _Ejemplo de consulta por órden alfabético:_
```sql
SELECT 
    id_cliente,
    razon_social AS 'Nombre Cliente',
    `Ganancia Equipos`
FROM Wifly.view_gerencia_ganancia_equipos
ORDER BY razon_social ASC;
```
`Resumen de vistas en DBeaver:`

<center>
    <img alt="Vistas" src="https://github.com/JessBasile/Proyecto-SQL-Coderhouse/raw/main/imagenes/vistas.png" style="width: 80%; max-width: 1000px; height: auto;">
</center>

___
## Triggers

En la base de datos Wifly se diseñaron 2 Triggers para validación de datos.
1. `Nombre del Trigger:` "verificar_cantidad_equipo"
+ _Descripción_: Verifica que la cantidad de equipos esten disponibles cuando se realiza una venta.
+ _Tabla afectada_: Ventas
+ Acción: Insert
+ _Ejemplo de inserción de datos válidos_:
```sql
INSERT INTO VENTAS (id_factura, id_abono, id_equipo, id_operacion, id_pago, id_cliente, cantidad, costo_abono, precio_abono, costo_equipo, precio_equipo)
VALUES (1, 1, 1, 1, 1, 1, 1, 7000, 15000, 35000, 45000);
```
+ _Ejemplo de inserción de datos inválidos_:
```sql
INSERT INTO VENTAS (id_factura, id_abono, id_equipo, id_operacion, id_pago, id_cliente, cantidad, costo_abono, precio_abono, costo_equipo, precio_equipo)
VALUES (2, 2, 1, 1, 1, 1, 10, 7000, 15000, 35000, 45000);
```
+ _Leyenda de la respuesta inválida_:
```sql
Error occurred during SQL query execution

Razón:
 SQL Error [1644] [45000]: No hay suficiente cantidad en stock para el equipo seleccionado.
```
2. `Nombre del Trigger:` "chequear_fecha_futura"
+ _Descripción_: Se encarga de evitar inserción de operaciones con fechas futuras que superen los 6 meses, dado que toman compromisos con clientes que probablemente no podrán cumplirse en el plazo establecido, y se sobrecarga de trabajo a los técnicos.
+ _Tabla afectada_: Operaciones
+ Acción: Insert
+ _Ejemplo de inserción de datos válidos_:
```sql
INSERT INTO OPERACIONES (id_operacion, id_cliente, tipo_operacion, descripcion, respuesta, fecha_operaciones)
VALUES (111, 7, 'Reclamo', 'problema con la factura', 'factura corregida', '2024-12-01 09:00:00');
```
+ _Ejemplo de inserción de datos inválidos (que superan los 6 meses)_:
```sql
INSERT INTO OPERACIONES (id_operacion, id_cliente, tipo_operacion, descripcion, respuesta, fecha_operaciones)
VALUES (111, 6, 'Reclamo', 'problema con el equipo', 'equipo reparado', '2025-09-01 15:30:00');
```
+ _Leyenda de la respuesta inválida_:
```sql
Error occurred during SQL query execution

Razón:
 SQL Error [1644] [45000]: La fecha de la operación no puede superar los 6 meses desde ahora. La fecha límite es: (se calcula acorde a la fecha de inserción de datos).
```
`NOTA:` Para verificar que los Tiggers fueron creados adecuadamente, se pueden listar con la siguiente instrucción:
```sql
SHOW TRIGGERS;
```

<center>
    <img alt="Show Triggers" src="https://github.com/JessBasile/Proyecto-SQL-Coderhouse/raw/main/imagenes/show_triggers.png" style="width: 80%; max-width: 1000px; height: auto;">
</center>

___
## Funciones

Se elaboraron 2 funciones para la base de datos Wifly que retornan información relevante para la toma de decisiones.
1. `Nombre de la Función:` "ganancia_anual_cliente"
+ _Descripción_: Arroja la ganancia anual proyectada de acuerdo con el tipo de abono que tiene asignado cada id_cliente.
+ _Utilidad_: Permite identificar que tipo de abono genera mayor ganancia.
+ _Parámetros_: id_cliente INT
+ _Retorno_: ganancia_anual INT
+ _Ejemplo de su aplicación_:
  
- [x] _General_:
```sql
SELECT ganancia_anual_cliente(5) AS ganancia_anual;
```
- [x] _Específica: Expone ganancia anual descendente por cliente _:
```sql
SELECT 
    c.razon_social AS 'Nombre Cliente',
    ganancia_anual_cliente(c.id_cliente) AS 'Ganancia Anual'
FROM 
    CLIENTES c
ORDER BY 
    `Ganancia Anual` DESC;
```
2. `Nombre de la Función:` "descuento_abono"
+ _Descripción_: La función fué creada para utilizarse en el caso de bonificaciones especiales a clientes que sufieron cortes reiterados o baja señal del servicio sostenida, a fin de evitar emisión de nota de crédito (por cuestiones impositivas) para resarcir su disconformidad.
+ _Utilidad_: Evita la emisión de Notas de crédito por reconocimiento de servicio deficiente en determinados casos atípicos con clientes, y directamente se les bonifica el precio del abono en la próxima factura. Su mayor finalidad, es retener al cliente y resarcir el daño provocado a razón de los días con falta de servicio o mala señal.
+ _Parámetros_: p_id_abono INT
+ _Retorno_: precio_descuento INT
+ _Ejemplo de su aplicación_:

- [x] _Especifica_: (tener en cuenta que solo existen hasta la actualidad solo 4 abonos distintos)
```sql
SELECT descuento_abono(1) AS 'Precio Abono con Decuento';
```
`NOTA:` Para verificar que las funciones fueron creadas adecuadamente, se pueden listar con la siguiente instrucción:
```sql
SHOW FUNCTION STATUS WHERE Db = 'Wifly';
```

<img 
    src="https://github.com/JessBasile/Proyecto-SQL-Coderhouse/raw/main/imagenes/show_function.png" 
    alt="Show Functions" 
    style="width: 50%; max-width: 300px; height: auto;">
    
___
## Procedimientos Almacenados
Se elaboraron un total de 4 procedimientos para la base de datos Wifly, 2 en formato tradicional y 2 con la implementación de TCL. 
En los Procedimientos tradicionales, el primero posee solo parámetros de entrada, mientras que el otro, cuenta con parámetros tanto de entrada como de salida.
1. `Nombre del procedimiento:` "insertar_equipo"
+ _Descripción_: Este procedimiento se ejecuta al momento de insertar un nuevo equipo dentro de la tabla pertinente. En caso que la inserción no cumpla con los requisitos necesarios, el procedimiento expondrá un mensaje de error justificando el motivo por el cual no puede incorporarse ese nuevo producto. Este procedimiento **solo** cuenta con parámetros de entrada.
+ _Parámetros de entrada_:
> marca VARCHAR(100),
> 
> modelo VARCHAR(100),
> 
> costo_equipo INT,
> 
> precio_equipo INT,
> 
> cantidad INT

+ _Ejemplo de su uso_:
```sql
CALL insertar_equipo(marca, modelo, costo_equipo, precio_equipo, cantidad);
```
+ _Caso exitoso_:
```sql
CALL insertar_equipo('Net-Link', 'DIR-850L', 30000, 45000, 20);
```
+ _Caso inválido:_ Marca del equipo vacía
```sql
CALL Wifly.insertar_equipo('', 'ModeloX', 30000, 35000, 10);
```
+ _Caso inválido:_ El modelo del equipo vacío
```sql
CALL Wifly.insertar_equipo('MarcaX', '', 30000, 35000, 10);
```
+ _Caso inválido:_ Costo del equipo inferior al mínimo
```sql
CALL Wifly.insertar_equipo('MarcaX', 'ModeloX', 27000, 35000, 10);
```
+ _Caso inválido:_ Precio del equipo inferior o igual al costo
```sql
CALL Wifly.insertar_equipo('MarcaX', 'ModeloX', 30000, 30000, 10);
```
+ _Caso inválido:_ La cantidad es cero
```sql
CALL Wifly.insertar_equipo('MarcaX', 'ModeloX', 30000, 35000, 0);
```
+ _Mensajes de salida en caso insatisfactorio_:

<p>:warning: 'La marca del equipo no puede estar vacía'</p>
<p>:warning: 'El modelo del equipo no puede estar vacío'</p>
<p>:warning: 'El costo del equipo debe ser mayor que 28.000'</p>
<p>:warning: 'El precio del equipo debe ser mayor que su costo'</p>
<p>:warning: 'La cantidad debe ser mayor que 0'</p>
<p>:warning: 'No se insertó ningún equipo por no cumplir con los requisitos mínimos' (para casos excepcionales de errores no anticipados).</p>

2. `Nombre del procedimiento:` "registrar_abono"
+ _Descripción_: Este procedimiento permite registrar un nuevo abono en la tabla pertinente de la base de datos Wifly, siempre que cumpla con el requisito de ser mayor a 40MB, costo mayor a 16 mil y precio mayor a 36 mil. Si cumple con las condiciones se insertan los nuevos datos y devuelve el id_nuevo_abono, caso contrario, mostrará el valor -1 que significa que el registro no se incorporó.
+ _Parámetros de entrada_:
> tipo_abono VARCHAR(50),
> 
> costo_abono INT,
> 
>precio_abono INT,

+ _Ejemplo de su uso_:

1ro: Se declara la variable para recibir el parámetro de salida:
```sql
SET @id_nuevo_abono = 0;
```
2do: Se llama al procedimiento:

:heavy_check_mark: Caso exitoso: se inserta el nuevo abono (el resultado será mayor a 4):
```sql
CALL Wifly.registrar_abono('50MB', 20000, 40000, @id_nuevo_abono);
SELECT @id_nuevo_abono;
```
:no_entry: Caso inválido: No se inserta el nuevo abono (el resultado será -1):
```sql
CALL Wifly.registrar_abono('30MB', 15000, 25000, @id_nuevo_abono);
SELECT @id_nuevo_abono;
```
`NOTA:` Para verificar el ingreso del nuevo abono puede efectuarse una consulta sobre la tabla en cuestión:
```sql
SELECT * FROM ABONOS;
```
___
## Lenguaje de Control de Transacciones (TCL): Aplicado a Store Procedures
Se elaboraron 2 procedimientos con implementación de transacciones para la base de datos Wifly.

1. `Nombre del procedimiento:` "actualizar_domicilio_ip_cliente"
+ _Descripción_: Este procedimiento realiza a través de un control de transacciones la modificación del domicilio y N° de la IP de un cliente. Esto generalmente acontece en simultáneo, dado que cuando un cliente se muda de domicilio cambia la IP por la ubicación.
+ _Parámetros de entrada_:
>p_id_cliente INT,
>
>p_nueva_direccion VARCHAR(100),
>
>p_nueva_ip VARCHAR(50)

+ _CASOS_:
+ Cliente no exite (no incorpora ninguna modificación):
```sql
CALL Wifly.actualizar_domicilio_ip_cliente(51, 'Av. Nueva Dirección 999', '192.168.1.50');
```
+ N° de IP en uso (modifica domicilio, pero no N° de IP)
```sql
CALL Wifly.actualizar_domicilio_ip_cliente(1, 'Av. Nueva Dirección 100', '192.168.1.2');
```
+ Exitoso (modifica ip y domicilio)
```sql
CALL Wifly.actualizar_domicilio_ip_cliente(1, 'Av. Del Valle', '192.168.1.60');
```
+ _Mensajes de salida en casos insatisfactorios_:

<p>:warning: 'SQL Error [1644] [45000]: El cliente no existe, deberá darlo de alta'</p>
<p>:warning: 'SQL Error [1644] [45000]: La IP ya está en uso por otro cliente'</p>

2. `Nombre del procedimiento:` "insertar_cliente_y_factura"
+ _Descripción_: Este procedimiento sirve para insertar un nuevo cliente (en caso que no exista previamente), y a su vez, insertar una factura asociada a ese cliente.
+ _Parámetros de entrada_:

> p_id_cliente INT,
> 
> p_id_equipo INT,
> 
> p_id_abono INT,
> 
> p_razon_social VARCHAR(100),
> 
> p_direccion VARCHAR(100),
> 
> p_celular VARCHAR(100),
> 
> p_dni VARCHAR(50),
> 
> p_numero_ip VARCHAR(50),
> 
> p_correo_electronico VARCHAR(100),
> 
> p_nro_factura VARCHAR(100),
> 
> p_id_pago INT

+ _CASOS_:
+ Exitoso sobre un Cliente ya registrado: Solo se inserta Factura.
```sql
CALL Wifly.insertar_cliente_y_factura(
    1,                                 -- p_id_cliente ***(Cliene existente)***
    1,                                 -- p_id_equipo
    1,                                 -- p_id_abono
    'Constructora del Norte SA',       -- p_razon_social
    'Av. Corrientes 1234',             -- p_direccion
    '011-2345678',                     -- p_celular
    '30567890',                        -- p_dni
    '192.168.1.120',                   -- p_numero_ip
    'info@constructoradelnorte.com.ar',-- p_correo_electronico
    '0001-00000051',                   -- p_nro_factura
    1                                  -- p_id_pago ***(Nueva)***
);
```
+ Abono no existe: No inserta Cliente ni Factura
```sql
CALL Wifly.insertar_cliente_y_factura(
    51,                          -- p_id_cliente (Nuevo)
    1,                           -- p_id_equipo
    999,                         -- p_id_abono (No existente)
    'Nuevo Cliente',             -- p_razon_social
    'Calle Falsa 123',           -- p_direccion
    '123456789',                 -- p_celular
    '12345678',                  -- p_dni
    '192.168.1.200',             -- p_numero_ip
    'nuevo_cliente@ejemplo.com', -- p_correo_electronico
    '0001-00000052',             -- p_nro_factura
    1                            -- p_id_pago
);
```
+ Equipo no existe: No inserta Cliente ni Factura.
```sql
CALL Wifly.insertar_cliente_y_factura(
    51,                          -- p_id_cliente (Nuevo)
    999,                         -- p_id_equipo (Inexistente)
    1,                           -- p_id_abono
    'Nuevo Cliente',             -- p_razon_social
    'Calle Falsa 345',           -- p_direccion
    '123456789',                 -- p_celular
    '12345678',                  -- p_dni
    '192.168.1.500',             -- p_numero_ip
    'nuevo_cliente@ejemplo.com', -- p_correo_electronico
    '0001-00000053',             -- p_nro_factura
    1                            -- p_id_pago
);
```
+ N° Factura ya existe: Cliente insertado y Factura no incorporada
```sql
CALL Wifly.insertar_cliente_y_factura(
    51,                          -- p_id_cliente (Nuevo)
    1,                           -- p_id_equipo
    1,                           -- p_id_abono
    'Nuevo Cliente',             -- p_razon_social
    'Nueva Direccion 123',       -- p_direccion
    '123456789',                 -- p_celular
    '12345678',                  -- p_dni
    '192.168.1.70',              -- p_numero_ip
    'cliente_nuevo@ejemplo.com', -- p_correo_electronico
    '0001-00000050',             -- p_nro_factura (Ya existente)
    1                            -- p_id_pago
);
```
+ ID_PAGO No existente: Cliente incorporado y factura no generada.
```sql
CALL Wifly.insertar_cliente_y_factura(
    52,                          -- p_id_cliente (Nuevo)
    1,                           -- p_id_equipo
    1,                           -- p_id_abono
    'Nuevo Cliente2',            -- p_razon_social
    'Nueva Dire 123',            -- p_direccion
    '123456789',                 -- p_celular
    '12345678',                  -- p_dni
    '192.168.1.100',             -- p_numero_ip
    'nuevo_cliente@ejemplo.com', -- p_correo_electronico
    '0001-00000054',             -- p_nro_factura
    99                           -- p_id_pago (Inexistente)
);
```
+ Exitoso de Cliente y Factura
```sql
CALL Wifly.insertar_cliente_y_factura(
    53,                       -- p_id_cliente (Nuevo)
    1,                        -- p_id_equipo
    1,                        -- p_id_abono
    'New Client',             -- p_razon_social
    'New Address',            -- p_direccion
    '123456789',              -- p_celular
    '12345678',               -- p_dni
    '192.168.1.101',          -- p_numero_ip
    'new_client@ejemplo.com', -- p_correo_electronico
    '0001-00000052',          -- p_nro_factura (Nueva)
    1
  );
```

+ _Mensajes de salida en casos insatisfactorios (totales o parciales)_:

<p>:warning: 'SQL Error [1644] [45000]: El tipo de abono especificado no existe.'</p>
<p>:warning: 'SQL Error [1644] [45000]: El equipo especificado no existe.'</p>
<p>:warning: 'SQL Error [1644] [45000]: El número de factura ya existe.'</p>
<p>:warning: 'SQL Error [1644] [45000]: El tipo de pago especificado no existe.'</p>

+ _Para corroborar los cambios realizados o verificar que la información permanece sin modificarse, se puede ejecutar una consulta de selección utilizando las siguientes instrucciones, según corresponda a cada tabla:
```sql
SELECT * FROM CLIENTES;
SELECT * FROM FACTURAS;
```
`ACLARACIÓN:` Si bien Workbench y codespace identifican que se trata de transacciones de control al incorporar dentro del código la sintaxis "START TRANSACTION", puede realizarse una desactivación manual y posterior activación general para corroborar el éxito del control sobre las transacciones. Para ello, se utilizarán los comandos:
```sql
SET @@autocommit = FALSE;
SET @@autocommit = TRUE;
```
`IMPEMENTACIÓN DE COMANDOS EN TCL`
<p>ROLLBACK es un comando que revierte un transacción y se suele utilizar cuando acontece un error para deshacer los cambios realizados durante la transacción.</p>
<p>SAVEPOINT son puntos de retroceso que guardan modificaciones efectuadas, y son muy útiles en casos que surjan errores, para recuperar instancias de avance anteriores.</p>
<p>COMMIT es el comando que se utiliza para confirmar y guardar permanentemente los cambios efectuados sobre transacciones.</p>

`NOTA:` Para listar la totalidad de los procedimientos creados se puede efectuar la siguiente instrucción:
```sql
SHOW PROCEDURE STATUS WHERE Db = 'Wifly';
```

<img 
    src="https://github.com/JessBasile/Proyecto-SQL-Coderhouse/raw/main/imagenes/show_procedure.png" 
    alt="Show Procedure" 
    style="width: 50%; max-width: 300px; height: auto;">

___
## Roles, usuarios y privilegios

La base de datos Wifly cuenta con 4 roles, 5 usuarios y 5 asignaciones de los roles a los distintos usuarios. A continuación, se detalla explicación de cada uno:

***Roles:***

`administrador_role:` se trata de un rol que otorga todos los privilegios (select, insert, update & delete) sobre la base de datos Wifly en su totalidad, y además, permite otorgar esos mismos privilegios a otros usuarios o roles. Asimismo, este rol tiene acceso implícito a todas las vistas, ejecución de store procedures y funciones.

`admin_gral_role:` es un rol cuyo uso es orientado al sector de administración que tiene todos los permisos excepto eliminar registros (delete) sobre `toda` la base de datos Wifly, dado que, eliminar un registro histórico requiere supervisión previa para preservar la integridad de la base de datos, asi como también permite mejorar la seguridad, control, consistencia, y cumplimiento normativo (en cuanto a la preservación de documentación impositiva por el plazo requerido legalmente). Además, fomenta el uso de prácticas más seguras.

`admin_compras_role:` es un rol orientado al sector de administrativo de compras que posee todos los permisos excepto eliminar registros (delete) únicamente sobre las tablas Proveedores, Suministros y Equipos de la base de datos Wifly, puesto que, al igual que el rol anterior, eliminar un registro histórico requiere supervisión previa para preservar la integridad de la base de datos, la seguridad, control, consistencia, y cumplimiento normativo. Asimismo, fomenta el uso de prácticas más seguras.

`visualizador_role:` es un rol creado con la finalidad de otorgar privilegios únicamente de lectura (select) con acceso de visualización a determinadas tablas específicas (ventas, facturas, empleados y areas). La finalidad de este rol es limitar el acceso solo a cierta información para casos específicos como: acceso del estudio contable, auditorias de organismos de contralor, etc.

***Usuarios:***

`admin_compras:` es un usuario creado para el sector de compras, cuya password es 'compras123', posee una configuración con una política de seguridad que permite 3 intentos fallidos de inicio de sesión antes de bloquear la cuenta temporalmente. El bloqueo de la misma, se encuentra configurado por 3 minútos. Un vez transcurrido ese período de tiempo, el usuario podrá
volver a intentar ingresar normalmente.

`admin_general:` es un usuario diseñado para el sector de administración, cuya password es 'general456'. Al igual que el otro usuario, posee una configuración con una política de seguridad que permite 3 intentos fallidos de inicio de sesión antes de bloquear la cuenta temporalmente. El bloqueo de la misma, se encuentra configurado por 3 minútos. Una vez transcurrido ese período de tiempo, el usuario podrá volver a intentar ingresar normalmente.

`administrador:` es un usuario destinado para su uso por parte del CEO y la Gerencia de administración, cuya password es 'administrador789' y posee una configuración similar a los anteriores usuarios con un bloqueo superados 3 intentos fallidos y 3 minútos para reestablecer y poder volver a intentar ingresar. Si bien, este usuario podría prescindir del bloqueo, ya que se supone que solo es utilizado por altos mandos de la compañia, implementarlo es una medida preventiva ante potenciales ataques de hackeo al usuario o accesos no autorizados. Por último, la Gerenta de administración en su usuario de administrador será la única (junto con el CEO) que podrá observar con simplicidad (la exposición de los datos) a través de las vistas que sintetizan información relevante y sensible, así como también, la ejecución de procedimientos almacenados y funciones.

`estudio_contable:` es un usuario para uso exclusivo por parte del asesor contable externo de la organización (por el cual se tiene alta confianza), su password es 'wiflyestudio', y al igual que los demás usuarios se encuentra configurado con un bloqueo luego de 3 intentos fallidos y 3 minútos para reestablecer el integreso. 

`auditoria:` se trata de un usuario para uso esporádico, cuya password es 'wifly123' y tiene una caducidad a los 180 días. Se encuentra destinado, para casos de auditorias externas (generalmente por organismos de recaudación impositiva en casos requeridos por inspecciones o algún acontecimiento semejante). 

`ACLARACIÓN:` Para listar o consultar los usuarios y roles que han sido explícitamente asignados independientemente de los predeterminados por MySQL, puede ejecutarse la siguiente instrucción:
```sql
SELECT
    FROM_USER AS Roles, 
    TO_USER AS Usuarios
FROM mysql.role_edges;
```

<p style="text-align: center;">
    <img alt="Roles y Usuarios" src="https://github.com/JessBasile/Proyecto-SQL-Coderhouse/blob/main/imagenes/roles_usuarios.png?raw=true" style="display: block; margin: auto; width: 30%; max-width: 200px; height: auto;">
</p>

***Asignación de privilegios:***
+ El rol administrador_role es asignado al usuario administrador: por lo tanto, es un super-usuario con todos los privilegios, que incluso tiene la potestad
de otorgar privilegios a otros usuarios.
+ El rol admin_gral_role es asignado al usuario admin_general: El usuario de administración general tiene los privilegios previstos en el rol del sector administración
general.
+ El rol  visualizador_role es asignado a dos usuarios distintos, por un lado al usuario auditoria y a estudio_contable, dado que las caracteristicas del rol 
son ideales para ese tipo de usuarios. Con la diferencia que el usuario auditoria tiene un período limitado, y el del asesor contable no.

***Testeo de los usuarios y privilegios:***
Los distintos usuarios fueron testeados para corroborar que los roles con los privilegios asignados funcionan adecuadamente. Para ello, se procede a editar la conexión en el
localhost, con el ingreso del usuario y contraseña verificndo una prueba de conexión. Previamente a la comprobación de conexión, la propiedad del driver `allowPublicKeyRetrieval` debe 
establecerse en un valor `TRUE` para que permita la verificación.

<p style="text-align: center;">
    <img alt="PublicKey" src="https://github.com/JessBasile/Proyecto-SQL-Coderhouse/blob/main/imagenes/PublicKey.png?raw=true" style="display: block; margin: auto;">
</p>

A continuación se muestran las distintas pruebas realizadas con los distintos usuarios, y las respuestas obtenidas por el motor de la base de datos:

`administrador:` no tiene limitaciones en cuanto a los privilegios, por lo tanto todas las pruebas efectuadas fueron satisfactorias.

`admin_general:` todos los privilegios asignados funcionan exitosamente, y al intentar realizar un delete se obtuvo la siguiente repuesta:

_Intento de eliminación de un registro:_

```sql
USE Wifly;

DELETE FROM AREAS
WHERE area_de_trabajo = 'Tecnicos';
```
_Respuesta:_ 
```sql
Error occurred during SQL query execution

Razón:
 SQL Error [1142] [42000]: DELETE command denied to user 'admin_general'@'localhost' for table 'areas'
```
`admin_compras:` todos los privilegios asignados funcionan exitosamente, y al intentar realizar un delete se obtuvo la siguiente repuesta:

_Intento de eliminación de un registro:_
```sql
USE Wifly;

DELETE FROM EQUIPOS
WHERE id_equipo = 1;
```
_Respuesta:_
```sql
Error occurred during SQL query execution

Razón:
 SQL Error [1142] [42000]: DELETE command denied to user 'admin_compras'@'localhost' for table 'equipos'
```
`estudio_contable:` el privilegio de observar o efectuar consultas funciona exitosamente, y al intentar realizar una inserción se obtuvo la siguiente repuesta:

_Intento de inserción de un registro:_
```sql
USE Wifly;

INSERT INTO AREAS (area_de_trabajo)
VALUES ('Recursos Humanos');
```
_Respuesta:_
```sql
Error occurred during SQL query execution

Razón:
 SQL Error [1142] [42000]: INSERT command denied to user 'estudio_contable'@'localhost' for table 'areas'
```
`auditoria:` el privilegio de observar o efectuar consultas funciona exitosamente, y al intentar realizar un delete se obtuvo la siguiente repuesta:

_Intento de eliminación de un registro:_
```sql
USE Wifly;

DELETE FROM FACTURAS
WHERE id_factura = 10;
```
_Respuesta:_
```sql
Error occurred during SQL query execution

Razón:
 SQL Error [1142] [42000]: DELETE command denied to user 'auditoria'@'localhost' for table 'facturas'
```
___
## Backup de la base de datos 
Para efectuar el Backup de la base de datos Wifly se decide automatizarlo desde el comando `make backup` en codespace cuya configuración se efectuó a través de `Makefile`.
De todos modos, se realizó un backup desde terminal `cmd` del sistema para abordar otra de las alternativas posibles de efectuarlo. Para ello, previamente debió modificarse la configuración sobre las variables del entorno del sistema operativo (Windows) ubicando la raíz del archivo ejecutable `mysqldump.exe` y copiando la ruta (en mi caso particular) `C:Program files\MySQL\MySQL Server 8.0\bin` en el directorio `PATH`, tal como lo expone la captura a continuación:

<center>
    <img alt="Variables de Entorno" src="https://github.com/JessBasile/Proyecto-SQL-Coderhouse/raw/main/imagenes/variables_entorno.png" style="width: 90%; max-width: 1200px; height: auto;">
</center>

Una vez efectuados los pasos previamente detallados, es importante verificar que la configuración del directorio PATH es correcta ejecutando el comando: 
```sql
mysqldump --version
```
Si la respueta es el siguiente comando (o similar), significa que se encuentra en óptimo funcionamiento:
```sql
MySQL80
```
Aposteriori deberá ejecutarse el siguiente comando, ***mientras MySQL se encuentra corriendo y en funcionamiento*** y la carpeta de destino deberá contar con los permisos pertinentes para poder alojar el backup obtenido:
```sql
mysqldump -u root -p --host 127.0.0.1 --port 3306 --routines --databases Wifly > "C:\Users\Jesica Basile\Documents\backup_Wifly\backupWifly.sql"
```
Esa operación proporcionará el archivo `backupWifly.sql` en la carpeta local "backup_Wifly" indicada como destino.

El archivo `backupWifly.sql` se encuentra disponible en el repositorio dentro de la carpeta `backup_Wifly` en la raíz del repositorio.

`NOTA:`Para corroborar que el backup se realizó correctamente con todos sus objetos, se procede a dropear la base de datos, y nuevamente desde la terminal importar ese backup a MySQL bajo el siguiente comando:
```sql
mysql -u root -p --host 127.0.0.1 --port 3306 Wifly < "C:\Users\Jesica Basile\Documents\backup_Wifly\backupWifly.sql"
```
Una vez ejecutado, si fué exitosa la operación, deberá aparecer la base de datos completa con todos sus objetos creados en MySQL.
___
## Exportación de datos a CSV: para análisis de información en otros motores
Si bien, puede elaborarse un backup sobre la base de datos completa, en ciertos casos, resulta más cómodo solo exportar los datos de las tablas, para que los analistas o consultores externos puedan utilizar esa información en otros motores, tales como: Excel, Power Bi, Tableau, etc. En ese caso, puede elaborarse una exportación automatizada a través del comando `make export` cuya configuración se realizó en el archivo `Makefile` y requirió permisos en `docker_compose.yml`. El funcionamiento, es a través de un Script `export.sql` con el "destino" al que se desea exportar cada archivo en formato csv (la carpeta de destino `export_csv`, es creada en el momento que se ejecuta el comando make export).

_El formato del Script es el siguiente (adaptado a cada tabla):_
```sql
SELECT * FROM 'Nombre de la Tabla'
INTO OUTFILE '/sql_project/export_csv/nombre_de_la_tabla.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';
```

## **Muestra en Codespace:**

<img align="right" alt="qr_wifly" src="https://github.com/JessBasile/Proyecto-SQL-Coderhouse/blob/main/imagenes/export_codespace.gif?raw=true">
&nbsp;<br>

___
### Como correr código en Codespace Github: con bash
Ingresar en la sección codespaces y en la terminal, utilizar los comandos:
- `make` si te da un error de que no conexion al socket, volver al correr el comando make.
- `make test-db` para mirar los datos de cada tabla.
- `make access-db` para acceder a la base de datos.
- `make backup` para realizar un backup de mi base de datos, dentro de una carpeta denominada "dump".
- `make export` para efectuar la exportación de todas las tablas en distintos archivos tipo csv, dentro de una carpeta denominada "export_csv".
- `make clean-db` limpiar la base de datos.

___
<h2 align="center">¡Muchas gracias por su visita! <img src="https://github.com/ABSphreak/ABSphreak/blob/master/gifs/Hi.gif" width="30px"></h2>
