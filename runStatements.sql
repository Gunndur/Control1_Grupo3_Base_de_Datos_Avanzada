
WITH CitasPorHorario AS (
    SELECT 
        c.id_peluqueria,
        p.id_comuna,
        c.fecha_cita::DATE AS fecha,
        c.id_horario,
        COUNT(*) AS total_citas
    FROM Cita c
    JOIN Peluqueria p ON c.id_peluqueria = p.id_peluqueria
    GROUP BY c.id_peluqueria, p.id_comuna, c.fecha_cita::DATE, c.id_horario
),
MinCitasPorDia AS (
    SELECT 
        id_peluqueria,
        id_comuna,
        fecha,
        MIN(total_citas) AS min_citas
    FROM CitasPorHorario
    GROUP BY id_peluqueria, id_comuna, fecha
)
SELECT 
    ch.fecha,
    p.nombre_peluqueria,
    co.nombre_comuna,
    h.horario_inicio,
    h.horario_fin,
    ch.total_citas
FROM CitasPorHorario ch
JOIN MinCitasPorDia mc ON 
    ch.id_peluqueria = mc.id_peluqueria AND 
    ch.id_comuna = mc.id_comuna AND 
    ch.fecha = mc.fecha AND 
    ch.total_citas = mc.min_citas
JOIN Peluqueria p ON ch.id_peluqueria = p.id_peluqueria
JOIN Comuna co ON ch.id_comuna = co.id_comuna
JOIN Horario h ON ch.id_horario = h.id_horario
ORDER BY ch.fecha, ch.id_peluqueria;












WITH GastoMensual AS (
    SELECT 
        c.id_cliente,
        c.nombre_cliente,
        pel.id_peluqueria,
        pel.nombre_peluqueria,
        cm_cliente.nombre_comuna AS comuna_cliente,
        cm_peluqueria.nombre_comuna AS comuna_peluqueria,
        DATE_TRUNC('month', pa.fecha_pago) AS mes,
        SUM(pa.monto) AS total_gastado
    FROM Pago pa
    JOIN Detalles d ON pa.id_pago = d.id_pago
    JOIN Cita ci ON d.id_detalle = ci.id_detalle
    JOIN Cliente c ON ci.id_cliente = c.id_cliente
    JOIN Peluqueria pel ON ci.id_peluqueria = pel.id_peluqueria
    JOIN Comuna cm_cliente ON c.id_comuna = cm_cliente.id_comuna
    JOIN Comuna cm_peluqueria ON pel.id_comuna = cm_peluqueria.id_comuna
    GROUP BY c.id_cliente, c.nombre_cliente, pel.id_peluqueria, pel.nombre_peluqueria, 
             cm_cliente.nombre_comuna, cm_peluqueria.nombre_comuna, mes
)
SELECT DISTINCT ON (mes, id_peluqueria) 
    nombre_cliente,
	comuna_cliente, 
    nombre_peluqueria, 
    comuna_peluqueria, 
    mes, 
    total_gastado
FROM GastoMensual
ORDER BY mes, id_peluqueria, total_gastado DESC;




WITH ingresos_mensuales AS (
    SELECT
        pe.id_peluqueria,
        pe.nombre_peluqueria AS peluqueria,
        p.id_peluquero,
        p.nombre_peluquero AS nombre,
        TO_CHAR(s.fecha_pago, 'YYYY-MM') AS mes,
        SUM(s.monto) AS total_ingresos,
        ROW_NUMBER() OVER (
            PARTITION BY TO_CHAR(s.fecha_pago, 'YYYY-MM'), pe.id_peluqueria
            ORDER BY SUM(s.monto) DESC
        ) AS rn
    FROM Sueldo s
    JOIN Empleado e ON s.id_sueldo = e.id_sueldo
    JOIN Peluquero p ON e.id_peluquero = p.id_peluquero
    JOIN Peluqueria pe ON e.id_peluqueria = pe.id_peluqueria
    WHERE s.fecha_pago >= (CURRENT_DATE - INTERVAL '3 years')
    GROUP BY pe.id_peluqueria, pe.nombre_peluqueria, p.id_peluquero, p.nombre_peluquero, TO_CHAR(s.fecha_pago, 'YYYY-MM')
)
SELECT
    id_peluqueria,
    peluqueria,
    id_peluquero,
    nombre,
    mes,
    total_ingresos
FROM ingresos_mensuales
WHERE rn = 1
ORDER BY mes DESC, peluqueria;



SELECT DISTINCT
	c.id_cliente,
	c.nombre_cliente,
	c.correo_cliente
FROM Cliente c
JOIN Cita ci ON c.id_cliente = ci.id_cliente
JOIN Detalles d ON ci.id_detalle = d.id_detalle
JOIN Servicio s ON d.id_servicio = s.id_servicio
WHERE c.genero ILIKE 'Masculino'
AND s.id_servicio = 4;




SELECT DISTINCT
	c.id_cliente,
	c.nombre_cliente,
	co.nombre_comuna,
	p.id_peluqueria,
	p.nombre_peluqueria AS peluqueria,
	p.direccion_peluqueria AS direccion,
	pa.monto AS valor_pago
FROM Cliente c
JOIN Cita ci ON c.id_cliente = ci.id_cliente
JOIN Detalles d ON ci.id_detalle = d.id_detalle
JOIN Servicio s ON d.id_servicio = s.id_servicio
JOIN Comuna co ON c.id_comuna = co.id_comuna
JOIN Peluqueria p ON ci.id_peluqueria = p.id_peluqueria
JOIN Pago pa ON d.id_pago = pa.id_pago
WHERE s.id_servicio = 3;



SELECT DISTINCT ON (p.nombre_peluqueria, mes) 
    p.nombre_peluqueria,
    DATE_TRUNC('month', c.fecha_cita) AS mes,
    h.horario_inicio,
    COUNT(*) AS total_citas
FROM Cita c
JOIN Peluqueria p ON c.id_peluqueria = p.id_peluqueria
JOIN Horario h ON c.id_horario = h.id_horario
WHERE c.fecha_cita BETWEEN '2018-01-01' AND '2029-12-31'
GROUP BY p.nombre_peluqueria, mes, h.horario_inicio
ORDER BY p.nombre_peluqueria, mes, total_citas DESC;



WITH Citas_Ordenadas AS (
    SELECT 
        c.id_peluqueria,
        c.id_cliente,
        DATE_TRUNC('month', c.fecha_cita) AS mes,
        c.duracion
    FROM Cita c
)
SELECT DISTINCT ON (mes, id_peluqueria) 
    c.id_peluqueria,
    c.mes,
    c.id_cliente,
    cl.nombre_cliente,
    c.duracion
FROM Citas_Ordenadas c
JOIN Cliente cl ON c.id_cliente = cl.id_cliente
ORDER BY c.mes, c.id_peluqueria, c.duracion DESC;



SELECT p.id_peluqueria, p.nombre_peluqueria, s.nombre_servicio, s.precio_servicio
FROM Peluqueria p
JOIN Cita c ON c.id_peluqueria = p.id_peluqueria
JOIN Detalles d ON d.id_detalle = c.id_detalle
JOIN Servicio s ON s.id_servicio = d.id_servicio
WHERE (p.id_peluqueria, s.precio_servicio) IN (
    SELECT c2.id_peluqueria, MAX(s2.precio_servicio)
    FROM Cita c2
    JOIN Detalles d2 ON d2.id_detalle = c2.id_detalle
    JOIN Servicio s2 ON s2.id_servicio = d2.id_servicio
    GROUP BY c2.id_peluqueria
);





SELECT *
FROM (
    SELECT 
        EXTRACT(MONTH FROM c.fecha_cita) AS mes,
        c.id_peluquero,
        p.nombre_peluquero,
        COUNT(*) AS total_citas,
        RANK() OVER (PARTITION BY EXTRACT(MONTH FROM c.fecha_cita) ORDER BY COUNT(*) DESC) AS posicion
    FROM Cita c
    JOIN Peluquero p ON c.id_peluquero = p.id_peluquero
    WHERE EXTRACT(YEAR FROM c.fecha_cita) = 2021
    GROUP BY mes, c.id_peluquero, p.nombre_peluquero
) AS tabla
WHERE posicion = 1
ORDER BY mes;





SELECT 
    com.nombre_comuna,
    COUNT(DISTINCT p.id_peluqueria) AS total_peluquerias,
    COUNT(DISTINCT c.id_cliente) AS total_clientes
FROM Comuna com
LEFT JOIN Peluqueria p ON p.id_comuna = com.id_comuna
LEFT JOIN Cliente c ON c.id_comuna = com.id_comuna
GROUP BY com.nombre_comuna
ORDER BY com.nombre_comuna;
