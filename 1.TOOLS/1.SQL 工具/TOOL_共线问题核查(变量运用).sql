DECLARE @k0101 char(10),@K0114a numeric(8,3),@K0114b numeric(8,3),@K0114c numeric(8,3)
set @k0101 ='Y038420881'
SELECT @k0114b=SUM(k0114)
from K001
where k0101=@k0101

SELECT @k0114a=SUM(k0114)
from l001
where k0101=@k0101

SELECT @k0114c=SUM(round(ZDZH-QDZH,3))
from
openrowset('Microsoft.Jet.OLEDB.4.0', 'D:\桌面临时文件夹\4208\mapdata.sdd';'admin';'',LX_Y)
WHERE LXBM =@k0101

SELECT 'a历史数据', k0101,k0124,k0112,k0140,k0108,k0109,k0114
from l001 where k0101=@k0101
UNION
SELECT 'b历史-修改后','------------','------------','------------','------------>',@k0114b-@k0114a'k0108', @k0114a'k0109', @k0114b'k0114'
union
SELECT 'c修改后', k0101,k0124,k0112,k0140,k0108,k0109,k0114
from K001 where k0101=@k0101
UNION
SELECT 'd修改后-地图数据','------------','------------','------------','------------>',@k0114b-@k0114c'k0108', @k0114b'k0109', @k0114c'k0114'
union
SELECT 'e地图数据',LXBM,'',LXMC,'',QDZH,ZDZH,round(ZDZH-QDZH,3) 'k0114'
FROM
openrowset('Microsoft.Jet.OLEDB.4.0', 'D:\桌面临时文件夹\4208\mapdata.sdd';'admin';'',LX_Y)
WHERE LXBM =@k0101
