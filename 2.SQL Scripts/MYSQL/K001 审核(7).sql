-- 7.17
-- �ظ�·�ε���ֹ��׮�Ų���·�ε�׮�����Χ�ڻ����ظ�·���뱻�ظ�·�ε�����������һ��
-- �����ظ���·����Ϣ�У����ظ�·�����׮�š�Ӧ���׮�ţ����ظ�·��ֹ��׮�š�Ӧ�С׮�ţ������ظ�·�����׮�š�>���ظ�·��ֹ��׮�š�
/*drop table if exists temp_k001_chz;
create  table temp_k001_chz(
b0111 varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
b0101 varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
K0101 varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
s9532 varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
K0108 double,
K0109 double,
id bigint(20) auto_increment not null,
PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci(
select b01.b0111 b0111,b01.b0101 b0101,a50.k0101 k0101,s9532,k.K0108 K0108,k.K0109 K0109
from K001  k
left join b01 on b01.b01_id=k.b01_id
left join a50 on a50.a50_id=k.a50_id
left join s951 c on c.s951_id=k.a0103
where ifnull(K0124,'')='' and ifnull(K0123,'1000001617955771')='1000001617955771'
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
and b01.b0111 like concat( (select b0111 from b01 where b01_id='1000001653571912'),'%')
order by b01.b0111 asc,a50.k0101 asc ,s9532 asc,k.K0108 desc
);
-- create index idx_b0111_k0101_s9532_k0108 on temp_k001_chz (b0111,k0101,s9532,k0108);

set @k001_n1:=null,@k001_m1 := null,@k001_p1 := null,@k001_q1 := null,@k001_x1 := 0,@k001_y1 := null;

drop table if exists temp_k001_sjlc;
create  table temp_k001_sjlc(
select b0111,b0101,K0101,s9532,min(K0108) K0108,max(K0109) K0109
    from (
        SELECT b0111,b0101,k0101,s9532,k0108,k0109,n0109,(case when  ifnull(n0109,0)=k0109 then @k001_x1 else @k001_x1+1 end ) as ns,id
            from (
                SELECT
                (case when id-1 =@k001_p1 and b0111 = @k001_n1 and k0101= @k001_m1 then @k001_q1:=k0108 else null end) as n0109,
                @k001_p1 := id as id ,
                @k001_n1 := b0111 b0111,
                @k001_m1 := k0101 k0101,
                @k001_q1 := k0108 k0108,
                k0109,s9532,B0101
                from temp_k001_chz
            )t1 order by b0111 asc ,k0101 asc ,s9532 asc,k0108 desc
    )t2
group by b0111,K0101,s9532,ns
);

-- ���ظ�·�β�����ʱ��
drop table if exists temp_k001_chf;
create  table temp_k001_chf
select b01.b0111,b01.b0101,k0124,c.s9532,c.s9533,K0162,K0163
from K001
left join b01 on b01.b01_id=k001.b01_id
left join s951 c on c.s951_id=K001.a0103
left join temp_k001_sjlc b on  left(c.s9532,6)=left(b.s9532,6) and K0124=b.k0101
where ifnull(K0124,'')<>''
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
and b01.b0111 like concat( (select b0111 from b01 where b01_id='1000001653571912'),'%')
and K0162>=b.k0108 and  K0163<= b.k0109 and k0162<k0163 and k001.A50_ID ='1650776933734031432'
order by b01.b0111;

-- ���ظ�·�β�����ʱ��
drop table if exists temp_k001_chf;
create  table temp_k001_chf
select b01.b0111,b01.b0101,k0124,c.s9532,c.s9533,K0162,K0163
from K001
left join b01 on b01.b01_id=k001.b01_id
left join s951 c on c.s951_id=K001.a0103
where ifnull(K0124,'')<>''
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
and b01.b0111 like concat( (select b0111 from b01 where b01_id='1000001653571912'),'%')
order by b01.b0111;

-- ����ʱ����ɾ����ʵ��·���е��ظ�·��
delete a
from temp_k001_chf a
join temp_k001_sjlc b on left(a.s9532,6)=left(b.s9532,6) and a.K0124=b.k0101
where a.K0162>=b.k0108 and  a.K0163<= b.k0109
and a.k0162<a.k0163;

-- ����ʱ����ɾ����ʵ��·���еķ����ظ�·��
delete a
from temp_k001_chf a
join temp_k001_sjlc b on left(a.s9532,6)=left(b.s9532,6) and a.K0124=b.k0101
where a.K0163>=b.k0108 and  a.K0162<= b.k0109
and a.k0162>a.k0163;

select
b.b0101 'ʵ��·�ι���λ',
b.k0101 'ʵ��·�δ���',
a.s9532 'ʵ��·��������������',
a.s9533 'ʵ��·��������������',
b.k0108 'ʵ��·�����׮��',
b.k0109 'ʵ��·��ֹ��׮��',
a.b0101 '���ظ�·�ι���λ',
a.k0124 '���ظ�·�δ���',
b.s9532 '���ظ�·��������������',
a.k0162 '���ظ�·�����׮��',
a.k0163 '���ظ�·��ֹ��׮��'
from temp_k001_chf a
left join temp_k001_sjlc b on a.s9532=b.s9532 and a.k0124=b.k0101
order by a.b0101,a.K0124,a.K0162;

*/

set @row_number := 0,@k001_n1:=null,@k001_m1 := null,@k001_p1 := null,@k001_q1 := null,@k001_x1 := 0,@k001_y1 := null;

drop table if exists temp_k001_sjlc;
create  table temp_k001_sjlc(
select b0111,b0101,K0101,s9532,min(K0108) K0108,max(K0109) K0109
from (
	SELECT b0111,b0101,k0101,s9532,k0108,k0109,n0109,(case when  ifnull(n0109,0)=k0109 then @k001_x1 else @k001_x1+1 end ) as ns,id
	from (
		SELECT
		(case when t.id-1 =@k001_p1 and t.b0111 = @k001_n1 and t.k0101= @k001_m1 then @k001_q1:=t.k0108 else null end) as n0109,
		@k001_p1 := t.id as id ,
		@k001_n1 := t.b0111 b0111,
		@k001_m1 := t.k0101 k0101,
		@k001_q1 := t.k0108 k0108,
		t.k0109 k0109,t.s9532 s9532,t.B0101 B0101
		from (
			select (@row_number := @row_number + 1) AS id,b01.b0111 b0111,b01.b0101 b0101,a50.k0101 k0101,s9532,k.K0108 K0108,k.K0109 K0109
				from K001  k
				left join b01 on b01.b01_id=k.b01_id
				left join a50 on a50.a50_id=k.a50_id
				left join s951 c on c.s951_id=k.a0103
				where ifnull(K0124,'')='' and ifnull(K0123,'1000001617955771')='1000001617955771'
				-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
				and b01.b0111 like concat( (select b0111 from b01 where b01_id='1000001653571912'),'%')
				order by b01.b0111 asc,a50.k0101 asc ,s9532 asc,k.K0108 desc
			)t
	)t1 order by b0111 asc ,k0101 asc ,s9532 asc,k0108 desc
)t2
group by b0111,K0101,s9532,ns
);

-- ���ظ�·�β�����ʱ��
drop table if exists temp_k001_chf;
create  table temp_k001_chf
select b01.b0111,b01.b0101,k0124,c.s9532,c.s9533,K0162,K0163
from K001
left join b01 on b01.b01_id=k001.b01_id
left join s951 c on c.s951_id=K001.a0103
left join temp_k001_sjlc b on  left(c.s9532,6)=left(b.s9532,6) and K0124=b.k0101
where ifnull(K0124,'')<>''
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
and b01.b0111 like concat( (select b0111 from b01 where b01_id='1000001653571912'),'%')
and K0162>=b.k0108 and  K0163<= b.k0109 and k0162<k0163 and k001.A50_ID ='1650776933734031432'
order by b01.b0111;

-- ���ظ�·�β�����ʱ��
drop table if exists temp_k001_chf;
create  table temp_k001_chf
select b01.b0111,b01.b0101,k0124,c.s9532,c.s9533,K0162,K0163
from K001
left join b01 on b01.b01_id=k001.b01_id
left join s951 c on c.s951_id=K001.a0103
where ifnull(K0124,'')<>''
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
and b01.b0111 like concat( (select b0111 from b01 where b01_id='1000001653571912'),'%')
order by b01.b0111;

-- ����ʱ����ɾ����ʵ��·���е��ظ�·��
delete a
from temp_k001_chf a
join temp_k001_sjlc b on left(a.s9532,6)=left(b.s9532,6) and a.K0124=b.k0101
where a.K0162>=b.k0108 and  a.K0163<= b.k0109 and a.k0162<a.k0163;

-- ����ʱ����ɾ����ʵ��·���еķ����ظ�·��
delete a
from temp_k001_chf a
join temp_k001_sjlc b on left(a.s9532,6)=left(b.s9532,6) and a.K0124=b.k0101
where a.K0163>=b.k0108 and  a.K0162<= b.k0109 and a.k0162>a.k0163;

select
b.b0101 'ʵ��·�ι���λ',
b.k0101 'ʵ��·�δ���',
a.s9532 'ʵ��·��������������',
a.s9533 'ʵ��·��������������',
b.k0108 'ʵ��·�����׮��',
b.k0109 'ʵ��·��ֹ��׮��',
a.b0101 '���ظ�·�ι���λ',
a.k0124 '���ظ�·�δ���',
b.s9532 '���ظ�·��������������',
a.k0162 '���ظ�·�����׮��',
a.k0163 '���ظ�·��ֹ��׮��'
from temp_k001_chf a
left join temp_k001_sjlc b on a.s9532=b.s9532 and a.k0124=b.k0101
order by a.b0101,a.K0124,a.K0162;