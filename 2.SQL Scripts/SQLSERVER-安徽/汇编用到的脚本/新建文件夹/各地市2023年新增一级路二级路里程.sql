--各地市2023年新增一级路二级路里程
SELECT LEFT(STUFF(rtrim(A0102),3,1,null),4),SUM(ISNULL(A0307,0)),SUM(ISNULL(A0308,0))
from A11
WHERE SUBSTRING(A11.A0101,1,4) =   '2023'
AND A11.A3219 in('1') AND LEFT(STUFF(rtrim(A0102),3,1,null),4)IN(
select --查询市州
STUFF(rtrim(objname),3,1,null) objjc
from DA0102
where len(rtrim(objname))=5 AND  OBJJC LIKE '%干线公路%' 
)
--and LEFT(rtrim(A0102),5) ='34101'
GROUP BY LEFT(STUFF(rtrim(A0102),3,1,null),4)  with rollup

