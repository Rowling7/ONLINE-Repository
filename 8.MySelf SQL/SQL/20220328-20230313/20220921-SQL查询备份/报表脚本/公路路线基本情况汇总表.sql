use [HRP-GHSS2015]
--公路路线基本情况汇总表--
select A0203 '路线编号',A0102 '行政代码',HA0203 '路线名称',
isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0)+
isnull(sum(A0312),0) '总计',
isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0) '合计',
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0) '小计',
isnull(sum(A0304),0) '四车道',
isnull(sum(A0305),0) '六车道',isnull(sum(A0306),0) '八车道及以上',isnull(sum(A0307),0) '一级',isnull(sum(A0308),0) '二级',isnull(sum(A0309),0) '一幅高速',
isnull(sum(A0310),0) '三级',isnull(sum(A0311),0) '四级',isnull(sum(A0312),0) '等外公路',
isnull(sum(A0314A),0)+isnull(sum(A0315A),0) '小计',
isnull(sum(A0314A),0) '沥青混凝土',isnull(sum(A0315A),0) '水泥混凝土',isnull(sum(A0316A),0) '简易铺装路面',isnull(sum(A0317A),0) '未铺装路面',
isnull(sum(A0323),0) '硬化路面',isnull(sum(A0324),0) '城管里程',isnull(sum(A0321),0) '断头路里程',isnull(sum(K1707),0) '重复里程',
isnull(sum(A1001),0) '养护里程',isnull(sum(A3101),0) '可绿化里程',isnull(sum(A3102),0) '已绿化里程'

from A51

where A0102 != '420701' and (A0203 = 'C' or A0203 = 'Y')

group by A0203,A0102,HA0203

order by A0102



