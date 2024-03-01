select
LEFT(A0103,6) 行政代码  ,RTRIM(D.OBJJC )行政区域,

--一级公路
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' then isnull(K0114,0) else 0 end)AS 总里程,
NULLIF (sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304='11' then isnull(K0114,0) else 0 end),'0') 	一级公路,
NULLIF(RTRIM(CAST((
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
AS CHAR))+'%','0.00%')  AS 一级公路占比,


--二级公路
NULLIF (sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304='11' then isnull(K0114,0) else 0 end),'0') 	二级公路,
NULLIF(RTRIM(CAST((
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
AS CHAR))+'%','0.00%')  AS 二级公路占比,

--三级公路
NULLIF (sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304='11' then isnull(K0114,0) else 0 end),'0') 	三级公路,
NULLIF(RTRIM(CAST((
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
AS CHAR))+'%','0.00%')  AS 三级公路占比,


--四级公路
NULLIF (sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304='11' then isnull(K0114,0) else 0 end),'0') 	四级公路,
NULLIF(RTRIM(CAST((
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
AS CHAR))+'%','0.00%')  AS 四级公路占比

FROM k001
left join dz0101 D on D.OBJNAME =LEFT (K001.A0103,6) AND D.objtype='3'
WHERE  (k0124 is null or k0124='')and (isnull (k0123,'2')='2'or k0123 is null or k0123='')and  left(K0101,1) in ('X','Y','Z','C')
GROUP BY  LEFT(A0103,6),D.OBJJC with rollup
HAVING GROUPING( LEFT(A0103,6))=GROUPING(D.OBJJC)
ORDER BY 行政代码