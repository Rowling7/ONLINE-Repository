USE [HRP-DBMS2021湖北]
IF OBJECT_ID('TEMPDB..#TT2') IS NOT NULL DROP TABLE #TT2

select 
LEFT(A0103,6) A0102,LEFT(A0103,6) 行政代码  ,RTRIM(D.OBJJC )行政区域,
 
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


 INTO  #TT2
 FROM k001
 left join dz0101 D on D.OBJNAME =LEFT (K001.A0103,6) AND D.objtype='3'
 WHERE  (k0124 is null or k0124='')and (isnull (k0123,'2')='2'or k0123 is null or k0123='')and  left(K0101,1) in ('X','Y','Z','C')

GROUP BY  LEFT(A0103,6),D.OBJJC with rollup
HAVING GROUPING( LEFT(A0103,6))=GROUPING(D.OBJJC)
ORDER BY 行政代码

/*
SELECT *FROM #TT2
UNION
SELECT * FROM #TT1
ORDER BY A0102
*/









IF OBJECT_ID('TEMPDB..#TT1') IS NOT NULL DROP TABLE #TT1
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

 
 
 INTO #TT1
FROM  K001 K
RIGHT JOIN DA0102 D  ON   D.OBJNAME = (CASE WHEN LEN(K.A0102)='6'AND LEFT(K.A0102,4)<4290 THEN LEFT (K.A0102,4) ELSE
	CASE WHEN LEN(K.A0102)='5' THEN LEFT(K.A0102, 3) ELSE
		K.A0102 END END)

WHERE  (K0124 IS NULL OR K0124='')AND (ISNULL (K0123,'2')='2'OR K0123 IS NULL OR K0123='')AND  LEFT(K0101,1) IN ('X','Y','Z','C')
AND ISNULL(V0301,'2')='2'

GROUP BY ((CASE WHEN LEN(K.A0102)='6'AND LEFT(K.A0102,4)<4290 THEN LEFT (K.A0102,4) ELSE
	CASE WHEN LEN(K.A0102)='5' THEN LEFT(K.A0102, 3) ELSE
		K.A0102 END END)),D.OBJNAME ,D.OBJJC 
	WITH ROLLUP
HAVING GROUPING((CASE WHEN LEN(K.A0102)='6'AND LEFT(K.A0102,4)<4290 THEN LEFT (K.A0102,4) ELSE
	CASE WHEN LEN(K.A0102)='5' THEN LEFT(K.A0102, 3) ELSE
		K.A0102 END END))= GROUPING(D.OBJJC )
ORDER BY K.A0102

--SELECT * FROM #TT1


SELECT * FROM #TT2
UNION
SELECT * FROM #TT1
ORDER BY A0102
