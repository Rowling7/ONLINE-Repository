SELECT 
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',
rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
k001.K0108	'年报|起点桩号',
zcpt_k001.K0108	'资产平台|起点桩号',
k001.K0109	'年报|止点桩号',
zcpt_k001.K0109	'资产平台|止点桩号',
rtrim(zcpt_k001.K0112)	'资产平台|路线名称',
'年报路线分段和资产平台路线分段 不一致！' '对比结果'
FROM zcpt_k001
full JOIN k001
ON rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) +CAST(k001.K0108 as VARCHAR(20)) +CAST(k001.K0109 as VARCHAR(20))=rtrim(zcpt_k001.k0101) +CAST(zcpt_k001.K0108 as VARCHAR(20)) +CAST(zcpt_k001.K0109 as VARCHAR(20))
WHERE k001.a0102 IS NULL or rtrim(zcpt_k001.k0101) IS NULL 
--and  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%'
--ORDER BY rtrim(zcpt_k001.k0101)
