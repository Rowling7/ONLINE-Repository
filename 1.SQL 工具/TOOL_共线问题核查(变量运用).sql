DECLARE @k0101 char(10),@K0114a numeric(8,3),@K0114b numeric(8,3)
set @k0101 ='Y252421221

'
SELECT @k0114b=SUM(k0114)
from K001
where k0101=@k0101

SELECT @k0114a=SUM(k0114)
from l001
where k0101=@k0101

SELECT '历史数据', k0101,k0124,k0112,k0140,k0108,k0109,k0114
from l001
where k0101=@k0101
union
SELECT '修改后', k0101,k0124,k0112,k0140,k0108,k0109,k0114
from K001
where k0101=@k0101
UNION
SELECT '历史-修改后','------------','------------','------------','------------>',@k0114b-@k0114a'k0108', @k0114b'k0109', @k0114a'k0114'