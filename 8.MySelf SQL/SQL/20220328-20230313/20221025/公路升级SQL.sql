--1
--SH_A25_001
-- 【县级总路长行政职务】为字符型	；
-- 【县级总路长行政职务】不能包含除汉字、逗号、顿号以外的其他符号,字段长度应小于12个字
select
'A25'+'&A0102 ='''+rtrim(cast(A0102 as varchar))+''' and a0103='''+rtrim(cast(a0103 as varchar))+''' and A0101='''+rtrim(cast(A0101 as varchar))+'''and A3417 ='''+rtrim(cast(A3417 as varchar))  as 编辑,
--RTRIM(A3410)
A0102,HA0102,A0101,HA0101,A0103,HA0103,A3410,A3411,A3412,A3413,A3414,A3415,A3416,A3417,HA3417,A0129
FROM A25
WHERE (RTRIM(A3410)  like '%[^吖-座、，,]%'  OR LEN(RTRIM(A3410))>'24'OR RTRIM(A3410) IS NULL)
AND a0101 ='#TJND#' and A0102 like '#A0102#%' and A0102 like '#GLDW#%'

--2
--SH_A24_001
-- 【主要工作内容】、【主要资金】仅填写中文,顿号,逗号	；
-- 【主要工作内容】、【主要资金来源】不能有非法字符，不能有空格，不能为空，不能出现数字
select
'A24'+'&A0102 ='''+rtrim(cast(A0102 as varchar))+''' and a0103='''+rtrim(cast(a0103 as varchar))+''' and A0101='''+rtrim(cast(A0101 as varchar))+'''and A3401 ='''+rtrim(cast(A3401 as varchar))+'''and A3402 ='''+rtrim(cast(A3402 as varchar))+''''   as 编辑,
--RTRIM(A3408),RTRIM(A3403),RTRIM(A3404),RTRIM(A3405),RTRIM(A3406)
A0102,HA0102,A0101,HA0101,A0103,HA0103,A3401,HA3401,A3402,HA3402,A3403,A3404,A3405,A3406,A3407,A3408,A0129
FROM A24
WHERE (RTRIM(A3403)  like '%[^吖-座、，,]%' OR RTRIM(A3408)  like '%[^吖-座、，,]%'  OR RTRIM(A3403) IS  NULL
 OR  RTRIM(A3408) IS  NULL  OR RTRIM(A3406)='0' OR  RTRIM(A3406)<='24.0'OR  RTRIM(A3406)>'65.0' )
  AND a0101 ='#TJND#' and A0102 like '#A0102#%' and A0102 like '#GLDW#%'

--3
--SH_A21_005
-- 【养护工区】【养护企业】【收费公路经营企业】【养护工区、管理所】【管理所】填写规范；
-- 【养护工区】不得大于50个；【养护企业】不得大于20个；【收费公路经营企业】不得大于20个；【养护工区、管理所】不得大于50个；【管理所】不得大于50个；
select
'A21'+'&A0102 ='''+rtrim(cast(A0102 as varchar))+''' and a0103='''+rtrim(cast(a0103 as varchar))+''' and A0101='''+rtrim(cast(A0101 as varchar))+''''   as 编辑,*
FROM A21
WHERE (RTRIM(A0118B)> 20 OR  RTRIM(A0119B)< 20 OR  RTRIM(A0108B)> 50
     OR RTRIM(A1118)> 20 OR  RTRIM(A0109)< 20 OR  RTRIM(A0108)> 50
     OR RTRIM(A0118A)> 20 OR  RTRIM(A0119A)< 20 OR  RTRIM(A0108A)> 50)
AND a0101 ='#TJND#' and A0102 like '#A0102#%' and A0102 like '#GLDW#%'

--4
--SH_K05_015
-- K05各项指标应填写规范
-- MQI、PQI、PCI、RQI、RDI、PBI、PWI、SRI、PSSI、SCI、BCI、TCI不得大于100
select
'K05'+'&A0102 ='''+rtrim(cast(A0102 as varchar))+''' and K0101='''+rtrim(cast(K0101 as varchar))+''' and A0101a='''+rtrim(cast(A0101a as varchar))+''' and A5009 ='''+rtrim(cast(A5009 as varchar))+''' and K0105 ='+rtrim(cast(K0105 as varchar)) as 编辑,
a0102,ha0102,k0101,a0101a,ha0101a,k0105,k0106,a5009,ha5009,k0304,hk0304,k5124,hk5124,
a5010,a5011,a5011A,a5011B,a5011C,a5011D,a5011E,A5011F,A5011G,a5012,a5013,a5014,a0129
from k05
where ( /*k0304 is null or k5124 is null or*/
isnull(a5010,0)>100 or isnull(a5011,0)>100 or isnull(a5011A,0)>100 or isnull(a5011B,0)>100 or isnull(a5011C,0)>100 or isnull(a5011D,0)>100 or isnull(a5011E,0)>100 or isnull(a5011F,0)>100 or isnull(a5011G,0)>100 or isnull(a5012,0)>100 or isnull(a5013,0)>100 or isnull(a5014,0)>100 )
and left(a0101a,4) ='#TJND#' and A0102 like '#A0102#%' and A0102 like '#GLDW#%'



--5
--SH_K05_016
-- 路线代码和起止点桩号是否在K01范围内
select  DISTINCT  'K05'+'&A0102 ='''+rtrim(cast(K05.A0102 as varchar))+''' and K0101='''+rtrim(cast(K05.K0101 as varchar))+''' and A0101a='+rtrim(cast(K05.A0101A as varchar)) as 编辑,
       K05.A0102,K05.HA0102,K05.A0101A,K05.HA0101A,K05.K0101,MIN(K05.K0105) K0105,MAX(K05.K0106) K0106--, MAX(B. K0108),MAX(B.K0109)
FROM K05
LEFT JOIN
    (  SELECT  K.K0101,MIN(K.K0108) K0108,MAX(K.K0109) K0109
        FROM K01 K
        GROUP BY K.K0101
        )B ON K05.K0101 =B.K0101 AND  (ISNULL(K05.K0105,0)<ISNULL(B.K0108,0) OR ISNULL(K05.K0106,0)>ISNULL(B.K0109,0))
WHERE  left(K05.a0101a,4)='#TJND#' and K05.A0102 like '#A0102#%' and K05.A0102 like '#GLDW#%'
GROUP BY K05.K0101, K05.A0102, K05.A0101a, K05.HA0102, K05.HA0101A
ORDER BY K05.K0101 ASC

--6
--SH_K04B_001
-- 路线代码和起止点桩号是否在K01范围内
select  DISTINCT  'K04B'+'&A0102 ='''+rtrim(cast(K04B.A0102 as varchar))+''' and K0101='''+rtrim(cast(K04B.K0101 as varchar))+''' and A0101a='+rtrim(cast(K04B.A0101A as varchar)) as 编辑,
       K04B.A0102,K04B.HA0102,K04B.A0101A,K04B.HA0101A,K04B.K0101,MIN(K04B.K0108) K0108,MAX(K04B.K0109) K0109--, ISNULL(MAX(B. K0108),0),ISNULL(MAX(B.K0109),0)
FROM K04B
LEFT JOIN
    (  SELECT  K.K0101,MIN(K.K0108) K0108,MAX(K.K0109) K0109
        FROM K01 K
        GROUP BY K.K0101
        )B ON RTRIM(K04B.K0101) =RTRIM(B.K0101) AND  (ISNULL(K04B.K0108,0)<ISNULL(B.K0108,0) OR ISNULL(K04B.K0109,0) >ISNULL(B.K0109,0))
WHERE  left(K04B.a0101a,4)='#TJND#' and K04B.A0102 like '#A0102#%' and K04B.A0102 like '#GLDW#%'
GROUP BY K04B.K0101, K04B.A0102, K04B.A0101a, K04B.HA0102, K04B.HA0101A
ORDER BY K04B.K0101 ASC

--7
--SH_K04B_002
-- 桩号是否有交叉
IF OBJECT_ID('TEMPDB..#tempK01') IS NOT NULL DROP TABLE #tempK01
IF OBJECT_ID('TEMPDB..#tempK01B') IS NOT NULL DROP TABLE #tempK01B

SELECT
NULL 序号,
A0102,
HA0102,
A0101A,
K0101,
k0108,
K0109,
IDS=0
INTO #tempK01
FROM K04B
WHERE  a0101A ='#TJND#' and A0102 like '#A0102#%' and A0102 like '#GLDW#%'
order by k0101,k0108

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

UPDATE #tempK01 SET
@N = CASE WHEN RTRIM(@M) = RTRIM(K0101) THEN @N+1 ELSE 1 END,
@M = RTRIM(K0101),
IDS = @N

UPDATE #tempK01 SET
@Z = CASE WHEN RTRIM(@Y)!= RTRIM(K0101) THEN @Z+1 ELSE @Z END,
@Y = RTRIM(K0101),
序号 = @Z

select T1.Ha0102,T1.K0101,
[路线桩号|起点]=T2.K0108,
[路线桩号|止点]=T2.K0109,[下一路段起点桩号]=T1.K0108,[差值]=T2.K0109 - T1.K0108
INTO #tempK01B
FROM #tempK01 T1
JOIN #tempK01 T2
ON T1.K0101 = T2.K0101 AND T1.IDS = T2.IDS +1 AND T1.序号=T2.序号
where T2.K0109 - T1.K0108<>0

DELETE #tempK01B WHERE [差值]<>0 AND [差值]<0

SELECT * FROM #tempK01B

--8
--SH_K05_017
-- 桩号是否有交叉
IF OBJECT_ID('TEMPDB..#tempK01') IS NOT NULL DROP TABLE #tempK01
IF OBJECT_ID('TEMPDB..#tempK01B') IS NOT NULL DROP TABLE #tempK01B

SELECT
NULL 序号,
A0102,
HA0102,
A0101A,
K0101,
k0105,
K0106,
IDS=0
INTO #tempK01
FROM K05
WHERE  a0101A ='#TJND#' and A0102 like '#A0102#%' and A0102 like '#GLDW#%'
order by k0101,k0105

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

UPDATE #tempK01 SET
@N = CASE WHEN RTRIM(@M) = RTRIM(K0101) THEN @N+1 ELSE 1 END,
@M = RTRIM(K0101),
IDS = @N

UPDATE #tempK01 SET
@Z = CASE WHEN RTRIM(@Y)!= RTRIM(K0101) THEN @Z+1 ELSE @Z END,
@Y = RTRIM(K0101),
序号 = @Z

select T1.Ha0102,T1.K0101,
[路线桩号|起点]=T2.K0105,
[路线桩号|止点]=T2.K0106,[下一路段起点桩号]=T1.K0105,[差值]=T2.K0106 - T1.K0105
INTO #tempK01B
FROM #tempK01 T1
JOIN #tempK01 T2
ON T1.K0101 = T2.K0101 AND T1.IDS = T2.IDS +1 AND T1.序号=T2.序号
where T2.K0106 - T1.K0105<>0

DELETE #tempK01B WHERE [差值]<>0 AND [差值]<0

SELECT * FROM #tempK01B

--9
--SH_K05_018
-- K01的路线代码都要在技术状况评定表中有数据
SELECT
       'K01'+'&A0102 ='''+rtrim(cast(K01.A0102 as varchar))+''' and K0101='''+rtrim(cast(K01.K0101 as varchar))+''' and A0101='''+rtrim(cast(K01.A0101 as varchar))+''' and K0108 ='+rtrim(cast(K01.K0108 as varchar)) as 编辑,
K01.a0102,k01.ha0102,RTRIM(k01.k0101) K0101,k01.A7002,K01.K0112,k01.k0108,k01.K0110,k01.k0109,k01.K0111,k01.a0101,k01.ha0101,K01.K0114
FROM K01
left JOIN (SELECT  RTRIM(K05.K0101) K0101,K05.A0102,K05.A0101A,K05.K0105 FROM K05 WHERE   K05.a0101a ='#TJND#' and K05.A0102 like '#A0102#%' and K05.A0102 like '#GLDW#%')B ON  K01.A0102 = B.A0102 AND RTRIM(K01.K0101) = RTRIM(B.K0101) AND ISNULL(K01.K0108,0) = ISNULL(B.K0105,0)
WHERE  B.A0102 IS NULL and left(k01.k0101,1) in ('G','S') AND K01.a0101 ='#TJND#' and K01.A0102 like '#A0102#%' and K01.A0102 like '#GLDW#%'
ORDER BY RTRIM(k01.k0101) ASC

--10
--SH_K04B_003
-- K01的路线代码都要在技术状况评定表中有数据
SELECT
              'K01'+'&A0102 ='''+rtrim(cast(K01.A0102 as varchar))+''' and K0101='''+rtrim(cast(K01.K0101 as varchar))+''' and A0101='''+rtrim(cast(K01.A0101 as varchar))+''' and K0108 ='+rtrim(cast(K01.K0108 as varchar)) as 编辑,
K01.a0102,k01.ha0102,RTRIM(k01.k0101) K0101,k01.A7002,K01.K0112,k01.k0108,k01.K0110,k01.k0109,k01.K0111,k01.a0101,k01.ha0101,K01.K0114,B.A0102
FROM K01
left JOIN (SELECT  RTRIM(K04B.K0101) K0101,K04B.A0102,K04B.A0101A,K04B.K0108 FROM K04B WHERE   K04B.a0101a ='#TJND#' and K04B.A0102 like '#A0102#%' and K04B.A0102 like '#GLDW#%')B ON  RTRIM(K01.A0102) = RTRIM(B.A0102) AND RTRIM(K01.K0101) = RTRIM(B.K0101) AND ISNULL(K01.K0108,0) = ISNULL(B.K0108,0)
WHERE  B.A0102 IS NULL and left(k01.k0101,1) in ('X','Y','C') AND K01.a0101 ='#TJND#' and K01.A0102 like '#A0102#%' and K01.A0102 like '#GLDW#%'
ORDER BY RTRIM(k01.k0101) ASC

--11
--SH_K05_019
-- 上行+双向的里程要等于K01中路线统计里程合计
SELECT  'K05'+'&A0102 ='''+rtrim(cast(K05.A0102 as varchar))+''' and K0101='''+rtrim(cast(K05.K0101 as varchar))+''' and A0101a='''+rtrim(cast(K05.A0101a as varchar))+'''  and K0105 ='+rtrim(cast(K05.K0105 as varchar)) as 编辑,
       RTRIM(K05.A0102) A0102 ,K05.HA0102,RTRIM(K05.K0101) K0101 ,SUM(CASE WHEN K05.K0105 IS NULL AND K05.A5009 IN ('1','3') THEN 0 ELSE isnull(K05.K0105,0)/1000 END ) K0105,SUM(CASE WHEN K05.K0106 IS NULL AND K05.A5009 IN ('1','3') THEN 0 ELSE isnull(K05.K0106,0)/1000 END ) K0106,SUM(CASE WHEN K05.A5008 IS NULL AND K05.A5009 IN ('1','3') THEN 0 ELSE isnull(K05.A5008,0)/1000 END ) A5008
FROM K05
LEFT JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
FROM K01
WHERE  isnull(k0123,'2')='2' and k0124 is null
GROUP BY  K01.K0101
    ) B ON K05.K0101=B.K0101
WHERE   B.K0114<>K05.A5008 AND K05.a0101A ='#TJND#' and K05.A0102 like '#A0102#%' and K05.A0102 like '#GLDW#%'
GROUP BY  K05.K0101,K05.A0102,K05.HA0102, K05.A0101a, K05.K0105
ORDER BY RTRIM(K05.K0101) ASC

--12
--SH_K04B_004
-- 上行+双向的里程要等于K01中路线统计里程合计
SELECT     'K04B'+'&A0102 ='''+rtrim(cast(K04B.A0102 as varchar))+''' and K0101='''+rtrim(cast(K04B.K0101 as varchar))+''' and A0101a='''+rtrim(cast(K04B.A0101a as varchar))+'''  and K0108 ='+rtrim(cast(K04B.K0108 as varchar)) as 编辑,
       RTRIM(K04B.A0102) A0102 ,K04B.HA0102,RTRIM(K04B.K0101) K0101 ,SUM(CASE WHEN K04B.K0108 IS NULL AND K04B.A5009 IN ('1','3') THEN 0 ELSE isnull(K04B.K0108,0)/1000 END ) K0108,SUM(CASE WHEN K04B.K0109 IS NULL AND K04B.A5009 IN ('1','3') THEN 0 ELSE isnull(K04B.K0109,0)/1000 END ) K0109,SUM(CASE WHEN K04B.A5008 IS NULL AND K04B.A5009 IN ('1','3') THEN 0 ELSE isnull(K04B.A5008,0)/1000 END ) A5008
FROM K04B
LEFT JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
FROM K01
WHERE  isnull(k0123,'2')='2' and k0124 is null
GROUP BY  K01.K0101
    ) B ON K04B.K0101=B.K0101
WHERE   B.K0114<>K04B.A5008 AND K04B.a0101A ='#TJND#' and K04B.A0102 like '#A0102#%' and K04B.A0102 like '#GLDW#%'
GROUP BY  K04B.K0101,K04B.A0102,K04B.HA0102, K04B.A0101a, K04B.K0108
ORDER BY RTRIM(K04B.K0101) ASC

--13
--SH_K05_020
-- 下行+双向的里程要等于K01中路线统计里程合计
SELECT
         'K05'+'&A0102 ='''+rtrim(cast(K05.A0102 as varchar))+''' and K0101='''+rtrim(cast(K05.K0101 as varchar))+''' and A0101a='''+rtrim(cast(K05.A0101a as varchar))+'''  and K0105 ='+rtrim(cast(K05.K0105 as varchar)) as 编辑,
       RTRIM(K05.A0102) A0102 ,K05.HA0102,RTRIM(K05.K0101) K0101 ,SUM(CASE WHEN K05.K0105 IS NULL AND K05.A5009 IN ('1','3') THEN 0 ELSE isnull(K05.K0105,0)/1000 END ) K0105,SUM(CASE WHEN K05.K0106 IS NULL AND K05.A5009 IN ('1','3') THEN 0 ELSE isnull(K05.K0106,0)/1000 END ) K0106,SUM(CASE WHEN K05.A5008 IS NULL AND K05.A5009 IN ('1','3') THEN 0 ELSE isnull(K05.A5008,0)/1000 END ) A5008
FROM K05
LEFT JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
FROM K01
WHERE  isnull(k0123,'2')='2' and k0124 is null
GROUP BY  K01.K0101
    ) B ON K05.K0101=B.K0101
WHERE   B.K0114<>K05.A5008 AND K05.a0101A ='#TJND#' and K05.A0102 like '#A0102#%' and K05.A0102 like '#GLDW#%'
GROUP BY  K05.K0101,K05.A0102,K05.HA0102, K05.A0101a, K05.K0105
ORDER BY RTRIM(K05.K0101) ASC

--14
--SH_K04B_005
-- 下行+双向的里程要等于K01中路线统计里程合计
SELECT
       'K04B'+'&A0102 ='''+rtrim(cast(K04B.A0102 as varchar))+''' and K0101='''+rtrim(cast(K04B.K0101 as varchar))+''' and A0101a='''+rtrim(cast(K04B.A0101a as varchar))+'''  and K0108 ='+rtrim(cast(K04B.K0108 as varchar)) as 编辑,
       RTRIM(K04B.A0102) A0102 ,K04B.HA0102,RTRIM(K04B.K0101) K0101 ,SUM(CASE WHEN K04B.K0108 IS NULL AND K04B.A5009 IN ('1','3') THEN 0 ELSE isnull(K04B.K0108,0)/1000 END ) K0108,SUM(CASE WHEN K04B.K0109 IS NULL AND K04B.A5009 IN ('1','3') THEN 0 ELSE isnull(K04B.K0109,0)/1000 END ) K0109,SUM(CASE WHEN K04B.A5008 IS NULL AND K04B.A5009 IN ('1','3') THEN 0 ELSE isnull(K04B.A5008,0)/1000 END ) A5008
FROM K04B
LEFT JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
FROM K01
WHERE  isnull(k0123,'2')='2' and k0124 is null
GROUP BY  K01.K0101
    ) B ON K04B.K0101=B.K0101
WHERE   B.K0114<>K04B.A5008 --AND K04B.a0101A ='#TJND#' and K04B.A0102 like '#A0102#%' and K04B.A0102 like '#GLDW#%'
GROUP BY  K04B.K0101,K04B.A0102,K04B.HA0102, K04B.A0101a, K04B.K0108
ORDER BY RTRIM(K04B.K0101) ASC

--15
--SH_K05_021
-- 起止点差值要等于里程
select
'K05'+'&A0102 ='''+rtrim(cast(A0102 as varchar))+''' and K0101='''+rtrim(cast(K0101 as varchar))+''' and A0101a='''+rtrim(cast(A0101a as varchar))+''' and A5009 ='''+rtrim(cast(A5009 as varchar))+''' and K0105 ='+rtrim(cast(K0105 as varchar)) as 编辑,
a0102,ha0102,k0101,a0101a,ha0101a,a5009,ha5009,a5008,[检测路段|起点桩号]=k0105,[检测路段|止点桩号]=k0106,
[检测路段|起止点差值]=(isnull(k0106,0)-isnull(k0105,0))*1000,a0129
from k05
where  ((isnull(k0106,0)-isnull(k0105,0))*1000<>isnull(a5008,0))
  and left(a0101a,4)='#TJND#' and A0102 like '#A0102#%' and A0102 like '#GLDW#%'

--16
--SH_K04B_006
-- 起止点差值要等于里程
select
'K04B'+'&A0102 ='''+rtrim(cast(A0102 as varchar))+''' and K0101='''+rtrim(cast(K0101 as varchar))+''' and A0101a='''+rtrim(cast(A0101a as varchar))+''' and A5009 ='''+rtrim(cast(A5009 as varchar))+''' and K0108 ='+rtrim(cast(K0108 as varchar)) as 编辑,
a0102,ha0102,k0101,a0101a,ha0101a,a5009,ha5009,a5008,[检测路段|起点桩号]=k0108,[检测路段|止点桩号]=k0109,
[检测路段|起止点差值]=(ISNULL(K0109,0) -ISNULL(K0108,0))*1000,a0129
from k04B
where  (ISNULL(K0109,0) -ISNULL(K0108,0))*1000<>isnull(a5008,0)
  and left(a0101a,4)='#TJND#' and A0102 like '#A0102#%' and A0102 like '#GLDW#%'

--17
--SH_K05_022
-- 判断技术状况评定的桩号范围，路面类型，技术等级都要和K01中对应路段一致
SELECT
'K05'+'&A0102 ='''+rtrim(cast(K05.A0102 as varchar))+''' and K0101='''+rtrim(cast(K05.K0101 as varchar))+''' and A0101a='''+rtrim(cast(K05.A0101a as varchar))+''' and K0105 ='+rtrim(cast(K05.K0105 as varchar)) as 编辑,
K05.K0101,K05.A0101A, K05.A0102,K05.HA0102,K05.K0105,K05.K0106,K05.K5124,K05.HK5124,K05.K0304,K05.HK0304
FROM K05
LEFT JOIN  (
    SELECT K.A0102,K.HA0102,K.K0101,K.A0101,K.K0108,K.K0109,K.K0304,K.HK0304,K.K5104,K.HK5104
    FROM  K01  K
    WHERE  K.a0101 ='#TJND#' and K.A0102 like '#A0102#%' and K.A0102 like '#GLDW#%'
    )B ON K05.A0102=B.A0102 AND K05.K0101=B.K0101 AND K05.K0105=B.K0108
WHERE  (K05.K5124<>B.K5104 OR K05.K0304 <>B.K0304)
AND K05.a0101A ='#TJND#' and K05.A0102 like '#A0102#%' and K05.A0102 like '#GLDW#%'

--18
--SH_K04B_007
-- 判断技术状况评定的区划，桩号范围，路面类型，技术等级，路面宽度都要和K01中对应路段一致
SELECT
'K04B'+'&A0102 ='''+rtrim(cast(K04B.A0102 as varchar))+''' and K0101='''+rtrim(cast(K04B.K0101 as varchar))+''' and A0101a='''+rtrim(cast(K04B.A0101a as varchar))+''' and K0108 ='+rtrim(cast(K04B.K0108 as varchar)) as 编辑,
 K04B.A0102,K04B.HA0102,K04B.A0103,K04B.HA0103,K04B.K0101,K04B.K0112,K04B.A0101A,K04B.K0108,K04B.K0109,K04B.K5104,K04B.HK5104,K04B.K0304,K04B.HK0304,K04B.K5404
FROM K04B
 LEFT JOIN  (
    SELECT K.A0102,K.HA0102,K.K0101,K.A0103,K.HA0103,K.A0101,K.K0108,K.K0109,K.K0304,K.HK0304,K.K5104,K.HK5104,K.K5404
    FROM  K01  K
  WHERE  K.a0101 ='#TJND#' and K.A0102 like '#A0102#%' and K.A0102 like '#GLDW#%'
    )B ON K04B.A0102=B.A0102 AND K04B.K0101=B.K0101 AND K04B.K0108=B.K0108
WHERE  (K04B.K5104<>B.K5104 OR K04B.K0304 <>B.K0304 OR K04B.K5404<>B.K5404 OR K04B.A0103<>B.A0103)
AND K04B.a0101A ='#TJND#' and K04B.A0102 like '#A0102#%' and K04B.A0102 like '#GLDW#%'









select a0103,ha0103 from k01 where isnull(k0123,'2')='2' and (isnull(k0124,'')='' or rtrim(k0124) is null)
and (left(k0101,1) in ('G','S') or left(a0102,3)='42A')
and a0101 ='2021' and A0102 like '42%' and A0102 like '42%'
and left(rtrim(a0103),6) not in(select rtrim(a0103) from b17 where a0101 ='2021'
and A0102 like '42%' and A0102 like '42%' group by a0103)
group by a0103,ha0103
order by a0103




--19.5
SELECT  'K05'+'&A0102 ='''+rtrim(cast(K05.A0102 as varchar))+''' and K0101='''+rtrim(cast(K05.K0101 as varchar))+''' and A0101a='''+rtrim(cast(K05.A0101a as varchar))+'''  and K0105 ='''+rtrim(cast(K05.K0105 as varchar)) +'''  and A5009 ='+rtrim(cast(K05.A5009 as varchar)) as 编辑,
       RTRIM(K05.A0102) A0102 ,K05.HA0102,RTRIM(K05.K0101) K0101 ,SUM(CASE WHEN K05.K0105 IS NULL AND K05.A5009 IN ('1','2') THEN 0 ELSE isnull(K05.K0105,0) END ) K0105,SUM(CASE WHEN K05.K0106 IS NULL AND K05.A5009 IN ('1','2') THEN 0 ELSE isnull(K05.K0106,0) END ) K0106,SUM(CASE WHEN K05.A5008 IS NULL AND K05.A5009 IN ('1','2') THEN 0 ELSE isnull(K05.A5008,0) END ) A5008,K05.HA5009
FROM K05
LEFT JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
FROM K01
WHERE  isnull(k0123,'2')='2' and k0124 is null
GROUP BY  K01.K0101
    ) B ON K05.K0101=B.K0101
WHERE   B.K0114<>K05.A5008 AND K05.A5009 IN ('1','2') --AND K05.a0101A ='#TJND#' and K05.A0102 like '#A0102#%' and K05.A0102 like '#GLDW#%'
GROUP BY  K05.K0101,K05.A0102,K05.HA0102, K05.A0101a, K05.K0105, K05.HA5009, K05.A5009
ORDER BY RTRIM(K05.K0101) ASC

--19.6
SELECT  'K05'+'&A0102 ='''+rtrim(cast(K05.A0102 as varchar))+''' and K0101='''+rtrim(cast(K05.K0101 as varchar))+''' and A0101a='''+rtrim(cast(K05.A0101a as varchar))+'''  and K0105 ='''+rtrim(cast(K05.K0105 as varchar)) +'''  and A5009 ='+rtrim(cast(K05.A5009 as varchar)) as 编辑,
       RTRIM(K05.A0102) A0102 ,K05.HA0102,RTRIM(K05.K0101) K0101 ,SUM(CASE WHEN K05.K0105 IS NULL AND K05.A5009 IN ('1','3') THEN 0 ELSE isnull(K05.K0105,0) END ) K0105,SUM(CASE WHEN K05.K0106 IS NULL AND K05.A5009 IN ('1','3') THEN 0 ELSE isnull(K05.K0106,0) END ) K0106,SUM(CASE WHEN K05.A5008 IS NULL AND K05.A5009 IN ('1','3') THEN 0 ELSE isnull(K05.A5008,0) END ) A5008,K05.HA5009
FROM K05
LEFT JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
FROM K01
WHERE  isnull(k0123,'2')='2' and k0124 is null
GROUP BY  K01.K0101
    ) B ON K05.K0101=B.K0101
WHERE   B.K0114<>K05.A5008 AND K05.A5009 IN ('1','3') AND K05.a0101A ='#TJND#' and K05.A0102 like '#A0102#%' and K05.A0102 like '#GLDW#%'
GROUP BY  K05.K0101,K05.A0102,K05.HA0102, K05.A0101a, K05.K0105, K05.HA5009, K05.A5009
ORDER BY RTRIM(K05.K0101) ASC

--28.2


IF OBJECT_ID('TEMPDB..#tempK01') IS NOT NULL DROP TABLE #tempK01
IF OBJECT_ID('TEMPDB..#tempK01B') IS NOT NULL DROP TABLE #tempK01B

SELECT
NULL 序号,
A0102,
K0101,
k0108,
K0109,
IDS=0
INTO #tempK01
FROM 	(select a0102,k0101,k0108 k0108,max(k0109) k0109
		from k04B where left(a0101a,4) ='#TJND#'
	group by a0102,k0101,k0108) a
order by k0101,k0108


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

UPDATE #tempK01 SET
@N = CASE WHEN RTRIM(@M) = RTRIM(K0101) THEN @N+1 ELSE 1 END,
@M = RTRIM(K0101),
--@X = RTRIM(A0102),
IDS = @N

UPDATE #tempK01 SET
@Z = CASE WHEN RTRIM(@Y)!= RTRIM(K0101) THEN @Z+1 ELSE @Z END,
@Y = RTRIM(K0101),
序号 = @Z

select T1.a0102,T1.K0101,
[路段桩号|起点]=T2.K0108,
[路段桩号|止点]=T2.K0109,[下一路段起点桩号]=T1.K0108,[差值]=T2.K0109 - T1.K0108
INTO #tempK01B
FROM #tempK01 T1
JOIN #tempK01 T2
ON T1.K0101 = T2.K0101  AND T1.IDS = T2.IDS +1 AND T1.序号=T2.序号
where T2.K0109 - T1.K0108<>0

--DELETE #tempK01B WHERE LEFT(K0101,1)<>'G' AND XY<>0 AND XY<0

SELECT * FROM #tempK01B
where [差值]>0


--28.4
SELECT     'K04B'+'&A0102 ='''+rtrim(cast(K04B.A0102 as varchar))+''' and K0101='''+rtrim(cast(K04B.K0101 as varchar))+''' and A0101a='''+rtrim(cast(K04B.A0101a as varchar))+'''  and K0108 ='''+rtrim(cast(K04B.K0108 as varchar)) +'''  and A5009 ='+rtrim(cast(K04B.A5009 as varchar)) as 编辑,
       RTRIM(K04B.A0102) A0102 ,K04B.HA0102,RTRIM(K04B.K0101) K0101 ,SUM(CASE WHEN K04B.K0108 IS NULL
    AND K04B.A5009 IN ('1','2') THEN 0 ELSE isnull(K04B.K0108,0) END ) K0108,SUM(CASE WHEN K04B.K0109 IS NULL AND K04B.A5009 IN ('1','2') THEN 0 ELSE isnull(K04B.K0109,0) END ) K0109,SUM(CASE WHEN K04B.A5008 IS NULL AND K04B.A5009 IN ('1','2') THEN 0 ELSE isnull(K04B.A5008,0) END ) A5008,K04B.HA5009
FROM K04B
LEFT JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
FROM K01
WHERE  isnull(k0123,'2')='2' and k0124 is null
GROUP BY  K01.K0101
    ) B ON K04B.K0101=B.K0101
WHERE   B.K0114<>K04B.A5008 AND K04B.A5009 IN ('1','2') AND K04B.a0101A ='#TJND#' and K04B.A0102 like '#A0102#%' and K04B.A0102 like '#GLDW#%'
GROUP BY  K04B.K0101,K04B.A0102,K04B.HA0102, K04B.A0101a, K04B.K0108, K04B.A5009, K04B.HA5009
ORDER BY RTRIM(K04B.K0101) ASC


--28.5
SELECT     'K04B'+'&A0102 ='''+rtrim(cast(K04B.A0102 as varchar))+''' and K0101='''+rtrim(cast(K04B.K0101 as varchar))+''' and A0101a='''+rtrim(cast(K04B.A0101a as varchar))+'''  and K0108 ='''+rtrim(cast(K04B.K0108 as varchar)) +'''  and A5009 ='+rtrim(cast(K04B.A5009 as varchar)) as 编辑,
       RTRIM(K04B.A0102) A0102 ,K04B.HA0102,RTRIM(K04B.K0101) K0101 ,SUM(CASE WHEN K04B.K0108 IS NULL
    AND K04B.A5009 IN ('1','3') THEN 0 ELSE isnull(K04B.K0108,0) END ) K0108,SUM(CASE WHEN K04B.K0109 IS NULL AND K04B.A5009 IN ('1','3') THEN 0 ELSE isnull(K04B.K0109,0) END ) K0109,SUM(CASE WHEN K04B.A5008 IS NULL AND K04B.A5009 IN ('1','3') THEN 0 ELSE isnull(K04B.A5008,0) END ) A5008,K04B.HA5009
FROM K04B
LEFT JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
FROM K01
WHERE  isnull(k0123,'2')='2' and k0124 is null
GROUP BY  K01.K0101
    ) B ON K04B.K0101=B.K0101
WHERE   B.K0114<>K04B.A5008 AND K04B.A5009 IN ('1','3') --AND K04B.a0101A ='#TJND#' and K04B.A0102 like '#A0102#%' and K04B.A0102 like '#GLDW#%'
GROUP BY  K04B.K0101,K04B.A0102,K04B.HA0102, K04B.A0101a, K04B.K0108, K04B.A5009, K04B.HA5009
ORDER BY RTRIM(K04B.K0101) ASC







