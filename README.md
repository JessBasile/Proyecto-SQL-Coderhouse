[![Coder-House-Con-Foto-Perfil-YLogo-Wi-Fly.png](https://i.postimg.cc/SRzGSvNx/Coder-House-Con-Foto-Perfil-YLogo-Wi-Fly.png)](https://postimg.cc/BP4FNNKr)

# Entrega Proyecto SQL Coderhouse

## Primera preentrega

Alumna: Jesica Brenda Basile

Comisión: 57190

Tutor: Ariel Annone

Docente: Anderson Michel Torres

Presentación didáctica [click aquí](https://view.genially.com/6682fc0815c608001450761e)

### Introducción: Descripción de la temática de la base de datos
___
La temática se encuentra inspirada en una empresa real que brinda servicios de internet, bajo el nombre ficticio de Wifly cuya diferenciación en el mercado radica en el nicho del mercado al que apunta, puesto que se orienta principalmente a brindar servicio a clientes ubicados en zonas rurales. 
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

### Diagrama de entidad relación
___
### DER EFECTUADO EN [MIRO](https://miro.com/welcomeonboard/NW1tS2xNVTZzR0pNU2I1MWl1cUJ5Ymw2OVZHVmxONWVFaXRkWFM1clJuRFZFclhjZWVaSllJalR2WEJGOW0xZXwzNDU4NzY0NTU4MTkyNjc2ODAwfDI=?share_link_id=663161836839)

[![DER-Wi-Fly-correcto.jpg](https://i.postimg.cc/tTxWpKDv/DER-Wi-Fly-correcto.jpg)](https://postimg.cc/LYmnV0cj)

### DER EN DBEAVER

[![DER-SQL.jpg](https://i.postimg.cc/N0W2JNY6/DER-SQL.jpg)](https://postimg.cc/B8BvtBjb)

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


