SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS 编辑, 
rtrim(k001.A0102)	'年报|管理单位代码',rtrim(k001.hA0102)	'年报|管理单位名称',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'年报|路线编码',	rtrim(zcpt_k001.k0101)	'资产平台|路线编码',
rtrim(k001.A0103)	'年报|政区代码',	rtrim(zcpt_k001.A0103)	'资产平台|政区代码',

rtrim(k001.K0180)	'年报|修建年度',	rtrim(zcpt_k001.K0180)	'资产平台|修建年度',
rtrim(k001.K0181)	'年报|改建年度',	rtrim(zcpt_k001.K0181)	'资产平台|改建年度',
rtrim(k001.K0155)	'年报|最后一次大中修年度',		rtrim(zcpt_k001.K0155)		'资产平台|最后一次大中修年度',
CASE 	when isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0') and isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0')
then '修建年度/改建年度/最后一次大中修年度 不一致'
			when isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0') and isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')=isnull(left(zcpt_k001.k0155,4),'0')
then '修建年度/改建年度 不一致'
			when isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0') and isnull(left(k001.K0181,4),'0')=isnull(left(zcpt_k001.K0181,4),'0')  and isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0')
then '修建年度/最后一次大中修年度 不一致'
			when isnull(left(k001.K0180,4),'0')=isnull(left(zcpt_k001.K0180,4),'0')  and isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0')
then '改建年度/最后一次大中修年度 不一致'
			WHEN isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0') and isnull(left(k001.K0181,4),'0')=isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')=isnull(left(zcpt_k001.k0155,4),'0')THEN '修建年度 不一致'
      when isnull(left(k001.K0180,4),'0')=isnull(left(zcpt_k001.K0180,4),'0')  and isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')=isnull(left(zcpt_k001.k0155,4),'0')then '改建年度 不一致'
			when isnull(left(k001.K0180,4),'0')=isnull(left(zcpt_k001.K0180,4),'0') and isnull(left(k001.K0181,4),'0')=isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0') then '最后一次大中修年度 不一致'
			else '0'
END


from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
--where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and 

(
isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0')	or -- 修建年度,
isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0')	or -- 改建年度,
isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0') -- 最后一次大中修年度,
)