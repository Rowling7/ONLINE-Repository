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





select rtrim(a.a0102) a0102,rtrim(a.ha0102) ha0102,rtrim(a.k0101) k0101,sum(isnull(a.a5008/1000,0)) a5008,rtrim(b.k0101) k0101,sum(isnull(b.k0114,0)) k0114
from k04b a
left join k001 b  on rtrim(a.k0101)=rtrim(b.k0101)
where  isnull(b.k0123,'2')='2' and b.k0124 is null and  a.a5009 in ('1','2') 
--!!需要删掉注释!!	and a.A0102 like '#A0102#%' and a.A0102 like '#GLDW#%'
group by rtrim(a.a0102),rtrim(a.ha0102),rtrim(a.k0101),rtrim(b.k0101)
having sum(isnull(a.a5008/1000,0))<>sum(isnull(b.k0114,0))
