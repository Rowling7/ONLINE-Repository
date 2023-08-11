use [HRP-GHSS2015]
--公路里程年底到达数--

--上年年底到达数--
select HA0203,isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0)+isnull(sum(A0312),0) "总计",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0) "合计",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0) "小计",
isnull(sum(A0304),0) "四车道",isnull(sum(A0305),0) "六车道",isnull(sum(A0306),0) "八车道",isnull(sum(A0307),0) "一级",
isnull(sum(A0308),0) "二级",isnull(sum(A0309),0) "一幅高速",isnull(sum(A0310),0) "三级",sum(A0311) "四级",isnull(sum(A0312),0) "等外公路"

from dbo.A11
 
where A0101 < 2020

group by HA0203

go
--本年改建数--
select HA0203,Ha3219 "方式",isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0)+isnull(sum(A0312),0) "总计",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0) "合计",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0) "小计",
isnull(sum(A0304),0) "四车道",isnull(sum(A0305),0) "六车道",isnull(sum(A0306),0) "八车道",isnull(sum(A0307),0) "一级",isnull(sum(A0308),0) "二级",
isnull(sum(A0309),0) "一幅高速",isnull(sum(A0310),0) "三级",isnull(sum(A0311),0) "四级",isnull(sum(A0312),0) "等外公路"

from dbo.A11
 
where A0101 = 2020 and HA3219='改建' 

group by HA0203,HA3219

go
--本年新建数--
select HA0203,Ha3219 "方式",isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0)+isnull(sum(A0312),0) "总计",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0) "合计",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0) "小计",
isnull(sum(A0304),0) "四车道",isnull(sum(A0305),0) "六车道",isnull(sum(A0306),0) "八车道",isnull(sum(A0307),0) "一级",isnull(sum(A0308),0) "二级",
isnull(sum(A0309),0) "一幅高速",isnull(sum(A0310),0) "三级",isnull(sum(A0311),0) "四级",isnull(sum(A0312),0) "等外公路"

from dbo.A11
 
where A0101 = 2020 and HA3219<>'改建' 

group by HA0203,HA3219

go
--本年年底到达数--
select HA0203,isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0)+isnull(sum(A0312),0) "总计",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0) "合计",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0) "小计",
isnull(sum(A0304),0) "四车道",isnull(sum(A0305),0) "六车道",isnull(sum(A0306),0) "八车道",isnull(sum(A0307),0) "一级",
isnull(sum(A0308),0) "二级",isnull(sum(A0309),0) "一幅高速",isnull(sum(A0310),0) "三级",sum(A0311) "四级",isnull(sum(A0312),0) "等外公路"

from dbo.A11
 
where A0101 <= 2020

group by HA0203