select A0102,'0',sum(isnull(a0307,0)+isnull(a0308,0)+isnull(a0309,0)+isnull(a0310,0)+isnull(a0311,0)+isnull(a0312,0))
from A11
where SUBSTRING(A0101,1,4) <='2017' and a11.a0203 in('c','x','y','z') and a0102 in('3420422','3420522','3420828','3421125','3421221','3421225','3421322','3421324','3421523','3421623')
GROUP BY A0102
UNION
select A0102,'1c',sum(isnull(a0307,0)+isnull(a0308,0)+isnull(a0309,0)+isnull(a0310,0)+isnull(a0311,0)+isnull(a0312,0))
from A11
where SUBSTRING(A0101,1,4) <='2017' and a11.a0203='c' and a0102 in('3420422','3420522','3420828','3421125','3421221','3421225','3421322','3421324','3421523','3421623')
GROUP BY A0102
UNION
select A0102,'2x',sum(isnull(a0307,0)+isnull(a0308,0)+isnull(a0309,0)+isnull(a0310,0)+isnull(a0311,0)+isnull(a0312,0))
from A11
where SUBSTRING(A0101,1,4) <='2017' and a11.a0203='x' and a0102 in('3420422','3420522','3420828','3421125','3421221','3421225','3421322','3421324','3421523','3421623')
GROUP BY A0102
UNION
select A0102,'3y',sum(isnull(a0307,0)+isnull(a0308,0)+isnull(a0309,0)+isnull(a0310,0)+isnull(a0311,0)+isnull(a0312,0))
from A11
where SUBSTRING(A0101,1,4) <='2017' and a11.a0203='y' and a0102 in('3420422','3420522','3420828','3421125','3421221','3421225','3421322','3421324','3421523','3421623')
GROUP BY A0102
