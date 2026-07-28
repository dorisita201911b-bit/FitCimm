# FitCimm - Sistema de Gestión de Gimnasio

## Descripción

FitCimm es una aplicación web desarrollada como solución al taller propuesto por el Servicio Nacional de Aprendizaje (SENA) para el programa Tecnólogo en Análisis y Desarrollo de Software (ADSO).

El sistema fue diseñado para facilitar la administración de un gimnasio, permitiendo gestionar la información de los socios, los planes de membresía, el registro de ingresos y la generación de reportes. De esta manera se reemplaza el manejo manual de la información y se mejora el control de las operaciones realizadas por el gimnasio.

## Funcionamiento del sistema

La aplicación permite realizar las siguientes operaciones:

- Registrar, consultar, editar e inactivar socios.
- Administrar los planes de membresía.
- Registrar la venta de membresías calculando automáticamente su fecha de vencimiento.
- Registrar el ingreso diario de los socios verificando que la membresía se encuentre vigente.
- Consultar los ingresos registrados por fecha.
- Generar reportes de socios con membresía vigente, recaudo por planes y membresías próximas a vencer.

Además, durante el desarrollo se implementaron las principales reglas de negocio solicitadas en el taller, como la validación de membresías vigentes, el control de un solo ingreso por día y el cálculo automático de las fechas de vencimiento.


## Tecnologías y herramientas utilizadas

Para el desarrollo del proyecto **FitCimm** se utilizaron las siguientes tecnologías y herramientas:

- **Lenguaje de programación:** Java (JDK 25), utilizado para implementar la lógica del sistema.
- **Entorno de desarrollo (IDE):** Apache NetBeans IDE 30.
- **Servidor de aplicaciones:** Apache Tomcat/TomEE para ejecutar la aplicación web.
- **Gestión del proyecto:** Apache Maven mediante el archivo `pom.xml`.
- **Base de datos:** MySQL para almacenar la información del sistema.
- **Control de versiones:** Git y GitHub para el seguimiento y almacenamiento del proyecto.

El proyecto fue desarrollado siguiendo una **arquitectura por capas**, organizada de la siguiente manera:

- **Modelo:** contiene las entidades del sistema.
- **DAO:** realiza el acceso a la base de datos mediante consultas SQL y JDBC.
- **Servicio:** implementa las reglas de negocio.
- **Controlador:** procesa las solicitudes del usuario y coordina la comunicación entre las capas.
- **Vista:** desarrollada con páginas JSP para la interacción con el usuario.

Esta organización facilita el mantenimiento del código y cumple con la arquitectura propuesta en el taller.


## Requisitos previos

Para ejecutar el proyecto es necesario contar con:

- Java JDK 25.
- Apache NetBeans IDE 30.
- Apache Tomcat/TomEE.
- MySQL Server.

---

## Instalación y ejecución

1. Clonar o descargar el repositorio del proyecto.
2. Abrir el proyecto en Apache NetBeans.
3. Ejecutar el archivo `script.sql` para crear la base de datos **fitcimm** y cargar los datos de prueba.
4. Configurar la conexión a la base de datos en la clase `Conexion.java`.
5. Ejecutar el proyecto utilizando Apache Tomcat/TomEE.
6. Acceder a la aplicación desde el navegador.


## Estructura del proyecto

- `Controlador`: gestión de las solicitudes del usuario.
- `DAO`: acceso a la base de datos.
- `Modelo`: entidades del sistema.
- `Servicio`: reglas de negocio.
- `Web Pages`: interfaz desarrollada en JSP.
- `script.sql`: creación de la base de datos y datos iniciales.
- `consultas.sql`: consultas SQL solicitadas en el taller.

## Capturas de pantalla

Agregar capturas de los siguientes módulos:

- Menú principal.
- Gestión de socios.
- Gestión de planes.
- Gestión de membresías.
- Control de ingresos.
- Reportes.


## Integrantes

- Doris López
- Andrea Martínez

## Repositorio

Agregar aquí el enlace del repositorio de GitHub.
