TRUNCATE TABLE GuanYangDanWei
insert into  GuanYangDanWei
(
objjc,
objname,
NBNF,
HYLBDM,
HYLBMC
)
select 
DWMC,
DWDM,
'2023',
HYLBDM,
HYLBMC
from 
OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=C:\Users\Administrator\Desktop\���չ�����λ��ϸ��+��ҵ��� (1).xls',sheet2$)
UNION 
SELECT 
OBJJC,
OBJNAME ,

'2023',
'10',
'��ͨ����'
from da0102
where objjc is not null
