//取每月天数一样的两年 替换年份即可
//2013 和 2023每月天数一致，替换年份
update da0101
set objname=replace(objname,'2013','2023'),
	objjc=replace(objjc,'2013','2023'),
	objpy=replace(objpy,'2013','2023'),
	objexplain=replace(objexplain,'2013','2023')
from da0101
where left(objname,4)='2013'