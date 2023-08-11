select  rtrim(a.a0102) a0102,a.ha0102,rtrim(a.k0101) k0101,
[k04b表中里程]=sum(isnull(a.a5008/1000,0)),[k001表中里程]=b.k0114
from k04b a
left join (
    select  rtrim(c.k0101) k0101 ,sum(isnull(c.k0114,0)) k0114
	from k001 c
	where  isnull(c.k0123,'2')='2' and k0124 is null
	group by  c.k0101
    ) b on a.k0101=b.k0101
where a.a5009 in ('1','2') 
--!!需要删掉注释!!   and A.A0102 like '#A0102#%' and A.A0102 like '#GLDW#%'/*GLDW,A0102必须大写*/
group by  a.k0101,a.a0102,a.ha0102,b.k0114
having sum(isnull(a.a5008/1000,0))<>b.k0114
order by a.k0101 asc 



select  rtrim(a.a0102) a0102,a.ha0102,rtrim(a.k0101) k0101,
[k04b表中里程]=sum(isnull(a.a5008/1000,0)),[k001表中里程]=b.k0114
from k04b a
left join (
    select  rtrim(c.k0101) k0101 ,sum(isnull(c.k0114,0)) k0114
	from k001 c
	where  isnull(c.k0123,'2')='2' and k0124 is null
	group by  c.k0101
    ) b on a.k0101=b.k0101
where a.a5009 in ('1','3') 
--!!需要删掉注释!!   and A.A0102 like '#A0102#%' and A.A0102 like '#GLDW#%'/*GLDW,A0102必须大写*/
group by  a.k0101,a.a0102,a.ha0102,b.k0114
having sum(isnull(a.a5008/1000,0))<>b.k0114
order by a.k0101 asc 


select a.a0102,a.ha0102,rtrim(a.k0101) k0101,a.k0112,a.k0108,a.k0110,a.k0109,a.k0111,a.k0114,
[k04b路线代码]=b.k0101,
[K04B起点桩号]=b.k0108,
[说明]=isnull(b.k0101,'K04B缺少此数据')
from k001 a
left join 
(select  rtrim(c.k0101) k0101,c.a0102,c.k0108 
from k04b  c
 where  c.a0102 like '#A0102#%' and c.a0102 like '#GLDW#%') b on  rtrim(a.a0102) = rtrim(b.a0102) and rtrim(a.k0101) = rtrim(b.k0101) and isnull(a.k0108,0) = isnull(b.k0108,0)
where  b.a0102 is null and left(a.k0101,1) in ('x','y','c') and isnull(a.k0123,'2')='2' and a.k0124 is null and a.a0102 like '#A0102#%' and a.a0102 like '#GLDW#%'
order by rtrim(a.k0101) 







--12.4 上行
SELECT C.A0102,C.HA0102,C.K0101,C.A5008 AS K04B里程,C.K0114 AS K001里程 
FROM(SELECT  
       RTRIM(K04B.A0102) A0102 ,K04B.HA0102,RTRIM(K04B.K0101) K0101 ,SUM(CASE WHEN K04B.A5008 IS NULL AND K04B.A5009 IN ('1','2') THEN 0 ELSE isnull(K04B.A5008,0)/1000 END ) A5008,K0114,SUM(CASE WHEN K04B.A5008 IS NULL AND K04B.A5009 IN ('1','2') THEN 0 ELSE isnull(K04B.A5008,0)/1000 END )-B.k0114 DIFF
FROM K04B
LEFT JOIN (
    SELECT  RTRIM(K001.K0101) K0101 ,SUM( isnull(K001.K0114,0)  ) K0114
FROM K001
WHERE  isnull(k0123,'2')='2' and k0124 is null
GROUP BY  K001.K0101
    ) B ON K04B.K0101=B.K0101
WHERE    K04B.A5009 IN ('1','2') --and K04B.A0102 like '#A0102#%' and K04B.A0102 like '#GLDW#%'
GROUP BY  K04B.K0101,K04B.A0102,K04B.HA0102,K0114
) C
WHERE  C.DIFF <>0



/*
--上行
select rtrim(a.a0102) a0102 ,a.ha0102 ha0102,rtrim(a.k0101) k0101,sum(isnull(a.a5008/1000,0)) as k04b里程,c.k0114 as k001里程
from k04b a
left join (
    select  rtrim(b.k0101) k0101,sum(isnull(b.k0114,0)) k0114
		from k001 b
		where  isnull(b.k0123,'2')='2' and b.k0124 is null
		group by  b.k0101
    ) c on a.k0101=c.k0101
where a.a5009 in ('1','2') and left(a.k0101,1) in ('X','Y','C') 
--!!需要删掉注释!!  and a.a0102 like '#a0102#%' and a.a0102 like '#GLDW#%'
group by a.k0101,a.a0102,a.ha0102,c.k0114
having sum(isnull(a.a5008/1000,0))<>c.k0114


--下行
select rtrim(a.a0102) a0102 ,a.ha0102 ha0102,rtrim(a.k0101) k0101,sum(isnull(a.a5008/1000,0)) as k04b里程,c.k0114 as k001里程
from k04b a
left join (
    select  rtrim(b.k0101) k0101,sum(isnull(b.k0114,0)) k0114
		from k001 b
		where  isnull(b.k0123,'2')='2' and b.k0124 is null
		group by  b.k0101
    ) c on a.k0101=c.k0101
where a.a5009 in ('1','3') and left(a.k0101,1) in ('X','Y','C') 
--!!需要删掉注释!!  and a.a0102 like '#a0102#%' and a.a0102 like '#GLDW#%'
group by a.k0101,a.a0102,a.ha0102,c.k0114
having sum(isnull(a.a5008/1000,0))<>c.k0114
*/
