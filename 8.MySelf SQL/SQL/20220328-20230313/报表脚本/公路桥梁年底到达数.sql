
--公路桥梁年底到达数--


--上年年底到达数--
select HA0203,
isnull(sum(A0505),0) "永久座",isnull(sum(A0506),0) "永久米",
isnull(sum(A0503),0) "危桥座",isnull(sum(A0504),0) "危桥米",isnull(sum(A0505),0) "永久座",
isnull(sum(A0506),0) "永久米",isnull(sum(A0507),0) "半永久座",isnull(sum(A0508),0) "半永久米",
isnull(sum(A0509),0) "临时座",isnull(sum(A0510),0) "临时米"

from dbo.A11
 
where A0101 < 2020

group by HA0203

go
--本年改建数--
select HA0203,Ha3219 "方式",isnull(sum(A0505),0) "永久座",isnull(sum(A0506),0) "永久米",
isnull(sum(A0503),0) "危桥座",isnull(sum(A0504),0) "危桥米",isnull(sum(A0505),0) "永久座",
isnull(sum(A0506),0) "永久米",isnull(sum(A0507),0) "半永久座",isnull(sum(A0508),0) "半永久米",
isnull(sum(A0509),0) "临时座",isnull(sum(A0510),0) "临时米"

from dbo.A11
 
where A0101 = 2020 and HA3219='改建' 

group by HA0203,HA3219

go
--本年新建数--
select HA0203,Ha3219 "方式",isnull(sum(A0505),0) "永久座",isnull(sum(A0506),0) "永久米",
isnull(sum(A0503),0) "危桥座",isnull(sum(A0504),0) "危桥米",isnull(sum(A0505),0) "永久座",
isnull(sum(A0506),0) "永久米",isnull(sum(A0507),0) "半永久座",isnull(sum(A0508),0) "半永久米",
isnull(sum(A0509),0) "临时座",isnull(sum(A0510),0) "临时米"

from dbo.A11
 
where A0101 = 2020 and HA3219<>'改建' 

group by HA0203,HA3219

go
--本年年底到达数--
select HA0203,isnull(sum(A0505),0) "永久座",isnull(sum(A0506),0) "永久米",
isnull(sum(A0503),0) "危桥座",isnull(sum(A0504),0) "危桥米",isnull(sum(A0505),0) "永久座",
isnull(sum(A0506),0) "永久米",isnull(sum(A0507),0) "半永久座",isnull(sum(A0508),0) "半永久米",
isnull(sum(A0509),0) "临时座",isnull(sum(A0510),0) "临时米"

from dbo.A11
 
where A0101 <= 2020

group by HA0203