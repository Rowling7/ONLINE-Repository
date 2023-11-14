

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ZCPT_K060]') AND type IN ('U'))
	DROP TABLE [dbo].[ZCPT_K060]
CREATE TABLE ZCPT_K060(
  [K6002] char(100) COLLATE Chinese_PRC_CI_AS   NULL, --桥梁名称 
  [K6001] char(100) COLLATE Chinese_PRC_CI_AS   NULL, --桥梁编号 
  [K6003] numeric(18,3)   NULL, --桥梁中心桩号 
  [K0101] char(15) COLLATE Chinese_PRC_CI_AS   NULL, --路线代码 
  [K0112] char(60) COLLATE Chinese_PRC_CI_AS  NULL, --路线简称 
  [HK0304] char(8) NULL, --所属路线技术等级
	[K6008] numeric(18,2)  NULL, --[桥梁全长(米)] 
  [K6065] numeric(18,2)  NULL, --跨径总长(米) 
  [K6063] numeric(18,2)  NULL, --单孔最大跨径(米) 	
  [K6064] char(250) COLLATE Chinese_PRC_CI_AS  NULL, --桥梁跨径组合(孔*米) 
  [K6066] numeric(18,2)  NULL, --桥梁全宽(米) 
  [K6009] numeric(18,2)  NULL, --桥面净宽(米) 
  [K6007] char(2) COLLATE Chinese_PRC_CI_AS  NULL, --桥梁跨径分类 
  [HK6007] char(10) COLLATE Chinese_PRC_CI_AS  NULL, --桥梁跨径分类 
  [K6004] char(2) COLLATE Chinese_PRC_CI_AS  NULL, --按使用年限分 
  [HK6004] char(14) COLLATE Chinese_PRC_CI_AS  NULL, --按使用年限分 
  [K6016] char(4) COLLATE Chinese_PRC_CI_AS  NULL, --上部结构类型 
  [HK6016] char(22) COLLATE Chinese_PRC_CI_AS  NULL, --上部结构类型 
  [K6110] char(2) COLLATE Chinese_PRC_CI_AS  NULL, --上部结构材料 
  [HK6110] char(20) COLLATE Chinese_PRC_CI_AS  NULL, --上部结构材料 
  [K6017] char(2) COLLATE Chinese_PRC_CI_AS  NULL, --桥墩类型 
  [HK6017] char(10) COLLATE Chinese_PRC_CI_AS  NULL, --桥墩类型 
  [K6022] char(2) COLLATE Chinese_PRC_CI_AS  NULL, --设计荷载等级 
  [HK6022] char(16) COLLATE Chinese_PRC_CI_AS  NULL, --设计荷载等级 
  [K6023] char(3) COLLATE Chinese_PRC_CI_AS  NULL, --抗震等级 
  [HK6023] char(20) COLLATE Chinese_PRC_CI_AS  NULL, --抗震等级 
  [K6005] char(1) COLLATE Chinese_PRC_CI_AS  NULL, --跨越地物类型 
  [HK6005] char(28) COLLATE Chinese_PRC_CI_AS  NULL, --跨越地物类型 
  [K6006] char(40) COLLATE Chinese_PRC_CI_AS  NULL, --跨越地物名称 
  [HK0149] char(10) COLLATE Chinese_PRC_CI_AS  NULL, --防洪标准(年) 
  [HK6024] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --通航等级 
  [HA1328] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --墩台防撞设施类型 
  [hK6062] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --立交桥类别 
  [K6079] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --建设单位名称 
  [K6030] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --设计单位名称 
  [K6031] char(200) COLLATE Chinese_PRC_CI_AS  NULL, --施工单位名称 
  [K6032] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --监理单位名称 
  [K0180] char(8) COLLATE Chinese_PRC_CI_AS  NULL, --修建年度 
  [K0116] char(8) COLLATE Chinese_PRC_CI_AS  NULL, --通车日期 
  [A1313] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --管养单位性质 
  [A1314] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --管养单位名称 
  [K6111] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --监管单位名称 
  [A1302] char(3) COLLATE Chinese_PRC_CI_AS  NULL, --收费性质 
  [HA1302] char(20) COLLATE Chinese_PRC_CI_AS  NULL, --收费性质 
  [K6028] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --技术状况评定 
  [HK6028] char(20) COLLATE Chinese_PRC_CI_AS  NULL, --技术状况评定 
  [A1305] char(8) COLLATE Chinese_PRC_CI_AS  NULL, --评定日期 
  [K6050] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --技术状况评定单位 
  [K0181] char(8) COLLATE Chinese_PRC_CI_AS  NULL, --改建年度 
  [A1316] char(8) COLLATE Chinese_PRC_CI_AS  NULL, --改造完工日期 
  [HA1317] char(200) COLLATE Chinese_PRC_CI_AS  NULL, --改造部位 
  [HA1318] char(20) COLLATE Chinese_PRC_CI_AS  NULL, --工程性质 
  [K6051] char(200) COLLATE Chinese_PRC_CI_AS  NULL, --改造施工单位 
  [HA1319] char(4) COLLATE Chinese_PRC_CI_AS  NULL, --是否部补助项目 
  [HA1306] char(200) COLLATE Chinese_PRC_CI_AS  NULL, --主要病害位置 
  [K6102] char(200) COLLATE Chinese_PRC_CI_AS  NULL, --主要病害描述 
  [A1307] char(3) COLLATE Chinese_PRC_CI_AS  NULL, --已采取交通管制措施 
  [HA1307] char(20) COLLATE Chinese_PRC_CI_AS  NULL, --已采取交通管制措施 
  [A0103] char(12) COLLATE Chinese_PRC_CI_AS  NULL, --行政区划 
  [HA0103] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --行政区划 
  [HK6117] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --桥梁所在位置 
  [HK6118] char(4) COLLATE Chinese_PRC_CI_AS  NULL, --是否宽路窄桥 
  [HK6119] char(4) COLLATE Chinese_PRC_CI_AS  NULL, --是否在长大桥梁目录中 
  [HK6120] char(4) COLLATE Chinese_PRC_CI_AS  NULL, --是否跨省桥梁 
  [HK6041] char(4) COLLATE Chinese_PRC_CI_AS  NULL, --是否公铁两用桥梁 
  [K6040] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --桥梁身份码 
	[K0185] numeric(12,8)  NULL, --经度 
  [K0186] numeric(12,8)  NULL --纬度 
)
	
	
	
	
	-- 插入资产平台桥梁数据
TRUNCATE table ZCPT_K060

insert into ZCPT_K060(
K6002, -- 桥梁名称
K6001, -- 桥梁编号
K6003, -- 桥梁中心桩号
K0101, -- 路线代码
K0112, -- 路线简称
HK0304, -- 技术等级
K6008, -- [桥梁全长(米)]
K6065, -- 跨径总长(米)
K6063, -- 单孔最大跨径(米)
K6064, -- 桥梁跨径组合(孔*米)
K6066, -- 桥梁全宽(米)
K6009, -- 桥面净宽(米)
K6007, -- 桥梁跨径分类
hK6007, -- 桥梁跨径分类
K6004, -- 按使用年限分
hK6004, -- 按使用年限分
K6016, -- 上部结构类型
hK6016, -- 上部结构类型
K6110, -- 上部结构材料
hK6110, -- 上部结构材料
K6017, -- 桥墩类型
hK6017, -- 桥墩类型
K6022, -- 设计荷载等级
hK6022, -- 设计荷载等级
K6023, -- 抗震等级
hK6023, -- 抗震等级
K6005, -- 跨越地物类型
hK6005, -- 跨越地物类型
K6006, -- 跨越地物名称
hK0149, -- 防洪标准(年)
hK6024, -- 通航等级
hA1328, -- 墩台防撞设施类型
hK6062, -- 立交桥类别
K6079, -- 建设单位名称
K6030, -- 设计单位名称
K6031, -- 施工单位名称
K6032, -- 监理单位名称
K0180, -- 修建年度
K0116, -- 通车日期
A1313, -- 管养单位性质
A1314, -- 管养单位名称
K6111, -- 监管单位名称
A1302, -- 收费性质代码
hA1302, -- 收费性质服务
K6028, -- 技术状况评定
hK6028, -- 技术状况评定
A1305, -- 评定日期
K6050, -- 技术状况评定单位
K0181, -- 改建年度
A1316, -- 改造完工日期
hA1317, -- 改造部位
hA1318, -- 工程性质
K6051, -- 改造施工单位
hA1319, -- 是否部补助项目
hA1306, -- 主要病害位置
K6102, -- 主要病害描述
A1307, -- 已采取交通管制措施
hA1307, -- 已采取交通管制措施
A0103, -- 行政区划
hA0103, -- 行政区划
hK6117, -- 桥梁所在位置
hK6118, -- 是否宽路窄桥
hK6119, -- 是否在长大桥梁目录中
hK6120, -- 是否跨省桥梁
hK6041, -- 是否公铁两用桥梁
K6040, -- 桥梁身份码
K0185, -- 经度
K0186 -- 纬度

)
select 
桥梁名称 	,
桥梁编号 	,
桥梁中心桩号 	,
路线代码 	,
路线简称 	,
技术等级 	,
[桥梁全长(米)] 	,
[跨径总长(米)] 	,
[单孔最大跨径(米)] 	,
[桥梁跨径组合(孔*米)] 	,
[桥梁全宽(米)] 	,
[桥面净宽(米)] 	,
桥梁跨径分类代码 	,
桥梁跨径分类汉字 	,
按使用年限分代码 	,
按使用年限分汉字 	,
上部结构类型代码 	,
上部结构类型汉字 	,
上部结构材料代码 	,
上部结构材料汉字 	,
桥墩类型代码 	,
桥墩类型汉字 	,
设计荷载等级代码 	,
设计荷载等级汉字 	,
抗震等级代码 	,
抗震等级汉字 	,
跨越地物类型代码 	,
跨越地物类型汉字 	,
跨越地物名称 	,
[防洪标准(年)] 	,
通航等级 	,
墩台防撞设施类型 	,
立交桥类别 	,
建设单位名称 	,
设计单位名称 	,
施工单位名称 	,
监理单位名称 	,
case when len(REPLACE(修建年度, '-' ,'')) >0 then REPLACE(修建年度, '-' ,'') when len(REPLACE(修建年度, '-' ,'')) =0 or REPLACE(修建年度, '-' ,'') is null then null end 修建年度	,
case when len(REPLACE(通车日期, '-' ,'')) >0 then REPLACE(通车日期, '-' ,'') when len(REPLACE(通车日期, '-' ,'')) =0 or REPLACE(通车日期, '-' ,'') is null then null end 通车日期	,
管养单位性质 	,
管养单位名称 	,
监管单位名称 	,
收费性质代码 	,
收费性质汉字 	,
技术状况评定代码 	,
技术状况评定汉字 	,
case when len(REPLACE(评定日期, '-' ,'')) >0 then REPLACE(评定日期, '-' ,'') when len(REPLACE(评定日期, '-' ,'')) =0 or REPLACE(评定日期, '-' ,'') is null then null end 评定日期	,
技术状况评定单位 	,
改建年度 	,
case when len(REPLACE(改造完工日期, '-' ,'')) >0 then REPLACE(改造完工日期, '-' ,'') when len(REPLACE(改造完工日期, '-' ,'')) =0 or REPLACE(改造完工日期, '-' ,'') is null then null end 改造完工日期	,
case when len(改造部位)>0 then 改造部位 when len(改造部位)=0 or 改造部位 is null then null end 改造部位,
case when len(工程性质)>0 then 工程性质 when len(工程性质)=0 or 工程性质 is null then null end 工程性质,
case when len(改造施工单位)>0 then 改造施工单位 when len(改造施工单位)=0 or 改造施工单位 is null then null end 改造施工单位,
case when len(是否部补助项目)>0 then 是否部补助项目 when len(是否部补助项目)=0 or 是否部补助项目 is null then null end 是否部补助项目,
case when len(主要病害位置)>0 then 主要病害位置 when len(主要病害位置)=0 or 主要病害位置 is null then null end 主要病害位置,
case when len(主要病害描述)>0 then 主要病害描述 when len(主要病害描述)=0 or 主要病害描述 is null then null end 主要病害描述,
case when len(已采取交通管制措施代码)>0 then 已采取交通管制措施代码 when len(已采取交通管制措施代码)=0 or 已采取交通管制措施代码 is null then null end 已采取交通管制措施代码,
case when len(已采取交通管制措施汉字)>0 then 已采取交通管制措施汉字 when len(已采取交通管制措施汉字)=0 or 已采取交通管制措施汉字 is null then null end 已采取交通管制措施汉字,
行政区划代码 	,
行政区划汉字 	,
桥梁所在位置 	,
是否宽路窄桥 	,
是否在长大桥梁目录中 	,
case when len(是否跨省桥梁)>0 then 是否跨省桥梁 when len(是否跨省桥梁)=0 or 是否跨省桥梁 is null then null end 是否跨省桥梁,
是否公铁两用桥梁 	,
桥梁身份码 	,
经度,
纬度
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\3.安徽工作文件\20231030 导入路段表\ZCPT_QL.xls',明细表$)