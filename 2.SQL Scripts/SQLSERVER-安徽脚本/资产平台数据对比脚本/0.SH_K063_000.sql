SELECT 
	rtrim(k001.a0102) '管理单位',
	zcpt_k063.SDDM 		'资产平台|隧道代码',
	zcpt_k063.K6303 	'资产平台|隧道入口桩号',
	zcpt_k063.k6302 	'资产平台|隧道名称',
	zcpt_k063.k0101 	'资产平台|路线编号',
	zcpt_k063.K0112 	'资产平台|路线名称',
	'未找到管理单位' 	' 对比结果'
	
FROM zcpt_k063
left JOIN k001
on rtrim(zcpt_k063.k0101)=rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) and ISNULL(zcpt_k063.k6303,0)>=ISNULL(k001.k0108,0) and ISNULL(zcpt_k063.k6303,0)<=ISNULL(k001.k0109,0)
where rtrim(k001.a0102) is null 