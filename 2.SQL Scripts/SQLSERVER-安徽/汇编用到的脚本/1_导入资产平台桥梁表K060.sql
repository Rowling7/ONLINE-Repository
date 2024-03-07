if exists(select * from tempdb..sysobjects where id=object_id('tempdb..##tk060'))
drop table ##tk060
declare @softpath varchar(255);
declare @filepath varchar(255);
exec master..xp_regread	'hkey_local_machine'
	,'software\　东方永德\hrp-ghss\标准版\单机版\2014'
	,'path' , @softpath output
set @filepath=@softpath+'资产平台桥梁明细表.xls'

declare @query nvarchar(1000);
set @query =
    'select
        *
				into ##tk060
    from openrowset(''microsoft.jet.oledb.4.0'', ''excel 5.0;database=' + @filepath + ';hdr=yes'', ''select * from [明细表$]'')';

exec(@query);


	-- 插入资产平台桥梁数据
truncate table zcpt_k060

insert into zcpt_k060(
k6002, -- 桥梁名称
k6001, -- 桥梁编号
k6003, -- 桥梁中心桩号
k0101, -- 路线代码
k0112, -- 路线简称
hk0304, -- 技术等级
k6008, -- [桥梁全长(米)]
k6065, -- 跨径总长(米)
k6063, -- 单孔最大跨径(米)
k6064, -- 桥梁跨径组合(孔*米)
k6066, -- 桥梁全宽(米)
k6009, -- 桥面净宽(米)
k6007, -- 桥梁跨径分类
hk6007, -- 桥梁跨径分类
k6004, -- 按使用年限分
hk6004, -- 按使用年限分
k6016, -- 上部结构类型
hk6016, -- 上部结构类型
k6110, -- 上部结构材料
hk6110, -- 上部结构材料
k6017, -- 桥墩类型
hk6017, -- 桥墩类型
k6022, -- 设计荷载等级
hk6022, -- 设计荷载等级
k6023, -- 抗震等级
hk6023, -- 抗震等级
k6005, -- 跨越地物类型
hk6005, -- 跨越地物类型
k6006, -- 跨越地物名称
hk0149, -- 防洪标准(年)
hk6024, -- 通航等级
ha1328, -- 墩台防撞设施类型
hk6062, -- 立交桥类别
k6079, -- 建设单位名称
k6030, -- 设计单位名称
k6031, -- 施工单位名称
k6032, -- 监理单位名称
k0180, -- 修建年度
k0116, -- 通车日期
a1313, -- 管养单位性质
a1314, -- 管养单位名称
k6111, -- 监管单位名称
a1302, -- 收费性质代码
ha1302, -- 收费性质服务
k6028, -- 技术状况评定
hk6028, -- 技术状况评定
a1305, -- 评定日期
k6050, -- 技术状况评定单位
k0181, -- 改建年度
a1316, -- 改造完工日期
ha1317, -- 改造部位
ha1318, -- 工程性质
k6051, -- 改造施工单位
ha1319, -- 是否部补助项目
ha1306, -- 主要病害位置
k6102, -- 主要病害描述
a1307, -- 已采取交通管制措施
ha1307, -- 已采取交通管制措施
a0103, -- 行政区划
ha0103, -- 行政区划
hk6117, -- 桥梁所在位置
hk6118, -- 是否宽路窄桥
hk6119, -- 是否在长大桥梁目录中
hk6120, -- 是否跨省桥梁
hk6041, -- 是否公铁两用桥梁
k6040, -- 桥梁身份码
k0185, -- 经度
k0186 -- 纬度

)
select
桥梁名称 	,
桥梁编号 	,
桥梁中心桩号 	,
路线代码 	,
case when len(路线简称)>0 then 路线简称 when len(路线简称)=0 or 路线简称 is null then null end 路线简称,
case when len(技术等级)>0 then 技术等级 when len(技术等级)=0 or 技术等级 is null then null end 技术等级,
[桥梁全长(米)] 	,
[跨径总长(米)] 	,
[单孔最大跨径(米)] 	,
[桥梁跨径组合(孔*米)] 	,
[桥梁全宽(米)] 	,
[桥面净宽(米)] 	,
桥梁跨径分类代码 	,
case when len(桥梁跨径分类汉字)>0 then 桥梁跨径分类汉字 when len(桥梁跨径分类汉字)=0 or 桥梁跨径分类汉字 is null then null end ,
case when len(按使用年限分代码)>0 then 按使用年限分代码 when len(按使用年限分代码)=0 or 按使用年限分代码 is null then null end ,
case when len(按使用年限分汉字)>0 then 按使用年限分汉字 when len(按使用年限分汉字)=0 or 按使用年限分汉字 is null then null end ,
上部结构类型代码 	,
case when len(上部结构类型汉字)>0 then 上部结构类型汉字 when len(上部结构类型汉字)=0 or 上部结构类型汉字 is null then null end ,
上部结构材料代码 	,
case when len(上部结构材料汉字)>0 then 上部结构材料汉字 when len(上部结构材料汉字)=0 or 上部结构材料汉字 is null then null end ,
桥墩类型代码 	,
case when len(桥墩类型汉字)>0 then 桥墩类型汉字 when len(桥墩类型汉字)=0 or 桥墩类型汉字 is null then null end ,
设计荷载等级代码 	,
case when len(设计荷载等级汉字)>0 then 设计荷载等级汉字 when len(设计荷载等级汉字)=0 or 设计荷载等级汉字 is null then null end ,
抗震等级代码 	,
case when len(抗震等级汉字)>0 then 抗震等级汉字 when len(抗震等级汉字)=0 or 抗震等级汉字 is null then null end ,
跨越地物类型代码 	,
case when len(跨越地物类型汉字)>0 then 跨越地物类型汉字 when len(跨越地物类型汉字)=0 or 跨越地物类型汉字 is null then null end ,
case when len(跨越地物名称)>0 then 跨越地物名称 when len(跨越地物名称)=0 or 跨越地物名称 is null then null end ,
case when len([防洪标准(年)])>0 then [防洪标准(年)] when len([防洪标准(年)])=0 or [防洪标准(年)] is null then null end ,
replace(case when len(通航等级)>0 then 通航等级 when len(通航等级)=0 or 通航等级 is null then null end,'航道','') ,
case when len(墩台防撞设施类型)>0 then 墩台防撞设施类型 when len(墩台防撞设施类型)=0 or 墩台防撞设施类型 is null then null end ,
case when len(立交桥类别)>0 then 立交桥类别 when len(立交桥类别)=0 or 立交桥类别 is null then null end ,
case when len(建设单位名称)>0 then 建设单位名称 when len(建设单位名称)=0 or 建设单位名称 is null then null end ,
case when len(设计单位名称)>0 then 设计单位名称 when len(设计单位名称)=0 or 设计单位名称 is null then null end ,
case when len(施工单位名称)>0 then 施工单位名称 when len(施工单位名称)=0 or 施工单位名称 is null then null end ,
case when len(监理单位名称)>0 then 监理单位名称 when len(监理单位名称)=0 or 监理单位名称 is null then null end ,
case when len(replace(修建年度, '-' ,'')) >0 then replace(修建年度, '-' ,'') when len(replace(修建年度, '-' ,'')) =0 or replace(修建年度, '-' ,'') is null then null end 修建年度	,
case when len(replace(通车日期, '-' ,'')) >0 then replace(通车日期, '-' ,'') when len(replace(通车日期, '-' ,'')) =0 or replace(通车日期, '-' ,'') is null then null end 通车日期	,
管养单位性质 	,
case when len(管养单位名称)>0 then 管养单位名称 when len(管养单位名称)=0 or 管养单位名称 is null then null end ,
case when len(监管单位名称)>0 then 监管单位名称 when len(监管单位名称)=0 or 监管单位名称 is null then null end ,
收费性质代码 	,
case when len(收费性质汉字)>0 then 收费性质汉字 when len(收费性质汉字)=0 or 收费性质汉字 is null then null end ,
技术状况评定代码 	,
case when len(技术状况评定汉字)>0 then 技术状况评定汉字 when len(技术状况评定汉字)=0 or 技术状况评定汉字 is null then null end ,
case when len(replace(评定日期, '-' ,'')) >0 then replace(评定日期, '-' ,'') when len(replace(评定日期, '-' ,'')) =0 or replace(评定日期, '-' ,'') is null then null end 评定日期	,
case when len(技术状况评定单位)>0 then 技术状况评定单位 when len(技术状况评定单位)=0 or 技术状况评定单位 is null then null end ,
case when len(改建年度)>0 then 改建年度 when len(改建年度)=0 or 改建年度 is null then null end ,
case when len(replace(改造完工日期, '-' ,'')) >0 then replace(改造完工日期, '-' ,'') when len(replace(改造完工日期, '-' ,'')) =0 or replace(改造完工日期, '-' ,'') is null then null end 改造完工日期	,
case when len(改造部位)>0 then 改造部位 when len(改造部位)=0 or 改造部位 is null then null end 改造部位,
case when len(工程性质)>0 then 工程性质 when len(工程性质)=0 or 工程性质 is null then null end 工程性质,
case when len(改造施工单位)>0 then 改造施工单位 when len(改造施工单位)=0 or 改造施工单位 is null then null end 改造施工单位,
case when len(是否部补助项目)>0 then 是否部补助项目 when len(是否部补助项目)=0 or 是否部补助项目 is null then null end 是否部补助项目,
case when len(主要病害位置)>0 then 主要病害位置 when len(主要病害位置)=0 or 主要病害位置 is null then null end 主要病害位置,
case when len(主要病害描述)>0 then 主要病害描述 when len(主要病害描述)=0 or 主要病害描述 is null then null end 主要病害描述,
case when len(已采取交通管制措施代码)>0 then rtrim(已采取交通管制措施代码) when len(已采取交通管制措施代码)=0 or rtrim(已采取交通管制措施代码) is null then null end 已采取交通管制措施代码,
case when len(已采取交通管制措施汉字)>0 then 已采取交通管制措施汉字 when len(已采取交通管制措施汉字)=0 or 已采取交通管制措施汉字 is null then null end 已采取交通管制措施汉字,
case when len(行政区划代码)>0 then 行政区划代码 when len(行政区划代码)=0 or 行政区划代码 is null then null end ,
case when len(行政区划汉字)>0 then 行政区划汉字 when len(行政区划汉字)=0 or 行政区划汉字 is null then null end ,
case when len(桥梁所在位置)>0 then 桥梁所在位置 when len(桥梁所在位置)=0 or 桥梁所在位置 is null then null end ,
case when len(是否宽路窄桥)>0 then 是否宽路窄桥 when len(是否宽路窄桥)=0 or 是否宽路窄桥 is null then null end ,
case when len(是否在长大桥梁目录中)>0 then 是否在长大桥梁目录中 when len(是否在长大桥梁目录中)=0 or 是否在长大桥梁目录中 is null then null end ,
case when len(是否跨省桥梁)>0 then 是否跨省桥梁 when len(是否跨省桥梁)=0 or 是否跨省桥梁 is null then null end ,
case when len(是否公铁两用桥梁)>0 then 是否公铁两用桥梁 when len(是否公铁两用桥梁)=0 or 是否公铁两用桥梁 is null then null end ,
桥梁身份码 	,
经度,
纬度
from ##tk060

--更新管理单位字段a0102,ha0102
update zcpt_k060
set zcpt_k060.a0102=rtrim(k060.a0102),zcpt_k060.ha0102=rtrim(k060.ha0102)
from zcpt_k060
left join k060
on (case when left(k060.k0101,1)in ('h','g','t','s') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'h','g'),'t','s'),'340000',''),'000000',''),'d001',''),'d002',''),'d003',''))+left(k060.a0103,6)+'l'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'l'+rtrim(k060.k6001) end)= rtrim(zcpt_k060.k6001)
--更新管理单位字段a0102,ha0102
update zcpt_k060
set zcpt_k060.a0102=rtrim(k001.a0102),zcpt_k060.ha0102=rtrim(k001.ha0102)
from zcpt_k060
left join k001
on rtrim(replace(replace(replace(replace(replace(replace(replace(zcpt_k060.k0101,'h','g'),'t','s'),'340000',''),'000000',''),'d001',''),'d002',''),'d003',''))=rtrim(replace(replace(replace(replace(replace(replace(replace(k001.k0101,'h','g'),'t','s'),'340000',''),'000000',''),'d001',''),'d002',''),'d003','')) and zcpt_k060.k6003>=k001.k0108 and zcpt_k060.k6003<=k001.k0109
where zcpt_k060.a0102 is null
drop table ##tk060


--<CONTROL
	SELECT
		'执行结果' AS CAPTION ,
		LABELTEXT='导入完成'+char(13)+char(10),
		370 AS WIDTH ,
		0 AS HEIGHT,
		'确定=' AS BUTTON,
		0 AS SHOWTITLE,
		'select null' as datasource
--CONTROL>