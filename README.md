[![Coder-House-Con-Foto-Perfil-YLogo-Wi-Fly.png](https://i.postimg.cc/SRzGSvNx/Coder-House-Con-Foto-Perfil-YLogo-Wi-Fly.png)](https://postimg.cc/BP4FNNKr)

# Entrega Proyecto SQL Coderhouse

## Primera preentrega

Alumna: Jesica Brenda Basile

Comisión: 57190

Tutor: Ariel Annone

Docente: Anderson Michel Torres

### Introducción: Descripción de la temática de la base de datos
___
La temática se encuentra inspirada en una empresa real que brinda servicios de internet, bajo el nombre ficticio de Wifly cuya diferenciación en el mercado radica en el nicho del mercado al que apunta, puesto que se orienta principalmente a brindar servicio a clientes ubicados en zonas rurales. 
El método de trabajo utilizado es por equipos de trabajo (en grupos compuestos por dos técnicos) a los que se les asignan distintas operaciones (instalaciones, reclamos, modificaciones/cambios y bajas) para efectuar a los clientes que contratan el servicio bajo con determinado paquete de servicio.

### Objetivo
___
Diseñar e implementar una base de datos relacional que satisfaga las necesidades para una adecuada gestión y organización en el sistema utilizado en la firma Wifly. La base de datos será eficiente, escalable, fácil de mantener, aportando agilidad y precisión en la asignación de operaciones (instalaciones, reclamos, modificaciones, bajas) a los distintos equipos de trabajo, y la acertada adjudicación de los equipos a los clientes de acuerdo al plan (o abono) que contrataron.

### Situación problemática
___
### Modelo de negocio
___
### Diagrama de entidad relación
___
### DER SIMPLIFICADO
```
+-----------------+         +-----------------+         +--------------------+       
|    EQUIPOS      |         |      ABONOS     |         |      CLIENTES      |
+-----------------+         +-----------------+         +--------------------+
| id_equipo (PK)  |         | id_abono (PK)   |         | id_cliente (PK)    |
| marca           |         | tipo_de_abono   |         | id_equipo (FK)     |
| modelo          |         | costo_abono     |         | id_abono (FK)      |
| costo_equipo    |         | precio_abono    |         | fecha_de_alta      |
| precio_equipo   |         +-----------------+         | razon_social       |
| cantidad        |                                     | direccion          |
+-----------------+                                     | celular            |
                                                        | dni                |
                                                        | coordenadas        |
                                                        | numero_ip          |
                                                        | correo_electronico |
                                                        +--------------------+

+-----------------+         +-----------------+         +-----------------+
|  SUMINISTROS    |         |   OPERACIONES   |         |      AREAS      |
+-----------------+         +-----------------+         +-----------------+
| id_proveedor (FK)|        | id_operacion (PK)|        | id_area (PK)    |
| id_equipo (FK)  |         | id_cliente (FK) |         | area_de_trabajo |
| fecha_de_suministro|      | instalacion     |         +-----------------+
+-----------------+         | reclamo         |
                             | modificacion    |
                             | baja            |
                             | descripcion     |
                             | motivo          |
                             | respuesta       |
                             | fecha_operacion |
                             +-----------------+

+-----------------+         +-----------------+
|   EMPLEADOS     |         |   ASIGNACIONES  |
+-----------------+         +-----------------+
| id_empleado (PK)|         | id_empleado (FK)|
| id_area (FK)    |         | id_operacion (FK)|
| apellido        |         | fecha_de_asignacion|
| nombre          |         +-----------------+
| direccion       |
| celular (UN)    |
| dni             |
| fecha_de_nacimiento |
+-----------------+

+-----------------+
|     VENTAS      |
+-----------------+
| id_venta (PK)   |
| id_factura (FK) |
| id_abono (FK)   |
| id_equipo (FK)  |
| id_operacion (FK)|
| id_pago (FK)    |
| id_cliente (FK) |
| cantidad        |
| costo_abono     |
| precio_abono    |
| costo_equipo    |
| precio_equipo   |
+-----------------+

```
### DER EFECTUADO EN [MIRO](https://miro.com/welcomeonboard/NW1tS2xNVTZzR0pNU2I1MWl1cUJ5Ymw2OVZHVmxONWVFaXRkWFM1clJuRFZFclhjZWVaSllJalR2WEJGOW0xZXwzNDU4NzY0NTU4MTkyNjc2ODAwfDI=?share_link_id=663161836839)
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
+ Atributos: IDOPERACION, IDCLIENTE, INSTALACIONES, RECLAMO, MODIFICACIÓN, BAJA, DESCRIPCION, MOTIVO, RESPUESTA.  

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


