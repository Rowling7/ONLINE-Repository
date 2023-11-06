SELECT 
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS 编辑, 

RTRIM(K001.A0102) '管理单位代码' ,RTRIM(K001.HA0102) '管理单位名称',
K063.K6302 '年报|按隧道长度分类代码',	ZCPT_K063.K6302 '资产平台|按隧道长度分类代码',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '年报|按隧道长度分类汉字',	ZCPT_K063.SDDM '资产平台|按隧道长度分类汉字',

K063.K6304 '年报|按隧道长度分类代码',	ZCPT_K063.K6304 '资产平台|按隧道长度分类代码',
K063.hK6304 '年报|按隧道长度分类汉字',	ZCPT_K063.hK6304 '资产平台|按隧道长度分类汉字 ',
K063.hK6355 '年报|是否在长大隧道目录中',	ZCPT_K063.K6355 '资产平台|是否在长大隧道目录中',
K063.K0199 '年报|备注',	ZCPT_K063.K0199 '资产平台|备注',

CASE 	when rtrim(K063.K6304)<>rtrim(ZCPT_K063.K6304) and rtrim(K063.hK6304)<>rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) <>rtrim(ZCPT_K063.K6355)
then '按隧道长度分类代码/按隧道长度分类汉字/是否在长大隧道目录中 不一致'
			when rtrim(K063.K6304)<>rtrim(ZCPT_K063.K6304) and rtrim(K063.hK6304)<>rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) =rtrim(ZCPT_K063.K6355)
then '按隧道长度分类代码/按隧道长度分类汉字 不一致'
			when rtrim(K063.K6304)<>rtrim(ZCPT_K063.K6304) and rtrim(K063.hK6304)=rtrim(ZCPT_K063.hK6304)  and rtrim(K063.hK6355) <>rtrim(ZCPT_K063.K6355)
then '按隧道长度分类代码/是否在长大隧道目录中 不一致'
			when rtrim(K063.K6304)<>rtrim(ZCPT_K063.K6304)  and rtrim(K063.hK6304)<>rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) <>rtrim(ZCPT_K063.K6355)
then '按隧道长度分类汉字/是否在长大隧道目录中 不一致'
			WHEN rtrim(K063.K6304)<>rtrim(ZCPT_K063.K6304) and rtrim(K063.hK6304)=rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) =rtrim(ZCPT_K063.K6355)
THEN '按隧道长度分类代码 不一致'
      when rtrim(K063.K6304)=rtrim(ZCPT_K063.K6304)  and rtrim(K063.hK6304)<>rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) =rtrim(ZCPT_K063.K6355)
then '按隧道长度分类汉字 不一致'
			when rtrim(K063.K6304)=rtrim(ZCPT_K063.K6304) and rtrim(K063.hK6304)=rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) <>rtrim(ZCPT_K063.K6355)
then '是否在长大隧道目录中 不一致'
			else ''
END '对比结果'



from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
(
rtrim(K063.K6304) <>	rtrim(ZCPT_K063.K6304) or --按隧道长度分类代码',
rtrim(K063.hK6304) <>	rtrim(ZCPT_K063.hK6304) or --按隧道长度分类汉字 ',
rtrim(K063.hK6355) <>	rtrim(ZCPT_K063.K6355)  -- 是否在长大隧道目录中',
)

ORDER BY  sddm