use [HRP-GHSS2015]
--公路灾毁损失和抢通情况统计表--

select HA2819, isnull(sum(A2801),0) '灾毁数量合计1',isnull(sum(A2802),0) '灾毁数量合计2',isnull(sum(A2803),0) '国省干线合计1',isnull(sum(A2804),0) '国省干线合计2',
isnull(sum(A2805),0) '水毁数量1',isnull(sum(A2806),0) '水毁数量2',isnull(sum(A2807),0) '国省干线合计1',isnull(sum(A2808),0) '国省干线合计2',isnull(sum(A2809),0) '涉及金额合计1',
isnull(sum(A2810),0) '涉及金额合计2',isnull(sum(A2811),0) '水毁合计1',isnull(sum(A2812),0) '水毁合计2'
from A28
where A0101A = '2020'
group by HA2819


