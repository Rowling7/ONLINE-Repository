SELECT t2.a50_id, t2.k0108,  t3.k0109
FROM
(
    SELECT MIN(k0108) AS k0108
    FROM k001
    GROUP BY a50_id
) AS t1
JOIN k001 AS t2 ON t1.k0108 = t2.k0108
LEFT JOIN
(
    SELECT a50_id,MAX(k0109) AS k0109
    FROM k001
    GROUP BY a50_id
) AS t3 ON t2.
 = t3.a50_id
JOIN k001 AS t4 ON t3.k0109 = t4.k0109 AND t4.a50_id = t2.a50_id