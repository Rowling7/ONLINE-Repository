
if object_id('tempdb..#linshi') is not null
drop table #linshi
create table #linshi
(	a0102 varchar(15),ha0102 varchar(100),
	bh char(2),
	HA0203 char(12),
	K0101 varchar(100),
	K6003 varchar(100),
	K6007 varchar(100),
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
if object_id('tempdb..#������½�������') is not null	drop table #������½�������
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
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
			into #������½�������
			from k60
			where left(A0101,4)='2020' and a3219<>'1' and isnull(K6008,0)<>0 --����ȫ��Ϊ0,�򲻼���
			group by a0102,k0101
----����׵���������
if object_id('tempdb..#����׵���������') is not null	drop table #����׵���������
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
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
			into #����׵���������
			from L60
			where left(A0101,4)=2020-1  and isnull(K6008,0)<>0 --����ȫ��Ϊ0,�򲻼���
			group by a0102,k0101
----#����Ľ�����'
if object_id('tempdb..#����Ľ�����') is not null	drop table #����Ľ�����
			select
			A.A0102,
			A.K0101,
                  A.HA0203,
                  A.K0112,
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
			into #����Ľ�����
			from A50 A
				left join #������½������� N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #����׵��������� O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
insert #linshi (a0102,HA0203,K0101,A0503,A0504,A0505,A0506,A0507,A0508,A0509,A0510,a0519,a0520,A0521,a0511,a0512,
                a0513,a0514,a0515,a0516,a0517,a0518)
select A0102,HA0203,K0101,Σ������,Σ������,��������������,��������������,����������������,����������������,��ʱ����������,
       ��ʱ����������,��ͨʽ����������,��ͨʽ����������,�ѵ�,�ش�������,�ش�������,��������,��������,��������,��������,
       С������,С������ from #����Ľ�����
--�ɿ�
------------------#������½��ɿ���
			if object_id('tempdb..#������½��ɿ���') is not null	drop table #������½��ɿ���
			select 
			A0102,
			K0101,
			[�����ɿ���]	=sum(case when K6504='1' then 1 else 0 end),
			[�ɿ���]			=count(K6501)
			into #������½��ɿ���
			from k65
			where left(A0101,4)=2020  and a3219<>'1' and isnull(K6523,0)<>0 --20011217�޸� �ɿڿ��Ϊ0,�򲻼���			   
			group by a0102,k0101
----#����׵���ɿ���
if object_id('tempdb..#����׵���ɿ���') is not null	drop table #����׵���ɿ���
			select 
			A0102,
			K0101,
			[�����ɿ���]	=sum(case when K6504='1' then 1 else 0 end),
			[�ɿ���]			=count(K6501)
			into #����׵���ɿ���
			from L65
			where left(A0101,4)=2020-1  and isnull(K6523,0)<>0 --20011217�޸� �ɿڿ��Ϊ0,�򲻼���
			group by a0102,k0101
---#����Ľ��ɿ�
if object_id('tempdb..#����Ľ��ɿ�') is not null	drop table #����Ľ��ɿ�
			select
			A.A0102,
			A.K0101,
                        A.HA0203,
			[�����ɿ���]	=ISNULL(N.[�����ɿ���],0)	-ISNULL(O.[�����ɿ���],0),
			[�ɿ���]			=ISNULL(N.[�ɿ���],0)-ISNULL(O.[�ɿ���],0)
			into #����Ľ��ɿ�
			from A50 A
				left join #������½��ɿ��� N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #����׵���ɿ��� O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
insert #linshi(a0102,HA0203,K0101,A0701,A0702) 
select A0102,HA0203,K0101,�ɿ���,�����ɿ��� from #����Ľ��ɿ�
---���
			---------------------------------------------------
---#������½������
			if object_id('tempdb..#������½������') is not null	drop table #������½������
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
			[�س������]	=sum(case when K6304='1' then 1 else 0 end),
			[�س��������]	=sum(case when K6304='1' then K6305 else 0 end),
			[�������]	=sum(case when K6304='2' then 1 else 0 end),
			[��������� ]	=sum(case when K6304='2' then K6305 else 0 end),
			[�������]	=sum(case when K6304='3' then 1 else 0 end),
			[���������]	=sum(case when K6304='3' then K6305 else 0 end),
			[�������]	=sum(case when K6304='4' then 1 else 0 end),
			[���������]	=sum(case when K6304='4' then K6305 else 0 end)
			into #������½������
			from k63
			where left(A0101,4)=2020  and a3219<>'1' and isnull(K6305,0)<>0 --20011217�޸� �������Ϊ0,�򲻼���
			group by a0102,k0101
			
---#����׵��������
			if object_id('tempdb..#����׵��������') is not null	drop table #����׵��������
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
			[�س������]	=sum(case when K6304='1' then 1 else 0 end),
			[�س��������]	=sum(case when K6304='1' then K6305 else 0 end),
			[�������]	=sum(case when K6304='2' then 1 else 0 end),
			[��������� ]	=sum(case when K6304='2' then K6305 else 0 end),
			[�������]	=sum(case when K6304='3' then 1 else 0 end),
			[���������]	=sum(case when K6304='3' then K6305 else 0 end),
			[�������]	=sum(case when K6304='4' then 1 else 0 end),
			[���������]	=sum(case when K6304='4' then K6305 else 0 end)
			into #����׵��������
			from L63
			where left(A0101,4)=2020-1  and isnull(K6305,0)<>0 --20011217�޸� �������Ϊ0,�򲻼���
			group by a0102,k0101
			
--����Ľ����
			if object_id('tempdb..#����Ľ����') is not null	drop table #����Ľ����
			select
			A.A0102,
			A.K0101, 
                  A.ha0203,
			[�س������]	=ISNULL(N.[�س������],0)	-ISNULL(O.[�س������],0),
			[�س��������]	=ISNULL(N.[�س��������],0)-ISNULL(O.[�س��������],0),
			[�������]	=ISNULL(N.[�������],0)	-ISNULL(O.[�������],0),
			[��������� ]	=ISNULL(N.[���������],0)	-ISNULL(O.[���������],0),
			[�������]	=ISNULL(N.[�������],0)	-ISNULL(O.[�������],0),
			[���������]	=ISNULL(N.[���������],0)	-ISNULL(O.[���������],0),
			[�������]	=ISNULL(N.[�������],0)	-ISNULL(O.[�������],0),
			[���������]	=ISNULL(N.[���������],0)	-ISNULL(O.[���������],0)
			into #����Ľ����
			from A50 A
				left join #������½������ N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #����׵�������� O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
insert #linshi(a0102,HA0203,K0101,a0605,a0606,a0607,a0608,a0609,a0610,a0611,a0612)
select  a0102,ha0203,k0101,�س������,�س��������,�������,���������,�������,���������,�������,���������
from #����Ľ����
---��ˮ���̡�����
----#������½����
if object_id('tempdb..#������½����') is not null	drop table #������½����
			select
			A0102,
			K0101,
			[��ˮ����]			= isnull(sum(A0534),0),
			[����]			= isnull(sum(A0522),0)
			into #������½����
			from K01
			where 	(K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' 
				and left(A0101,4)=2020 and a3219<>'1'
				and left(k0101,1) in ('G','S','X','Y','Z','c')						 
			group by A0102,K0101
----#���굽�����
if object_id('tempdb..#���굽�����') is not null	drop table #���굽�����
			select
			A0102,
			K0101,
			[��ˮ����]			= isnull(sum(A0534),0),
			[����]			= isnull(sum(A0522),0)
			into #���굽�����
			from L01
			where 	(K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' 
				and left(A0101,4)=2020-1	
				and left(k0101,1) in ('G','S','X','Y','Z','c')			 
			group by A0102,K0101
----#����Ľ����
if object_id('tempdb..#����Ľ����') is not null	drop table #����Ľ����
			select
			A.A0102,
			A.K0101,
                  A.ha0203,
			[��ˮ����]	=ISNULL(N.[��ˮ����],0)-ISNULL(O.[��ˮ����],0),
			[����]	=ISNULL(N.[����],0)	-ISNULL(O.[����],0)
			into #����Ľ����

			from A50 A
				left join #������½���� N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #���굽�����   O on (A.A0102=O.A0102 AND A.K0101=O.K0101)
insert  #linshi(a0102,ha0203,k0101,A0534,a0522)
select a0102,ha0203,k0101,��ˮ����,���� from  #����Ľ����

                


SELECT '��'




----------------------------------------------------------------------------------------


/*����ʾ��*/
----------------------
select
	 '��   ��',
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
from #linshi
---------------
select ha0203 ,count(1)
from #linshi
group by ha0203

select ha0203 ,count(1)
from #linshi,d001
where rtrim(#linshi.ha0203)=rtrim(objjc)
group by ha0203


----------------

----------------------------------------------------------------------

/*����ʾ��*/
----------------------
select
	case when grouping(a.objname)=1 then NULL else  replace(max(rtrim(a.objjc)),'����ʡ','') end,
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
from #linshi ,d020 a 
where (a.objname =left(a0102,4)) and
	left(#linshi.a0102,4)<>'4290' and left(#linshi.a0102,3)<>'42A' 
group by a.objname with rollup
HAVING	case when grouping(a.objname)=1 then NULL else  replace(max(rtrim(a.objjc)),'����ʡ','') end IS NOT NULL
and not (sum(isnull(a0519,0))=0 and sum(isnull(a0520,0))=0 and sum(isnull(a0521,0))=0  and sum(isnull(a0505,0))=0 
         and sum(isnull(a0506,0))=0 and sum(isnull(a0507,0))=0 and sum(isnull(a0508,0))=0 and sum(isnull(a0509,0))=0
          and sum(isnull(a0510,0))=0 and sum(isnull(a0511,0))=0 and sum(isnull(a0512,0))=0 and sum(isnull(a0513,0))=0
          and sum(isnull(a0514,0))=0 and sum(isnull(a0515,0))=0 and sum(isnull(a0516,0))=0  and sum(isnull(a0517,0))=0
          and sum(isnull(a0518,0))=0 and sum(isnull(a0503,0))=0 and sum(isnull(a0504,0))=0 and sum(isnull(a0701,0))=0
          and sum(isnull(a0702,0))=0 and sum(isnull(a0605,0))+sum(isnull(a0607,0))+sum(isnull(a0609,0))+sum(isnull(a0611,0))=0
          and sum(isnull(a0606,0))+sum(isnull(a0608,0))+sum(isnull(a0610,0))+sum(isnull(a0612,0))=0 and sum(isnull(a0534,0))=0
          and sum(isnull(a0522,0))=0)

order by a.objname


---------------------------------------------------------------------

/*����ʾ��*/
----------------------
select
	case when grouping(a.objname)=1 then NULL else  replace(max(rtrim(a.objjc)),'����ʡ','') end,
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
from #linshi ,d020 a
where (a.objname =  left(a0102,6) 
	 and left(#linshi.a0102,4)='4290')
      or (a.objname =  left(a0102,6) 
	 and left(#linshi.a0102,4)<>'4290' and left(#linshi.a0102,3)<>'42A') 
group by a.objname with rollup
HAVING	case when grouping(a.objname)=1 then NULL else  replace(max(rtrim(a.objjc)),'����ʡ','') end IS NOT NULL
and not (sum(isnull(a0519,0))=0 and sum(isnull(a0520,0))=0 and sum(isnull(a0521,0))=0  and sum(isnull(a0505,0))=0 
         and sum(isnull(a0506,0))=0 and sum(isnull(a0507,0))=0 and sum(isnull(a0508,0))=0 and sum(isnull(a0509,0))=0
          and sum(isnull(a0510,0))=0 and sum(isnull(a0511,0))=0 and sum(isnull(a0512,0))=0 and sum(isnull(a0513,0))=0
          and sum(isnull(a0514,0))=0 and sum(isnull(a0515,0))=0 and sum(isnull(a0516,0))=0  and sum(isnull(a0517,0))=0
          and sum(isnull(a0518,0))=0 and sum(isnull(a0503,0))=0 and sum(isnull(a0504,0))=0 and sum(isnull(a0701,0))=0
          and sum(isnull(a0702,0))=0 and sum(isnull(a0605,0))+sum(isnull(a0607,0))+sum(isnull(a0609,0))+sum(isnull(a0611,0))=0
          and sum(isnull(a0606,0))+sum(isnull(a0608,0))+sum(isnull(a0610,0))+sum(isnull(a0612,0))=0 and sum(isnull(a0534,0))=0
          and sum(isnull(a0522,0))=0)

order by a.objname


-------------------------------
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
from #linshi,d001
where rtrim(#linshi.ha0203)=rtrim(objjc)
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
