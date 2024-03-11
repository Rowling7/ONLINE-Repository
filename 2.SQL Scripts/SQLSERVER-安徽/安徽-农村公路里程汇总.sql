select left(a0103,6) a0103,rtrim(max(ha0103)) ha0103,sum(isnull(k0114,0)) 合计,
[县道]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='X'  THEN K0114 ELSE 0 END),
[乡道]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='Y'  THEN K0114 ELSE 0 END),
[专用公路]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='Z'  THEN K0114 ELSE 0 END),
[村道]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='C'  THEN K0114 ELSE 0 END)

from k01 left join a50 on k01.a0102=a50.a0102 and k01.k0101=a50.k0101
left join dz0101 d1 on left(a0103,6)=d1.objname
where (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' and left(K01.k0101,1) in ('X','Y','Z','C') and k01.A0102 like '34%'
group by left(a0103,6) with rollup

union

select left(a0103,4) a0103,rtrim(d1.objjc) ha0103,sum(isnull(k0114,0)) 合计,
[县道]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='X'  THEN K0114 ELSE 0 END),
[乡道]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='Y'  THEN K0114 ELSE 0 END),
[专用公路]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='Z'  THEN K0114 ELSE 0 END),
[村道]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='C'  THEN K0114 ELSE 0 END)
from k01 left join a50 on k01.a0102=a50.a0102 and k01.k0101=a50.k0101
left join dz0101 d1 on left(a0103,4)=d1.objname
where (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' and left(K01.k0101,1) in ('X','Y','Z','C') and k01.A0102 like '34%'
group by left(a0103,4),rtrim(objjc) with rollup
having grouping(left(a0103,4))=grouping(rtrim(objjc))
order by a0103