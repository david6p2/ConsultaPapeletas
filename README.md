ConsultaPapeletas
=================

App Creada durante el Hackaton de Febrero 22 en el Open Data Lima 2014,  para consultar las papeletas de un automóvil por placa en Lima entre 2007 y 2010 (No hay datos mas recientes)

Los datos son tomados de

http://api.lima.datosabiertos.pe/datastreams/invoke/DIREC-DE-SANCI-2007-2010?auth_key=YOUR_AUTH_KEY

Mas información sobre los datos en:

http://lima.datosabiertos.pe/datastreams/75606/directorio-de-sanciones-2007-2010/


Este proyecto tiene 2 fuentes de consulta. 

1. http://api.lima.datosabiertos.pe
2. Un API REST creado por Samuel Gonzales durante el Hackaton para una consulta de de estos datos de manera más organizada.

Se necesita información actualizada y mejor organizada para su consulta ágil.

Configuración
=================

En el archivo ConsultaPapeletas-Prefix.pch se debe configurar la URL del servidor de consulta.

En APIconnections.m se debe configurar el pathString según la URL de consulta. 

Si se quiere consultar el API del Datos Abiertos de Lima se deberá llamar el método de checkInfractionsByLicensePlateWithParameters: sin importar el parámetro de DATA_ORIGIN en el NSDictionary params donde irán los parametros. La respuesta se enviara al método delegado checkInfractionsByLicensePlateDidFinishSuccessfully:

Si se quiere consultar el API de Samuel se debera llamar el método de checkInfractionsByLicensePlateWithParameters: con el parámetro de DATA_ORIGIN = @"Samuel" en el NSDictionary params donde irán los parámetros. La respuesta se enviara al método delegado checkInfractionsSamuelByLicensePlateDidFinishSuccessfully:

El API de Samuel devolverá un Array cuyos elementos serán las papeletas, organizadas en un Diccionario cada una, para la placa consultada.
