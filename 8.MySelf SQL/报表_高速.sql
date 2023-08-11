
select
'合计' gydw,
null mc,
sum(ifnull(a2711,0)) a2711,-- 储备中心（点）数量省级
sum(ifnull(a2712,0)) a2712,-- 储备中心（点）数量地市及以下级
cast(sum(ifnull(a2702,0)) as decimal(18,3)) a2702,-- 编织袋
sum(ifnull(a2703,0)) a2703,-- 融雪剂
sum(ifnull(a2713,0)) a2713,-- 防滑剂
sum(ifnull(a2701,0)) a2701,-- 战备钢梁
sum(ifnull(a2714,0)) a2714,-- 机械化桥
sum(ifnull(a2704,0)) a2704,-- 平板车
sum(ifnull(a2705,0)) a2705,-- 挖掘机
sum(ifnull(a2706,0)) a2706,-- 推土机
sum(ifnull(a2707,0)) a2707,-- 装载机
sum(ifnull(a2715,0)) a2715,-- 起重机
sum(ifnull(a2716,0)) a2716,-- 多功能除雪（冰）车
sum(ifnull(a2710,0)) a2710,-- 推雪铲
sum(ifnull(a2717,0)) a2717,-- 除雪滚刷
sum(ifnull(a2708,0)) a2708,-- 抽水机
sum(ifnull(a2718,0)) a2718,-- 应急通讯车
sum(ifnull(a2719,0)) a2719,-- 单兵装备
sum(ifnull(a2720,0)) a2720,-- 无人机
sum(ifnull(a2709,0)) a2709,-- 发电机组
sum(ifnull(a2721,0)) a2721,-- 移动照明设备
sum(ifnull(a2722,0)) a2722-- 应急抢通宿营车
from a27 
left join b01 b on a27.b01_id=b.b01_id	 
where   b.b0111 like'42A%'
and A27.z0011!=3
and b.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID),'%')

union
select
b.b0101 b0101,
b.b0111 b0111,
sum(ifnull(a2711,0)) a2711,-- 储备中心（点）数量省级
sum(ifnull(a2712,0)) a2712,-- 储备中心（点）数量地市及以下级
cast(sum(ifnull(a2702,0)) as decimal(18,3)) a2702,-- 编织袋
sum(ifnull(a2703,0)) a2703,-- 融雪剂
sum(ifnull(a2713,0)) a2713,-- 防滑剂
sum(ifnull(a2701,0)) a2701,-- 战备钢梁
sum(ifnull(a2714,0)) a2714,-- 机械化桥
sum(ifnull(a2704,0)) a2704,-- 平板车
sum(ifnull(a2705,0)) a2705,-- 挖掘机
sum(ifnull(a2706,0)) a2706,-- 推土机
sum(ifnull(a2707,0)) a2707,-- 装载机
sum(ifnull(a2715,0)) a2715,-- 起重机
sum(ifnull(a2716,0)) a2716,-- 多功能除雪（冰）车
sum(ifnull(a2710,0)) a2710,-- 推雪铲
sum(ifnull(a2717,0)) a2717,-- 除雪滚刷
sum(ifnull(a2708,0)) a2708,-- 抽水机
sum(ifnull(a2718,0)) a2718,-- 应急通讯车
sum(ifnull(a2719,0)) a2719,-- 单兵装备
sum(ifnull(a2720,0)) a2720,-- 无人机
sum(ifnull(a2709,0)) a2709,-- 发电机组
sum(ifnull(a2721,0)) a2721,-- 移动照明设备
sum(ifnull(a2722,0)) a2722-- 移动照明设备
from a27 
left join b01 b on a27.b01_id=b.b01_id and B.z0011!=3
left join  s951 C on a27.a0101=C.s951_id and C.z0011!=3 -- 年限		 
where  b.b0111 like'42A%'  and A27.z0011!=3
AND C.s9532 < :A0101
and b.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID),'%')
group by  b.b0111 