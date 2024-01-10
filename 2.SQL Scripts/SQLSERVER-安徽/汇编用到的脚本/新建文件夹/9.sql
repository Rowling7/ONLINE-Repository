--2023新建一级二级路
SELECT  left(k0101,1),sum(isnull(k0114,0))
from k01 
where isnull(k0123,'2')='2' and k0124 is null
and left(k0101,1)not in ('w','h','t') 
and k0304 IN ('11','22')
--and kwyid 
AND K0180 ='2023'
GROUP BY left(k0101,1) with rollup


--2023新建一级二级路
SELECT  left(k0101,1),sum(isnull(k0114,0))
from k01 
where isnull(k0123,'2')='2' and k0124 is null
and left(k0101,1)not in ('w','h','t') 
and  a3219='2'
--and k0304 IN ('11','22')
--and kwyid 
--AND K0180 ='2023'
GROUP BY left(k0101,1) with rollup