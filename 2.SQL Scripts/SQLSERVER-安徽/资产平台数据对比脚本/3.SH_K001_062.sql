SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑, 

rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',

rtrim(k001.K0112)	'年报|路线名称',	rtrim(zcpt_k001.K0112)	'资产平台|路线名称',
k001.K0108	'年报|起点桩号',	zcpt_k001.K0108	'资产平台|起点桩号',
rtrim(k001.K0110)	'年报|起点桩号名称',	rtrim(zcpt_k001.K0110)	'资产平台|起点桩号名称',
k001.K0109	'年报|止点桩号',	zcpt_k001.K0109	'资产平台|止点桩号',
rtrim(k001.K0111)	'年报|止点桩号名称',	rtrim(zcpt_k001.K0111)	'资产平台|止点桩号名称',
case 
when rtrim(k001.K0110)=rtrim(zcpt_k001.K0110)	and rtrim(k001.K0111)<>rtrim(zcpt_k001.K0111)		then '起点桩号名称 不一致' 
when rtrim(k001.K0110)<>rtrim(zcpt_k001.K0110)	and rtrim(k001.K0111)=rtrim(zcpt_k001.K0111)		then '止点桩号名称 不一致'
else '起点桩号名称/止点桩号名称 不一致'end '对比结果'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where  k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
--where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
(
rtrim(k001.K0112)<>rtrim(zcpt_k001.K0112) or
rtrim(k001.K0110)<>rtrim(zcpt_k001.K0110)	or
rtrim(k001.K0111)<>rtrim(zcpt_k001.K0111)	
)