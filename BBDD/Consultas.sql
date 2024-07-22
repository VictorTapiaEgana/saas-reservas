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