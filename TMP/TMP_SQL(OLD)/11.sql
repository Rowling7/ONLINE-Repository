SELECT t2.a50_id, t2.k0108, t2.k0110, t3.k0109, t3.k0111
FROM
(
    SELECT a.a50_id, a.k0108, b.k0110,
    ROW_NUMBER() OVER (PARTITION BY a.a50_id ORDER BY a.k0108) AS rn
    FROM k001 a
    LEFT JOIN k001 b ON a.a50_id = b.a50_id AND a.k0108 = b.k0108
) t2
LEFT JOIN
(
    SELECT a.a50_id, a.k0109, b.k0111,
    ROW_NUMBER() OVER (PARTITION BY a.a50_id ORDER BY a.k0109 DESC) AS rn
    FROM k001 a
    JOIN k001 b ON a.a50_id = b.a50_id AND a.k0109 = b.k0109
) t3 ON t2.a50_id = t3.a50_id AND t2.rn = 1 AND t3.rn = 1










SELECT t2.a50_id, t2.k0108, t2.k0110, t3.k0109, t3.k0111
FROM
(
    SELECT a.a50_id, a.k0108, b.k0110
    FROM 
    (
        SELECT a50_id, MIN(k0108) AS k0108
        FROM k001
        GROUP BY a50_id
    ) a
    JOIN k001 b ON a.a50_id = b.a50_id AND a.k0108 = b.k0108
    ORDER BY b.a50_id
) t2
LEFT JOIN 
(
    SELECT a.a50_id, a.k0109, b.k0111
    FROM 
    (
        SELECT a50_id, MAX(k0109) AS k0109
        FROM k001
        GROUP BY a50_id
    ) a
    JOIN k001 b ON a.a50_id = b.a50_id AND a.k0109 = b.k0109
    ORDER BY a.a50_id
) t3 ON t2.a50_id = t3.a50_id