SELECT S9532,cast(SUM(a0698) as decimal(18,3))
from a11
LEFT JOIN S951 ON A0101= S951_ID OR A0203= S951_ID
where  S9532< 2022 and S9532 Like 'G%' -- AND B01_ID=1000001829050171
GROUP BY s9532


SELECT cast(SUM(a0698) as decimal(18,3))
from a11  a
LEFT JOIN S951 b ON a.A0203=b. S951_ID
LEFT JOIN S951 c ON a.A0101= c.S951_ID
WHERE c.S9532 < 2022
UNION
SELECT cast(SUM(a0698) as decimal(18,3))
from a11  a
LEFT JOIN S951 b ON a.A0203=b. S951_ID
LEFT JOIN S951 c ON a.A0101= c.S951_ID
WHERE c.S9532 < 2022 and b.S9532 Like 'G%' -- and a0698 is not null
UNION
SELECT cast(SUM(a0698) as decimal(18,3))
from a11  a
LEFT JOIN S951 b ON a.A0203=b. S951_ID
LEFT JOIN S951 c ON a.A0101= c.S951_ID
WHERE c.S9532 < 2022 and b.S9532 Like 'GA%'
UNION

SELECT cast(SUM(a0698) as decimal(18,3))
from a11  a
LEFT JOIN S951 b ON a.A0203=b. S951_ID
LEFT JOIN S951 c ON a.A0101= c.S951_ID
WHERE c.S9532 < 2022 and b.S9532 Like 'S%'
UNION

SELECT cast(SUM(a0698) as decimal(18,3))
from a11  a
LEFT JOIN S951 b ON a.A0203=b. S951_ID
LEFT JOIN S951 c ON a.A0101= c.S951_ID
WHERE c.S9532 < 2022 and b.S9532 Like 'X%'
UNION

SELECT cast(SUM(a0698) as decimal(18,3))
from a11  a
LEFT JOIN S951 b ON a.A0203=b. S951_ID
LEFT JOIN S951 c ON a.A0101= c.S951_ID
WHERE c.S9532 < 2022 and b.S9532 Like 'Y%'
UNION

SELECT cast(SUM(a0698) as decimal(18,3))
from a11  a
LEFT JOIN S951 b ON a.A0203=b. S951_ID
LEFT JOIN S951 c ON a.A0101= c.S951_ID
WHERE c.S9532 < 2022 and b.S9532 Like 'Z%'
UNION

SELECT cast(SUM(a0698) as decimal(18,3))
from a11  a
LEFT JOIN S951 b ON a.A0203=b. S951_ID
LEFT JOIN S951 c ON a.A0101= c.S951_ID
WHERE c.S9532 < 2022 and b.S9532 Like 'C%'