SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑, 
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',

rtrim(k001.HK5104)	'年报|面层类型',	rtrim(zcpt_k001.HK5104)	'资产平台|面层类型',
k001.K4002	'年报|路基宽度',	zcpt_k001.K4002	'资产平台|路基宽度',
k001.K5404	'年报|路面宽度',	zcpt_k001.K5404	'资产平台|路面宽度',
k001.K0306		'年报|面层厚度',	zcpt_k001.K0306		'资产平台|面层厚度',

CASE 	WHEN rtrim(k001.HK5104)<>rtrim(zcpt_k001.HK5104) THEN '面层类型 不一致'
      when k001.K4002<>zcpt_k001.K4002 then '路基宽度 不一致'
			when k001.K0306<>zcpt_k001.K0306 then '面层厚度 不一致'
			when k001.K5404<>zcpt_k001.K5404 then '路面宽度 不一致'
END


from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
--where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
(
rtrim(k001.HK5104)<>rtrim(zcpt_k001.HK5104)	or -- 面层类型,
k001.K4002<>zcpt_k001.K4002	or -- 路基宽度,
k001.K5404<>zcpt_k001.K5404	or -- 路面宽度,
k001.K0306<>zcpt_k001.K0306	 -- 面层厚度,
)