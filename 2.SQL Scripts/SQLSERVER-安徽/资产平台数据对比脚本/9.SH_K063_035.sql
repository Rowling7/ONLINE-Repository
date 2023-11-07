SELECT 
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS 编辑, 

RTRIM(K001.A0102) '管理单位代码' ,RTRIM(K001.HA0102) '管理单位名称',
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
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
(
K063.A1313 <>ZCPT_K063.A1313 OR--单位性质代码',
K063.A0130 <>ZCPT_K063.A0130 OR--管养单位名称',
K063.K6111 <>	ZCPT_K063.K6111 --监管单位名称'
)
ORDER BY  sddm