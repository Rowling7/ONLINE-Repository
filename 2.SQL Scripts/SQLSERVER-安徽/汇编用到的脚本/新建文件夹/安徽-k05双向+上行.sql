select  rtrim(a.a0102) a0102,a.ha0102,rtrim(a.k0101) k0101,
[K05�������]=sum(isnull(a.a5008/1000,0)),[k001�������]=b.k0114,'k05˫��+���������k01��̲�һ�£�'
from K05 a
left join (
    select  rtrim(c.a0102) a0102,c.ha0102,rtrim(c.k0101) k0101 ,sum(isnull(c.k0114,0)) k0114
	from k01 c
	where  isnull(c.k0123,'2')='2' and k0124 is null
	and c.A0101 like '#TJND#%'and c.A0102 like '#A0102#%' and c.A0102 like '#GLDW#%'/*GLDW,A0102�����д*/
	group by  c.k0101,rtrim(c.a0102),c.ha0102
    ) b on a.k0101=b.k0101 and rtrim(a.a0102)=rtrim(b.a0102)
where a.a5009 in ('1','2')  
	and A.A0101A like '#TJND#%'and A.A0102 like '#A0102#%' and A.A0102 like '#GLDW#%'/*GLDW,A0102�����д*/
group by  a.k0101,a.a0102,a.ha0102,b.k0114
having sum(isnull(a.a5008/1000,0))<>b.k0114
order by a.k0101 asc


select  rtrim(a.a0102) a0102,a.ha0102,rtrim(a.k0101) k0101,
[K05�������]=sum(isnull(a.a5008/1000,0)),[k001�������]=b.k0114,'k05˫��+���������k01��̲�һ�£�'
from K05 a
left join (
    select  rtrim(c.a0102) a0102,c.ha0102,rtrim(c.k0101) k0101 ,sum(isnull(c.k0114,0)) k0114
	from k01 c
	where  isnull(c.k0123,'2')='2' and k0124 is null
	and c.A0101 like '2022%'--and c.A0102 like '343%' and c.A0102 like '343%'/*GLDW,A0102�����д*/
	group by  c.k0101,rtrim(c.a0102),c.ha0102
    ) b on a.k0101=b.k0101 and rtrim(a.a0102)=rtrim(b.a0102)
where a.a5009 in ('3','2')  
and a.A0101A like '2022%' --and A.A0102 like '343%' and A.A0102 like '343%'/*GLDW,A0102�����д*/
group by  a.k0101,a.a0102,a.ha0102,b.k0114
having sum(isnull(a.a5008/1000,0))<>b.k0114
order by a.k0101 asc

