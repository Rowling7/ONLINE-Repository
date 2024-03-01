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

SELECT  E,F,b.K0108,G,b.K0109,H,b.k0114
from OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\1.工作文件（日期分类）\20230818 温州核查\330328\330328.xlsx',sheet1$)
LEFT JOIN
(
SELECT rtrim(K0101) k0101,K0108,k0109,K0114
FROM K001
WHERE LEFT(K0101,1)in('C','z')
) b on a=b.K0101 and  b=k0108 and c=k0109
where  b.K0108 IS NULL OR b.K0109 IS NULL --OR b.k0114 IS NULL

SELECT  E,b.LXBM,F,b.QDZH,G,b.ZDZH,H
from OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\1.工作文件（日期分类）\20230818 温州核查\330328\330328.xlsx',sheet1$)
LEFT JOIN
(
select  rtrim(LXBM) LXBM,RTRIM(QDZH) QDZH,RTRIM(ZDZH) ZDZH
from
openrowset('Microsoft.ACE.OLEDB.12.0', 'D:\东方永德软件OYDSOFT 浙江\HRP-GIS2011\MAPDATA\330328\mapdata.sdd';'admin';'',LX_C)
)b on a=b.LXBM and  b=b.QDZH and c=b.ZDZH
where  b.QDZH IS NULL OR b.ZDZH IS NULL