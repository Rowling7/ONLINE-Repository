SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑, 
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',


rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))'年报|重复路段编码',	rtrim(zcpt_k001.K0124)	'资产平台|重复路段编码',
k001.K0162	'年报|重复路段起点桩号',	zcpt_k001.K0162	'资产平台|重复路段起点桩号',
k001.K0163	'年报|重复路段止点桩号',	zcpt_k001.K0163 '资产平台|重复路段止点桩号',
k001.hk0176	'年报|是否反向重复',

CASE 	when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K0124) and k001.K0162<>zcpt_k001.K0162 and k001.K0163<>zcpt_k001.K0163
then '重复路段编码/ 重复路段起点桩号/重复路段止点桩号 不一致'
			when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K0124) and k001.K0162<>zcpt_k001.K0162 and k001.K0163=zcpt_k001.K0163
then '重复路段编码/ 重复路段起点桩号 不一致'
			when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K0124) and k001.K0162=zcpt_k001.K0162  and k001.K0163<>zcpt_k001.K0163
then '重复路段编码/重复路段止点桩号 不一致'
			when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(zcpt_k001.K0124)  and k001.K0162<>zcpt_k001.K0162 and k001.K0163<>zcpt_k001.K0163
then ' 重复路段起点桩号/重复路段止点桩号 不一致'
			WHEN rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K0124) and k001.K0162=zcpt_k001.K0162 and k001.K0163=zcpt_k001.K0163
THEN '重复路段编码 不一致'
      when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(zcpt_k001.K0124)  and k001.K0162<>zcpt_k001.K0162 and k001.K0163=zcpt_k001.K0163
then ' 重复路段起点桩号 不一致'
			when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(zcpt_k001.K0124) and k001.K0162=zcpt_k001.K0162 and k001.K0163<>zcpt_k001.K0163
then '重复路段止点桩号 不一致'
			else 'error'
END '对比结果'


from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
--where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and 
(
rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K0124)	or -- 重复路段编码,
k001.K0162<>zcpt_k001.K0162	or -- 重复路段起点桩号,
k001.K0163<>zcpt_k001.K0163	 -- 重复路段止点桩号,
)