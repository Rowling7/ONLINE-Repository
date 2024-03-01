
if object_id('tempdb..#TimeTable') is not null drop table #TimeTable 	--记录输入的汇总时间     
CREATE TABLE #TimeTable ( ParamName CHAR(16), ParamValue CHAR(4))
INSERT #TimeTable SELECT '请输入汇总年份:',CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END


		-----------------A01---------------------

		---更新管理单位信息
		update a
		set	A0102 = b.A0102,--管理单位名称   
			HA0102 = b.HA0102,--管理单位名称
			A0103 = b.A0103,--行政区划   
			HA0103 = b.HA0103,--行政区划
			A0121 = b.A0121,--单位负责人
			A0122 = b.A0122,--统计负责人
			A0123 = b.A0123,--电话号码
			A0124 = b.A0124,--传真号码
			A0125 = b.A0125,--地址
			A0126 = b.A0126,--邮政编码
			A0127 = b.A0127,--网址
			A0128 = b.A0128,--电子信箱
			A0129 = b.A0129,--备注
			A0131 = b.A0131,--管养单位性质   
			HA0131 = b.HA0131,--管养单位性质
			A0134 = b.A0133 --填报人
		from A01 a join [HRP-DBMS2014]..A01 b on a.A0102=b.A0102

		--追加管理单位
		insert A01(
		A0102,--管理单位名称   
		HA0102,--管理单位名称
		A0103,--行政区划   
		HA0103,--行政区划
		A0121,--单位负责人
		A0122,--统计负责人
		A0123,--电话号码
		A0124,--传真号码
		A0125,--地址
		A0126,--邮政编码
		A0127,--网址
		A0128,--电子信箱
		A0129,--备注
		A0131,--管养单位性质   
		HA0131,--管养单位性质
		A0134--填报人
		)
		select
		a.A0102,--管理单位名称   
		a.HA0102,--管理单位名称
		a.A0103,--行政区划   
		a.HA0103,--行政区划
		a.A0121,--单位负责人
		a.A0122,--统计负责人
		a.A0123,--电话号码
		a.A0124,--传真号码
		a.A0125,--地址
		a.A0126,--邮政编码
		a.A0127,--网址
		a.A0128,--电子信箱
		a.A0129,--备注
		a.A0131,--管养单位性质   
		a.HA0131,--管养单位性质
		a.A0133 --填报人
		from [HRP-DBMS2014]..A01 a left join A01 b on a.A0102=b.A0102
		where b.A0102 is null
		


		---------------A50------------------
		--更新作废路线的起止点桩号
		update a
		set 
			K0105=0,	--路线起点桩号
			K0106=0		 --路线终点桩号
		from A50 a left join [HRP-DBMS2014]..A50 b on a.A0102=b.A0102 and a.K0101=b.K0101
		where b.A0102 is null
		
		--更新未变更路线的属性
		update a
		set 
		A0203=b.A0203,--行政等级   
		HA0203=b.HA0203,--行政等级
		K0102=b.K0102,--路线全称
		K0103=b.K0103,--路线起点名称
		K0104=b.K0104,--路线终点名称
		K0105=b.K0105,--路线起点桩号
		K0106=b.K0106,--路线终点桩号
		K0112=b.K0112,--路线简称
		K0113=b.K0113,--途经行政区划代码
		K0116=b.K0116,--通车日期
		K0199=b.K0199 --备注
		from A50 a join [HRP-DBMS2014]..A50 b 
		on a.A0102=b.A0102 and a.K0101=b.K0101
		
		--追加新增路线
		insert A50(
		A0102,--管理单位名称   
		HA0102,--管理单位名称
		A0203,--行政等级   
		HA0203,--行政等级
		K0101,--路线代码
		K0102,--路线全称
		K0103,--路线起点名称
		K0104,--路线终点名称
		K0105,--路线起点桩号
		K0106,--路线终点桩号
		K0112,--路线简称
		K0113,--途经行政区划代码
		K0199--备注
		)
		select 
		a.A0102,--管理单位名称   
		a.HA0102,--管理单位名称
		a.A0203,--行政等级   
		a.HA0203,--行政等级
		a.K0101,--路线代码
		a.K0102,--路线全称
		a.K0103,--路线起点名称
		a.K0104,--路线终点名称
		a.K0105,--路线起点桩号
		a.K0106,--路线终点桩号
		a.K0112,--路线简称
		a.K0113,--途经行政区划代码
		a.K0199--备注
		from [HRP-DBMS2014]..A50 a left join A50 b on a.A0102=b.A0102 and a.K0101=b.K0101
		where b.A0102 is null AND LEFT(A.K0101,1)<>'W'


		---------------------K60-------------------------------
		delete K60
		INSERT 	K60
		(A0101,HA0101,  --时间
		A0102,HA0102,  --管理单位名称
		A0103,HA0103,  --行政区划
                K0112,
		A3219,  --建设性质
		A6066,  --桥梁全宽
		K0101,  --路线代码
		K0116,  --通车日期
		K0199,  --备注
		K6001,  --桥梁编号
		K6002,  --桥梁名称
		K6003,  --桥梁中心桩号
		K6004,HK6004,  --按使用年限分
		K6006,  --跨越地物名称
		K6007,HK6007,  --桥梁跨径分类
		K6008,  --桥梁全长
		K6009,  --桥面净宽
		K6017,HK6017,  --桥墩类型
		K6022,HK6022,  --设计荷载等级
		K6023,HK6023,  --抗震等级
		K6024,HK6024,  --通航等级
		K6030,  --设计单位名称
		K6031,  --施工单位名称
		K6032,  --监理单位名称
		K6062,HK6062,  --立交桥类别
		K6063,  --单孔最大跨径
		K6064,  --桥梁跨径组合(米*孔)
		K6065,  --跨径总长
		K6069,  --人行道宽
		K6070,  --所在地名
		K6005,--HK6005,  --跨越地物类型
		K6016,--HK6016,  --上部结构形式
		K6028,--HK6028,  --技术状况评定
		A1302,HA1302,--收费性质
		A1305,--评定日期
		A1306,HA1306,--主要病害位置
		A1328,HA1328,--墩台防撞设施类型
		A1313,HA1313,--管养单位性质
		A1314,--管养单位名称
		K6079, --建设单位
		K0180,-- 修建年度
		K0181,-- 改造年度
		A1316,-- 改造完工日期
		A1317,-- 改造部位
		HA1317,
		A1318,-- 工程性质
		HA1318,
		A1319,--是否部补助项目
		HA1319,
		A1307,--已采取交通管制措施
		HA1307,
		K6102, --主要病害描述
		K6110, 	--上部结构材料
		HK6110,
		K6111, 	--监管单位名称
		K3912,	--变更原因
		HK3912,
		--2014年新增
		K6050,	--技术状况评定单位
		K6051,	--改造施工单位
		--2018年新增
		K6117,	--桥梁所在位置
		HK6117,
		K6118,	--是否宽路窄桥
		HK6118,
		K6119,	--是否在长大桥梁目录中
		HK6119,
		--2021年新增
		K6067,	--桥面全宽(米)
		A1331,	--是否属于危桥改造项目
		HA1331,
		K6120,	--是否跨省桥梁
		HK6120,
		--2022年新增
		K6040,	--桥梁身份码
		K6041,	--是否公铁两用桥梁
		HK6041,
		K0149,	--防洪标准(年)
		HK0149,
		K6121,	--跨线及匝道桥梁技术等级
		HK6121,
		k6122,
		hk6122
		)
		SELECT 
		A0101,HA0101,  --时间
		A0102,HA0102,  --管理单位名称
		A0103,HA0103,  --行政区划
                K0112,
		replace(left(A3219,'1'),'3','9'),  --建设性质
		k6066,  --桥梁全宽
		K0101,  --路线代码
		K0116,  --通车日期
		K0199,  --备注
		case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001),  --桥梁编号
		K6002,  --桥梁名称
		K6003,  --桥梁中心桩号
		K6004,HK6004,  --按使用年限分
		K6006,  --跨越地物名称
		K6007,HK6007,  --桥梁跨径分类
		K6008,  --桥梁全长
		K6009,  --桥面净宽
		K6017,HK6017,  --桥墩类型
		K6022,HK6022,  --设计荷载等级
		K6023,HK6023,  --抗震等级
		K6024,HK6024,  --通航等级
		K6030,  --设计单位名称
		K6031,  --施工单位名称
		K6032,  --监理单位名称
		K6062,HK6062,  --立交桥类别
		K6063,  --单孔最大跨径
		K6064,  --桥梁跨径组合(米*孔)
		K6065,  --跨径总长
		K6069,  --人行道宽
		K0143,  --所在地名
		K6005,--K6045,--HK6045,  --跨越地物类型
		K6016,	--上部结构形式
		K6028,  --技术状况评定
		A1302,HA1302,--收费性质
		A1305,--评定日期
		A1306,HA1306,--主要病害位置
		A1328,HA1328,--墩台防撞设施类型
		A1313,HA1313,--管养单位性质
		A1314,--管养单位名称
		K6079, --建设单位
		K0180,-- 修建年度
		K0181,-- 改造年度
		A1316,-- 改造完工日期
		A1317,-- 改造部位
		HA1317,
		A1318,-- 工程性质
		HA1318,
		A1319,--是否部补助项目
		HA1319,
		A1307,--已采取交通管制措施
		HA1307,
		K6102, --主要病害描述
		K6110, 	--上部结构材料
		HK6110,
		K6111, 	--监管单位名称
		K3912,	--变更原因
		HK3912,
		--2014年新增
		K6050,	--技术状况评定单位
		K6051,	--改造施工单位
		--2018年新增
		K6117,	--桥梁所在位置
		HK6117,
		K6118,	--是否宽路窄桥
		HK6118,
		K6119,	--是否在长大桥梁目录中
		HK6119,
		--2021年新增
		K6067,	--桥面全宽(米)
		A1331,	--是否属于危桥改造项目
		HA1331,
		K6120,	--是否跨省桥梁
		HK6120,
		--2022年新增
		K6040,	--桥梁身份码
		K6041,	--是否公铁两用桥梁
		HK6041,
		K0149,	--防洪标准(年)
		HK0149,
		K6121,	--跨线及匝道桥梁技术等级
		HK6121,
		k6122,
		hk6122
		FROM 	[HRP-DBMS2014]..K060 
		WHERE LEFT(K0101,1)<>'W'

		update a
		set ha3219=rtrim(objjc)
		from k60 a,DA3201 b
		where a3219=objname
		
		updAte	A
		set 	A.K0112=b.K0112 
		from 	K60 A,A50 b 
		where 	A.A0102=b.A0102 And A.K0101=b.K0101

		update a --跨越地物类型
		set	a.hk6005=b.objjc
		from k60 a,DK6002 b
		where a.k6005=b.objname

		update a --上部结构形式
		set	a.hk6016=b.objjc
		from k60 a,wq007 b
		where a.k6016=b.objname

		update a --技术状况评定
		set	a.hK6028=b.objjc
		from k60 a,DK6014 b
		where a.K6028=b.objname

		------------------K63-------------------------------

		delete K63
		INSERT 	K63
		(A0101,HA0101,  --时间
		A0102,HA0102,  --管理单位名称
		A0103,HA0103,  --行政区划
		A3219,  --建设性质
		K0101,  --路线代码
		K0112,  --路线简称
		K0116,  --通车日期
		K0199,  --备注
		K6301,  --隧道编号
		K6302,  --隧道名称
		K6303,  --隧道入口桩号
		K6305,  --隧道长度
		K6306,  --隧道净宽
		K6307,  --隧道净高
		K6308,  --人行道宽
		K6309,HK6309,  --洞口形式
		K6310,HK6310,  --断面形式
		K6313,HK6313,  --隧道排水类型
		K6314,  --安全通道数量
		K6315,HK6315,  --隧道照明
		K6317,HK6317,  --隧道电子设备
		K6318,HK6318,  --消防设施
		K6320,  --设计单位名称
		K6321,  --施工单位名称
		K6322,  --监理单位名称
		K6324,  --隧道中心桩号
		K6326,  --所在地名
		K6304,HK6304,  --隧道按长度分类
		K6311,  --衬砌材料
		K6316,HK6316,  --隧道通风
		K6327,	--隧道全宽
		K0180,-- 修建年度
		K0181,-- 改建年度
		K6079, --建设单位名称
		A0130,	--管养单位名称
		K3912,	--变更原因
		HK3912,
		--2012年新增
		A1313,HA1313,	--管养单位性质
		K6111,	--监管单位名称
		K6336,HK6336,	--评定等级(总体)
		A1316,	--改造完工日期
		K6337,HK6337,	--改造部位
		A1318,HA1318,	--工程性质
		K6338,HK6338,	--主要病害部位
		K6339,	--主要病害描述
		--2018年新增
		K6343,HK6343,	--隧道养护等级
		K6355,HK6355,	--是否在长大隧道目录中
		K6344,	--评定日期(总体)
		K6345,	--评定单位(总体)
		K6346,HK6346,	--评定等级(土建结构)
		K6347,	--评定日期(土建结构)
		K6348,	--评定单位(土建结构)
		K6349,HK6349,	--评定等级(机电设施)
		K6350,	--评定日期(机电设施)
		K6351,	--评定单位(机电设施)
		K6352,HK6352,	--评定等级(其他工程设施)
		K6353,	--评定日期(其他工程设施)
		K6354,	--评定单位(其他工程设施)
		K6356,HK6356,	--交通工程与附属设施配置等级
		K6357,	--通风设施(%)
		K6358,	--照明设施(%)
		K6359,	--监控设施(%)
		K6360,	--交通安全设施(%)
		K6361,	--紧急呼叫设施(%)
		K6362,	--火灾探测报警设施(%)
		K6363,	--消防设施与通道(%)
		K6364,	--中央控制管理设施(%)
		K6365,	--供配电设施(%)
		K6366,	--接地与防雷设施(%)
		K6367,	--线路及相关设施(%)
		K6368,	--土建结构(万元)
		K6369,	--交通工程与附属设施(万元)
		--2021年新增
		K6335,HK6335,	--是否水下隧道
		K6370,HK6370,	--隧道所在位置
		K6371,HK6371,	--是否跨省隧道
		--2022年新增
		K6023,	--抗震等级
		HK6023,
		K0149,	--防洪标准(年)
		HK0149
		)
		SELECT 
		A0101,HA0101,  --时间
		A0102,HA0102,  --管理单位名称
		A0103,HA0103,  --行政区划
		replace(left(A3219,'1'),'3','9'),  --建设性质
		K0101,  --路线代码
		K0112,  --路线简称
		K0116,  --通车日期
		K0199,  --备注
		case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'U'+rtrim(K6301),  --隧道编号
		K6302,  --隧道名称
		K6303,  --隧道入口桩号
		K6305,  --隧道长度
		K6306,  --隧道净宽
		K6307,  --隧道净高
		K6069,  --人行道宽
		K6309,HK6309,  --洞口形式
		K6310,HK6310,  --断面形式
		K6313,HK6313,  --隧道排水类型
		K6314,  --安全通道数量
		K6315,HK6315,  --隧道照明
		K6317,HK6317,  --隧道电子设备
		K6318,HK6318,  --消防设施
		K6030,  --设计单位名称
		K6031,  --施工单位名称
		K6032 ,  --监理单位名称
		K6324,  --隧道中心桩号
		K0143,  --所在地名
		K6304,HK6304,  --隧道按长度分类
		K6311,  --衬砌材料
		K6316,HK6316, --隧道通风
		K6327,	--隧道全宽
		K0180,-- 修建年度
		K0181,-- 改建年度
		K6079, --建设单位名称
		A0130,	--管养单位名称
		K3912,	--变更原因
		HK3912,
		--2012年新增
		A1313,HA1313,	--管养单位性质
		K6111,	--监管单位名称
		K6336,HK6336,	--评定等级(总体)
		A1316,	--改造完工日期
		K6337,HK6337,	--改造部位
		A1318,HA1318,	--工程性质
		K6338,HK6338,	--主要病害部位
		K6339,	--主要病害描述
		--2018年新增
		K6343,HK6343,	--隧道养护等级
		K6355,HK6355,	--是否在长大隧道目录中
		K6344,	--评定日期(总体)
		K6345,	--评定单位(总体)
		K6346,HK6346,	--评定等级(土建结构)
		K6347,	--评定日期(土建结构)
		K6348,	--评定单位(土建结构)
		K6349,HK6349,	--评定等级(机电设施)
		K6350,	--评定日期(机电设施)
		K6351,	--评定单位(机电设施)
		K6352,HK6352,	--评定等级(其他工程设施)
		K6353,	--评定日期(其他工程设施)
		K6354,	--评定单位(其他工程设施)
		K6356,HK6356,	--交通工程与附属设施配置等级
		K6357,	--通风设施(%)
		K6358,	--照明设施(%)
		K6359,	--监控设施(%)
		K6360,	--交通安全设施(%)
		K6361,	--紧急呼叫设施(%)
		K6362,	--火灾探测报警设施(%)
		K6363,	--消防设施与通道(%)
		K6364,	--中央控制管理设施(%)
		K6365,	--供配电设施(%)
		K6366,	--接地与防雷设施(%)
		K6367,	--线路及相关设施(%)
		K6368,	--土建结构(万元)
		K6369,	--交通工程与附属设施(万元)
		--2021年新增
		K6335,HK6335,	--是否水下隧道
		K6370,HK6370,	--隧道所在位置
		K6371,HK6371,	--是否跨省隧道
		--2022年新增
		K6023,	--抗震等级
		HK6023,
		K0149,	--防洪标准(年)
		HK0149
		FROM 	[HRP-DBMS2014]..K063
		WHERE LEFT(K0101,1)<>'W'
		
		update a
		set ha3219=rtrim(objjc)
		from k63 a,DA3201 b
		where a3219=objname

		updAte	A
		set	A.K0112=b.K0112 
		from 	K63 A,A50 b 
		where	A.A0102=b.A0102 And A.K0101=b.K0101

		updAte	A  --衬砌材料
		set	A.HK6311=b.objjc 
		from 	K63 A,DK4301 b 
		where	A.K6311=b.objname 


		--------------K65--------------------

		delete K65
		INSERT K65
		(
		A0101,HA0101,  --时间
		A0102,HA0102,  --管理单位名称
		A0103,HA0103,  --行政区划
		A3219,  --建设性质
		K0101,  --路线代码
		K0199,  --备注
		A0130,	--管养单位名称
                K2010,
		HK2010,
		K6501,  --渡口编号
		K6502,  --渡口名称
		K6504,HK6504,  --渡口分类
		K6521,  --河流名称
		K6522,  --河流宽度(公里)
		K6531,--渡口职工人数(人)
		K6532,--职工_管理人员(人)
		K6533,--职工_渡工(人)
		K6551,--全年渡运车辆(辆)
		K6552,--年均日渡运辆(辆)(N)
		K6553,--最多一天渡运车辆(辆)(N)
		K6554,--全年渡运航行量_时间(小时)(N)
		K6555,--全年渡运航行量_数量(次)(N)
		K6556,--全年油料消耗_柴油(千克)(N)
		K6557,--全年油料消耗_机油(千克)(N)
		K6561,--过渡费收入(万元)
		K6581,  --机动渡船_数量(艘)
		K6582,  --机动渡船_净载重量(吨位)
		K6583,  --机动渡船_总功率(千瓦)
		K6584,  --拖轮_数量(艘)
		K6585,  --拖轮_净载重量(吨位)
		K6586,  --拖轮_功率(千瓦)
		K6587,  --非机动渡船_数量(艘)
		K6588,  --非机动渡船_净载重量(吨位)
		K6589,  --非机动渡船_功率(千瓦)
		A0204,  --起点桩号
		K6513,HK6513,--渡口种类
		K6523,	--渡口宽度
		K3912,	--变更原因
		HK3912
		)
		SELECT
		A0101,HA0101,  --时间
		A0102,HA0102,  --管理单位名称
		A0103,HA0103,  --行政区划
		replace(left(A3219,'1'),'3','9'),  --建设性质
		K0101,  --路线代码
		K0199,  --备注
		A0130,	--管养单位名称
		K2010,
		HK2010,
		case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'D'+rtrim(K6501),  --渡口编号
		K6502,  --渡口名称
		K6504,HK6504,  --渡口分类
		K6521,  --河流名称
		K6522,  --河流宽度(公里)
		K6531,--渡口职工人数(人)
		K6532,--职工_管理人员(人)
		K6533,--职工_渡工(人)
		K6551,--全年渡运车辆(辆)
		K6552,--年均日渡运辆(辆)(N)
		K6553,--最多一天渡运车辆(辆)(N)
		K6554,--全年渡运航行量_时间(小时)(N)
		K6555,--全年渡运航行量_数量(次)(N)
		K6556,--全年油料消耗_柴油(千克)(N)
		K6557,--全年油料消耗_机油(千克)(N)
		K6561,--过渡费收入(万元)
		K6581,  --机动渡船_数量(艘)
		K6582,  --机动渡船_净载重量(吨位)
		K6583,  --机动渡船_总功率(千瓦)
		K6584,  --拖轮_数量(艘)
		K6585,  --拖轮_净载重量(吨位)
		K6586,  --拖轮_功率(千瓦)
		K6587,  --非机动渡船_数量(艘)
		K6588,  --非机动渡船_净载重量(吨位)
		K6589,  --非机动渡船_功率(千瓦)
		K6503,  --渡口桩号
		K6513,HK6513,--渡口种类
		K6523,	--渡口宽度
		K3912,	--变更原因
		HK3912
		FROM [HRP-DBMS2014]..K065 left join 
			(
				select a0102 a,k0101 b,k6501 c
				from [HRP-DBMS2014]..k065
				where k0101 not in
				(
					select distinct k0101
					from [HRP-DBMS2014]..k001
					where k0101 in (select distinct k0101 from [HRP-DBMS2014]..k065)
						and isnull(k0123,'2')='2' and rtrim(isnull(k0124,''))=''
				)
			) b on a0102=a and k0101=b and k6501=c
		where a is null AND LEFT(K0101,1)<>'W'

		update a
		set ha3219=rtrim(objjc)
		from k65 a,DA3201 b
		where a3219=objname

		updAte	A
		set	A.K0112=b.K0112 
		from 	K65 A, A50 b 
		where	A.A0102=b.A0102 And A.K0101=b.K0101
		
		----------------K88普通干线公路服务设施信息--------------------
		DELETE K88
		INSERT K88(
		A0102,HA0102,	--管理单位名称
		K0101,		--路线代码
		A0101,HA0101,	--时间
		K7530,		--位置桩号
		K0112,		--路线简称
		A0103,HA0103,	--行政区划
		K7531,HK7531,	--服务设施类型
		K7532,		--服务设施名称
		K7533,		--初始运营时间
		K7534,HK7534,	--布局形式
		K7535,HK7535,	--经营模式
		K7536,		--占地面积(平方米)
		K7537,		--停车场面积(平方米)
		K7538,		--停车位数量(个)
		K7539,HK7539,	--是否有厕所
		K7540,HK7540,	--是否有加油设施
		K7541,HK7541,	--是否有加气设施
		K7542,HK7542,	--是否有车辆充电设施
		K7543,HK7543,	--是否有餐饮服务设施
		K7544,HK7544,	--是否有超市
		K7545,HK7545,	--是否有住宿设施
		K7546,HK7546,	--是否有汽车维修
		K0199		--备注
		)
		SELECT
		A0102,HA0102,	--管理单位名称
		K0101,		--路线代码
		A0101,HA0101,	--时间
		K7530,		--位置桩号
		K0112,		--路线简称
		A0103,HA0103,	--行政区划
		K7531,HK7531,	--服务设施类型
		K7532,		--服务设施名称
		K7533,		--初始运营时间
		K7534,HK7534,	--布局形式
		K7535,HK7535,	--经营模式
		K7536,		--占地面积(平方米)
		K7537,		--停车场面积(平方米)
		K7538,		--停车位数量(个)
		K7539,HK7539,	--是否有厕所
		K7540,HK7540,	--是否有加油设施
		K7541,HK7541,	--是否有加气设施
		K7542,HK7542,	--是否有车辆充电设施
		K7543,HK7543,	--是否有餐饮服务设施
		K7544,HK7544,	--是否有超市
		K7545,HK7545,	--是否有住宿设施
		K7546,HK7546,	--是否有汽车维修
		K0199		--备注
		FROM [HRP-DBMS2014]..K088
		WHERE LEFT(K0101,1) IN ('G','S','H','T')

		----------------A61高速公路服务信息--------------------
		DELETE A61
		INSERT A61(
		A0101,--时间   
		HA0101,--时间
		A0102,--管理单位名称   
		HA0102,--管理单位名称
		A0103,--行政区划   
		HA0103,--行政区划
		A0129,--备注
		A7002,--路线地方名称
		A7003,--管理、经营单位名称
		A7004,--联系电话
		A7005,--服务设施类型   
		HA7005,--服务设施类型
		A7006,--桩号
		A7007,--服务区位置
		A7008,--服务区服务内容
		A7009,--出口连接地名
		A7010,--出口连接旅游景点
		A7011,--出口连接公路名称及编号
		A7012,--出口连接其他重要信息
		A7013,--服务设施名称
		K0101,--路线代码
		K0112, --路线简称
		A7011a,--出口连接路线编号
		A7014,--出口连接路线桩号
		A7015,--出入口编号
		A7016, --出入口名称  
		A7017,	--服务区及出入口位置
		HA7017
		)
		SELECT 
		rtrim(a.A0101),--时间   
		rtrim(a.HA0101),--时间
		rtrim(a.A0102),--管理单位名称   
		rtrim(a.HA0102),--管理单位名称
		rtrim(a.A0103),--行政区划   
		rtrim(a.HA0103),--行政区划
		a.K0199,--备注
		ISNULL(rtrim(b.A7002),'请输入'),--路线地方名称
		ISNULL(rtrim(a.A7003),'请输入'),--管理、经营单位名称
		ISNULL(rtrim(a.A7004),'999'),--联系电话
		rtrim(a.K7502),--公路服务设施种类   
		rtrim(a.HK7502),--公路服务设施种类
		a.K7001,--位置桩号
		rtrim(a.A7007),--服务区位置
		rtrim(a.A7008),--服务区服务内容
		rtrim(a.A7009),--出口连接地名
		rtrim(a.A7010),--出口连接旅游景点
		rtrim(a.A7011),--出口连接公路名称及编号
		rtrim(a.A7012),--出口连接其他重要信息
		rtrim(a.A7013),--服务设施名称
		rtrim(a.K0101),--路线代码
		rtrim(b.K0112), --路线简称
		RTRIM(A.A7011a),--出口连接路线编号
		RTRIM(A.A7014),--出口连接路线桩号
		RTRIM(A.A7015),--出入口编号
		RTRIM(A.A7016), --出入口名称  
		rtrim(a.A7017),	--服务区及出入口位置
		rtrim(a.HA7017)
		FROM [HRP-DBMS2014]..K078 a join [HRP-DBMS2014]..K001 b ON a.A0102=b.A0102 AND a.K0101=b.K0101 AND a.K7001>b.K0108 AND a.K7001<=b.K0109
		WHERE b.K0304='10' and left(a.K7502,2) in ('01','02','03','04') AND LEFT(A.K0101,1)<>'W'

		----------------------K01--------------------------------

		--根据K001、K025、K031、K038、K039进行路段分段处理
		IF object_id('tempdb..#temp00') is not null     drop table #temp00 
		Create table #temp00(A0102 varchar(8),K0101 varchar(15),K0108 numeric(18,3))
		----K001
		insert #temp00(A0102,K0101,K0108)select A0102,K0101,K0108 from [HRP-DBMS2014]..K001 WHERE isnull(k9111,'0')<>'4' AND LEFT(K0101,1)<>'W'
		insert #temp00(A0102,K0101,K0108)select A0102,K0101,K0109 from [HRP-DBMS2014]..K001 WHERE isnull(k9111,'0')<>'4' AND LEFT(K0101,1)<>'W'
		/*--K025
		insert #temp00(A0102,K0101,K0108)select A0102,K0101,K0108 from [HRP-DBMS2014]..K025
		insert #temp00(A0102,K0101,K0108)select A0102,K0101,K0109 from [HRP-DBMS2014]..K025
		--K031
		insert #temp00(A0102,K0101,K0108)select A0102,K0101,K0108 from [HRP-DBMS2014]..K031
		insert #temp00(A0102,K0101,K0108)select A0102,K0101,K0109 from [HRP-DBMS2014]..K031
		--K038
		insert #temp00(A0102,K0101,K0108)select A0102,K0101,K0108 from [HRP-DBMS2014]..K038
		insert #temp00(A0102,K0101,K0108)select A0102,K0101,K0109 from [HRP-DBMS2014]..K038
		*/
		/*--K039
		insert #temp00(A0102,K0101,K0108)select A0102,K0101,K0108 from [HRP-DBMS2014]..K039
		insert #temp00(A0102,K0101,K0108)select A0102,K0101,K0109 from [HRP-DBMS2014]..K039
		*/
		/*--K065渡口
		insert #temp00(A0102,K0101,K0108)select A0102,K0101,K6503 from [HRP-DBMS2014]..K065
		insert #temp00(A0102,K0101,K0108)select A0102,K0101,K6503+isnull(K6523,0) from [HRP-DBMS2014]..K065 where isnull(k6513,'1')='1'
		*/
		/*选择起止点桩号，并对路段细分；*/
		IF object_id('tempdb..#K01') is not null     drop table #K01    
		create table #k01(a0102 char(10),k0101 char(15),k0108 numeric(18,3),id int IDENTITY(1,1))
		insert 	#k01(k0108,k0101,A0102)
		select 	distinct(k0108) k0108,k0101,A0102
		from 	#temp00 
		order by k0101,A0102,k0108
        
		IF object_id('tempdb..#K0001') is not null     drop table #K0001    
		create table #k0001(a0102 char(10),k0101 char(15),k0108 numeric(18,3),k0109 numeric(18,3))
		insert #K0001(k0101,A0102,k0108,k0109) 
		select 
			t1.k0101 K0101,
			t1.A0102 A0102,
			t1.k0108 k0108,
			t2.k0108 k0109
		from #k01 t1
		join #k01 t2 on t1.k0101=t2.k0101 and t1.A0102=t2.A0102 and t1.id+1=t2.id
		/*将分段后的信息填入K001表中*/
		DECLARE @CurYear CHAR(4)	--汇总时间
                set @CurYear=(select ParamValue from #TimeTable )

		IF object_id('tempdb..#K001') is not null     drop table #K001
		select * into #K001 from K01 where A0102 is null
		insert into  #k001(A0102,K0101,K0108,K0109,a0101,ha0101,A3219,HA3219,K0114,A0103,K0110,K0111)
		select  A0102,K0101,K0108,K0109,@CurYear,@CurYear+'年','9','其他',0,'340101','A','B' from #K0001
		--根据各个属性表更新拆分后路段的属性

		update #k001 set k0114=k0109-k0108
		--更新K001中的所有属性
		update 	a 
		set 	a.K0306=b.K0306,				--设计车速
			a.K2010=b.k2010,a.hk2010=b.hk2010,		--管养单位行业类别
			a.a0130=rtrim(b.a0130), 			--养护单位名称
			a.K0304=b.K0304,a.HK0304=b.HK0304,		--技术等级
			a.K0126=b.K0126,a.HK0126=b.HK0126,		--是否一幅高速
                        a.K9109=b.K9110,				--乡镇名称
			a.K0135=b.K0135,a.HK0135=b.HK0135,		--是否重要县道
			a.A7002=rtrim(b.A7002),				--路线地方名称 
			a.K5104=b.K5104,a.HK5104=rtrim(b.HK5104),	--面层类型
			a.K0404=b.k0404,a.hk0404=rtrim(b.hk0404),	--车道特征
			a.K0124=rtrim(b.K0124),				--重复路线
			a.K0161=rtrim(b.K0161),				--重复路段管理单位
			a.HK0161=rtrim(b.HK0161),			--重复路段管理单位
			a.K0162=b.K0162,				--重复路段起点桩号
			a.K0163=b.K0163,				--重复路段止点桩号
			a.K0153=rtrim(b.K0153),				--起点是否为分界点   
			a.HK0153=rtrim(b.HK0153),			--起点是否为分界点
			a.K0154=rtrim(b.K0154),				--起点分界点类别   
			a.HK0154=rtrim(b.HK0154),			--起点分界点类别
			a.K0157=rtrim(b.K0157),				--止点是否为分界点   
			a.HK0157=rtrim(b.HK0157),			--止点是否为分界点
			a.K0158=rtrim(b.K0158),				--止点分界点类别   
			a.HK0158=rtrim(b.HK0158),			--止点分界点类别
			a.K0121=b.K0121,a.hk0121=rtrim(b.HK0121),	--是否城管
			a.K0123=b.K0123,a.hk0123=rtrim(b.HK0123),	--断头路里程
			a.K5404=b.k5404,				--路面宽度
			a.K4002=b.k4002,				--路基宽度
			a.A3219=replace(left(b.A3219,1),'3','9'),	--建设性质
			a.k0115=b.k0115,				--路段编号
			a.K9508=b.K9508,a.HK9508=b.HK9508,
			A.K0180=B.K0180,				--修建年度
			A.K0181=B.K0181,				--改建年度
			A.K0182=B.K0182,A.HK0182=B.HK0182, 		--断链类型
   			A.K9111=B.K9111,A.HK9111=B.HK9111,
			A.K0136=B.K0136,A.HK0136=B.HK0136,	--路段收费性质
			A.K3912=B.K3912,A.HK3912=B.HK3912,	--变更原因
		--2011年新增
			A.K0130=B.K0130,A.HK0130=B.HK0130,	--养护类型(按时间分)
			A.K0131=B.K0131,A.HK0131=B.HK0131,	--养护类型(按资金来源分)
			A.A1001=B.A1001,			--养护里程
			A.A3101=B.A3101,			--可绿化里程
			A.A3102=B.A3102,			--已绿化里程
			A.A0320=CASE WHEN ISNULL(B.K9030,'2')='1' THEN A.K0114 ELSE 0 END,	--晴雨通车里程
		--2014年新增
			A.K5222=B.K5222,			--面层厚度(厘米)
			A.K0155=B.K0155,			--最近一次大中修年度
			A.K0156=B.K0156,A.HK0156=B.HK0156,	--省际出入口标识
			A.K0199=B.K0199,			--省际出入口标识
		--2016年新增
			A.K3990=B.K3990,			--路网调整前路线代码
			A.K3992=B.K3992,			--国省道桩号传递预留里程
			A.K3993=B.K3993,			--路网调整说明
			A.K0138=B.K0138,A.HK0138=B.HK0138,	--是否按干线公路管理接养
			A.K0176=B.K0176,A.HK0176=B.HK0176,	--是否反向重复
		--2017年涵洞由K001表中直接录入K062表不再使用
			A.A0522=B.A0522,A.A0523=B.A0523,	--涵洞(道/米)
		--2022年新增
			A.K6023=B.K6023,A.HK6023=B.HK6023,	--抗震等级
			A.K0149=B.K0149,A.HK0149=B.HK0149	--防洪标准(年)
		from 	#k001 a ,[HRP-DBMS2014]..k001 b 
		where 	a.a0102=b.a0102 and a.k0101=b.k0101 and a.k0108>=b.k0108 and a.k0109<=b.k0109

		-----------------------------插入渡口里程--------------------------------------------------------------------
		/*update a
		set a.k5104='5',a.hk5104='无路面',a.k0199='渡口里程',a.a0103=b.a0103,a.ha0103=b.ha0103
		from #K001 a,[HRP-DBMS2014]..k065 b 
		where a.a0102=b.a0102 and a.k0101=b.k0101 and a.k0108=b.k6503 and a.k0109=b.k6503+b.k6523 and isnull(b.k6513,'1')='1'
		
		update 	a
		set 	a.k0304=b.k0304 , a.hk0304=b.hk0304 , a.k0404=b.k0404 , a.hk0404=b.hk0404
		from 	#K001 a , #k001 b
		where 	a.a0102=b.a0102 and a.k0101=b.k0101 and (a.k0108=b.k0109 or a.k0109=b.k0108) and a.k0199 like '渡口里程%' 
		*/
		---注释掉
		/*update a
		set a.a0701=1,a.a0702=case when b.k6504=1 then 1 else 0 end
		from #K001 a,[HRP-DBMS2014]..k065 b 
		where a.a0102=b.a0102 and a.k0101=b.k0101 and a.k0108=b.k6503 and a.k0109=b.k6503+b.k6523  and a.k0199 like '渡口里程%'*/

		--------------------------------------------------------GBM里程--------------------------------------------------------------
		if object_id('tempdb..#L031') is not null
		drop table #L031
		select 	a.a0102,a.k0101,a.k0108,a.k0109, --GBM里程
			case 	when a.k0108<=b.k0108 and a.k0109>=b.k0109 then b.k0109-b.k0108 
				when a.k0108>=b.k0108 and a.k0109<=b.k0109 then a.k0109-a.k0108
				when a.k0108>=b.k0108 and a.k0109>=b.k0109 and a.k0108<=b.k0109 then b.k0109-a.k0108
				when a.k0108<=b.k0108 and a.k0109<=b.k0109 and a.k0109>=b.k0108 then a.k0109-b.k0108
			end a0322
		into #L031
		from #k001 a join [HRP-DBMS2014]..k031 b on a.k0101=b.k0101 and a.a0102=b.a0102


		update a
		set a.a0322=b.a0322
		from #k001 a join(
					select a0102,k0101,k0108,k0109,sum(a0322) a0322
					from #L031
					group by a0102,k0101,k0108,k0109
			    ) b on a.k0101=b.k0101 and a.a0102=b.a0102 and a.k0108=b.k0108 and a.k0109=b.k0109
	
		------------------------------------------------------文明样板路里程---------------------------------------------------------
		if object_id('tempdb..#L032') is not null
		drop table #L032
		select 	a.a0102,a.k0101,a.k0108,a.k0109, --GBM里程
			case 	when a.k0108<=b.k0108 and a.k0109>=b.k0109 then b.k0109-b.k0108 
				when a.k0108>=b.k0108 and a.k0109<=b.k0109 then a.k0109-a.k0108
				when a.k0108>=b.k0108 and a.k0109>=b.k0109 and a.k0108<=b.k0109 then b.k0109-a.k0108
				when a.k0108<=b.k0108 and a.k0109<=b.k0109 and a.k0109>=b.k0108 then a.k0109-b.k0108
			end a0323
		into #L032
		from #k001 a join [HRP-DBMS2014]..k031 b on a.k0101=b.k0101 and a.a0102=b.a0102
		where b.k3201='2'

		update a
		set a.a0323=b.a0323
		from #k001 a join(
					select a0102,k0101,k0108,k0109,sum(a0323) a0323
					from #L032
					group by a0102,k0101,k0108,k0109
		  	  ) b on a.k0101=b.k0101 and a.a0102=b.a0102 and a.k0108=b.k0108 and a.k0109=b.k0109



		/*删除由于桩号不连续而产生的不存在的路段*/
		delete #k001 where k0304 is null and isnull(k0124,'')='' and k5104 is null and isnull(k0123,'2')<>'1'

		---------------------------------------------------------其他---------------------------------------------------------------

		update #K001	--建设性质
		set A3219='9'
		where isnull(A3219,'')=''

		update a
		set HA3219=rtrim(objjc)
		from #K001 a ,DA3201 b
		where a.A3219=b.objname

		update a	--行政区划
		set a.a0103=b.a0103,a.ha0103=b.ha0103
		from #K001 a,[HRP-DBMS2014]..K001 b
		where a.a0102=b.a0102 and a.k0101=b.k0101 and a.k0108>=b.k0108 and a.k0109<=b.k0109 and isnull(a.a0103,'340101')='340101'

		update a	--行政区划
		set a.a0103=b.a0103,a.ha0103=b.ha0103
		from #K001 a,[HRP-DBMS2014]..K065 b
		where a.a0102=b.a0102 and a.k0101=b.k0101 and a.k0108>=b.K6503 and a.k0109<=b.K6503+isnull(K6523,0) and isnull(a.a0103,'340101')='2340101'
		update a	--通车日期
		set a.K0116=b.K0116
		from #K001 a,[HRP-DBMS2014]..K001 b
		where a.a0102=b.a0102 and a.k0101=b.k0101 and a.k0108>=b.k0108 and a.k0109<=b.k0109 
		update a
		set a.k0112=case when b.k0112 is not null then rtrim(b.k0112) else rtrim(b.k0102) end--路线简称
		from #k001 a join a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		update a --管理单位名称
		set a.ha0102=objjc
		from #K001 a join DA0102 b on a.a0102=objname

		--更新K001起止点名称
		--路段起点名称
		update a
		set a.k0110=b.k0110
		from #k001 a,[HRP-DBMS2014]..K001 b
		where a.a0102=b.a0102 and a.k0101=b.k0101 and a.k0108=b.k0108 --and a.k0110 is null

		update #k001
		set k0110=rtrim(k0108)
		where k0110 is null
		--路段止点名称
		update a
		set a.k0111=b.k0111
		from #k001 a,[HRP-DBMS2014]..K001 b
		where a.a0102=b.a0102 and a.k0101=b.k0101 and a.k0109=b.k0109 --and a.k0110 is null

		update #k001
		set k0111=rtrim(k0109)
		where k0111 is null


		-------------------------------------向K01导数据-----------------------
		delete K01
		insert K01(
		A0101,--时间   
		HA0101,--时间
		A0102,--管理单位名称   
		HA0102,--管理单位名称
		A0103,--行政区划   
		HA0103,--行政区划
		A0130,--管养单位名称
		A0320,--晴雨通车里程(公里)
		A0322,--已实施GBM里程(公里)
		A0323,--已实施文明样板路的里程(公里)
		A0522,--涵洞(道)
		A0523,--涵洞(米)
		A1001,--养护里程(公里)
		A3101,--可绿化里程(公里)
		A3102,--已绿化里程(公里)
		A3219,--建设性质   
		HA3219,--建设性质
		A7002,--路线地方名称
		K9109,
		K0101,--路线代码
		K0108,--路段起点桩号
		K0109,--路段止点桩号
		K0110,--路段起点名称
		K0111,--路段止点名称
		K0112,--路线简称
		K0114,--里程(公里)
		K0115,--路段编号
		K0153,--起点是否为分界点   
		HK0153,--起点是否为分界点
		K0154,--起点分界点类别   
		HK0154,--起点分界点类别
		K0157,--止点是否为分界点   
		HK0157,--止点是否为分界点
		K0158,--止点分界点类别   
		HK0158,--止点分界点类别
		K0306,--设计车速
		K0116,--通车日期
		K0121,--是否城管路段   
		HK0121,--是否城管路段
		K0123,--是否断头路路段   
		HK0123,--是否断头路路段
		K0124,--重复路线代码
		K0161,--重复路段管理单位
		HK0161,--重复路段管理单位
		K0162,--重复路段起点桩号
		K0163,--重复路段止点桩号
		K0126,--是否一幅高速   
		HK0126,--是否一幅高速
		K0135,
		HK0135,
		K0130,--养护类型(按时间分)   
		HK0130,--养护类型(按时间分)
		K0131,--养护类型(按资金来源分)   
		HK0131,--养护类型(按资金来源分)
		K0199,--备注
		K0304,--技术等级   
		HK0304,--技术等级
		K0404,--车道分类   
		HK0404,--车道分类
		K2010,--管养单位所属行业类别   
		HK2010,--管养单位所属行业类别
		K4002,--路基宽度(米)
		K5104,--面层类型   
		HK5104,--面层类型
		K5404,--路面宽度(米)
		K9508,--地形   
		HK9508,--地形
		K0180,--修建年度
		K0181,--改建年度
		K0182,--断链类型
		HK0182,
                K9111,
		HK9111,
		K0136,	--是否收费路段
		HK0136,
		K3912,	--变更原因
		HK3912,
		--2014年新增
		K5222,	--面层厚度(厘米)
		K0155,	--最近一次大中修年度
		K0156,	--省际出入口标识
		HK0156,
		--2016年新增
		K3990,	--路网调整前路线代码
		K3992,	--国省道桩号传递预留里程
		K3993,	--路网调整说明
		K0138,	--是否按干线公路管理接养
		HK0138,
		K0176,	--是否反向重复
		HK0176,
		--2022年新增
		K6023,
		HK6023,	--抗震等级
		K0149,
		HK0149	--防洪标准(年)
		)
		select
		A0101,--时间   
		HA0101,--时间
		A0102,--管理单位名称   
		HA0102,--管理单位名称
		A0103,--行政区划   
		HA0103,--行政区划
		A0130,--管养单位名称
		A0320,--晴雨通车里程(公里)
		A0322,--已实施GBM里程(公里)
		A0323,--已实施文明样板路的里程(公里)
		A0522,--涵洞(道)
		A0523,--涵洞(米)
		A1001,--养护里程(公里)
		A3101,--可绿化里程(公里)
		A3102,--已绿化里程(公里)
		A3219,--建设性质   
		HA3219,--建设性质
		A7002,--路线地方名称
		K9109,
		K0101,--路线代码
		K0108,--路段起点桩号
		K0109,--路段止点桩号
		K0110,--路段起点名称
		K0111,--路段止点名称
		K0112,--路线简称
		K0114,--里程(公里)
		K0115,--路段编号
		K0153,--起点是否为分界点   
		HK0153,--起点是否为分界点
		K0154,--起点分界点类别   
		HK0154,--起点分界点类别
		K0157,--止点是否为分界点   
		HK0157,--止点是否为分界点
		K0158,--止点分界点类别   
		HK0158,--止点分界点类别
		K0306,--设计车速
		K0116,--通车日期
		K0121,--是否城管路段   
		HK0121,--是否城管路段
		K0123,--是否断头路路段   
		HK0123,--是否断头路路段
		K0124,--重复路线代码
		K0161,--重复路段管理单位
		HK0161,--重复路段管理单位
		K0162,--重复路段起点桩号
		K0163,--重复路段止点桩号
		K0126,--是否一幅高速   
		HK0126,--是否一幅高速
		K0135,
		HK0135,
		K0130,--养护类型(按时间分)   
		HK0130,--养护类型(按时间分)
		K0131,--养护类型(按资金来源分)   
		HK0131,--养护类型(按资金来源分)
		K0199,--备注
		K0304,--技术等级   
		HK0304,--技术等级
		K0404,--车道分类   
		HK0404,--车道分类
		K2010,--管养单位所属行业类别   
		HK2010,--管养单位所属行业类别
		K4002,--路基宽度(米)
		K5104,--面层类型   
		HK5104,--面层类型
		K5404,--路面宽度(米)
		K9508,--地形   
		HK9508,--地形
		K0180,--修建年度
		K0181,--改建年度
		K0182,--断链类型
		HK0182,
		K9111,
		HK9111,
		K0136,	--是否收费路段
		HK0136,
		K3912,	--变更原因
		HK3912,
		--2014年新增
		K5222,	--面层厚度(厘米)
		K0155,	--最近一次大中修年度
		K0156,	--省际出入口标识
		HK0156,
		--2016年新增
		K3990,	--路网调整前路线代码
		K3992,	--国省道桩号传递预留里程
		K3993,	--路网调整说明
		K0138,	--是否按干线公路管理接养
		HK0138,
		K0176,	--是否反向重复
		HK0176,
		--2022年新增
		K6023,
		HK6023,	--抗震等级
		K0149,
		HK0149	--防洪标准(年)
		from #K001

		------------------------汇总A11、A51、A12、K02数据-----------------------------
		--如果[时间]为NULL则默认的为本年，因K01中只填写本年的数据。
		update k01 set a0101=@CurYear,ha0101=str(@CurYear,4)+'年',a3219='9',ha3219='其他'
		where a0101 is null 
		--------------------------	
		--[建设性质]为NULL则默认的为‘其他’.
		update k01 set a3219='9',ha3219='其他'
		where a3219 is null 
		---更新为零的指标项
		update K01 set 	K4002=nullif(K4002,0),
				K5404=nullif(K5404,0),
				A0320=nullif(A0320,0),
				A3101=nullif(A3101,0),
				A3102=nullif(A3102,0),
				A1001=nullif(A1001,0),
				A0322=nullif(A0322,0),
				A0323=nullif(A0323,0),
				A0522=nullif(A0522,0),
				A0523=nullif(A0523,0)



		--------------------------
		delete A51 where left(a0101,4)= @CurYear --只删除本年新加入的数据
		delete A11 where left(a0101,4)= @CurYear

		if object_id('tempdb..#本年新建里程') is not null	drop table #本年新建里程
		select
		A0102,
		Max(HA0102) ha0102,
		K0101,
		[高速四车道里程]	= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='10' and K0404='4' then K0114 else 0 end),
		[高速六车道里程]	= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='10' and K0404='6' then K0114 else 0 end),
		[高速八车道及以上里程]	= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='10' and K0404 >='8' then K0114 else 0 end),
		[一级里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='11'  then K0114 else 0 end),
		[二级里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='22'  then K0114 else 0 end),
		[一幅高速]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and isnull(K0126,'2')='1' then K0114 else 0 end),
		[三级里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='23'  then K0114 else 0 end),
		[四级里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='24'  then K0114 else 0 end),
		[等外里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='30'  then K0114 else 0 end),
		[晴雨通车里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0320,0) else 0 end),
		[养护里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A1001,0) else 0 end),
		[可绿化里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A3101,0) else 0 end),
		[已绿化里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A3102,0) else 0 end),
		[涵洞（道）]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0522,0) else 0 end),
		[涵洞（米）]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0523,0) else 0 end),
		[有路面铺装_水泥混凝土] = sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K5104='12'  then K0114 else 0 end),
		[有路面铺装_沥青混凝土] = sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K5104='11'  then K0114 else 0 end),
		[简易铺将路面里程] 	= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K5104  like '2%'  then K0114 else 0 end),
		[无路面铺装里程] 	= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and left(K5104,1) not in ('1','2') then K0114 else 0 end),
		[GBM里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0322,0) else 0 end),
		[文明样板路]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0323,0) else 0 end),
		[城管里程]		= sum(case when (K0124 is null or K0124 = '') and k0121 = '1' then K0114 else 0 end),
		[断头路里程]		= sum(case when k0123 = '1' then K0114 else 0 end), --如果既是断头又是重复，则算为断头路里程，这样“路线长度＝路线里程＋断头路里程＋重复里程”
		[重复里程]		= sum(case when isnull(K0123,'2') = '2' and k0124 is not null then K0114 else 0 end)
		into #本年新建里程
		from K01 
		where 
		left(A0101,4)=@CurYear and a3219='1' and left(K0101,1) in ('G','S','X','Y','Z','C')
		group by A0102,K0101
		--------------------------------------
		if object_id('tempdb..#新建下行线涵洞数量') is not null	drop table #新建下行线涵洞数量
		select
		A0102,
		Max(HA0102) ha0102,
		K0101,
		[高速四车道里程]	= NULL,
		[高速六车道里程]	= NULL,
		[高速八车道及以上里程]	= NULL,
		[一级里程]		= NULL,
		[二级里程]		= NULL,
		[一幅高速]		= NULL,
		[三级里程]		= NULL,
		[四级里程]		= NULL,
		[等外里程]		= NULL,
		[晴雨通车里程]		= NULL,
		[养护里程]		= NULL,
		[可绿化里程]		= NULL,
		[已绿化里程]		= NULL,
		[涵洞（道）]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0522,0) else 0 end),
		[涵洞（米）]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0523,0) else 0 end),
		[有路面铺装_水泥混凝土] = NULL,
		[有路面铺装_沥青混凝土] = NULL,
		[简易铺将路面里程] 	= NULL,
		[无路面铺装里程] 	= NULL,
		[GBM里程]		= NULL,
		[文明样板路]		= NULL,
		[城管里程]		= NULL,
		[断头路里程]		= NULL, --如果既是断头又是重复，则算为断头路里程，这样“路线长度＝路线里程＋断头路里程＋重复里程”
		[重复里程]		= NULL
		into #新建下行线涵洞数量
		from K01 
		where 
		left(A0101,4)=@CurYear and a3219='1' and left(K0101,1) in ('H','T','J','N')
		group by A0102,K0101
		--------------------------------------
		if object_id('tempdb..#非本年新建里程数') is not null	drop table #非本年新建里程数
		select
		A50.A0102,
		Max(A50.HA0102) ha0102,
		A50.K0101,
		[高速四车道里程]	= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='10' and K0404='4' then K0114 else 0 end),
		[高速六车道里程]	= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='10' and K0404='6' then K0114 else 0 end),
		[高速八车道及以上里程]	= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='10' and K0404 >='8' then K0114 else 0 end),
		[一级里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='11'  then K0114 else 0 end),
		[二级里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='22'  then K0114 else 0 end),
		[一幅高速]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and isnull(K0126,'2')='1' then K0114 else 0 end),
		[三级里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='23'  then K0114 else 0 end),
		[四级里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='24'  then K0114 else 0 end),
		[等外里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K0304='30'  then K0114 else 0 end),
		[晴雨通车里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0320,0) else 0 end),
		[养护里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A1001,0) else 0 end),
		[可绿化里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A3101,0) else 0 end),
		[已绿化里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A3102,0) else 0 end),
		[涵洞（道）]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0522,0) else 0 end),
		[涵洞（米）]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0523,0) else 0 end),
		[有路面铺装_水泥混凝土] = sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K5104='12'  then K0114 else 0 end),
		[有路面铺装_沥青混凝土] = sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K5104='11'  then K0114 else 0 end),
		[简易铺将路面里程] 	= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and K5104  like '2%'  then K0114 else 0 end),
		[无路面铺装里程] 	= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and left(K5104,1) not in ('1','2') then K0114 else 0 end),
		[GBM里程]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0322,0) else 0 end),
		[文明样板路]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0323,0) else 0 end),
		[城管里程]		= sum(case when (K0124 is null or K0124 = '') and k0121 = '1' then K0114 else 0 end),
		[断头路里程]		= sum(case when k0123 = '1' then K0114 else 0 end), --如果既是断头又是重复，则算为断头路里程，这样“路线长度＝路线里程＋断头路里程＋重复里程”
		[重复里程]		= sum(case when isnull(K0123,'2') = '2' and k0124 is not null then K0114 else 0 end)
		into #非本年新建里程数
		from A50 LEFT JOIN K01 ON A50.A0102=K01.A0102 AND A50.K0101=K01.K0101 and not(left(K01.A0101,4)=@CurYear and K01.a3219='1')
		where left(A50.K0101,1) in ('G','S','X','Y','Z','C')
		group by A50.A0102,A50.K0101
		----------------------------------------
		if object_id('tempdb..#非本年新建下行线涵洞数量') is not null	drop table #非本年新建下行线涵洞数量
		select
		A50.A0102,
		Max(A50.HA0102) ha0102,
		A50.K0101,
		[高速四车道里程]	= NULL,
		[高速六车道里程]	= NULL,
		[高速八车道及以上里程]	= NULL,
		[一级里程]		= NULL,
		[二级里程]		= NULL,
		[一幅高速]		= NULL,
		[三级里程]		= NULL,
		[四级里程]		= NULL,
		[等外里程]		= NULL,
		[晴雨通车里程]		= NULL,
		[养护里程]		= NULL,
		[可绿化里程]		= NULL,
		[已绿化里程]		= NULL,
		[涵洞（道）]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0522,0) else 0 end),
		[涵洞（米）]		= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0523,0) else 0 end),
		[有路面铺装_水泥混凝土] = NULL,
		[有路面铺装_沥青混凝土] = NULL,
		[简易铺将路面里程] 	= NULL,
		[无路面铺装里程] 	= NULL,
		[GBM里程]		= NULL,
		[文明样板路]		= NULL,
		[城管里程]		= NULL,
		[断头路里程]		= NULL, --如果既是断头又是重复，则算为断头路里程，这样“路线长度＝路线里程＋断头路里程＋重复里程”
		[重复里程]		= NULL
		into #非本年新建下行线涵洞数量
		from A50 LEFT JOIN K01 ON A50.A0102=K01.A0102 AND A50.K0101=K01.K0101 and not(left(K01.A0101,4)=@CurYear and K01.a3219='1')
		where left(A50.K0101,1) in ('H','T','J','N')
		group by A50.A0102,A50.K0101
		----------------------------------------
		--以下计算桥梁
		if object_id('tempdb..#本年新建桥梁') is not null	drop table #本年新建桥梁
		select 
		A0102,
		Max(HA0102) ha0102,
		K0101,
		[危桥座数]		= sum(case when left(K6028,1) in('4','5') then 1 else 0 end),
		[危桥延米]		= sum(case when left(K6028,1) in('4','5') then K6008 else 0 end),
		[永久性桥梁座数]	= sum(case when K6004 IN('1','4') then 1 else 0 end),
		[永久性桥梁延米]	= sum(case when K6004 IN('1','4') then K6008 else 0 end),
		[半永久性桥梁座数]   	= sum(case when K6004 IN('2','5') then 1 else 0 end),
		[半永久性桥梁延米]   	= sum(case when K6004 IN('2','5') then K6008 else 0 end),
		[临时性桥梁座数]	= sum(case when K6004 IN('3','6') then 1 else 0 end),
		[临时性桥梁延米]	= sum(case when K6004 IN('3','6') then K6008 else 0 end),
		[互通式立交桥座数]	= sum(case when K6062='1' then 1 else 0 end),
		[互通式立交桥延米]	= sum(case when K6062='1' then K6008 else 0 end),
		[特大桥座数]		= sum(case when K6007='1' then 1 else 0 end),
		[特大桥延米]		= sum(case when K6007='1' then K6008 else 0 end),
		[大桥座数]		= sum(case when K6007='2' then 1 else 0 end),
		[大桥延米]		= sum(case when K6007='2' then K6008 else 0 end),
		[中桥座数]		= sum(case when K6007='3' then 1 else 0 end),
		[中桥延米]		= sum(case when K6007='3' then K6008 else 0 end),
		[小桥座数]		= sum(case when K6007='4' then 1 else 0 end),
		[小桥延米]		= sum(case when K6007='4' then K6008 else 0 end)
		into #本年新建桥梁
		from k60 
		where left(A0101,4)=@CurYear and a3219='1' and isnull(K6008,0)<>0 --20011217修改 桥梁全长为0,则不计数
		group by a0102,k0101

		if object_id('tempdb..#非本年新建桥梁数') is not null	drop table #非本年新建桥梁数
		select 
		A50.A0102,
		Max(A50.HA0102) ha0102,
		A50.K0101,
		[危桥座数]		= sum(case when left(K6028,1) in('4','5') then 1 else 0 end),
		[危桥延米]		= sum(case when left(K6028,1) in('4','5') then K6008 else 0 end),
		[永久性桥梁座数]	= sum(case when K6004 IN('1','4') then 1 else 0 end),
		[永久性桥梁延米]	= sum(case when K6004 IN('1','4') then K6008 else 0 end),
		[半永久性桥梁座数]   	= sum(case when K6004 IN('2','5') then 1 else 0 end),
		[半永久性桥梁延米]   	= sum(case when K6004 IN('2','5') then K6008 else 0 end),
		[临时性桥梁座数]	= sum(case when K6004 IN('3','6') then 1 else 0 end),
		[临时性桥梁延米]	= sum(case when K6004 IN('3','6') then K6008 else 0 end),
		[互通式立交桥座数]	= sum(case when K6062='1' then 1 else 0 end),
		[互通式立交桥延米]	= sum(case when K6062='1' then K6008 else 0 end),
		[特大桥座数]		= sum(case when K6007='1' then 1 else 0 end),
		[特大桥延米]		= sum(case when K6007='1' then K6008 else 0 end),
		[大桥座数]		= sum(case when K6007='2' then 1 else 0 end),
		[大桥延米]		= sum(case when K6007='2' then K6008 else 0 end),
		[中桥座数]		= sum(case when K6007='3' then 1 else 0 end),
		[中桥延米]		= sum(case when K6007='3' then K6008 else 0 end),
		[小桥座数]		= sum(case when K6007='4' then 1 else 0 end),
		[小桥延米]		= sum(case when K6007='4' then K6008 else 0 end)
		into #非本年新建桥梁数
		from A50 LEFT JOIN k60 ON A50.A0102=K60.A0102 AND A50.K0101=K60.K0101 AND not(left(K60.A0101,4)=@CurYear and K60.a3219='1') and isnull(K6008,0)<>0
		group by A50.a0102,A50.k0101
		-----------------------------------------------------------------------------
		--以下计算隧道
		if object_id('tempdb..#本年新建隧道') is not null	drop table #本年新建隧道
		select 
		A0102,
		Max(HA0102) ha0102,
		K0101,
		[四五类隧道数]	= sum(case when ISNULL(K6336,'') IN ('4','5') then 1 else 0 end),
		[四五类隧道延米]= sum(case when ISNULL(K6336,'') IN ('4','5') then K6305 else 0 end),
		[水下隧道数]	= sum(case when ISNULL(K6335,'2')='1' then 1 else 0 end),
		[水下隧道延米]	= sum(case when ISNULL(K6335,'2')='1' then K6305 else 0 end),
		[特长隧道数]	= sum(case when K6304='1' then 1 else 0 end),
		[特长隧道延米]	= sum(case when K6304='1' then K6305 else 0 end),
		[长隧道数]	= sum(case when K6304='2' then 1 else 0 end),
		[长隧道延米 ]	= sum(case when K6304='2' then K6305 else 0 end),
		[中隧道数]	= sum(case when K6304='3' then 1 else 0 end),
		[中隧道延米]	= sum(case when K6304='3' then K6305 else 0 end),
		[短隧道数]	= sum(case when K6304='4' then 1 else 0 end),
		[短隧道延米]	= sum(case when K6304='4' then K6305 else 0 end)
		into #本年新建隧道
		from k63
		where left(A0101,4)=@CurYear and a3219='1' and isnull(K6305,0)<>0 --20011217修改 隧道长度为0,则不计数
		group by a0102,k0101

		if object_id('tempdb..#非本年新建隧道数') is not null	drop table #非本年新建隧道数
		select 
		A50.A0102,
		Max(A50.HA0102) ha0102,
		A50.K0101,
		[四五类隧道数]	= sum(case when ISNULL(K6336,'') IN ('4','5') then 1 else 0 end),
		[四五类隧道延米]= sum(case when ISNULL(K6336,'') IN ('4','5') then K6305 else 0 end),
		[水下隧道数]	= sum(case when ISNULL(K6335,'2')='1' then 1 else 0 end),
		[水下隧道延米]	= sum(case when ISNULL(K6335,'2')='1' then K6305 else 0 end),
		[特长隧道数]	= sum(case when K6304='1' then 1 else 0 end),
		[特长隧道延米]	= sum(case when K6304='1' then K6305 else 0 end),
		[长隧道数]	= sum(case when K6304='2' then 1 else 0 end),
		[长隧道延米 ]	= sum(case when K6304='2' then K6305 else 0 end),
		[中隧道数]	= sum(case when K6304='3' then 1 else 0 end),
		[中隧道延米]	= sum(case when K6304='3' then K6305 else 0 end),
		[短隧道数]	= sum(case when K6304='4' then 1 else 0 end),
		[短隧道延米]	= sum(case when K6304='4' then K6305 else 0 end)
		into #非本年新建隧道数
		from A50 LEFT JOIN k63 ON A50.A0102=K63.A0102 AND A50.K0101=K63.K0101 AND not(left(K63.A0101,4)=@CurYear and K63.a3219='1') and isnull(K6305,0)<>0
		group by A50.a0102,A50.k0101
		-------------------------------------------
		--以下计算渡口
		if object_id('tempdb..#本年新建渡口') is not null	drop table #本年新建渡口
		select 
		A0102,
		Max(HA0102) ha0102,
		K0101,
		[机动渡口数]		=sum(case when K6504='1' then 1 else 0 end),
		[渡口数]		=count(K6501)
		into #本年新建渡口
		from k65
		where left(A0101,4)=@CurYear and a3219='1' and isnull(K6523,0)<>0 --20011217修改 渡口宽度为0,则不计数
		group by a0102,k0101
	
		if object_id('tempdb..#非本年新建渡口数') is not null	drop table #非本年新建渡口数
		select 
		A50.A0102,
		Max(A50.HA0102) ha0102,
		A50.K0101,
		[机动渡口数]		=sum(case when K6504='1' then 1 else 0 end),
		[渡口数]		=count(K6501)
		into #非本年新建渡口数
		from A50 LEFT JOIN k65 ON A50.A0102=K65.A0102 AND A50.K0101=K65.K0101 AND not(left(K65.A0101,4)=@CurYear and K65.a3219='1') and isnull(K6523,0)<>0
		group by A50.a0102,A50.k0101
		-------------------------------------------
		--下面计算上年底到达,#上年底到达
		if object_id('tempdb..#上年底到达') is not null		drop table #上年底到达
		select a0102,k0101,
		sum(A0304)	A0304 ,
		sum(A0305)	A0305 ,
		sum(A0306)	A0306 ,
		sum(A0307)	A0307 ,
		sum(A0308)	A0308 ,
		sum(A0309)	A0309 ,
		sum(A0310)	A0310 ,
		sum(A0311)	A0311 ,
		sum(A0312)	A0312 ,
		sum(A0320)	A0320 ,
		sum(A1001)	A1001 ,
		sum(A3101)	A3101 ,
		sum(A3102)	A3102 ,
		sum(A0503)	A0503 ,
		sum(A0504)	A0504 ,
		sum(A0505)	A0505 ,
		sum(A0506)	A0506 ,
		sum(A0507)	A0507 ,
		sum(A0508)	A0508 ,
		sum(A0509)	A0509 ,
		sum(A0510)	A0510 ,
		sum(A0519)	A0519 ,
		sum(A0520)	A0520 ,
		sum(A0511)	A0511 ,
		sum(A0512)	A0512 ,
		sum(A0513)	A0513 ,
		sum(A0514)	A0514 ,
		sum(A0515)	A0515 ,
		sum(A0516)	A0516 ,
		sum(A0517)	A0517 ,
		sum(A0518)	A0518 ,
		sum(A0522)	A0522 ,
		sum(A0523)	A0523 ,
		sum(A0601)	A0601 ,
		sum(A0602)	A0602 ,
		sum(A0603)	A0603 ,
		sum(A0604)	A0604 ,
		sum(A0605)	A0605 ,
		sum(A0606)	A0606 ,
		sum(A0607)	A0607 ,
		sum(A0608)	A0608 ,
		sum(A0609)	A0609 ,
		sum(A0610)	A0610 ,
		sum(A0611)	A0611 ,
		sum(A0612)	A0612 ,
		sum(A0701)	A0701 ,
		sum(A0702)	A0702 ,
		SUM(A0314A)	A0314A,
		SUM(A0315A)	A0315A,
		SUM(A0316A)	A0316A,
		SUM(A0317A)	A0317A,
		SUM(A0322)	A0322,
		SUM(A0323)	A0323,
		SUM(A0324)	A0324,
		SUM(K1707)	K1707,
		SUM(A0321)	A0321
		into #上年底到达
		from a51 where a0101<@CurYear group by a0102,k0101

		--下面(^@^):由于所有里程为0的不计算，所以路线名称、通车日期等字段不能填写到A51表中.
		insert a51 (a0102,ha0102,k0101,a3219,ha3219,a0101,ha0101,K0105,K0106,K0103,K0104)
		select a0102,ha0102,k0101,'1','新建',@CurYear,@CurYear+'年',0,K0106,K0103,K0104 from A50
	
		insert a51 (a0102,ha0102,k0101,a3219,ha3219,a0101,ha0101,K0105,K0106,K0103,K0104)
		select a0102,ha0102,k0101,'2','改建',@CurYear,@CurYear+'年',0,K0106,K0103,K0104 from A50
		--新建数直接填写到A51表中.
		update a51 set
		A0304=[高速四车道里程],
		A0305=[高速六车道里程],
		A0306=[高速八车道及以上里程],
		A0307=[一级里程],
		A0308=[二级里程],
		A0309=[一幅高速],
		A0310=[三级里程],
		A0311=[四级里程],
		A0312=[等外里程],
		A0320=[晴雨通车里程],
		A1001=[养护里程],
		A3101=[可绿化里程],
		A3102=[已绿化里程],
		A0522=[涵洞（道）],
		A0523=[涵洞（米）],
		A0314A=[有路面铺装_水泥混凝土],
		A0315A=[有路面铺装_沥青混凝土],
		A0316A=[简易铺将路面里程],
		A0317A=[无路面铺装里程],
		A0322=[GBM里程],
		A0323=[文明样板路],
		A0324=[城管里程],
		A0321=[断头路里程],
		K1707=[重复里程]
		from #本年新建里程 
		where 
		a51.a0101=@CurYear and a51.a3219='1' and
		#本年新建里程.a0102=a51.a0102 and #本年新建里程.k0101=a51.k0101
	
		--新建下行线涵洞数直接填写到A51表中.
		update a51 set
		A0304=[高速四车道里程],
		A0305=[高速六车道里程],
		A0306=[高速八车道及以上里程],
		A0307=[一级里程],
		A0308=[二级里程],
		A0309=[一幅高速],
		A0310=[三级里程],
		A0311=[四级里程],
		A0312=[等外里程],
		A0320=[晴雨通车里程],
		A1001=[养护里程],
		A3101=[可绿化里程],
		A3102=[已绿化里程],
		A0522=[涵洞（道）],
		A0523=[涵洞（米）],
		A0314A=[有路面铺装_水泥混凝土],
		A0315A=[有路面铺装_沥青混凝土],
		A0316A=[简易铺将路面里程],
		A0317A=[无路面铺装里程],
		A0322=[GBM里程],
		A0323=[文明样板路],
		A0324=[城管里程],
		A0321=[断头路里程],
		K1707=[重复里程]
		from #新建下行线涵洞数量
		where 
		a51.a0101=@CurYear and a51.a3219='1' and
		#新建下行线涵洞数量.a0102=a51.a0102 and #新建下行线涵洞数量.k0101=a51.k0101

		update a51 set
		A0503=[危桥座数],
		A0504=[危桥延米],
		A0505=[永久性桥梁座数],
		A0506=[永久性桥梁延米],
		A0507=[半永久性桥梁座数],
		A0508=[半永久性桥梁延米],
		A0509=[临时性桥梁座数],
		A0510=[临时性桥梁延米],
		A0519=[互通式立交桥座数],
		A0520=[互通式立交桥延米],
		A0511=[特大桥座数],
		A0512=[特大桥延米],
		A0513=[大桥座数],
		A0514=[大桥延米],
		A0515=[中桥座数],
		A0516=[中桥延米],
		A0517=[小桥座数],
		A0518=[小桥延米]
		from #本年新建桥梁
		where 
		A51.A0101=@CurYear AND A51.A3219='1' AND
		#本年新建桥梁.A0102=A51.A0102 AND #本年新建桥梁.K0101=A51.K0101

		update a51 set
		A0601=[四五类隧道数],
		A0602=[四五类隧道延米],
		A0603=[水下隧道数],
		A0604=[水下隧道延米],
		A0605=[特长隧道数],
		A0606=[特长隧道延米],
		A0607=[长隧道数],
		A0608=[长隧道延米],
		A0609=[中隧道数],
		A0610=[中隧道延米],
		A0611=[短隧道数],
		A0612=[短隧道延米]
		from #本年新建隧道
		where 
		A51.A0101=@CurYear AND A51.A3219='1' AND
		#本年新建隧道.A0102=A51.A0102 AND #本年新建隧道.K0101=A51.K0101
		
		update a51 set
		A0701=[渡口数],
		A0702=[机动渡口数]
		from #本年新建渡口
		where 
		A51.A0101=@CurYear AND A51.A3219='1' AND
		#本年新建渡口.A0102=A51.A0102 AND #本年新建渡口.K0101=A51.K0101
		
		/*计算A51表中本年改建的数据：路段表中非本新建-上年底到达数*/
		update a51
		set
		A0304=isnull(a.[高速四车道里程],0)	-isnull(b.A0304,0),
		A0305=isnull(a.[高速六车道里程],0)	-isnull(b.A0305,0),
		A0306=isnull(a.[高速八车道及以上里程],0)	-isnull(b.A0306,0),
		A0307=isnull(a.[一级里程],0)		-isnull(b.A0307,0),
		A0308=isnull(a.[二级里程],0)		-isnull(b.A0308,0),
		A0309=isnull(a.[一幅高速],0)		-isnull(b.A0309,0),
		A0310=isnull(a.[三级里程],0)		-isnull(b.A0310,0),
		A0311=isnull(a.[四级里程],0)		-isnull(b.A0311,0),
		A0312=isnull(a.[等外里程],0)		-isnull(b.A0312,0),
		A0320=isnull(a.[晴雨通车里程],0)		-isnull(b.A0320,0),
		A1001=isnull(a.[养护里程],0)		-isnull(b.A1001,0),
		A3101=isnull(a.[可绿化里程],0)		-isnull(b.A3101,0),
		A3102=isnull(a.[已绿化里程],0)		-isnull(b.A3102,0),
		A0522=isnull(a.[涵洞（道）],0)		-isnull(b.A0522,0),
		A0523=isnull(a.[涵洞（米）],0)		-isnull(b.A0523,0),
		A0314A=isnull(a.[有路面铺装_水泥混凝土],0)	-isnull(b.A0314A,0),
		A0315A=isnull(a.[有路面铺装_沥青混凝土],0)	-isnull(b.A0315A,0),
		A0316A=isnull(a.[简易铺将路面里程],0)	-isnull(b.A0316A,0),
		A0317A=isnull(a.[无路面铺装里程],0)	-isnull(b.A0317A,0),
		A0322=isnull(a.[GBM里程],0)		-isnull(b.A0322,0),
		A0323=isnull(a.[文明样板路],0)		-isnull(b.A0323,0),
		A0324=isnull(a.[城管里程],0)		-isnull(b.A0324,0),
		A0321=isnull(a.[断头路里程],0)		-isnull(b.A0321,0),
		K1707=isnull(a.[重复里程],0)		-isnull(b.K1707,0)
		from 
		#非本年新建里程数 a 
		join a51 on a.a0102=a51.a0102 and a.k0101=a51.k0101 and a51.a3219='2' and a51.a0101=@curyear
		left join #上年底到达 b on a51.a0102=b.a0102 and a51.k0101=b.k0101

		/*计算A51表中本年改建下行线涵洞数量：路段表中非本新建-上年底到达数*/
		update a51
		set
		A0304=isnull(a.[高速四车道里程],0)	-isnull(b.A0304,0),
		A0305=isnull(a.[高速六车道里程],0)	-isnull(b.A0305,0),
		A0306=isnull(a.[高速八车道及以上里程],0)	-isnull(b.A0306,0),
		A0307=isnull(a.[一级里程],0)		-isnull(b.A0307,0),
		A0308=isnull(a.[二级里程],0)		-isnull(b.A0308,0),
		A0309=isnull(a.[一幅高速],0)		-isnull(b.A0309,0),
		A0310=isnull(a.[三级里程],0)		-isnull(b.A0310,0),
		A0311=isnull(a.[四级里程],0)		-isnull(b.A0311,0),
		A0312=isnull(a.[等外里程],0)		-isnull(b.A0312,0),
		A0320=isnull(a.[晴雨通车里程],0)		-isnull(b.A0320,0),
		A1001=isnull(a.[养护里程],0)		-isnull(b.A1001,0),
		A3101=isnull(a.[可绿化里程],0)		-isnull(b.A3101,0),
		A3102=isnull(a.[已绿化里程],0)		-isnull(b.A3102,0),
		A0522=isnull(a.[涵洞（道）],0)		-isnull(b.A0522,0),
		A0523=isnull(a.[涵洞（米）],0)		-isnull(b.A0523,0),
		A0314A=isnull(a.[有路面铺装_水泥混凝土],0)	-isnull(b.A0314A,0),
		A0315A=isnull(a.[有路面铺装_沥青混凝土],0)	-isnull(b.A0315A,0),
		A0316A=isnull(a.[简易铺将路面里程],0)	-isnull(b.A0316A,0),
		A0317A=isnull(a.[无路面铺装里程],0)	-isnull(b.A0317A,0),
		A0322=isnull(a.[GBM里程],0)		-isnull(b.A0322,0),
		A0323=isnull(a.[文明样板路],0)		-isnull(b.A0323,0),
		A0324=isnull(a.[城管里程],0)		-isnull(b.A0324,0),
		A0321=isnull(a.[断头路里程],0)		-isnull(b.A0321,0),
		K1707=isnull(a.[重复里程],0)		-isnull(b.K1707,0)
		from 
		#非本年新建下行线涵洞数量 a 
		join a51 on a.a0102=a51.a0102 and a.k0101=a51.k0101 and a51.a3219='2' and a51.a0101=@curyear
		left join #上年底到达 b on a51.a0102=b.a0102 and a51.k0101=b.k0101

		update a51
		set 	
		A0503=isnull(a.[危桥座数],0)		-isnull(b.A0503,0),
		A0504=isnull(a.[危桥延米],0)		-isnull(b.A0504,0),
		A0505=isnull(a.[永久性桥梁座数],0)	-isnull(b.A0505,0),
		A0506=isnull(a.[永久性桥梁延米],0)	-isnull(b.A0506,0),
		A0507=isnull(a.[半永久性桥梁座数],0)	-isnull(b.A0507,0),
		A0508=isnull(a.[半永久性桥梁延米],0)	-isnull(b.A0508,0),
		A0509=isnull(a.[临时性桥梁座数],0)	-isnull(b.A0509,0),
		A0510=isnull(a.[临时性桥梁延米],0)	-isnull(b.A0510,0),
		A0519=isnull(a.[互通式立交桥座数],0)	-isnull(b.A0519,0),
		A0520=isnull(a.[互通式立交桥延米],0)	-isnull(b.A0520,0),
		A0511=isnull(a.[特大桥座数],0)		-isnull(b.A0511,0),
		A0512=isnull(a.[特大桥延米],0)		-isnull(b.A0512,0),
		A0513=isnull(a.[大桥座数],0)		-isnull(b.A0513,0),
		A0514=isnull(a.[大桥延米],0)		-isnull(b.A0514,0),
		A0515=isnull(a.[中桥座数],0)		-isnull(b.A0515,0),
		A0516=isnull(a.[中桥延米],0)		-isnull(b.A0516,0),
		A0517=isnull(a.[小桥座数],0)		-isnull(b.A0517,0),
		A0518=isnull(a.[小桥延米],0)		-isnull(b.A0518,0)
		from 
		#非本年新建桥梁数 a 	
		join a51 on a.a0102=a51.a0102 and a.k0101=a51.k0101 and a51.a3219='2' and a51.a0101=@curyear
		left join #上年底到达 b on a51.a0102=b.a0102 and a51.k0101=b.k0101 
	
		update a51
		set 
		A0601=isnull(a.[四五类隧道数],0)	-isnull(b.A0601,0),
		A0602=isnull(a.[四五类隧道延米],0)	-isnull(b.A0602,0),
		A0603=isnull(a.[水下隧道数],0)		-isnull(b.A0603,0),
		A0604=isnull(a.[水下隧道延米],0)	-isnull(b.A0604,0),
		A0605=isnull(a.[特长隧道数],0)		-isnull(b.A0605,0),
		A0606=isnull(a.[特长隧道延米],0)	-isnull(b.A0606,0),
		A0607=isnull(a.[长隧道数],0)		-isnull(b.A0607,0),
		A0608=isnull(a.[长隧道延米],0)		-isnull(b.A0608,0),
		A0609=isnull(a.[中隧道数],0)		-isnull(b.A0609,0),
		A0610=isnull(a.[中隧道延米],0)		-isnull(b.A0610,0),
		A0611=isnull(a.[短隧道数],0)		-isnull(b.A0611,0),
		A0612=isnull(a.[短隧道延米],0)		-isnull(b.A0612,0)
		from 
		#非本年新建隧道数 a 	
		join a51 on a.a0102=a51.a0102 and a.k0101=a51.k0101 and a51.a3219='2' and a51.a0101=@curyear
		left join #上年底到达 b on a51.a0102=b.a0102 and a51.k0101=b.k0101 
	
		update a51
		set
		A0701=isnull(a.[渡口数],0)		-isnull(b.A0701,0),
		A0702=isnull(a.[机动渡口数],0)		-isnull(b.A0702,0)
		from 
		#非本年新建渡口数 a 	
		join a51 on a.a0102=a51.a0102 and a.k0101=a51.k0101 and a51.a3219='2' and a51.a0101=@curyear
		left join #上年底到达 b on a51.a0102=b.a0102 and a51.k0101=b.k0101 
		--
		delete a51 
		where left(a0101,4)=@curyear and
		isnull(	A0304 	,0) =0 and
		isnull(	A0305 	,0) =0 and
		isnull(	A0306 	,0) =0 and
		isnull(	A0307 	,0) =0 and
		isnull(	A0308 	,0) =0 and
		isnull(	A0309 	,0) =0 and
		isnull(	A0310 	,0) =0 and
		isnull(	A0311 	,0) =0 and
		isnull(	A0312 	,0) =0 and
		isnull(	A0320 	,0) =0 and
		isnull(	A0503 	,0) =0 and
		isnull(	A0504 	,0) =0 and
		isnull(	A0505 	,0) =0 and
		isnull(	A0506 	,0) =0 and
		isnull(	A0507 	,0) =0 and
		isnull(	A0508 	,0) =0 and
		isnull(	A0509 	,0) =0 and
		isnull(	A0510 	,0) =0 and
		isnull(	A0511 	,0) =0 and
		isnull(	A0512 	,0) =0 and
		isnull(	A0513 	,0) =0 and
		isnull(	A0514 	,0) =0 and
		isnull(	A0515 	,0) =0 and
		isnull(	A0516 	,0) =0 and
		isnull(	A0517 	,0) =0 and
		isnull(	A0518 	,0) =0 and
		isnull(	A0519 	,0) =0 and
		isnull(	A0520 	,0) =0 and
		isnull(	A0522 	,0) =0 and
		isnull(	A0601 	,0) =0 and
		isnull(	A0602 	,0) =0 and
		isnull(	A0603 	,0) =0 and
		isnull(	A0604 	,0) =0 and
		isnull(	A0605 	,0) =0 and
		isnull(	A0606 	,0) =0 and
		isnull(	A0607 	,0) =0 and
		isnull(	A0608 	,0) =0 and
		isnull(	A0609 	,0) =0 and
		isnull(	A0610 	,0) =0 and
		isnull(	A0611 	,0) =0 and
		isnull(	A0612 	,0) =0 and
		isnull(	A0701 	,0) =0 and
		isnull(	A0702 	,0) =0 and
		isnull(	A1001 	,0) =0 and
		isnull(	A3101 	,0) =0 and
		isnull(	A3102 	,0) =0 and
		isnull(	A0523 	,0) =0 and
		isnull( A0314A	,0) =0 and
		isnull( A0315A	,0) =0 and
		isnull( A0316A	,0) =0 and
		isnull( A0317A	,0) =0 and
		isnull( A0322	,0) =0 and
		isnull( A0323	,0) =0 and	
		isnull(	K1707	,0) =0 and
		isnull(	a0324	,0) =0 and
		isnull(	a0321	,0) =0 


		--下面填写行政等级

		update a
		set a.a0203=b.a0203,
		    a.ha0203=b.ha0203
		from a51 a,a50 b
		where a.a0102=b.a0102 and a.k0101=b.k0101 and a.a0101=@CurYear
		--新增原来国道主干线更新为一般国道
		update a51 set a0203='g9',ha0203='一般国道'
                where a0203='g0'

		--update a
		--set a.k0105=b.k0105,a.k0106=b.k0106
		--from a50 a,(select a0102,k0101,min(k0108) k0105,max(k0109) k0106 from k01
		--	  group by a0102,k0101	)b
		--where a.a0102=b.a0102 and a.k0101=b.k0101
		
		--update a
		--set a.k0103=b.k0110
		--from a50 a,(select a0102,k0101,k0108 ,max(k0110) k0110 from k01
		--	  group by a0102,k0101,k0108)b
		--where a.a0102=b.a0102 and a.k0101=b.k0101 and a.k0105=b.k0108

		--update a
		--set a.k0104=b.k0111
		--from a50 a,(select a0102,k0101,k0109 ,max(k0111) k0111 from k01
		--	  group by a0102,k0101,k0109)b
		--where a.a0102=b.a0102 and a.k0101=b.k0101 and a.k0106=b.k0109

		--A51是A50的子表，同一条新建路线以下字段值相同
		update a set 
		a.K0112=b.K0112,--路线全称
		a.K0105=b.K0105,--路线起点桩号
		a.K0106=b.K0106,--路线终点桩号
		a.k0103=b.k0103,--路线起点名称
		a.k0104=b.k0104 --路线终点名称
		from A51 a,A50 b
		where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101=@CurYear

		update a
		set a.k0116=b.k0116
		from a51 a ,(	select a0102,k0101,max(k0116) k0116
				from k01
				group by a0102,k0101 ) b
		where a.a0102=b.a0102 and a.k0101=b.k0101 and a.a0101=@CurYear

		if object_id('tempdb..#改建路段起止点信息') is not null drop table #改建路段起止点信息
		select
			a0102, --管理单位代码
			k0101, --路线代码
			k0105 = min(k0108),	--改建路段最小起点桩号
			k0106 = max(k0109),	--改建路段最大终点桩号
			k0103 = space(60),	--改建路段最小起点桩号对应的起点名称
			k0104 = space(60) 	--改建路段最大终点桩号对应的终点名称
		into #改建路段起止点信息
		from k01
		where left(a0101,4) = @curyear and a3219 = '2'
		group by a0102,k0101

		update #改建路段起止点信息 set k0103 = k0110 from k01 where #改建路段起止点信息.a0102 = k01.a0102 and #改建路段起止点信息.k0101 = k01.k0101 and #改建路段起止点信息.k0105 = k01.k0108
		update #改建路段起止点信息 set k0104 = k0111 from k01 where #改建路段起止点信息.a0102 = k01.a0102 and #改建路段起止点信息.k0101 = k01.k0101 and #改建路段起止点信息.k0106 = k01.k0109

		update a51 set k0106 = gj.k0106 from #改建路段起止点信息 gj where a51.a0102 = gj.a0102 and a51.k0101 = gj.k0101 and left(a51.a0101,4) = @curyear and a51.a3219 = '2'
		update a51 set k0105 = gj.k0105 from #改建路段起止点信息 gj where a51.a0102 = gj.a0102 and a51.k0101 = gj.k0101 and left(a51.a0101,4) = @curyear and a51.a3219 = '2'
		update a51 set k0103 = gj.k0103 from #改建路段起止点信息 gj where a51.a0102 = gj.a0102 and a51.k0101 = gj.k0101 and left(a51.a0101,4) = @curyear and a51.a3219 = '2'
		update a51 set k0104 = gj.k0104 from #改建路段起止点信息 gj where a51.a0102 = gj.a0102 and a51.k0101 = gj.k0101 and left(a51.a0101,4) = @curyear and a51.a3219 = '2'

		if not exists(select * from A51 where left(A0101,4)<>@CurYear)
		begin
			update A51 set A3219='9',Ha3219='其他'
		end
		---导入A11
		insert A11(A0102,HA0102,A0101,HA0101,A0203,HA0203,A3219,HA3219,A0304,A0305,A0306,A0307,A0308,A0309,A0310,A0311,A0312,A0320,A0503,A0504,A0505,A0506,A0507,A0508,A0509,A0510,A0511,A0512,A0513,A0514,A0515,A0516,A0517,A0518,A0519,A0520,A0522,A0601,A0602,A0603,A0604,A0605,A0606,A0607,A0608,A0609,A0610,A0611,A0612,A0701,A0702,A1001,A3102,A0523,A3101,A0314A,A0315A,A0316A,A0317A,A0322,A0323,A0324,K1707,A0321) 
		select A0102,max(HA0102),@CurYear,@CurYear+'年',A0203,max(HA0203),A3219,max(HA3219),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0304,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0305,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0306,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0307,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0308,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0309,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0310,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0311,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0312,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0320,0) END),0),
			NULLIF(SUM(A0503),0),NULLIF(SUM(A0504),0),NULLIF(SUM(A0505),0),NULLIF(SUM(A0506),0),NULLIF(SUM(A0507),0),NULLIF(SUM(A0508),0),NULLIF(SUM(A0509),0),NULLIF(SUM(A0510),0),NULLIF(SUM(A0511),0),NULLIF(SUM(A0512),0),NULLIF(SUM(A0513),0),NULLIF(SUM(A0514),0),NULLIF(SUM(A0515),0),NULLIF(SUM(A0516),0),NULLIF(SUM(A0517),0),NULLIF(SUM(A0518),0),NULLIF(SUM(A0519),0),NULLIF(SUM(A0520),0),NULLIF(SUM(A0522),0),NULLIF(SUM(A0601),0),NULLIF(SUM(A0602),0),NULLIF(SUM(A0603),0),NULLIF(SUM(A0604),0),NULLIF(SUM(A0605),0),NULLIF(SUM(A0606),0),NULLIF(SUM(A0607),0),NULLIF(SUM(A0608),0),NULLIF(SUM(A0609),0),NULLIF(SUM(A0610),0),NULLIF(SUM(A0611),0),NULLIF(SUM(A0612),0),NULLIF(SUM(A0701),0),NULLIF(SUM(A0702),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A1001,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A3102,0) END),0),
			NULLIF(SUM(A0523),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A3101,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0314A,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0315A,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0316A,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0317A,0) END),0),
                        NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0322,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0323,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0324,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(K1707,0) END),0),
			NULLIF(SUM(CASE WHEN LEFT(K0101,1) NOT IN ('H','T','J','N') THEN ISNULL(A0321,0) END),0)
		from A51 
		where left(A0101,4)=@CurYear
		group by A0102,A0203,A3219

		update a51 set
		A0304=nullif(A0304 	,0),
		A0305=nullif(A0305 	,0),
		A0306=nullif(A0306 	,0),
		A0307=nullif(A0307 	,0),
		A0308=nullif(A0308 	,0),
		A0309=nullif(A0309 	,0),
		A0310=nullif(A0310 	,0),
		A0311=nullif(A0311 	,0),
		A0312=nullif(A0312 	,0),
		A0320=nullif(A0320 	,0),
		A0503=nullif(A0503 	,0),
		A0504=nullif(A0504 	,0),
		A0505=nullif(A0505 	,0),
		A0506=nullif(A0506 	,0),
		A0507=nullif(A0507 	,0),
		A0508=nullif(A0508 	,0),
		A0509=nullif(A0509 	,0),
		A0510=nullif(A0510 	,0),
		A0511=nullif(A0511 	,0),
		A0512=nullif(A0512 	,0),
		A0513=nullif(A0513 	,0),
		A0514=nullif(A0514 	,0),
		A0515=nullif(A0515 	,0),
		A0516=nullif(A0516 	,0),
		A0517=nullif(A0517 	,0),
		A0518=nullif(A0518 	,0),
		A0519=nullif(A0519 	,0),
		A0520=nullif(A0520 	,0),
		A0522=nullif(A0522 	,0),
		A0601=nullif(A0601 	,0),
		A0602=nullif(A0602 	,0),
		A0603=nullif(A0603 	,0),
		A0604=nullif(A0604 	,0),
		A0605=nullif(A0605 	,0),
		A0606=nullif(A0606 	,0),
		A0607=nullif(A0607 	,0),
		A0608=nullif(A0608 	,0),
		A0609=nullif(A0609 	,0),
		A0610=nullif(A0610 	,0),
		A0611=nullif(A0611 	,0),
		A0612=nullif(A0612 	,0),
		A0701=nullif(A0701 	,0),
		A0702=nullif(A0702 	,0),
		A1001=nullif(A1001 	,0),
		A3101=nullif(A3101 	,0),
		A3102=nullif(A3102 	,0),
		A0523=nullif(A0523 	,0),
		A0314A=NULLIF(A0314A	,0),
		A0315A=NULLIF(A0315A	,0),
		A0316A=NULLIF(A0316A	,0),
		A0317A=NULLIF(A0317A	,0),
		A0322=NULLIF(A0322	,0),
		A0323=NULLIF(A0323	,0),
		A0324=nullif(A0324	,0),
		K1707=nullif(K1707	,0),
		A0321=nullif(A0321	,0)
		--更新A11国道主干线改为一般国道
		update a11 set a0203='g9',ha0203='一般国道'
                where a0203='g0'
 		---汇总A13表
		--delete A13 where left(a0101,4)= @CurYear
		IF not EXISTS ( select * from a13 Where left(a0101,4)=@CurYear )
			insert a13(a0102,ha0102,a0101,ha0101,a3199,ha3199,a3101,a3102,A3103A)
			select a0102,max(ha0102),@CurYear,@CurYear+'年',a0203,max(ha0203),sum(a3101),sum(a3102),sum(a3102)
			from a51
			where left(a0101,4)<=@CurYear and left(k0101,1) in ('g','s','x','y','z','C')
			group by a0102,a0203
		else 
			begin
			insert a13(a0102,ha0102,a0101,ha0101,a3199,ha3199)
			select a0102,max(ha0102),@CurYear,@CurYear+'年',a0203,max(ha0203)
			from a51
			where left(a0101,4)<=@CurYear and left(k0101,1) in ('g','s','x','y','z','C') and rtrim(a0102)+rtrim(a0203) not in (select rtrim(a0102)+rtrim(a3199) from a13 where a0101=@CurYear)
			group by a0102,a0203
			
			update a
			set a.a3101=b.a3101,a.a3102=b.a3102,a.a3103a=b.a3102
			from A13 a, (	select a0102,a0203,sum(a3101) a3101 ,sum(a3102) a3102
					from a51
					where left(a0101,4)<=@CurYear and left(k0101,1) in ('g','s','x','y','z','C')
					group by a0102,a0203
				)b
			where a.a0102=b.a0102 and a.a3199=b.a0203 and a.a0101=@CurYear

			end

		delete A13 where left(a0101,4)= @CurYear and isnull(a3101,0)=0 and isnull(a3102,0)=0

               	update a13
               	set 	
                  	A3101=nullif(A3101,0),
                    	A3102=nullif(A3102,0),
                  	A3103A=nullif(A3103A,0),
                  	A3104A=nullif(A3104A,0),
 		   	A3106A=nullif(A3106A,0)
		---汇总A12表
		delete A12 where left(a0101,4)= @CurYear	
		insert A12(a0102,ha0102,a0101,ha0101,a0203,ha0203)
		select a0102,max(ha0102),@CurYear,@CurYear+'年',a0203,max(ha0203)
		from A50
		where left(k0101,1) in ('g','s','x','y','z','C') and rtrim(a0102)+rtrim(a0203) not in (select rtrim(a0102)+rtrim(a0203) from a12 where a0101=@CurYear)
			group by a0102,a0203

		update a
		set	a.A1002=b.a1002,--	养路费养护里程
			a.A1003=b.a1003,--	通行费养护里程
			a.A1004=b.a1004,--	其他费养护里程
			a.A1005=b.a1005, --性固定养护
			a.A1006=b.a1006 --	季节性固定养护
		from a12 a,( select c.a0102,c.a0203,
				  a1002=sum(case when k0131='1' then isnull(d.A1001,0) else 0 end), 
				  a1003=sum(case when k0131='2' then isnull(d.A1001,0) else 0 end),
				  a1004=sum(case when k0131='3' then isnull(d.A1001,0) else 0 end),
				  a1005=sum(case when left(k0130,1)='1' then isnull(d.A1001,0) else 0 end),
				  a1006=sum(case when k0130='2' then isnull(d.A1001,0) else 0 end)
			  from a50 c,k01 d
			  where c.a0102=d.a0102 and c.k0101=d.k0101 and left(c.k0101,1) in ('g','s','x','y','z','C') and (d.K0124 is null or d.K0124 = '') and isnull(d.K0123,'2') = '2'
			  group by c.a0102,c.a0203
			) b
		where a.a0102=b.a0102 and a.a0203=b.a0203 and left(a.a0101,4)= @CurYear

		
		update a
		set	a.A0322=b.A0322,--	已实施GBM里程
			a.A0323=b.A0323 --	已实施文明样板路的里程
		from a12 a,( select c.a0102,c.a0203,
				  A0322=sum(isnull(d.A0322,0)), 
				  A0323=sum(isnull(d.A0323,0))
			  from a50 c,k01 d
			  where c.a0102=d.a0102 and c.k0101=d.k0101  and left(c.k0101,1) in ('g','s','x','y','z','C') and (d.K0124 is null or d.K0124 = '') and isnull(d.K0123,'2') = '2'
			  group by c.a0102,c.a0203
			) b
		where a.a0102=b.a0102 and a.a0203=b.a0203 and left(a.a0101,4)= @CurYear

		update a
		set	a.A0321=b.A0321--	断头路里程
		from a12 a,( select c.a0102,c.a0203,
				  A0321=sum(isnull(d.K0114,0))
			  from a50 c,k01 d
			  where c.a0102=d.a0102 and c.k0101=d.k0101 and left(c.k0101,1) in ('g','s','x','y','z','C')  and isnull(d.K0123,'2')='1'
			  group by c.a0102,c.a0203
			) b
		where a.a0102=b.a0102 and a.a0203=b.a0203 and left(a.a0101,4)= @CurYear

		delete a12 
		where left(a0101,4)= @CurYear and 
			(isnull(A0321,0)=0 and 	--断头路里程
			isnull(A0322,0)=0 and 	--已实施GBM里程
			isnull(A0323,0)=0 and 	--已实施文明样板路的里程
			isnull(A1002,0)=0 and 	--养路费养护里程
			isnull(A1003,0)=0 and 	--通行费养护里程
			isnull(A1004,0)=0 and 	--其他费养护里程
			isnull(A1005,0)=0 and 	--固定养护
			isnull(A1006,0)=0 	--季节性固定养护
				) 	
               	update a12
               	set 	a0321=nullif(a0321,0),
                    	a0322=nullif(a0322,0),
                  	a0323=nullif(a0323,0),
 		   	A1002=nullif(A1002,0),
                   	A1003=nullif(A1003,0),
                   	A1004=nullif(A1004,0),
                   	A1005=nullif(A1005,0),
                   	A1006=nullif(A1006,0)

		---汇总A52
		delete A52 --where left(a0101,4)= @CurYear --只删除本年新加入的数据
		if object_id('tempdb..#本年新建里程A52') is not null	  drop table #本年新建里程A52
		select
		A0102,
		Max(HA0102) ha0102,
		K0101,
		[高速四车道里程]	= sum(case when K0304='10' and K0404='4' then K0114 else 0 end),
		[高速六车道里程]	= sum(case when K0304='10' and K0404='6' then K0114 else 0 end),
		[高速八车道及以上里程]	= sum(case when K0304='10' and K0404 >='8' then K0114 else 0 end)
		into #本年新建里程A52
		from K01 
		where 
			(K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' and 
			left(A0101,4)=@CurYear and a3219='1' and K0304='10' and left(k0101,1) in ('g','s','x','y','z','c')
		group by A0102,K0101
		--------------------------------------
		if object_id('tempdb..#非本年新建里程数A52') is not null	drop table #非本年新建里程数A52
		select
		A0102,
		Max(HA0102) ha0102,
		K0101,
		[高速四车道里程]	= sum(case when K0304='10' and K0404='4' then K0114 else 0 end),
		[高速六车道里程]	= sum(case when K0304='10' and K0404='6' then K0114 else 0 end),
		[高速八车道及以上里程]	= sum(case when K0304='10' and K0404 >='8' then K0114 else 0 end)
		into #非本年新建里程数A52
		from K01 
		where 
			(K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' and 
			not(left(A0101,4)=@CurYear and a3219='1') and K0304='10' and left(k0101,1) in ('g','s','x','y','z','c')
		group by A0102,K0101		
		-------------------------------------------
		--下面计算上年底到达,#上年底到达
		if object_id('tempdb..#上年底到达A52') is not null		drop table #上年底到达A52
		select a0102,k0101,
		sum(A0304)	A0304 ,
		sum(A0305)	A0305 ,
		sum(A0306)	A0306 
		into #上年底到达A52
		from a52 where a0101<@CurYear group by a0102,k0101

		--下面(^@^):由于所有里程为0的不计算，所以路线名称、通车日期等字段不能填写到A51表中.
		insert a52 (a0102,ha0102,k0101,a3219,ha3219,a0101,ha0101,K0105,K0106,K0116,K0104,K0103,A0208,A0131,A0130)
		select a0102,ha0102,k0101,'1','新建',@CurYear,@CurYear+'年',0,0,'192107','A2','B2','192107','9',ha0102 from A50

		insert a52 (a0102,ha0102,k0101,a3219,ha3219,a0101,ha0101,K0105,K0106,K0116,K0104,K0103,A0208,A0131,A0130)
		select a0102,ha0102,k0101,'2','改建',@CurYear,@CurYear+'年',0,0,'192107','A2','B2','192107','9',ha0102 from A50
		--新建数直接填写到A51表中.
		update a52 set
		A0304=[高速四车道里程],
		A0305=[高速六车道里程],
		A0306=[高速八车道及以上里程]
		from #本年新建里程A52 
		where 
		a52.a0101=@CurYear and a52.a3219='1' and
		#本年新建里程A52.a0102=a52.a0102 and #本年新建里程A52.k0101=a52.k0101

		/*计算A51表中本年改建的数据：路段表中非本新建-上年底到达数*/
		update a52
		set
		A0304=a.[高速四车道里程]	-isnull(b.A0304,0),
		A0305=a.[高速六车道里程]	-isnull(b.A0305,0),
		A0306=a.[高速八车道及以上里程]	-isnull(b.A0306,0)
		from 
		#非本年新建里程数A52 a 
		join a52 on a.a0102=a52.a0102 and a.k0101=a52.k0101 and a52.a3219='2' and a52.a0101=@curyear
		left join #上年底到达A52 b on a.a0102=b.a0102 and a.k0101=b.k0101

		delete a52 
		where left(a0101,4)=@curyear and
		isnull(	A0304 	,0) =0 and
		isnull(	A0305 	,0) =0 and
		isnull(	A0306 	,0) =0 
		--A51是A50的子表，同一条路线以下字段值相同
		if object_id('tempdb..#qdzh') is not null drop table #qdzh
                if object_id('tempdb..#zdzh') is not null drop table #zdzh
		if object_id('tempdb..#qdmc') is not null drop table #qdmc
		if object_id('tempdb..#zdmc') is not null drop table #zdmc
		if object_id('tempdb..#tcsj') is not null drop table #tcsj
		if object_id('tempdb..#yssj') is not null drop table #yssj
		if object_id('tempdb..#gydw') is not null drop table #gydw
		if object_id('tempdb..#xz') is not null drop table #xz

		update a set a.K0112=b.K0112 from A52 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102

		select K01.A0102 a,K01.K0101 b,min(case when K0108 is not null  then K0108 else K0105 end) c,K01.A3219 d
							into  #qdzh
							from 
								A52 
								full join 
								K01 on (K01.A0102=A52.A0102 and K01.K0101=A52.K0101 and K01.A3219=A52.A3219)
							where left(k01.A0101,4)=@CurYear
							group by K01.A0102,K01.K0101,K01.A3219

		update A52 set K0105=c
					from #qdzh
					where a=A52.A0102 and b=A52.K0101 and d=A52.A3219 and left(A52.A0101,4)=@CurYear

		select K01.A0102 a,K01.K0101 b,max(case when K0109 is not null  then K0109 else K0106 end) c,K01.A3219 d
							into #zdzh
							from
							A52 
							full join 
							K01 on (K01.A0102=A52.A0102 and K01.K0101=A52.K0101 and K01.A3219=A52.A3219)
							where left(k01.A0101,4)=@CurYear
							group by K01.A0102,K01.K0101,K01.A3219
		update A52 set K0106=c
					from #zdzh
					where a=A52.A0102 and b=A52.K0101 and d=A52.A3219 and left(A52.A0101,4)=@CurYear

		select rtrim(isnull(K0110,0))c,k01.a0102 a,k01.k0101 b,k01.k0108 e into #qdmc from K01,a52 where k01.A0102=A52.A0102 and k01.K0101=A52.K0101 and k01.K0108=A52.K0105 and k01.k0304='10'

		update A52 set k0103=c from #qdmc where a=A52.A0102 and b=A52.K0101 and e=A52.K0105 and left(A52.A0101,4)=@CurYear

		select rtrim(isnull(K0111,'')) c,k01.a0102 a,k01.k0101 b, k01.k0109 d  into #zdmc from K01,a52 where k01.A0102=A52.A0102 and k01.K0101=A52.K0101 and k01.K0109=A52.K0106 and k0304='10'

		update A52 set k0104=c from #zdmc where a=A52.A0102 and b=A52.K0101 and d=A52.K0106 and left(A52.A0101,4)=@CurYear

		select k01.a0102 a,k01.k0101 b, isnull(k01.K0116,'192107') c,k01.k0108 d into #tcsj from K01,a52 where k01.A0102=A52.A0102 and k01.K0101=A52.K0101 and k01.K0108=A52.K0105 and left(a52.A0101,4)=@CurYear

		update A52 set K0116=c from #tcsj where a=A52.A0102 and b=A52.K0101 and d=A52.K0105

		update A52 set A0304=nullif(A0304,0),A0305=nullif(A0305,0),A0306=nullif(A0306,0)

		--A50表中没有验收时间,用通车日期代替
		select rtrim(isnull(a50.K0116,'192107')) c,a50.a0102 a,a50.k0101 b into #yssj from a50,a52 where a50.A0102=A52.A0102 and a50.K0101=A52.K0101 and left(A52.A0101,4)=@CurYear

		update A52 set A0208=c from #yssj where a=A52.A0102 and b=A52.K0101

		--A50表中没有管养单位性质,从A01表中提取
		select rtrim(isnull(a01.a0131,'')) c, rtrim(isnull(a01.ha0131,'')) d, a01.a0102 a, a52.k0101 b into #xz from a01, a52 where a01.A0102=A52.A0102 and left(A52.A0101,4)=@CurYear 

		update A52 set a0131=c,ha0131=d from #xz where b=A52.K0101 and a=A52.A0102

		--A50表中没有管养单位名称,用管理单位名称代替
		select rtrim(isnull(a50.ha0102,'')) c ,a50.a0102 a,a50.k0101 b into #gydw from a50, a52 where a50.A0102=A52.A0102 and a50.K0101=A52.K0101 and left(A52.A0101,4)=@CurYear

		update A52 set A52.a0130=c from #gydw where b=A52.K0101 and a=A52.A0102


                /*---更新默认数据
                UPDATE A52 SET A52.K0105=A50.K0105,A52.K0106=A50.K0106
                FROM A52,A50
                WHERE A52.A0102=A50.A0102 AND A52.K0101=A50.K0101 AND A52.K0105=0 AND A52.K0106=0 
                UPDATE A52 SET A52.K0103=A50.K0103,A52.K0104=A50.K0104
                FROM A52,A50
                WHERE A52.A0102=A50.A0102 AND A52.K0101=A50.K0101 AND (A52.K0103='B2' or A52.K0104='A2')*/

		---更新A52表非新建指标项
		if object_id('tempdb..#k01_ZB') is not null drop table #k01_ZB
		select a0102,ha0102=max(ha0102),K0101,k0105=min(k0108),k0106=max(k0109),
		k0103=min(k0110),k0104=max(k0111),a0208=max(k0116)
		into #k01_ZB
		from k01
		where k0304='10' and (k0124 is null or k0124='') and isnull(k0123,2)='2'
		group by a0102,k0101

		--更新起止点名称
		update A  SET A.K0103=B.K0110
		FROM #k01_ZB A,K01 B
		WHERE A.A0102=B.A0102 AND A.K0101=B.K0101 AND A.K0105=B.K0108

		update A SET A.K0104=B.K0111
		FROM #k01_ZB A,K01 B
		WHERE A.A0102=B.A0102 AND A.K0101=B.K0101 AND A.K0106=B.K0109

		--更新A52
		update A  SET A.K0105=B.K0105
		FROM A52 A
		JOIN #k01_ZB B
		ON A.A0102=B.A0102 AND A.K0101=B.K0101
		WHERE A.A3219<>'1'

		update A  SET A.K0106=B.K0106
		FROM A52 A
		JOIN #k01_ZB B
		ON A.A0102=B.A0102 AND A.K0101=B.K0101
		WHERE A.A3219<>'1'

		update A  SET A.K0103=B.K0103
		FROM A52 A
		JOIN #k01_ZB B
		ON A.A0102=B.A0102 AND A.K0101=B.K0101 AND A.K0105=B.K0105
		WHERE A.A3219<>'1'

		update A  SET A.K0104=B.K0104
		FROM A52 A
		JOIN #k01_ZB B
		ON A.A0102=B.A0102 AND A.K0101=B.K0101 AND A.K0106=B.K0106
		WHERE A.A3219<>'1'

		update A52 set A52.K0116=ISNULL(K01.K0116,'192107') from K01 where K01.A0102=A52.A0102 and K01.K0101=A52.K0101 and K01.K0108=A52.K0105

		update A  SET A.A0208=B.A0208
		FROM A52 A
		JOIN #k01_ZB B
		ON A.A0102=B.A0102 AND A.K0101=B.K0101

		if not exists(select * from A52 where left(A0101,4)<@CurYear)
		begin
			update A52 set A3219='9',Ha3219='其他' where A3219='2'
		end

		update A52 set
		A0304=nullif(A0304,0),--高速四车道里程
		A0305=nullif(A0305,0),--高速六车道里程
		A0306=nullif(A0306,0)--高速八车道及以上里程	

		--<CONTROL
			SELECT 
				CAPTION='信息',
				LABELTEXT='已成功完成数据导入!',
				SHOWTITLE=0,
				WIDTH=260, 
				'确定(&Y)=' AS BUTTON
		--CONTROL>
	--汇总数据>
--时间输入完毕>
