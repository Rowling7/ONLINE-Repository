IF OBJECT_ID('TEMPDB..#tempSNLX') IS NOT NULL DROP TABLE #tempSNLX
IF OBJECT_ID('TEMPDB..#tempSNLXB') IS NOT NULL DROP TABLE #tempSNLXB

SELECT
NULL ���,
A0102,
HA0102,
rtrim(K1302) K1302,
K1303,
K1304,
IDS=0
INTO #tempSNLX
FROM K001
WHERE left(K0101,1) in ('X','Y','Z','C') --and A0102 like '4209%' and A0102 like '4209%' 
	and rtrim(K1302) is not null and left(K1302,1) in ('X','Y','Z','C')
order by rtrim(K1302),K1303

DECLARE @X CHAR(7)
DECLARE @M CHAR(20)
DECLARE @N INT
DECLARE @Y CHAR(20)
DECLARE @Z INT

SET @X = 1
SET @M = 1
SET @N = 1 
SET @Y = 1
SET @Z = 0

UPDATE #tempSNLX SET
@N = CASE WHEN rtrim(@M) = rtrim(K1302) THEN @N+1 ELSE 1 END,
@M = rtrim(K1302),
IDS = @N

UPDATE #tempSNLX SET
@Z = CASE WHEN rtrim(@Y)!= rtrim(K1302) THEN @Z+1 ELSE @Z END,
@Y = rtrim(K1302),
��� = @Z

select T1.Ha0102,T1.K1302,
[�������׮��]=T2.K1303,
[����ֹ��׮��]=T2.K1304,[��һ·�ε��������׮��]=T1.K1303,[��ֵ]=T2.K1304 - T1.K1303
INTO #tempSNLXB 
FROM #tempSNLX T1
JOIN #tempSNLX T2
ON T1.K1302 = T2.K1302 AND T1.IDS = T2.IDS +1 AND T1.���=T2.��� 
where T2.K1304 - T1.K1303<>0

DELETE #tempSNLXB WHERE [��ֵ]<>0 AND [��ֵ]<0

SELECT * FROM #tempSNLXB

/*
---------------
--------------����1
update a set a.k1303=a.k0108,a.k1304=a.k0109
--select a.k0101,a.k0108,a.k0109,a.k1302,a.k1303,a.k1304 
from k001 a right join #tempSNLXB b on a.k0101=b.k1302 and a.k1302=b.k1302 and a.k1303=b.�������׮��

--------------����2
update a set a.k1303=a.k0108--,a.k1304=a.k0109
--select a.k0101,a.k0108,a.k0109,a.k1302,a.k1303,a.k1304 
from k001 a right join #tempSNLXB b on a.k0101=b.k1302 and a.k1302=b.k1302 and a.k1303=b.��һ·�ε��������׮��
order by a.k0101
*/