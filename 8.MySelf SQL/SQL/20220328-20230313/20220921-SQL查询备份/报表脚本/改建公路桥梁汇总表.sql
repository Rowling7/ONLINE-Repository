
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

------------本年非新建桥梁数
if object_id('tempdb..#本年非新建桥梁数') is not null	drop table #本年非新建桥梁数
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
			[危桥座数]			= sum(case when left(K6028,1) in('4','5') then 1 else 0 end),
			[危桥延米]			= sum(case when left(K6028,1) in('4','5') then K6008 else 0 end),
			[永久性桥梁座数]			= sum(case when K6004='1' then 1 else 0 end),
			[永久性桥梁延米]			= sum(case when K6004='1' then K6008 else 0 end),
			[半永久性桥梁座数]   	= sum(case when K6004='2' then 1 else 0 end),
			[半永久性桥梁延米]   	= sum(case when K6004='2' then K6008 else 0 end),
			[临时性桥梁座数]			= sum(case when K6004='3' then 1 else 0 end),
			[临时性桥梁延米]			= sum(case when K6004='3' then K6008 else 0 end),
			[互通式立交桥座数]	= sum(case when K6062='1' then 1 else 0 end),
			[互通式立交桥延米]	= sum(case when K6062='1' then K6008 else 0 end),
			[匝道]			= isnull(sum(A0521),0),
			[特大桥座数]			= sum(case when K6007='1' then 1 else 0 end),
			[特大桥延米]			= sum(case when K6007='1' then K6008 else 0 end),
			[大桥座数]			= sum(case when K6007='2' then 1 else 0 end),
			[大桥延米]			= sum(case when K6007='2' then K6008 else 0 end),
			[中桥座数]			= sum(case when K6007='3' then 1 else 0 end),
			[中桥延米]			= sum(case when K6007='3' then K6008 else 0 end),
			[小桥座数]			= sum(case when K6007='4' then 1 else 0 end),
			[小桥延米]			= sum(case when K6007='4' then K6008 else 0 end)
			into #本年非新建桥梁数
			from k60
			where left(A0101,4)='2020' and a3219<>'1' and isnull(K6008,0)<>0 --桥梁全长为0,则不计数
			group by a0102,k0101
----上年底到达桥梁数
if object_id('tempdb..#上年底到达桥梁数') is not null	drop table #上年底到达桥梁数
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
			[危桥座数]	= sum(case when left(K6028,1) in('4','5') then 1 else 0 end),
			[危桥延米]	= sum(case when left(K6028,1) in('4','5') then K6008 else 0 end),
			[永久性桥梁座数]	= sum(case when K6004='1' then 1 else 0 end),
			[永久性桥梁延米]	= sum(case when K6004='1' then K6008 else 0 end),
			[半永久性桥梁座数]= sum(case when K6004='2' then 1 else 0 end),
			[半永久性桥梁延米]= sum(case when K6004='2' then K6008 else 0 end),
			[临时性桥梁座数]	= sum(case when K6004='3' then 1 else 0 end),
			[临时性桥梁延米]	= sum(case when K6004='3' then K6008 else 0 end),
			[互通式立交桥座数]= sum(case when K6062='1' then 1 else 0 end),
			[互通式立交桥延米]= sum(case when K6062='1' then K6008 else 0 end),
			[匝道]	= isnull(sum(A0521),0),
			[特大桥座数]	= sum(case when K6007='1' then 1 else 0 end),
			[特大桥延米]	= sum(case when K6007='1' then K6008 else 0 end),
			[大桥座数]	= sum(case when K6007='2' then 1 else 0 end),
			[大桥延米]	= sum(case when K6007='2' then K6008 else 0 end),
			[中桥座数]	= sum(case when K6007='3' then 1 else 0 end),
			[中桥延米]	= sum(case when K6007='3' then K6008 else 0 end),
			[小桥座数]	= sum(case when K6007='4' then 1 else 0 end),
			[小桥延米]	= sum(case when K6007='4' then K6008 else 0 end)
			into #上年底到达桥梁数
			from L60
			where left(A0101,4)=2020-1  and isnull(K6008,0)<>0 --桥梁全长为0,则不计数
			group by a0102,k0101
----#本年改建桥梁'
if object_id('tempdb..#本年改建桥梁') is not null	drop table #本年改建桥梁
			select
			A.A0102,
			A.K0101,
                  A.HA0203,
                  A.K0112,
			[危桥座数]	=ISNULL(N.[危桥座数],0)			-ISNULL(O.[危桥座数],0),
			[危桥延米]	=ISNULL(N.[危桥延米],0)			-ISNULL(O.[危桥延米],0),
			[永久性桥梁座数]	=ISNULL(N.[永久性桥梁座数],0)	-ISNULL(O.[永久性桥梁座数],0),
			[永久性桥梁延米]	=ISNULL(N.[永久性桥梁延米],0)	-ISNULL(O.[永久性桥梁延米],0),
			[半永久性桥梁座数]=ISNULL(N.[半永久性桥梁座数],0)	-ISNULL(O.[半永久性桥梁座数],0),
			[半永久性桥梁延米]=ISNULL(N.[半永久性桥梁延米],0)	-ISNULL(O.[半永久性桥梁延米],0),
			[临时性桥梁座数]	=ISNULL(N.[临时性桥梁座数],0)	-ISNULL(O.[临时性桥梁座数],0),
			[临时性桥梁延米]	=ISNULL(N.[临时性桥梁延米],0)	-ISNULL(O.[临时性桥梁延米],0),
			[互通式立交桥座数]=ISNULL(N.[互通式立交桥座数],0)	-ISNULL(O.[互通式立交桥座数],0),
			[互通式立交桥延米]=ISNULL(N.[互通式立交桥延米],0)	-ISNULL(O.[互通式立交桥延米],0),
			[匝道]	=ISNULL(N.[匝道],0)			-ISNULL(O.[匝道],0),
			[特大桥座数]	=ISNULL(N.[特大桥座数],0)			-ISNULL(O.[特大桥座数],0),
			[特大桥延米]	=ISNULL(N.[特大桥延米],0)			-ISNULL(O.[特大桥延米],0),
			[大桥座数]	=ISNULL(N.[大桥座数],0)			-ISNULL(O.[大桥座数],0),
			[大桥延米]	=ISNULL(N.[大桥延米],0)			-ISNULL(O.[大桥延米],0),
			[中桥座数]	=ISNULL(N.[中桥座数],0)			-ISNULL(O.[中桥座数],0),
			[中桥延米]	=ISNULL(N.[中桥延米],0)			-ISNULL(O.[中桥延米],0),
			[小桥座数]	=ISNULL(N.[小桥座数],0)			-ISNULL(O.[小桥座数],0),
			[小桥延米]	=ISNULL(N.[小桥延米],0)			-ISNULL(O.[小桥延米],0)
			into #本年改建桥梁
			from A50 A
				left join #本年非新建桥梁数 N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #上年底到达桥梁数 O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
insert #linshi (a0102,HA0203,K0101,A0503,A0504,A0505,A0506,A0507,A0508,A0509,A0510,a0519,a0520,A0521,a0511,a0512,
                a0513,a0514,a0515,a0516,a0517,a0518)
select A0102,HA0203,K0101,危桥座数,危桥延米,永久性桥梁座数,永久性桥梁延米,半永久性桥梁座数,半永久性桥梁延米,临时性桥梁座数,
       临时性桥梁延米,互通式立交桥座数,互通式立交桥延米,匝道,特大桥座数,特大桥延米,大桥座数,大桥延米,中桥座数,中桥延米,
       小桥座数,小桥延米 from #本年改建桥梁
--渡口
------------------#本年非新建渡口数
			if object_id('tempdb..#本年非新建渡口数') is not null	drop table #本年非新建渡口数
			select 
			A0102,
			K0101,
			[机动渡口数]	=sum(case when K6504='1' then 1 else 0 end),
			[渡口数]			=count(K6501)
			into #本年非新建渡口数
			from k65
			where left(A0101,4)=2020  and a3219<>'1' and isnull(K6523,0)<>0 --20011217修改 渡口宽度为0,则不计数			   
			group by a0102,k0101
----#上年底到达渡口数
if object_id('tempdb..#上年底到达渡口数') is not null	drop table #上年底到达渡口数
			select 
			A0102,
			K0101,
			[机动渡口数]	=sum(case when K6504='1' then 1 else 0 end),
			[渡口数]			=count(K6501)
			into #上年底到达渡口数
			from L65
			where left(A0101,4)=2020-1  and isnull(K6523,0)<>0 --20011217修改 渡口宽度为0,则不计数
			group by a0102,k0101
---#本年改建渡口
if object_id('tempdb..#本年改建渡口') is not null	drop table #本年改建渡口
			select
			A.A0102,
			A.K0101,
                        A.HA0203,
			[机动渡口数]	=ISNULL(N.[机动渡口数],0)	-ISNULL(O.[机动渡口数],0),
			[渡口数]			=ISNULL(N.[渡口数],0)-ISNULL(O.[渡口数],0)
			into #本年改建渡口
			from A50 A
				left join #本年非新建渡口数 N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #上年底到达渡口数 O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
insert #linshi(a0102,HA0203,K0101,A0701,A0702) 
select A0102,HA0203,K0101,渡口数,机动渡口数 from #本年改建渡口
---隧道
			---------------------------------------------------
---#本年非新建隧道数
			if object_id('tempdb..#本年非新建隧道数') is not null	drop table #本年非新建隧道数
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
			[特长隧道数]	=sum(case when K6304='1' then 1 else 0 end),
			[特长隧道延米]	=sum(case when K6304='1' then K6305 else 0 end),
			[长隧道数]	=sum(case when K6304='2' then 1 else 0 end),
			[长隧道延米 ]	=sum(case when K6304='2' then K6305 else 0 end),
			[中隧道数]	=sum(case when K6304='3' then 1 else 0 end),
			[中隧道延米]	=sum(case when K6304='3' then K6305 else 0 end),
			[短隧道数]	=sum(case when K6304='4' then 1 else 0 end),
			[短隧道延米]	=sum(case when K6304='4' then K6305 else 0 end)
			into #本年非新建隧道数
			from k63
			where left(A0101,4)=2020  and a3219<>'1' and isnull(K6305,0)<>0 --20011217修改 隧道长度为0,则不计数
			group by a0102,k0101
			
---#上年底到达隧道数
			if object_id('tempdb..#上年底到达隧道数') is not null	drop table #上年底到达隧道数
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
			[特长隧道数]	=sum(case when K6304='1' then 1 else 0 end),
			[特长隧道延米]	=sum(case when K6304='1' then K6305 else 0 end),
			[长隧道数]	=sum(case when K6304='2' then 1 else 0 end),
			[长隧道延米 ]	=sum(case when K6304='2' then K6305 else 0 end),
			[中隧道数]	=sum(case when K6304='3' then 1 else 0 end),
			[中隧道延米]	=sum(case when K6304='3' then K6305 else 0 end),
			[短隧道数]	=sum(case when K6304='4' then 1 else 0 end),
			[短隧道延米]	=sum(case when K6304='4' then K6305 else 0 end)
			into #上年底到达隧道数
			from L63
			where left(A0101,4)=2020-1  and isnull(K6305,0)<>0 --20011217修改 隧道长度为0,则不计数
			group by a0102,k0101
			
--本年改建里程
			if object_id('tempdb..#本年改建隧道') is not null	drop table #本年改建隧道
			select
			A.A0102,
			A.K0101, 
                  A.ha0203,
			[特长隧道数]	=ISNULL(N.[特长隧道数],0)	-ISNULL(O.[特长隧道数],0),
			[特长隧道延米]	=ISNULL(N.[特长隧道延米],0)-ISNULL(O.[特长隧道延米],0),
			[长隧道数]	=ISNULL(N.[长隧道数],0)	-ISNULL(O.[长隧道数],0),
			[长隧道延米 ]	=ISNULL(N.[长隧道延米],0)	-ISNULL(O.[长隧道延米],0),
			[中隧道数]	=ISNULL(N.[中隧道数],0)	-ISNULL(O.[中隧道数],0),
			[中隧道延米]	=ISNULL(N.[中隧道延米],0)	-ISNULL(O.[中隧道延米],0),
			[短隧道数]	=ISNULL(N.[短隧道数],0)	-ISNULL(O.[短隧道数],0),
			[短隧道延米]	=ISNULL(N.[短隧道延米],0)	-ISNULL(O.[短隧道延米],0)
			into #本年改建隧道
			from A50 A
				left join #本年非新建隧道数 N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #上年底到达隧道数 O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
insert #linshi(a0102,HA0203,K0101,a0605,a0606,a0607,a0608,a0609,a0610,a0611,a0612)
select  a0102,ha0203,k0101,特长隧道数,特长隧道延米,长隧道数,长隧道延米,中隧道数,中隧道延米,短隧道数,短隧道延米
from #本年改建隧道
---漫水工程、涵洞
----#本年非新建里程
if object_id('tempdb..#本年非新建里程') is not null	drop table #本年非新建里程
			select
			A0102,
			K0101,
			[漫水工程]			= isnull(sum(A0534),0),
			[涵洞]			= isnull(sum(A0522),0)
			into #本年非新建里程
			from K01
			where 	(K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' 
				and left(A0101,4)=2020 and a3219<>'1'
				and left(k0101,1) in ('G','S','X','Y','Z','c')						 
			group by A0102,K0101
----#上年到达里程
if object_id('tempdb..#上年到达里程') is not null	drop table #上年到达里程
			select
			A0102,
			K0101,
			[漫水工程]			= isnull(sum(A0534),0),
			[涵洞]			= isnull(sum(A0522),0)
			into #上年到达里程
			from L01
			where 	(K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' 
				and left(A0101,4)=2020-1	
				and left(k0101,1) in ('G','S','X','Y','Z','c')			 
			group by A0102,K0101
----#本年改建里程
if object_id('tempdb..#本年改建里程') is not null	drop table #本年改建里程
			select
			A.A0102,
			A.K0101,
                  A.ha0203,
			[漫水工程]	=ISNULL(N.[漫水工程],0)-ISNULL(O.[漫水工程],0),
			[涵洞]	=ISNULL(N.[涵洞],0)	-ISNULL(O.[涵洞],0)
			into #本年改建里程

			from A50 A
				left join #本年非新建里程 N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #上年到达里程   O on (A.A0102=O.A0102 AND A.K0101=O.K0101)
insert  #linshi(a0102,ha0203,k0101,A0534,a0522)
select a0102,ha0203,k0101,漫水工程,涵洞 from  #本年改建里程

                


SELECT '甲'




----------------------------------------------------------------------------------------


/*不显示零*/
----------------------
select
	 '合   计',
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

/*不显示零*/
----------------------
select
	case when grouping(a.objname)=1 then NULL else  replace(max(rtrim(a.objjc)),'湖北省','') end,
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
HAVING	case when grouping(a.objname)=1 then NULL else  replace(max(rtrim(a.objjc)),'湖北省','') end IS NOT NULL
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

/*不显示零*/
----------------------
select
	case when grouping(a.objname)=1 then NULL else  replace(max(rtrim(a.objjc)),'湖北省','') end,
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
HAVING	case when grouping(a.objname)=1 then NULL else  replace(max(rtrim(a.objjc)),'湖北省','') end IS NOT NULL
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
	case when grouping(OBJNAME)=1 then '合  计' else max(rtrim(objjc)) end,
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
