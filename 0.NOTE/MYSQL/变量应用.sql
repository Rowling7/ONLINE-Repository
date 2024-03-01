-- 12.2
set @m = null, @n = null,@zd=null,@pzh=null;
select t2.b0111 '管理单位',
T2.k0101 '路线代码',
t2.pzh '上一路段止点桩号',
t2.k0108 '路段桩号|起点',
t2.k0109 '路段桩号|止点',
t2.diff '差值' from (
select  T.b0111 b0111,
@n := case when @m !=T.K0101 then  0
			when @m = T.K0101  then  cast(T.k0108-@zd as decimal(18,3))
			else 0 end   as diff,
@m :=T.K0101  K0101,
@pzh :=@zd pzh,
@zd :=T.k0109 zd,
k0108 k0108,
T.k0109
from (
SELECT b01.b0111 b0111 ,A50.K0101 K0101,k0108 k0108,
max(k0109) k0109
FROM
k04b
left join b01 on b01.b01_id =k04b.b01_id
left join a50 on A50.a50_id =k04b.a50_id
group by  b01.b0111,A50.K0101,k0108
ORDER BY A50.K0101,k0108
)t
)t2
-- where t2.diff<0 and t2.B0111 like concat( (SELECT b0111 from b01 where b01_id=#{B01CODE}),'%')
where   t2.diff<0 and t2.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%') ;

