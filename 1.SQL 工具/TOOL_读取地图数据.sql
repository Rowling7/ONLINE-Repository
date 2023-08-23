--Microsoft.Jet.OLEDB.4.0
select distinct rtrim(DWDM)
from
openrowset('Microsoft.Jet.OLEDB.4.0',  'E:\42\mapdata.sdd';'admin';'',QL)
order by  rtrim(DWDM)


--Microsoft.ACE.OLEDB.12.0
select distinct rtrim(DWDM)
from
openrowset('Microsoft.ACE.OLEDB.12.0', 'E:\42\mapdata.sdd';'admin';'',QL)
order by  rtrim(DWDM)


--核对表格数据库是否一致
SELECT  A,B,b.K0108,C,b.K0109,D,b.k0114
from OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;DATABASE=D:\Desktop\工作簿1.xlsx',sheet4$)
LEFT JOIN
(
SELECT rtrim(K0101) k0101,K0108,k0109,K0114
FROM K001
WHERE LEFT(K0101,1)in('C','z')
) b on a=b.K0101 and  b=k0108 and c=k0109
where  b.K0108 IS NULL OR b.K0109 IS NULL OR b.k0114 IS NULL
