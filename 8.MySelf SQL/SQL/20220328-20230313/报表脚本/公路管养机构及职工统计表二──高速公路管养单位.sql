
--公路管养机构及职工统计表二──高速公路管养单位--
declare @name varchar(100)
declare @num varchar(100)
select @name = A26.HA0102,@num = A26.A0102
from A21,A26
where A26.A0102 =
(case when A21.A0102 like '4290%' then A21.A0102
    else  substring(A21.A0102,1,4) end) 



select @name '管理、经营单位',@num '管理、经营单位代码',sum(isnull(A.A0108,0)) '养护工区',sum(isnull(A.A1118,0)) '养护企业',sum(isnull(A.A0109,0)) '收费公路经营企业',
sum(isnull(A.A0831,0))+sum(isnull(A.A0823,0))+sum(isnull(A.A0833,0))+sum(isnull(A.A0834,0))+sum(isnull(A.A0835,0))+sum(isnull(A.A0821,0))+sum(isnull(A.A0822,0))+sum(isnull(A.A0823,0))+sum(isnull(A.A0836,0))+sum(isnull(A.A0824,0)) '合计',
sum(isnull(A.A0831,0))+sum(isnull(A.A0823,0))+sum(isnull(A.A0833,0))+sum(isnull(A.A0834,0))+sum(isnull(A.A0835,0)) '小计',
sum(isnull(A.A0831,0))+sum(isnull(A.A0823,0))+sum(isnull(A.A0833,0)) '在岗职工',sum(isnull(A.A0803,0)) '工程技术人员',sum(isnull(A.A0831,0)) '事业身份人员',sum(isnull(A.A0823,0)) '合同制人员',
sum(isnull(A.A0833,0)) '临时聘用人员',sum(isnull(A.A0834,0)) '劳务派遣人员',sum(isnull(A.A0835,0)) '其他人员',
sum(isnull(A.A0821,0))+sum(isnull(A.A0822,0))+sum(isnull(A.A0823,0))+sum(isnull(A.A0836,0))+sum(isnull(A.A0824,0)) '小计',
sum(isnull(A.A0821,0))+sum(isnull(A.A0822,0))+sum(isnull(A.A0823,0)) '在岗职工',sum(isnull(A.A0821,0)) '事业身份人员',sum(isnull(A.A0822,0)) '合同制人员',sum(isnull(A.A0823,0)) '临时聘用人员',
sum(isnull(A.A0836,0)) '劳务派遣人员',sum(isnull(A.A0824,0)) '其他人员'

from A21 A,A26

where A.A0101 = '2020' and A.A0108 is not NULL and A26.A0101='2005'

group by A26.HA0102,A26.A0102,A.A0101


/*
and A26.A0102 = ( 
select distinct A26.A0102 
from A21,A26 

)

*/