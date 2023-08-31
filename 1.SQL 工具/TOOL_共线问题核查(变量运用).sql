IF OBJECT_ID('TEMPDB..##tmp') IS NOT NULL
DROP TABLE ##tmp

DECLARE @k0101 char(10),@K0114a numeric(8,3),@K0114b numeric(8,3)
set @k0101 ='C010421202
'

use [HRP-DBMS2023咸宁]
SELECT @k0114b=SUM(k0114)
from K001
where k0101=@k0101

SELECT  k0101,k0112,k0140,k0108,k0109,k0114
into ##tmp
from K001
where k0101=@k0101

use [HRP-DBMS2023汇编基数]
SELECT @k0114a=SUM(k0114)
from l001
where k0101=@k0101

SELECT '基数', k0101,k0112,k0140,k0108,k0109,k0114,0,0
from l001
where k0101=@k0101
union
SELECT '修改后', k0101,k0112,k0140,k0108,k0109,k0114,0,0
from ##tmp
UNION
SELECT '基数-修改后','','','',0,0,@k0114b-@k0114a,@k0114b '基数里程',@k0114a '修改后里程'