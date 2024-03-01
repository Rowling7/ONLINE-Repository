SELECT 
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS 编辑, 
RTRIM(K001.A0102) '管理单位代码' ,RTRIM(K001.HA0102) '管理单位名称',
K063.K6302 '年报|隧道长度(米)',	ZCPT_K063.K6302 '资产平台|隧道长度(米)',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '年报|隧道净宽(米)',	ZCPT_K063.SDDM '资产平台|隧道净宽(米)',

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
(
isnull(K063.K6305,0) <>isnull(ZCPT_K063.K6305,0) or --隧道长度(米)
isnull(K063.K6306,0) <>isnull(ZCPT_K063.K6306,0) or --隧道净宽(米)
isnull(K063.K6307,0) <>isnull(ZCPT_K063.K6307,0) --隧道净高(米)
)
ORDER BY  sddm