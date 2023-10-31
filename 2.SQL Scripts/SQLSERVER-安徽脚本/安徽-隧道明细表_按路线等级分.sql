IF OBJECT_ID('TEMPDB..#K01') IS NOT NULL DROP TABLE #K01
SELECT
rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) k0101
INTO #K01
FROM K01
WHERE left(k01.K0101,1) in ('G','S','X','Y','Z','C','h','t') 
      and (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2'  and K0304='10'
GROUP BY rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))
ORDER BY rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))

select
	[col01] = rtrim(k63.k6302),   	--隧道名称
	[col02] = rtrim(k63.k6301),  	--隧道代码
 	[col03] = k63.k6303,		--隧道入口桩号
  [col04] = rtrim(replace(replace(replace(replace(replace(k63.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')),  	--路线编码
	[col05] = rtrim(a50.k0112),   	--路线简称
	[col06] = rtrim(d.objjc),	--技术等级
	[col07] = k63.k6305,		--隧道长度
	[col08] = k63.k6306,		--隧道净宽
	[col09] = k63.k6307,		--隧道净高
	[col10] = rtrim(k63.k6304),  	--隧道分类代码
	[col11] = rtrim(k63.hk6304),  	--隧道分类名称
	[col12] = ISNULL(HK6335,'否'),  --是否水下隧道
	[col13] = RTRIM(HK6023),  	--抗震等级
	[col14] = RTRIM(REPLACE(HK0149,'年','')),  	--防洪标准
	[col15] = rtrim(k63.k0180),  	--修建年度
	[col16] = rtrim(k63.k6079),  	--建设单位名称
	[col17] = rtrim(replace(k63.k6320,char(127),'')),  	--设计单位名称
	[col18] = rtrim(replace(k63.k6321,char(127),'')),  	--施工单位名称
	[col19] = rtrim(k63.k6322),  	--监理单位名称
	[col20] = rtrim(k63.k0116),    	--通车时间
	[col21] = RTRIM(isnull(k63.HK6343,'')),    	--隧道养护等级
	[col22] = rtrim(k63.A1313),    	--管养单位性质代码
	[col23] = rtrim(replace(k63.a0130,' ','')),    	--管养单位名称
	[col24] = rtrim(k63.k6111),  	--监管单位名称
	[col25] = rtrim(k63.HK6336), 	--评定等级(总体)
	[col26] = rtrim(k63.K6344),  	--评定日期(总体)
	[col27] = rtrim(k63.K6345),  	--评定单位(总体)
	[col28] = rtrim(k63.HK6346), 	--评定等级(土建结构)
	[col29] = rtrim(k63.K6347),  	--评定日期(土建结构)
	[col30] = rtrim(k63.K6348),  	--评定单位(土建结构)
	[col31] = rtrim(k63.HK6349), 	--评定等级(机电设施)
	[col32] = rtrim(k63.K6350),  	--评定日期(机电设施)
	[col33] = rtrim(k63.K6351),  	--评定单位(机电设施)
	[col34] = rtrim(k63.HK6352), 	--评定等级(其他工程设施)
	[col35] = rtrim(k63.K6353),  	--评定日期(其他工程设施)
	[col36] = rtrim(k63.K6354),  	--评定单位(其他工程设施)
	[col37] = rtrim(k63.k0181),  	--改建年度
	[col38] = rtrim(k63.A1316),  	--改造完工日期
	[col39] = rtrim(k63.HK6337),  	--改造部位
	[col40] = rtrim(k63.HA1318),  	--工程性质
	[col41] = rtrim(k63.HK6338),  	--病害部位
	[col42] = replace(rtrim(k63.K6339),' ',''),  	--病害描述
	[col43] = left(k63.a0103,6),	--县级政区代码
	[col44] = RTRIM(isnull(k63.HK6370,'')),		--隧道所在位置
	[col45] = RTRIM(isnull(k63.HK6355,'否')),	--是否在长大隧道目录中
	[col46] = RTRIM(isnull(k63.HK6371,'否')),	--是否跨省隧道
	[col47] = k63.k0199	  	--备注
from k63
	left join a50 on k63.a0102 = a50.a0102 and k63.k0101 = a50.k0101
	left join da0102 on k63.a0102=da0102.objname
	left join 
		(select a.a0102,a.k0101,a.k6301,max(b.k0304) k0304
		from K63 a left join K01 b on a.a0102=b.a0102 and a.k0101=b.k0101 and a.k6324>=b.k0108 and a.k6324<=b.k0109
		where LEFT(A.K0101,1) IN ('G','S','H','T') AND a.A0102 like '34%' and a.a0101 <= '2024'
		group by a.a0102,a.k0101,a.k6301) c
	     on k63.a0102=c.a0102 and k63.k0101=c.k0101 and k63.k6301=c.k6301
	left join D002 d  on  d.objname=c.k0304
where	k63.a0102 like '34%' and k63.a0101 <= '2024' and
	LEFT(K63.K0101,1) IN ('G','S','X','Y','Z','C','h','t') AND  rtrim(K63.K0101) in (select rtrim(k0101) from #k01) --高速
	-- LEFT(K63.K0101,1) IN ('G','h') AND  rtrim(K63.K0101) not in (select rtrim(k0101) from #k01) --普通国道
	-- LEFT(K63.K0101,1) IN ('S','t') AND  rtrim(K63.K0101) not in (select rtrim(k0101) from #k01) --普通省道
order by  replace(replace(replace(replace(replace(k63.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''),k63.k6303
