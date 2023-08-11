USE [HRP-GHSS2021HB]
/*if object_id('tempdb..#tempk00') is not null drop table #tempk00
SELECT DISTINCT A0102 ,HA0102
INTO #TEMPk00
FROM K01*/
--SELECT * FROM #TEMPK00


if object_id('tempdb..#tempk01') is not null drop table #tempk01
SELECT ISNULL(sum(K0114),0) AS 县,HA0102,A0102
INTO #tempk01
FROM K01 
WHERE  LEFT(RTRIM(K0101), 1) ='X' AND K0123= '2' 
GROUP BY HA0102,A0102
ORDER BY HA0102 DESC
--SELECT *FROM #TEMPK01

if object_id('tempdb..#tempk02') is not null drop table #tempk02
SELECT ISNULL(sum(K0114),0) AS 乡 ,HA0102
into #tempk02
FROM K01 
WHERE  LEFT(RTRIM(K0101), 1)= 'Y' AND K0123= '2' 
GROUP BY HA0102
ORDER BY HA0102 DESC
--SELECT *FROM #TEMPK02

if object_id('tempdb..#tempk03') is not null drop table #tempk03
SELECT ISNULL(sum(K0114),0)  AS 村 ,HA0102
into #tempk03
FROM K01 
WHERE  LEFT(RTRIM(K0101), 1) ='C' AND K0123= '2' 
GROUP BY HA0102
ORDER BY HA0102 DESC
--SELECT *FROM #TEMPK03



SELECT A.A0102 单位代码, A.HA0102 单位名称,[里程合计]= isnull(A.县,0) +ISNULL(B.乡,0) +ISNULL(C.村,0),
isnull(A.县,0) 县,ISNULL(B.乡,0) 乡,ISNULL(C.村,0)村
FROM #tempk01 A
--RIGHT JOIN #TEMPK00 D ON A.HA0102=D.HA0102
LEFT JOIN #tempk02 B ON  A.HA0102=B.HA0102
LEFT JOIN #tempk03 C ON  A.HA0102=C.HA0102
ORDER BY A.A0102 ASC