SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑, 

rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',
rtrim(k001.A0130)	'年报|管养单位',	rtrim(zcpt_k001.A0130)	'资产平台|管养单位',
rtrim(k001.K0112)	'年报|路线名称',	rtrim(zcpt_k001.K0112)	'资产平台|路线名称',
rtrim(k001.K0110)	'年报|起点桩号名称',	rtrim(zcpt_k001.K0110)	'资产平台|起点桩号名称',
rtrim(k001.K0111)	'年报|止点桩号名称',	rtrim(zcpt_k001.K0111)	'资产平台|止点桩号名称',
k001.K0108	'年报|起点桩号',	zcpt_k001.K0108	'资产平台|起点桩号',
k001.K0109	'年报|止点桩号',	zcpt_k001.K0109	'资产平台|止点桩号',
k001.K0114	'年报|里程',	zcpt_k001.K0114	'资产平台|里程',
rtrim(k001.K0304)	'年报|技术等级',	rtrim(zcpt_k001.K0304)	'资产平台|技术等级',
rtrim(k001.HK0304)	'年报|是否一幅高速',	rtrim(zcpt_k001.HK0304)	'资产平台|是否一幅高速',
rtrim(k001.HK0126)	'年报|车道数量',	rtrim(zcpt_k001.HK0126)	'资产平台|车道数量',
rtrim(k001.K0404)	'年报|面层类型',	rtrim(zcpt_k001.K0404)	'资产平台|面层类型',
rtrim(k001.HK5104)	'年报|路基宽度',	rtrim(zcpt_k001.HK5104)	'资产平台|路基宽度',
k001.K4002	'年报|路面宽度',	zcpt_k001.K4002	'资产平台|路面宽度',
k001.K5404	'年报|面层厚度',	zcpt_k001.K5404	'资产平台|面层厚度',
k001.K5222	'年报|设计时速',	zcpt_k001.K5222	'资产平台|设计时速(km/h)',
k001.K0306	'年报|修建年度',	zcpt_k001.K0306	'资产平台|修建年度',
rtrim(k001.K0180)	'年报|改建年度',	rtrim(zcpt_k001.K0180)	'资产平台|改建年度',
rtrim(k001.K0181)	'年报|最后一次大中修年度',	rtrim(zcpt_k001.K0181)	'资产平台|最后一次大中修年度',
rtrim(k001.K0155)	'年报|断链类型',	rtrim(zcpt_k001.K0155)	'资产平台|断链类型',
rtrim(k001.hK0182)	'年报|是否城管',	rtrim(zcpt_k001.hK0182)	'资产平台|是否城管',
rtrim(k001.HK0121)	'年报|是否断头',	rtrim(zcpt_k001.HK0121)	'资产平台|是否断头',
rtrim(k001.HK0123)	'年报|路段收费性质',	rtrim(zcpt_k001.HK0123)	'资产平台|路段收费性质',
rtrim(k001.HK0136)	'年报|重复路段编码',	rtrim(zcpt_k001.HK0136)	'资产平台|重复路段编码',
rtrim(k001.K0124)	'年报|重复路段起点桩号',	rtrim(zcpt_k001.K0124)	'资产平台|重复路段起点桩号',
k001.K0162	'年报|重复路段止点桩号',	zcpt_k001.K0162	'资产平台|重复路段止点桩号',
k001.K0163	'年报|养护里程',	zcpt_k001.K0163	'资产平台|养护里程',
k001.A1001	'年报|可绿化里程',	zcpt_k001.A1001	'资产平台|可绿化里程',
k001.A3101	'年报|已绿化里程',	zcpt_k001.A3101	'资产平台|已绿化里程',
k001.A3102	'年报|地貌',	zcpt_k001.A3102	'资产平台|地貌',
rtrim(k001.HK9508)	'年报|涵洞数量',	rtrim(zcpt_k001.HK9508)	'资产平台|涵洞数量',
k001.A0522	'年报|省际出入口',	zcpt_k001.A0522	'资产平台|省际出入口',
rtrim(k001.HK0156)	'年报|国道调整前路线编号',	rtrim(zcpt_k001.HK0156)	'资产平台|国道调整前路线编号',
rtrim(k001.K3990)	'年报|是否按干线公路管理接养',	rtrim(zcpt_k001.K3990)	'资产平台|是否按干线公路管理接养',
rtrim(k001.HK0138)	'年报|是否为资产数据',	rtrim(zcpt_k001.HK0138)	'资产平台|是否为资产数据',
k001.K0199	'年报|备注',	zcpt_k001.K0199	'资产平台|备注'

from K001
left join ZCPT_K001 on rtrim(k001.a0103)=rtrim(ZCPT_K001.a0103) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where  k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
--where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
(
rtrim(k001.A0130)<>rtrim(zcpt_k001.A0130)	or
rtrim(k001.K0112)<>rtrim(zcpt_k001.K0112)	or
rtrim(k001.K0110)<>rtrim(zcpt_k001.K0110)	or
rtrim(k001.K0111)<>rtrim(zcpt_k001.K0111)	or
k001.K0109<>zcpt_k001.K0109	or
k001.K0114<>zcpt_k001.K0114	or
rtrim(k001.K0304)<>rtrim(zcpt_k001.K0304)	or
rtrim(k001.HK0304)<>rtrim(zcpt_k001.HK0304)	or
rtrim(k001.HK0126)<>rtrim(zcpt_k001.HK0126)	or
rtrim(k001.K0404)<>rtrim(zcpt_k001.K0404)	or
rtrim(k001.HK5104)<>rtrim(zcpt_k001.HK5104)	or
k001.K4002<>zcpt_k001.K4002	or
k001.K5404<>zcpt_k001.K5404	or
k001.K5222<>zcpt_k001.K5222	or
k001.K0306<>zcpt_k001.K0306	or
rtrim(k001.K0180)<>rtrim(zcpt_k001.K0180)	or
rtrim(k001.K0181)<>rtrim(zcpt_k001.K0181)	or
rtrim(k001.K0155)<>rtrim(zcpt_k001.K0155)	or
rtrim(k001.hK0182)<>rtrim(zcpt_k001.hK0182)	or
rtrim(k001.HK0121)<>rtrim(zcpt_k001.HK0121)	or
rtrim(k001.HK0123)<>rtrim(zcpt_k001.HK0123)	or
rtrim(k001.HK0136)<>rtrim(zcpt_k001.HK0136)	or
rtrim(k001.K0124)<>rtrim(zcpt_k001.K0124)	or
k001.K0162<>zcpt_k001.K0162	or
k001.K0163<>zcpt_k001.K0163	or
k001.A1001<>zcpt_k001.A1001	or
k001.A3101<>zcpt_k001.A3101	or
k001.A3102<>zcpt_k001.A3102	or
rtrim(k001.HK9508)<>rtrim(zcpt_k001.HK9508)	or
k001.A0522<>zcpt_k001.A0522	or
rtrim(k001.HK0156)<>rtrim(zcpt_k001.HK0156)	or
rtrim(k001.K3990)<>rtrim(zcpt_k001.K3990)	or
rtrim(k001.HK0138)<>rtrim(zcpt_k001.HK0138)
)