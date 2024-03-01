-- 临时更新身份码
UPDATE zcpt_k060
SET zcpt_k060.k6040=rtrim(k060.k6040)
FROM zcpt_k060
left JOIN k060
ON (case when left(k060.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'L'+rtrim(k060.k6001) end) = rtrim(ZCPT_K060.k6001)
WHERE LEFT(k060.K0101,1) IN ('G','s')


--桥梁子查询
SELECT rtrim(K060.K6040)
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT  rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'


--9.2.3
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,rtrim(NBZC.zk0101)'资产平台|所在路线代码',
CASE WHEN rtrim(NBZC.k0101)<>rtrim(NBZC.zk0101) THEN '所在路线代码 不一致'	ELSE null END '所在路线代码 对比',
rtrim(NBZC.k6002) k6002,rtrim(NBZC.zk6002) '资产平台|桥梁名称',
CASE WHEN rtrim(NBZC.k6002)<>rtrim(NBZC.zk6002) THEN '桥梁名称 不一致'	ELSE null END '桥梁名称 对比',
rtrim(NBZC.k6003) k6003,rtrim(NBZC.zk6003) '资产平台|桥梁中心桩号',
CASE WHEN rtrim(NBZC.k6003)<>rtrim(NBZC.zk6003) THEN '桥梁中心桩号 不一致'	ELSE null END'桥梁中心桩号 对比',
rtrim(NBZC.A0103)A0103,rtrim(NBZC.zA0103)'资产平台|行政区划',
CASE WHEN rtrim(NBZC.A0103)<>rtrim(NBZC.zA0103) THEN '行政区划 不一致'	ELSE null END'行政区划 对比',
rtrim(NBZC.hA0103)hA0103,rtrim(NBZC.zhA0103)'资产平台|行政区划汉字',
CASE WHEN rtrim(NBZC.HA0103)<>rtrim(NBZC.zHA0103) THEN '行政区划汉字 不一致'	ELSE null END'行政区划汉字 对比',

nbzc.K6040
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,
rtrim(ZCPT_K060.K0101) zK0101,
rtrim(k060.A0103) A0103,rtrim(ZCPT_K060.A0103) zA0103,
rtrim(k060.hA0103) hA0103,rtrim(ZCPT_K060.hA0103) zhA0103,
rtrim(k060.k6002) k6002,rtrim(ZCPT_K060.k6002) zk6002,
rtrim(k060.k6003) k6003,rtrim(ZCPT_K060.k6003) zk6003,
rtrim(K060.K6040) K6040
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
--k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,
rtrim(ZCPT_K060.K0101) zK0101,
rtrim(k060.A0103) A0103,rtrim(ZCPT_K060.A0103) zA0103,
rtrim(k060.hA0103) hA0103,rtrim(ZCPT_K060.hA0103) zhA0103,
rtrim(k060.k6002) k6002,rtrim(ZCPT_K060.k6002) zk6002,
rtrim(k060.k6003) k6003,rtrim(ZCPT_K060.k6003) zk6003,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
--k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and(
rtrim(NBZC.k6002)<>rtrim(NBZC.zk6002) or -- 桥梁名称,
rtrim(NBZC.k6003)<>rtrim(NBZC.zk6003) or -- 桥梁中心桩号
rtrim(NBZC.k0101)<>rtrim(NBZC.zk0101) or
rtrim(NBZC.A0103)<>rtrim(NBZC.zA0103) or -- 行政区划
rtrim(NBZC.hA0103)<>rtrim(NBZC.zhA0103) -- 行政区划
)
order by k0101


--9.2.4
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,rtrim(NBZC.K6002) K6002,

rtrim(NBZC.K6065) K6065,rtrim(NBZC.zK6065) '资产平台|跨径总长',
CASE WHEN rtrim(NBZC.K6065)<>rtrim(NBZC.zK6065) THEN '跨径总长 不一致'	ELSE null END'跨径总长 对比',
rtrim(NBZC.K6063) K6063,rtrim(NBZC.zK6063) '资产平台|单孔最大跨径',
CASE WHEN rtrim(NBZC.K6063)<>rtrim(NBZC.zK6063) THEN '单孔最大跨径 不一致'	ELSE null END'单孔最大跨径 对比',
rtrim(NBZC.K6064) K6064,rtrim(NBZC.zK6064) '资产平台|桥梁跨径组合',
CASE WHEN rtrim(NBZC.K6064)<>rtrim(NBZC.zK6064) THEN '桥梁跨径组合 不一致'	ELSE null END'桥梁跨径组合 对比',

nbzc.K6040
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(K060.K6065) K6065,rtrim(ZCPT_K060.K6065) zK6065,
rtrim(K060.K6063) K6063,rtrim(ZCPT_K060.K6063) zK6063,
rtrim(K060.K6064) K6064,rtrim(ZCPT_K060.K6064) zK6064

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(K060.K6065) K6065,rtrim(ZCPT_K060.K6065) zK6065,
rtrim(K060.K6063) K6063,rtrim(ZCPT_K060.K6063) zK6063,
rtrim(K060.K6064) K6064,rtrim(ZCPT_K060.K6064) zK6064

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
COALESCE(CASE WHEN rtrim(NBZC.K6065)<>rtrim(NBZC.zK6065) THEN '跨径总长 不一致'	ELSE null END,
CASE WHEN rtrim(NBZC.K6063)<>rtrim(NBZC.zK6063) THEN '单孔最大跨径 不一致'	ELSE null END,
CASE WHEN rtrim(NBZC.K6064)<>rtrim(NBZC.zK6064) THEN '桥梁跨径组合 不一致'	ELSE null END
)  like '%不一致%'
order by k0101

--9.2.5
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
rtrim(NBZC.zk0101)'资产平台|所在路线代码',
CASE WHEN rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(NBZC.zk0101) THEN '所在路线代码 不一致'	ELSE null END '所在路线代码 对比',
NBZC.k0112,NBZC.zk0112 '资产平台|路线简称',
CASE WHEN rtrim(NBZC.k0112)<>rtrim(NBZC.zk0112) THEN '路线简称 不一致'	ELSE null END '路线简称 对比',
NBZC.hk0304,NBZC.zhk0304 '资产平台|所属路线技术等级对比',
CASE WHEN rtrim(NBZC.hk0304)<>rtrim(NBZC.zhk0304) THEN '所属路线技术等级对比 不一致'	ELSE null END'所属路线技术等级对比 对比',
nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,
rtrim(ZCPT_K060.K0101) zK0101,
rtrim(k060.k6003) k6003,
rtrim(K060.k0112) k0112 ,rtrim(ZCPT_K060.k0112) zk0112,
rtrim(k001.hk0304) hk0304,rtrim(ZCPT_k060.hk0304) zhk0304,
rtrim(K060.K6040) K6040
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,
rtrim(ZCPT_K060.K0101) zK0101,
rtrim(k060.k6003) k6003,
rtrim(K060.k0112) k0112 ,rtrim(ZCPT_K060.k0112) zk0112,
rtrim(k001.hk0304) hk0304,rtrim(ZCPT_k060.hk0304) zhk0304,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.k0112)<>rtrim(NBZC.Zk0112)	or --   路线简称,
rtrim(NBZC.hk0304)<>rtrim(NBZC.Zhk0304) or 	 --   所属路线技术等级对比,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(NBZC.zk0101)
)	 -- 路线代码,
order by k0101

--9.2.6
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,
NBZC.K6007 K6007,NBZC.zK6007 '资产平台|桥梁跨径分类代码',
CASE WHEN K6007<>zK6007 THEN '桥梁跨径分类代码 不一致'	ELSE null END'桥梁跨径分类代码 对比',
NBZC.HK6007 HK6007,NBZC.zHK6007 '资产平台|桥梁跨径分类',
CASE WHEN HK6007<>zHK6007 THEN '桥梁跨径分类 不一致'	ELSE null END'桥梁跨径分类 对比',
NBZC.K6004 K6004,NBZC.zK6004 '资产平台|按使用年限分代码',
CASE WHEN K6004<>zK6004 THEN '按使用年限分代码 不一致'	ELSE null END'按使用年限分代码 对比',
NBZC.HK6004 HK6004,NBZC.zHK6004 '资产平台|按使用年限分汉字',
CASE WHEN REPLACE(HK6004, '桥', '')<>zHK6004 THEN '按使用年限分汉字 不一致'	ELSE null END'按使用年限分汉字 对比',
nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.K6007)K6007,rtrim(ZCPT_K060.K6007) zK6007,
rtrim(k060.HK6007)HK6007,rtrim(ZCPT_K060.HK6007)	zHK6007,
rtrim(k060.K6004)K6004,rtrim(ZCPT_K060.K6004)	zK6004,
rtrim(k060.HK6004)HK6004,rtrim(ZCPT_K060.HK6004)	zHK6004

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.K6007)K6007,rtrim(ZCPT_K060.K6007) zK6007,
rtrim(k060.HK6007)HK6007,rtrim(ZCPT_K060.HK6007)	zHK6007,
rtrim(k060.K6004)K6004,rtrim(ZCPT_K060.K6004)	zK6004,
rtrim(k060.HK6004)HK6004,rtrim(ZCPT_K060.HK6004)	zHK6004

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where
NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.K6007)<>rtrim(NBZC.zK6007) or --  桥梁跨径分类代码,
rtrim(NBZC.HK6007)<>rtrim(NBZC.zHK6007)	or--  桥梁跨径分类,
rtrim(NBZC.K6004)<>rtrim(NBZC.zK6004)	or --  按使用年限分代码,
REPLACE(HK6004, '桥', '')<>zHK6004
)
order by k0101

--9.2.7
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,rtrim(NBZC.K6002) K6002,

rtrim(NBZC.k6023) k6023,rtrim(NBZC.zk6023) '资产平台|抗震等级代码',
CASE WHEN rtrim(NBZC.k6023)<>rtrim(NBZC.zk6023) THEN '抗震等级代码 不一致'	ELSE null END'抗震等级代码 对比',
rtrim(NBZC.hk6023) hk6023,rtrim(NBZC.zhk6023) '资产平台|抗震等级',
CASE WHEN rtrim(NBZC.k6023)<>rtrim(NBZC.zk6023) THEN '抗震等级 不一致'	ELSE null END'抗震等级 对比',

nbzc.K6040
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(K060.k6023) k6023,rtrim(ZCPT_K060.k6023) zk6023,
rtrim(K060.hk6023) hk6023,rtrim(ZCPT_K060.hk6023) zhk6023

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(K060.k6023) k6023,rtrim(ZCPT_K060.k6023) zk6023,
rtrim(K060.hk6023) hk6023,rtrim(ZCPT_K060.hk6023) zhk6023

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where --NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(

rtrim(NBZC.k6023)<>rtrim(NBZC.zk6023)-- or -- 抗震等级代码,
--rtrim(NBZC.hk6023)<>rtrim(NBZC.zhk6023)	 -- 抗震等级,


)
order by k0101


--9.2.8
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,rtrim(NBZC.K6002) K6002,

rtrim(NBZC.hk0149) hk0149,rtrim(NBZC.zhk0149) '资产平台|防洪标准',
CASE WHEN rtrim(NBZC.hk0149)<>isnull(rtrim(NBZC.zhk0149),'999') THEN '防洪标准 不一致'	ELSE null END'防洪标准 对比',

nbzc.K6040
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(K060.hk0149) hk0149,rtrim(ZCPT_K060.hk0149) zhk0149

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(K060.hk0149) hk0149,rtrim(ZCPT_K060.hk0149) zhk0149

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.hk0149)<>isnull(rtrim(NBZC.zhk0149),'999')	 -- 防洪标准,
)
order by k0101


--9.2.9 tonghang
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,rtrim(NBZC.K6002) K6002,


rtrim(NBZC.hK6024) hK6024,rtrim(NBZC.zhK6024) '资产平台|通航等级',
CASE WHEN rtrim(NBZC.hK6024)<>rtrim(NBZC.zhK6024) THEN '通航等级 不一致'        ELSE null END '通航等级 对比',
rtrim(NBZC.hA1328) hA1328,rtrim(NBZC.zhA1328) '资产平台|墩台防撞设施类型',
CASE WHEN rtrim(NBZC.hA1328)<>rtrim(NBZC.zhA1328) THEN '墩台防撞设施类型 不一致'        ELSE null END'墩台防撞设施类型 对比',

nbzc.K6040
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.hK6024) hK6024,rtrim(ZCPT_K060.hK6024) zhK6024,
rtrim(k060.hA1328) hA1328,rtrim(ZCPT_K060.hA1328) zhA1328

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.hK6024) hK6024,rtrim(ZCPT_K060.hK6024) zhK6024,
rtrim(k060.hA1328) hA1328,rtrim(ZCPT_K060.hA1328) zhA1328

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.hK6024)<>rtrim(NBZC.zhK6024) or -- 通航等级,
rtrim(NBZC.hA1328)<>rtrim(NBZC.zhA1328)-- 墩台防撞设施类型,
)
order by k0101


--9.2.10
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,rtrim(NBZC.K6002) K6002,


rtrim(NBZC.ha1306) ha1306,rtrim(NBZC.zha1306) '资产平台|主要病害位置',
CASE WHEN rtrim(NBZC.ha1306)<>rtrim(NBZC.zha1306) THEN '主要病害位置 不一致'        ELSE null END '主要病害位置 对比',
rtrim(NBZC.k6102) k6102,rtrim(NBZC.zk6102) '资产平台|主要病害描述',
CASE WHEN rtrim(NBZC.k6102)<>rtrim(NBZC.zk6102) THEN '主要病害描述 不一致'        ELSE null END'主要病害描述 对比',

nbzc.K6040
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.ha1306) ha1306,rtrim(ZCPT_K060.ha1306) zha1306,
rtrim(k060.k6102) k6102,rtrim(ZCPT_K060.k6102) zk6102

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
--k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.ha1306) ha1306,rtrim(ZCPT_K060.ha1306) zha1306,
rtrim(k060.k6102) k6102,rtrim(ZCPT_K060.k6102) zk6102

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
--k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where --NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.ha1306)<>rtrim(NBZC.zha1306) or -- 主要病害位置,
rtrim(NBZC.k6102)<>rtrim(NBZC.zk6102)        -- 主要病害描述,
)
order by k0101


--9.2.11
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,NBZC.K6003 k6003,

NBZC.k0181 k0181,NBZC.zk0181 '资产平台|改建年度',
CASE WHEN k0181<>zk0181 THEN '改建年度 不一致'	ELSE null END'改建年度 对比',
NBZC.a1316 a1316,NBZC.za1316 '资产平台|改造完工日期',
CASE WHEN a1316<>za1316 THEN '改造完工日期 不一致'	ELSE null END'改造完工日期 对比',

nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.k0181) k0181,rtrim(ZCPT_K060.k0181) zk0181,
rtrim(k060.a1316) a1316,rtrim(ZCPT_K060.a1316) za1316

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.k0181) k0181,rtrim(ZCPT_K060.k0181) zk0181,
rtrim(k060.a1316) a1316,rtrim(ZCPT_K060.a1316) za1316

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.k0181)<>rtrim(NBZC.zk0181)	or -- 改建年度,
rtrim(NBZC.a1316)<>rtrim(NBZC.za1316)	 -- 改造完工日期,
)
order by k0101

--9.2.12
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,
NBZC.a1302 a1302,NBZC.za1302 '资产平台|收费性质代码',
CASE WHEN a1302<>za1302 THEN '收费性质代码 不一致'	ELSE null END'收费性质代码 对比',
NBZC.ha1302 ha1302,NBZC.zha1302 '资产平台|收费性质服务',
CASE WHEN replace(replace(rtrim(NBZC.ha1302),'政府',''),'性','')<>zha1302 THEN '收费性质服务 不一致'	ELSE null END'收费性质服务 对比',
nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.a1302) a1302,rtrim(ZCPT_K060.a1302) za1302,
rtrim(k060.ha1302) ha1302,rtrim(ZCPT_K060.ha1302) zha1302

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
 k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.a1302) a1302,rtrim(ZCPT_K060.a1302) za1302,
rtrim(k060.ha1302) ha1302,rtrim(ZCPT_K060.ha1302) zha1302

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
 k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where  NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.a1302)<>rtrim(NBZC.za1302)	or -- 收费性质代码,
replace(replace(rtrim(NBZC.ha1302),'政府',''),'性','')<>rtrim(NBZC.zha1302)	 -- 收费性质服务,
)
order by k0101

--9.2.13
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,
NBZC.A1307 A1307,NBZC.zA1307 '资产平台|已采取交通管制措施代码',
CASE WHEN A1307<>zA1307 THEN '已采取交通管制措施代码 不一致'	ELSE null END'已采取交通管制措施代码 对比',
NBZC.hA1307 hA1307,NBZC.zhA1307 '资产平台|已采取交通管制措施',
CASE WHEN hA1307<>zhA1307 THEN '已采取交通管制措施 不一致'	ELSE null END'已采取交通管制措施 对比',
nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.A1307) A1307,rtrim(ZCPT_K060.A1307) zA1307,
rtrim(k060.hA1307) hA1307,rtrim(ZCPT_K060.hA1307) zhA1307

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.A1307) A1307,rtrim(ZCPT_K060.A1307) zA1307,
rtrim(k060.hA1307) hA1307,rtrim(ZCPT_K060.hA1307) zhA1307

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.A1307)<>rtrim(NBZC.zA1307)	or -- 已采取交通管制措施代码,
rtrim(NBZC.hA1307)<>rtrim(NBZC.zhA1307)	 -- 已采取交通管制措施,
)
order by k0101

--9.2.14
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,NBZC.K6003 k6003,

rtrim(NBZC.ha1319) ha1319,rtrim(NBZC.zha1319) '资产平台|是否部补助项目',
CASE WHEN rtrim(NBZC.ha1319)<>rtrim(NBZC.zha1319) THEN '是否部补助项目 不一致'        ELSE null END '是否部补助项目 对比',
rtrim(NBZC.hk6118) hk6118,rtrim(NBZC.zhk6118) '资产平台|是否宽路窄桥',
CASE WHEN rtrim(NBZC.hk6118)<>rtrim(NBZC.zhk6118) THEN '是否宽路窄桥 不一致'        ELSE null END'是否宽路窄桥 对比',
rtrim(NBZC.hk6119) hk6119,rtrim(NBZC.zhk6119) '资产平台|是否在长大桥梁目录中',
CASE WHEN rtrim(NBZC.hk6119)<>rtrim(NBZC.zhk6119) THEN '是否在长大桥梁目录中 不一致'        ELSE null END '是否在长大桥梁目录中 对比',
rtrim(NBZC.hk6120) hk6120,rtrim(NBZC.zhk6120) '资产平台|是否跨省桥梁',
CASE WHEN rtrim(NBZC.hk6120)<>rtrim(NBZC.zhk6120) THEN '是否跨省桥梁 不一致'        ELSE null END '是否跨省桥梁 对比',
rtrim(NBZC.hk6041) hk6041,rtrim(NBZC.zhk6041) '资产平台|是否公铁两用桥梁',
CASE WHEN rtrim(NBZC.hk6041)<>rtrim(NBZC.zhk6041) THEN '是否公铁两用桥梁 不一致'        ELSE null END'是否公铁两用桥梁 对比',

nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

case when len(k060.ha1319)>0 then k060.ha1319 when len(k060.ha1319)=0 or k060.ha1319 is null then null end  ha1319,
rtrim(ZCPT_K060.ha1319) zha1319,
rtrim(k060.hk6118) hk6118,rtrim(ZCPT_K060.hk6118) zhk6118,
rtrim(k060.hk6119) hk6119,rtrim(ZCPT_K060.hk6119) zhk6119,
rtrim(k060.hk6120) hk6120,rtrim(ZCPT_K060.hk6120) zhk6120,
rtrim(k060.hk6041) hk6041,rtrim(ZCPT_K060.hk6041) zhk6041

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

case when len(k060.ha1319)>0 then k060.ha1319 when len(k060.ha1319)=0 or k060.ha1319 is null then null end  ha1319,
rtrim(ZCPT_K060.ha1319) zha1319,
rtrim(k060.hk6118) hk6118,rtrim(ZCPT_K060.hk6118) zhk6118,
rtrim(k060.hk6119) hk6119,rtrim(ZCPT_K060.hk6119) zhk6119,
rtrim(k060.hk6120) hk6120,rtrim(ZCPT_K060.hk6120) zhk6120,
rtrim(k060.hk6041) hk6041,rtrim(ZCPT_K060.hk6041) zhk6041

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.ha1319)<>rtrim(NBZC.zha1319) or -- 是否部补助项目,
rtrim(NBZC.hk6118)<>rtrim(NBZC.zhk6118) or -- 是否宽路窄桥,
rtrim(NBZC.hk6119)<>rtrim(NBZC.zhk6119) or -- 是否在长大桥梁目录中,
rtrim(NBZC.hk6120)<>rtrim(NBZC.zhk6120) or -- 是否跨省桥梁,
rtrim(NBZC.hk6041)<>rtrim(NBZC.zhk6041)         -- 是否公铁两用桥梁,
)
order by k0101
--9.2.15
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,NBZC.K6003 k6003,

NBZC.k0180 k0180,NBZC.zk0180 '资产平台|修建年度',
CASE WHEN k0180<>left(rtrim(NBZC.zk0180),4) THEN '修建年度 不一致'	ELSE null END'修建年度 对比',
NBZC.k0116 k0116,NBZC.zk0116 '资产平台|通车日期',
CASE WHEN k0116<>zk0116 THEN '通车日期 不一致'	ELSE null END'通车日期 对比',

nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.k0180) k0180,rtrim(ZCPT_K060.k0180) zk0180,
rtrim(k060.k0116) k0116,rtrim(ZCPT_K060.k0116) zk0116

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.k0180) k0180,rtrim(ZCPT_K060.k0180) zk0180,
rtrim(k060.k0116) k0116,rtrim(ZCPT_K060.k0116) zk0116

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.k0180)<>left(rtrim(NBZC.zk0180),4)	or -- 修建年度,
rtrim(NBZC.k0116)<>rtrim(NBZC.zk0116)	 -- 通车日期,
)
order by k0101
--9.2.16
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,NBZC.K6003 k6003,

rtrim(NBZC.k6028) k6028,rtrim(NBZC.zk6028) '资产平台|技术状况评定代码',
CASE WHEN rtrim(NBZC.k6028)<>rtrim(NBZC.zk6028) THEN '技术状况评定代码 不一致'        ELSE null END '技术状况评定代码 对比',
rtrim(NBZC.hk6028) hk6028,rtrim(NBZC.zhk6028) '资产平台|技术状况评定',
CASE WHEN rtrim(NBZC.k6028)<>rtrim(NBZC.zk6028) THEN '技术状况评定 不一致'        ELSE null END'技术状况评定 对比',
rtrim(NBZC.a1305) a1305,rtrim(NBZC.za1305) '资产平台|评定日期',
CASE WHEN rtrim(NBZC.a1305)<>rtrim(NBZC.za1305) THEN '评定日期 不一致'        ELSE null END '评定日期 对比',
rtrim(NBZC.k6050) k6050,rtrim(NBZC.zk6050) '资产平台|技术状况评定单位',
CASE WHEN rtrim(NBZC.k6050)<>rtrim(NBZC.zk6050) THEN '技术状况评定单位 不一致'        ELSE null END'技术状况评定单位 对比',

nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.k6028) k6028,rtrim(ZCPT_K060.k6028) zk6028,
rtrim(k060.hk6028) hk6028,rtrim(ZCPT_K060.hk6028) zhk6028,
rtrim(k060.a1305) a1305,rtrim(ZCPT_K060.a1305) za1305,
rtrim(k060.k6050) k6050,rtrim(ZCPT_K060.k6050) zk6050

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.k6028) k6028,rtrim(ZCPT_K060.k6028) zk6028,
rtrim(k060.hk6028) hk6028,rtrim(ZCPT_K060.hk6028) zhk6028,
rtrim(k060.a1305) a1305,rtrim(ZCPT_K060.a1305) za1305,
rtrim(k060.k6050) k6050,rtrim(ZCPT_K060.k6050) zk6050

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.k6028)<>rtrim(NBZC.zk6028) or -- 技术状况评定代码,
rtrim(NBZC.a1305)<>rtrim(NBZC.za1305) or -- 评定日期,
rtrim(NBZC.k6050)<>rtrim(NBZC.zk6050)         -- 技术状况评定单位,
)
order by k0101
--9.2.17
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,NBZC.K6003 k6003,

rtrim(NBZC.ha1317) ha1317,rtrim(NBZC.zha1317) '资产平台|改造部位',
CASE WHEN rtrim(NBZC.ha1317)<>isnull(NBZC.zha1317,'9999') THEN '改造部位 不一致'        ELSE null END '改造部位 对比',
rtrim(NBZC.ha1318) ha1318,rtrim(NBZC.zha1318) '资产平台|工程性质',
CASE WHEN rtrim(NBZC.ha1318)<>isnull(rtrim(NBZC.zha1318),'9999') THEN '工程性质 不一致'        ELSE null END'工程性质 对比',
rtrim(NBZC.k6051) k6051,rtrim(NBZC.zk6051) '资产平台|改造施工单位',
CASE WHEN rtrim(NBZC.k6051)<>isnull(rtrim(NBZC.zk6051),'9999') THEN '改造施工单位 不一致'        ELSE null END '改造施工单位 对比',

nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

case when len(k060.ha1317)>0 then k060.ha1317 when len(k060.ha1317)=0 or k060.ha1317 is null then null end  ha1317,
rtrim(ZCPT_K060.ha1317) zha1317,
case when len(k060.ha1318)>0 then k060.ha1318 when len(k060.ha1318)=0 or k060.ha1318 is null then null end  ha1318,
rtrim(ZCPT_K060.ha1318) zha1318,
case when len(k060.k6051)>0 then k060.k6051 when len(k060.k6051)=0 or k060.k6051 is null then null end  k6051,
rtrim(ZCPT_K060.k6051) zk6051

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

case when len(k060.ha1317)>0 then k060.ha1317 when len(k060.ha1317)=0 or k060.ha1317 is null then null end  ha1317,
rtrim(ZCPT_K060.ha1317) zha1317,
case when len(k060.ha1318)>0 then k060.ha1318 when len(k060.ha1318)=0 or k060.ha1318 is null then null end  ha1318,
rtrim(ZCPT_K060.ha1318) zha1318,
case when len(k060.k6051)>0 then k060.k6051 when len(k060.k6051)=0 or k060.k6051 is null then null end  k6051,
rtrim(ZCPT_K060.k6051) zk6051

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.ha1317)<>rtrim(NBZC.zha1317) or -- 改造部位,
rtrim(NBZC.ha1318)<>rtrim(NBZC.zha1318) or -- 工程性质,
rtrim(NBZC.k6051)<>rtrim(NBZC.zk6051)  -- 改造施工单位
)
order by k0101
--9.2.18
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,NBZC.K6003 k6003,

rtrim(NBZC.ha1317) ha1317,rtrim(NBZC.zha1317) '资产平台|改造部位',
CASE WHEN rtrim(NBZC.ha1317)<>isnull(NBZC.zha1317,'9999') THEN '改造部位 不一致'        ELSE null END '改造部位 对比',
rtrim(NBZC.ha1318) ha1318,rtrim(NBZC.zha1318) '资产平台|工程性质',
CASE WHEN rtrim(NBZC.ha1318)<>isnull(rtrim(NBZC.zha1318),'9999') THEN '工程性质 不一致'        ELSE null END'工程性质 对比',
rtrim(NBZC.k6051) k6051,rtrim(NBZC.zk6051) '资产平台|改造施工单位',
CASE WHEN rtrim(NBZC.k6051)<>isnull(rtrim(NBZC.zk6051),'9999') THEN '改造施工单位 不一致'        ELSE null END '改造施工单位 对比',

nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

case when len(k060.ha1317)>0 then k060.ha1317 when len(k060.ha1317)=0 or k060.ha1317 is null then null end  ha1317,
rtrim(ZCPT_K060.ha1317) zha1317,
case when len(k060.ha1318)>0 then k060.ha1318 when len(k060.ha1318)=0 or k060.ha1318 is null then null end  ha1318,
rtrim(ZCPT_K060.ha1318) zha1318,
case when len(k060.k6051)>0 then k060.k6051 when len(k060.k6051)=0 or k060.k6051 is null then null end  k6051,
rtrim(ZCPT_K060.k6051) zk6051

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

case when len(k060.ha1317)>0 then k060.ha1317 when len(k060.ha1317)=0 or k060.ha1317 is null then null end  ha1317,
rtrim(ZCPT_K060.ha1317) zha1317,
case when len(k060.ha1318)>0 then k060.ha1318 when len(k060.ha1318)=0 or k060.ha1318 is null then null end  ha1318,
rtrim(ZCPT_K060.ha1318) zha1318,
case when len(k060.k6051)>0 then k060.k6051 when len(k060.k6051)=0 or k060.k6051 is null then null end  k6051,
rtrim(ZCPT_K060.k6051) zk6051

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.ha1317)<>rtrim(NBZC.zha1317) or -- 改造部位,
rtrim(NBZC.ha1318)<>rtrim(NBZC.zha1318) or -- 工程性质,
rtrim(NBZC.k6051)<>rtrim(NBZC.zk6051)  -- 改造施工单位
)
order by k0101
--9.2.19
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,

rtrim(NBZC.K6079) K6079,rtrim(NBZC.zK6079) '资产平台|建设单位名称',
CASE WHEN rtrim(NBZC.K6079)<>rtrim(NBZC.zK6079) THEN '建设单位名称 不一致'        ELSE null END '建设单位名称 对比',
rtrim(NBZC.K6030) K6030,rtrim(NBZC.zK6030) '资产平台|设计单位名称',
CASE WHEN rtrim(NBZC.K6030)<>rtrim(NBZC.zK6030) THEN '设计单位名称 不一致'        ELSE null END'设计单位名称 对比',
rtrim(NBZC.K6031) K6031,rtrim(NBZC.zK6031) '资产平台|施工单位名称',
CASE WHEN rtrim(NBZC.K6031)<>rtrim(NBZC.zK6031) THEN '施工单位名称 不一致'        ELSE null END '施工单位名称 对比',
rtrim(NBZC.K6032) K6032,rtrim(NBZC.zK6032) '资产平台|监理单位名称',
CASE WHEN rtrim(NBZC.K6032)<>rtrim(NBZC.zK6032) THEN '监理单位名称 不一致'        ELSE null END'监理单位名称 对比',
nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.K6079) K6079,rtrim(ZCPT_K060.K6079) zK6079,
rtrim(k060.K6030) K6030,rtrim(ZCPT_K060.K6030) zK6030,
rtrim(k060.K6031) K6031,rtrim(ZCPT_K060.K6031) zK6031,
rtrim(k060.K6032) K6032,rtrim(ZCPT_K060.K6032) zK6032

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.K6079) K6079,rtrim(ZCPT_K060.K6079) zK6079,
rtrim(k060.K6030) K6030,rtrim(ZCPT_K060.K6030) zK6030,
rtrim(k060.K6031) K6031,rtrim(ZCPT_K060.K6031) zK6031,
rtrim(k060.K6032) K6032,rtrim(ZCPT_K060.K6032) zK6032

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.K6079)<>rtrim(NBZC.zK6079) or -- 建设单位名称,
rtrim(NBZC.K6030)<>rtrim(NBZC.zK6030) or -- 设计单位名称,
rtrim(NBZC.K6031)<>rtrim(NBZC.zK6031) or -- 施工单位名称,
rtrim(NBZC.K6032)<>rtrim(NBZC.zK6032)         -- 监理单位名称
)
order by k0101
--9.2.20
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS 编辑,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,

rtrim(NBZC.hK6117) hK6117,rtrim(NBZC.zhK6117) '资产平台|桥梁所在位置',
CASE WHEN rtrim(NBZC.hK6117)<>rtrim(NBZC.zhK6117) THEN '桥梁所在位置 不一致'        ELSE null END '桥梁所在位置 对比',
nbzc.K6040 '桥梁身份码/桥梁编号'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.hK6117) hK6117,rtrim(ZCPT_K060.hK6117) zhK6117

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.hK6117) hK6117,rtrim(ZCPT_K060.hK6117) zhK6117

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.hK6117)<>rtrim(NBZC.zhK6117) -- 桥梁所在位置
)
order by k0101