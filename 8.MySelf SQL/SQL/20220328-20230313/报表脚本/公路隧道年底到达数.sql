
--公路隧道年底到达数--

--上年年底到达数--
select HA0203,
isnull(sum(A0605),0)+isnull(sum(A0607),0)+isnull(sum(A0609),0)+isnull(sum(A0611),0) "总座",
isnull(sum(A0606),0)+isnull(sum(A0608),0)+isnull(sum(A0610),0)+isnull(sum(A0612),0) "总米",
isnull(sum(A0605),0) "特长数",isnull(sum(A0606),0) "特长米",
isnull(sum(A0607),0) "长数",isnull(sum(A0608),0) "长米",isnull(sum(A0609),0) "中数",
isnull(sum(A0610),0) "中米",isnull(sum(A0611),0) "短数",isnull(sum(A0612),0) "短米"

from dbo.A11
 
where A0101 < 2020

group by HA0203

go
--本年改建数--
select HA0203,Ha3219 "方式",
isnull(sum(A0605),0)+isnull(sum(A0607),0)+isnull(sum(A0609),0)+isnull(sum(A0611),0) "总座",
isnull(sum(A0606),0)+isnull(sum(A0608),0)+isnull(sum(A0610),0)+isnull(sum(A0612),0) "总米",
isnull(sum(A0605),0) "特长数",isnull(sum(A0606),0) "特长米",
isnull(sum(A0607),0) "长数",isnull(sum(A0608),0) "长米",isnull(sum(A0609),0) "中数",
isnull(sum(A0610),0) "中米",isnull(sum(A0611),0) "短数",isnull(sum(A0612),0) "短米"

from dbo.A11
 
where A0101 = 2020 and HA3219='改建' 

group by HA0203,HA3219

go
--本年新建数--
select HA0203,Ha3219 "方式",
isnull(sum(A0605),0)+isnull(sum(A0607),0)+isnull(sum(A0609),0)+isnull(sum(A0611),0) "总座",
isnull(sum(A0606),0)+isnull(sum(A0608),0)+isnull(sum(A0610),0)+isnull(sum(A0612),0) "总米",
isnull(sum(A0605),0) "特长数",isnull(sum(A0606),0) "特长米",
isnull(sum(A0607),0) "长数",isnull(sum(A0608),0) "长米",isnull(sum(A0609),0) "中数",
isnull(sum(A0610),0) "中米",isnull(sum(A0611),0) "短数",isnull(sum(A0612),0) "短米"

from dbo.A11
 
where A0101 = 2020 and HA3219<>'改建' 

group by HA0203,HA3219

go
--本年年底到达数--
select HA0203,
isnull(sum(A0605),0)+isnull(sum(A0607),0)+isnull(sum(A0609),0)+isnull(sum(A0611),0) "总座",
isnull(sum(A0606),0)+isnull(sum(A0608),0)+isnull(sum(A0610),0)+isnull(sum(A0612),0) "总米",
isnull(sum(A0605),0) "特长数",isnull(sum(A0606),0) "特长米",
isnull(sum(A0607),0) "长数",isnull(sum(A0608),0) "长米",isnull(sum(A0609),0) "中数",
isnull(sum(A0610),0) "中米",isnull(sum(A0611),0) "短数",isnull(sum(A0612),0) "短米"

from dbo.A11
 
where A0101 <= 2020

group by HA0203