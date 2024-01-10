if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#t2')) DROP TABLE #T2
if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#t3')) DROP TABLE #T3


SELECT  RTRIM(A0102) A0102,RTRIM(HA0102) HA0102,RTRIM(K0101) K0101,RTRIM(K0105) K0105,left(a0101a,4) a0101a,RTRIM(A5009) A5009,RTRIM(HA5009)HA5009,RTRIM(A0102)+RTRIM(K0101) +RTRIM(K0105) +left(a0101a,4) id

into #t2
from K05
where left(a0101a,4) ='2023' and A5009='2'

SELECT * from #t2
ORDER BY ID

SELECT  RTRIM(A0102) A0102,RTRIM(HA0102) HA0102,RTRIM(K0101) K0101,RTRIM(K0105) K0105,left(a0101a,4) a0101a,RTRIM(A5009) A5009,RTRIM(HA5009)HA5009,RTRIM(A0102)+RTRIM(K0101) +RTRIM(K0105) +left(a0101a,4) id

into #t3
from K05
where left(a0101a,4) ='2023' and A5009='3'

SELECT * from #t3
ORDER BY ID

if exists(select * from tempdb..sysobjects where id=object_id('tempdb..##t2')) DROP TABLE ##T2
if exists(select * from tempdb..sysobjects where id=object_id('tempdb..##t3')) DROP TABLE ##T3

SELECT A.ID +A.A5009 id,A.ID id2,A.HA5009 a2,B.ID id3,B.HA5009 b2
into ##t2
from #T2 A
LEFT JOIN #T3 B ON A.ID=B.ID
WHERE B.ID IS  NULL

SELECT A.ID +A.A5009 id,A.ID id2,A.HA5009 a2,B.ID id3,B.HA5009 b2
into ##t3
from #T3 A
LEFT JOIN #T2 B ON A.ID=B.ID
WHERE B.ID IS  NULL

--SELECT * from ##t
SELECT * from ##t2
SELECT * from ##t3

