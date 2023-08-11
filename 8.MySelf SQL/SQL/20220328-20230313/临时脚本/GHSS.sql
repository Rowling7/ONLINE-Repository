--GHSS
--21.4
SELECT  C.A0102,C.HA0102,C.K0101,C.A5008 AS k04B里程,C.K0114 AS K001里程 ,C.DIFF
FROM(
SELECT  
       RTRIM(k04B.A0102) A0102 ,k04B.HA0102,RTRIM(k04B.K0101) K0101 ,SUM(CASE WHEN k04B.A5008 IS NULL AND k04B.A5009 IN ('1','2') THEN 0 ELSE isnull(k04B.A5008,0)/1000 END ) A5008,K0114,SUM(CASE WHEN k04B.A5008 IS NULL AND k04B.A5009 IN ('1','2') THEN 0 ELSE isnull(k04B.A5008,0)/1000 END )-B.k0114   DIFF
FROM k04B
LEFT  JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
		FROM K01
		WHERE  isnull(k0123,'2')='2' and k0124 is null
			--AND K01.a0101 ='#TJND#' and k01.A0102 like '#A0102#%' and k01.A0102 like '#GLDW#%'
		GROUP BY  K01.K0101
    ) B ON k04B.K0101=B.K0101
WHERE    k04B.A5009 IN ('1','2')  
			--and left(k04B.a0101a,4)='#TJND#' and k04B.A0102 like '#A0102#%' and k04B.A0102 like '#GLDW#%'
GROUP BY  k04B.K0101,k04B.A0102,k04B.HA0102,K0114
) C
WHERE  C.DIFF <>0
ORDER BY K0101



--21.5
SELECT  C.A0102,C.HA0102,C.K0101,C.A5008 AS k04B里程,C.K0114 AS K001里程 
FROM(
SELECT  
       RTRIM(k04B.A0102) A0102 ,k04B.HA0102,RTRIM(k04B.K0101) K0101 ,SUM(CASE WHEN k04B.A5008 IS NULL AND k04B.A5009 IN ('1','3') THEN 0 ELSE isnull(k04B.A5008,0)/1000 END ) A5008,K0114,SUM(CASE WHEN k04B.A5008 IS NULL AND k04B.A5009 IN ('1','3') THEN 0 ELSE isnull(k04B.A5008,0)/1000 END )-B.k0114  DIFF
FROM k04B
LEFT  JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
		FROM K01
		WHERE  isnull(k0123,'2')='2' and k0124 is null AND K01.a0101 ='#TJND#' and k01.A0102 like '#A0102#%' and k01.A0102 like '#GLDW#%'
		GROUP BY  K01.K0101
    ) B ON k04B.K0101=B.K0101
WHERE    k04B.A5009 IN ('1','3')  and left(k04B.a0101a,4)='#TJND#' and k04B.A0102 like '#A0102#%' and k04B.A0102 like '#GLDW#%'
GROUP BY  k04B.K0101,k04B.A0102,k04B.HA0102,K0114
) C
WHERE  C.DIFF <>0
ORDER BY K0101



--19.15
SELECT  C.A0102,C.HA0102,C.K0101,C.A5008 AS k05里程,C.K0114 AS K001里程 
FROM(
SELECT  
       RTRIM(k05.A0102) A0102 ,k05.HA0102,RTRIM(k05.K0101) K0101 ,SUM(CASE WHEN k05.A5008 IS NULL AND k05.A5009 IN ('1','2') THEN 0 ELSE isnull(k05.A5008,0)/1000 END ) A5008,K0114,SUM(CASE WHEN k05.A5008 IS NULL AND k05.A5009 IN ('1','2') THEN 0 ELSE isnull(k05.A5008,0)/1000 END )-B.k0114  DIFF
FROM k05
LEFT JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
		FROM K01
		WHERE  isnull(k0123,'2')='2' and k0124 is null AND K01.a0101 ='#TJND#' and k01.A0102 like '#A0102#%' and k01.A0102 like '#GLDW#%'
		GROUP BY  K01.K0101
    ) B ON k05.K0101=B.K0101
WHERE    k05.A5009 IN ('1','2') and left(k05.a0101a,4)='#TJND#' and k05.A0102 like '#A0102#%' and k05.A0102 like '#GLDW#%'
GROUP BY  k05.K0101,k05.A0102,k05.HA0102,K0114
) C
WHERE  C.DIFF <>0
ORDER BY K0101


--19.16
SELECT  C.A0102,C.HA0102,C.K0101,C.A5008 AS k05里程,C.K0114 AS K001里程 
FROM(
SELECT  
       RTRIM(k05.A0102) A0102 ,k05.HA0102,RTRIM(k05.K0101) K0101 ,SUM(CASE WHEN k05.A5008 IS NULL AND k05.A5009 IN ('1','3') THEN 0 ELSE isnull(k05.A5008,0)/1000 END ) A5008,K0114,SUM(CASE WHEN k05.A5008 IS NULL AND k05.A5009 IN ('1','3') THEN 0 ELSE isnull(k05.A5008,0)/1000 END )-B.k0114  DIFF
FROM k05
LEFT JOIN (
    SELECT  RTRIM(K01.K0101) K0101 ,SUM( isnull(K01.K0114,0)  ) K0114
		FROM K01
		WHERE  isnull(k0123,'2')='2' and k0124 is null AND K01.a0101 ='#TJND#' and k01.A0102 like '#A0102#%' and k01.A0102 like '#GLDW#%'
		GROUP BY  K01.K0101
    ) B ON k05.K0101=B.K0101
WHERE    k05.A5009 IN ('1','3') and left(k05.a0101a,4)='#TJND#' and k05.A0102 like '#A0102#%' and k05.A0102 like '#GLDW#%'
GROUP BY  k05.K0101,k05.A0102,k05.HA0102,K0114
) C
WHERE  C.DIFF <>0
ORDER BY K0101
