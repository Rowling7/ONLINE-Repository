set @n=null,@m=null,@p=null,@x=null,@y=null,@z=null;
SELECT case when T.K04B_K0108<T.K001_K0108 OR  T.k04b_k0109 > T.k001_k0109 OR  T.k04b_k0109<T.K001_K0108 OR  T.K04B_K0108 > T.k001_k0109 then T.k04b_a50_id else NULL end  AS DIFF
from(
select
@n:=k04b.a50_id k04b_a50_id,
@m:=min(k04b.k0108) k04b_k0108,
@p:=max(k04b.k0109) k04b_k0109,
@x:=k001.a50_id k001_a50_id,
@y:=min(k001.k0108) k001_k0108,
@z:=max(k001.k0109) k001_k0109
from k04b
left join k001 on k04b.a50_id=k001.a50_id
group by k04b.a50_id,k001.a50_id
) T
WHERE  case when T.K04B_K0108<T.K001_K0108 OR  T.k04b_k0109 > T.k001_k0109 OR  T.k04b_k0109<T.K001_K0108 OR  T.K04B_K0108 > T.k001_k0109 then T.k04b_a50_id else NULL end  IS NOT NULL;
