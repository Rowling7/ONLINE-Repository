/*
select  rtrim(a.a0102) a0102,a.ha0102,rtrim(a.k0101) k0101,
[K03表中里程]=sum(isnull(a.a5008/1000,0)),[k001表中里程]=b.k0114,'k03上行里程与k01里程不一致！'
from K03 a
left join (
    select  rtrim(c.a0102) a0102,c.ha0102,rtrim(c.k0101) k0101 ,sum(isnull(c.k0114,0)) k0114
	from k01 c
	where  isnull(c.k0123,'2')='2' and k0124 is null 
	and c.k0304 in('10','11')
	--and c.k0304 in('22','23','24','30')
	and c.A0101 like '2023%'and c.A0102 like '34%' 
	group by  c.k0101,rtrim(c.a0102),c.ha0102
    ) b on a.k0101=b.k0101 and rtrim(a.a0102)=rtrim(b.a0102)
where a.a5009 in ('3')  
	and A.A0101A like '2023%'and A.A0102 like '34%'
	and a.k0304 in('10','11')
group by  a.k0101,a.a0102,a.ha0102,b.k0114
having sum(isnull(a.a5008/1000,0))<>b.k0114
order by a.k0101 asc

*/

select  rtrim(a.a0102) a0102,a.ha0102,rtrim(a.k0101) k0101,
[K03表中里程]=sum(isnull(a.a5008/1000,0)),[k001表中里程]=b.k0114,'k03上行里程与k01里程不一致！'
from K03 a
left join (
    select  rtrim(c.a0102) a0102,c.ha0102,rtrim(c.k0101) k0101 ,sum(isnull(c.k0114,0)) k0114
	from k01 c
	where  isnull(c.k0123,'2')='2' and k0124 is null 
	--and c.k0304 in('10','11')
	and c.k0304 in('22','23','24','30')
	and c.A0101 like '2023%'and c.A0102 like '34%'
	group by  c.k0101,rtrim(c.a0102),c.ha0102
    ) b on a.k0101=b.k0101 and rtrim(a.a0102)=rtrim(b.a0102)
where a.a5009 in ('2')  
	and A.A0101A like '2023%'and A.A0102 like '34%'
	--and a.k0304 in('10','11')
	and a.k0304 in('22','23','24','30')
group by  a.k0101,a.a0102,a.ha0102,b.k0114
having sum(isnull(a.a5008/1000,0))<>b.k0114
order by a.k0101 asc







