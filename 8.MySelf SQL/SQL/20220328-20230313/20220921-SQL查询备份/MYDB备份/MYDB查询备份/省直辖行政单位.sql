IF OBJECT_ID('TEMPDB..#TT3') IS NOT NULL DROP TABLE #TT3
SELECT
(CASE WHEN LEN(K.A0102)='6'AND LEFT(K.A0102,4)<4290 THEN LEFT (K.A0102,4) ELSE
	CASE WHEN LEN(K.A0102)='5' THEN LEFT(K.A0102, 3) ELSE
		K.A0102 END END) AS A0102,
D.OBJNAME 行政代码,RTRIM(D.OBJJC)  行政区域,
 
 
 --一级公路
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' then isnull(K0114,0) else 0 end)AS 总里程,
--NULLIF (
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304='11' then isnull(K0114,0) else 0 end)/*,'0')*/ 	一级公路,

--NULLIF(
RTRIM(CAST((
CASE WHEN 
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' then isnull(K0114,0) else 0 end)
='0' THEN '' ELSE 

Convert(decimal(18,2),
round(
(sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304='11' then isnull(K0114,0) else 0 end)/ 
 sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' then isnull(K0114,0) else 0 end)
 )*100,2)
 )  
  END )
  AS CHAR))+'%'/*,'0.00%')*/  AS 一级公路占比,


--二级公路
--NULLIF (
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304='22' then isnull(K0114,0) else 0 end)/*,'0')*/ 	二级公路,

--NULLIF(
RTRIM(CAST((
CASE WHEN 
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' then isnull(K0114,0) else 0 end)
='0' THEN '' ELSE 

Convert(decimal(18,2),
round(
(sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304='22' then isnull(K0114,0) else 0 end)/ 
 sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' then isnull(K0114,0) else 0 end)
 )*100,2)
 )  
  END )
  AS CHAR))+'%'/*,'0.00%')*/  AS 二级公路占比,

--三级公路
--NULLIF (
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304='23' then isnull(K0114,0) else 0 end)/*,'0')*/ 	三级公路,

--NULLIF(
RTRIM(CAST((
CASE WHEN 
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' then isnull(K0114,0) else 0 end)
='0' THEN '' ELSE 

Convert(decimal(18,2),
round(
(sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304='23' then isnull(K0114,0) else 0 end)/ 
 sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' then isnull(K0114,0) else 0 end)
 )*100,2)
 )  
  END )
  AS CHAR))+'%'/*,'0.00%')*/  AS 三级公路占比,
  
  
  --四级公路

--NULLIF (
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304 in ('24','31') then isnull(K0114,0) else 0 end)
/*,'0')*/ 	四级公路,

--NULLIF(
RTRIM(CAST((
CASE WHEN 
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' then isnull(K0114,0) else 0 end)
='0' THEN '' ELSE 

Convert(decimal(18,2),
round(
(sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304 in ('24','31') then isnull(K0114,0) else 0 end)/ 
 sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' then isnull(K0114,0) else 0 end)
 )*100,2)
 )  
  END )
  AS CHAR))+'%'/*,'0.00%'*/  AS 四级公路占比

 
 
 INTO #TT3
FROM  K001 K
RIGHT JOIN DA0102 D  ON   D.OBJNAME = (CASE WHEN LEN(K.A0102)='6'AND LEFT(K.A0102,4)<4290 THEN LEFT (K.A0102,4) ELSE
	CASE WHEN LEN(K.A0102)='5' THEN LEFT(K.A0102, 3) ELSE
		K.A0102 END END)

WHERE  (K0124 IS NULL OR K0124='')AND (ISNULL (K0123,'2')='2'OR K0123 IS NULL OR K0123='')AND  LEFT(K0101,1) IN ('X','Y','Z','C') AND A0102 ='4290'OR A0102 ='429004'OR A0102 ='429005'OR A0102 ='429006'OR A0102 ='429021'
AND ISNULL(V0301,'2')='2'

GROUP BY ((CASE WHEN LEN(K.A0102)='6'AND LEFT(K.A0102,4)<4290 THEN LEFT (K.A0102,4) ELSE
	CASE WHEN LEN(K.A0102)='5' THEN LEFT(K.A0102, 3) ELSE
		K.A0102 END END)),D.OBJNAME ,D.OBJJC 
	WITH ROLLUP
HAVING GROUPING((CASE WHEN LEN(K.A0102)='6'AND LEFT(K.A0102,4)<4290 THEN LEFT (K.A0102,4) ELSE
	CASE WHEN LEN(K.A0102)='5' THEN LEFT(K.A0102, 3) ELSE
		K.A0102 END END))= GROUPING(D.OBJJC )
ORDER BY K.A0102

SELECT * FROM #TT3