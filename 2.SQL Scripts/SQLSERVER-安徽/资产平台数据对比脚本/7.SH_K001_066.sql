SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑, 
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',

rtrim(k001.hK0182)	'年报|断链类型',	rtrim(zcpt_k001.hK0182)	'资产平台|断链类型',
rtrim(k001.HK0123)	'年报|是否断头',	rtrim(zcpt_k001.HK0123) '资产平台|是否断头',
case 
when rtrim(k001.hK0182)<>rtrim(zcpt_k001.hK0182)	and rtrim(k001.HK0123)=rtrim(zcpt_k001.HK0123)		then '断链类型 不一致' 
when rtrim(k001.hK0182)=rtrim(zcpt_k001.hK0182)	and rtrim(k001.HK0123)=rtrim(zcpt_k001.HK0123)		then '是否断头 不一致'
else '断链类型/是否断头 不一致'end '对比结果'


from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
--where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and 
(
rtrim(k001.hK0182)<>rtrim(zcpt_k001.hK0182)	or -- 断链类型,
rtrim(k001.HK0123)<>rtrim(zcpt_k001.HK0123)	 -- 是否断头,
)
