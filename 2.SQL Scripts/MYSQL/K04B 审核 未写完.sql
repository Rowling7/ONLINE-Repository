-- 12.1

SELECT
B01.B0111 AS  ����λ����,
B01.B0102 AS ����λ����,
A50.K0101 AS ·�ߴ���,
A50.K0112 AS  ·������,
MIN(K04B.K0108) AS ·�����׮��,
MAX(K04B.K0109) AS ·��ֹ��׮��,
CASE WHEN A5009='1642702461923786753' THEN '����'
	WHEN  A5009 ='1642702417019568130' THEN '����'
	WHEN  A5009= '1642702316859588610' THEN '˫��'END  AS ��ⷽ��,
'K04B·�ߴ�����K001�в����ڣ�'AS '˵��'
FROM K04B
LEFT JOIN B01 ON B01.B01_ID=K04B.B01_ID
LEFT JOIN A50 ON A50.A50_ID=K04B.A50_ID
WHERE K04B.A50_ID NOT IN (SELECT DISTINCT A50_ID FROM K001)
	and B01.B0111 like concat( (SELECT b0111 from b01 where b01_id=#{BO1CODE} ),'%')
GROUP BY B01.B0111,B01.B0102,A50.K0101,A50.K0112


union
select  k04b.a0102,k04b.ha0102,k04b.k0101,k04b.k0112,
[·�����׮��]=min(k04b.k0108),
[·��ֹ��׮��]=max(k04b.k0109),
k04b.a5009,k04b.ha5009,
[˵��]='K04B·��׮�Ų���k001��Χ�ڣ�'
from k04b
left join
    (  select  k.a0102,k.k0101,min(k.k0108) k0108,max(k.k0109) k0109
        from k001 k
		where k.a0102 like '#A0102#%' and k.a0102 like '#GLDW#%'
        group by k.a0102,k.k0101
        )b on k04b.k0101 =b.k0101 and k04b.a0102=b.a0102 and  (k04b.k0109<isnull(b.k0108,0) or k04b.k0108>isnull(b.k0109,0) or k04b.k0108<isnull(b.k0108,0) or k04b.k0109 >isnull(b.k0109,0))
where	k04b.k0101=b.k0101
and  k04b.a0102 like '#A0102#%' and k04b.a0102 like '#GLDW#%'
group by k04b.a0102, k04b.k0112,k04b.ha0102,k04b.k0101,k04b.a5009,k04b.ha5009
order by k04b.k0101 asc


-- 12.2

set @m = null, @n = null,@zd=null,@pzh=null;
select t2.b0111 '����λ',
T2.k0101 '·�ߴ���',
t2.pzh '��һ·��ֹ��׮��',
t2.k0108 '·��׮��|���',
t2.k0109 '·��׮��|ֹ��',
t2.diff '��ֵ' from (
select  T.b0111 b0111,
@n := case when @m !=T.K0101 then  0
			when @m = T.K0101  then  cast(T.k0108-@zd as decimal(18,3))
			else 0 end   as diff,
@m :=T.K0101  K0101,
@pzh :=@zd pzh,
@zd :=T.k0109 zd,
k0108 k0108,
T.k0109
from (
SELECT b01.b0111 b0111 ,A50.K0101 K0101,k0108 k0108,
max(k0109) k0109
FROM
k04b
left join b01 on b01.b01_id =k04b.b01_id
left join a50 on A50.a50_id =k04b.a50_id
group by  b01.b0111,A50.K0101,k0108
ORDER BY A50.K0101,k0108
)t
)t2
where t2.diff<0 and t2.B0111 like concat( (SELECT b0111 from b01 where b01_id=#{B01CODE}),'%')


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
-- AND b01.b0111 like concat( (select b0111 from b01 where b01_id=#{b01code}),'%')
AND b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')



-- 12.4
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
	and B01.B0111 like concat( (SELECT b0111 from b01 where b01_id=#{B01CODE}),'%')
	group by  a50.k0101,b01.b0111,b01.b0101
	HAVING 1=1
    ) b on b.a50_id=k04b.A50_ID
where k04b.a5009 in ('1642702316859588610','1642702417019568130')
and B.B0111 like concat( (SELECT b0111 from b01 where b01_id=#{B01CODE}),'%')
group by  b.k0101,b.b0111,b.b0101
having k04b�������<>b.k0114
order by k04b.k0101 asc




-- 12.5
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
	and B01.B0111 like concat( (SELECT b0111 from b01 where b01_id=#{B01CODE}),'%')
	group by  a50.k0101,b01.b0111,b01.b0101
	HAVING 1=1
    ) b on b.a50_id=k04b.A50_ID
where k04b.a5009 in ('1642702316859588610','1642702461923786753')
and B.B0111 like concat( (SELECT b0111 from b01 where b01_id=#{B01CODE}),'%')
group by  b.k0101,b.b0111,b.b0101
having k04b�������<>b.k0114
order by k04b.k0101 asc