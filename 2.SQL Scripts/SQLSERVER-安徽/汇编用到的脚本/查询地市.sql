select 
case when len(rtrim(objname))='5'then STUFF(rtrim(objname),3,1,null) else rtrim(objname) end  +'_'+rtrim(objjc)objjc
from DA0102
where len(rtrim(objname))=5 AND  (OBJJC LIKE '%���߹�·%' or OBJJC LIKE '%ũ�幫·%')   --ɸѡ�ص���
or (left(rtrim(objname),3)>=343 and len(rtrim(objname)) <5) --ɸѡ���ٵ�λ
union 
select --��ѯ����
STUFF(rtrim(objname),3,1,null) +'_'+left(objjc,3) objjc
from DA0102
where len(rtrim(objname))=5 AND  OBJJC LIKE '%���߹�·%' 
order by objjc --�ۺ�����