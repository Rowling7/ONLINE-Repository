select
LEFT(A0103,6) ��������  ,RTRIM(D.OBJJC )��������,

--һ����·
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' then isnull(K0114,0) else 0 end)AS �����,
NULLIF (sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304='11' then isnull(K0114,0) else 0 end),'0') 	һ����·,
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
AS CHAR))+'%','0.00%')  AS һ����·ռ��,


--������·
NULLIF (sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304='11' then isnull(K0114,0) else 0 end),'0') 	������·,
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
AS CHAR))+'%','0.00%')  AS ������·ռ��,

--������·
NULLIF (sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304='11' then isnull(K0114,0) else 0 end),'0') 	������·,
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
AS CHAR))+'%','0.00%')  AS ������·ռ��,


--�ļ���·
NULLIF (sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and K0304='11' then isnull(K0114,0) else 0 end),'0') 	�ļ���·,
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
AS CHAR))+'%','0.00%')  AS �ļ���·ռ��

FROM k001
left join dz0101 D on D.OBJNAME =LEFT (K001.A0103,6) AND D.objtype='3'
WHERE  (k0124 is null or k0124='')and (isnull (k0123,'2')='2'or k0123 is null or k0123='')and  left(K0101,1) in ('X','Y','Z','C')
GROUP BY  LEFT(A0103,6),D.OBJJC with rollup
HAVING GROUPING( LEFT(A0103,6))=GROUPING(D.OBJJC)
ORDER BY ��������