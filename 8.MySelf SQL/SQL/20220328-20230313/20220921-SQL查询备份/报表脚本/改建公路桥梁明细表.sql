
if object_id('tempdb..#linshi_A') is not null
drop table #linshi_A
create table #linshi_A
(	a0102 varchar(15),ha0102 varchar(100),
	bh char(2),
	HA0203 char(12),
	K0101 varchar(100),
	K6003 varchar(100),
	K6002 varchar(100),
	A0503 numeric(15,4),
	A0504 numeric(15,4),
	K6064 varchar(300),
	A0505 numeric(15,4),
	A0506 numeric(15,4),
	A0507 numeric(15,4),
	A0508 numeric(15,4),
	A0509 numeric(15,4),
	A0510 numeric(15,4),
	a0519 numeric(15,4),
	A0520 numeric(15,4),
	A0521 numeric(15,4),
	a0511 numeric(15,4),
	a0512 numeric(15,4),
	a0513 numeric(15,4),
	a0514 numeric(15,4),
	a0515 numeric(15,4),
	a0516 numeric(15,4),
	a0517 numeric(15,4),
	a0518 numeric(15,4),
	a0522 numeric(15,4),
	A0701 numeric(15,4),
	A0702 numeric(15,4),
	A0534 numeric(15,4),
	a0605 numeric(15,4),
	a0606 numeric(15,4),
	a0607 numeric(15,4),
	a0608 numeric(15,4),
	a0609 numeric(15,4),
	a0610 numeric(15,4),
	a0611 numeric(15,4),
	a0612 numeric(15,4),
    	col31 numeric(15,4),
      col32 numeric(15,4),
	K0116 char(8)
)

------------������½�������
if object_id('tempdb..#������½�������_A') is not null	drop table #������½�������_A
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
                  min(k6003) k6003,
                  max(k6070) k6070,
                  max(k6002) k6002,
                  min(k6064) k6064,
                  max(k0116) k0116,
			[Σ������]			= sum(case when left(K6028,1) in('4','5') then 1 else 0 end),
			[Σ������]			= sum(case when left(K6028,1) in('4','5') then K6008 else 0 end),
			[��������������]			= sum(case when K6004='1' then 1 else 0 end),
			[��������������]			= sum(case when K6004='1' then K6008 else 0 end),
			[����������������]   	= sum(case when K6004='2' then 1 else 0 end),
			[����������������]   	= sum(case when K6004='2' then K6008 else 0 end),
			[��ʱ����������]			= sum(case when K6004='3' then 1 else 0 end),
			[��ʱ����������]			= sum(case when K6004='3' then K6008 else 0 end),
			[��ͨʽ����������]	= sum(case when K6062='1' then 1 else 0 end),
			[��ͨʽ����������]	= sum(case when K6062='1' then K6008 else 0 end),
			[�ѵ�]			= isnull(sum(A0521),0),
			[�ش�������]			= sum(case when K6007='1' then 1 else 0 end),
			[�ش�������]			= sum(case when K6007='1' then K6008 else 0 end),
			[��������]			= sum(case when K6007='2' then 1 else 0 end),
			[��������]			= sum(case when K6007='2' then K6008 else 0 end),
			[��������]			= sum(case when K6007='3' then 1 else 0 end),
			[��������]			= sum(case when K6007='3' then K6008 else 0 end),
			[С������]			= sum(case when K6007='4' then 1 else 0 end),
			[С������]			= sum(case when K6007='4' then K6008 else 0 end)
			into #������½�������_A
			from k60
			where left(A0101,4)=2020 and a0102 like '4206%' and a3219<>'1' and isnull(K6008,0)<>0 --����ȫ��Ϊ0,�򲻼���
			group by a0102,k0101
----����׵���������
if object_id('tempdb..#����׵���������_A') is not null	drop table #����׵���������_A
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
                  min(k6003) k6003,
                  max(k6070) k6070,
                  max(k6002) k6002,
                  min(k6064) k6064,
			[Σ������]	= sum(case when left(K6028,1) in('4','5') then 1 else 0 end),
			[Σ������]	= sum(case when left(K6028,1) in('4','5') then K6008 else 0 end),
			[��������������]	= sum(case when K6004='1' then 1 else 0 end),
			[��������������]	= sum(case when K6004='1' then K6008 else 0 end),
			[����������������]= sum(case when K6004='2' then 1 else 0 end),
			[����������������]= sum(case when K6004='2' then K6008 else 0 end),
			[��ʱ����������]	= sum(case when K6004='3' then 1 else 0 end),
			[��ʱ����������]	= sum(case when K6004='3' then K6008 else 0 end),
			[��ͨʽ����������]= sum(case when K6062='1' then 1 else 0 end),
			[��ͨʽ����������]= sum(case when K6062='1' then K6008 else 0 end),
			[�ѵ�]	= isnull(sum(A0521),0),
			[�ش�������]	= sum(case when K6007='1' then 1 else 0 end),
			[�ش�������]	= sum(case when K6007='1' then K6008 else 0 end),
			[��������]	= sum(case when K6007='2' then 1 else 0 end),
			[��������]	= sum(case when K6007='2' then K6008 else 0 end),
			[��������]	= sum(case when K6007='3' then 1 else 0 end),
			[��������]	= sum(case when K6007='3' then K6008 else 0 end),
			[С������]	= sum(case when K6007='4' then 1 else 0 end),
			[С������]	= sum(case when K6007='4' then K6008 else 0 end)
			into #����׵���������_A
			from L60
			where left(A0101,4)='2020'-1 and a0102 like '4206%' and isnull(K6008,0)<>0 --����ȫ��Ϊ0,�򲻼���
			group by a0102,k0101
----#����Ľ�����_A'
if object_id('tempdb..#����Ľ�����_A') is not null	drop table #����Ľ�����_A
			select
			A.A0102,
			A.K0101,
                  A.HA0203,
                  A.K0112,
                  n.k6003,
                  n.k6070,
                  n.k6002,
                  n.k6064,
                  n.k0116,
			[Σ������]	=ISNULL(N.[Σ������],0)			-ISNULL(O.[Σ������],0),
			[Σ������]	=ISNULL(N.[Σ������],0)			-ISNULL(O.[Σ������],0),
			[��������������]	=ISNULL(N.[��������������],0)	-ISNULL(O.[��������������],0),
			[��������������]	=ISNULL(N.[��������������],0)	-ISNULL(O.[��������������],0),
			[����������������]=ISNULL(N.[����������������],0)	-ISNULL(O.[����������������],0),
			[����������������]=ISNULL(N.[����������������],0)	-ISNULL(O.[����������������],0),
			[��ʱ����������]	=ISNULL(N.[��ʱ����������],0)	-ISNULL(O.[��ʱ����������],0),
			[��ʱ����������]	=ISNULL(N.[��ʱ����������],0)	-ISNULL(O.[��ʱ����������],0),
			[��ͨʽ����������]=ISNULL(N.[��ͨʽ����������],0)	-ISNULL(O.[��ͨʽ����������],0),
			[��ͨʽ����������]=ISNULL(N.[��ͨʽ����������],0)	-ISNULL(O.[��ͨʽ����������],0),
			[�ѵ�]	=ISNULL(N.[�ѵ�],0)			-ISNULL(O.[�ѵ�],0),
			[�ش�������]	=ISNULL(N.[�ش�������],0)			-ISNULL(O.[�ش�������],0),
			[�ش�������]	=ISNULL(N.[�ش�������],0)			-ISNULL(O.[�ش�������],0),
			[��������]	=ISNULL(N.[��������],0)			-ISNULL(O.[��������],0),
			[��������]	=ISNULL(N.[��������],0)			-ISNULL(O.[��������],0),
			[��������]	=ISNULL(N.[��������],0)			-ISNULL(O.[��������],0),
			[��������]	=ISNULL(N.[��������],0)			-ISNULL(O.[��������],0),
			[С������]	=ISNULL(N.[С������],0)			-ISNULL(O.[С������],0),
			[С������]	=ISNULL(N.[С������],0)			-ISNULL(O.[С������],0)
			into #����Ľ�����_A
			from A50 A
				left join #������½�������_A N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #����׵���������_A O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
			where A.a0102 like '4206%'

insert #linshi_A (a0102,HA0203,K0101,K6003,k6002,K6064,A0503,A0504,A0505,A0506,A0507,A0508,A0509,A0510,a0519,a0520,A0521,a0511,a0512,
                a0513,a0514,a0515,a0516,a0517,a0518,k0116)
select A0102,HA0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(cast(k6003 as char(10)))+' '+rtrim(isnull(k6070,'')),rtrim(k6002),K6064,
Σ������,Σ������,��������������,��������������,����������������,����������������,��ʱ����������,
       ��ʱ����������,��ͨʽ����������,��ͨʽ����������,�ѵ�,�ش�������,�ش�������,��������,��������,��������,��������,
       С������,С������,rtrim(k0116) from #����Ľ�����_A
--�ɿ�
------------------#������½��ɿ���_A
			if object_id('tempdb..#������½��ɿ���_A') is not null	drop table #������½��ɿ���_A
			select 
			A0102,
			K0101,
                  min(a0204) a0204,
                  max(k6502) k6502,
			[�����ɿ���]	=sum(case when K6504='1' then 1 else 0 end),
			[�ɿ���]			=count(K6501)
			into #������½��ɿ���_A
			from k65
			where a0102 like '4206%' and left(A0101,4)='2020' and a3219<>'1' and isnull(K6523,0)<>0 --20011217�޸� �ɿڿ��Ϊ0,�򲻼���			   
			group by a0102,k0101
----#����׵���ɿ���_A
if object_id('tempdb..#����׵���ɿ���_A') is not null	drop table #����׵���ɿ���_A
			select 
			A0102,
			K0101,
                  min(a0204) a0204,
                  max(k6502) k6502,
			[�����ɿ���]	=sum(case when K6504='1' then 1 else 0 end),
			[�ɿ���]			=count(K6501)
			into #����׵���ɿ���_A
			from L65
			where a0102 like '4206%' and left(A0101,4)='2020'-1 and isnull(K6523,0)<>0 --20011217�޸� �ɿڿ��Ϊ0,�򲻼���
			group by a0102,k0101
---#����Ľ��ɿ�_A
if object_id('tempdb..#����Ľ��ɿ�_A') is not null	drop table #����Ľ��ɿ�_A
			select
			A.A0102,
			A.K0101,
                  A.HA0203,
                  n.a0204,
                  n.k6502,
                  A.k0112,
			[�����ɿ���]	=ISNULL(N.[�����ɿ���],0)	-ISNULL(O.[�����ɿ���],0),
			[�ɿ���]			=ISNULL(N.[�ɿ���],0)-ISNULL(O.[�ɿ���],0)
			into #����Ľ��ɿ�_A
			from A50 A
				left join #������½��ɿ���_A N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #����׵���ɿ���_A O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
			where A.a0102 like '4206%'

insert #linshi_A(a0102,HA0203,K0101,k6003,K6002,A0701,A0702) 
select A0102,HA0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(a0204),rtrim(k6502),�ɿ���,�����ɿ��� from #����Ľ��ɿ�_A
---���
---#������½������_A
			if object_id('tempdb..#������½������_A') is not null	drop table #������½������_A
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
                  min(k6303) k6303,
                  max(k6302) k6302,
                  max(k0116) k0116,
			[�س������]	=sum(case when K6304='1' then 1 else 0 end),
			[�س��������]	=sum(case when K6304='1' then K6305 else 0 end),
			[�������]	=sum(case when K6304='2' then 1 else 0 end),
			[��������� ]	=sum(case when K6304='2' then K6305 else 0 end),
			[�������]	=sum(case when K6304='3' then 1 else 0 end),
			[���������]	=sum(case when K6304='3' then K6305 else 0 end),
			[�������]	=sum(case when K6304='4' then 1 else 0 end),
			[���������]	=sum(case when K6304='4' then K6305 else 0 end)
			into #������½������_A
			from k63
			where a0102 like '4206%' and left(A0101,4)='2020' and a3219<>'1' and isnull(K6305,0)<>0 --20011217�޸� �������Ϊ0,�򲻼���
			group by a0102,k0101
			
---#����׵��������_A
			if object_id('tempdb..#����׵��������_A') is not null	drop table #����׵��������_A
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
                  min(k6303) k6303,
                  max(k6302) k6302,
			[�س������]	=sum(case when K6304='1' then 1 else 0 end),
			[�س��������]	=sum(case when K6304='1' then K6305 else 0 end),
			[�������]	=sum(case when K6304='2' then 1 else 0 end),
			[��������� ]	=sum(case when K6304='2' then K6305 else 0 end),
			[�������]	=sum(case when K6304='3' then 1 else 0 end),
			[���������]	=sum(case when K6304='3' then K6305 else 0 end),
			[�������]	=sum(case when K6304='4' then 1 else 0 end),
			[���������]	=sum(case when K6304='4' then K6305 else 0 end)
			into #����׵��������_A
			from L63
			where a0102 like '4206%' and left(A0101,4)='2020'-1 and isnull(K6305,0)<>0 --20011217�޸� �������Ϊ0,�򲻼���
			group by a0102,k0101
			
--����Ľ����
			if object_id('tempdb..#����Ľ����_A') is not null	drop table #����Ľ����_A
			select
			A.A0102,
			A.K0101, 
                  A.ha0203,
                  n.k6303,
                  n.k6302,
                  a.k0112,
                  n.k0116,
			[�س������]	=ISNULL(N.[�س������],0)	-ISNULL(O.[�س������],0),
			[�س��������]	=ISNULL(N.[�س��������],0)-ISNULL(O.[�س��������],0),
			[�������]	=ISNULL(N.[�������],0)	-ISNULL(O.[�������],0),
			[��������� ]	=ISNULL(N.[���������],0)	-ISNULL(O.[���������],0),
			[�������]	=ISNULL(N.[�������],0)	-ISNULL(O.[�������],0),
			[���������]	=ISNULL(N.[���������],0)	-ISNULL(O.[���������],0),
			[�������]	=ISNULL(N.[�������],0)	-ISNULL(O.[�������],0),
			[���������]	=ISNULL(N.[���������],0)	-ISNULL(O.[���������],0)
			into #����Ľ����_A
			from A50 A
				left join #������½������_A N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #����׵��������_A O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
			where A.a0102 like '4206%'

insert #linshi_A(a0102,HA0203,K0101,k6003,K6002,a0605,a0606,a0607,a0608,a0609,a0610,a0611,a0612,k0116)
select  a0102,ha0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(k6303),rtrim(k6302),�س������,�س��������,�������,���������,�������,���������,�������,���������,
rtrim(k0116)
from #����Ľ����_A
---��ˮ���̡�����
----#������½����_A
if object_id('tempdb..#������½����_A') is not null	drop table #������½����_A
			select
			A0102,
			K0101,
                  min(k0108) k0108,
                  max(k0108) k0109,
                  max(a0535) a0535,
                  max(k0116) k0116,
			[��ˮ����]			= isnull(sum(A0534),0),
			[����]			= isnull(sum(A0522),0)
			into #������½����_A
			from K01
			where 	(K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' 
				and a0102 like '4206%' and left(A0101,4)='2020' and a3219<>'1'
				and left(k0101,1) in ('G','S','X','Y','Z','c')						 
			group by A0102,K0101
----#���굽�����_A
if object_id('tempdb..#���굽�����_A') is not null	drop table #���굽�����_A
			select
			A0102,
			K0101,
                  min(k0108) k0108,
                  max(k0108) k0109,
                  max(a0535) a0535,
			[��ˮ����]			= isnull(sum(A0534),0),
			[����]			= isnull(sum(A0522),0)
			into #���굽�����_A
			from L01
			where 	(K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' 
				and a0102 like '4206%' and left(A0101,4)='2020'-1	
				and left(k0101,1) in ('G','S','X','Y','Z','c')			 
			group by A0102,K0101
----#����Ľ����_A
if object_id('tempdb..#����Ľ����_A') is not null	drop table #����Ľ����_A
			select
			A.A0102,
			A.K0101,
                  A.ha0203,
                  n.k0108,
                  n.k0109,
                  n.a0535,
                  a.k0112,
                  n.k0116,
			[��ˮ����]	=ISNULL(N.[��ˮ����],0)-ISNULL(O.[��ˮ����],0),
			[����]	=ISNULL(N.[����],0)	-ISNULL(O.[����],0)
			into #����Ľ����_A
			from A50 A
				left join #������½����_A N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #���굽�����_A   O on (A.A0102=O.A0102 AND A.K0101=O.K0101)
			where A.a0102 like '4206%'

insert  #linshi_A(a0102,ha0203,k0101,k6003,k6002,A0534,a0522,k0116)
select a0102,ha0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(cast (k0108 as char(10)))+'-'+rtrim(cast (k0109 as char(10))),
rtrim((a0535)),��ˮ����,����,rtrim(k0116) from  #����Ľ����_A

                


---SELECT '��'
if object_id('tempdb..#linshi_B') is not null
drop table #linshi_B
create table #linshi_B
(	a0102 varchar(15),ha0102 varchar(100),
	bh char(2),
	HA0203 char(12),
	K0101 varchar(100),
      k0108 numeric(15,4),
      k6001 varchar(100),
	K6003 varchar(100),
	K6002 varchar(100),
	A0503 numeric(15,4),
	A0504 numeric(15,4),
	K6064 varchar(300),
	A0505 numeric(15,4),
	A0506 numeric(15,4),
	A0507 numeric(15,4),
	A0508 numeric(15,4),
	A0509 numeric(15,4),
	A0510 numeric(15,4),
	a0519 numeric(15,4),
	A0520 numeric(15,4),
	A0521 numeric(15,4),
	a0511 numeric(15,4),
	a0512 numeric(15,4),
	a0513 numeric(15,4),
	a0514 numeric(15,4),
	a0515 numeric(15,4),
	a0516 numeric(15,4),
	a0517 numeric(15,4),
	a0518 numeric(15,4),
	a0522 numeric(15,4),
	A0701 numeric(15,4),
	A0702 numeric(15,4),
	A0534 numeric(15,4),
	a0605 numeric(15,4),
	a0606 numeric(15,4),
	a0607 numeric(15,4),
	a0608 numeric(15,4),
	a0609 numeric(15,4),
	a0610 numeric(15,4),
	a0611 numeric(15,4),
	a0612 numeric(15,4),
    	col31 numeric(15,4),
      col32 numeric(15,4),
	K0116 char(8)
)

------------������½�������
if object_id('tempdb..#������½�������_B') is not null	drop table #������½�������_B
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
			K6001,
                  min(k6003) k6003,
                  max(k6070) k6070,
                  max(k6002) k6002,
                  min(k6064) k6064,
                  max(k0116) k0116,
			[Σ������]			= sum(case when left(K6028,1) in('4','5') then 1 else 0 end),
			[Σ������]			= sum(case when left(K6028,1) in('4','5') then K6008 else 0 end),
			[��������������]			= sum(case when K6004='1' then 1 else 0 end),
			[��������������]			= sum(case when K6004='1' then K6008 else 0 end),
			[����������������]   	= sum(case when K6004='2' then 1 else 0 end),
			[����������������]   	= sum(case when K6004='2' then K6008 else 0 end),
			[��ʱ����������]			= sum(case when K6004='3' then 1 else 0 end),
			[��ʱ����������]			= sum(case when K6004='3' then K6008 else 0 end),
			[��ͨʽ����������]	= sum(case when K6062='1' then 1 else 0 end),
			[��ͨʽ����������]	= sum(case when K6062='1' then K6008 else 0 end),
			[�ѵ�]			= isnull(sum(A0521),0),
			[�ش�������]			= sum(case when K6007='1' then 1 else 0 end),
			[�ش�������]			= sum(case when K6007='1' then K6008 else 0 end),
			[��������]			= sum(case when K6007='2' then 1 else 0 end),
			[��������]			= sum(case when K6007='2' then K6008 else 0 end),
			[��������]			= sum(case when K6007='3' then 1 else 0 end),
			[��������]			= sum(case when K6007='3' then K6008 else 0 end),
			[С������]			= sum(case when K6007='4' then 1 else 0 end),
			[С������]			= sum(case when K6007='4' then K6008 else 0 end)
			into #������½�������_B
			from k60
			where a0102 like '4206%' and left(A0101,4)='2020' and a3219<>'1' and isnull(K6008,0)<>0 --����ȫ��Ϊ0,�򲻼���
			group by a0102,k0101,k6001
----����׵���������
if object_id('tempdb..#����׵���������_B') is not null	drop table #����׵���������_B
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
			K6001,
                  min(k6003) k6003,
                  max(k6070) k6070,
                  max(k6002) k6002,
                  min(k6064) k6064,
			[Σ������]	= sum(case when left(K6028,1) in('4','5') then 1 else 0 end),
			[Σ������]	= sum(case when left(K6028,1) in('4','5') then K6008 else 0 end),
			[��������������]	= sum(case when K6004='1' then 1 else 0 end),
			[��������������]	= sum(case when K6004='1' then K6008 else 0 end),
			[����������������]= sum(case when K6004='2' then 1 else 0 end),
			[����������������]= sum(case when K6004='2' then K6008 else 0 end),
			[��ʱ����������]	= sum(case when K6004='3' then 1 else 0 end),
			[��ʱ����������]	= sum(case when K6004='3' then K6008 else 0 end),
			[��ͨʽ����������]= sum(case when K6062='1' then 1 else 0 end),
			[��ͨʽ����������]= sum(case when K6062='1' then K6008 else 0 end),
			[�ѵ�]	= isnull(sum(A0521),0),
			[�ش�������]	= sum(case when K6007='1' then 1 else 0 end),
			[�ش�������]	= sum(case when K6007='1' then K6008 else 0 end),
			[��������]	= sum(case when K6007='2' then 1 else 0 end),
			[��������]	= sum(case when K6007='2' then K6008 else 0 end),
			[��������]	= sum(case when K6007='3' then 1 else 0 end),
			[��������]	= sum(case when K6007='3' then K6008 else 0 end),
			[С������]	= sum(case when K6007='4' then 1 else 0 end),
			[С������]	= sum(case when K6007='4' then K6008 else 0 end)
			into #����׵���������_B
			from L60
			where a0102 like '4206%' and left(A0101,4)='2020'-1 and isnull(K6008,0)<>0 --����ȫ��Ϊ0,�򲻼���
			group by a0102,k0101,k6001
----#����Ľ�����_B'
if object_id('tempdb..#����Ľ�����_B') is not null	drop table #����Ľ�����_B
			select
			case when a.a0102 is not null then a.a0102 else case when n.a0102 is not null then n.a0102 else o.a0102 end end a0102,
			case when A.K0101 is not null then a.k0101 else case when n.k0101 is not null then n.k0101 else o.k0101 end end k0101,
                  -----case when A.HA0203 is not null then a.ha0203 else case when n.ha0203 not null then n.ha0203 else o.ha0203 end end ha0203,
                  a.ha0203,
                  A.K0112,
                  isnull(N.K6001,o.k6001) k6001,
                  isnull(n.k6003,o.k6003) k6003,
                  n.k6070,
                  n.k6002,
                  n.k6064,
                  n.k0116,
			[Σ������]	=ISNULL(N.[Σ������],0)			-ISNULL(O.[Σ������],0),
			[Σ������]	=ISNULL(N.[Σ������],0)			-ISNULL(O.[Σ������],0),
			[��������������]	=ISNULL(N.[��������������],0)	-ISNULL(O.[��������������],0),
			[��������������]	=ISNULL(N.[��������������],0)	-ISNULL(O.[��������������],0),
			[����������������]=ISNULL(N.[����������������],0)	-ISNULL(O.[����������������],0),
			[����������������]=ISNULL(N.[����������������],0)	-ISNULL(O.[����������������],0),
			[��ʱ����������]	=ISNULL(N.[��ʱ����������],0)	-ISNULL(O.[��ʱ����������],0),
			[��ʱ����������]	=ISNULL(N.[��ʱ����������],0)	-ISNULL(O.[��ʱ����������],0),
			[��ͨʽ����������]=ISNULL(N.[��ͨʽ����������],0)	-ISNULL(O.[��ͨʽ����������],0),
			[��ͨʽ����������]=ISNULL(N.[��ͨʽ����������],0)	-ISNULL(O.[��ͨʽ����������],0),
			[�ѵ�]	=ISNULL(N.[�ѵ�],0)			-ISNULL(O.[�ѵ�],0),
			[�ش�������]	=ISNULL(N.[�ش�������],0)			-ISNULL(O.[�ش�������],0),
			[�ش�������]	=ISNULL(N.[�ش�������],0)			-ISNULL(O.[�ش�������],0),
			[��������]	=ISNULL(N.[��������],0)			-ISNULL(O.[��������],0),
			[��������]	=ISNULL(N.[��������],0)			-ISNULL(O.[��������],0),
			[��������]	=ISNULL(N.[��������],0)			-ISNULL(O.[��������],0),
			[��������]	=ISNULL(N.[��������],0)			-ISNULL(O.[��������],0),
			[С������]	=ISNULL(N.[С������],0)			-ISNULL(O.[С������],0),
			[С������]	=ISNULL(N.[С������],0)			-ISNULL(O.[С������],0)
			into #����Ľ�����_B
			from A50 A
				full join #������½�������_B N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				full join #����׵���������_B O  on (A.A0102=O.A0102 AND A.K0101=O.K0101 and n.k6001=o.k6001)
			where A.a0102 like '4206%'

insert #linshi_B (a0102,HA0203,K0101,K6003,k6002,K6064,A0503,A0504,A0505,A0506,A0507,A0508,A0509,A0510,a0519,a0520,A0521,a0511,a0512,
                a0513,a0514,a0515,a0516,a0517,a0518,k0116,K6001)
select A0102,HA0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(cast(k6003 as char(10)))+' '+rtrim(isnull(k6070,'')),rtrim(k6002),K6064,
Σ������,Σ������,��������������,��������������,����������������,����������������,��ʱ����������,
       ��ʱ����������,��ͨʽ����������,��ͨʽ����������,�ѵ�,�ش�������,�ش�������,��������,��������,��������,��������,
       С������,С������,rtrim(k0116),K6001 from #����Ľ�����_B
----����
update #linshi_B set k0101=case when left(k6001,1) in ('G','H') then left(k6001,len(rtrim(k6001))-11) else
                       case when left(k6001,1) in ('S','T') then left(k6001,len(rtrim(k6001))-11) else
                       case when left(k6001,1)='x' then left(k6001,8)+'00' else
                       case when left(k6001,1) in('y','c') then left(k6001,10) end end end end 
where ha0203 is not null
update #linshi_A set ha0203=case when left(k0101,1) in ('G','H') then case when len(rtrim(K0101))>9 then 'һ�����' else '���Ҹ��ٹ�·' end else 
					case when left(k0101,1) in ('S','T') then 'ʡ��' else
					case when left(k0101,1) = 'X' then '�ص�' else
			        case when left(k0101,1) = 'y' then '���' else 
					case when left(k0101,2) = 'ZY' then 'ר�ù�·' else
                    case when left(k0101,1) = 'Z' then'ר�õ�' else '���' end end end end end end
where ha0203 is not null
--�ɿ�
------------------#������½��ɿ���_B
			if object_id('tempdb..#������½��ɿ���_B') is not null	drop table #������½��ɿ���_B
			select 
			A0102,
			K0101,
                  min(a0204) a0204,
                  max(k6502) k6502,
			[�����ɿ���]	=sum(case when K6504='1' then 1 else 0 end),
			[�ɿ���]			=count(K6501)
			into #������½��ɿ���_B
			from k65
			where a0102 like '4206%' and left(A0101,4)='2020' and a3219<>'1' and isnull(K6523,0)<>0 --20011217�޸� �ɿڿ��Ϊ0,�򲻼���			   
			group by a0102,k0101
----#����׵���ɿ���_B
if object_id('tempdb..#����׵���ɿ���_B') is not null	drop table #����׵���ɿ���_B
			select 
			A0102,
			K0101,
                  min(a0204) a0204,
                  max(k6502) k6502,
			[�����ɿ���]	=sum(case when K6504='1' then 1 else 0 end),
			[�ɿ���]			=count(K6501)
			into #����׵���ɿ���_B
			from L65
			where a0102 like '4206%' and left(A0101,4)='2020'-1 and isnull(K6523,0)<>0 --20011217�޸� �ɿڿ��Ϊ0,�򲻼���
			group by a0102,k0101
---#����Ľ��ɿ�_B
if object_id('tempdb..#����Ľ��ɿ�_B') is not null	drop table #����Ľ��ɿ�_B
			select
			A.A0102,
			A.K0101,
                  A.HA0203,
                  n.a0204,
                  n.k6502,
                  A.k0112,
			[�����ɿ���]	=ISNULL(N.[�����ɿ���],0)	-ISNULL(O.[�����ɿ���],0),
			[�ɿ���]			=ISNULL(N.[�ɿ���],0)-ISNULL(O.[�ɿ���],0)
			into #����Ľ��ɿ�_B
			from A50 A
				left join #������½��ɿ���_B N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #����׵���ɿ���_B O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
			where A.a0102 like '4206%'

insert #linshi_B(a0102,HA0203,K0101,k6003,K6002,A0701,A0702) 
select A0102,HA0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(a0204),rtrim(k6502),�ɿ���,�����ɿ��� from #����Ľ��ɿ�_B
---���
---#������½������_B
			if object_id('tempdb..#������½������_B') is not null	drop table #������½������_B
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
                  min(k6303) k6303,
                  max(k6302) k6302,
                  max(k0116) k0116,
			[�س������]	=sum(case when K6304='1' then 1 else 0 end),
			[�س��������]	=sum(case when K6304='1' then K6305 else 0 end),
			[�������]	=sum(case when K6304='2' then 1 else 0 end),
			[��������� ]	=sum(case when K6304='2' then K6305 else 0 end),
			[�������]	=sum(case when K6304='3' then 1 else 0 end),
			[���������]	=sum(case when K6304='3' then K6305 else 0 end),
			[�������]	=sum(case when K6304='4' then 1 else 0 end),
			[���������]	=sum(case when K6304='4' then K6305 else 0 end)
			into #������½������_B
			from k63
			where a0102 like '4206%' and left(A0101,4)='2020' and a3219<>'1' and isnull(K6305,0)<>0 --20011217�޸� �������Ϊ0,�򲻼���
			group by a0102,k0101
			
---#����׵��������_B
			if object_id('tempdb..#����׵��������_B') is not null	drop table #����׵��������_B
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
                  min(k6303) k6303,
                  max(k6302) k6302,
			[�س������]	=sum(case when K6304='1' then 1 else 0 end),
			[�س��������]	=sum(case when K6304='1' then K6305 else 0 end),
			[�������]	=sum(case when K6304='2' then 1 else 0 end),
			[��������� ]	=sum(case when K6304='2' then K6305 else 0 end),
			[�������]	=sum(case when K6304='3' then 1 else 0 end),
			[���������]	=sum(case when K6304='3' then K6305 else 0 end),
			[�������]	=sum(case when K6304='4' then 1 else 0 end),
			[���������]	=sum(case when K6304='4' then K6305 else 0 end)
			into #����׵��������_B
			from L63
			where a0102 like '4206%' and left(A0101,4)='2020'-1 and isnull(K6305,0)<>0 --20011217�޸� �������Ϊ0,�򲻼���
			group by a0102,k0101
			
--����Ľ����
			if object_id('tempdb..#����Ľ����_B') is not null	drop table #����Ľ����_B
			select
			A.A0102,
			A.K0101, 
                  A.ha0203,
                  n.k6303,
                  n.k6302,
                  a.k0112,
                  n.k0116,
			[�س������]	=ISNULL(N.[�س������],0)	-ISNULL(O.[�س������],0),
			[�س��������]	=ISNULL(N.[�س��������],0)-ISNULL(O.[�س��������],0),
			[�������]	=ISNULL(N.[�������],0)	-ISNULL(O.[�������],0),
			[��������� ]	=ISNULL(N.[���������],0)	-ISNULL(O.[���������],0),
			[�������]	=ISNULL(N.[�������],0)	-ISNULL(O.[�������],0),
			[���������]	=ISNULL(N.[���������],0)	-ISNULL(O.[���������],0),
			[�������]	=ISNULL(N.[�������],0)	-ISNULL(O.[�������],0),
			[���������]	=ISNULL(N.[���������],0)	-ISNULL(O.[���������],0)
			into #����Ľ����_B
			from A50 A
				left join #������½������_B N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #����׵��������_B O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
			where A.a0102 like '4206%'

insert #linshi_B(a0102,HA0203,K0101,k6003,K6002,a0605,a0606,a0607,a0608,a0609,a0610,a0611,a0612,k0116)
select  a0102,ha0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(k6303),rtrim(k6302),�س������,�س��������,�������,���������,�������,���������,�������,���������,
rtrim(k0116)
from #����Ľ����_B
---��ˮ���̡�����
----#������½����_B
if object_id('tempdb..#������½����_B') is not null	drop table #������½����_B
			select
			A0102,
			K0101,
                  min(k0108) k0108,
                  max(k0108) k0109,
                  max(a0535) a0535,
                  max(k0116) k0116,
			[��ˮ����]			= isnull(sum(A0534),0),
			[����]			= isnull(sum(A0522),0)
			into #������½����_B
			from K01
			where 	(K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' 
				and a0102 like '4206%' and left(A0101,4)='2020' and a3219<>'1'
				and left(k0101,1) in ('G','S','X','Y','Z','c')						 
			group by A0102,K0101,k0108
----#���굽�����_B
if object_id('tempdb..#���굽�����_B') is not null	drop table #���굽�����_B
			select
			A0102,
			K0101,
                  min(k0108) k0108,
                  max(k0108) k0109,
                  max(a0535) a0535,
			[��ˮ����]			= isnull(sum(A0534),0),
			[����]			= isnull(sum(A0522),0)
			into #���굽�����_B
			from L01
			where 	(K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' 
				and a0102 like '4206%' and left(A0101,4)='2020'-1	
				and left(k0101,1) in ('G','S','X','Y','Z','c')			 
			group by A0102,K0101,k0108
----#����Ľ����_B

if object_id('tempdb..#����Ľ����_B') is not null	drop table #����Ľ����_B
			select
			case when a.a0102 is not null then a.a0102 else case when n.a0102 is not null then n.a0102 else o.a0102 end end a0102,
			case when A.K0101 is not null then a.k0101 else case when n.k0101 is not null then n.k0101 else o.k0101 end end k0101,
                  A.ha0203,
                  isnull(n.k0108,o.k0108) k0108,
                  n.k0109,
                  n.a0535,
                  a.k0112,
                  n.k0116,
			[��ˮ����]	=ISNULL(N.[��ˮ����],0)-ISNULL(O.[��ˮ����],0),
			[����]	=ISNULL(N.[����],0)	-ISNULL(O.[����],0)
			into #����Ľ����_B
			from A50 A
				full join #������½����_B N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				full join #���굽�����_B   O on (A.A0102=O.A0102 AND A.K0101=O.K0101 and n.k0108=o.k0108)
			where A.a0102 like '4206%'

insert  #linshi_B(a0102,ha0203,k0101,k6003,k6002,A0534,a0522,k0116,k0108)
select a0102,ha0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(cast (k0108 as char(10)))+'-'+rtrim(cast (k0109 as char(10))),
rtrim((a0535)),��ˮ����,����,rtrim(k0116),k0108 from  #����Ľ����_A
------����
update #linshi_B set ha0203=case when left(k0101,1) in ('G','H') then case when len(RTRIM(K0101))>9  then 'һ�����' else '���Ҹ��ٹ�·' end else 
					case when left(k0101,1) in ('s','T') then 'ʡ��' else
					      case when left(k0101,1) = 'X' then '�ص�' else
						  case when left(k0101,1) = 'y' then '���' else
						  case when left(k0101,1) = 'zy' then 'ר�ù�·' else
                          case when left(k0101,1) = 'Z' then 'ר�õ�'  else 
						  '���' end end end end end end
update #linshi_B set k0108=99999.999 where k0108 is null
update #linshi_B set k6001=99999.999 where k6001 is null
update #linshi_B set k6003=99999.999 where k6003 is null
                


SELECT ''
-----------------------------------------------------------------------------

/*����ʾ��*/
----------------------
select
	case when grouping(OBJNAME)=1 then '��  ��' else max(rtrim(objjc)) end,
	null,
	null,
	null,
	null,
	null,
	sum(isnull(a0505,0))+sum(isnull(a0507,0))+sum(isnull(a0509,0)),
	sum(isnull(a0506,0))+sum(isnull(a0508,0))+sum(isnull(a0510,0)),
	null,
	sum(a0519),
	sum(a0520),
	sum(a0521),
	sum(a0505),
	sum(a0506),
	sum(a0507),
	sum(a0508),
	sum(a0509),
	sum(a0510),
	sum(a0511),
	sum(a0512),
	sum(a0513),
	sum(a0514),
	sum(a0515),
	sum(a0516),
	sum(a0517),
	sum(a0518),
	sum(a0503),
	sum(a0504),
	sum(a0701),
      sum(a0702),
      sum(isnull(a0605,0))+sum(isnull(a0607,0))+sum(isnull(a0609,0))+sum(isnull(a0611,0)),
      sum(isnull(a0606,0))+sum(isnull(a0608,0))+sum(isnull(a0610,0))+sum(isnull(a0612,0)),
      sum(a0534),
      sum(a0522),
	null
from #linshi_A,d001
where rtrim(#linshi_A.ha0203)=rtrim(objjc)
group by objname with rollup
having not (sum(isnull(a0519,0))=0 and sum(isnull(a0520,0))=0 and sum(isnull(a0521,0))=0  and sum(isnull(a0505,0))=0 
         and sum(isnull(a0506,0))=0 and sum(isnull(a0507,0))=0 and sum(isnull(a0508,0))=0 and sum(isnull(a0509,0))=0
          and sum(isnull(a0510,0))=0 and sum(isnull(a0511,0))=0 and sum(isnull(a0512,0))=0 and sum(isnull(a0513,0))=0
          and sum(isnull(a0514,0))=0 and sum(isnull(a0515,0))=0 and sum(isnull(a0516,0))=0  and sum(isnull(a0517,0))=0
          and sum(isnull(a0518,0))=0 and sum(isnull(a0503,0))=0 and sum(isnull(a0504,0))=0 and sum(isnull(a0701,0))=0
          and sum(isnull(a0702,0))=0 and sum(isnull(a0605,0))+sum(isnull(a0607,0))+sum(isnull(a0609,0))+sum(isnull(a0611,0))=0
          and sum(isnull(a0606,0))+sum(isnull(a0608,0))+sum(isnull(a0610,0))+sum(isnull(a0612,0))=0 and sum(isnull(a0534,0))=0
          and sum(isnull(a0522,0))=0)

order by replace(objname,'c','zc')

--------------------------------------------------------------------------------

/*����ʾ��*/
select
	case when grouping(a.objname)=1 then null else 
	case when grouping(b.objname+replace(rtrim(c.objname),'C','ZC')+rtrim(#linshi_B.k0101)+rtrim(#linshi_B.k6003)+rtrim(#linshi_B.k6001)+rtrim(#linshi_B.k0108))=1 then  
	replace(max(rtrim(a.objjc)),'����ʡ','') else '    '+replace(max(rtrim(b.objjc)),max(rtrim(a.objjc)),'')
	end end,
      null,
      case when grouping(a.objname)=1 then null else 
	case when grouping(b.objname+replace(rtrim(c.objname),'C','ZC')+rtrim(#linshi_B.k0101)+rtrim(#linshi_B.k6003)+rtrim(#linshi_B.k6001)+rtrim(#linshi_B.k0108))=1 then  
	'' else max(rtrim(ha0203)) end end,
      case when grouping(a.objname)=1 then null else 
	case when grouping(b.objname+replace(rtrim(c.objname),'C','ZC')+rtrim(#linshi_B.k0101)+rtrim(#linshi_B.k6003)+rtrim(#linshi_B.k6001)+rtrim(#linshi_B.k0108))=1 then  
           ''     else max(rtrim(k0101)) end end ,
       case when grouping(a.objname)=1 then null else 
	 case when grouping(b.objname+replace(rtrim(c.objname),'C','ZC')+rtrim(#linshi_B.k0101)+rtrim(#linshi_B.k6003)+rtrim(#linshi_B.k6001)+rtrim(#linshi_B.k0108))=1 then  
             ''   else max(rtrim(K6003)) end end ,
      case when grouping(a.objname)=1 then null else 
	case when grouping(b.objname+replace(rtrim(c.objname),'C','ZC')+rtrim(#linshi_B.k0101)+rtrim(#linshi_B.k6003)+rtrim(#linshi_B.k6001)+rtrim(#linshi_B.k0108))=1 then  
             ''   else max(rtrim(k6002)) end
        end ,
      sum(isnull(a0505,0))+sum(isnull(a0507,0))+sum(isnull(a0509,0)),
	sum(isnull(a0506,0))+sum(isnull(a0508,0))+sum(isnull(a0510,0)),
      case when grouping(a.objname)=1 then null else 
	case when grouping(b.objname+replace(rtrim(c.objname),'C','ZC')+rtrim(#linshi_B.k0101)+rtrim(#linshi_B.k6003)+rtrim(#linshi_B.k6001)+rtrim(#linshi_B.k0108))=1 then  
             ''   else max(rtrim(K6064)) end end ,
      sum(a0519),
	sum(a0520),
	sum(a0521),
	sum(a0505),
	sum(a0506),
	sum(a0507),
	sum(a0508),
	sum(a0509),
	sum(a0510),
	sum(a0511),
	sum(a0512),
	sum(a0513),
	sum(a0514),
	sum(a0515),
	sum(a0516),
	sum(a0517),
	sum(a0518),
	sum(a0503),
	sum(a0504),
	sum(a0701),
      sum(a0702),
      sum(isnull(a0605,0))+sum(isnull(a0607,0))+sum(isnull(a0609,0))+sum(isnull(a0611,0)),
      sum(isnull(a0606,0))+sum(isnull(a0608,0))+sum(isnull(a0610,0))+sum(isnull(a0612,0)),
      sum(a0534),
      sum(a0522),
	case when grouping(a.objname)=1 then null else 
	case when grouping(b.objname+replace(rtrim(c.objname),'C','ZC')+rtrim(#linshi_B.k0101)+rtrim(#linshi_B.k6003)+rtrim(#linshi_B.k6001)+rtrim(#linshi_B.k0108))=1 then  
             ''   else max(rtrim(k0116)) end
        end 
from #linshi_B ,d020 a,d020 b,d001 c
where a.objname=left(#linshi_B.a0102,4) and b.objname=left(#linshi_B.a0102,6) and rtrim(#linshi_B.ha0203)=rtrim(c.objjc)
	 and left(#linshi_B.a0102,4)<>'4290' and left(#linshi_B.a0102,3)<>'42A'

group by a.objname,b.objname+replace(rtrim(c.objname),'C','ZC')+rtrim(#linshi_B.k0101)+rtrim(#linshi_B.k6003)+rtrim(#linshi_B.k6001)+rtrim(#linshi_B.k0108) with rollup
having 	case when grouping(a.objname)=1 then null else 
	case when grouping(b.objname+replace(rtrim(c.objname),'C','ZC')+rtrim(#linshi_B.k0101)+rtrim(#linshi_B.k6003)+rtrim(#linshi_B.k6001)+rtrim(#linshi_B.k0108))=1 then  
	replace(max(rtrim(a.objjc)),'����ʡ','') else '    '+replace(max(rtrim(b.objjc)),max(rtrim(a.objjc)),'')
	end end is not null
and not (sum(isnull(a0519,0))=0 and sum(isnull(a0520,0))=0 and sum(isnull(a0521,0))=0  and sum(isnull(a0505,0))=0 
         and sum(isnull(a0506,0))=0 and sum(isnull(a0507,0))=0 and sum(isnull(a0508,0))=0 and sum(isnull(a0509,0))=0
          and sum(isnull(a0510,0))=0 and sum(isnull(a0511,0))=0 and sum(isnull(a0512,0))=0 and sum(isnull(a0513,0))=0
          and sum(isnull(a0514,0))=0 and sum(isnull(a0515,0))=0 and sum(isnull(a0516,0))=0  and sum(isnull(a0517,0))=0
          and sum(isnull(a0518,0))=0 and sum(isnull(a0503,0))=0 and sum(isnull(a0504,0))=0 and sum(isnull(a0701,0))=0
          and sum(isnull(a0702,0))=0 and sum(isnull(a0605,0))+sum(isnull(a0607,0))+sum(isnull(a0609,0))+sum(isnull(a0611,0))=0
          and sum(isnull(a0606,0))+sum(isnull(a0608,0))+sum(isnull(a0610,0))+sum(isnull(a0612,0))=0 and sum(isnull(a0534,0))=0
          and sum(isnull(a0522,0))=0)
order by a.objname,b.objname+replace(rtrim(c.objname),'C','ZC')+rtrim(#linshi_B.k0101)+rtrim(#linshi_B.k6003)+rtrim(#linshi_B.k6001)+rtrim(#linshi_B.k0108)


------------------------------------------------------------------------------------------------------------

/*����ʾ��*/
select
	case when grouping(left(a0102,6))=1 then null else
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then replace(max(rtrim(d020.objjc)),'����ʡ' ,'') else ''
      end end,
	null,
	case when grouping(left(a0102,6))=1 then '' else 
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then '' else max(rtrim(ha0203))
		end
	end,
	case when grouping(left(a0102,6))=1 then '' else 
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then '' else max(rtrim(k0101))
		end
	end,
	case when grouping(left(a0102,6))=1 then '' else 
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then '' else max(rtrim(k6003))
		end
	end,
	case when grouping(left(a0102,6))=1 then '' else 
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then '' else max(rtrim(k6002))
		end
	end,
      sum(isnull(a0505,0))+sum(isnull(a0507,0))+sum(isnull(a0509,0)),
	sum(isnull(a0506,0))+sum(isnull(a0508,0))+sum(isnull(a0510,0)),
      case when grouping(left(a0102,6))=1 then '' else 
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then '' else max(rtrim(K6064))
		end
      end,
      sum(a0519),
	sum(a0520),
	sum(a0521),
	sum(a0505),
	sum(a0506),
	sum(a0507),
	sum(a0508),
	sum(a0509),
	sum(a0510),
	sum(a0511),
	sum(a0512),
	sum(a0513),
	sum(a0514),
	sum(a0515),
	sum(a0516),
	sum(a0517),
	sum(a0518),
	sum(a0503),
	sum(a0504),
	sum(a0701),
      sum(a0702),
      sum(isnull(a0605,0))+sum(isnull(a0607,0))+sum(isnull(a0609,0))+sum(isnull(a0611,0)),
      sum(isnull(a0606,0))+sum(isnull(a0608,0))+sum(isnull(a0610,0))+sum(isnull(a0612,0)),
      sum(a0534),
      sum(a0522),
	case when grouping(left(a0102,6))=1 then '' else 
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then '' else max(rtrim(k0116))
		end
	end

from #linshi_B ,d028 ,d020,d001 c
where (d028.objname like  left(a0102,6)) and (d020.objname like  left(a0102,6)) and substring(a0102,3,1)='9' and rtrim(ha0203)=rtrim(c.objjc)
group by left(a0102,6),left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003) with rollup	
having 	case when grouping(left(a0102,6))=1 then null else
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then replace(max(rtrim(d020.objjc)),'����ʡ' ,'') else ''
      end end is not null
and not (sum(isnull(a0519,0))=0 and sum(isnull(a0520,0))=0 and sum(isnull(a0521,0))=0  and sum(isnull(a0505,0))=0 
         and sum(isnull(a0506,0))=0 and sum(isnull(a0507,0))=0 and sum(isnull(a0508,0))=0 and sum(isnull(a0509,0))=0
          and sum(isnull(a0510,0))=0 and sum(isnull(a0511,0))=0 and sum(isnull(a0512,0))=0 and sum(isnull(a0513,0))=0
          and sum(isnull(a0514,0))=0 and sum(isnull(a0515,0))=0 and sum(isnull(a0516,0))=0  and sum(isnull(a0517,0))=0
          and sum(isnull(a0518,0))=0 and sum(isnull(a0503,0))=0 and sum(isnull(a0504,0))=0 and sum(isnull(a0701,0))=0
          and sum(isnull(a0702,0))=0 and sum(isnull(a0605,0))+sum(isnull(a0607,0))+sum(isnull(a0609,0))+sum(isnull(a0611,0))=0
          and sum(isnull(a0606,0))+sum(isnull(a0608,0))+sum(isnull(a0610,0))+sum(isnull(a0612,0))=0 and sum(isnull(a0534,0))=0
          and sum(isnull(a0522,0))=0)
order by left(a0102,6),left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003)

-------------------------------------------------------------------------
/*����ʾ��*/
select
	case when grouping(left(a0102,5))=1 then null else
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then  replace(max(left(rtrim(d028.objjc),6)),'����ʡ','') else '' 
      end end,
	null,
	case when grouping(left(a0102,5))=1 then '' else 
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then '' else max(rtrim(ha0203))
		end
	end,
	case when grouping(left(a0102,5))=1 then '' else 
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then '' else max(rtrim(k0101))
		end
	end,
	case when grouping(left(a0102,5))=1 then '' else 
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then '' else max(rtrim(k6003))
		end
	end,
	case when grouping(left(a0102,5))=1 then '' else 
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then '' else max(rtrim(k6002))
		end
	end,
      sum(isnull(a0505,0))+sum(isnull(a0507,0))+sum(isnull(a0509,0)),
	sum(isnull(a0506,0))+sum(isnull(a0508,0))+sum(isnull(a0510,0)),
      case when grouping(left(a0102,5))=1 then '' else 
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then '' else max(rtrim(K6064))
		end
	end,
      sum(a0519),
	sum(a0520),
	sum(a0521),
	sum(a0505),
	sum(a0506),
	sum(a0507),
	sum(a0508),
	sum(a0509),
	sum(a0510),
	sum(a0511),
	sum(a0512),
	sum(a0513),
	sum(a0514),
	sum(a0515),
	sum(a0516),
	sum(a0517),
	sum(a0518),
	sum(a0503),
	sum(a0504),
	sum(a0701),
      sum(a0702),
      sum(isnull(a0605,0))+sum(isnull(a0607,0))+sum(isnull(a0609,0))+sum(isnull(a0611,0)),
      sum(isnull(a0606,0))+sum(isnull(a0608,0))+sum(isnull(a0610,0))+sum(isnull(a0612,0)),
      sum(a0534),
      sum(a0522),
	case when grouping(left(a0102,5))=1 then '' else 
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then '' else max(rtrim(k0116))
		end
	end
from #linshi_B ,d028 ,d001 c
where (d028.objname like  left(a0102,6)) and  substring(a0102,3,1)='A' and rtrim(ha0203)=rtrim(c.objjc)
group by left(a0102,5),left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003) with rollup
having 	case when grouping(left(a0102,5))=1 then null else
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then '   '+ max(left(rtrim(d028.objjc),6)) else max(rtrim(d028.objjc)) 
      end end is not null
and not (sum(isnull(a0519,0))=0 and sum(isnull(a0520,0))=0 and sum(isnull(a0521,0))=0  and sum(isnull(a0505,0))=0 
         and sum(isnull(a0506,0))=0 and sum(isnull(a0507,0))=0 and sum(isnull(a0508,0))=0 and sum(isnull(a0509,0))=0
          and sum(isnull(a0510,0))=0 and sum(isnull(a0511,0))=0 and sum(isnull(a0512,0))=0 and sum(isnull(a0513,0))=0
          and sum(isnull(a0514,0))=0 and sum(isnull(a0515,0))=0 and sum(isnull(a0516,0))=0  and sum(isnull(a0517,0))=0
          and sum(isnull(a0518,0))=0 and sum(isnull(a0503,0))=0 and sum(isnull(a0504,0))=0 and sum(isnull(a0701,0))=0
          and sum(isnull(a0702,0))=0 and sum(isnull(a0605,0))+sum(isnull(a0607,0))+sum(isnull(a0609,0))+sum(isnull(a0611,0))=0
          and sum(isnull(a0606,0))+sum(isnull(a0608,0))+sum(isnull(a0610,0))+sum(isnull(a0612,0))=0 and sum(isnull(a0534,0))=0
          and sum(isnull(a0522,0))=0)

order by left(a0102,5),left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003)

---------�Ķ�
select HA0203 
from #linshi_B
group by HA0203 

select *
from #linshi_A
where HA0203 = 'ר�ù�·'
-------------
drop table #linshi_B
drop table #linshi_A


