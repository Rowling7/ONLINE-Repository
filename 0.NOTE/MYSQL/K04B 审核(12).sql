-- 12.1
set @k04b_n1=null,@k04b_m1=0,@k04b_p1=0,@k04b_x1=null,@k04b_y1=0,@k04b_z1=0;

select
b01.b0111 as  ����λ����,
b01.b0102 as ����λ����,
a50.k0101 as ·�ߴ���,
a50.k0112 as  ·������,
min(k04b.k0108) as ·�����׮��,
max(k04b.k0109) as ·��ֹ��׮��,
case when a5009='1642702461923786753' then '����'
	when  a5009 ='1642702417019568130' then '����'
	when  a5009= '1642702316859588610' then '˫��'end  as ��ⷽ��,
'k04b·�ߴ�����k001�в����ڣ�'as '˵��'
from k04b
left join b01 on b01.b01_id=k04b.b01_id
left join a50 on a50.a50_id=k04b.a50_id
where k04b.a50_id not in (select distinct a50_id from k001)
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
group by b01.b0111,b01.b0102,a50.k0101,a50.k0112
union
select
b01.b0111 as  ����λ����,
b01.b0102 as ����λ����,
a50.k0101 as ·�ߴ���,
a50.k0112 as  ·������,
t.k04b_k0108 ·�����׮��,
t.k04b_k0109 ·��ֹ��׮��,
case when t.k04b_a5009='1642702461923786753' then '����'
	when  t.k04b_a5009 ='1642702417019568130' then '����'
	when  t.k04b_a5009= '1642702316859588610' then '˫��'end  as ��ⷽ��,
'k04b·��׮�Ų���k001��Χ�ڣ�'  as ˵��
 from(
select
 @k04b_n1:=k04b.a50_id k04b_a50_id,
 @k04b_m1:=cast(min(k04b.k0108)as decimal(18,3)) k04b_k0108,
 @k04b_p1:=cast(max(k04b.k0109)as decimal(18,3))  k04b_k0109,
k04b.a5009 k04b_a5009,
 @k04b_x1:=k001.a50_id k001_a50_id,
 @k04b_y1:=cast(min(k001.k0108)as decimal(18,3))  k001_k0108,
 @k04b_z1:=cast(max(k001.k0109)as decimal(18,3)) k001_k0109
from k04b
left join k001 on k04b.a50_id=k001.a50_id
where  ifnull(k001.k0123,'1000001617955771')='1000001617955771' and k0124 is null
group by k04b.a50_id,k001.a50_id,k04b.a5009
) t
left join a50 on t.k04b_a50_id=a50.a50_id
left join b01 on a50.b01_id=b01.b01_id
where  case when t.k04b_k0108  <t.k001_k0108 or  t.k04b_k0109 > t.k001_k0109 or  t.k04b_k0109<t.k001_k0108 or  t.k04b_k0108 > t.k001_k0109 then t.k04b_a50_id else null end  is not null
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%');
and  b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%');



-- 12.2
set @k04b_m2 = null, @k04b_n2 = null,@k04b_zd=null,@k04b_pzh=null;
select t2.b0111 '����λ',
T2.k0101 '·�ߴ���',
cast(t2.pzh as decimal(18,3)) '��һ·��ֹ��׮��',
t2.k0108 '·��׮��|���',
t2.k0109 '·��׮��|ֹ��',
t2.diff '��ֵ' from (
select  T.b0111 b0111,
@k04b_n2 := case when @k04b_m2 <>T.K0101 then  0
			when @k04b_m2  = T.K0101 then  cast(T.k0108-@k04b_zd as decimal(18,3))
			else 0 end   as diff,
@k04b_m2 :=T.K0101  K0101,
@k04b_pzh :=@k04b_zd pzh,
@k04b_zd :=T.k0109 zd,
cast( k0108 as decimal(15,3)) k0108,
T.k0109
from (
SELECT b01.b0111 b0111 ,A50.K0101 K0101,cast(k0108 as decimal(15,3)) k0108,
cast(max(k0109)as decimal(15,3)) k0109
FROM
k04b
left join b01 on b01.b01_id =k04b.b01_id
left join a50 on A50.a50_id =k04b.a50_id
group by  b01.b0111,A50.K0101,k0108
ORDER BY A50.K0101,k0108
)t
)t2
-- where t2.diff<0 and t2.B0111 like concat( (SELECT b0111 from b01 where b01_id=#{B01CODE}),'%');
where t2.diff<0 and t2.B0111 like concat( (SELECT b0111 from b01 where b01_id=1000001653571912),'%');


-- 12.3

select B01.B0111 '����λ����', B01.B0101 '����λ����',A50.K0101 '·�ߴ���',T.k0112 '·������',T.k0108 '���׮��',T.k0110 '�������',T.k0109 'ֹ��׮��',T.k0111 'ֹ������',T.k0114 '���',
'·�ߴ�����K04B�в����ڣ�' AS '������ʾ'
FROM (
SELECT   A50_ID,k0112,k0108,k0110,k0109,k0111,k0114,k0123,k0124
FROM K001
WHERE K001.A50_ID NOT  IN (SELECT DISTINCT K04B.A50_ID
FROM K04B
where  K04B.a0102 is null)
)T
LEFT JOIN  A50 ON T.A50_ID=A50.A50_ID
LEFT JOIN B01 ON A50.B01_ID=B01.B01_ID
WHERE  left(A50.k0101,1) in ('x','y','c') and ifnull(T.k0123,'1000001617955771')='1000001617955771' and T.k0124 is null
-- AND b01.b0111 like concat( (select b0111 from b01 where b01_id=#{b01code}),'%');
AND b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%');

-- 12.4 ����(��ʱ)
select  b.b0111 as ����λ���� ,b.b0101 as ����λ ,b.k0101  as ·�ߴ���,
cast(sum(ifnull(k04b.a5008/1000,0)) as decimal(18,3))  as k04b�������,
b.k0114 as k001�������
from k04b
left join (
    select  k001.a50_id,b01.b0111 b0111,b01.b0101 b0101,a50.k0101 k0101,cast(sum(k001.k0114) as decimal(18,3))  as k0114
	from k001
	left join b01 on b01.b01_id=k001.b01_id
	left join a50 on a50.a50_id=k001.a50_id
	where  ifnull(k001.k0123,'1000001617955771')='1000001617955771' and k0124 is null
-- 	and B01.B0111 like concat( (SELECT b0111 from b01 where b01_id=#{B01CODE}),'%')
	and B01.B0111 like concat( (SELECT b0111 from b01 where b01_id=1000001653571912),'%')
	group by  a50.k0101,b01.b0111,b01.b0101
	HAVING 1=1
    ) b on b.a50_id=k04b.A50_ID
where k04b.a5009 in ('1642702316859588610','1642702417019568130')
-- and B01.B0111 like concat( (SELECT b0111 from b01 where b01_id=#{B01CODE}),'%')
and B.B0111 like concat( (SELECT b0111 from b01 where b01_id=1000001653571912),'%')
group by  b.k0101,b.b0111,b.b0101
having k04b�������<>b.k0114
order by k04b.k0101 asc


-- 12.5 ����(��ʱ)
select  b.b0111 as ����λ���� ,b.b0101 as ����λ ,b.k0101  as ·�ߴ���,
cast(sum(ifnull(k04b.a5008/1000,0)) as decimal(18,3))  as k04b�������,
b.k0114 as k001�������
from k04b
left join (
    select  k001.a50_id,b01.b0111 b0111,b01.b0101 b0101,a50.k0101 k0101,cast(sum(k001.k0114) as decimal(18,3))  as k0114
	from k001
	left join b01 on b01.b01_id=k001.b01_id
	left join a50 on a50.a50_id=k001.a50_id
	where  ifnull(k001.k0123,'1000001617955771')='1000001617955771' and k0124 is null
-- 	and B01.B0111 like concat( (SELECT b0111 from b01 where b01_id=#{B01CODE}),'%')
	and B01.B0111 like concat( (SELECT b0111 from b01 where b01_id=1000001653571912),'%')
	group by  a50.k0101,b01.b0111,b01.b0101
	HAVING 1=1
    ) b on b.a50_id=k04b.A50_ID
where k04b.a5009 in ('1642702316859588610','1642702461923786753')
-- and B.B0111 like concat( (SELECT b0111 from b01 where b01_id=#{B01CODE}),'%')
and B.B0111 like concat( (SELECT b0111 from b01 where b01_id=1000001653571912),'%')
group by  b.k0101,b.b0111,b.b0101
having k04b�������<>b.k0114
order by k04b.k0101 asc