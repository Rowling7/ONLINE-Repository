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
and k001.k0108=ZCPT_K001.k0108 and 
(
isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0)	or -- 养护里程,
isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0)	or -- 可绿化里程,
isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)	 -- 已绿化里程,
)
