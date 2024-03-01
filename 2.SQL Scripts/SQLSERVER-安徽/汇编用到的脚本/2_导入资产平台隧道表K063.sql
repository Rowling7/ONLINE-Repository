if exists(select * from tempdb..sysobjects where id=object_id('tempdb..##tk063'))
drop table ##tk063
declare @softpath varchar(255);
declare @filepath varchar(255);
exec master..xp_regread	'hkey_local_machine'
	,'software\　东方永德\hrp-ghss\标准版\单机版\2014'
	,'path' , @softpath output
set @filepath=@softpath+'资产平台隧道明细表.xls'

declare @query nvarchar(1000);
set @query = 
    'select 
        *
				into ##tk063
    from openrowset(''microsoft.jet.oledb.4.0'', ''excel 5.0;database=' + @filepath + ';hdr=yes'', ''select * from [明细表$]'')';

exec(@query);


truncate table zcpt_k063
insert into zcpt_k063(
k6302,-- 隧道名称
sddm,-- 隧道代码
k6303,-- 隧道入口桩号
k0101,-- 路线编号
k0112,-- 路线名称
k0304,-- 技术等级
k6305,-- 隧道长度（米）
k6306,-- 隧道净宽（米）
k6307,-- 隧道净高（米）
k6304,-- 按隧道长度分类
hk6304,-- 按隧道长度分类
k6335,-- 是否水下隧道
k0180,-- 修建年度
k6079,-- 建设单位名称
k6030,-- 设计单位名称
k6031,-- 施工单位名称
k6032,-- 监理单位名称
k0116,-- 建成通车时间
a1313,-- 单位性质代码
a0130,-- 名称
k6111,-- 监管单位名称
hk6346,-- 评定等级
k6344,-- 评定日期
k6345,-- 评定单位
hk6336,-- 评定等级
k6347,-- 评定日期
k6348,-- 评定单位
hk6349,-- 评定等级
k6350,-- 评定日期
k6351,-- 评定单位
hk6352,-- 评定等级
k6353,-- 评定日期
k6354,-- 评定单位
k0181,-- 改造年度
a1316,-- 完工日期
k6337,-- 改造部位
a1318,-- 工程性质
k6338,-- 病害部位
k6339,-- 病害描述
a0103,-- 所在政区代码
k6370,-- 隧道所在位置
k6355,-- 是否在长大隧道目录中
k6371,-- 是否跨省隧道
k0199,-- 备注
sdgcs,-- 隧道工程师
k0185,-- 经度
k0186,-- 纬度
k6343-- 隧道养护等级
)
select
case when len(隧道名称) >0 then 隧道名称 when len(隧道名称) =0 or 隧道名称 is null then null end 隧道名称	,
case when len(隧道代码) >0 then 隧道代码 when len(隧道代码) =0 or 隧道代码 is null then null end 隧道代码	,
case when len(隧道入口桩号) >0 then 隧道入口桩号 when len(隧道入口桩号) =0 or 隧道入口桩号 is null then null end 隧道入口桩号	,
case when len(rtrim(replace(replace(replace(replace(replace(路线编号,'340000',''),'000000',''),'d001',''),'d002',''),'d003',''))) >0 then rtrim(replace(replace(replace(replace(replace(路线编号,'340000',''),'000000',''),'d001',''),'d002',''),'d003','')) when len(rtrim(replace(replace(replace(replace(replace(路线编号,'340000',''),'000000',''),'d001',''),'d002',''),'d003',''))) =0 or rtrim(replace(replace(replace(replace(replace(路线编号,'340000',''),'000000',''),'d001',''),'d002',''),'d003','')) is null then null end 路线编号	,
case when len(路线名称) >0 then 路线名称 when len(路线名称) =0 or 路线名称 is null then null end 路线名称	,
case when len(技术等级) >0 then 技术等级 when len(技术等级) =0 or 技术等级 is null then null end 技术等级	,
case when len(隧道长度) >0 then 隧道长度 when len(隧道长度) =0 or 隧道长度 is null then null end 隧道长度	,
case when len(隧道净宽) >0 then 隧道净宽 when len(隧道净宽) =0 or 隧道净宽 is null then null end 隧道净宽	,
case when len(隧道净高) >0 then 隧道净高 when len(隧道净高) =0 or 隧道净高 is null then null end 隧道净高	,
case when len(按隧道长度分类1) >0 then 按隧道长度分类1 when len(按隧道长度分类1) =0 or 按隧道长度分类1 is null then null end 按隧道长度分类1	,
case when len(按隧道长度分类) >0 then 按隧道长度分类 when len(按隧道长度分类) =0 or 按隧道长度分类 is null then null end 按隧道长度分类	,
case when len(是否水下隧道) >0 then 是否水下隧道 when len(是否水下隧道) =0 or 是否水下隧道 is null then null end 是否水下隧道	,
case when len(replace(修建年度, '-' ,'')) >0 then replace(修建年度, '-' ,'') when len(replace(修建年度, '-' ,'')) =0 or replace(修建年度, '-' ,'') is null then null end 修建年度	,
case when len(建设单位名称) >0 then 建设单位名称 when len(建设单位名称) =0 or 建设单位名称 is null then null end 建设单位名称	,
case when len(设计单位名称) >0 then 设计单位名称 when len(设计单位名称) =0 or 设计单位名称 is null then null end 设计单位名称	,
case when len(施工单位名称) >0 then 施工单位名称 when len(施工单位名称) =0 or 施工单位名称 is null then null end 施工单位名称	,
case when len(监理单位名称) >0 then 监理单位名称 when len(监理单位名称) =0 or 监理单位名称 is null then null end 监理单位名称	,
case when len(replace(建成通车时间, '-' ,'')) >0 then replace(建成通车时间, '-' ,'') when len(replace(建成通车时间, '-' ,'')) =0 or replace(建成通车时间, '-' ,'') is null then null end 建成通车时间	,
case when len(单位性质代码) >0 then 单位性质代码 when len(单位性质代码) =0 or 单位性质代码 is null then null end 单位性质代码	,
case when len(名称) >0 then 名称 when len(名称) =0 or 名称 is null then null end 名称	,
case when len(监管单位名称) >0 then 监管单位名称 when len(监管单位名称) =0 or 监管单位名称 is null then null end 监管单位名称	,
case when len(评定等级总体) >0 then 评定等级总体 when len(评定等级总体) =0 or 评定等级总体 is null then null end 评定等级总体	,
case when len(replace(评定日期总体, '-', '')) >0 then replace(评定日期总体, '-', '') when len(replace(评定日期总体, '-', '')) =0 or replace(评定日期总体, '-', '') is null then null end 评定日期总体	,
case when len(评定单位总体) >0 then 评定单位总体 when len(评定单位总体) =0 or 评定单位总体 is null then null end 评定单位总体	,
case when len(评定等级土建结构) >0 then 评定等级土建结构 when len(评定等级土建结构) =0 or 评定等级土建结构 is null then null end 评定等级土建结构	,
case when len(replace(评定日期土建结构, '-', '')) >0 then replace(评定日期土建结构, '-', '') when len(replace(评定日期土建结构, '-', '')) =0 or replace(评定日期土建结构, '-', '') is null then null end 评定日期土建结构	,
case when len(评定单位土建结构) >0 then 评定单位土建结构 when len(评定单位土建结构) =0 or 评定单位土建结构 is null then null end 评定单位土建结构	,
case when len(评定等级机电设施) >0 then 评定等级机电设施 when len(评定等级机电设施) =0 or 评定等级机电设施 is null then null end 评定等级机电设施	,
case when len(replace(评定日期机电设施, '-', '')) >0 then replace(评定日期机电设施, '-', '') when len(replace(评定日期机电设施, '-', '')) =0 or replace(评定日期机电设施, '-', '') is null then null end 评定日期机电设施	,
case when len(评定单位机电设施) >0 then 评定单位机电设施 when len(评定单位机电设施) =0 or 评定单位机电设施 is null then null end 评定单位机电设施	,
case when len(评定等级其他工程设施) >0 then 评定等级其他工程设施 when len(评定等级其他工程设施) =0 or 评定等级其他工程设施 is null then null end 评定等级其他工程设施	,
case when len(replace(评定日期其他工程设施, '-', '') ) >0 then replace(评定日期其他工程设施, '-', '')  when len(replace(评定日期其他工程设施, '-', '') ) =0 or replace(评定日期其他工程设施, '-', '')  is null then null end 评定日期其他工程设施	,
case when len(评定单位其他工程设施) >0 then 评定单位其他工程设施 when len(评定单位其他工程设施) =0 or 评定单位其他工程设施 is null then null end 评定单位其他工程设施	,
case when len(改造年度) >0 then 改造年度 when len(改造年度) =0 or 改造年度 is null then null end 改造年度	,
case when len(replace(完工日期 ,'-' ,'')) >0 then replace(完工日期 ,'-' ,'') when len(replace(完工日期 ,'-' ,'')) =0 or replace(完工日期 ,'-' ,'') is null then null end  完工日期	,
case when len(改造部位) >0 then 改造部位 when len(改造部位) =0 or 改造部位 is null then null end 改造部位	,
case when len(工程性质) >0 then 工程性质 when len(工程性质) =0 or 工程性质 is null then null end 工程性质	,
case when len(病害部位) >0 then 病害部位 when len(病害部位) =0 or 病害部位 is null then null end 病害部位	,
case when len(病害描述) >0 then 病害描述 when len(病害描述) =0 or 病害描述 is null then null end 病害描述	,
case when len(所在政区代码) >0 then 所在政区代码 when len(所在政区代码) =0 or 所在政区代码 is null then null end 所在政区代码	,
case when len(隧道所在位置) >0 then 隧道所在位置 when len(隧道所在位置) =0 or 隧道所在位置 is null then null end 隧道所在位置	,
case when len(是否在长大隧道目录中) >0 then 是否在长大隧道目录中 when len(是否在长大隧道目录中) =0 or 是否在长大隧道目录中 is null then null end 是否在长大隧道目录中	,
case when len(是否跨省隧道) >0 then 是否跨省隧道 when len(是否跨省隧道) =0 or 是否跨省隧道 is null then null end 是否跨省隧道	,
case when len(备注) >0 then 备注 when len(备注) =0 or 备注 is null then null end 备注	,
case when len(隧道工程师) >0 then 隧道工程师 when len(隧道工程师) =0 or 隧道工程师 is null then null end 隧道工程师	,
case when len(经度) >0 then 经度 when len(经度) =0 or 经度 is null then null end 经度	,
case when len(纬度) >0 then 纬度 when len(纬度) =0 or 纬度 is null then null end 纬度	,
case when len(隧道养护等级) >0 then 隧道养护等级 when len(隧道养护等级) =0 or 隧道养护等级 is null then null end 隧道养护等级	
from ##tk063



--更新管理单位字段a0102,ha0102
update zcpt_k063
set zcpt_k063.a0102=rtrim(k001.a0102),zcpt_k063.ha0102=rtrim(k001.ha0102)
--select zcpt_k063.a0102,rtrim(k001.a0102),zcpt_k063.ha0102,rtrim(k001.ha0102)
from zcpt_k063
left join  k001
on rtrim(zcpt_k063.k0101)=rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'d001',''),'d002',''),'d003','')) and isnull(zcpt_k063.k6303,0)>=isnull(k001.k0108,0) and isnull(zcpt_k063.k6303,0)<=isnull(k001.k0109,0)

drop table ##tk063


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