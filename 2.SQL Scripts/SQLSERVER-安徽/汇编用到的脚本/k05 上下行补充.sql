/*
update k05 set a5009='2' ,ha5009='上行'
from k05
where A5009='1' AND left(a0101a,4)='2023'
*/
if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#t2')) DROP TABLE #T2
if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#t3')) DROP TABLE #T3


SELECT  RTRIM(k05.A0102) A0102,RTRIM(k05.HA0102) HA0102,RTRIM(k05.K0101) K0101,RTRIM(k05.K0105) K0105,left(k05.a0101a,4) a0101a,RTRIM(k05.A5009) A5009,RTRIM(k05.HA5009)HA5009,RTRIM(k05.A0102)+RTRIM(k05.K0101) +RTRIM(k05.K0105) +left(k05.a0101a,4) id

into #t2
from K05
left join k01 b on k05.k0101=b.k0101 and k05.k0105>=b.k0108 and k05.k0105<b.k0109
where ((b.k0304 in('10','11') and A5009='2') or left(k05.k0101,1) in ('x','y','z','c')) and left(k05.a0101a,4) ='2023' 

SELECT * from #t2
ORDER BY ID

SELECT  RTRIM(k05.A0102) A0102,RTRIM(k05.HA0102) HA0102,RTRIM(k05.K0101) K0101,RTRIM(k05.K0105) K0105,left(k05.a0101a,4) a0101a,RTRIM(k05.A5009) A5009,RTRIM(k05.HA5009)HA5009,RTRIM(k05.A0102)+RTRIM(k05.K0101) +RTRIM(k05.K0105) +left(k05.a0101a,4) id

into #t3
from K05
left join k01 b on k05.k0101=b.k0101 and k05.k0105>=b.k0108 and k05.k0105<b.k0109
where ((b.k0304 in('10','11') and A5009='3') or left(k05.k0101,1) in ('x','y','z','c')) and left(k05.a0101a,4) ='2023' 


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


SELECT * from ##t2
SELECT * from ##t3

