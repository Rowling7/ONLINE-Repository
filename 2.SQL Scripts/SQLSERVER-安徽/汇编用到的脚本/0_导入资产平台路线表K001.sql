if exists(select * from tempdb..sysobjects where id=object_id('tempdb..##tk001'))
drop table ##tk001
declare @softpath varchar(255);
declare @filepath varchar(255);
exec master..xp_regread	'hkey_local_machine'
	,'software\　东方永德\hrp-ghss\标准版\单机版\2014'
	,'path' , @softpath output
set @filepath=@softpath+'资产平台路线明细表.xls'

declare @query nvarchar(1000);
set @query = 
    'select 
        *
				into ##tk001
    from openrowset(''microsoft.jet.oledb.4.0'', ''excel 5.0;database=' + @filepath + ';hdr=yes'', ''select * from [明细表$]'')';

exec(@query);


truncate table zcpt_k001
insert into zcpt_k001(
a0102,
ha0102,
k0101,--路线编码
a0103,--行政区划
a0130,--管养单位名称
k0112,--路线名称
k0110,--起点桩号名称
k0111,--止点桩号名称
k0108,--起点桩号
k0109,--止点桩号
k0114,--里程
k0304,--技术等级
hk0304,--技术等级
hk0126,--是否一幅高速
k0404,--车道数量

hk5104,--面层类型
k4002,--路基宽度
k5404,--路面宽度
k5222,--面层厚度
k0306,--设计时速(km/h)
k0180,--修建年度
k0181,--改建年度
k0155,--最后一次大中修年度
hk0182,--断链类型
hk0121,--是否城管路段
hk0123,--是否断头路路段
hk0136,--路段收费性质
k0124,--重复路段编码
k0162,--重复路段起点桩号
k0163,--重复路段止点桩号
a1001,--养护里程(公里)
a3101,--可绿化里程(公里)
a3102,--已绿化里程(公里)
hk9508,--地貌
a0522,--涵洞(道)
hk0156,--省际出入口标识
k3990,--国道调整前路线编号
hk0138,--是否按干线公路管理接养
k0199--备注
)
select 
rtrim(k001.a0102),
rtrim(k001.ha0102),
路线编码,
政区代码,
管养单位,
路线名称,
case when len(起点桩号名称)  >0 then 起点桩号名称   when len(起点桩号名称)  =0 or 起点桩号名称   is null then null end,
case when len(止点桩号名称)  >0 then 止点桩号名称   when len(止点桩号名称)  =0 or 止点桩号名称   is null then null end,
起点桩号,
止点桩号,
里程,
dk0301.objname,
case when len(技术等级)  >0 then 技术等级   when len(技术等级)  =0 or 技术等级   is null then null end,
case when len(是否一幅高速)  >0 then 是否一幅高速   when len(是否一幅高速)  =0 or 是否一幅高速   is null then null end,
case when len(车道数量)  >0 then 车道数量   when len(车道数量)  =0 or 车道数量   is null then null end,
面层类型,
case when len(路基宽度)  >0 then 路基宽度   when len(路基宽度)  =0 or 路基宽度   is null then null end,
case when len(路面宽度)  >0 then 路面宽度   when len(路面宽度)  =0 or 路面宽度   is null then null end,
case when len(面层厚度)  >0 then 面层厚度   when len(面层厚度)  =0 or 面层厚度   is null then null end,
case when len(设计时速)  >0 then 设计时速   when len(设计时速)  =0 or 设计时速   is null then null end,
case when len(修建年度)  >0 then 修建年度   when len(修建年度)  =0 or 修建年度   is null then null end,
case when len(改建年度)  >0 then 改建年度   when len(改建年度)  =0 or 改建年度   is null then null end,
case when len(最后一次大中修年度)>0 then rtrim(最后一次大中修年度) when len(最后一次大中修年度)=0 or rtrim(最后一次大中修年度) is null then null end,
case when rtrim(断链类型) = '不相连路段' then '路段与前一路段不相连'
		when rtrim(断链类型) = '短链' then '短链，与前段桩号不连续路段相连'
		when rtrim(断链类型) = '断头路段' then '断头路段'
		when rtrim(断链类型) = '长链' then '长链'
		when rtrim(断链类型) = '正常路段' or (len(断链类型)=0 or 断链类型 is null)then '正常路段'
		else null	end,是否城管,
case when len(是否断头)  >0 then 是否断头   when len(是否断头)  =0 or 是否断头   is null then null end,

case when len(路段收费性质)>0 then 路段收费性质 when len(路段收费性质)=0 or 路段收费性质 is null then null end,
case when len(重复路段编码)>0 then 重复路段编码 when len(重复路段编码)=0 or 重复路段编码 is null then null end,

case when len(重复路段起点桩号)>0 then 重复路段起点桩号 when len(重复路段起点桩号)=0 or 重复路段起点桩号 is null then null end,
case when len(重复路段止点桩号)>0 then 重复路段止点桩号 when len(重复路段止点桩号)=0 or 重复路段止点桩号 is null then null end,
case when len(养护里程)  >0 then 养护里程   when len(养护里程)  =0 or 养护里程   is null then null end,
case when len(可绿化里程)>0 then 可绿化里程 when len(可绿化里程)=0 or 可绿化里程 is null then null end,
case when len(已绿化里程)>0 then 已绿化里程 when len(已绿化里程)=0 or 已绿化里程 is null then null end,
地貌,
case when len(涵洞数量)>0 then 涵洞数量 when len(涵洞数量)=0 or 涵洞数量 is null then null end,
case when rtrim(省际出入口)  like '%非省际出入%' or (len(省际出入口)=0 or 省际出入口 is null) then '路段非省际出入'
		when rtrim(省际出入口) like '%起点在省界%' then '国省道路段起点在省界，与邻省路线连接'
		when rtrim(省际出入口) like '%止点在省界%' then '国省道路段止点在省界，与邻省路线连接'
		when rtrim(省际出入口) like '%起止点均在省界%' then '国省道路段起止点均在省界，与邻省路线连接'	
		else null	end,

case when len(国道调整前路线编号)>0 then 国道调整前路线编号 when len(国道调整前路线编号)=0 or 国道调整前路线编号 is null then null end,

case when len(是否按干线公路管理接养)>0 then 是否按干线公路管理接养 when len(是否按干线公路管理接养)=0 or 是否按干线公路管理接养 is null then null end,
--是否为资产数据,
case when len(备注)>0 then 备注 when len(备注)=0 or 备注 is null then null end

from ##tk001
left join dk0301 on left((case when len(技术等级)  >0 then 技术等级   when len(技术等级)  =0 or 技术等级   is null then null end),2)= rtrim(objjc)
left join k001
on rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'d001',''),'d002',''),'d003','')) +cast(k001.k0108 as varchar(20)) +cast(k001.k0109 as varchar(20))=rtrim(##tk001.路线编码) +cast(##tk001.起点桩号 as varchar(20)) +cast(##tk001.止点桩号 as varchar(20))

order by 路线编码


--更新管理单位字段A0102,HA0102
UPDATE zcpt_k001
SET zcpt_k001.a0102=rtrim(k001.a0102),zcpt_k001.ha0102=rtrim(k001.ha0102)
FROM zcpt_k001
left JOIN  k001
ON rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) +CAST(k001.K0108 as VARCHAR(20)) +CAST(k001.K0109 as VARCHAR(20))=rtrim(zcpt_k001.k0101) +CAST(zcpt_k001.K0108 as VARCHAR(20)) +CAST(zcpt_k001.K0109 as VARCHAR(20))



drop table ##tk001

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