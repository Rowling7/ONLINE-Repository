SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑, 
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',

rtrim(k001.HK0304)	'年报|技术等级',	rtrim(LEFT(zcpt_k001.hK0304, 2))	'资产平台|技术等级',
rtrim(k001.HK0126)	'年报|是否一幅高速',	rtrim(zcpt_k001.HK0126)	'资产平台|是否一幅高速',
rtrim(k001.K0404)	'年报|设计时速',	rtrim(zcpt_k001.K0404) '资产平台|设计时速(km/h)',
k001.K5222	'年报|车道数量',	zcpt_k001.K5222	'资产平台|车道数量',
case 
when rtrim(k001.hK0304)<>rtrim(LEFT(zcpt_k001.hK0304, 2))	then '技术等级 不一致' 
when rtrim(k001.HK0126)<>rtrim(zcpt_k001.HK0126)		then '是否一幅高速 不一致'
when rtrim(k001.K0404)<>rtrim(zcpt_k001.K0404)		then '设计时速 不一致'
when k001.K5222<>zcpt_k001.K5222		then '车道数量 不一致'
end '对比结果'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where  k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
--where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
(
rtrim(k001.hK0304)<>rtrim(LEFT(zcpt_k001.hK0304, 2))	or -- 年报|技术等级,
rtrim(k001.HK0126)<>rtrim(zcpt_k001.HK0126)	or -- 是否一幅高速,
rtrim(k001.K0404)<>rtrim(zcpt_k001.K0404)	or -- 设计时速,
k001.K5222<>zcpt_k001.K5222	 -- 车道数量
)