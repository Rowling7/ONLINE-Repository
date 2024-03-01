--查询上年路线编码和去年里程
DECLARE @k0101 varchar(200)
set @k0101='Y021340491'
SELECT a0102,ha0102,rtrim(k0101) k0101,k0108,k0109,k0114,'2023年' a,k1302 '上年路线编码',k1303'上年起点桩号',k1304'上年止点桩号'
from k001  
where k1302 like @k0101+'%'
union
SELECT a0102,ha0102,rtrim(k0101) k0101,k0108,k0109,k0114,'---2022年' a,k1302 '上年路线编码',k1303'上年起点桩号',k1304'上年止点桩号'
from luduan 
where k0101 = @k0101
ORDER BY a desc ,k0108 asc




/*

SELECT sum(isnull(k0114,'')) from k001 where k0101= 'Y526340210'
SELECT sum(isnull(k0114,'')) from luduan where k0101= @k0101
*/