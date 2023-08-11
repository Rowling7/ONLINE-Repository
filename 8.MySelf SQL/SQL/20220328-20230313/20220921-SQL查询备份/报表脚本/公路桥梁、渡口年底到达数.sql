
--公路桥梁、渡口年底到达数--

--上年年底到达数--
select HA0203,
isnull(sum(A0511),0)+isnull(sum(A0513),0)+isnull(sum(A0515),0)+isnull(sum(A0517),0) "总座",
isnull(sum(A0512),0)+isnull(sum(A0514),0)+isnull(sum(A0516),0)+isnull(sum(A0518),0) "总米",
isnull(sum(A0519),0) "互通座",isnull(sum(A0520),0) "互通米",
isnull(sum(A0511),0) "特大座",isnull(sum(A0512),0) "特大米",
isnull(sum(A0513),0) "大座",isnull(sum(A0514),0) "大米",isnull(sum(A0515),0) "中座",
isnull(sum(A0516),0) "中米",isnull(sum(A0517),0) "小座",isnull(sum(A0518),0) "小米",
isnull(sum(A0701),0) "渡口",isnull(sum(A0702),0) "机动渡口"

from dbo.A11
 
where A0101 < 2020

group by HA0203

go
--本年改建数--
select HA0203,Ha3219 "方式",
isnull(sum(A0511),0)+isnull(sum(A0513),0)+isnull(sum(A0515),0)+isnull(sum(A0517),0) "总座",
isnull(sum(A0512),0)+isnull(sum(A0514),0)+isnull(sum(A0516),0)+isnull(sum(A0518),0) "总米",
isnull(sum(A0519),0) "互通座",isnull(sum(A0520),0) "互通米",
isnull(sum(A0511),0) "特大座",isnull(sum(A0512),0) "特大米",
isnull(sum(A0513),0) "大座",isnull(sum(A0514),0) "大米",isnull(sum(A0515),0) "中座",
isnull(sum(A0516),0) "中米",isnull(sum(A0517),0) "小座",isnull(sum(A0518),0) "小米",
isnull(sum(A0701),0) "渡口",isnull(sum(A0702),0) "机动渡口"

from dbo.A11
 
where A0101 = 2020 and HA3219='改建' 

group by HA0203,HA3219

go
--本年新建数--
select HA0203,Ha3219 "方式",
isnull(sum(A0511),0)+isnull(sum(A0513),0)+isnull(sum(A0515),0)+isnull(sum(A0517),0) "总座",
isnull(sum(A0512),0)+isnull(sum(A0514),0)+isnull(sum(A0516),0)+isnull(sum(A0518),0) "总米",
isnull(sum(A0519),0) "互通座",isnull(sum(A0520),0) "互通米",
isnull(sum(A0511),0) "特大座",isnull(sum(A0512),0) "特大米",
isnull(sum(A0513),0) "大座",isnull(sum(A0514),0) "大米",isnull(sum(A0515),0) "中座",
isnull(sum(A0516),0) "中米",isnull(sum(A0517),0) "小座",isnull(sum(A0518),0) "小米",
isnull(sum(A0701),0) "渡口",isnull(sum(A0702),0) "机动渡口"

from dbo.A11
 
where A0101 = 2020 and HA3219<>'改建' 

group by HA0203,HA3219

go
--本年年底到达数--
select HA0203,
isnull(sum(A0511),0)+isnull(sum(A0513),0)+isnull(sum(A0515),0)+isnull(sum(A0517),0) "总座",
isnull(sum(A0512),0)+isnull(sum(A0514),0)+isnull(sum(A0516),0)+isnull(sum(A0518),0) "总米",
isnull(sum(A0519),0) "互通座",isnull(sum(A0520),0) "互通米",
isnull(sum(A0511),0) "特大座",isnull(sum(A0512),0) "特大米",
isnull(sum(A0513),0) "大座",isnull(sum(A0514),0) "大米",isnull(sum(A0515),0) "中座",
isnull(sum(A0516),0) "中米",isnull(sum(A0517),0) "小座",isnull(sum(A0518),0) "小米",
isnull(sum(A0701),0) "渡口",isnull(sum(A0702),0) "机动渡口"

from dbo.A11
 
where A0101 <= 2020

group by HA0203