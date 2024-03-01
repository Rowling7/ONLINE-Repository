/*
	1.删除资产平台k001表，如有
	2.创建资产平台k001表 zcpt_k001
	3.导入EXCEL表数据
*/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ZCPT_K001]') AND type IN ('U'))
	DROP TABLE [dbo].[ZCPT_K001]
GO
CREATE TABLE [dbo].[ZCPT_K001] (
[A0101] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
[A0102] char(9) COLLATE Chinese_PRC_CI_AS   NULL,
[A0103] char(12) COLLATE Chinese_PRC_CI_AS  NULL,
[A0130] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
[A0522] numeric(12)  NULL,
[A1001] numeric(18,3)  NULL,
[A3101] numeric(18,3)  NULL,
[A3102] numeric(18,3)  NULL,
[HA0101] char(10) COLLATE Chinese_PRC_CI_AS  NULL,
[HA0102] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
[HA0103] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0121] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0123] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0126] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0136] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0138] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0156] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0182] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
[K0304] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0304] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
[HK5104] char(24) COLLATE Chinese_PRC_CI_AS  NULL,
[HK9508] char(12) COLLATE Chinese_PRC_CI_AS  NULL,
[K0101] char(15) COLLATE Chinese_PRC_CI_AS  NOT NULL,
[K0108] numeric(18,3)  NOT NULL,
[K0109] numeric(18,3)  NULL,
[K0110] char(60) COLLATE Chinese_PRC_CI_AS  NULL,
[K0111] char(60) COLLATE Chinese_PRC_CI_AS  NULL,
[K0112] char(60) COLLATE Chinese_PRC_CI_AS  NULL,
[K0114] numeric(18,3)  NOT NULL,
[K0121] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
[K0123] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
[K0124] char(15) COLLATE Chinese_PRC_CI_AS  NULL,
[K0126] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
[K0136] char(2) COLLATE Chinese_PRC_CI_AS  NULL,
[K0138] char(10) COLLATE Chinese_PRC_CI_AS  NULL,
[K0155] char(40) COLLATE Chinese_PRC_CI_AS  NULL,
[K0156] char(10) COLLATE Chinese_PRC_CI_AS  NULL,
[K0162] numeric(18,3)  NULL,
[K0163] numeric(18,3)  NULL,
[K0180] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
[K0181] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
[K0182] char(10) COLLATE Chinese_PRC_CI_AS  NULL,
[K0199] text COLLATE Chinese_PRC_CI_AS  NULL,
[K0306] numeric(18,3)  NULL,
[K0404] char(80) COLLATE Chinese_PRC_CI_AS  NULL,
[K3990] char(15) COLLATE Chinese_PRC_CI_AS  NULL,
[K4002] numeric(18,2)  NULL,
[K5104] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
[K5222] numeric(18,2)  NULL,
[K5404] numeric(18,2)  NULL,
[K9508] char(80) COLLATE Chinese_PRC_CI_AS  NULL,
[KWYID] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
[ModifyLogin] char(30) COLLATE Chinese_PRC_CI_AS  NULL,
[InsertLogin] char(30) COLLATE Chinese_PRC_CI_AS  NULL,
[OYDSF_ID] int  IDENTITY(1,1) NOT NULL
)
GO

-- 导入excel表数据
TRUNCATE table zcpt_k001
INSERT INTO ZCPT_K001(
k0101,--路线编码
A0103,--行政区划
A0130,--管养单位名称
K0112,--路线名称
K0110,--起点桩号名称
K0111,--止点桩号名称
K0108,--起点桩号
K0109,--止点桩号
K0114,--里程
K0304,--技术等级
HK0304,--技术等级
HK0126,--是否一幅高速
K0404,--车道数量

HK5104,--面层类型
K4002,--路基宽度
K5404,--路面宽度
K5222,--面层厚度
K0306,--设计时速(km/h)
K0180,--修建年度
K0181,--改建年度
K0155,--最后一次大中修年度
hK0182,--断链类型
HK0121,--是否城管路段
HK0123,--是否断头路路段
HK0136,--路段收费性质
K0124,--重复路段编码
K0162,--重复路段起点桩号
K0163,--重复路段止点桩号
A1001,--养护里程(公里)
A3101,--可绿化里程(公里)
A3102,--已绿化里程(公里)
HK9508,--地貌
A0522,--涵洞(道)
HK0156,--省际出入口标识
K3990,--国道调整前路线编号
HK0138,--是否按干线公路管理接养
K0199--备注
)
SELECT 
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
case when len([设计时速(km/h)])  >0 then [设计时速(km/h)]   when len([设计时速(km/h)])  =0 or [设计时速(km/h)]   is null then null end,
case when len(修建年度)  >0 then 修建年度   when len(修建年度)  =0 or 修建年度   is null then null end,
case when len(改建年度)  >0 then 改建年度   when len(改建年度)  =0 or 改建年度   is null then null end,
case when len(最后一次大中修年度)>0 then rtrim(最后一次大中修年度) when len(最后一次大中修年度)=0 or rtrim(最后一次大中修年度) is null then null end,
case when rtrim(断链类型) = '不相连路段' then '路段与前一路段不相连'
		when rtrim(断链类型) = '短链' then '短链，与前段桩号不连续路段相连'
		when rtrim(断链类型) = '断头路段' then '断头路段'
		when rtrim(断链类型) = '长链' then '长链'
		when rtrim(断链类型) = '正常路段' then '正常路段'
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
case when rtrim(省际出入口)  like '%非省际出入%' then '路段非省际出入'
		when rtrim(省际出入口) like '%起点在省界%' then '国省道路段起点在省界，与邻省路线连接'
		when rtrim(省际出入口) like '%止点在省界%' then '国省道路段止点在省界，与邻省路线连接'
		when rtrim(省际出入口) like '%起止点均在省界%' then '国省道路段起止点均在省界，与邻省路线连接'	
		else null	end,

case when len(国道调整前路线编号)>0 then 国道调整前路线编号 when len(国道调整前路线编号)=0 or 国道调整前路线编号 is null then null end,

case when len(是否按干线公路管理接养)>0 then 是否按干线公路管理接养 when len(是否按干线公路管理接养)=0 or 是否按干线公路管理接养 is null then null end,
--是否为资产数据,
case when len(备注)>0 then 备注 when len(备注)=0 or 备注 is null then null end

from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\3.安徽工作文件\20231120 安徽资产平台数据\全省路线明细数据.xls',sheet1$)
left join dk0301 on left((case when len(技术等级)  >0 then 技术等级   when len(技术等级)  =0 or 技术等级   is null then null end),2)= rtrim(objjc)
ORDER BY 路线编码


--更新管理单位字段A0102,HA0102
UPDATE zcpt_k001
SET zcpt_k001.a0102=rtrim(k001.a0102),zcpt_k001.ha0102=rtrim(k001.ha0102)
FROM zcpt_k001
left JOIN k001
ON rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) +CAST(k001.K0108 as VARCHAR(20)) +CAST(k001.K0109 as VARCHAR(20))=rtrim(zcpt_k001.k0101) +CAST(zcpt_k001.K0108 as VARCHAR(20)) +CAST(zcpt_k001.K0109 as VARCHAR(20))
