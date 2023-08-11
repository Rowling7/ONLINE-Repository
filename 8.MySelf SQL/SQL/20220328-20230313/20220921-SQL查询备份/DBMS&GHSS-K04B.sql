-----------------------------DBMS---------------------------
--12.1
select   k04b.a0102,k04b.ha0102,k04b.k0101,k04b.k0112,
[路线起点桩号]=min(k04b.k0108),
[路线止点桩号]=max(k04b.k0109),
k04b.a5009,k04b.ha5009,
[说明]='K04B路线代码在k001中不存在！'
from k04b
where k04b.k0101 not in (select distinct k0101 from k001)
and  k04b.a0102 like '#A0102#%' and k04b.a0102 like '#GLDW#%'
group by k04b.a0102, k04b.ha0102,k04b.k0101,k04b.k0112,k04b.a5009,k04b.ha5009
union
select  k04b.a0102,k04b.ha0102,k04b.k0101,k04b.k0112,
[路线起点桩号]=min(k04b.k0108),
[路线止点桩号]=max(k04b.k0109),
k04b.a5009,k04b.ha5009,
[说明]='K04B路线桩号不在k001范围内！'
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

--12.3
select a.a0102,a.ha0102,rtrim(a.k0101) k0101,a.k0112,a.k0108,a.k0110,a.k0109,a.k0111,a.k0114,
[错误提示]='路线代码在K04B中不存在！'
from k001 a
left join 
(select  rtrim(c.k0101) k0101,c.a0102,c.k0108 
from k04b  c
 where  c.a0102 like '#A0102#%' and c.a0102 like '#GLDW#%') b on  rtrim(a.a0102) = rtrim(b.a0102) and rtrim(a.k0101) = rtrim(b.k0101) and isnull(a.k0108,0) = isnull(b.k0108,0)
where  b.a0102 is null and left(a.k0101,1) in ('x','y','c') and isnull(a.k0123,'2')='2' and a.k0124 is null and a.a0102 like '#A0102#%' and a.a0102 like '#GLDW#%'
order by rtrim(a.k0101) asc

--12.4
select  rtrim(a.a0102) a0102,a.ha0102,rtrim(a.k0101) k0101,
[k04b表中里程]=sum(isnull(a.a5008/1000,0)),[k001表中里程]=b.k0114
from k04b a
left join (
    select  rtrim(c.a0102) a0102,c.ha0102,rtrim(c.k0101) k0101 ,sum(isnull(c.k0114,0)) k0114
	from k001 c
	where  isnull(c.k0123,'2')='2' and k0124 is null
	and c.A0102 like '#A0102#%' and c.A0102 like '#GLDW#%'/*GLDW,A0102必须大写*/
	group by  c.k0101,rtrim(c.a0102),c.ha0102
    ) b on a.k0101=b.k0101 and rtrim(a.a0102)=rtrim(b.a0102)
where a.a5009 in ('1','2')  
and A.A0102 like '#A0102#%' and A.A0102 like '#GLDW#%'/*GLDW,A0102必须大写*/
group by  a.k0101,a.a0102,a.ha0102,b.k0114
having sum(isnull(a.a5008/1000,0))<>b.k0114
order by a.k0101 asc


--12.5

select  rtrim(a.a0102) a0102,a.ha0102,rtrim(a.k0101) k0101,
[k04b表中里程]=sum(isnull(a.a5008/1000,0)),[k001表中里程]=b.k0114
from k04b a
left join (
    select  rtrim(c.a0102) a0102,c.ha0102,rtrim(c.k0101) k0101 ,sum(isnull(c.k0114,0)) k0114
	from k001 c
	where  isnull(c.k0123,'2')='2' and k0124 is null
	and c.A0102 like '#A0102#%' and c.A0102 like '#GLDW#%'/*GLDW,A0102必须大写*/
	group by  c.k0101,rtrim(c.a0102),c.ha0102
    ) b on a.k0101=b.k0101 and rtrim(a.a0102)=rtrim(b.a0102)
where a.a5009 in ('1','3')  
and A.A0102 like '#A0102#%' and A.A0102 like '#GLDW#%'/*GLDW,A0102必须大写*/
group by  a.k0101,a.a0102,a.ha0102,b.k0114
having sum(isnull(a.a5008/1000,0))<>b.k0114
order by a.k0101 asc




-----------------------------GHSS---------------------------


--28.1
select DISTINCT  'K04B'+'&A0102 ='''+rtrim(cast(K04B.A0102 as varchar))+''' and K0101='''+rtrim(cast(K04B.K0101 as varchar))+''' and K0108='''+rtrim(cast(K04B.K0108 as varchar))+''' and A5009='''+rtrim(cast(K04B.A5009 as varchar))+''' and a0101a='+rtrim(cast(K04B.a0101a as varchar)) as 编辑,
       K04B.A0102,K04B.HA0102,K04B.K0101,K04B.a0101a,K04B.ha0101a,MIN(K04B.K0108) K0108,MAX(K04B.K0109) K0109,K04B.A5009,K04B.HA5009--,MIN(B.K0108) K0108,MAX(B.K0109) K0109
FROM K04B
LEFT JOIN
    (  SELECT  K.K0101,MIN(K.K0108) K0108,MAX(K.K0109) K0109
        FROM K01 K
        GROUP BY K.K0101
        )B ON K04B.K0101 =B.K0101 AND  (K04B.K0109<ISNULL(B.K0108,0) OR K04B.K0108>ISNULL(B.K0109,0) OR K04B.K0108<ISNULL(B.K0108,0) OR K04B.K0109 >ISNULL(B.K0109,0))
WHERE
      (case when left(K04B.K0101,1)='G' AND K04B.A5009='3' then replace(rtrim(K04B.k0101),'G','H') else
		case when left(K04B.K0101,1)='S' AND K04B.A5009='3' then replace(rtrim(K04B.k0101),'S','T') else
		K04B.K0101 end  end)  =B.K0101
AND  left(K04B.a5081,4)='#TJND#' and K04B.A0102 like '#A0102#%' and K04B.A0102 like '#GLDW#%'
GROUP BY K04B.K0101, K04B.A0102, K04B.HA0102,  K04B.K0108,K04B.A5009,K04B.HA5009, K04B.a0101a, K04B.ha0101a
ORDER BY K04B.K0101 ASC


--28.3
SELECT
              'K01'+'&A0102 ='''+rtrim(cast(K01.A0102 as varchar))+''' and K0101='''+rtrim(cast(K01.K0101 as varchar))+''' and A0101='''+rtrim(cast(K01.A0101 as varchar))+''' and K0108 ='+rtrim(cast(K01.K0108 as varchar)) as 编辑,
K01.a0102,k01.ha0102,RTRIM(k01.k0101) K0101,k01.A7002,K01.K0112,k01.k0108,k01.K0110,k01.k0109,k01.K0111,k01.a0101,k01.ha0101,K01.K0114
FROM K01
left JOIN (SELECT  RTRIM(K04B.K0101) K0101,K04B.A0102,K04B.A0101A,K04B.K0108 FROM K04B WHERE   K04B.a0101a ='#TJND#' and K04B.A0102 like '#A0102#%' and K04B.A0102 like '#GLDW#%')B ON  RTRIM(K01.A0102) = RTRIM(B.A0102) AND RTRIM(K01.K0101) = RTRIM(B.K0101) AND ISNULL(K01.K0108,0) = ISNULL(B.K0108,0)
WHERE  B.A0102 IS NULL and left(B.k0101,1) in ('X','Y','C') AND K01.a0101 ='#TJND#' and K01.A0102 like '#A0102#%' and K01.A0102 like '#GLDW#%'
ORDER BY RTRIM(k01.k0101) ASC

--28.4
SELECT     'K04B'+'&A0102 ='''+rtrim(cast(K04B.A0102 as varchar))+''' and K0101='''+rtrim(cast(K04B.K0101 as varchar))+''' and A0101a='''+rtrim(cast(K04B.A0101a as varchar))+'''  and K0108 ='''+rtrim(cast(K04B.K0108 as varchar)) +'''  and A5009 ='+rtrim(cast(K04B.A5009 as varchar)) as 编辑,
       RTRIM(K04B.A0102) A0102 ,K04B.HA0102,RTRIM(K04B.K0101) K0101 ,SUM(CASE WHEN K04B.K0108 IS NULL
    AND K04B.A5009 IN ('1','2') THEN 0 ELSE isnull(K04B.K0108,0) END ) K0108,SUM(CASE WHEN K04B.K0109 IS NULL AND K04B.A5009 IN ('1','2') THEN 0 ELSE isnull(K04B.K0109,0) END ) K0109,SUM(CASE WHEN K04B.A5008 IS NULL AND K04B.A5009 IN ('1','2') THEN 0 ELSE isnull(K04B.A5008,0) END ) A5008,K04B.HA5009
FROM K04B
LEFT JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
FROM K01
WHERE  isnull(k0123,'2')='2' and k0124 is null
GROUP BY  K01.K0101
    ) B ON K04B.K0101=B.K0101
WHERE   B.K0114<>K04B.A5008 AND K04B.A5009 IN ('1','2') AND K04B.a0101A ='#TJND#' and K04B.A0102 like '#A0102#%' and K04B.A0102 like '#GLDW#%'
GROUP BY  K04B.K0101,K04B.A0102,K04B.HA0102, K04B.A0101a, K04B.K0108, K04B.A5009, K04B.HA5009
ORDER BY RTRIM(K04B.K0101) ASC

--28.5
SELECT     'K04B'+'&A0102 ='''+rtrim(cast(K04B.A0102 as varchar))+''' and K0101='''+rtrim(cast(K04B.K0101 as varchar))+''' and A0101a='''+rtrim(cast(K04B.A0101a as varchar))+'''  and K0108 ='''+rtrim(cast(K04B.K0108 as varchar)) +'''  and A5009 ='+rtrim(cast(K04B.A5009 as varchar)) as 编辑,
       RTRIM(K04B.A0102) A0102 ,K04B.HA0102,RTRIM(K04B.K0101) K0101 ,SUM(CASE WHEN K04B.K0108 IS NULL
    AND K04B.A5009 IN ('1','3') THEN 0 ELSE isnull(K04B.K0108,0) END ) K0108,SUM(CASE WHEN K04B.K0109 IS NULL AND K04B.A5009 IN ('1','3') THEN 0 ELSE isnull(K04B.K0109,0) END ) K0109,SUM(CASE WHEN K04B.A5008 IS NULL AND K04B.A5009 IN ('1','3') THEN 0 ELSE isnull(K04B.A5008,0) END ) A5008,K04B.HA5009
FROM K04B
LEFT JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
FROM K01
WHERE  isnull(k0123,'2')='2' and k0124 is null
GROUP BY  K01.K0101
    ) B ON K04B.K0101=B.K0101
WHERE   B.K0114<>K04B.A5008 AND K04B.A5009 IN ('1','3') AND K04B.a0101A ='#TJND#' and K04B.A0102 like '#A0102#%' and K04B.A0102 like '#GLDW#%'
GROUP BY  K04B.K0101,K04B.A0102,K04B.HA0102, K04B.A0101a, K04B.K0108, K04B.A5009, K04B.HA5009
ORDER BY RTRIM(K04B.K0101) ASC



--19.15
SELECT  'K05'+'&A0102 ='''+rtrim(cast(K05.A0102 as varchar))+''' and K0101='''+rtrim(cast(K05.K0101 as varchar))+''' and A0101a='''+rtrim(cast(K05.A0101a as varchar))+'''  and K0105 ='''+rtrim(cast(K05.K0105 as varchar)) +'''  and A5009 ='+rtrim(cast(K05.A5009 as varchar)) as 编辑,
       RTRIM(K05.A0102) A0102 ,K05.HA0102,RTRIM(K05.K0101) K0101 ,SUM(CASE WHEN K05.K0105 IS NULL AND K05.A5009 IN ('1','2') THEN 0 ELSE isnull(K05.K0105,0) END ) K0105,SUM(CASE WHEN K05.K0106 IS NULL AND K05.A5009 IN ('1','2') THEN 0 ELSE isnull(K05.K0106,0) END ) K0106,SUM(CASE WHEN K05.A5008 IS NULL AND K05.A5009 IN ('1','2') THEN 0 ELSE isnull(K05.A5008,0) END ) A5008,K05.HA5009
FROM K05
LEFT JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
FROM K01
WHERE  isnull(k0123,'2')='2' and k0124 is null
GROUP BY  K01.K0101
    ) B ON K05.K0101=B.K0101
WHERE   B.K0114<>K05.A5008 AND K05.A5009 IN ('1','2') AND K05.a0101A ='#TJND#' and K05.A0102 like '#A0102#%' and K05.A0102 like '#GLDW#%'
GROUP BY  K05.K0101,K05.A0102,K05.HA0102, K05.A0101a, K05.K0105, K05.HA5009, K05.A5009
ORDER BY RTRIM(K05.K0101) ASC

--19.16

SELECT  'K05'+'&A0102 ='''+rtrim(cast(K05.A0102 as varchar))+''' and K0101='''+rtrim(cast(K05.K0101 as varchar))+''' and A0101a='''+rtrim(cast(K05.A0101a as varchar))+'''  and K0105 ='''+rtrim(cast(K05.K0105 as varchar)) +'''  and A5009 ='+rtrim(cast(K05.A5009 as varchar)) as 编辑,
       RTRIM(K05.A0102) A0102 ,K05.HA0102,RTRIM(K05.K0101) K0101 ,SUM(CASE WHEN K05.K0105 IS NULL AND K05.A5009 IN ('1','2') THEN 0 ELSE isnull(K05.K0105,0) END ) K0105,SUM(CASE WHEN K05.K0106 IS NULL AND K05.A5009 IN ('1','2') THEN 0 ELSE isnull(K05.K0106,0) END ) K0106,SUM(CASE WHEN K05.A5008 IS NULL AND K05.A5009 IN ('1','2') THEN 0 ELSE isnull(K05.A5008,0) END ) A5008,K05.HA5009
FROM K05
LEFT JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
FROM K01
WHERE  isnull(k0123,'2')='2' and k0124 is null
GROUP BY  K01.K0101
    ) B ON K05.K0101=B.K0101
WHERE   B.K0114<>K05.A5008 AND K05.A5009 IN ('1','3') AND K05.a0101A ='#TJND#' and K05.A0102 like '#A0102#%' and K05.A0102 like '#GLDW#%'
GROUP BY  K05.K0101,K05.A0102,K05.HA0102, K05.A0101a, K05.K0105, K05.HA5009, K05.A5009
ORDER BY RTRIM(K05.K0101) ASC