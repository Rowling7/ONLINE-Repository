
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

------------本年非新建桥梁数
if object_id('tempdb..#本年非新建桥梁数_A') is not null	drop table #本年非新建桥梁数_A
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
                  min(k6003) k6003,
                  max(k6070) k6070,
                  max(k6002) k6002,
                  min(k6064) k6064,
                  max(k0116) k0116,
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
			into #本年非新建桥梁数_A
			from k60
			where left(A0101,4)=2020 and a0102 like '4206%' and a3219<>'1' and isnull(K6008,0)<>0 --桥梁全长为0,则不计数
			group by a0102,k0101
----上年底到达桥梁数
if object_id('tempdb..#上年底到达桥梁数_A') is not null	drop table #上年底到达桥梁数_A
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
                  min(k6003) k6003,
                  max(k6070) k6070,
                  max(k6002) k6002,
                  min(k6064) k6064,
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
			into #上年底到达桥梁数_A
			from L60
			where left(A0101,4)='2020'-1 and a0102 like '4206%' and isnull(K6008,0)<>0 --桥梁全长为0,则不计数
			group by a0102,k0101
----#本年改建桥梁_A'
if object_id('tempdb..#本年改建桥梁_A') is not null	drop table #本年改建桥梁_A
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
			into #本年改建桥梁_A
			from A50 A
				left join #本年非新建桥梁数_A N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #上年底到达桥梁数_A O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
			where A.a0102 like '4206%'

insert #linshi_A (a0102,HA0203,K0101,K6003,k6002,K6064,A0503,A0504,A0505,A0506,A0507,A0508,A0509,A0510,a0519,a0520,A0521,a0511,a0512,
                a0513,a0514,a0515,a0516,a0517,a0518,k0116)
select A0102,HA0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(cast(k6003 as char(10)))+' '+rtrim(isnull(k6070,'')),rtrim(k6002),K6064,
危桥座数,危桥延米,永久性桥梁座数,永久性桥梁延米,半永久性桥梁座数,半永久性桥梁延米,临时性桥梁座数,
       临时性桥梁延米,互通式立交桥座数,互通式立交桥延米,匝道,特大桥座数,特大桥延米,大桥座数,大桥延米,中桥座数,中桥延米,
       小桥座数,小桥延米,rtrim(k0116) from #本年改建桥梁_A
--渡口
------------------#本年非新建渡口数_A
			if object_id('tempdb..#本年非新建渡口数_A') is not null	drop table #本年非新建渡口数_A
			select 
			A0102,
			K0101,
                  min(a0204) a0204,
                  max(k6502) k6502,
			[机动渡口数]	=sum(case when K6504='1' then 1 else 0 end),
			[渡口数]			=count(K6501)
			into #本年非新建渡口数_A
			from k65
			where a0102 like '4206%' and left(A0101,4)='2020' and a3219<>'1' and isnull(K6523,0)<>0 --20011217修改 渡口宽度为0,则不计数			   
			group by a0102,k0101
----#上年底到达渡口数_A
if object_id('tempdb..#上年底到达渡口数_A') is not null	drop table #上年底到达渡口数_A
			select 
			A0102,
			K0101,
                  min(a0204) a0204,
                  max(k6502) k6502,
			[机动渡口数]	=sum(case when K6504='1' then 1 else 0 end),
			[渡口数]			=count(K6501)
			into #上年底到达渡口数_A
			from L65
			where a0102 like '4206%' and left(A0101,4)='2020'-1 and isnull(K6523,0)<>0 --20011217修改 渡口宽度为0,则不计数
			group by a0102,k0101
---#本年改建渡口_A
if object_id('tempdb..#本年改建渡口_A') is not null	drop table #本年改建渡口_A
			select
			A.A0102,
			A.K0101,
                  A.HA0203,
                  n.a0204,
                  n.k6502,
                  A.k0112,
			[机动渡口数]	=ISNULL(N.[机动渡口数],0)	-ISNULL(O.[机动渡口数],0),
			[渡口数]			=ISNULL(N.[渡口数],0)-ISNULL(O.[渡口数],0)
			into #本年改建渡口_A
			from A50 A
				left join #本年非新建渡口数_A N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #上年底到达渡口数_A O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
			where A.a0102 like '4206%'

insert #linshi_A(a0102,HA0203,K0101,k6003,K6002,A0701,A0702) 
select A0102,HA0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(a0204),rtrim(k6502),渡口数,机动渡口数 from #本年改建渡口_A
---隧道
---#本年非新建隧道数_A
			if object_id('tempdb..#本年非新建隧道数_A') is not null	drop table #本年非新建隧道数_A
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
                  min(k6303) k6303,
                  max(k6302) k6302,
                  max(k0116) k0116,
			[特长隧道数]	=sum(case when K6304='1' then 1 else 0 end),
			[特长隧道延米]	=sum(case when K6304='1' then K6305 else 0 end),
			[长隧道数]	=sum(case when K6304='2' then 1 else 0 end),
			[长隧道延米 ]	=sum(case when K6304='2' then K6305 else 0 end),
			[中隧道数]	=sum(case when K6304='3' then 1 else 0 end),
			[中隧道延米]	=sum(case when K6304='3' then K6305 else 0 end),
			[短隧道数]	=sum(case when K6304='4' then 1 else 0 end),
			[短隧道延米]	=sum(case when K6304='4' then K6305 else 0 end)
			into #本年非新建隧道数_A
			from k63
			where a0102 like '4206%' and left(A0101,4)='2020' and a3219<>'1' and isnull(K6305,0)<>0 --20011217修改 隧道长度为0,则不计数
			group by a0102,k0101
			
---#上年底到达隧道数_A
			if object_id('tempdb..#上年底到达隧道数_A') is not null	drop table #上年底到达隧道数_A
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
                  min(k6303) k6303,
                  max(k6302) k6302,
			[特长隧道数]	=sum(case when K6304='1' then 1 else 0 end),
			[特长隧道延米]	=sum(case when K6304='1' then K6305 else 0 end),
			[长隧道数]	=sum(case when K6304='2' then 1 else 0 end),
			[长隧道延米 ]	=sum(case when K6304='2' then K6305 else 0 end),
			[中隧道数]	=sum(case when K6304='3' then 1 else 0 end),
			[中隧道延米]	=sum(case when K6304='3' then K6305 else 0 end),
			[短隧道数]	=sum(case when K6304='4' then 1 else 0 end),
			[短隧道延米]	=sum(case when K6304='4' then K6305 else 0 end)
			into #上年底到达隧道数_A
			from L63
			where a0102 like '4206%' and left(A0101,4)='2020'-1 and isnull(K6305,0)<>0 --20011217修改 隧道长度为0,则不计数
			group by a0102,k0101
			
--本年改建隧道
			if object_id('tempdb..#本年改建隧道_A') is not null	drop table #本年改建隧道_A
			select
			A.A0102,
			A.K0101, 
                  A.ha0203,
                  n.k6303,
                  n.k6302,
                  a.k0112,
                  n.k0116,
			[特长隧道数]	=ISNULL(N.[特长隧道数],0)	-ISNULL(O.[特长隧道数],0),
			[特长隧道延米]	=ISNULL(N.[特长隧道延米],0)-ISNULL(O.[特长隧道延米],0),
			[长隧道数]	=ISNULL(N.[长隧道数],0)	-ISNULL(O.[长隧道数],0),
			[长隧道延米 ]	=ISNULL(N.[长隧道延米],0)	-ISNULL(O.[长隧道延米],0),
			[中隧道数]	=ISNULL(N.[中隧道数],0)	-ISNULL(O.[中隧道数],0),
			[中隧道延米]	=ISNULL(N.[中隧道延米],0)	-ISNULL(O.[中隧道延米],0),
			[短隧道数]	=ISNULL(N.[短隧道数],0)	-ISNULL(O.[短隧道数],0),
			[短隧道延米]	=ISNULL(N.[短隧道延米],0)	-ISNULL(O.[短隧道延米],0)
			into #本年改建隧道_A
			from A50 A
				left join #本年非新建隧道数_A N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #上年底到达隧道数_A O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
			where A.a0102 like '4206%'

insert #linshi_A(a0102,HA0203,K0101,k6003,K6002,a0605,a0606,a0607,a0608,a0609,a0610,a0611,a0612,k0116)
select  a0102,ha0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(k6303),rtrim(k6302),特长隧道数,特长隧道延米,长隧道数,长隧道延米,中隧道数,中隧道延米,短隧道数,短隧道延米,
rtrim(k0116)
from #本年改建隧道_A
---漫水工程、涵洞
----#本年非新建里程_A
if object_id('tempdb..#本年非新建里程_A') is not null	drop table #本年非新建里程_A
			select
			A0102,
			K0101,
                  min(k0108) k0108,
                  max(k0108) k0109,
                  max(a0535) a0535,
                  max(k0116) k0116,
			[漫水工程]			= isnull(sum(A0534),0),
			[涵洞]			= isnull(sum(A0522),0)
			into #本年非新建里程_A
			from K01
			where 	(K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' 
				and a0102 like '4206%' and left(A0101,4)='2020' and a3219<>'1'
				and left(k0101,1) in ('G','S','X','Y','Z','c')						 
			group by A0102,K0101
----#上年到达里程_A
if object_id('tempdb..#上年到达里程_A') is not null	drop table #上年到达里程_A
			select
			A0102,
			K0101,
                  min(k0108) k0108,
                  max(k0108) k0109,
                  max(a0535) a0535,
			[漫水工程]			= isnull(sum(A0534),0),
			[涵洞]			= isnull(sum(A0522),0)
			into #上年到达里程_A
			from L01
			where 	(K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' 
				and a0102 like '4206%' and left(A0101,4)='2020'-1	
				and left(k0101,1) in ('G','S','X','Y','Z','c')			 
			group by A0102,K0101
----#本年改建里程_A
if object_id('tempdb..#本年改建里程_A') is not null	drop table #本年改建里程_A
			select
			A.A0102,
			A.K0101,
                  A.ha0203,
                  n.k0108,
                  n.k0109,
                  n.a0535,
                  a.k0112,
                  n.k0116,
			[漫水工程]	=ISNULL(N.[漫水工程],0)-ISNULL(O.[漫水工程],0),
			[涵洞]	=ISNULL(N.[涵洞],0)	-ISNULL(O.[涵洞],0)
			into #本年改建里程_A
			from A50 A
				left join #本年非新建里程_A N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #上年到达里程_A   O on (A.A0102=O.A0102 AND A.K0101=O.K0101)
			where A.a0102 like '4206%'

insert  #linshi_A(a0102,ha0203,k0101,k6003,k6002,A0534,a0522,k0116)
select a0102,ha0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(cast (k0108 as char(10)))+'-'+rtrim(cast (k0109 as char(10))),
rtrim((a0535)),漫水工程,涵洞,rtrim(k0116) from  #本年改建里程_A

                


---SELECT '甲'
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

------------本年非新建桥梁数
if object_id('tempdb..#本年非新建桥梁数_B') is not null	drop table #本年非新建桥梁数_B
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
			into #本年非新建桥梁数_B
			from k60
			where a0102 like '4206%' and left(A0101,4)='2020' and a3219<>'1' and isnull(K6008,0)<>0 --桥梁全长为0,则不计数
			group by a0102,k0101,k6001
----上年底到达桥梁数
if object_id('tempdb..#上年底到达桥梁数_B') is not null	drop table #上年底到达桥梁数_B
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
			K6001,
                  min(k6003) k6003,
                  max(k6070) k6070,
                  max(k6002) k6002,
                  min(k6064) k6064,
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
			into #上年底到达桥梁数_B
			from L60
			where a0102 like '4206%' and left(A0101,4)='2020'-1 and isnull(K6008,0)<>0 --桥梁全长为0,则不计数
			group by a0102,k0101,k6001
----#本年改建桥梁_B'
if object_id('tempdb..#本年改建桥梁_B') is not null	drop table #本年改建桥梁_B
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
			into #本年改建桥梁_B
			from A50 A
				full join #本年非新建桥梁数_B N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				full join #上年底到达桥梁数_B O  on (A.A0102=O.A0102 AND A.K0101=O.K0101 and n.k6001=o.k6001)
			where A.a0102 like '4206%'

insert #linshi_B (a0102,HA0203,K0101,K6003,k6002,K6064,A0503,A0504,A0505,A0506,A0507,A0508,A0509,A0510,a0519,a0520,A0521,a0511,a0512,
                a0513,a0514,a0515,a0516,a0517,a0518,k0116,K6001)
select A0102,HA0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(cast(k6003 as char(10)))+' '+rtrim(isnull(k6070,'')),rtrim(k6002),K6064,
危桥座数,危桥延米,永久性桥梁座数,永久性桥梁延米,半永久性桥梁座数,半永久性桥梁延米,临时性桥梁座数,
       临时性桥梁延米,互通式立交桥座数,互通式立交桥延米,匝道,特大桥座数,特大桥延米,大桥座数,大桥延米,中桥座数,中桥延米,
       小桥座数,小桥延米,rtrim(k0116),K6001 from #本年改建桥梁_B
----更新
update #linshi_B set k0101=case when left(k6001,1) in ('G','H') then left(k6001,len(rtrim(k6001))-11) else
                       case when left(k6001,1) in ('S','T') then left(k6001,len(rtrim(k6001))-11) else
                       case when left(k6001,1)='x' then left(k6001,8)+'00' else
                       case when left(k6001,1) in('y','c') then left(k6001,10) end end end end 
where ha0203 is not null
update #linshi_A set ha0203=case when left(k0101,1) in ('G','H') then case when len(rtrim(K0101))>9 then '一般国道' else '国家高速公路' end else 
					case when left(k0101,1) in ('S','T') then '省道' else
					case when left(k0101,1) = 'X' then '县道' else
			        case when left(k0101,1) = 'y' then '乡道' else 
					case when left(k0101,2) = 'ZY' then '专用公路' else
                    case when left(k0101,1) = 'Z' then'专用道' else '村道' end end end end end end
where ha0203 is not null
--渡口
------------------#本年非新建渡口数_B
			if object_id('tempdb..#本年非新建渡口数_B') is not null	drop table #本年非新建渡口数_B
			select 
			A0102,
			K0101,
                  min(a0204) a0204,
                  max(k6502) k6502,
			[机动渡口数]	=sum(case when K6504='1' then 1 else 0 end),
			[渡口数]			=count(K6501)
			into #本年非新建渡口数_B
			from k65
			where a0102 like '4206%' and left(A0101,4)='2020' and a3219<>'1' and isnull(K6523,0)<>0 --20011217修改 渡口宽度为0,则不计数			   
			group by a0102,k0101
----#上年底到达渡口数_B
if object_id('tempdb..#上年底到达渡口数_B') is not null	drop table #上年底到达渡口数_B
			select 
			A0102,
			K0101,
                  min(a0204) a0204,
                  max(k6502) k6502,
			[机动渡口数]	=sum(case when K6504='1' then 1 else 0 end),
			[渡口数]			=count(K6501)
			into #上年底到达渡口数_B
			from L65
			where a0102 like '4206%' and left(A0101,4)='2020'-1 and isnull(K6523,0)<>0 --20011217修改 渡口宽度为0,则不计数
			group by a0102,k0101
---#本年改建渡口_B
if object_id('tempdb..#本年改建渡口_B') is not null	drop table #本年改建渡口_B
			select
			A.A0102,
			A.K0101,
                  A.HA0203,
                  n.a0204,
                  n.k6502,
                  A.k0112,
			[机动渡口数]	=ISNULL(N.[机动渡口数],0)	-ISNULL(O.[机动渡口数],0),
			[渡口数]			=ISNULL(N.[渡口数],0)-ISNULL(O.[渡口数],0)
			into #本年改建渡口_B
			from A50 A
				left join #本年非新建渡口数_B N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #上年底到达渡口数_B O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
			where A.a0102 like '4206%'

insert #linshi_B(a0102,HA0203,K0101,k6003,K6002,A0701,A0702) 
select A0102,HA0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(a0204),rtrim(k6502),渡口数,机动渡口数 from #本年改建渡口_B
---隧道
---#本年非新建隧道数_B
			if object_id('tempdb..#本年非新建隧道数_B') is not null	drop table #本年非新建隧道数_B
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
                  min(k6303) k6303,
                  max(k6302) k6302,
                  max(k0116) k0116,
			[特长隧道数]	=sum(case when K6304='1' then 1 else 0 end),
			[特长隧道延米]	=sum(case when K6304='1' then K6305 else 0 end),
			[长隧道数]	=sum(case when K6304='2' then 1 else 0 end),
			[长隧道延米 ]	=sum(case when K6304='2' then K6305 else 0 end),
			[中隧道数]	=sum(case when K6304='3' then 1 else 0 end),
			[中隧道延米]	=sum(case when K6304='3' then K6305 else 0 end),
			[短隧道数]	=sum(case when K6304='4' then 1 else 0 end),
			[短隧道延米]	=sum(case when K6304='4' then K6305 else 0 end)
			into #本年非新建隧道数_B
			from k63
			where a0102 like '4206%' and left(A0101,4)='2020' and a3219<>'1' and isnull(K6305,0)<>0 --20011217修改 隧道长度为0,则不计数
			group by a0102,k0101
			
---#上年底到达隧道数_B
			if object_id('tempdb..#上年底到达隧道数_B') is not null	drop table #上年底到达隧道数_B
			select 
			A0102,
			Max(HA0102) ha0102,
			K0101,
                  min(k6303) k6303,
                  max(k6302) k6302,
			[特长隧道数]	=sum(case when K6304='1' then 1 else 0 end),
			[特长隧道延米]	=sum(case when K6304='1' then K6305 else 0 end),
			[长隧道数]	=sum(case when K6304='2' then 1 else 0 end),
			[长隧道延米 ]	=sum(case when K6304='2' then K6305 else 0 end),
			[中隧道数]	=sum(case when K6304='3' then 1 else 0 end),
			[中隧道延米]	=sum(case when K6304='3' then K6305 else 0 end),
			[短隧道数]	=sum(case when K6304='4' then 1 else 0 end),
			[短隧道延米]	=sum(case when K6304='4' then K6305 else 0 end)
			into #上年底到达隧道数_B
			from L63
			where a0102 like '4206%' and left(A0101,4)='2020'-1 and isnull(K6305,0)<>0 --20011217修改 隧道长度为0,则不计数
			group by a0102,k0101
			
--本年改建隧道
			if object_id('tempdb..#本年改建隧道_B') is not null	drop table #本年改建隧道_B
			select
			A.A0102,
			A.K0101, 
                  A.ha0203,
                  n.k6303,
                  n.k6302,
                  a.k0112,
                  n.k0116,
			[特长隧道数]	=ISNULL(N.[特长隧道数],0)	-ISNULL(O.[特长隧道数],0),
			[特长隧道延米]	=ISNULL(N.[特长隧道延米],0)-ISNULL(O.[特长隧道延米],0),
			[长隧道数]	=ISNULL(N.[长隧道数],0)	-ISNULL(O.[长隧道数],0),
			[长隧道延米 ]	=ISNULL(N.[长隧道延米],0)	-ISNULL(O.[长隧道延米],0),
			[中隧道数]	=ISNULL(N.[中隧道数],0)	-ISNULL(O.[中隧道数],0),
			[中隧道延米]	=ISNULL(N.[中隧道延米],0)	-ISNULL(O.[中隧道延米],0),
			[短隧道数]	=ISNULL(N.[短隧道数],0)	-ISNULL(O.[短隧道数],0),
			[短隧道延米]	=ISNULL(N.[短隧道延米],0)	-ISNULL(O.[短隧道延米],0)
			into #本年改建隧道_B
			from A50 A
				left join #本年非新建隧道数_B N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				left join #上年底到达隧道数_B O  on (A.A0102=O.A0102 AND A.K0101=O.K0101)
			where A.a0102 like '4206%'

insert #linshi_B(a0102,HA0203,K0101,k6003,K6002,a0605,a0606,a0607,a0608,a0609,a0610,a0611,a0612,k0116)
select  a0102,ha0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(k6303),rtrim(k6302),特长隧道数,特长隧道延米,长隧道数,长隧道延米,中隧道数,中隧道延米,短隧道数,短隧道延米,
rtrim(k0116)
from #本年改建隧道_B
---漫水工程、涵洞
----#本年非新建里程_B
if object_id('tempdb..#本年非新建里程_B') is not null	drop table #本年非新建里程_B
			select
			A0102,
			K0101,
                  min(k0108) k0108,
                  max(k0108) k0109,
                  max(a0535) a0535,
                  max(k0116) k0116,
			[漫水工程]			= isnull(sum(A0534),0),
			[涵洞]			= isnull(sum(A0522),0)
			into #本年非新建里程_B
			from K01
			where 	(K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' 
				and a0102 like '4206%' and left(A0101,4)='2020' and a3219<>'1'
				and left(k0101,1) in ('G','S','X','Y','Z','c')						 
			group by A0102,K0101,k0108
----#上年到达里程_B
if object_id('tempdb..#上年到达里程_B') is not null	drop table #上年到达里程_B
			select
			A0102,
			K0101,
                  min(k0108) k0108,
                  max(k0108) k0109,
                  max(a0535) a0535,
			[漫水工程]			= isnull(sum(A0534),0),
			[涵洞]			= isnull(sum(A0522),0)
			into #上年到达里程_B
			from L01
			where 	(K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' 
				and a0102 like '4206%' and left(A0101,4)='2020'-1	
				and left(k0101,1) in ('G','S','X','Y','Z','c')			 
			group by A0102,K0101,k0108
----#本年改建里程_B

if object_id('tempdb..#本年改建里程_B') is not null	drop table #本年改建里程_B
			select
			case when a.a0102 is not null then a.a0102 else case when n.a0102 is not null then n.a0102 else o.a0102 end end a0102,
			case when A.K0101 is not null then a.k0101 else case when n.k0101 is not null then n.k0101 else o.k0101 end end k0101,
                  A.ha0203,
                  isnull(n.k0108,o.k0108) k0108,
                  n.k0109,
                  n.a0535,
                  a.k0112,
                  n.k0116,
			[漫水工程]	=ISNULL(N.[漫水工程],0)-ISNULL(O.[漫水工程],0),
			[涵洞]	=ISNULL(N.[涵洞],0)	-ISNULL(O.[涵洞],0)
			into #本年改建里程_B
			from A50 A
				full join #本年非新建里程_B N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
				full join #上年到达里程_B   O on (A.A0102=O.A0102 AND A.K0101=O.K0101 and n.k0108=o.k0108)
			where A.a0102 like '4206%'

insert  #linshi_B(a0102,ha0203,k0101,k6003,k6002,A0534,a0522,k0116,k0108)
select a0102,ha0203,rtrim(K0101)+' '+rtrim(K0112),rtrim(cast (k0108 as char(10)))+'-'+rtrim(cast (k0109 as char(10))),
rtrim((a0535)),漫水工程,涵洞,rtrim(k0116),k0108 from  #本年改建里程_A
------更新
update #linshi_B set ha0203=case when left(k0101,1) in ('G','H') then case when len(RTRIM(K0101))>9  then '一般国道' else '国家高速公路' end else 
					case when left(k0101,1) in ('s','T') then '省道' else
					      case when left(k0101,1) = 'X' then '县道' else
						  case when left(k0101,1) = 'y' then '乡道' else
						  case when left(k0101,1) = 'zy' then '专用公路' else
                          case when left(k0101,1) = 'Z' then '专用道'  else 
						  '村道' end end end end end end
update #linshi_B set k0108=99999.999 where k0108 is null
update #linshi_B set k6001=99999.999 where k6001 is null
update #linshi_B set k6003=99999.999 where k6003 is null
                


SELECT ''
-----------------------------------------------------------------------------

/*不显示零*/
----------------------
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

/*不显示零*/
select
	case when grouping(a.objname)=1 then null else 
	case when grouping(b.objname+replace(rtrim(c.objname),'C','ZC')+rtrim(#linshi_B.k0101)+rtrim(#linshi_B.k6003)+rtrim(#linshi_B.k6001)+rtrim(#linshi_B.k0108))=1 then  
	replace(max(rtrim(a.objjc)),'湖北省','') else '    '+replace(max(rtrim(b.objjc)),max(rtrim(a.objjc)),'')
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
	replace(max(rtrim(a.objjc)),'湖北省','') else '    '+replace(max(rtrim(b.objjc)),max(rtrim(a.objjc)),'')
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

/*不显示零*/
select
	case when grouping(left(a0102,6))=1 then null else
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then replace(max(rtrim(d020.objjc)),'湖北省' ,'') else ''
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
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then replace(max(rtrim(d020.objjc)),'湖北省' ,'') else ''
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
/*不显示零*/
select
	case when grouping(left(a0102,5))=1 then null else
		case when grouping(left(a0102,6)+replace(rtrim(c.objname),'C','ZC')+rtrim(k0101)+rtrim(k6003))=1 then  replace(max(left(rtrim(d028.objjc),6)),'湖北省','') else '' 
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

---------改动
select HA0203 
from #linshi_B
group by HA0203 

select *
from #linshi_A
where HA0203 = '专用公路'
-------------
drop table #linshi_B
drop table #linshi_A


