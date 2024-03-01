SELECT  --广德合进宣城 ，宿松合进安庆
replace(REPLACE(left(STUFF(rtrim(a0102),3,1,null),4), '3422', '3418'),'3421','3408') A0102,objjc,
sum(CASE WHEN left(k0101,1)='X' THEN isnull(k0114,'')	ELSE 0 END ) 'X',
sum(CASE WHEN left(k0101,1)='Y' THEN isnull(k0114,'')	ELSE 0 END ) 'Y',
sum(CASE WHEN left(k0101,1)='C' THEN isnull(k0114,'')	ELSE 0 END ) 'C',
sum(CASE WHEN left(k0101,1)='Z' THEN isnull(k0114,'')	ELSE 0 END ) 'Z'

from k01
left join (
select
STUFF(rtrim(objname),3,1,null) objname,left(objjc,3) objjc
from DA0102
where len(rtrim(objname))=5 AND  OBJJC LIKE '%干线公路%' )DA0102 on replace(REPLACE(left(STUFF(rtrim(a0102),3,1,null),4), '3422', '3418'),'3421','3408')=rtrim(objname)
where  isnull(k0123,'2')='2' and k0124 is null
group by replace(REPLACE(left(STUFF(rtrim(a0102),3,1,null),4), '3422', '3418'),'3421','3408'),objjc WITH ROLLUP
--HAVING grouping(replace(REPLACE(left(STUFF(rtrim(a0102),3,1,null),4), '3422', '3418'),'3421','3408'))=grouping(objjc)
ORDER BY a0102

