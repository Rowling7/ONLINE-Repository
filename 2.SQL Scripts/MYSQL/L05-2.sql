--  ������׵�����
select
c.s9532,
sum(ifnull(a0605,0)+ifnull(a0607,0)+ifnull(a0609,0)+ifnull(a0611,0)) as sdzzs, -- ������
cast(sum(ifnull(a0606,0)+ifnull(a0608,0)+ifnull(a0610,0)+ifnull(a0612,0))as decimal(18,3)) as sdzym, -- ������
sum(ifnull(a0601,0)) a0601,-- �����������
cast(sum(ifnull(a0602,0))as decimal(18,3)) a0602,-- �������������
sum(ifnull(a0605,0))  a0605,-- �س������
cast(sum(ifnull(a0606,0))as decimal(18,3)) a0606,-- �س��������
sum(ifnull(a0607,0)) a0607,-- �������
cast(sum(ifnull(a0608,0)) as decimal(18,3))a0608,-- ���������
sum(ifnull(a0609,0)) a0609,-- �������
cast(sum(ifnull(a0610,0))as decimal(18,3)) a0610,-- ���������
sum(ifnull(a0611,0)) a0611,-- �������
cast(sum(ifnull(a0612,0))as decimal(18,3)) a0612 -- ���������
from a11 a
left join  s951 b on a.a0101=b.s951_id -- ����
left join  s951 c on a.a0203=c.s951_id -- �����ȼ�
left join b01 d on d.b01_id=a.b01_id
where b.s9532 <2022 and c.s9532 like 'G%'
and d.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')

GROUP BY c.s9532 with ROLLUP
#HAVING c.s9532 = 'S'

-- �½�
select
c.s9532,
sum(ifnull(a0605,0)+ifnull(a0607,0)+ifnull(a0609,0)+ifnull(a0611,0)) as sdzzs, -- ������
cast(sum(ifnull(a0606,0)+ifnull(a0608,0)+ifnull(a0610,0)+ifnull(a0612,0))as decimal(18,3)) as sdzym, -- ������
sum(ifnull(a0601,0)) a0601,-- �����������
cast(sum(ifnull(a0602,0))as decimal(18,3)) a0602,-- �������������
sum(ifnull(a0605,0))  a0605,-- �س������
cast(sum(ifnull(a0606,0))as decimal(18,3)) a0606,-- �س��������
sum(ifnull(a0607,0)) a0607,-- �������
cast(sum(ifnull(a0608,0)) as decimal(18,3))a0608,-- ���������
sum(ifnull(a0609,0)) a0609,-- �������
cast(sum(ifnull(a0610,0))as decimal(18,3)) a0610,-- ���������
sum(ifnull(a0611,0)) a0611,-- �������
cast(sum(ifnull(a0612,0))as decimal(18,3)) a0612 -- ���������
from a11 a
left join  s951 b on a.a0101=b.s951_id -- ����
right join  s951 c on a.a0203=c.s951_id -- �����ȼ�
left join b01 d on d.b01_id=a.b01_id
where b.s9532 =2022 -- and c.s9532 like 'G%'
and d.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and a.a3219=1000000291560301
GROUP BY c.s9532 with ROLLUP



-- �Ľ�
select
c.s9532,
sum(ifnull(a0605,0)+ifnull(a0607,0)+ifnull(a0609,0)+ifnull(a0611,0)) as sdzzs, -- ������
cast(sum(ifnull(a0606,0)+ifnull(a0608,0)+ifnull(a0610,0)+ifnull(a0612,0))as decimal(18,3)) as sdzym, -- ������
sum(ifnull(a0601,0)) a0601,-- �����������
cast(sum(ifnull(a0602,0))as decimal(18,3)) a0602,-- �������������
sum(ifnull(a0605,0))  a0605,-- �س������
cast(sum(ifnull(a0606,0))as decimal(18,3)) a0606,-- �س��������
sum(ifnull(a0607,0)) a0607,-- �������
cast(sum(ifnull(a0608,0)) as decimal(18,3))a0608,-- ���������
sum(ifnull(a0609,0)) a0609,-- �������
cast(sum(ifnull(a0610,0))as decimal(18,3)) a0610,-- ���������
sum(ifnull(a0611,0)) a0611,-- �������
cast(sum(ifnull(a0612,0))as decimal(18,3)) a0612 -- ���������
from a11 a
left join  s951 b on a.a0101=b.s951_id -- ����
left join  s951 c on a.a0203=c.s951_id -- �����ȼ�
left join b01 d on d.b01_id=a.b01_id
where b.s9532 =2022 -- and c.s9532 like 'G%'
and d.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and a.a3219=1000000021972447
GROUP BY c.s9532 with ROLLUP


-- ������׵�����
select
c.s9532,
sum(ifnull(a0605,0)+ifnull(a0607,0)+ifnull(a0609,0)+ifnull(a0611,0)) as sdzzs, -- ������
cast(sum(ifnull(a0606,0)+ifnull(a0608,0)+ifnull(a0610,0)+ifnull(a0612,0))as decimal(18,3)) as sdzym, -- ������
sum(ifnull(a0601,0)) a0601,-- �����������
cast(sum(ifnull(a0602,0))as decimal(18,3)) a0602,-- �������������
sum(ifnull(a0605,0))  a0605,-- �س������
cast(sum(ifnull(a0606,0))as decimal(18,3)) a0606,-- �س��������
sum(ifnull(a0607,0)) a0607,-- �������
cast(sum(ifnull(a0608,0)) as decimal(18,3))a0608,-- ���������
sum(ifnull(a0609,0)) a0609,-- �������
cast(sum(ifnull(a0610,0))as decimal(18,3)) a0610,-- ���������
sum(ifnull(a0611,0)) a0611,-- �������
cast(sum(ifnull(a0612,0))as decimal(18,3)) a0612 -- ���������
from a11 a
left join  s951 b on a.a0101=b.s951_id -- ����
left join  s951 c on a.a0203=c.s951_id -- �����ȼ�
left join b01 d on d.b01_id=a.b01_id
where b.s9532 <=2022 -- and c.s9532 like 'G%'
and d.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')

GROUP BY c.s9532 with ROLLUP



SELECT LEFT(S9532,4) A0101
from S951
WHERE ZC01='D031'
GROUP BY LEFT(S9532,4)



SELECT B0111 ,b0101,CONCAT(B0111,'-',b0101) DWDM
from b01
where b0111 like CONCAT(42,'%')
ORDER BY b0111


SELECT CONCAT('ͳ�Ƹ�����:', 'TJFZR')

SELECT LEFT(S9532,4) A0101
from S951
WHERE ZC01='D031' AND S9532 LIKE CONCAT('','%')
GROUP BY LEFT(S9532,4)