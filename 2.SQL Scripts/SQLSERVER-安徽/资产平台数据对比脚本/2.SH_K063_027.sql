SELECT 
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS 编辑, 
RTRIM(K001.A0102) '管理单位代码' ,RTRIM(K001.HA0102) '管理单位名称',
K063.K6302 '年报|路线编号',	ZCPT_K063.K6302 '资产平台|路线编号',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '年报|路线名称',	ZCPT_K063.SDDM '资产平台|路线名称',

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