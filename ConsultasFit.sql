use fit_cimm;

SELECT
    s.documento,
    CONCAT(s.nombres, ' ', s.apellidos) AS nombre_socio,
    p.nombre AS plan,
    m.fecha_fin,
    DATEDIFF(m.fecha_fin, CURDATE()) AS dias_restantes
FROM socio s
INNER JOIN membresia m
    ON s.id_socio = m.id_socio
INNER JOIN plan p
    ON m.id_plan = p.id_plan
WHERE s.activo = TRUE
AND m.fecha_fin >= CURDATE()
ORDER BY m.fecha_fin ASC;


SELECT
    p.nombre AS plan,
    SUM(m.valor_pagado) AS total_recaudado
FROM membresia m
INNER JOIN plan p
    ON m.id_plan = p.id_plan
WHERE m.fecha_inicio BETWEEN '2026-07-01' AND '2026-07-31'
GROUP BY p.nombre
ORDER BY total_recaudado DESC;




SELECT
    s.documento,
    CONCAT(s.nombres, ' ', s.apellidos) AS nombre_socio,
    p.nombre AS plan,
    m.fecha_inicio,
    m.fecha_fin,
    m.valor_pagado
FROM membresia m
INNER JOIN socio s
    ON m.id_socio = s.id_socio
INNER JOIN plan p
    ON m.id_plan = p.id_plan
WHERE m.fecha_fin BETWEEN CURDATE()
                      AND DATE_ADD(CURDATE(), INTERVAL 5 DAY)
ORDER BY m.fecha_fin ASC;
SELECT fecha_ingreso,
       COUNT(*) AS total_ingresos
FROM ingreso
WHERE fecha_ingreso >= CURDATE() - INTERVAL 7 DAY
GROUP BY fecha_ingreso
ORDER BY fecha_ingreso;

SELECT s.id_socio,
       s.documento,
       s.nombres,
       s.apellidos
FROM socio s
LEFT JOIN ingreso i
ON s.id_socio = i.id_socio
WHERE s.activo = TRUE
AND i.id_ingreso IS NULL;