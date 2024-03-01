SELECT 
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS 编辑, 

RTRIM(K001.A0102) '管理单位代码' ,RTRIM(K001.HA0102) '管理单位名称',
K063.K6302 '年报|隧道名称',	ZCPT_K063.K6302 '资产平台|隧道名称',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '年报|隧道代码',	ZCPT_K063.SDDM '资产平台|隧道代码',

RTRIM(K063.K6079) '年报|建设单位名称',	RTRIM(ZCPT_K063.K6079) '资产平台|建设单位名称',
RTRIM(K063.K6030) '年报|设计单位名称',	RTRIM(ZCPT_K063.K6030) '资产平台|设计单位名称',
RTRIM(K063.K6031) '年报|施工单位名称',	RTRIM(ZCPT_K063.K6031) '资产平台|施工单位名称',
RTRIM(K063.K6032) '年报|监理单位名称',	RTRIM(ZCPT_K063.K6032) '资产平台|监理单位名称',
RTRIM(K063.K0116) '年报|建成通车时间',	RTRIM(ZCPT_K063.K0116) '资产平台|建成通车时间',
K063.K0199 '年报|备注',	ZCPT_K063.K0199 '资产平台|备注',

CASE WHEN RTRIM(K063.K6079) <>	RTRIM(ZCPT_K063.K6079) THEN '建设单位名称 不一致'
WHEN RTRIM(K063.K6030) <>	RTRIM(ZCPT_K063.K6030) THEN '设计单位名称 不一致'
WHEN RTRIM(K063.K6031) <>	RTRIM(ZCPT_K063.K6031) THEN '施工单位名称 不一致'
WHEN RTRIM(K063.K6032) <>	RTRIM(ZCPT_K063.K6032) THEN '监理单位名称 不一致'
WHEN RTRIM(K063.K0116) <>	RTRIM(ZCPT_K063.K0116) THEN '建成通车时间 不一致' 
else 'error'
end

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
(
RTRIM(K063.K6079) <>	RTRIM(ZCPT_K063.K6079) OR --建设单位名称',
RTRIM(K063.K6030) <>	RTRIM(ZCPT_K063.K6030) OR --设计单位名称',
RTRIM(K063.K6031) <>	RTRIM(ZCPT_K063.K6031) OR --施工单位名称',
RTRIM(K063.K6032) <>	RTRIM(ZCPT_K063.K6032) OR --监理单位名称',
RTRIM(K063.K0116) <>	RTRIM(ZCPT_K063.K0116)  --建成通车时间',
)
ORDER BY  sddm