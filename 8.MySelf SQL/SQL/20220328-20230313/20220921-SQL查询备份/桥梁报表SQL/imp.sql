USE [HRP-DBMS2015]

--select * from k060
--30-2桥梁汇总(按路线)
select rtrim(k0112) k0112,
	   (case when left(rtrim(k0101),1)='H' then replace(rtrim(k0101),'H','G') else 
		case when left(rtrim(k0101),1)='T' then replace(rtrim(k0101),'T','S') else 
		 case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end) k0101,
       sum(case when k6007='1' then 1 else 0 end) 特大座数,
	   sum(case when k6007='1' then k6008 else 0 end) 特大延米,
       sum(case when k6007='2' then 1 else 0 end) 大桥座数,
	   sum(case when k6007='2' then k6008 else 0 end) 大桥延米,
       sum(case when k6007='3' then 1 else 0 end) 中桥座数,
	   sum(case when k6007='3' then k6008 else 0 end) 中桥延米,
       sum(case when k6007='4' then 1 else 0 end) 小桥座数,
	   sum(case when k6007='4' then k6008 else 0 end) 小桥延米,
       sum(case when k6007 in ('1','2','3','4') then 1 else 0 end) 总座数,
	   sum(case when k6007 in ('1','2','3','4') then k6008 else 0 end) 总延米
from k060
group by rtrim(k0112),(case when left(rtrim(k0101),1)='H' then replace(rtrim(k0101),'H','G') else 
						case when left(rtrim(k0101),1)='T' then replace(rtrim(k0101),'T','S') else 
						 case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end) with rollup
having grouping(rtrim(k0112))=grouping((case when left(rtrim(k0101),1)='H' then replace(rtrim(k0101),'H','G') else 
						case when left(rtrim(k0101),1)='T' then replace(rtrim(k0101),'T','S') else 
						 case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end))
order by replace(left((case when left(rtrim(k0101),1)='H' then replace(rtrim(k0101),'H','G') else 
		                case when left(rtrim(k0101),1)='T' then replace(rtrim(k0101),'T','S') else 
		                 case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end),1),'C','ZZ')

--31-全省公路桥梁汇总表
select rtrim(a.a0102) a0102,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) 总座数,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) 总延米,
       sum(case when a.k6062 ='1' then 1 else 0 end) 互通式座数,
	   sum(case when a.k6062 ='1' then a.k6008 else 0 end) 互通式延米,	
       sum(case when a.k6028 in ('4','5') then 1 else 0 end) 危桥座数,
	   sum(case when a.k6028 in ('4','5') then a.k6008 else 0 end) 危桥延米,	
       sum(case when a.k6004 ='1' then 1 else 0 end) 永久性座数,
	   sum(case when a.k6004 ='1' then a.k6008 else 0 end) 永久性延米, 
       sum(case when a.k6004 ='2' then 1 else 0 end) 半永久性座数,
	   sum(case when a.k6004 ='2' then a.k6008 else 0 end) 半永久性延米, 
       sum(case when a.k6004 ='3' then 1 else 0 end) 临时性座数,
	   sum(case when a.k6004 ='3' then a.k6008 else 0 end) 临时性延米,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) 总座数2,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) 总延米2,
       sum(case when a.k6007='1' then 1 else 0 end) 特大座数,
	   sum(case when a.k6007='1' then a.k6008 else 0 end) 特大延米,
       sum(case when a.k6007='2' then 1 else 0 end) 大桥座数,
	   sum(case when a.k6007='2' then a.k6008 else 0 end) 大桥延米,
       sum(case when a.k6007='3' then 1 else 0 end) 中桥座数,
	   sum(case when a.k6007='3' then a.k6008 else 0 end) 中桥延米,
       sum(case when a.k6007='4' then 1 else 0 end) 小桥座数,
	   sum(case when a.k6007='4' then a.k6008 else 0 end) 小桥延米
from k060 a 
group by rtrim(a.a0102),rtrim(a.ha0102) with rollup
having grouping(rtrim(a.a0102))=grouping(rtrim(a.ha0102))
order by rtrim(a.a0102)

--隧道
--select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 group by rtrim(a0102),rtrim(ha0102)
select rtrim(b.a0102) a0102,
	   rtrim(b.ha0102) ha0102,
       sum(case when a.k6304 in ('1','2','3','4') then 1 else 0 end) 总隧道数,
	   sum(case when a.k6304 in ('1','2','3','4') then a.k6305 else 0 end) 总隧道延米数
from k063 a right join (select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 group by rtrim(a0102),rtrim(ha0102)) b on rtrim(a.a0102)=rtrim(b.a0102)
group by rtrim(b.a0102),rtrim(b.ha0102) with rollup
having grouping(rtrim(b.a0102))=grouping(rtrim(b.ha0102))
order by rtrim(b.a0102)

--32-桥梁年底到达数汇总(国高网无H)
--国道
select rtrim(a.a0102) a0102,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) 总座数,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) 总延米,
       sum(case when a.k6062 ='1' then 1 else 0 end) 互通式座数,
	   sum(case when a.k6062 ='1' then a.k6008 else 0 end) 互通式延米,	
	   '',
       sum(case when a.k6028 in ('4','5') then 1 else 0 end) 危桥座数,
	   sum(case when a.k6028 in ('4','5') then a.k6008 else 0 end) 危桥延米,	
       sum(case when a.k6004 ='1' then 1 else 0 end) 永久性座数,
	   sum(case when a.k6004 ='1' then a.k6008 else 0 end) 永久性延米, 
       sum(case when a.k6004 ='2' then 1 else 0 end) 半永久性座数,
	   sum(case when a.k6004 ='2' then a.k6008 else 0 end) 半永久性延米, 
       sum(case when a.k6004 ='3' then 1 else 0 end) 临时性座数,
	   sum(case when a.k6004 ='3' then a.k6008 else 0 end) 临时性延米,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) 总座数2,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) 总延米2,
       sum(case when a.k6007='1' then 1 else 0 end) 特大座数,
	   sum(case when a.k6007='1' then a.k6008 else 0 end) 特大延米,
       sum(case when a.k6007='2' then 1 else 0 end) 大桥座数,
	   sum(case when a.k6007='2' then a.k6008 else 0 end) 大桥延米,
       sum(case when a.k6007='3' then 1 else 0 end) 中桥座数,
	   sum(case when a.k6007='3' then a.k6008 else 0 end) 中桥延米,
       sum(case when a.k6007='4' then 1 else 0 end) 小桥座数,
	   sum(case when a.k6007='4' then a.k6008 else 0 end) 小桥延米
from k060 a 
where left(a.k0101,1) = 'G'
group by rtrim(a.a0102),rtrim(a.ha0102) with rollup
having grouping(rtrim(a.a0102))=grouping(rtrim(a.ha0102))
order by rtrim(a.a0102)

--隧道G高无H
--select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 group by rtrim(a0102),rtrim(ha0102)
select rtrim(b.a0102) a0102,
	   rtrim(b.ha0102) ha0102,
       sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) = 'G' then 1 else 0 end) 总隧道数,
	   sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) = 'G' then a.k6305 else 0 end) 总隧道延米数
from k063 a right join (select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 where left(k0101,1) = 'G' group by rtrim(a0102),rtrim(ha0102)) b on rtrim(a.a0102)=rtrim(b.a0102)
--where left(a.k0101,1) = 'G'
group by rtrim(b.a0102),rtrim(b.ha0102) with rollup
having grouping(rtrim(b.a0102))=grouping(rtrim(b.ha0102))
order by rtrim(b.a0102)

--省道

select rtrim(a.a0102) a0102,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) 总座数,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) 总延米,
       sum(case when a.k6062 ='1' then 1 else 0 end) 互通式座数,
	   sum(case when a.k6062 ='1' then a.k6008 else 0 end) 互通式延米,	
	   '',
       sum(case when a.k6028 in ('4','5') then 1 else 0 end) 危桥座数,
	   sum(case when a.k6028 in ('4','5') then a.k6008 else 0 end) 危桥延米,	
       sum(case when a.k6004 ='1' then 1 else 0 end) 永久性座数,
	   sum(case when a.k6004 ='1' then a.k6008 else 0 end) 永久性延米, 
       sum(case when a.k6004 ='2' then 1 else 0 end) 半永久性座数,
	   sum(case when a.k6004 ='2' then a.k6008 else 0 end) 半永久性延米, 
       sum(case when a.k6004 ='3' then 1 else 0 end) 临时性座数,
	   sum(case when a.k6004 ='3' then a.k6008 else 0 end) 临时性延米,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) 总座数2,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) 总延米2,
       sum(case when a.k6007='1' then 1 else 0 end) 特大座数,
	   sum(case when a.k6007='1' then a.k6008 else 0 end) 特大延米,
       sum(case when a.k6007='2' then 1 else 0 end) 大桥座数,
	   sum(case when a.k6007='2' then a.k6008 else 0 end) 大桥延米,
       sum(case when a.k6007='3' then 1 else 0 end) 中桥座数,
	   sum(case when a.k6007='3' then a.k6008 else 0 end) 中桥延米,
       sum(case when a.k6007='4' then 1 else 0 end) 小桥座数,
	   sum(case when a.k6007='4' then a.k6008 else 0 end) 小桥延米
from k060 a 
where left(a.k0101,1) = 'S'
group by rtrim(a.a0102),rtrim(a.ha0102) with rollup
having grouping(rtrim(a.a0102))=grouping(rtrim(a.ha0102))
order by rtrim(a.a0102)

--隧道
--select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 group by rtrim(a0102),rtrim(ha0102)
select rtrim(b.a0102) a0102,
	   rtrim(b.ha0102) ha0102,
       sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) = 'S' then 1 else 0 end) 总隧道数,
	   sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) = 'S' then a.k6305 else 0 end) 总隧道延米数
from k063 a right join (select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 where left(k0101,1) = 'S' group by rtrim(a0102),rtrim(ha0102)) b on rtrim(a.a0102)=rtrim(b.a0102)
--where left(a.k0101,1) = 'G'
group by rtrim(b.a0102),rtrim(b.ha0102) with rollup
having grouping(rtrim(b.a0102))=grouping(rtrim(b.ha0102))
order by rtrim(b.a0102)

--县道，专道

select rtrim(a.a0102) a0102,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) 总座数,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) 总延米,
       sum(case when a.k6062 ='1' then 1 else 0 end) 互通式座数,
	   sum(case when a.k6062 ='1' then a.k6008 else 0 end) 互通式延米,	
	   '',
       sum(case when a.k6028 in ('4','5') then 1 else 0 end) 危桥座数,
	   sum(case when a.k6028 in ('4','5') then a.k6008 else 0 end) 危桥延米,	
       sum(case when a.k6004 ='1' then 1 else 0 end) 永久性座数,
	   sum(case when a.k6004 ='1' then a.k6008 else 0 end) 永久性延米, 
       sum(case when a.k6004 ='2' then 1 else 0 end) 半永久性座数,
	   sum(case when a.k6004 ='2' then a.k6008 else 0 end) 半永久性延米, 
       sum(case when a.k6004 ='3' then 1 else 0 end) 临时性座数,
	   sum(case when a.k6004 ='3' then a.k6008 else 0 end) 临时性延米,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) 总座数2,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) 总延米2,
       sum(case when a.k6007='1' then 1 else 0 end) 特大座数,
	   sum(case when a.k6007='1' then a.k6008 else 0 end) 特大延米,
       sum(case when a.k6007='2' then 1 else 0 end) 大桥座数,
	   sum(case when a.k6007='2' then a.k6008 else 0 end) 大桥延米,
       sum(case when a.k6007='3' then 1 else 0 end) 中桥座数,
	   sum(case when a.k6007='3' then a.k6008 else 0 end) 中桥延米,
       sum(case when a.k6007='4' then 1 else 0 end) 小桥座数,
	   sum(case when a.k6007='4' then a.k6008 else 0 end) 小桥延米
from k060 a 
where left(a.k0101,1) in( 'X','Z')
group by rtrim(a.a0102),rtrim(a.ha0102) with rollup
having grouping(rtrim(a.a0102))=grouping(rtrim(a.ha0102))
order by rtrim(a.a0102)

--隧道
--select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 group by rtrim(a0102),rtrim(ha0102)
select rtrim(b.a0102) a0102,
	   rtrim(b.ha0102) ha0102,
       sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) in( 'X','Z') then 1 else 0 end) 总隧道数,
	   sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) in( 'X','Z') then a.k6305 else 0 end) 总隧道延米数
from k063 a right join (select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 where left(k0101,1) in( 'X','Z') group by rtrim(a0102),rtrim(ha0102)) b on rtrim(a.a0102)=rtrim(b.a0102)
--where left(a.k0101,1) = 'G'
group by rtrim(b.a0102),rtrim(b.ha0102) with rollup
having grouping(rtrim(b.a0102))=grouping(rtrim(b.ha0102))
order by rtrim(b.a0102)


--国高，省道的下行线
select rtrim(a.a0102) a0102,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) 总座数,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) 总延米,
       sum(case when a.k6062 ='1' then 1 else 0 end) 互通式座数,
	   sum(case when a.k6062 ='1' then a.k6008 else 0 end) 互通式延米,	
	   '',
       sum(case when a.k6028 in ('4','5') then 1 else 0 end) 危桥座数,
	   sum(case when a.k6028 in ('4','5') then a.k6008 else 0 end) 危桥延米,	
       sum(case when a.k6004 ='1' then 1 else 0 end) 永久性座数,
	   sum(case when a.k6004 ='1' then a.k6008 else 0 end) 永久性延米, 
       sum(case when a.k6004 ='2' then 1 else 0 end) 半永久性座数,
	   sum(case when a.k6004 ='2' then a.k6008 else 0 end) 半永久性延米, 
       sum(case when a.k6004 ='3' then 1 else 0 end) 临时性座数,
	   sum(case when a.k6004 ='3' then a.k6008 else 0 end) 临时性延米,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) 总座数2,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) 总延米2,
       sum(case when a.k6007='1' then 1 else 0 end) 特大座数,
	   sum(case when a.k6007='1' then a.k6008 else 0 end) 特大延米,
       sum(case when a.k6007='2' then 1 else 0 end) 大桥座数,
	   sum(case when a.k6007='2' then a.k6008 else 0 end) 大桥延米,
       sum(case when a.k6007='3' then 1 else 0 end) 中桥座数,
	   sum(case when a.k6007='3' then a.k6008 else 0 end) 中桥延米,
       sum(case when a.k6007='4' then 1 else 0 end) 小桥座数,
	   sum(case when a.k6007='4' then a.k6008 else 0 end) 小桥延米
from k060 a 
where left(a.k0101,1) in ('H','T')
group by rtrim(a.a0102),rtrim(a.ha0102) with rollup
having grouping(rtrim(a.a0102))=grouping(rtrim(a.ha0102))
order by rtrim(a.a0102)

--隧道--加T78的一个隧道，42A74，湖北交投武黄高速公路运营管理有限公司，T78，枪担山隧道
--select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 group by rtrim(a0102),rtrim(ha0102)
select rtrim(b.a0102) a0102,
	   rtrim(b.ha0102) ha0102,
       sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) in ('H','T') then 1 else 0 end) 总隧道数,
	   sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) in ('H','T') then a.k6305 else 0 end) 总隧道延米数
from k063 a right join (
select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 where left(k0101,1) in ('H','T') group by rtrim(a0102),rtrim(ha0102)
  union (select rtriM(a0102) a0102,rtrim(ha0102) ha0102 from k063 where k0101='T78' and a0102='42A74')
) b on rtrim(a.a0102)=rtrim(b.a0102)
--where left(a.k0101,1) = 'G'
group by rtrim(b.a0102),rtrim(b.ha0102) with rollup
having grouping(rtrim(b.a0102))=grouping(rtrim(b.ha0102))
order by rtrim(b.a0102)

--select rtriM(a0102) a0102,rtrim(ha0102) ha0102,1,k6305 from k063 where k0101='T78' and a0102='42A74'