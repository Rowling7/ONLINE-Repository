/*不显示零*/
--将长链和实际路段信息导入临时表
if object_id('tempdb..#tempk01') is not null drop table #tempk01
create table #tempk01(col01 varchar(16),col02 varchar(100),col03 varchar(100),col04 varchar(100),col05 varchar(100),col06 varchar(100),col07 numeric(18,3),col08 numeric(18,3),col09 numeric(18,3),col10 varchar(100),col11 varchar(100),col12 varchar(100),col13 varchar(100),col14 varchar(100),col15 varchar(100),col16 varchar(100),col17 numeric(18,2),col18 numeric(18,2),col19 numeric(18,0),col20 varchar(100),col21 varchar(100),col22 varchar(100),col23 varchar(100),col24 varchar(100),col25 varchar(100),col26 numeric(18,3),col27 numeric(18,3),col28 numeric(18,3),col29 numeric(18,3),col30 numeric(18,3),col31 numeric(18,3),col32 numeric(18,3),col33 numeric(18,3),col34 numeric(2,0),col35 varchar(100),col36 numeric(18,0),col38 varchar(100),col39 varchar(100),col41 numeric(18,1),col42 varchar(1000),col43 varchar(1000),col44 numeric(18,3),col45 varchar(16),col46 numeric(18,3),col47 varchar(10),col48 varchar(20),col49 varchar(10),col50 varchar(2),col37 varchar(1000),PX int IDENTITY(1,1))
insert #tempk01( col01,col02,col03,col04,col05,col06,col07,col08,col09,col10,col11,col12,col13,col14,col15,col16,col17,col18,col19,col20,col21,col22,col23,col24,col25,col26,col27,col28,col29,col30,col31,col32,col33,col34,col35,col36,col38,col39,col41,col42,col43,col44,col45,col46,col47,col48,col49,col50,col37  )
select
	[col01] = (case when charindex('D',k0101)=11 then  left(k0101,4) else replace(replace(rtrim(k0101),'000000',''),'420000','') end),	--项目
	[col02] = left(rtrim(a0103),9), --行政区划代码
	[col03] = rtrim(k0112), 	--路线标准名称
	[col04] = rtrim(a7002),  	--路线地方名称	【不出】
	[col05] = rtrim(k0110),		--路段起点名称
	[col06] = rtrim(k0111),		--路段止点名称
	[col07] = k0108, --路段起点桩号
	[col08] = k0109, --路段止点桩号
	[col09] = k0114,
	[col10] = (case when rtrim(k0304)='22' then '12'
			when rtrim(k0304)='23' then '13'
			when rtrim(k0304)='24' then '14' else rtrim(k0304) end),	--技术等级代码
	[col11] = rtrim(hk0304),	--技术等级
	[col12] = isnull(rtrim(hk0126),'否'),	--是否一幅高速
	[col13] = rtrim(k0404),		--车道分类代码
	[col14] = rtrim(hk0404),	--车道分类
	[col15] = rtrim(k5104),		--面层类型代码
	[col16] = rtrim(hk5104),	--面层类型
	[col17] = k4002,		--路基宽度
	[col18] = k5404,		--路面宽度
	[col19] = k0306,		--设计时速
	[col20] = rtrim(k0180),--修建年度
	[col21] = rtrim(k0181),--改建年度
	[col22] = rtrim(k0182),--断链类型
	[col23] = isnull(rtrim(hk0121),'否'),	--是否城管路段
	[col24] = isnull(rtrim(hk0123),'否'),	--是否断头路段
	[col25] = (case when (charindex('D',k0124) = 0 and len(k0124)>9 and left(k0124,1)<>'Z') then left(rtrim(k0124),4) else (case when charindex('D',rtrim(k0124))=11 then left(k0124,4) else rtrim(k0124) end) end), --重复路线代码
	[col26] = k0162,		--重复路段起点桩号
	[col27] = k0163,		--重复路段终点桩号
	[col28] = a1001,		--养护
	[col29] = a0320,		--晴雨通车	【不出】
	[col30] = a3101,		--可绿化
	[col31] = a3102,		--已绿化
	[col32] = a0322,		--GBM		【不出】
	[col33] = a0323,		--文明样板路	【不出】
	[col34] = k9508,		--地貌代码
	[col35] = rtrim(hk9508),	--地貌
	[col36] = a0522,		--涵洞数量
	[col38] = rtrim(hk0128),	--路段收费性质
	[col39] = rtrim(A0130),		--管养单位名称
	[col41] = k5222,		--面层厚度
	[col42] = rtrim(k0155),		--最近一次大中修年度
	[col43] = rtrim(k0156),		--省际出入口标识
	[col44] = A3305,		--年均日交通量
	[col45] = rtrim(K3990),		--国道调整前路线编号
	[col46] = K3992,		--国道桩号传递预留里程
	[col47] = (case when isnull(k0138,'2')='1' then '是' else '否' end),	--是否按干线公路管理接养
	[col48] = rtrim(HK6023),		--抗震等级
	[col49] = replace(rtrim(HK0149),'年',''),		--防洪标准
	[col50] = (case when (charindex('D',k0124) = 0 and rtrim(k0124) is not null) then '否'
			when (charindex('D',k0124) <> 0 and rtrim(k0124) is not null) then '是' else null end),		--重复路段是否长链
    [col37] = ltrim(rtrim(cast(k0199 as varchar(1000))))	--备注

from k01
where   a0102 like '#oyds_单位代码#%' and a0101 = '#oyds_报表年限#'
	and (#oyds_filter#)
/*where   a0102 like '421202%' and a0101 = '2022'
	and (1=1)*/
order by a0102,k0101,k0108

--出路线明细
select
col01,
col02,col03,col05,col06,col07,col08,col09,col10,col11,col12,
(case when col13='A' then '10' else rtrim(col13) end),col15,col16,col17,col18,col41,
col19,col48,col49,col20,col21,col42,col22,col23,col24,col38,col25,col26,col27,col50,
col28,col30,col31,col35,col36,col39,col43,
replace(replace(rtrim(col45),'000000',''),'420000',''),col47,col37
from #tempk01
--where left(col01,1) in ('G','H','S','T','X','Y','C','Z','J')
order by col01,col07
