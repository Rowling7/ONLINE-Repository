-- 10.1
-- �ɿ����׮�š�λ����K001�����Ҳ�����Ӧ·�Σ���ũ�幫·�ϵġ��ɿ����׮�š�һ��Ӧ�������ڶ�ͷ··�ε����׮�š�
select
b01.b0101 '����λ����',
a50.k0101 '·�ߴ���',
a50.k0112 '·�߼��',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '�ɿڴ���' ,
k.K6502 '�ɿ�����',
k.K6503 '�ɿ����׮��',
b.k0108 '·�����׮��',
b.k0109 '·��ֹ��׮��',
b.k0199 '·��K001���б�ע'
from K065 k
left join b01 on b01.b01_id=k.b01_id
left join a50 on a50.a50_id=k.a50_id
left join s951 c on c.s951_id=k.a0103
left join k001 b on b.a50_id=k.a50_id and k.k6503 >= b.k0108 and k.k6503 < b.k0109
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
AND ( b01.b0111 is null or (b01.b0111 is not null and left(a50.k0101,1) in ('X','J','Y','Z','C') and k.K6503<>b.K0108) );


-- 10.2
-- ������������������д���ҡ�����������Ӧ�����ؼ�����
select
b01.b0101 '����λ����',
a50.k0101 '·�ߴ���',
k.k6501 '�ɿڴ���',
(case when length(a50.k0101)<=9 and instr(a50.k0101,'d')=0 then concat(a50.k0101,left(c.s9532,6),'d',k6501)
when length(a50.k0101)<=9 and instr(a50.k0101,'d')<>0 then concat(left(a50.k0101,instr(a50.k0101,'d')-1),left(c.s9532,6),'d',k6501)
when length(a50.k0101)>9 and left(a50.k0101,1) in ('g','h','s','t') then concat(left(a50.k0101,4),left(c.s9532,6),'d',k6501)
when length(a50.k0101)>9 and left(a50.k0101,1) in ('x','j','y','n','c','z') then concat(left(a50.k0101,10),'d',k6501)else null end) '�ɿڴ���',K6503 '�ɿ����׮��',
k.k6502 '�ɿ�����',
c.s9532 '��������|����',
c.s9533 '��������|����'
from k065 k
left join b01 on b01.b01_id=k.b01_id
left join a50 on a50.a50_id=k.a50_id
left join s951 c on c.s951_id=k.a0103
WHERE -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and
(((length(c.s9532)<>6  and length(c.s9532)<>9)
OR b01.b0111 IS NULL OR LEFT(b01.b0111,2)<>LEFT(c.s9532,2)
OR LEFT(b01.b0111,4)<>LEFT(c.s9532,4) AND length(b01.b0111)=6 ));



-- 10.3
-- �ɿ����ڡ�����������������·�εġ������������뱣��һ��
select
b01.b0101 '����λ����',
a50.k0101 '·�ߴ���',
k.k6501 'k065�ɿ���Ϣ��|�ɿڴ���',
(case when length(a50.k0101)<=9 and instr(a50.k0101,'d')=0 then concat(a50.k0101,left(c.s9532,6),'d',k6501)
when length(a50.k0101)<=9 and instr(a50.k0101,'d')<>0 then concat(left(a50.k0101,instr(a50.k0101,'d')-1),left(c.s9532,6),'d',k6501)
when length(a50.k0101)>9 and left(a50.k0101,1) in ('g','h','s','t') then concat(left(a50.k0101,4),left(c.s9532,6),'d',k6501)
when length(a50.k0101)>9 and left(a50.k0101,1) in ('x','j','y','n','c','z') then concat(left(a50.k0101,10),'d',k6501)else null end) 'k065�ɿ���Ϣ��|�ɿ�׮��',
k.k6502 'k065�ɿ���Ϣ��|�ɿ�����',
c.s9532 'k065�ɿ���Ϣ��|��������|����',
c.s9533 'k065�ɿ���Ϣ��|��������|����',
b.k0108 'k001·���ۺ���Ϣ��|·�����׮��',
b.k0109 'k001·���ۺ���Ϣ��|·��ֹ��׮��',
d.s9532 'k001·���ۺ���Ϣ��|��������|����',
d.s9533 'k001·���ۺ���Ϣ��|��������|����'
from k065 k
left join b01 on b01.b01_id=k.b01_id
left join a50 on a50.a50_id=k.a50_id
left join s951 c on c.s951_id=k.a0103
left join k001 b on b.a50_id=k.a50_id and k.k6503 >= b.k0108 and k.k6503 < b.k0109
left join s951 d on d.s951_id=b.a0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
AND c.s9532<>d.s9532;


-- 10.4
-- �ɿڿ�ȵĵ�λ�ǹ����˶�������Ϣ�Ƿ���ȷ
select
b01.b0111 '����λ����' ,
b01.b0101 '����λ����',
a50.k0101 '·�ߴ���',
a50.k0112 '·�߼��',
k.k6501 '�ɿڱ��',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '�ɿڴ���' ,
k.K6523 '�ɿڿ��(����)',
C.S9532 '��������',
k.A0130 '������λ����',
k6521 '��������'
from k065 k
left join b01 on b01.b01_id=k.b01_id
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
 b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
 and (ifnull(k6523,0)=0 or ifnull(k6523,0)>=15);


-- 10.5
-- �ɿ����ڵ�·��Ӧ���Ƕ�ͷ··�Σ����k001�����Ƿ����ȷ��
select
b01.b0101 '����λ����',
a50.k0101 '·�ߴ���',
k.k6501 'k065�ɿ���Ϣ��|�ɿڴ���',
(case when length(a50.k0101)<=9 and instr(a50.k0101,'d')=0 then concat(a50.k0101,left(c.s9532,6),'d',k6501)
when length(a50.k0101)<=9 and instr(a50.k0101,'d')<>0 then concat(left(a50.k0101,instr(a50.k0101,'d')-1),left(c.s9532,6),'d',k6501)
when length(a50.k0101)>9 and left(a50.k0101,1) in ('g','h','s','t') then concat(left(a50.k0101,4),left(c.s9532,6),'d',k6501)
when length(a50.k0101)>9 and left(a50.k0101,1) in ('x','j','y','n','c','z') then concat(left(a50.k0101,10),'d',k6501)else null end) 'k065�ɿ���Ϣ��|�ɿ�׮��',
k.k6502 'k065�ɿ���Ϣ��|�ɿ�����',
c.s9532 'k065�ɿ���Ϣ��|��������|����',
c.s9533 'k065�ɿ���Ϣ��|��������|����',
b.k0108 'k001·���ۺ���Ϣ��|·�����׮��',
b.k0109 'k001·���ۺ���Ϣ��|·��ֹ��׮��',
d.s9532 'k001·���ۺ���Ϣ��|��������|����',
d.s9533 'k001·���ۺ���Ϣ��|��������|����',
(case when b.k0123 ='1000001617955771' then 2 when b.k0123='1000000721299854' then 1 end ) 'k001·���ۺ���Ϣ��|�Ƿ��ͷ··��',
b.k0199 'k001·���ۺ���Ϣ��|��ע'
from k065 k
left join b01 on b01.b01_id=k.b01_id
left join a50 on a50.a50_id=k.a50_id
left join s951 c on c.s951_id=k.a0103
left join k001 b on b.a50_id=k.a50_id and k.k6503 >= b.k0108 and k.k6503 < b.k0109
left join s951 d on d.s951_id=b.a0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
AND ifnull(b.k0123,'1000001617955771')<>'1000000721299854' and left(a50.k0101,1) not in ('g','s','h','t');


-- 10.6
-- �ɿڴ��벻���ظ�
SELECT
b01.b0101 '����λ����',
a50.k0101 '·�ߴ���',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
when LENGTH(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
when LENGTH(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '�ɿڱ��'	,
	COUNT(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when LENGTH(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when LENGTH(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end)  '�ɿڴ����ظ�����'
from k065 K
left join b01 on b01.b01_id=k.b01_id
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
 b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
GROUP BY
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
when LENGTH(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
when LENGTH(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end)
HAVING '�ɿڴ����ظ�����' >1;


-- 10.7
-- ������λ���ơ�����Ϊ��
select
b01.b0111 '����λ����' ,
b01.b0101 '����λ����',
a50.k0101 '·�ߴ���',
a50.k0112 '·�߼��',
k.k6501,
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '�ɿڱ��' ,
k.k6502 '�ɿ�����',
k.K6523 '�ɿڿ��(����)',
C.S9532 '��������',
k.A0130 '������λ����'
from k065 k
left join b01 on b01.b01_id=k.b01_id
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where --   b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
 b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and NOT(NOT (k.A0130 LIKE '%��%') AND NOT (k.A0130 LIKE '%δ%') AND NOT (k.A0130 LIKE '%0%') AND k.A0130 IS NOT NULL AND k.A0130<>'');


-- 10.8
-- �ɿڶɴ�����ֵ��������ܹ��ʡ��س���Ӧ��ͬʱ�
select
b01.b0111 '����λ����' ,
b01.b0101 '����λ����',
a50.k0101 '·�ߴ���',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '�ɿڱ��',
k6502 '�ɿ�����',
b.s9532 '�ɿڷ������',
b.s9533 '�ɿڷ�������',
K6584 '����_����(��)',
K6585 '����_��������(��λ)',
K6586 '����_����(ǧ��)',
K6543 '�ɲ�_����(��)',
K6544 '�ɲ�_�س���(��)'
from k065 K
left join b01 on b01.b01_id=k.b01_id
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
 and
(      (ifnull(k6584,0)<>0 and ifnull(k6543,0)=0 ) or
 not( (ifnull(k6584,0)=0 and ifnull(k6586,0)=0 and ifnull(k6585,0)=0 ) or (ifnull(k6584,0)<>0 and ifnull(k6586,0)<>0 and ifnull(k6585,0)<>0 ) ) or
 not( (ifnull(k6543,0)=0 and ifnull(k6544,0)=0  ) or (ifnull(k6543,0)<>0 and ifnull(k6544,0)<>0 ) )
);


-- 10.9
-- �ɿڶɴ�����ֵ��������ܹ��ʡ��س���Ӧ��ͬʱ�
select
b01.b0111 '����λ����' ,
b01.b0101 '����λ����',
a50.k0101 '·�ߴ���',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '�ɿڱ��',
k6502 '�ɿ�����',
b.s9532 '�ɿڷ������',
b.s9533 '�ɿڷ�������',
k6540 '����_����(��)',
k6541 '����_�ܹ���(ǧ��)',
k6542 '����_�س���(��)'
from k065 K
left join b01 on b01.b01_id=k.b01_id
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and
 not( (ifnull(k6540,0)=0 and ifnull(k6541,0)=0 and ifnull(k6542,0)=0 ) or (ifnull(k6540,0)<>0 and ifnull(k6541,0)<>0 and ifnull(k6542,0)<>0 ) );


-- 10.10
-- �����ɿڵĻ����ɴ�����������Ϊ���գ��ǻ����ɿ�(�����ɿ�)�ķǻ����ɴ�����������Ϊ����
select
b01.b0111 '����λ����' ,
b01.b0101 '����λ����',
a50.k0101 '·�ߴ���',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '�ɿڱ��',
k6502 '�ɿ�����',
b.s9532 '�ɿڷ������',
b.s9533 '�ɿڷ�������',
k6581 '�����ɴ�_����(��)',
k6582 '�����ɴ�_����(ǧ��)',
k6583 '�����ɴ�_��������(��λ)',
k6587 '�ǻ����ɴ�_����(��)',
k6589 '�ǻ����ɴ�_����(ǧ��)',
k6588 '�ǻ����ɴ�_��������(��λ)'
from k065 k
left join b01 on b01.b01_id=k.b01_id
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and  ((case when b.s9532='1' then 1 else 0 end)>ifnull(k6581,0)or
 (case when b.s9532='2' then 1 else 0 end)>ifnull(k6587,0));


 -- 10.11
 -- [�����ɴ�����]��������ʱ�������ɴ������������ܹ��ʲ���Ϊ���գ������ɴ�����Ӧ���ڵ��ڶ�������
select
b01.b0111 '����λ����' ,
b01.b0101 '����λ����',
a50.k0101 '·�ߴ���',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '�ɿڱ��',
k6502 '�ɿ�����',
b.s9532 '�ɿڷ������',
b.s9533 '�ɿڷ�������',
k6581 '�����ɴ�_����(��)',
k6582 '�����ɴ�_����(ǧ��)',
k6583 '�����ɴ�_��������(��λ)',
k6540 '����_����(��)',
k6541 '����_�ܹ���(ǧ��)',
k6542 '����_�س���(��)'
from k065 K
left join b01 on b01.b01_id=k.b01_id
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
 and b.s9532='1' and
(
(ifnull(k6581,0)=0 or ifnull(k6582,0)=0 or ifnull(k6583,0)=0) or
ifnull(k6581,0)<ifnull(k6540,0) or
ifnull(k6583,0)<ifnull(k6541,0)
);


 -- 10.12
 -- [�ǻ����ɴ�����]��������ʱ���ǻ����ɴ������������ܹ��ʲ���Ϊ���գ��ǻ����ɴ�����Ӧ���ڵ��ڶɲ�����
select
b01.b0111 '����λ����' ,
b01.b0101 '����λ����',
a50.k0101 '·�ߴ���',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '�ɿڱ��',
k6502 '�ɿ�����',
b.s9532 '�ɿڷ������',
b.s9533 '�ɿڷ�������',
k6581 '�����ɴ�_����(��)',
k6582 '�����ɴ�_����(ǧ��)',
k6583 '�����ɴ�_��������(��λ)',
k6540 '����_����(��)',
k6541 '����_�ܹ���(ǧ��)',
k6542 '����_�س���(��)'
from k065 K
left join b01 on b01.b01_id=k.b01_id
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
 and b.s9532='2' and
(
(ifnull(k6587,0)=0 or ifnull(k6589,0)=0 or ifnull(k6588,0)=0) or
	ifnull(k6587,0)<ifnull(k6543,0)
);
