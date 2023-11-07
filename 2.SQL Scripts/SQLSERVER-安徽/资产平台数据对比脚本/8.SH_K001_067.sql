SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑, 
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',

rtrim(k001.HK0121)	'年报|是否城管',	rtrim(zcpt_k001.HK0121)	'资产平台|是否城管',
rtrim(k001.HK0136)	'年报|路段收费性质',	rtrim(zcpt_k001.HK0136) '资产平台|路段收费性质',
rtrim(k001.HK0156) '年报|省际出入口',		rtrim(zcpt_k001.HK0156) '资产平台|省际出入口',
CASE 	when rtrim(k001.HK0136)<>rtrim(zcpt_k001.HK0136) and rtrim(k001.HK0121)<>rtrim(zcpt_k001.HK0121) and rtrim(k001.HK0156)<>rtrim(zcpt_k001.HK0156)
then '路段收费性质/是否城管/省际出入口 不一致'
			when rtrim(k001.HK0136)<>rtrim(zcpt_k001.HK0136) and rtrim(k001.HK0121)<>rtrim(zcpt_k001.HK0121) and rtrim(k001.HK0156)=rtrim(zcpt_k001.HK0156)
then '路段收费性质/是否城管 不一致'
			when rtrim(k001.HK0136)<>rtrim(zcpt_k001.HK0136) and rtrim(k001.HK0121)=rtrim(zcpt_k001.HK0121)  and rtrim(k001.HK0156)<>rtrim(zcpt_k001.HK0156)
then '路段收费性质/省际出入口 不一致'
			when rtrim(k001.HK0136)<>rtrim(zcpt_k001.HK0136)  and rtrim(k001.HK0121)<>rtrim(zcpt_k001.HK0121) and rtrim(k001.HK0156)<>rtrim(zcpt_k001.HK0156)
then '是否城管/省际出入口 不一致'
			WHEN rtrim(k001.HK0136)<>rtrim(zcpt_k001.HK0136) and rtrim(k001.HK0121)=rtrim(zcpt_k001.HK0121) and rtrim(k001.HK0156)=rtrim(zcpt_k001.HK0156)
THEN '路段收费性质 不一致'
      when rtrim(k001.HK0136)=rtrim(zcpt_k001.HK0136)  and rtrim(k001.HK0121)<>rtrim(zcpt_k001.HK0121) and rtrim(k001.HK0156)=rtrim(zcpt_k001.HK0156)
then '是否城管 不一致'
			when rtrim(k001.HK0136)=rtrim(zcpt_k001.HK0136) and rtrim(k001.HK0121)=rtrim(zcpt_k001.HK0121) and rtrim(k001.HK0156)<>rtrim(zcpt_k001.HK0156)
then '省际出入口 不一致'
			else ''
END '对比结果'



from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
--where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and 
(
rtrim(k001.HK0136)<>rtrim(zcpt_k001.HK0136)	or -- 路段收费性质,
rtrim(k001.HK0121)<>rtrim(zcpt_k001.HK0121)	or -- 是否城管,
rtrim(k001.HK0156)<>rtrim(zcpt_k001.HK0156)	 -- 省际出入口,
)

