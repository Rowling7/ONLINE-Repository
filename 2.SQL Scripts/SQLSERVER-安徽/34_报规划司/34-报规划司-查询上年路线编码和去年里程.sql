--��ѯ����·�߱����ȥ�����
DECLARE @k0101 varchar(200)
set @k0101='Y021340491'
SELECT a0102,ha0102,rtrim(k0101) k0101,k0108,k0109,k0114,'2023��' a,k1302 '����·�߱���',k1303'�������׮��',k1304'����ֹ��׮��'
from k001  
where k1302 like @k0101+'%'
union
SELECT a0102,ha0102,rtrim(k0101) k0101,k0108,k0109,k0114,'---2022��' a,k1302 '����·�߱���',k1303'�������׮��',k1304'����ֹ��׮��'
from luduan 
where k0101 = @k0101
ORDER BY a desc ,k0108 asc




/*

SELECT sum(isnull(k0114,'')) from k001 where k0101= 'Y526340210'
SELECT sum(isnull(k0114,'')) from luduan where k0101= @k0101
*/