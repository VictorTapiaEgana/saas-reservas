SELECT 
    R.id_reserva,
    C.nombre AS nombre_cliente,
    S.nombre AS nombre_servicio,
    P.nombre AS nombre_prestador,
    R.fecha,
    R.hora
FROM 
    Reservas R
JOIN 
    Clientes C ON R.id_cliente = C.id_cliente
JOIN 
    Servicios S ON R.id_servicio = S.id_servicio
JOIN 
    Prestadores P ON R.id_prestador = P.id_prestador
WHERE 
    R.fecha = '2024-08-01';
    
    
SELECT 
    R.id_reserva,
    C.nombre AS nombre_cliente,
    S.nombre AS nombre_servicio,
    P.nombre AS nombre_prestador,
    R.fecha,
    R.hora,
    E.nombre AS nombre_empresa
FROM 
    Reservas R
JOIN 
    Clientes C ON R.id_cliente = C.id_cliente
JOIN 
    Servicios S ON R.id_servicio = S.id_servicio
JOIN 
    Prestadores P ON R.id_prestador = P.id_prestador
JOIN 
    Empresas E ON P.id_empresa = E.id_empresa
WHERE 
    E.id_empresa = 1; 
    
    
    
SELECT 
    R.id_reserva,
    C.nombre AS nombre_cliente,
    S.nombre AS nombre_servicio,
    P.nombre AS nombre_prestador,
    R.fecha,
    R.hora
FROM 
    Reservas R
JOIN 
    Clientes C ON R.id_cliente = C.id_cliente
JOIN 
    Servicios S ON R.id_servicio = S.id_servicio
JOIN 
    Prestadores P ON R.id_prestador = P.id_prestador
WHERE 
    P.id_prestador = 1;
    
    
    SELECT 
    R.id_reserva,
    C.nombre AS nombre_cliente,
    S.nombre AS nombre_servicio,
    P.nombre AS nombre_prestador,
    R.fecha,
    R.hora,
    TP.tipo AS tipo_prestador
FROM 
    Reservas R
JOIN 
    Clientes C ON R.id_cliente = C.id_cliente
JOIN 
    Servicios S ON R.id_servicio = S.id_servicio
JOIN 
    Prestadores P ON R.id_prestador = P.id_prestador
JOIN 
    Tipo_Prestador TP ON P.id_prestador = TP.id_tipoprestador
WHERE 
    TP.tipo = 'estilista' AND S.nombre = 'Corte de Pelo'; 
    
-- LISTADO POR EMPRESA
SELECT 
   *
    FROM 
    Empresas
ORDER BY nombre ASC;


-- TODOS LOS DATOS DE LA EMPRESA, INCLUYENDO PRESTADORES DE SERVICIO Y SUS SERVICIOS
SELECT 
    E.id_empresa,
    E.nombre AS nombre_empresa,
    E.tipo AS tipo_empresa,
    E.direccion AS direccion_empresa,
    E.telefono AS telefono_empresa,
    E.imagen AS imagen_empresa,
    S.id_servicio,
    S.nombre AS nombre_servicio,
    S.descripcion AS descripcion_servicio,
    S.precio AS precio_servicio,
    S.duracion AS duracion_servicio,
    P.id_prestador,
    P.nombre AS nombre_prestador,
    P.especialidad AS especialidad_prestador,
    P.telefono AS telefono_prestador,
    P.imagen AS imagen_prestador
FROM 
    Empresas E
LEFT JOIN 
    Servicios S ON E.id_empresa = S.id_empresa
LEFT JOIN 
    Prestadores P ON E.id_empresa = P.id_empresa
WHERE 
    E.id_empresa = 3 -- Cambia el valor de id_empresa según sea necesario
ORDER BY 
    E.id_empresa, S.id_servicio, P.id_prestador;
    
    update empresas set descripcion = 'Empresa 1' where id_empresa = 1;
    update empresas set descripcion = 'Empresa 2' where id_empresa = 2;
    update empresas set descripcion = 'Empresa 3' where id_empresa = 3;
    update empresas set descripcion = 'Empresa 4' where id_empresa = 4;
    update empresas set descripcion = 'Empresa 5' where id_empresa = 5;
    

    

    
    

    
    