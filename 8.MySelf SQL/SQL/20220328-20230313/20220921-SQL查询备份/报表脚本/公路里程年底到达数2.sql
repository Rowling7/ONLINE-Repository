
--公路里程年底到达数--


--上年年底到达数--
select HA0203,isnull(sum(A0315A),0)+isnull(sum(A0314A),0)+isnull(sum(A0316A),0)+isnull(sum(A0317A),0) "总计",
isnull(sum(A0315A),0)+isnull(sum(A0314A),0) "合计",
isnull(sum(A0315A),0) "沥青混凝土",isnull(sum(A0314A),0) "水泥混凝土",isnull(sum(A0316A),0) "简易铺装路面",isnull(sum(A0317A),0) "未铺装路面",
isnull(sum(A3101),0) "可绿化里程",isnull(sum(A3102),0) "已绿化里程",isnull(sum(A1001),0) "养护里程"

from dbo.A11
 
where A0101 < 2020

group by HA0203

go
--本年改建数--
select HA0203,Ha3219 "方式",isnull(sum(A0315A),0)+isnull(sum(A0314A),0)+isnull(sum(A0316A),0)+isnull(sum(A0317A),0) "总计",
isnull(sum(A0315A),0)+isnull(sum(A0314A),0) "合计",
isnull(sum(A0315A),0) "沥青混凝土",isnull(sum(A0314A),0) "水泥混凝土",isnull(sum(A0316A),0) "简易铺装路面",isnull(sum(A0317A),0) "未铺装路面",
isnull(sum(A3101),0) "可绿化里程",isnull(sum(A3102),0) "已绿化里程",isnull(sum(A1001),0) "养护里程"

from dbo.A11
 
where A0101 = 2020 and HA3219='改建' 

group by HA0203,HA3219

go
--本年新建数--
select HA0203,Ha3219 "方式",isnull(sum(A0315A),0)+isnull(sum(A0314A),0)+isnull(sum(A0316A),0)+isnull(sum(A0317A),0) "总计",
isnull(sum(A0315A),0)+isnull(sum(A0314A),0) "合计",
isnull(sum(A0315A),0) "沥青混凝土",isnull(sum(A0314A),0) "水泥混凝土",isnull(sum(A0316A),0) "简易铺装路面",isnull(sum(A0317A),0) "未铺装路面",
isnull(sum(A3101),0) "可绿化里程",isnull(sum(A3102),0) "已绿化里程",isnull(sum(A1001),0) "养护里程"

from dbo.A11
 
where A0101 = 2020 and HA3219<>'改建' 

group by HA0203,HA3219

go
--本年年底到达数--
select HA0203,isnull(sum(A0315A),0)+isnull(sum(A0314A),0)+isnull(sum(A0316A),0)+isnull(sum(A0317A),0) "总计",
isnull(sum(A0315A),0)+isnull(sum(A0314A),0) "合计",
isnull(sum(A0315A),0) "沥青混凝土",isnull(sum(A0314A),0) "水泥混凝土",isnull(sum(A0316A),0) "简易铺装路面",isnull(sum(A0317A),0) "未铺装路面",
isnull(sum(A3101),0) "可绿化里程",isnull(sum(A3102),0) "已绿化里程",isnull(sum(A1001),0) "养护里程"

from dbo.A11
 
where A0101 <= 2020

group by HA0203