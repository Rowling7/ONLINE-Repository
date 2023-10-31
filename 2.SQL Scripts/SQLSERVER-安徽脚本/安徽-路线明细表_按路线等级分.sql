/*不显示零*/
IF OBJECT_ID('TEMPDB..#K01') IS NOT NULL DROP TABLE #K01
SELECT
rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) k0101
INTO #K01
FROM K01
WHERE left(k01.K0101,1) in ('G','S','X','Y','Z','C','h','t') 
      and (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2'  and K0304='10'
GROUP BY rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))
ORDER BY rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))
--SELECT * from #K01



/*不显示零*/
SELECT 
	[COL01] = RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(k01.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')),	--路线代码
	[COL02] = LEFT(RTRIM(A0103),6), --行政区划代码
	[COL03] = RTRIM(K0112), 	--路线标准名称
	[COL04] = RTRIM(K0110),		--路段起点名称
	[COL05] = RTRIM(K0111),		--路段止点名称
	[COL06] = K0108,		--路段起点桩号
	[COL07] = K0109,		--路段止点桩号   
	[COL08] = K0114 ,		--里程
	[COL09] = CASE WHEN RTRIM(K0304)='22' THEN '12' WHEN RTRIM(K0304)='23' THEN '13' WHEN RTRIM(K0304)='24' THEN '14' ELSE RTRIM(K0304) END,		--技术等级代码
	[COL10] = RTRIM(HK0304),	--技术等级
	[COL11] = CASE WHEN RTRIM(HK0126)='是' THEN '是' ELSE '否' END,	--是否一幅高速
	[COL12] = REPLACE(REPLACE(REPLACE(REPLACE(RTRIM(K0404),'A','10'),'C','12'),'E','14'),'G','16'),		--车道分类代码
	[COL13] = RTRIM(K5104),		--面层类型代码
	[COL14] = RTRIM(HK5104),	--面层类型
	[COL15] = K4002,		--路基宽度
	[COL16] = K5404,		--路面宽度
	[COL17] = K5222,		--面层厚度(厘米)
	[COL18] = K0306,		--设计时速
	[COL19] = RTRIM(HK6023),	--抗震等级
	[COL20] = CASE WHEN ISNULL(K0304,'') IN ('24','30') AND ISNULL(K0149,'')<4 THEN '-' ELSE RTRIM(REPLACE(HK0149,'年','')) END,	--防洪标准
	[COL21] = RTRIM(K0180),		--修建年度
	[COL22] = RTRIM(K0181),		--改建年度
	[COL23] = RTRIM(K0155),	--最近一次修复养护年度
	[COL24] = CASE WHEN ISNULL(K0182,0)=0 THEN 0 ELSE K0182 END,		--断链类型
	[COL25] = CASE WHEN RTRIM(HK0121)='是' THEN '是' ELSE '否' END,		--是否城管路段
	[COL26] = CASE WHEN RTRIM(HK0123)='是' THEN '是' ELSE '否' END,		--是否断头路段
	[COL27] = CASE WHEN RTRIM(ISNULL(K0136,'01'))='01' THEN '非收费' 
			WHEN RTRIM(ISNULL(K0136,'01'))='02' THEN '还贷' 
			WHEN RTRIM(ISNULL(K0136,'01'))='03' THEN '经营' 
			ELSE '' 
		END,			--路段收费性质
	[COL28] = RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')),	--重复路线代码
	[COL29] = CASE WHEN ISNULL(K0176,'')='1' THEN K0163 ELSE K0162 END,		--重复路段起点桩号
	[COL30] = CASE WHEN ISNULL(K0176,'')='1' THEN K0162 ELSE K0163 END,		--重复路段终点桩号
	[COL31] = CASE WHEN CHARINDEX('D',ISNULL(K0124,''))<>0 THEN '是' ELSE NULL END,	--重复路段终点桩号
	[COL32] = A1001,		--养护
	[COL33] = A3101,		--可绿化
	[COL34] = A3102,		--已绿化
	[COL35] = RTRIM(HK9508),--地貌
	[COL36] = A0522,		--涵洞数量
	[COL37] = LTRIM(RTRIM(REPLACE(A0130,' ',''))),		--管养单位名称
	[COL38] = ISNULL(K0156,''),	--省际出入口标识
	[COL39] = CASE WHEN LEFT(k01.K0101,1) IN ('G','H') THEN LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K3990,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))) ELSE '' END,		--国道调整前路线编号
	[COL40] = HK0138,		--是否按干线公路管理接养
	[COL41] = CASE WHEN CHARINDEX('D',ISNULL(K0124,'')) <> 0 THEN '重复主线为长链' ELSE CASE WHEN LEFT(k01.K0101,1) IN ('G','S','H','T','X') THEN LTRIM(RTRIM(CAST(K0199 AS VARCHAR(1000)))) ELSE '' END END	--备注
from k01 
WHERE	A0102 LIKE '34%' AND
	left(k01.K0101,1) in ('G','S','X','Y','Z','C','h','t')  and K0304='10' and rtrim(K01.K0101)  in (select rtrim(k0101) from #k01) --高速
	-- left(k01.K0101,1) in ('G','h') and rtrim(K01.K0101) not in (select rtrim(k0101) from #k01) --普通国道
	-- left(k01.K0101,1) in ('S','t') and rtrim(K01.K0101) not in (select rtrim(k0101) from #k01) --普通省道
ORDER BY k01.K0101,K0108
