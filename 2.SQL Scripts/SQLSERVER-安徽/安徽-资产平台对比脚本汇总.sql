--9.1.1
SELECT
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',
rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
k001.K0108	'年报|起点桩号',
zcpt_k001.K0108	'资产平台|起点桩号',
k001.K0109	'年报|止点桩号',
zcpt_k001.K0109	'资产平台|止点桩号',
rtrim(k001.K0112)	'年报|路线名称',
rtrim(zcpt_k001.K0112)	'资产平台|路线名称',
'年报路线分段和资产平台路线分段 不一致！' '对比结果'
FROM zcpt_k001
full JOIN  k001
ON   rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) +CAST(k001.K0108 as VARCHAR(20)) +CAST(k001.K0109 as VARCHAR(20))=rtrim(zcpt_k001.k0101) +CAST(zcpt_k001.K0108 as VARCHAR(20)) +CAST(zcpt_k001.K0109 as VARCHAR(20))
WHERE k001.k0101 IS NULL or rtrim(zcpt_k001.k0101) IS NULL
and LEFT(K001.K0101,1) IN ('G','S')  AND k001.A0102 LIKE '341%' and rtrim(k001.k0112) not like '%高速%'
and  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%'


--9.1.2
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑,
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',

rtrim(replace(replace(replace(replace(replace(k001.k3990,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|国道调整前路线编号',	rtrim(zcpt_k001.K3990)	'资产平台|国道调整前路线编号',
rtrim(k001.HK0138)	'年报|是否按干线公路管理接养',	rtrim(zcpt_k001.HK0138)	'资产平台|是否按干线公路管理接养',

case
when rtrim(replace(replace(replace(replace(replace(k001.k3990,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K3990)	and rtrim(k001.HK0138)=rtrim(zcpt_k001.HK0138)		then '国道调整前路线编号 不一致'
when rtrim(replace(replace(replace(replace(replace(k001.k3990,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(zcpt_k001.K3990)	and rtrim(k001.HK0138)<>rtrim(zcpt_k001.HK0138)		then '是否按干线公路管理接养 不一致'
else '国道调整前路线编号/是否按干线公路管理接养 不一致'end '对比结果'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
--where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%'and
(
rtrim(replace(replace(replace(replace(replace(k001.k3990,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K3990)	or -- 国道调整前路线编号,
rtrim(k001.HK0138)<>rtrim(zcpt_k001.HK0138)	 -- 是否按干线公路管理接养
)

--9.1.3
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑,
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',

rtrim(k001.HK9508)	'年报|地貌',	rtrim(zcpt_k001.HK9508)	'资产平台|地貌',
k001.A0522	'年报|涵洞数量',	zcpt_k001.A0522	'资产平台|涵洞数量',

case
when rtrim(k001.HK9508)<>rtrim(zcpt_k001.HK9508)	and isnull(k001.A0522,0)=isnull(zcpt_k001.A0522,0)		then '地貌 不一致'
when rtrim(k001.HK9508)=rtrim(zcpt_k001.HK9508)	and isnull(k001.A0522,0)<>isnull(zcpt_k001.A0522,0)		then '涵洞数量 不一致'
else '地貌/涵洞数量 不一致'end '对比结果'

from K001
full join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
--where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and k001.k0108=ZCPT_K001.k0108 and  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%'and
(
rtrim(k001.HK9508)<>rtrim(zcpt_k001.HK9508)	or -- 地貌,
isnull(k001.A0522,0)<>isnull(zcpt_k001.A0522,0)	 -- 涵洞数量,
)

--9.1.4
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑,
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',

k001.A1001	'年报|养护里程',	zcpt_k001.A1001	'资产平台|养护里程',
k001.A3101	'年报|可绿化里程',	zcpt_k001.A3101	'资产平台|可绿化里程',
k001.A3102	'年报|已绿化里程',		zcpt_k001.A3102		'资产平台|已绿化里程',

CASE 	when isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0) and isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)
then '养护里程/可绿化里程/已绿化里程 不一致'
			when isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0) and isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)=isnull(zcpt_k001.A3102,0)
then '养护里程/可绿化里程 不一致'
			when isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0) and isnull(k001.A3101,0)=isnull(zcpt_k001.A3101,0)  and isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)
then '养护里程/已绿化里程 不一致'
			when isnull(k001.A1001,0)=isnull(zcpt_k001.A1001,0)  and isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)
then '可绿化里程/已绿化里程 不一致'
			WHEN isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0) and isnull(k001.A3101,0)=isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)=isnull(zcpt_k001.A3102,0)
THEN '养护里程 不一致'
      when isnull(k001.A1001,0)=isnull(zcpt_k001.A1001,0)  and isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)=isnull(zcpt_k001.A3102,0)
then '可绿化里程 不一致'
			when isnull(k001.A1001,0)=isnull(zcpt_k001.A1001,0) and isnull(k001.A3101,0)=isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)
then '已绿化里程 不一致'
			else 'error'
END '对比结果'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
--where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and k001.k0108=ZCPT_K001.k0108 and  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%'and
(
isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0)	or -- 养护里程,
isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0)	or -- 可绿化里程,
isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)	 -- 已绿化里程,
)

--9.1.5
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑,
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',


rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))'年报|重复路段编码',	rtrim(zcpt_k001.K0124)	'资产平台|重复路段编码',
k001.K0162	'年报|重复路段起点桩号',	zcpt_k001.K0162	'资产平台|重复路段起点桩号',
k001.K0163	'年报|重复路段止点桩号',	zcpt_k001.K0163 '资产平台|重复路段止点桩号',
k001.hk0176	'年报|是否反向重复',

CASE 	when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K0124) and k001.K0162<>zcpt_k001.K0162 and k001.K0163<>zcpt_k001.K0163
then '重复路段编码/ 重复路段起点桩号/重复路段止点桩号 不一致'
			when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K0124) and k001.K0162<>zcpt_k001.K0162 and k001.K0163=zcpt_k001.K0163
then '重复路段编码/ 重复路段起点桩号 不一致'
			when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K0124) and k001.K0162=zcpt_k001.K0162  and k001.K0163<>zcpt_k001.K0163
then '重复路段编码/重复路段止点桩号 不一致'
			when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(zcpt_k001.K0124)  and k001.K0162<>zcpt_k001.K0162 and k001.K0163<>zcpt_k001.K0163
then ' 重复路段起点桩号/重复路段止点桩号 不一致'
			WHEN rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K0124) and k001.K0162=zcpt_k001.K0162 and k001.K0163=zcpt_k001.K0163
THEN '重复路段编码 不一致'
      when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(zcpt_k001.K0124)  and k001.K0162<>zcpt_k001.K0162 and k001.K0163=zcpt_k001.K0163
then ' 重复路段起点桩号 不一致'
			when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(zcpt_k001.K0124) and k001.K0162=zcpt_k001.K0162 and k001.K0163<>zcpt_k001.K0163
then '重复路段止点桩号 不一致'
			else 'error'
END '对比结果'


from K001
full outer join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
--where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and k001.k0108=ZCPT_K001.k0108 and  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%'and
(
rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K0124)	or -- 重复路段编码,
k001.K0162<>zcpt_k001.K0162	or -- 重复路段起点桩号,
k001.K0163<>zcpt_k001.K0163	 -- 重复路段止点桩号,
)

--9.1.6
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑,
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',

rtrim(k001.HK0121)	'年报|是否城管',	rtrim(zcpt_k001.HK0121)	'资产平台|是否城管', case when rtrim(k001.HK0121)<>rtrim(zcpt_k001.HK0121) then '是否城管 不一致' else null end '是否城管对比',
rtrim(k001.HK0136)	'年报|路段收费性质',	rtrim(zcpt_k001.HK0136) '资产平台|路段收费性质',case when rtrim(k001.HK0136)<>rtrim(zcpt_k001.HK0136) then '路段收费性质 不一致' else null end '路段收费性质对比',
rtrim(k001.HK0156) '年报|省际出入口',		rtrim(zcpt_k001.HK0156) '资产平台|省际出入口',case when rtrim(k001.HK0156)<>rtrim(zcpt_k001.HK0156) then '省际出入口 不一致' else null end '省际出入口对比'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
--where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and k001.k0108=ZCPT_K001.k0108 and  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%'and
(
rtrim(k001.HK0136)<>rtrim(zcpt_k001.HK0136)	or -- 路段收费性质,
rtrim(k001.HK0121)<>rtrim(zcpt_k001.HK0121)	or -- 是否城管,
rtrim(k001.HK0156)<>rtrim(zcpt_k001.HK0156)	 -- 省际出入口,
)

--9.1.7
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑,
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',

rtrim(k001.hK0182)	'年报|断链类型',
(case when rtrim(zcpt_k001.hK0182) = '路段与前一路段不相连' then '不相连路段'
		when rtrim(zcpt_k001.hK0182) = '短链，与前段桩号不连续路段相连' then '短链'
		when rtrim(zcpt_k001.hK0182) = '断头路段' then '断头路段'
		when rtrim(zcpt_k001.hK0182) = '长链' then '长链'
		when rtrim(zcpt_k001.hK0182) = '正常路段' then '正常路段'
		else null	end)  '资产平台|断链类型',
rtrim(k001.HK0123)	'年报|是否断头',	rtrim(zcpt_k001.HK0123) '资产平台|是否断头',
case
when isnull(rtrim(k001.hK0182),'正常路段')<>isnull(rtrim(zcpt_k001.hK0182),'正常路段')	and isnull(rtrim(k001.HK0123),'否')=isnull(rtrim(zcpt_k001.HK0123),'否')		then '断链类型 不一致'
when isnull(rtrim(k001.hK0182),'正常路段')=isnull(rtrim(zcpt_k001.hK0182),'正常路段')	and isnull(rtrim(k001.HK0123),'否')<>isnull(rtrim(zcpt_k001.HK0123),'否')	then '是否断头 不一致'
else '断链类型/是否断头 不一致'end '对比结果'
from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
--where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%'and
(
isnull(rtrim(k001.hK0182),'正常路段')<>isnull(rtrim(zcpt_k001.hK0182),'正常路段')	or -- 断链类型,
isnull(rtrim(k001.HK0123),'否')<>isnull(rtrim(zcpt_k001.HK0123),'否')	 -- 是否断头,
)

--9.1.8
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑,
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',

rtrim(k001.K0180)	'年报|修建年度',	rtrim(zcpt_k001.K0180)	'资产平台|修建年度',
rtrim(k001.K0181)	'年报|改建年度',	rtrim(zcpt_k001.K0181)	'资产平台|改建年度',
rtrim(k001.K0155)	'年报|最后一次大中修年度',		rtrim(zcpt_k001.K0155)		'资产平台|最后一次大中修年度',
CASE 	when isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0') and isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0')
then '修建年度/改建年度/最后一次大中修年度 不一致'
			when isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0') and isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')=isnull(left(zcpt_k001.k0155,4),'0')
then '修建年度/改建年度 不一致'
			when isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0') and isnull(left(k001.K0181,4),'0')=isnull(left(zcpt_k001.K0181,4),'0')  and isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0')
then '修建年度/最后一次大中修年度 不一致'
			when isnull(left(k001.K0180,4),'0')=isnull(left(zcpt_k001.K0180,4),'0')  and isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0')
then '改建年度/最后一次大中修年度 不一致'
			WHEN isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0') and isnull(left(k001.K0181,4),'0')=isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')=isnull(left(zcpt_k001.k0155,4),'0')THEN '修建年度 不一致'
      when isnull(left(k001.K0180,4),'0')=isnull(left(zcpt_k001.K0180,4),'0')  and isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')=isnull(left(zcpt_k001.k0155,4),'0')then '改建年度 不一致'
			when isnull(left(k001.K0180,4),'0')=isnull(left(zcpt_k001.K0180,4),'0') and isnull(left(k001.K0181,4),'0')=isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0') then '最后一次大中修年度 不一致'
			else ''
END '对比结果'
from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
-- where  k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%'and

(
isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0')	or -- 修建年度,
isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0')	or -- 改建年度,
isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0') -- 最后一次大中修年度,
)


--9.1.9
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑,
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',

rtrim(k001.HK5104)	'年报|面层类型',	rtrim(zcpt_k001.HK5104)	'资产平台|面层类型',CASE 	WHEN rtrim(k001.HK5104)<>rtrim(zcpt_k001.HK5104) THEN '面层类型 不一致' else ''END '面层类型对比',
k001.K4002	'年报|路基宽度',	zcpt_k001.K4002	'资产平台|路基宽度',CASE when k001.K4002<>zcpt_k001.K4002 then '路基宽度 不一致'else ''END'路基宽度对比',
k001.K5404	'年报|路面宽度',	zcpt_k001.K5404	'资产平台|路面宽度',CASE when k001.K5404<>zcpt_k001.K5404 then '路面宽度 不一致'else ''END'路面宽度 对比',
k001.K0306	'年报|面层厚度',	zcpt_k001.K0306	'资产平台|面层厚度',CASE when k001.K0306<>zcpt_k001.K0306 then '面层厚度 不一致'else ''END'面层厚度对比'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%'and
(
rtrim(k001.HK5104)<>rtrim(zcpt_k001.HK5104)	or -- 面层类型,
k001.K4002<>zcpt_k001.K4002	or -- 路基宽度,
k001.K5404<>zcpt_k001.K5404	or -- 路面宽度,
k001.K0306<>zcpt_k001.K0306	 -- 面层厚度,
)

--9.1.10
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑,
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',
k001.k0108,ZCPT_K001.k0108,

rtrim(k001.HK0126)	'年报|是否一幅高速',	rtrim(zcpt_k001.HK0126)	'资产平台|是否一幅高速',case when isnull(rtrim(k001.HK0126),'否')<>isnull(rtrim(zcpt_k001.HK0126),'否')		then '是否一幅高速 不一致'else '' end '是否一幅高速对比',
rtrim(k001.HK0304)	'年报|技术等级',	rtrim(LEFT(zcpt_k001.hK0304, 2))	'资产平台|技术等级',case when rtrim(k001.hK0304)<>rtrim(LEFT(zcpt_k001.hK0304, 2))	then '技术等级 不一致' else '' end '技术等级对比',
rtrim(k001.K0404)	'年报|设计时速',	rtrim(zcpt_k001.K0404) '资产平台|设计时速(km/h)',case when rtrim(k001.K0404)<>isnull(rtrim(zcpt_k001.K0404),99999)		then '设计时速 不一致'else '' end '设计时速对比',
k001.K5222	'年报|车道数量',	zcpt_k001.K5222	'资产平台|车道数量',case when k001.K5222<>zcpt_k001.K5222		then '车道数量 不一致'else '' end '车道数量对比'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%'  and
rtrim(zcpt_k001.k0101)is not null and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%'and
(
rtrim(k001.hK0304)<>rtrim(LEFT(zcpt_k001.hK0304, 2))	or -- 年报|技术等级,
isnull(rtrim(k001.HK0126),'否')<>isnull(rtrim(zcpt_k001.HK0126),'否')	or -- 是否一幅高速,
rtrim(k001.K0404)<>isnull(rtrim(zcpt_k001.K0404),99999)	or -- 设计时速,
k001.K5222<>zcpt_k001.K5222	 -- 车道数量
)

--9.1.11
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑,

rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',

rtrim(k001.K0112)	'年报|路线名称',	rtrim(zcpt_k001.K0112)	'资产平台|路线名称',
k001.K0108 '起点桩号',
rtrim(k001.K0110)	'年报|起点桩号名称',	rtrim(zcpt_k001.K0110)	'资产平台|起点桩号名称',
rtrim(k001.K0111)	'年报|止点桩号名称',	rtrim(zcpt_k001.K0111)	'资产平台|止点桩号名称',

case when rtrim(k001.K0110)=rtrim(zcpt_k001.K0110)	and rtrim(k001.K0111)<>rtrim(zcpt_k001.K0111)		then '起点桩号名称 不一致'
when rtrim(k001.K0110)<>rtrim(zcpt_k001.K0110)	and rtrim(k001.K0111)=rtrim(zcpt_k001.K0111)		then '止点桩号名称 不一致'
else '起点桩号名称/止点桩号名称 不一致'end '对比结果'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%' and
(
rtrim(k001.K0112)<>rtrim(zcpt_k001.K0112) or
rtrim(k001.K0110)<>rtrim(zcpt_k001.K0110)	or
rtrim(k001.K0111)<>rtrim(zcpt_k001.K0111)
)

--9.1.12
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑,

rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'政区代码',

rtrim(k001.A0130)	'年报|管养单位',	rtrim(zcpt_k001.A0130)	'资产平台|管养单位',
'管养单位不一致' '对比结果'
from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%' and
(
rtrim(k001.A0130)<>rtrim(zcpt_k001.A0130)	or
rtrim(k001.K0112)<>rtrim(zcpt_k001.K0112)
)

--9.3.1
SELECT distinct
RTRIM(K063.A0102) A0102,RTRIM(K063.HA0102) HA0102,
K063.K6302 '隧道名称',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '隧道代码',
'年报中存在 但 资产平台不存在 ' '对比结果'
from k063
where rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 not in (select ZCPT_K063.SDDM from ZCPT_K063)
union
SELECT distinct
RTRIM(ZCPT_K063.A0102) A0102,RTRIM(ZCPT_K063.HA0102) HA0102,
ZCPT_K063.K6302 '隧道名称',
ZCPT_K063.SDDM '隧道代码',
'资产平台存在 但 年报中不存在 ' '对比结果'
from ZCPT_K063
where ZCPT_K063.SDDM    not in (select rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 from K063 left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109  where --K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%'
)

--9.3.2
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS 编辑,
RTRIM(K001.A0102) A0102,RTRIM(K001.HA0102) HA0102,
K063.K6302 '年报|隧道名称',	ZCPT_K063.K6302 '资产平台|隧道名称',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '年报|隧道代码',	ZCPT_K063.SDDM '资产平台|隧道代码',

K063.K6303 '年报|隧道入口桩号',	ZCPT_K063.K6303 '资产平台|隧道入口桩号',
K063.K0199 '年报|备注',	ZCPT_K063.K0199 '资产平台|备注',
CASE 	when rtrim(K063.K6302)<>rtrim(ZCPT_K063.K6302) and rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301)<>rtrim(ZCPT_K063.SDDM) and isnull(K063.K6303,0) <>isnull(ZCPT_K063.K6303,0)
then '隧道名称/隧道代码/隧道入口桩号 不一致'
			when rtrim(K063.K6302)<>rtrim(ZCPT_K063.K6302) and rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301)<>rtrim(ZCPT_K063.SDDM) and isnull(K063.K6303,0) =isnull(ZCPT_K063.K6303,0)
then '隧道名称/隧道代码 不一致'
			when rtrim(K063.K6302)<>rtrim(ZCPT_K063.K6302) and rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301)=rtrim(ZCPT_K063.SDDM)  and isnull(K063.K6303,0) <>isnull(ZCPT_K063.K6303,0)
then '隧道名称/隧道入口桩号 不一致'
			when rtrim(K063.K6302)<>rtrim(ZCPT_K063.K6302)  and rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301)<>rtrim(ZCPT_K063.SDDM) and isnull(K063.K6303,0) <>isnull(ZCPT_K063.K6303,0)
then '隧道代码/隧道入口桩号 不一致'
			WHEN rtrim(K063.K6302)<>rtrim(ZCPT_K063.K6302) and rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301)=rtrim(ZCPT_K063.SDDM) and isnull(K063.K6303,0) =isnull(ZCPT_K063.K6303,0)
THEN '隧道名称 不一致'
      when rtrim(K063.K6302)=rtrim(ZCPT_K063.K6302)  and rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301)<>rtrim(ZCPT_K063.SDDM) and isnull(K063.K6303,0) =isnull(ZCPT_K063.K6303,0)
then '隧道代码 不一致'
			when rtrim(K063.K6302)=rtrim(ZCPT_K063.K6302) and rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301)=rtrim(ZCPT_K063.SDDM) and isnull(K063.K6303,0) <>isnull(ZCPT_K063.K6303,0)
then '隧道入口桩号 不一致'
			else ''
END '对比结果'

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%' and

(
rtrim(K063.K6302) <>rtrim(ZCPT_K063.K6302) or --隧道名称
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301) <> rtrim(ZCPT_K063.SDDM) or --隧道代码
isnull(K063.K6303,0) <> isnull(ZCPT_K063.K6303,0)  --隧道入口桩号
)
ORDER BY  sddm

--9.3.3
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS 编辑,
RTRIM(K001.A0102) A0102 ,RTRIM(K001.HA0102) HA0102,
K063.K6302 '年报|隧道名称',	ZCPT_K063.K6302 '资产平台|隧道名称',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '年报|隧道代码',	ZCPT_K063.SDDM '资产平台|隧道代码',

rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) '年报|路线编号',	ZCPT_K063.k0101 '资产平台|路线编号',
K063.K0112 '年报|路线名称',	ZCPT_K063.K0112 '资产平台|路线名称',
K001.k0304 '年报|技术等级',	ZCPT_K063.k0304 '资产平台|技术等级',
K063.K0199 '年报|备注',	ZCPT_K063.K0199 '资产平台|备注',
CASE 	when rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(ZCPT_K063.k0101) and rtrim(K063.K0112)<>rtrim(ZCPT_K063.K0112) and rtrim(K001.k0304)<>rtrim(ZCPT_K063.k0304)
then '路线编号/路线名称/技术等级 不一致'
			when rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(ZCPT_K063.k0101) and rtrim(K063.K0112)<>rtrim(ZCPT_K063.K0112) and rtrim(K001.k0304)=rtrim(ZCPT_K063.k0304)
then '路线编号/路线名称 不一致'
			when rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(ZCPT_K063.k0101) and rtrim(K063.K0112)=rtrim(ZCPT_K063.K0112)  and rtrim(K001.k0304)<>rtrim(ZCPT_K063.k0304)
then '路线编号/技术等级 不一致'
			when rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(ZCPT_K063.k0101)  and rtrim(K063.K0112)<>rtrim(ZCPT_K063.K0112) and rtrim(K001.k0304)<>rtrim(ZCPT_K063.k0304)
then '路线名称/技术等级 不一致'
			WHEN rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(ZCPT_K063.k0101) and rtrim(K063.K0112)=rtrim(ZCPT_K063.K0112) and rtrim(K001.k0304)=rtrim(ZCPT_K063.k0304)
THEN '路线编号 不一致'
      when rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K063.k0101)  and rtrim(K063.K0112)<>rtrim(ZCPT_K063.K0112) and rtrim(K001.k0304)=rtrim(ZCPT_K063.k0304)
then '路线名称 不一致'
			when rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K063.k0101) and rtrim(K063.K0112)=rtrim(ZCPT_K063.K0112) and rtrim(K001.k0304)<>rtrim(ZCPT_K063.k0304)
then '技术等级 不一致'
			else ''
END '对比结果'

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
(
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) <>	rtrim(ZCPT_K063.k0101) or--路线编号
rtrim(K063.K0112) <>	rtrim(ZCPT_K063.K0112) or--路线名称
rtrim(K001.k0304) <>	rtrim(ZCPT_K063.k0304) --技术等级
)
ORDER BY  sddm

--9.3.4
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS 编辑,
RTRIM(K001.A0102) A0102,RTRIM(K001.HA0102) HA0102,
K063.K6302 '年报|隧道名称',	ZCPT_K063.K6302 '资产平台|隧道名称',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '年报|隧道代码',	ZCPT_K063.SDDM '资产平台|隧道代码',

K063.K6305 '年报|隧道长度(米)',	ZCPT_K063.K6305 '资产平台|隧道长度(米)',
K063.K6306 '年报|隧道净宽(米)',	ZCPT_K063.K6306 '资产平台|隧道净宽(米)',
K063.K6307 '年报|隧道净高(米)',	ZCPT_K063.K6307 '资产平台|隧道净高(米)',
K063.K0199 '年报|备注',	ZCPT_K063.K0199 '资产平台|备注',

CASE 	when isnull(K063.K6305,0)<>isnull(ZCPT_K063.K6305,0) and isnull(K063.K6306,0)<>isnull(ZCPT_K063.K6306,0) and isnull(K063.K6307,0)<>isnull(ZCPT_K063.K6307,0)
then '隧道长度(米)/隧道净宽(米)/隧道净高(米) 不一致'
			when isnull(K063.K6305,0)<>isnull(ZCPT_K063.K6305,0) and isnull(K063.K6306,0)<>isnull(ZCPT_K063.K6306,0) and isnull(K063.K6307,0)=isnull(ZCPT_K063.K6307,0)
then '隧道长度(米)/隧道净宽(米) 不一致'
			when isnull(K063.K6305,0)<>isnull(ZCPT_K063.K6305,0) and isnull(K063.K6306,0)=isnull(ZCPT_K063.K6306,0)  and isnull(K063.K6307,0)<>isnull(ZCPT_K063.K6307,0)
then '隧道长度(米)/隧道净高(米) 不一致'
			when isnull(K063.K6305,0)<>isnull(ZCPT_K063.K6305,0) and isnull(K063.K6306,0)<>isnull(ZCPT_K063.K6306,0) and isnull(K063.K6307,0)<>isnull(ZCPT_K063.K6307,0)
then '隧道净宽(米)/隧道净高(米) 不一致'
			WHEN isnull(K063.K6305,0)<>isnull(ZCPT_K063.K6305,0) and isnull(K063.K6306,0)=isnull(ZCPT_K063.K6306,0) and isnull(K063.K6307,0)=isnull(ZCPT_K063.K6307,0)
THEN '隧道长度(米) 不一致'
      when isnull(K063.K6305,0)=isnull(ZCPT_K063.K6305,0)  and isnull(K063.K6306,0)<>isnull(ZCPT_K063.K6306,0) and isnull(K063.K6307,0)=isnull(ZCPT_K063.K6307,0)
then '隧道净宽(米) 不一致'
			when isnull(K063.K6305,0)=isnull(ZCPT_K063.K6305,0) and isnull(K063.K6306,0)=isnull(ZCPT_K063.K6306,0) and isnull(K063.K6307,0)<>isnull(ZCPT_K063.K6307,0)
then '隧道净高(米) 不一致'
			else ''
END '对比结果'

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%' and
(
isnull(K063.K6305,0) <>isnull(ZCPT_K063.K6305,0) or --隧道长度(米)
isnull(K063.K6306,0) <>isnull(ZCPT_K063.K6306,0) or --隧道净宽(米)
isnull(K063.K6307,0) <>isnull(ZCPT_K063.K6307,0) --隧道净高(米)
)
ORDER BY  sddm


--9.3.5
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS 编辑,
RTRIM(K001.A0102) A0102,RTRIM(K001.HA0102) HA0102,
K063.K6302 '年报|隧道名称',	ZCPT_K063.K6302 '资产平台|隧道名称',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '年报|隧道代码',	ZCPT_K063.SDDM '资产平台|隧道代码',

K063.K6304 '年报|按隧道长度分类代码',	ZCPT_K063.K6304 '资产平台|按隧道长度分类代码',
K063.hK6304 '年报|按隧道长度分类汉字',	ZCPT_K063.hK6304 '资产平台|按隧道长度分类汉字 ',
K063.hK6355 '年报|是否在长大隧道目录中',	ZCPT_K063.K6355 '资产平台|是否在长大隧道目录中',
K063.K0199 '年报|备注',	ZCPT_K063.K0199 '资产平台|备注',

CASE 	when rtrim(K063.K6304)<>rtrim(ZCPT_K063.K6304) and rtrim(K063.hK6304)<>rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) <>rtrim(ZCPT_K063.K6355)
then '按隧道长度分类代码/按隧道长度分类汉字/是否在长大隧道目录中 不一致'
			when rtrim(K063.K6304)<>rtrim(ZCPT_K063.K6304) and rtrim(K063.hK6304)<>rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) =rtrim(ZCPT_K063.K6355)
then '按隧道长度分类代码/按隧道长度分类汉字 不一致'
			when rtrim(K063.K6304)<>rtrim(ZCPT_K063.K6304) and rtrim(K063.hK6304)=rtrim(ZCPT_K063.hK6304)  and rtrim(K063.hK6355) <>rtrim(ZCPT_K063.K6355)
then '按隧道长度分类代码/是否在长大隧道目录中 不一致'
			when rtrim(K063.K6304)<>rtrim(ZCPT_K063.K6304)  and rtrim(K063.hK6304)<>rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) <>rtrim(ZCPT_K063.K6355)
then '按隧道长度分类汉字/是否在长大隧道目录中 不一致'
			WHEN rtrim(K063.K6304)<>rtrim(ZCPT_K063.K6304) and rtrim(K063.hK6304)=rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) =rtrim(ZCPT_K063.K6355)
THEN '按隧道长度分类代码 不一致'
      when rtrim(K063.K6304)=rtrim(ZCPT_K063.K6304)  and rtrim(K063.hK6304)<>rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) =rtrim(ZCPT_K063.K6355)
then '按隧道长度分类汉字 不一致'
			when rtrim(K063.K6304)=rtrim(ZCPT_K063.K6304) and rtrim(K063.hK6304)=rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) <>rtrim(ZCPT_K063.K6355)
then '是否在长大隧道目录中 不一致'
			else ''
END '对比结果'



from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%' and
(
rtrim(K063.K6304) <>	rtrim(ZCPT_K063.K6304) or --按隧道长度分类代码',
rtrim(K063.hK6304) <>	rtrim(ZCPT_K063.hK6304) or --按隧道长度分类汉字 ',
rtrim(K063.hK6355) <>	rtrim(ZCPT_K063.K6355)  -- 是否在长大隧道目录中',
)

ORDER BY  sddm

--9.3.6
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS 编辑,
RTRIM(K001.A0102) A0102,RTRIM(K001.HA0102) HA0102,
K063.K6302 '年报|隧道名称',	ZCPT_K063.K6302 '资产平台|隧道名称',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '年报|隧道代码',	ZCPT_K063.SDDM '资产平台|隧道代码',

K063.hK6335 '年报|是否水下隧道',	ZCPT_K063.K6335 '资产平台|是否水下隧道',
K063.hK6371 '年报|是否跨省隧道',	ZCPT_K063.K6371 '资产平台|是否跨省隧道',
K063.K0199 '年报|备注',	ZCPT_K063.K0199 '资产平台|备注',

CASE 	when rtrim(K063.hK6335)<>rtrim(ZCPT_K063.K6335) and rtrim(K063.hK6371)<>rtrim(ZCPT_K063.K6371) then '是否水下隧道/是否跨省隧道 不一致'
		  when rtrim(K063.hK6335)<>rtrim(ZCPT_K063.K6335)  and rtrim(K063.hK6371)=rtrim(ZCPT_K063.K6371)then '是否水下隧道 不一致'
			when rtrim(K063.hK6335)=rtrim(ZCPT_K063.K6335) and rtrim(K063.hK6371)<>rtrim(ZCPT_K063.K6371) then '是否跨省隧道 不一致'
			else ''
END '对比结果'

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%' and
(
K063.hK6335 <>	ZCPT_K063.K6335 or --是否水下隧道',
K063.hK6371 <>	ZCPT_K063.K6371  --是否跨省隧道',
)
ORDER BY  sddm

--9.3.7
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS 编辑,
RTRIM(K001.A0102) A0102,RTRIM(K001.HA0102) HA0102,
K063.K6302 '年报|隧道名称',	ZCPT_K063.K6302 '资产平台|隧道名称',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '年报|隧道代码',	ZCPT_K063.SDDM '资产平台|隧道代码',

K063.HK6343 '年报|隧道养护等级',	ZCPT_K063.K6343 '资产平台|隧道养护等级',
K063.K0199 '年报|备注',	ZCPT_K063.K0199 '资产平台|备注',
'隧道养护等级 不一致' AS '对比结果'

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%' and
(
K063.HK6343<>	ZCPT_K063.K6343 --隧道养护等级',
)
ORDER BY  sddm

--9.3.8
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS 编辑,
RTRIM(K001.A0102) A0102,RTRIM(K001.HA0102) HA0102,
K063.K6302 '年报|隧道名称',	ZCPT_K063.K6302 '资产平台|隧道名称',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '年报|隧道代码',	ZCPT_K063.SDDM '资产平台|隧道代码',

RTRIM(K063.K6079) '年报|建设单位名称',	RTRIM(ZCPT_K063.K6079) '资产平台|建设单位名称',CASE WHEN RTRIM(K063.K6079) <>	RTRIM(ZCPT_K063.K6079) THEN '建设单位名称 不一致' else null end '建设单位名称 对比',
RTRIM(K063.K6030) '年报|设计单位名称',	RTRIM(ZCPT_K063.K6030) '资产平台|设计单位名称',CASE WHEN RTRIM(K063.K6030) <>	RTRIM(ZCPT_K063.K6030) THEN '设计单位名称 不一致' else null end '设计单位名称 对比',
RTRIM(K063.K6031) '年报|施工单位名称',	RTRIM(ZCPT_K063.K6031) '资产平台|施工单位名称',CASE WHEN RTRIM(K063.K6031) <>	RTRIM(ZCPT_K063.K6031) THEN '施工单位名称 不一致' else null end '施工单位名称 对比',
RTRIM(K063.K6032) '年报|监理单位名称',	RTRIM(ZCPT_K063.K6032) '资产平台|监理单位名称',CASE WHEN RTRIM(K063.K6032) <>	RTRIM(ZCPT_K063.K6032) THEN '监理单位名称 不一致' else null end '监理单位名称 对比',
RTRIM(K063.K0116) '年报|建成通车时间',	RTRIM(ZCPT_K063.K0116) '资产平台|建成通车时间',CASE WHEN RTRIM(K063.K0116) <>	RTRIM(ZCPT_K063.K0116) THEN '建成通车时间 不一致' else null end '建成通车时间 对比',
K063.K0199 '年报|备注',	ZCPT_K063.K0199 '资产平台|备注'

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%' and
(
RTRIM(K063.K6079) <>	RTRIM(ZCPT_K063.K6079) OR --建设单位名称',
RTRIM(K063.K6030) <>	RTRIM(ZCPT_K063.K6030) OR --设计单位名称',
RTRIM(K063.K6031) <>	RTRIM(ZCPT_K063.K6031) OR --施工单位名称',
RTRIM(K063.K6032) <>	RTRIM(ZCPT_K063.K6032) OR --监理单位名称',
RTRIM(K063.K0116) <>	RTRIM(ZCPT_K063.K0116)  --建成通车时间',
)
ORDER BY  sddm

--9.3.9
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS 编辑,
RTRIM(K001.A0102) A0102,RTRIM(K001.HA0102) HA0102,
K063.K6302 '年报|隧道名称',	ZCPT_K063.K6302 '资产平台|隧道名称',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '年报|隧道代码',	ZCPT_K063.SDDM '资产平台|隧道代码',

K063.A1313 '年报|单位性质代码',	ZCPT_K063.A1313 '资产平台|单位性质代码',
K063.A0130 '年报|管养单位名称',	ZCPT_K063.A0130 '资产平台|管养单位名称',
K063.K6111 '年报|监管单位名称',	ZCPT_K063.K6111 '资产平台|监管单位名称',

CASE 	when K063.A1313<>ZCPT_K063.A1313 and K063.A0130<>ZCPT_K063.A0130 and K063.K6111 <>ZCPT_K063.K6111
then '单位性质代码/管养单位名称/监管单位名称 不一致'
			when K063.A1313<>ZCPT_K063.A1313 and K063.A0130<>ZCPT_K063.A0130 and K063.K6111 =ZCPT_K063.K6111
then '单位性质代码/管养单位名称 不一致'
			when K063.A1313<>ZCPT_K063.A1313 and K063.A0130=ZCPT_K063.A0130  and K063.K6111 <>ZCPT_K063.K6111
then '单位性质代码/监管单位名称 不一致'
			when K063.A1313<>ZCPT_K063.A1313  and K063.A0130<>ZCPT_K063.A0130 and K063.K6111 <>ZCPT_K063.K6111
then '管养单位名称/监管单位名称 不一致'
			WHEN K063.A1313<>ZCPT_K063.A1313 and K063.A0130=ZCPT_K063.A0130 and K063.K6111 =ZCPT_K063.K6111
THEN '单位性质代码 不一致'
      when K063.A1313=ZCPT_K063.A1313  and K063.A0130<>ZCPT_K063.A0130 and K063.K6111 =ZCPT_K063.K6111
then '管养单位名称 不一致'
			when K063.A1313=ZCPT_K063.A1313 and K063.A0130=ZCPT_K063.A0130 and K063.K6111 <>ZCPT_K063.K6111
then '监管单位名称 不一致'
			else ''
END '对比结果'

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where --K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%' and
(
K063.A1313 <>ZCPT_K063.A1313 OR--单位性质代码',
K063.A0130 <>ZCPT_K063.A0130 OR--管养单位名称',
K063.K6111 <>	ZCPT_K063.K6111 --监管单位名称'
)
ORDER BY  sddm

--9.3.10
select 'K063'+'&A0102 ='''+RTRIM(CAST(K063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(K063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(right(CAST(K063.K6301 AS VARCHAR),4))  AS 编辑,
a0102,ha0102,K6302,k0101,k6301,K6303,
hK6336 ,ZCPT总体评定等级,case when isnull(hK6336,'')<>isnull(ZCPT总体评定等级,'null') then '总体评定等级不一致' else null end 总体评定等级对比,
K6344 ,ZCPT总体评定日期,case when isnull(K6344,'')<>isnull(ZCPT总体评定日期,'null') then '总体评定日期不一致' else null end 总体评定日期对比,
K6345 ,ZCPT总体评定单位,case when isnull(K6345,'')<>isnull(ZCPT总体评定单位,'null') then '总体评定单位不一致' else null end 总体评定单位对比,
hK6346 ,ZCPT土建评定等级,case when isnull(hK6346,'')<>isnull(ZCPT土建评定等级,'null') then '土建评定等级不一致' else null end 土建评定等级对比,
K6347 ,ZCPT土建评定日期,case when isnull(K6347,'')<>isnull(ZCPT土建评定日期,'null') then '土建评定日期不一致' else null end 土建评定日期对比,
K6348 ,ZCPT土建评定单位,case when isnull(K6348,'')<>isnull(ZCPT土建评定单位,'null') then '土建评定单位不一致' else null end 土建评定单位对比,
hK6349 ,ZCPT机电评定等级,case when isnull(hK6349,'')<>isnull(ZCPT机电评定等级,'null') then '机电评定等级不一致' else null end 机电评定等级对比,
K6350 ,ZCPT机电评定日期,case when isnull(K6350,'')<>isnull(ZCPT机电评定日期,'null') then '机电评定日期不一致' else null end 机电评定日期对比,
K6351 ,ZCPT机电评定单位,case when isnull(K6351,'')<>isnull(ZCPT机电评定单位,'null') then '机电评定单位不一致' else null end 机电评定单位对比,
hK6352 ,ZCPT其他评定等级,case when isnull(hK6352,'')<>isnull(ZCPT其他评定等级,'null') then '其他评定等级不一致' else null end 其他评定等级对比,
K6353 ,ZCPT其他评定日期,case when isnull(K6353,'')<>isnull(ZCPT其他评定日期,'null') then '其他评定日期不一致' else null end 其他评定日期对比,
K6354 ,ZCPT其他评定单位,case when isnull(K6354,'')<>isnull(ZCPT其他评定单位,'null') then '其他评定单位不一致' else null end 其他评定单位对比
from (
select rtrim(a.a0102) a0102,rtrim(a.ha0102) ha0102,rtrim(a.K6302) K6302,rtrim(a.k0101) k0101,
rtrim(replace(replace(replace(replace(replace(a.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(a.a0103,6)+'U'+a.k6301 k6301,
a.K6303,
a.hK6336,case when isnull(b.hK6336,0)='1' then '一类' when isnull(b.hK6336,0)='2' then '二类'  when isnull(b.hK6336,0)='3' then '三类' when isnull(b.hK6336,0)='3' then '四类' when isnull(b.hK6336,0)='5' then '五类' else null end 'ZCPT总体评定等级',
a.K6344,b.K6344 'ZCPT总体评定日期',
rtrim(a.K6345) K6345,rtrim(b.K6345) 'ZCPT总体评定单位',
a.hK6346,case when isnull(b.hK6346,0)='1' then '一类' when isnull(b.hK6346,0)='2' then '二类'  when isnull(b.hK6346,0)='3' then '三类' when isnull(b.hK6346,0)='3' then '四类' when isnull(b.hK6346,0)='5' then '五类' else null end 'ZCPT土建评定等级',
a.K6347,b.K6347 'ZCPT土建评定日期',
rtrim(a.K6348) K6348,rtrim(b.K6348) 'ZCPT土建评定单位',
a.hK6349,case when isnull(b.hK6349,0)='1' then '一类' when isnull(b.hK6349,0)='2' then '二类'  when isnull(b.hK6349,0)='3' then '三类' when isnull(b.hK6349,0)='3' then '四类' when isnull(b.hK6349,0)='5' then '五类' else null end 'ZCPT机电评定等级',
a.K6350,b.K6350 'ZCPT机电评定日期',
rtrim(a.K6351) K6351,rtrim(b.K6351) 'ZCPT机电评定单位',
a.hK6352,case when isnull(b.hK6352,0)='1' then '一类' when isnull(b.hK6352,0)='2' then '二类'  when isnull(b.hK6352,0)='3' then '三类' when isnull(b.hK6352,0)='3' then '四类' when isnull(b.hK6352,0)='5' then '五类' else null end 'ZCPT其他评定等级',
a.K6353,b.K6353 'ZCPT其他评定日期',
rtrim(a.K6354) K6354,rtrim(b.K6354) 'ZCPT其他评定单位'
from K063 a inner join ZCPT_K063 b on rtrim(replace(replace(replace(replace(replace(a.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(a.a0103,6)+'U'+a.k6301=rtrim(b.SDDM)
) K063
where  K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and

COALESCE(case when isnull(hK6336,'')<>isnull(ZCPT总体评定等级,'null') then '总体评定等级不一致' else null end ,
case when isnull(K6344,'')<>isnull(ZCPT总体评定日期,'null') then '总体评定日期不一致' else null end,
case when isnull(K6345,'')<>isnull(ZCPT总体评定单位,'null') then '总体评定单位不一致' else null end ,
case when isnull(hK6346,'')<>isnull(ZCPT土建评定等级,'null') then '土建评定等级不一致' else null end,
case when isnull(K6347,'')<>isnull(ZCPT土建评定日期,'null') then '土建评定日期不一致' else null end,
case when isnull(K6348,'')<>isnull(ZCPT土建评定单位,'null') then '土建评定单位不一致' else null end,
case when isnull(hK6349,'')<>isnull(ZCPT机电评定等级,'null') then '机电评定等级不一致' else null end,
case when isnull(K6350,'')<>isnull(ZCPT机电评定日期,'null') then '机电评定日期不一致' else null end,
case when isnull(K6351,'')<>isnull(ZCPT机电评定单位,'null') then '机电评定单位不一致' else null end,
case when isnull(hK6352,'')<>isnull(ZCPT其他评定等级,'null') then '其他评定等级不一致' else null end,
case when isnull(K6353,'')<>isnull(ZCPT其他评定日期,'null') then '其他评定日期不一致' else null end,
case when isnull(K6354,'')<>isnull(ZCPT其他评定单位,'null') then '其他评定单位不一致' else null end
)  like '%不一致%'
order by K063.k6301

--9.3.11
select 'K063'+'&A0102 ='''+RTRIM(CAST(K063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(K063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(right(CAST(K063.K6301 AS VARCHAR),4))  AS 编辑,
a0102,ha0102,K6302,k0101,k6301,K6303,
K0181 ,ZCPT改造年度,case when isnull(K0181,'')<>isnull(ZCPT改造年度,'null') then '改造年度不一致' else null end 改造年度对比,
A1316 ,ZCPT完工日期,case when isnull(A1316,'')<>isnull(ZCPT完工日期,'null') then '完工日期不一致' else null end 完工日期对比,
K6337 ,ZCPT改造部位,case when isnull(K6337,'')<>isnull(ZCPT改造部位,'null') then '改造部位不一致' else null end 改造部位对比,
A1318 ,ZCPT工程性质,case when isnull(A1318,'')<>isnull(ZCPT工程性质,'null') then '工程性质不一致' else null end 工程性质对比,
K6338 ,ZCPT病害部位,case when isnull(K6338,'')<>isnull(ZCPT病害部位,'null') then '病害部位不一致' else null end 病害部位对比,
K6339 ,ZCPT病害描述,case when isnull(K6339,'')<>isnull(ZCPT病害描述,'null') then '病害描述不一致' else null end 病害描述对比

from (
select rtrim(a.a0102) a0102,rtrim(a.ha0102) ha0102,rtrim(a.K6302) K6302,rtrim(a.k0101) k0101,
rtrim(replace(replace(replace(replace(replace(a.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(a.a0103,6)+'U'+a.k6301 k6301,
a.K6303,
a.K0181,b.K0181 'ZCPT改造年度',
rtrim(a.A1316) A1316,rtrim(b.A1316) 'ZCPT完工日期',
a.K6337,b.K6337 'ZCPT改造部位',
rtrim(a.A1318) A1318,rtrim(b.A1318) 'ZCPT工程性质',
a.K6338,b.K6338 'ZCPT病害部位',
rtrim(a.K6339) K6339,rtrim(b.K6339) 'ZCPT病害描述'

from K063 a inner join ZCPT_K063 b on rtrim(replace(replace(replace(replace(replace(a.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(a.a0103,6)+'U'+a.k6301=rtrim(b.SDDM)
) K063
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
COALESCE(
case when isnull(K0181,'')<>isnull(ZCPT改造年度,'null') then '改造年度不一致' else null end,
case when isnull(A1316,'')<>isnull(ZCPT完工日期,'null') then '完工日期不一致' else null end,
case when isnull(K6337,'')<>isnull(ZCPT改造部位,'null') then '改造部位不一致' else null end,
case when isnull(A1318,'')<>isnull(ZCPT工程性质,'null') then '工程性质不一致' else null end,
case when isnull(K6338,'')<>isnull(ZCPT病害部位,'null') then '病害部位不一致' else null end,
case when isnull(K6339,'')<>isnull(ZCPT病害描述,'null') then '病害描述不一致' else null end
)  like '%不一致%'
order by K063.k6301


--9.2.1
SELECT distinct
RTRIM(k060.A0102) A0102,RTRIM(k060.HA0102) HA0102,
k060.K6002 '桥梁名称',
case when left(k060.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'L'+rtrim(k060.k6001) end '桥梁代码',
'年报中存在 但 资产平台不存在 ' '对比结果'
from k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
where k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%'and
(case when left(k060.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'L'+rtrim(k060.k6001) end)  not in (select ZCPT_K060.k6001 from ZCPT_K060)

union

SELECT distinct
t.a0102 ,null,
ZCPT_K060.K6002 '桥梁名称',
ZCPT_K060.k6001 '桥梁代码',
'资产平台存在 但 年报中不存在 ' '对比结果'
from ZCPT_K060
left join (SELECT distinct
case when left(k060.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'L'+rtrim(k060.k6001) end  k6001,k060.a0102
from k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
where  k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%' AND k001.A0102 LIKE '341%'
)t on ZCPT_K060.k6001=t.k6001
where ZCPT_K060.A0102 LIKE '#A0102#%' AND ZCPT_K060.A0102 LIKE '#GLDW#%' and
 t.a0102 is null
order by '对比结果'

--9.2.2
SELECT  'K060'+'&A0102 ='''+RTRIM(CAST(k060.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k060.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(k060.K6003 AS VARCHAR))  AS 编辑,
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(k060.k6002) '年报|桥梁名称',rtrim(ZCPT_K060.k6002) '资产平台|桥梁名称',
rtrim(k060.k6003) '年报|桥梁中心桩号',rtrim(ZCPT_K060.k6003) '资产平台|桥梁中心桩号',
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) '年报|桥梁代码',
rtrim(ZCPT_K060.k6001) '资产平台|桥梁代码',
rtrim(K060.K6040) nk6040,rtrim(ZCPT_K060.K6040) zk6040,
'桥梁身份码 不一致' '对比结果'
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where --k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
rtrim(K060.K6040) <>rtrim(ZCPT_K060.K6040) and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'


--9.2.3
SELECT
'K060'+'&A0102 ='''+RTRIM(CAST(k060.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k060.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(k060.K6003 AS VARCHAR))  AS 编辑,
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) '年报|路线编码',
rtrim(ZCPT_K060.K0101) '资产平台|路线编码',

(case when left(k060.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'L'+rtrim(k060.k6001) end) '年报|桥梁代码',rtrim(ZCPT_K060.k6001) '资产平台|桥梁代码',
rtrim(k060.k6002) '年报|桥梁名称',rtrim(ZCPT_K060.k6002) '资产平台|桥梁名称',
rtrim(k060.k6003) '年报|桥梁中心桩号',rtrim(ZCPT_K060.k6003) '资产平台|桥梁中心桩号',

case WHEN rtrim(k060.k6002)<>rtrim(ZCPT_K060.k6002) and rtrim(k060.k6003)=rtrim(ZCPT_K060.k6003) then '桥梁名称 不一致'
WHEN rtrim(k060.k6002)=rtrim(ZCPT_K060.k6002) and rtrim(k060.k6003)<>rtrim(ZCPT_K060.k6003) then '桥梁中心桩号 不一致'
else '桥梁名称/桥梁中心桩号 不一致' END '对比结果'

from k060
left join ZCPT_K060 on
(case when left(k060.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'L'+rtrim(k060.k6001) end) = rtrim(ZCPT_K060.k6001)
where  --k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(K060.K0101,1) IN ('G','S') and rtrim(k060.k0112) not like '%高速%'AND k060.A0102 LIKE '341%' and
(
rtrim(k060.k6002)<>rtrim(ZCPT_K060.k6002) or -- 桥梁名称,
rtrim(k060.k6003)<>rtrim(ZCPT_K060.k6003)	 -- 桥梁中心桩号,
)

--9.2.3
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,rtrim(NBZC.zk0101)'资产平台|所在路线代码',
CASE WHEN rtrim(NBZC.k0101)<>rtrim(NBZC.zk0101) THEN '所在路线代码 不一致'	ELSE null END '所在路线代码 对比',
rtrim(NBZC.k6002) k6002,rtrim(NBZC.zk6002) '资产平台|桥梁名称',
CASE WHEN rtrim(NBZC.k6002)<>rtrim(NBZC.zk6002) THEN '桥梁名称 不一致'	ELSE null END '桥梁名称 对比',
rtrim(NBZC.k6003) k6003,rtrim(NBZC.zk6003) '资产平台|桥梁中心桩号',
CASE WHEN rtrim(NBZC.k6003)<>rtrim(NBZC.zk6003) THEN '桥梁中心桩号 不一致'	ELSE null END'桥梁中心桩号 对比',
nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,
rtrim(ZCPT_K060.K0101) zK0101,
rtrim(k060.k6002) k6002,rtrim(ZCPT_K060.k6002) zk6002,
rtrim(k060.k6003) k6003,rtrim(ZCPT_K060.k6003) zk6003,
rtrim(K060.K6040) K6040
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,
rtrim(ZCPT_K060.K0101) zK0101,
rtrim(k060.k6002) k6002,rtrim(ZCPT_K060.k6002) zk6002,
rtrim(k060.k6003) k6003,rtrim(ZCPT_K060.k6003) zk6003,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and(
rtrim(NBZC.k6002)<>rtrim(NBZC.zk6002) or -- 桥梁名称,
rtrim(NBZC.k6003)<>rtrim(NBZC.zk6003) or -- 桥梁中心桩号
rtrim(NBZC.k0101)<>rtrim(NBZC.zk0101)
)	 -- 路线代码,
order by k0101

--9.2.4
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,
NBZC.k6063 k6063,NBZC.zk6063 '资产平台|单孔最大跨径',
CASE WHEN k6063<>zk6063 THEN '单孔最大跨径 不一致'	ELSE null END'单孔最大跨径 对比',
NBZC.k6064 k6064,NBZC.zk6064 '资产平台|桥梁跨径组合',
CASE WHEN k6064<>zk6064 THEN '桥梁跨径组合 不一致'	ELSE null END'桥梁跨径组合 对比',
nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.k6063) k6063,rtrim(ZCPT_K060.k6063) zk6063,
rtrim(k060.k6064) k6064,rtrim(ZCPT_K060.k6064) zk6064

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.k6063) k6063,rtrim(ZCPT_K060.k6063) zk6063,
rtrim(k060.k6064) k6064,rtrim(ZCPT_K060.k6064) zk6064

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.k6063)<>rtrim(NBZC.zk6063)	or -- 单孔最大跨径,
rtrim(NBZC.k6064)<>rtrim(NBZC.zk6064)	 -- 桥梁跨径组合,
)
order by k0101

--9.2.5
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,
NBZC.K6007 K6007,NBZC.zK6007 '资产平台|桥梁跨径分类代码',
CASE WHEN K6007<>zK6007 THEN '桥梁跨径分类代码 不一致'	ELSE null END'桥梁跨径分类代码 对比',
NBZC.HK6007 HK6007,NBZC.zHK6007 '资产平台|桥梁跨径分类',
CASE WHEN HK6007<>zHK6007 THEN '桥梁跨径分类 不一致'	ELSE null END'桥梁跨径分类 对比',
NBZC.K6004 K6004,NBZC.zK6004 '资产平台|按使用年限分代码',
CASE WHEN K6004<>zK6004 THEN '按使用年限分代码 不一致'	ELSE null END'按使用年限分代码 对比',
NBZC.HK6004 HK6004,NBZC.zHK6004 '资产平台|按使用年限分汉字',
CASE WHEN REPLACE(HK6004, '桥', '')<>zHK6004 THEN '按使用年限分汉字 不一致'	ELSE null END'按使用年限分汉字 对比',
nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.K6007)K6007,rtrim(ZCPT_K060.K6007) zK6007,
rtrim(k060.HK6007)HK6007,rtrim(ZCPT_K060.HK6007)	zHK6007,
rtrim(k060.K6004)K6004,rtrim(ZCPT_K060.K6004)	zK6004,
rtrim(k060.HK6004)HK6004,rtrim(ZCPT_K060.HK6004)	zHK6004

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.K6007)K6007,rtrim(ZCPT_K060.K6007) zK6007,
rtrim(k060.HK6007)HK6007,rtrim(ZCPT_K060.HK6007)	zHK6007,
rtrim(k060.K6004)K6004,rtrim(ZCPT_K060.K6004)	zK6004,
rtrim(k060.HK6004)HK6004,rtrim(ZCPT_K060.HK6004)	zHK6004

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where
NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.K6007)<>rtrim(NBZC.zK6007) or --  桥梁跨径分类代码,
rtrim(NBZC.HK6007)<>rtrim(NBZC.zHK6007)	or--  桥梁跨径分类,
rtrim(NBZC.K6004)<>rtrim(NBZC.zK6004)	or --  按使用年限分代码,
REPLACE(HK6004, '桥', '')<>zHK6004
)
order by k0101

--9.2.6
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,
NBZC.K6017 k6017,NBZC.zk6017 '资产平台|桥墩类型代码',
CASE WHEN k6017<>zk6017 THEN '桥墩类型代码 不一致'	ELSE null END'桥墩类型代码 对比',
NBZC.hk6017 hk6017,NBZC.zhk6017 '资产平台|桥墩类型',
CASE WHEN hk6017<>zhk6017 THEN '桥墩类型 不一致'	ELSE null END'桥墩类型 对比',
NBZC.k6022 k6022,NBZC.zk6022 '资产平台|设计荷载等级代码',
CASE WHEN k6022<>zk6022 THEN '设计荷载等级代码 不一致'	ELSE null END'设计荷载等级代码 对比',
NBZC.hk6022 hk6022,NBZC.zhk6022 '资产平台|设计荷载等级',
CASE WHEN k6022<>zk6022 THEN '设计荷载等级 不一致'	ELSE null END'设计荷载等级 对比',
nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(K060.k6017)k6017,rtrim(ZCPT_K060.k6017) zk6017,
rtrim(K060.hk6017)hk6017,rtrim(ZCPT_K060.hk6017) zhk6017,
rtrim(K060.k6022)k6022,rtrim(ZCPT_K060.k6022) zk6022,
rtrim(K060.hk6022)hk6022,rtrim(ZCPT_K060.hk6022) zhk6022

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(K060.k6017)k6017,rtrim(ZCPT_K060.k6017) zk6017,
rtrim(K060.hk6017)hk6017,rtrim(ZCPT_K060.hk6017) zhk6017,
rtrim(K060.k6022)k6022,rtrim(ZCPT_K060.k6022) zk6022,
rtrim(K060.hk6022)hk6022,rtrim(ZCPT_K060.hk6022) zhk6022

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where
NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(

rtrim(NBZC.k6017)<>rtrim(NBZC.zk6017) or --  桥墩类型代码,
rtrim(NBZC.hk6017)<>rtrim(NBZC.zhk6017)	or --  桥墩类型,
rtrim(NBZC.k6022)<>rtrim(NBZC.zk6022)	 --  设计荷载等级代码,

)
order by k0101

--9.2.7
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,
NBZC.K6016 K6016,NBZC.zK6016 '资产平台|上部结构类型代码',
CASE WHEN HK6016<>zHK6016 THEN '上部结构类型代码 不一致'	ELSE null END'上部结构类型代码 对比',
NBZC.HK6016 HK6016,NBZC.zHK6016 '资产平台|上部结构类型',
CASE WHEN HK6016<>zHK6016 THEN '上部结构类型 不一致'	ELSE null END'上部结构类型 对比',
NBZC.K6110 K6110,NBZC.zK6110 '资产平台|上部结构材料代码',
CASE WHEN K6110<>zK6110 THEN '上部结构材料代码 不一致'	ELSE null END'上部结构材料代码 对比',
NBZC.HK6110 HK6110,NBZC.zHK6110 '资产平台|上部结构材料',
CASE WHEN HK6110<>zHK6110 THEN '上部结构材料 不一致'	ELSE null END'上部结构材料 对比',

nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.K6016)K6016,rtrim(ZCPT_K060.K6016)zK6016,
rtrim(k060.HK6016)HK6016,rtrim(ZCPT_K060.HK6016)zHK6016,
rtrim(k060.K6110)K6110,rtrim(ZCPT_K060.K6110)zK6110,
rtrim(k060.HK6110)HK6110,rtrim(ZCPT_K060.HK6110) zHK6110

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.K6016)K6016,rtrim(ZCPT_K060.K6016)zK6016,
rtrim(k060.HK6016)HK6016,rtrim(ZCPT_K060.HK6016)zHK6016,
rtrim(k060.K6110)K6110,rtrim(ZCPT_K060.K6110)zK6110,
rtrim(k060.HK6110)HK6110,rtrim(ZCPT_K060.HK6110) zHK6110

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where
NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
HK6016<>zHK6016 or--  上部结构类型,
K6110<>zK6110 or--  上部结构材料代码,
HK6110<>zHK6110-- 上部结构材料,
)
order by k0101

--9.2.8

