//ȡÿ������һ�������� �滻��ݼ���
//2013 �� 2023ÿ������һ�£��滻���
update da0101
set objname=replace(objname,'2013','2023'),
	objjc=replace(objjc,'2013','2023'),
	objpy=replace(objpy,'2013','2023'),
	objexplain=replace(objexplain,'2013','2023')
from da0101
where left(objname,4)='2013'