--  上年年底到达数
select
c.s9532,
sum(ifnull(a0605,0)+ifnull(a0607,0)+ifnull(a0609,0)+ifnull(a0611,0)) as sdzzs, -- 总座数
cast(sum(ifnull(a0606,0)+ifnull(a0608,0)+ifnull(a0610,0)+ifnull(a0612,0))as decimal(18,3)) as sdzym, -- 总延米
sum(ifnull(a0601,0)) a0601,-- 四五类隧道数
cast(sum(ifnull(a0602,0))as decimal(18,3)) a0602,-- 四五类隧道延米
sum(ifnull(a0605,0))  a0605,-- 特长隧道数
cast(sum(ifnull(a0606,0))as decimal(18,3)) a0606,-- 特长隧道延米
sum(ifnull(a0607,0)) a0607,-- 长隧道数
cast(sum(ifnull(a0608,0)) as decimal(18,3))a0608,-- 长隧道延米
sum(ifnull(a0609,0)) a0609,-- 中隧道数
cast(sum(ifnull(a0610,0))as decimal(18,3)) a0610,-- 中隧道延米
sum(ifnull(a0611,0)) a0611,-- 短隧道数
cast(sum(ifnull(a0612,0))as decimal(18,3)) a0612 -- 短隧道延米
from a11 a
left join  s951 b on a.a0101=b.s951_id -- 年限
left join  s951 c on a.a0203=c.s951_id -- 行政等级
left join b01 d on d.b01_id=a.b01_id
where b.s9532 <2022 -- and c.s9532 like 'G%'
and d.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')

GROUP BY c.s9532 with ROLLUP
#HAVING c.s9532 = 'S'

-- 新建
select
c.s9532,
sum(ifnull(a0605,0)+ifnull(a0607,0)+ifnull(a0609,0)+ifnull(a0611,0)) as sdzzs, -- 总座数
cast(sum(ifnull(a0606,0)+ifnull(a0608,0)+ifnull(a0610,0)+ifnull(a0612,0))as decimal(18,3)) as sdzym, -- 总延米
sum(ifnull(a0601,0)) a0601,-- 四五类隧道数
cast(sum(ifnull(a0602,0))as decimal(18,3)) a0602,-- 四五类隧道延米
sum(ifnull(a0605,0))  a0605,-- 特长隧道数
cast(sum(ifnull(a0606,0))as decimal(18,3)) a0606,-- 特长隧道延米
sum(ifnull(a0607,0)) a0607,-- 长隧道数
cast(sum(ifnull(a0608,0)) as decimal(18,3))a0608,-- 长隧道延米
sum(ifnull(a0609,0)) a0609,-- 中隧道数
cast(sum(ifnull(a0610,0))as decimal(18,3)) a0610,-- 中隧道延米
sum(ifnull(a0611,0)) a0611,-- 短隧道数
cast(sum(ifnull(a0612,0))as decimal(18,3)) a0612 -- 短隧道延米
from a11 a
left join  s951 b on a.a0101=b.s951_id -- 年限
left join  s951 c on a.a0203=c.s951_id -- 行政等级
left join b01 d on d.b01_id=a.b01_id
where b.s9532 =2022 -- and c.s9532 like 'G%'
and d.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and a.a3219=1000000291560301
GROUP BY c.s9532 with ROLLUP



-- 改建
select
c.s9532,
sum(ifnull(a0605,0)+ifnull(a0607,0)+ifnull(a0609,0)+ifnull(a0611,0)) as sdzzs, -- 总座数
cast(sum(ifnull(a0606,0)+ifnull(a0608,0)+ifnull(a0610,0)+ifnull(a0612,0))as decimal(18,3)) as sdzym, -- 总延米
sum(ifnull(a0601,0)) a0601,-- 四五类隧道数
cast(sum(ifnull(a0602,0))as decimal(18,3)) a0602,-- 四五类隧道延米
sum(ifnull(a0605,0))  a0605,-- 特长隧道数
cast(sum(ifnull(a0606,0))as decimal(18,3)) a0606,-- 特长隧道延米
sum(ifnull(a0607,0)) a0607,-- 长隧道数
cast(sum(ifnull(a0608,0)) as decimal(18,3))a0608,-- 长隧道延米
sum(ifnull(a0609,0)) a0609,-- 中隧道数
cast(sum(ifnull(a0610,0))as decimal(18,3)) a0610,-- 中隧道延米
sum(ifnull(a0611,0)) a0611,-- 短隧道数
cast(sum(ifnull(a0612,0))as decimal(18,3)) a0612 -- 短隧道延米
from a11 a
left join  s951 b on a.a0101=b.s951_id -- 年限
left join  s951 c on a.a0203=c.s951_id -- 行政等级
left join b01 d on d.b01_id=a.b01_id
where b.s9532 =2022 -- and c.s9532 like 'G%'
and d.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and a.a3219=1000000021972447
GROUP BY c.s9532 with ROLLUP


-- 今年年底到达数
select
c.s9532,
sum(ifnull(a0605,0)+ifnull(a0607,0)+ifnull(a0609,0)+ifnull(a0611,0)) as sdzzs, -- 总座数
cast(sum(ifnull(a0606,0)+ifnull(a0608,0)+ifnull(a0610,0)+ifnull(a0612,0))as decimal(18,3)) as sdzym, -- 总延米
sum(ifnull(a0601,0)) a0601,-- 四五类隧道数
cast(sum(ifnull(a0602,0))as decimal(18,3)) a0602,-- 四五类隧道延米
sum(ifnull(a0605,0))  a0605,-- 特长隧道数
cast(sum(ifnull(a0606,0))as decimal(18,3)) a0606,-- 特长隧道延米
sum(ifnull(a0607,0)) a0607,-- 长隧道数
cast(sum(ifnull(a0608,0)) as decimal(18,3))a0608,-- 长隧道延米
sum(ifnull(a0609,0)) a0609,-- 中隧道数
cast(sum(ifnull(a0610,0))as decimal(18,3)) a0610,-- 中隧道延米
sum(ifnull(a0611,0)) a0611,-- 短隧道数
cast(sum(ifnull(a0612,0))as decimal(18,3)) a0612 -- 短隧道延米
from a11 a
left join  s951 b on a.a0101=b.s951_id -- 年限
left join  s951 c on a.a0203=c.s951_id -- 行政等级
left join b01 d on d.b01_id=a.b01_id
where b.s9532 <=2022 -- and c.s9532 like 'G%'
and d.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')

GROUP BY c.s9532 with ROLLUP