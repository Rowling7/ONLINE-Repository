-- -----------------------------------> R0027<----------------------------------- --
-- 2023年7月6日

-- 其他信息项
SELECT 
CONCAT(:A0101 ,'年')AS A0101,
CONCAT('单位负责人:',:DWFZR) AS DWFZR,
CONCAT('统计负责人:', :TJFZR) TJFZR,
CONCAT('填报人:', :TBR) TBR, 
CONCAT('填报日期:', :TBRQ) TBRQ, 
B01_ID, B0111 ,CONCAT('管理单位: ',b0101) AS B0101,CONCAT(B0111,'-',b0101) DWDM
from b01 
where b01_id=:B01_ID and z0011!=3
ORDER BY b0111;



-- -----------------------------------> R0027<----------------------------------- --
-- 2023年7月4日

-- 合计
select
max(b.s9533) a3401,-- 类别
max(c.s9533) a3402,-- 具体名录 
'' NULL1,	
sum(ifnull(a3404,0)) a3404,-- 岗位数量	
sum(ifnull(a3405,0)) a3405,-- 脱贫户数量	
cast(sum(ifnull(a3406,0)*ifnull(a3404,0))/nullif(sum(ifnull(a3404,0)),0) as decimal(6,1)) a3406,	-- 平均年龄
cast(sum(ifnull(a3407,0)*ifnull(a3404,0))/nullif(sum(ifnull(a3404,0)),0) as decimal(8,0)) a3407, -- 平均年收入（元）
'' NULL2,
'' NULL3,
'' NULL4
from A24 a
left join b01 on a.B01_ID=b01.B01_ID
left join s951 b on a.a3401=b.s951_id -- 类别
left join s951 c on  a.a3402=c.s951_id -- 具体名录
left join s951 d on a.a0101=d.s951_id -- 年限
-- where d.s9532 = :A0101 and a.z0011!=3
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ),'%')
where d.s9532 = 2022 and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
group by a3401,a3402
order by a3401,a3402;

-- 详细
select
b.s9533 a3401,-- 类别	
c.s9533 a3402,-- 具体名录 
a3403 a3403,-- 主要工作内容	
ifnull(a3404,0) a3404,-- 岗位数量	
ifnull(a3405,0) a3405,-- 脱贫户数量	
ifnull(a3406,0) a3406,-- 平均年龄	
ifnull(a3407,0) a3407,-- 平均年收入（元）	
a3408 a3408,-- 主要资金来源	
cast(a0129 as char) a0129,-- 备注
e.s9532 a0103
from A24 a
left join b01 on a.B01_ID=b01.B01_ID
left join s951 b on a.a3401=b.s951_id -- 类别
left join s951 c on  a.a3402=c.s951_id -- 具体名录
left join s951 d on a.a0101=d.s951_id -- 年限
left join s951 e on  a.a0103=e.s951_id -- 单位代码
-- where d.s9532 = :A0101 and a.z0011!=3
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ),'%')
where d.s9532 = 2022 and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
order by e.s9532 ,b.s9533,c.s9533;



-- -----------------------------------> R0028<----------------------------------- --
-- 2023年7月4日

-- 合计
select
'合计' SUM0,-- 县级总路长行政职务
sum(ifnull(a3411,0)+ifnull(a3412,0)+ifnull(a3413,0)) SUM1,-- 合计	
sum(ifnull(a3411,0)) a3411,-- 县级	
sum(ifnull(a3412,0)) a3412,-- 乡级	
sum(ifnull(a3413,0)) a3413,-- 村级	
sum(ifnull(a3414,0)+ifnull(a3415,0)+ifnull(a3416,0)) SUM2,-- 合计	
sum(ifnull(a3414,0)) a3414,-- 县道	
sum(ifnull(a3415,0)) a3415,-- 乡道	
sum(ifnull(a3416,0)) a3416-- 村道
from A25 A
left join b01 on a.B01_ID=b01.B01_ID
left join s951 d on a.a0101=d.s951_id -- 年限
-- where d.s9532 = :A0101 and a.z0011!=3
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ),'%')
where d.s9532 = 2022 and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%');

-- 详细
select
e.s9532 a0103,-- 县级行政代码	
A3410 A3410,-- 县级总路长行政职务
(ifnull(a3411,0)+ifnull(a3412,0)+ifnull(a3413,0)) SUM1,-- 合计	
ifnull(a3411,0) a3411,-- 县级	
ifnull(a3412,0) a3412,-- 乡级	
ifnull(a3413,0) a3413,-- 村级	
(ifnull(a3414,0)+ifnull(a3415,0)+ifnull(a3416,0)) SUM2,-- 合计	
ifnull(a3414,0) a3414,-- 县道	
ifnull(a3415,0) a3415,-- 乡道	
ifnull(a3416,0) a3416, -- 村道
b.s9533 a3417,-- 是否应用信息化	
cast(a0129 as char) a0129-- 备注
from A25 A
left join b01 on a.B01_ID=b01.B01_ID
left join s951 b on a.a3417=b.s951_id -- 是否应用信息化	
left join s951 d on a.a0101=d.s951_id -- 年限
left join s951 e on  a.a0103=e.s951_id -- 单位代码
-- where d.s9532 = :A0101 and a.z0011!=3
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ),'%')
where d.s9532 = 2022 and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%');


-- -----------------------------------> R0026<----------------------------------- --
-- 2023年7月5日

SELECT
COALESCE(e.s9533,e.s9532,'合计') ha0103,-- 单位代码
COALESCE(e.s9532,e.s9533,'42') a0103,-- 单位名称
-- e.s9533 ha0103,-- 单位名称
-- e.s9532 a0103,-- 单位代码
SUM(ifnull(A0108A,0)) A0108A,-- 养护工区道班
SUM(ifnull(A0118A,0)) A0118A, -- 养护企业(个)
SUM(ifnull(A0119A,0)) A0119A,-- 收费公路经营企业(个)
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)+ifnull(A0834a,0)+ifnull(A0835a,0)+
	ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)+ifnull(A0836a,0)+ifnull(A0824a,0)) sum2, -- 合计
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)+ifnull(A0834a,0)+ifnull(A0835a,0)) sum3, -- 小计  
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)) sum6, -- 在岗职工
sum(ifnull(A0830a,0)) A0830a,	-- 工程技术人员
sum(ifnull(A0831a,0)) A0831a,	-- 事业身份人员
sum(ifnull(A0832a,0)) A0832a,	-- 合同制人员
sum(ifnull(A0833a,0)) A0833a,	-- 临时聘用人员
sum(ifnull(A0834a,0)) A0834a,	-- 劳务派遣人员
sum(ifnull(A0835a,0)) A0835a,	-- 其他人员
sum(ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)+ifnull(A0836a,0)+ifnull(A0824a,0)) sum4, -- 工区_在岗职工
sum(ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)) sum5, -- 工区_在岗职工
sum(ifnull(A0821a,0)) A0821a, -- 工区_事业身份人员
sum(ifnull(A0822a,0)) A0822a, -- 工区_合同制人员
sum(ifnull(A0823a,0)) A0823a, -- 工区_临时聘用人员
sum(ifnull(A0836a,0)) A0836a, -- 工区_劳务派遣人员
sum(ifnull(A0824a,0)) A0824a  -- 工区_其他人员
from a21 a
left join b01 on a.B01_ID=b01.B01_ID
left join s951 e on  a.a0103=e.s951_id -- 单位代码
left join s951 d on a.a0101=d.s951_id -- 年限
-- where d.s9532 = :A0101 and a.z0011!=3
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ),'%')
where  d.s9532 = '2022' and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and left (b01.b0111,3)<>'42a'  
and (LENGTH(e.s9532)=6 ) 
and e.s9532 not in('420201','420301','420501','420601','420701','421001','421101','421201','421301') 
GROUP BY e.s9532 ,e.s9533 with rollup
having COALESCE(e.s9533,e.s9532,'合计')<>COALESCE(e.s9532,e.s9533,'42');

/*  --合计行
SELECT
-- e.s9533 ha0103,-- 单位名称
-- e.s9532 a0103,-- 单位代码
'合计' ha0103,-- 单位名称
'' a0103,-- 单位代码
SUM(ifnull(A0108A,0)) A0108A,-- 养护工区道班
SUM(ifnull(A0118A,0)) A0118A, -- 养护企业(个)
SUM(ifnull(A0119A,0)) A0119A,-- 收费公路经营企业(个)
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)+ifnull(A0834a,0)+ifnull(A0835a,0)+
	ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)+ifnull(A0836a,0)+ifnull(A0824a,0)) sum2, -- 合计
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)+ifnull(A0834a,0)+ifnull(A0835a,0)) sum3, -- 小计  
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)) sum6, -- 在岗职工
sum(ifnull(A0830a,0)) A0830a,	-- 工程技术人员
sum(ifnull(A0831a,0)) A0831a,	-- 事业身份人员
sum(ifnull(A0832a,0)) A0832a,	-- 合同制人员
sum(ifnull(A0833a,0)) A0833a,	-- 临时聘用人员
sum(ifnull(A0834a,0)) A0834a,	-- 劳务派遣人员
sum(ifnull(A0835a,0)) A0835a,	-- 其他人员
sum(ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)+ifnull(A0836a,0)+ifnull(A0824a,0)) sum4, -- 工区_在岗职工
sum(ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)) sum5, -- 工区_在岗职工
sum(ifnull(A0821a,0)) A0821a, -- 工区_事业身份人员
sum(ifnull(A0822a,0)) A0822a, -- 工区_合同制人员
sum(ifnull(A0823a,0)) A0823a, -- 工区_临时聘用人员
sum(ifnull(A0836a,0)) A0836a, -- 工区_劳务派遣人员
sum(ifnull(A0824a,0)) A0824a  -- 工区_其他人员
from a21 a
left join b01 on a.B01_ID=b01.B01_ID
left join s951 e on  a.a0103=e.s951_id -- 单位代码
left join s951 d on a.a0101=d.s951_id -- 年限
-- where d.s9532 = :A0101 and a.z0011!=3
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ),'%')
where  d.s9532 = '2022' and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and left (b01.b0111,3)<>'42a'  
and (LENGTH(e.s9532)=6 ) 
and e.s9532 not in('420201','420301','420501','420601','420701','421001','421101','421201','421301') ;


*/

/*-- 详细数据

SELECT
e.s9532 a0103,-- 单位代码
e.s9533 ha0103,-- 单位名称
SUM(ifnull(A0108A,0)) A0108A,-- 养护工区道班
SUM(ifnull(A0118A,0)) A0118A, -- 养护企业(个)
SUM(ifnull(A0119A,0)) A0119A,-- 收费公路经营企业(个)
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)+ifnull(A0834a,0)+ifnull(A0835a,0)+
	ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)+ifnull(A0836a,0)+ifnull(A0824a,0)) sum2, -- 合计
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)+ifnull(A0834a,0)+ifnull(A0835a,0)) sum3, -- 小计  
sum(ifnull(A0831a,0)+ifnull(A0832a,0)+ifnull(A0833a,0)) sum6, -- 在岗职工
sum(ifnull(A0830a,0)) A0830a,	-- 工程技术人员
sum(ifnull(A0831a,0)) A0831a,	-- 事业身份人员
sum(ifnull(A0832a,0)) A0832a,	-- 合同制人员
sum(ifnull(A0833a,0)) A0833a,	-- 临时聘用人员
sum(ifnull(A0834a,0)) A0834a,	-- 劳务派遣人员
sum(ifnull(A0835a,0)) A0835a,	-- 其他人员
sum(ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)+ifnull(A0836a,0)+ifnull(A0824a,0)) sum4, -- 工区_在岗职工
sum(ifnull(A0821a,0)+ifnull(A0822a,0)+ifnull(A0823a,0)) sum5, -- 工区_在岗职工
sum(ifnull(A0821a,0)) A0821a, -- 工区_事业身份人员
sum(ifnull(A0822a,0)) A0822a, -- 工区_合同制人员
sum(ifnull(A0823a,0)) A0823a, -- 工区_临时聘用人员
sum(ifnull(A0836a,0)) A0836a, -- 工区_劳务派遣人员
sum(ifnull(A0824a,0)) A0824a  -- 工区_其他人员
from a21 a
left join b01 on a.B01_ID=b01.B01_ID
left join s951 e on  a.a0103=e.s951_id -- 单位代码
left join s951 d on a.a0101=d.s951_id -- 年限
 where  d.s9532 = '2022' and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and left (b01.b0111,3)<>'42a'  
and (LENGTH(e.s9532)=6 ) 
and e.s9532 not in('420201','420301','420501','420601','420701','421001','421101','421201','421301') 
GROUP BY e.s9532 ,e.s9533 


*/


-- -----------------------------------> R0025<----------------------------------- --
-- 2023年7月6日

-- 合计
select 
'合计' GS ,	-- 管理单位名称
 '' BM ,	-- 管理单位代码
SUM(ifnull(A0108 ,0)) A0108 ,	-- 养护工区道班
SUM(ifnull(A1118 ,0)) A1118 , 	-- 养护企业(个)
SUM(ifnull(A0109 ,0)) A0109 ,	-- 收费公路经营企业(个)
sum(ifnull(A0831 ,0)+ifnull(A0832 ,0)+ifnull(A0833 ,0)+ifnull(A0834 ,0)+ifnull(A0835 ,0)+
	ifnull(A0821 ,0)+ifnull(A0822 ,0)+ifnull(A0823 ,0)+ifnull(A0836 ,0)+ifnull(A0824 ,0)) sum0,	-- 合计
sum(ifnull(A0831 ,0)+ifnull(A0832 ,0)+ifnull(A0833 ,0)+ifnull(A0834 ,0)+ifnull(A0835 ,0)) sum1,	-- 小计  
sum(ifnull(A0831 ,0)+ifnull(A0832 ,0)+ifnull(A0833 ,0)) sum2 , -- 在岗职工
sum(ifnull(A0830 ,0)) A0830,	-- 工程技术人员
sum(ifnull(A0831 ,0)) A0831,	-- 事业身份人员
sum(ifnull(A0832 ,0)) A0832,	-- 合同制人员
sum(ifnull(A0833 ,0)) A0833,	-- 临时聘用人员
sum(ifnull(A0834 ,0)) A0834,	-- 劳务派遣人员
sum(ifnull(A0835 ,0)) A0835,	-- 其他人员
sum(ifnull(A0821 ,0)+ifnull(A0822 ,0)+ifnull(A0823 ,0)+ifnull(A0836 ,0)+ifnull(A0824 ,0)) sum3, -- 工区_在岗职工
sum(ifnull(A0821 ,0)+ifnull(A0822 ,0)+ifnull(A0823 ,0)) sum4, -- 工区_在岗职工
sum(ifnull(A0821 ,0)) A0821, -- 工区_事业身份人员
sum(ifnull(A0822 ,0)) A0822, -- 工区_合同制人员
sum(ifnull(A0823 ,0)) A0823, -- 工区_临时聘用人员
sum(ifnull(A0836 ,0)) A0836, -- 工区_劳务派遣人员
sum(ifnull(A0824 ,0)) A0824 -- 工区_其他人员
from a21 a
left join b01 on a.B01_ID=b01.B01_ID
left join s951 d on a.a0101=d.s951_id --  年限
left JOIN XQLXB ON B01.B0111 =G02
left join GYDWB on GS=MC
--  where d.s9532 = :A0101 and a.z0011!=3
--  and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ) ,'%')
where  d.s9532 = '2022' and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912) ,'%')
and left (b01.b0111 ,3)<>'42a'  ;

-- 详细
select 
GS GS ,-- 管理单位名称
BM BM ,-- 管理单位代码
SUM(ifnull(A0108 ,0)) A0108 ,		-- 养护工区道班
SUM(ifnull(A1118 ,0)) A1118 , 	-- 养护企业(个)
SUM(ifnull(A0109 ,0)) A0109 ,		-- 收费公路经营企业(个)
sum(ifnull(A0831 ,0)+ifnull(A0832 ,0)+ifnull(A0833 ,0)+ifnull(A0834 ,0)+ifnull(A0835 ,0)+
	ifnull(A0821 ,0)+ifnull(A0822 ,0)+ifnull(A0823 ,0)+ifnull(A0836 ,0)+ifnull(A0824 ,0)) sum0, -- 合计
sum(ifnull(A0831 ,0)+ifnull(A0832 ,0)+ifnull(A0833 ,0)+ifnull(A0834 ,0)+ifnull(A0835 ,0)) sum1, -- 小计  
sum(ifnull(A0831 ,0)+ifnull(A0832 ,0)+ifnull(A0833 ,0)) sum2 , -- 在岗职工
sum(ifnull(A0830 ,0)) A0830,	-- 工程技术人员
sum(ifnull(A0831 ,0)) A0831,	-- 事业身份人员
sum(ifnull(A0832 ,0)) A0832,	-- 合同制人员
sum(ifnull(A0833 ,0)) A0833,	-- 临时聘用人员
sum(ifnull(A0834 ,0)) A0834,	-- 劳务派遣人员
sum(ifnull(A0835 ,0)) A0835,	-- 其他人员
sum(ifnull(A0821 ,0)+ifnull(A0822 ,0)+ifnull(A0823 ,0)+ifnull(A0836 ,0)+ifnull(A0824 ,0)) sum3, -- 工区_在岗职工
sum(ifnull(A0821 ,0)+ifnull(A0822 ,0)+ifnull(A0823 ,0)) sum4, -- 工区_在岗职工
sum(ifnull(A0821 ,0)) A0821, -- 工区_事业身份人员
sum(ifnull(A0822 ,0)) A0822, -- 工区_合同制人员
sum(ifnull(A0823 ,0)) A0823, -- 工区_临时聘用人员
sum(ifnull(A0836 ,0)) A0836, -- 工区_劳务派遣人员
sum(ifnull(A0824 ,0)) A0824 -- 工区_其他人员
from a21 a
left join b01 on a.B01_ID=b01.B01_ID
left join s951 d on a.a0101=d.s951_id --  年限
left JOIN XQLXB ON B01.B0111 =G02
left join GYDWB on GS=MC
--  where d.s9532 = :A0101 and a.z0011!=3
--  and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ) ,'%')
where  d.s9532 = '2022' and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912) ,'%')
and left (b01.b0111 ,3)<>'42a'  AND GS IS NOT NULL
GROUP BY b0111,GS,bm ;


-- -----------------------------------> R0024<----------------------------------- --
-- 2023年7月6日

-- 详细
select 
b01.b0101 ha0103,-- 单位名称
b01.b0111 a0103,-- 单位代码
SUM(ifnull(A0108b, 0)) A0108b, 	-- 养护工区道班
SUM(ifnull(A0118b, 0)) A0118b,	-- 养护企业(个)
SUM(ifnull(A0119b, 0)) A0119b, 	-- 收费公路经营企业(个)
sum(ifnull(A0831b, 0)+ifnull(A0832b, 0)+ifnull(A0833b, 0)+ifnull(A0834b, 0)+ifnull(A0835b, 0)+
	ifnull(A0821b, 0)+ifnull(A0822b, 0)+ifnull(A0823b, 0)+ifnull(A0836b, 0)+ifnull(A0824b, 0)) sum0,  -- 合计
sum(ifnull(A0831b, 0)+ifnull(A0832b, 0)+ifnull(A0833b, 0)+ifnull(A0834b, 0)+ifnull(A0835b, 0)) sum1,  -- 小计  
sum(ifnull(A0831b, 0)+ifnull(A0832b, 0)+ifnull(A0833b, 0))sum2,  -- 在岗职工
sum(ifnull(A0830b, 0)) A0830b, 	-- 工程技术人员
sum(ifnull(A0831b, 0)) A0831b, 	-- 事业身份人员
sum(ifnull(A0832b, 0)) A0832b, 	-- 合同制人员
sum(ifnull(A0833b, 0)) A0833b, 	-- 临时聘用人员
sum(ifnull(A0834b, 0)) A0834b, 	-- 劳务派遣人员
sum(ifnull(A0835b, 0)) A0835b, 	-- 其他人员
sum(ifnull(A0821b, 0)+ifnull(A0822b, 0)+ifnull(A0823b, 0)+ifnull(A0836b, 0)+ifnull(A0824b, 0)) sum3,  -- 工区_在岗职工
sum(ifnull(A0821b, 0)+ifnull(A0822b, 0)+ifnull(A0823b, 0)) sum4,  -- 工区_在岗职工
sum(ifnull(A0821b, 0)) A0821b,	-- 工区_事业身份人员
sum(ifnull(A0822b, 0)) A0822b,	-- 工区_合同制人员
sum(ifnull(A0823b, 0)) A0823b,	-- 工区_临时聘用人员
sum(ifnull(A0836b, 0)) A0836b,	-- 工区_劳务派遣人员
sum(ifnull(A0824b, 0)) A0824b 	-- 工区_其他人员
from a21 A
left join b01 on a.B01_ID=b01.B01_ID
left join s951 d on a.a0101=d.s951_id -- 年限
left join s951 e on  a.a0103=e.s951_id -- 单位代码
-- where d.s9532 = :A0101 and a.z0011!=3
-- and b01.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID ),'%')
where  d.s9532 = '2022' and a.z0011!=3
and b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and left (b01.b0111,3)='42a'  
GROUP BY b01.b0111,b01.b0101  with rollup;