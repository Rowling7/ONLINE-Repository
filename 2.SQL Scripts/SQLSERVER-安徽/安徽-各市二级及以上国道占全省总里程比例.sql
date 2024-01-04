SELECT  --广德合进宣城 ，宿松合进安庆
replace(REPLACE(left(STUFF(rtrim(a0102),3,1,null),4), '3422', '3418'),'3421','3408') a0102,objjc,
sum(CASE WHEN left(k0101,1)='g'and  k0304 in ('11','22') and len(rtrim(k0101))>9 THEN isnull(k0114,'')	ELSE 0 END ) '二级及以上'
from k01
left join (
select
STUFF(rtrim(objname),3,1,null) objname,left(objjc,3) objjc
from DA0102
where len(rtrim(objname))=5 AND  OBJJC LIKE '%干线公路%' )DA0102 on replace(REPLACE(left(STUFF(rtrim(a0102),3,1,null),4), '3422', '3418'),'3421','3408')=rtrim(objname)
where a0102 like '341%'
			and isnull(k0123,'2')='2' and k0124 is null
group by replace(REPLACE(left(STUFF(rtrim(a0102),3,1,null),4), '3422', '3418'),'3421','3408'),objjc
ORDER BY a0102



