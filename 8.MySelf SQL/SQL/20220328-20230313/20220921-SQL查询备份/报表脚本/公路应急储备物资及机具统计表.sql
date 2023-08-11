
--公路应急储备物资及机具统计表--

select HA0102 '管理单位名称',A0102 '管理单位代码',sum(isnull(A2711,0)) '储备中心（点）数量省级',
sum(isnull(A2712,0)) '储备中心（点）数量地市及以下级',sum(isnull(A2702,0)) '储备物资编织袋',
sum(isnull(A2703,0)) '融雪剂',sum(isnull(A2713,0)) '防滑剂',
sum(isnull(A2701,0)) '战备钢梁',sum(isnull(A2714,0)) '机械化桥',
sum(isnull(A2704,0)) '平板车',sum(isnull(A2705,0)) '挖掘机',
sum(isnull(A2706,0)) '推土机',min(A2707) '装载机',
sum(isnull(A2715,0)) '起重机',sum(isnull(A2716,0)) '多功能除雪（冰）车',
sum(isnull(A2710,0)) '推雪铲',sum(isnull(A2717,0)) '除冰滚刷',
sum(isnull(A2708,0)) '抽水机',sum(isnull(A2718,0)) '应急通讯车',
sum(isnull(A2719,0)) '单兵装备',sum(isnull(A2720,0)) '无人机',
sum(isnull(A2709,0)) '发电机组',sum(isnull(A2721,0)) '移动照明设备'

from A27 
where A0101 = '2020' 
group by HA0102,A0102

--and (A.HA0203 = '县道' or A.HA0203 = '乡道' or A.HA0203 = '村道' or A.HA0203 = '专用公路')  


 