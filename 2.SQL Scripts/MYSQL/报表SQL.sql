-- -----------------------------------> R0027<----------------------------------- --
-- 2023��7��6��

-- ������Ϣ��
SELECT
CONCAT(:A0101 ,'��')AS A0101,
CONCAT('��λ������:',:DWFZR) AS DWFZR,
CONCAT('ͳ�Ƹ�����:', :TJFZR) TJFZR,
CONCAT('���:', :TBR) TBR,
CONCAT('�����:', :TBRQ) TBRQ,
B01_ID, B0111 ,CONCAT('����λ: ',b0101) AS B0101,CONCAT(B0111,'-',b0101) DWDM
from b01
where b01_id=:B01_ID and z0011!=3
ORDER BY b0111;



-- -----------------------------------> R0027<----------------------------------- --
-- 2023��7��4��

-- �ϼ�
select
max(b.s9533) a3401,-- ���
max(c.s9533) a3402,-- ������¼
'' NULL1,
sum(ifnull(a3404,0)) a3404,-- ��λ����
sum(ifnull(a3405,0)) a3405,-- ��ƶ������
cast(sum(ifnull(a3406,0)*ifnull(a3404,0))/nullif(sum(ifnull(a3404,0)),0) as decimal(6,1)) a3406,	-- ƽ������
cast(sum(ifnull(a3407,0)*ifnull(a3404,0))/nullif(sum(ifnull(a3404,0)),0) as decimal(8,0)) a3407, -- ƽ�������루Ԫ��
'' NULL2,
'' NULL3,
'' NULL4
from A24 a
left join b01 on a.B01_ID=b01.B01_ID
left join s951 b on a.a3401=b.s951_id -- ���
left join s951 c on  a.a3402=c.s951_id -- ������¼
left join s951 d on a.a0101=d.s951_id -- ����
-- where d.s9532 = :A0101 and a.z0011!=3
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ),'%')
where d.s9532 = 2022 and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
group by a3401,a3402
order by a3401,a3402;

-- ��ϸ
select
b.s9533 a3401,-- ���
c.s9533 a3402,-- ������¼
a3403 a3403,-- ��Ҫ��������
ifnull(a3404,0) a3404,-- ��λ����
ifnull(a3405,0) a3405,-- ��ƶ������
ifnull(a3406,0) a3406,-- ƽ������
ifnull(a3407,0) a3407,-- ƽ�������루Ԫ��
a3408 a3408,-- ��Ҫ�ʽ���Դ
cast(a0129 as char) a0129,-- ��ע
e.s9532 a0103
from A24 a
left join b01 on a.B01_ID=b01.B01_ID
left join s951 b on a.a3401=b.s951_id -- ���
left join s951 c on  a.a3402=c.s951_id -- ������¼
left join s951 d on a.a0101=d.s951_id -- ����
left join s951 e on  a.a0103=e.s951_id -- ��λ����
-- where d.s9532 = :A0101 and a.z0011!=3
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ),'%')
where d.s9532 = 2022 and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
order by e.s9532 ,b.s9533,c.s9533;



-- -----------------------------------> R0028<----------------------------------- --
-- 2023��7��4��

-- �ϼ�
select
'�ϼ�' SUM0,-- �ؼ���·������ְ��
sum(ifnull(a3411,0)+ifnull(a3412,0)+ifnull(a3413,0)) SUM1,-- �ϼ�
sum(ifnull(a3411,0)) a3411,-- �ؼ�
sum(ifnull(a3412,0)) a3412,-- �缶
sum(ifnull(a3413,0)) a3413,-- �弶
sum(ifnull(a3414,0)+ifnull(a3415,0)+ifnull(a3416,0)) SUM2,-- �ϼ�
sum(ifnull(a3414,0)) a3414,-- �ص�
sum(ifnull(a3415,0)) a3415,-- ���
sum(ifnull(a3416,0)) a3416-- ���
from A25 A
left join b01 on a.B01_ID=b01.B01_ID
left join s951 d on a.a0101=d.s951_id -- ����
-- where d.s9532 = :A0101 and a.z0011!=3
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ),'%')
where d.s9532 = 2022 and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%');

-- ��ϸ
select
e.s9532 a0103,-- �ؼ���������
A3410 A3410,-- �ؼ���·������ְ��
(ifnull(a3411,0)+ifnull(a3412,0)+ifnull(a3413,0)) SUM1,-- �ϼ�
ifnull(a3411,0) a3411,-- �ؼ�
ifnull(a3412,0) a3412,-- �缶
ifnull(a3413,0) a3413,-- �弶
(ifnull(a3414,0)+ifnull(a3415,0)+ifnull(a3416,0)) SUM2,-- �ϼ�
ifnull(a3414,0) a3414,-- �ص�
ifnull(a3415,0) a3415,-- ���
ifnull(a3416,0) a3416, -- ���
b.s9533 a3417,-- �Ƿ�Ӧ����Ϣ��
cast(a0129 as char) a0129-- ��ע
from A25 A
left join b01 on a.B01_ID=b01.B01_ID
left join s951 b on a.a3417=b.s951_id -- �Ƿ�Ӧ����Ϣ��
left join s951 d on a.a0101=d.s951_id -- ����
left join s951 e on  a.a0103=e.s951_id -- ��λ����
-- where d.s9532 = :A0101 and a.z0011!=3
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ),'%')
where d.s9532 = 2022 and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%');


-- -----------------------------------> R0026<----------------------------------- --
-- 2023��7��5��

SELECT
COALESCE(e.s9533,e.s9532,'�ϼ�') ha0103,-- ��λ����
COALESCE(e.s9532,e.s9533,'42') a0103,-- ��λ����
-- e.s9533 ha0103,-- ��λ����
-- e.s9532 a0103,-- ��λ����
SUM(ifnull(A0108A,0)) A0108A,-- ������������
SUM(ifnull(A0118A,0)) A0118A, -- ������ҵ(��)
SUM(ifnull(A0119A,0)) A0119A,-- �շѹ�·��Ӫ��ҵ(��)
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)+ifnull(A0834a,0)+ifnull(A0835a,0)+
	ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)+ifnull(A0836a,0)+ifnull(A0824a,0)) sum2, -- �ϼ�
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)+ifnull(A0834a,0)+ifnull(A0835a,0)) sum3, -- С��
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)) sum6, -- �ڸ�ְ��
sum(ifnull(A0830a,0)) A0830a,	-- ���̼�����Ա
sum(ifnull(A0831a,0)) A0831a,	-- ��ҵ�����Ա
sum(ifnull(A0832a,0)) A0832a,	-- ��ͬ����Ա
sum(ifnull(A0833a,0)) A0833a,	-- ��ʱƸ����Ա
sum(ifnull(A0834a,0)) A0834a,	-- ������ǲ��Ա
sum(ifnull(A0835a,0)) A0835a,	-- ������Ա
sum(ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)+ifnull(A0836a,0)+ifnull(A0824a,0)) sum4, -- ����_�ڸ�ְ��
sum(ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)) sum5, -- ����_�ڸ�ְ��
sum(ifnull(A0821a,0)) A0821a, -- ����_��ҵ�����Ա
sum(ifnull(A0822a,0)) A0822a, -- ����_��ͬ����Ա
sum(ifnull(A0823a,0)) A0823a, -- ����_��ʱƸ����Ա
sum(ifnull(A0836a,0)) A0836a, -- ����_������ǲ��Ա
sum(ifnull(A0824a,0)) A0824a  -- ����_������Ա
from a21 a
left join b01 on a.B01_ID=b01.B01_ID
left join s951 e on  a.a0103=e.s951_id -- ��λ����
left join s951 d on a.a0101=d.s951_id -- ����
-- where d.s9532 = :A0101 and a.z0011!=3
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ),'%')
where  d.s9532 = '2022' and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and left (b01.b0111,3)<>'42a'
and (LENGTH(e.s9532)=6 )
and e.s9532 not in('420201','420301','420501','420601','420701','421001','421101','421201','421301')
GROUP BY e.s9532 ,e.s9533 with rollup
having COALESCE(e.s9533,e.s9532,'�ϼ�')<>COALESCE(e.s9532,e.s9533,'42');

/*  --�ϼ���
SELECT
-- e.s9533 ha0103,-- ��λ����
-- e.s9532 a0103,-- ��λ����
'�ϼ�' ha0103,-- ��λ����
'' a0103,-- ��λ����
SUM(ifnull(A0108A,0)) A0108A,-- ������������
SUM(ifnull(A0118A,0)) A0118A, -- ������ҵ(��)
SUM(ifnull(A0119A,0)) A0119A,-- �շѹ�·��Ӫ��ҵ(��)
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)+ifnull(A0834a,0)+ifnull(A0835a,0)+
	ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)+ifnull(A0836a,0)+ifnull(A0824a,0)) sum2, -- �ϼ�
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)+ifnull(A0834a,0)+ifnull(A0835a,0)) sum3, -- С��
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)) sum6, -- �ڸ�ְ��
sum(ifnull(A0830a,0)) A0830a,	-- ���̼�����Ա
sum(ifnull(A0831a,0)) A0831a,	-- ��ҵ�����Ա
sum(ifnull(A0832a,0)) A0832a,	-- ��ͬ����Ա
sum(ifnull(A0833a,0)) A0833a,	-- ��ʱƸ����Ա
sum(ifnull(A0834a,0)) A0834a,	-- ������ǲ��Ա
sum(ifnull(A0835a,0)) A0835a,	-- ������Ա
sum(ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)+ifnull(A0836a,0)+ifnull(A0824a,0)) sum4, -- ����_�ڸ�ְ��
sum(ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)) sum5, -- ����_�ڸ�ְ��
sum(ifnull(A0821a,0)) A0821a, -- ����_��ҵ�����Ա
sum(ifnull(A0822a,0)) A0822a, -- ����_��ͬ����Ա
sum(ifnull(A0823a,0)) A0823a, -- ����_��ʱƸ����Ա
sum(ifnull(A0836a,0)) A0836a, -- ����_������ǲ��Ա
sum(ifnull(A0824a,0)) A0824a  -- ����_������Ա
from a21 a
left join b01 on a.B01_ID=b01.B01_ID
left join s951 e on  a.a0103=e.s951_id -- ��λ����
left join s951 d on a.a0101=d.s951_id -- ����
-- where d.s9532 = :A0101 and a.z0011!=3
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ),'%')
where  d.s9532 = '2022' and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and left (b01.b0111,3)<>'42a'
and (LENGTH(e.s9532)=6 )
and e.s9532 not in('420201','420301','420501','420601','420701','421001','421101','421201','421301') ;


*/

/*-- ��ϸ����

SELECT
e.s9532 a0103,-- ��λ����
e.s9533 ha0103,-- ��λ����
SUM(ifnull(A0108A,0)) A0108A,-- ������������
SUM(ifnull(A0118A,0)) A0118A, -- ������ҵ(��)
SUM(ifnull(A0119A,0)) A0119A,-- �շѹ�·��Ӫ��ҵ(��)
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)+ifnull(A0834a,0)+ifnull(A0835a,0)+
	ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)+ifnull(A0836a,0)+ifnull(A0824a,0)) sum2, -- �ϼ�
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)+ifnull(A0834a,0)+ifnull(A0835a,0)) sum3, -- С��
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)) sum6, -- �ڸ�ְ��
sum(ifnull(A0830a,0)) A0830a,	-- ���̼�����Ա
sum(ifnull(A0831a,0)) A0831a,	-- ��ҵ�����Ա
sum(ifnull(A0832a,0)) A0832a,	-- ��ͬ����Ա
sum(ifnull(A0833a,0)) A0833a,	-- ��ʱƸ����Ա
sum(ifnull(A0834a,0)) A0834a,	-- ������ǲ��Ա
sum(ifnull(A0835a,0)) A0835a,	-- ������Ա
sum(ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)+ifnull(A0836a,0)+ifnull(A0824a,0)) sum4, -- ����_�ڸ�ְ��
sum(ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)) sum5, -- ����_�ڸ�ְ��
sum(ifnull(A0821a,0)) A0821a, -- ����_��ҵ�����Ա
sum(ifnull(A0822a,0)) A0822a, -- ����_��ͬ����Ա
sum(ifnull(A0823a,0)) A0823a, -- ����_��ʱƸ����Ա
sum(ifnull(A0836a,0)) A0836a, -- ����_������ǲ��Ա
sum(ifnull(A0824a,0)) A0824a  -- ����_������Ա
from a21 a
left join b01 on a.B01_ID=b01.B01_ID
left join s951 e on  a.a0103=e.s951_id -- ��λ����
left join s951 d on a.a0101=d.s951_id -- ����
 where  d.s9532 = '2022' and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and left (b01.b0111,3)<>'42a'
and (LENGTH(e.s9532)=6 )
and e.s9532 not in('420201','420301','420501','420601','420701','421001','421101','421201','421301')
GROUP BY e.s9532 ,e.s9533


*/


-- -----------------------------------> R0025<----------------------------------- --
-- 2023��7��6��

-- �ϼ�
select
'�ϼ�' GS ,	-- ����λ����
 '' BM ,	-- ����λ����
SUM(ifnull(A0108 ,0)) A0108 ,	-- ������������
SUM(ifnull(A1118 ,0)) A1118 , 	-- ������ҵ(��)
SUM(ifnull(A0109 ,0)) A0109 ,	-- �շѹ�·��Ӫ��ҵ(��)
sum(ifnull(A0831 ,0)+ifnull(A0832 ,0)+ifnull(A0833 ,0)+ifnull(A0834 ,0)+ifnull(A0835 ,0)+
	ifnull(A0821 ,0)+ifnull(A0822 ,0)+ifnull(A0823 ,0)+ifnull(A0836 ,0)+ifnull(A0824 ,0)) sum0,	-- �ϼ�
sum(ifnull(A0831 ,0)+ifnull(A0832 ,0)+ifnull(A0833 ,0)+ifnull(A0834 ,0)+ifnull(A0835 ,0)) sum1,	-- С��
sum(ifnull(A0831 ,0)+ifnull(A0832 ,0)+ifnull(A0833 ,0)) sum2 , -- �ڸ�ְ��
sum(ifnull(A0830 ,0)) A0830,	-- ���̼�����Ա
sum(ifnull(A0831 ,0)) A0831,	-- ��ҵ�����Ա
sum(ifnull(A0832 ,0)) A0832,	-- ��ͬ����Ա
sum(ifnull(A0833 ,0)) A0833,	-- ��ʱƸ����Ա
sum(ifnull(A0834 ,0)) A0834,	-- ������ǲ��Ա
sum(ifnull(A0835 ,0)) A0835,	-- ������Ա
sum(ifnull(A0821 ,0)+ifnull(A0822 ,0)+ifnull(A0823 ,0)+ifnull(A0836 ,0)+ifnull(A0824 ,0)) sum3, -- ����_�ڸ�ְ��
sum(ifnull(A0821 ,0)+ifnull(A0822 ,0)+ifnull(A0823 ,0)) sum4, -- ����_�ڸ�ְ��
sum(ifnull(A0821 ,0)) A0821, -- ����_��ҵ�����Ա
sum(ifnull(A0822 ,0)) A0822, -- ����_��ͬ����Ա
sum(ifnull(A0823 ,0)) A0823, -- ����_��ʱƸ����Ա
sum(ifnull(A0836 ,0)) A0836, -- ����_������ǲ��Ա
sum(ifnull(A0824 ,0)) A0824 -- ����_������Ա
from a21 a
left join b01 on a.B01_ID=b01.B01_ID
left join s951 d on a.a0101=d.s951_id --  ����
left JOIN XQLXB ON B01.B0111 =G02
left join GYDWB on GS=MC
--  where d.s9532 = :A0101 and a.z0011!=3
--  and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ) ,'%')
where  d.s9532 = '2022' and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912) ,'%')
and left (b01.b0111 ,3)<>'42a'  ;

-- ��ϸ
select
GS GS ,-- ����λ����
BM BM ,-- ����λ����
SUM(ifnull(A0108 ,0)) A0108 ,		-- ������������
SUM(ifnull(A1118 ,0)) A1118 , 	-- ������ҵ(��)
SUM(ifnull(A0109 ,0)) A0109 ,		-- �շѹ�·��Ӫ��ҵ(��)
sum(ifnull(A0831 ,0)+ifnull(A0832 ,0)+ifnull(A0833 ,0)+ifnull(A0834 ,0)+ifnull(A0835 ,0)+
	ifnull(A0821 ,0)+ifnull(A0822 ,0)+ifnull(A0823 ,0)+ifnull(A0836 ,0)+ifnull(A0824 ,0)) sum0, -- �ϼ�
sum(ifnull(A0831 ,0)+ifnull(A0832 ,0)+ifnull(A0833 ,0)+ifnull(A0834 ,0)+ifnull(A0835 ,0)) sum1, -- С��
sum(ifnull(A0831 ,0)+ifnull(A0832 ,0)+ifnull(A0833 ,0)) sum2 , -- �ڸ�ְ��
sum(ifnull(A0830 ,0)) A0830,	-- ���̼�����Ա
sum(ifnull(A0831 ,0)) A0831,	-- ��ҵ�����Ա
sum(ifnull(A0832 ,0)) A0832,	-- ��ͬ����Ա
sum(ifnull(A0833 ,0)) A0833,	-- ��ʱƸ����Ա
sum(ifnull(A0834 ,0)) A0834,	-- ������ǲ��Ա
sum(ifnull(A0835 ,0)) A0835,	-- ������Ա
sum(ifnull(A0821 ,0)+ifnull(A0822 ,0)+ifnull(A0823 ,0)+ifnull(A0836 ,0)+ifnull(A0824 ,0)) sum3, -- ����_�ڸ�ְ��
sum(ifnull(A0821 ,0)+ifnull(A0822 ,0)+ifnull(A0823 ,0)) sum4, -- ����_�ڸ�ְ��
sum(ifnull(A0821 ,0)) A0821, -- ����_��ҵ�����Ա
sum(ifnull(A0822 ,0)) A0822, -- ����_��ͬ����Ա
sum(ifnull(A0823 ,0)) A0823, -- ����_��ʱƸ����Ա
sum(ifnull(A0836 ,0)) A0836, -- ����_������ǲ��Ա
sum(ifnull(A0824 ,0)) A0824 -- ����_������Ա
from a21 a
left join b01 on a.B01_ID=b01.B01_ID
left join s951 d on a.a0101=d.s951_id --  ����
left JOIN XQLXB ON B01.B0111 =G02
left join GYDWB on GS=MC
--  where d.s9532 = :A0101 and a.z0011!=3
--  and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ) ,'%')
where  d.s9532 = '2022' and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912) ,'%')
and left (b01.b0111 ,3)<>'42a'  AND GS IS NOT NULL
GROUP BY b0111,GS,bm ;


-- -----------------------------------> R0024<----------------------------------- --
-- 2023��7��6��

-- ��ϸ
select
b01.b0101 ha0103,-- ��λ����
b01.b0111 a0103,-- ��λ����
SUM(ifnull(A0108b, 0)) A0108b, 	-- ������������
SUM(ifnull(A0118b, 0)) A0118b,	-- ������ҵ(��)
SUM(ifnull(A0119b, 0)) A0119b, 	-- �շѹ�·��Ӫ��ҵ(��)
sum(ifnull(A0831b, 0)+ifnull(A0832b, 0)+ifnull(A0833b, 0)+ifnull(A0834b, 0)+ifnull(A0835b, 0)+
	ifnull(A0821b, 0)+ifnull(A0822b, 0)+ifnull(A0823b, 0)+ifnull(A0836b, 0)+ifnull(A0824b, 0)) sum0,  -- �ϼ�
sum(ifnull(A0831b, 0)+ifnull(A0832b, 0)+ifnull(A0833b, 0)+ifnull(A0834b, 0)+ifnull(A0835b, 0)) sum1,  -- С��
sum(ifnull(A0831b, 0)+ifnull(A0832b, 0)+ifnull(A0833b, 0))sum2,  -- �ڸ�ְ��
sum(ifnull(A0830b, 0)) A0830b, 	-- ���̼�����Ա
sum(ifnull(A0831b, 0)) A0831b, 	-- ��ҵ�����Ա
sum(ifnull(A0832b, 0)) A0832b, 	-- ��ͬ����Ա
sum(ifnull(A0833b, 0)) A0833b, 	-- ��ʱƸ����Ա
sum(ifnull(A0834b, 0)) A0834b, 	-- ������ǲ��Ա
sum(ifnull(A0835b, 0)) A0835b, 	-- ������Ա
sum(ifnull(A0821b, 0)+ifnull(A0822b, 0)+ifnull(A0823b, 0)+ifnull(A0836b, 0)+ifnull(A0824b, 0)) sum3,  -- ����_�ڸ�ְ��
sum(ifnull(A0821b, 0)+ifnull(A0822b, 0)+ifnull(A0823b, 0)) sum4,  -- ����_�ڸ�ְ��
sum(ifnull(A0821b, 0)) A0821b,	-- ����_��ҵ�����Ա
sum(ifnull(A0822b, 0)) A0822b,	-- ����_��ͬ����Ա
sum(ifnull(A0823b, 0)) A0823b,	-- ����_��ʱƸ����Ա
sum(ifnull(A0836b, 0)) A0836b,	-- ����_������ǲ��Ա
sum(ifnull(A0824b, 0)) A0824b 	-- ����_������Ա
from a21 A
left join b01 on a.B01_ID=b01.B01_ID
left join s951 d on a.a0101=d.s951_id -- ����
left join s951 e on  a.a0103=e.s951_id -- ��λ����
-- where d.s9532 = :A0101 and a.z0011!=3
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ),'%')
where  d.s9532 = '2022' and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and left (b01.b0111,3)='42a'
GROUP BY b01.b0111,b01.b0101  with rollup;