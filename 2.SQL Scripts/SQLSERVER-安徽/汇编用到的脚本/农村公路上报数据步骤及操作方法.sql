/*
农村公路上报数据步骤及操作方法：
1.2000库附加NCGL标准库
2.导入农村公路数据
3.2000分离NCGL数据库
4.2005附加第三步分离的数据库
5.2005分离数据库
6.按照上报要求修改名称 压缩 后上报
*/

-----2000开始
--在2000的数据库中进行
--1.2000库附加NCGL标准库
EXEC sp_attach_db @dbname = N'NCGL342023',
@filename1 = N'F:\6078曹勇嵩\1.工作文件\2.工作文件\1.湖北2022年农村公路标准库\20230315\NCGL422022-15\NCGL422022.MDF'

--2.导入农村公路数据
	--2.1清空NCGL
truncate table dbo.T_NCGLAFSS
truncate table dbo.T_NCGLJCSS
truncate table dbo.T_xz
truncate table dbo.T_jzc
truncate table dbo.T_ZRC
truncate table dbo.T_ZRCTYXTDLX
truncate table dbo.T_ld
truncate table dbo.T_ql
truncate table dbo.T_sd
truncate table dbo.T_dk
	--2.2导入农村公路数据

INSERT INTO [T_NCGLJCSS]
(	
	[GLXZDJ],		--公路行政等级
	[SSX],			--所属县（市、区、旗）
	[XJXZQHDM],		--县级行政区划代码
	[GLZLC],		--公路里程
	[DJGLLC],		--等级公路里程
	[GSGLLC],		--高速公路里程
	[GSGLSCD],		--高速公路四车道里程
	[GSGLLCD],		--高速公路六车道里程
	[GSGLBCD],		--高速公路八车道及以上里程
	[YJGLLC],		--一级公路里程
	[EJGLLC],		--二级公路里程
	[SJGLLC],		--三级公路里程
	[SIJGLLC],		--四级公路里程
	[DWGLLC],		--等外公路里程
	[YPZLMHJLC],		--有铺装路面里程
	[LQLMHZLC],		--沥青混凝土里程
	[SNLMHZLC],		--水泥混凝土里程
	[JYPZLMLC],		--简易铺装路面里程
	[WPZLMLC],		--未铺装路面里程
	[KLHLC],		--可绿化里程
	[YLHLC],		--已绿化里程
	[YHLC],			--养护里程
	[QLZSZ],		--桥梁座数
	[QLZSM],		--桥梁长度
	[SWLQLZ],		--四五类桥梁座数
	[SWLQLM],		--四五类桥梁长度
	[YJXQLZ],		--永久性桥梁座数
	[YJXQLM],		--永久性桥梁长度
	[BYJXQLZ],		--半永久性桥梁座数
	[BYJXQLM],		--半永久性桥梁长度
	[LSXQLZ],		--临时性桥梁座数
	[LSXQLM],		--临时性桥梁长度
	[HTSQLZ],		--互通式桥梁座数
	[HTSQLM],		--互通式桥梁长度
	[TDQLZ],		--特大桥桥梁座数
	[TDQLM],		--特大桥桥梁长度
	[DQLZ],			--大桥桥梁座数
	[DQLM],			--大桥桥梁长度
	[ZQLZ],			--中桥桥梁座数
	[ZQLM],			--中桥桥梁长度
	[XQLZ],			--小桥桥梁座数
	[XQLM],			--小桥桥梁长度
	[DKHJ],			--渡口数量
	[JDDK],			--机动渡口数量
	[SDSLD],		--隧道数量
	[SDSLY],		--隧道长度
	[TCSDD],		--特长隧道道数
	[TCSDY],		--特长隧道长度
	[CSDD],			--长隧道道数
	[CSDY],			--长隧道长度
	[ZSDD],			--中隧道道数
	[ZSDY],			--中隧道长度
	[DSDD],			--短隧道道数
	[DSDY],			--短隧道长度
	[BZ],			--备注
	[FMDM_TBFZR],		--单位负责人
	[FMDM_TJFZR],		--统计负责人
	[FMDM_TBR],		--填表人
	[FMDM_LXDH],		--联系电话
	[FMDM_TBDW]		--填报单位
)
SELECT
	A.[GLXZDJ],		--公路行政等级
	[SSX],			--所属县（市、区、旗）
	A.[XJXZQHDM],		--县级行政区划代码
	[GLZLC],		--公路里程
	[DJGLLC],		--等级公路里程
	[GSGLLC],		--高速公路里程
	[GSGLSCD],		--高速公路四车道里程
	[GSGLLCD],		--高速公路六车道里程
	[GSGLBCD],		--高速公路八车道及以上里程
	[YJGLLC],		--一级公路里程
	[EJGLLC],		--二级公路里程
	[SJGLLC],		--三级公路里程
	[SIJGLLC],		--四级公路里程
	[DWGLLC],		--等外公路里程
	[YPZLMHJLC],		--有铺装路面里程
	[LQLMHZLC],		--沥青混凝土里程
	[SNLMHZLC],		--水泥混凝土里程
	[JYPZLMLC],		--简易铺装路面里程
	[WPZLMLC],		--未铺装路面里程
	[KLHLC],		--可绿化里程
	[YLHLC],		--已绿化里程
	[YHLC],			--养护里程
	[QLZSZ],		--桥梁座数
	[QLZSM],		--桥梁长度
	[SWLQLZ],		--四五类桥梁座数
	[SWLQLM],		--四五类桥梁长度
	[YJXQLZ],		--永久性桥梁座数
	[YJXQLM],		--永久性桥梁长度
	[BYJXQLZ],		--半永久性桥梁座数
	[BYJXQLM],		--半永久性桥梁长度
	[LSXQLZ],		--临时性桥梁座数
	[LSXQLM],		--临时性桥梁长度
	[HTSQLZ],		--互通式桥梁座数
	[HTSQLM],		--互通式桥梁长度
	[TDQLZ],		--特大桥桥梁座数
	[TDQLM],		--特大桥桥梁长度
	[DQLZ],			--大桥桥梁座数
	[DQLM],			--大桥桥梁长度
	[ZQLZ],			--中桥桥梁座数
	[ZQLM],			--中桥桥梁长度
	[XQLZ],			--小桥桥梁座数
	[XQLM],			--小桥桥梁长度
	[DKHJ],			--渡口数量
	[JDDK],			--机动渡口数量
	[SDSLD],		--隧道数量
	[SDSLY],		--隧道长度
	[TCSDD],		--特长隧道道数
	[TCSDY],		--特长隧道长度
	[CSDD],			--长隧道道数
	[CSDY],			--长隧道长度
	[ZSDD],			--中隧道道数
	[ZSDY],			--中隧道长度
	[DSDD],			--短隧道道数
	[DSDY],			--短隧道长度
	[BZ],			--备注
	[FMDM_TBFZR],		--单位负责人
	[FMDM_TJFZR],		--统计负责人
	[FMDM_TBR],		--填表人
	[FMDM_LXDH],		--联系电话
	[FMDM_TBDW]		--填报单位
FROM
(
	SELECT
		CASE WHEN LEFT(A.K0101,1)='X' THEN '3' WHEN LEFT(A.K0101,1)='Y' THEN '4' WHEN LEFT(A.K0101,1)='C' THEN '5' WHEN LEFT(A.K0101,1)='Z' THEN '6' ELSE NULL END	[GLXZDJ],		--公路行政等级
		MAX(RTRIM(G.OBJJC))	[SSX],			--所属县（市、区、旗）
		LEFT(A.A0103,6)	[XJXZQHDM],			--县级行政区划代码
		SUM(K0114)	[GLZLC],			--公路里程
		sum(case when K0304 in ('10','11','22','23','24') then K0114 else 0 end)	[DJGLLC],	--等级公路里程
		sum(case when K0304 in ('10') then K0114 else 0 end)	[GSGLLC],				--高速公路里程
		sum(case when K0304 in ('10') and K0404='4' then K0114 else 0 end)	[GSGLSCD],		--高速公路四车道里程
		sum(case when K0304 in ('10') and K0404='6' then K0114 else 0 end)	[GSGLLCD],		--高速公路六车道里程
		sum(case when K0304 in ('10') and K0404>='8' then K0114 else 0 end)	[GSGLBCD],		--高速公路八车道及以上里程
		sum(case when K0304 in ('11') then K0114 else 0 end)	[YJGLLC],			--一级公路里程
		sum(case when K0304 in ('22') then K0114 else 0 end)	[EJGLLC],			--二级公路里程
		sum(case when K0304 in ('23') then K0114 else 0 end)	[SJGLLC],			--三级公路里程
		sum(case when K0304 in ('24') then K0114 else 0 end)	[SIJGLLC],			--四级公路里程
		sum(case when K0304 in ('30') then K0114 else 0 end)	[DWGLLC],			--等外公路里程
		sum(case when K5104 in ('11','12') then K0114 else 0 end)	[YPZLMHJLC],		--有铺装路面里程
		sum(case when K5104 in ('11') then K0114 else 0 end)	[LQLMHZLC],			--沥青混凝土里程
		sum(case when K5104 in ('12') then K0114 else 0 end)	[SNLMHZLC],			--水泥混凝土里程
		sum(case when K5104  like '2%' then K0114 else 0 end)	[JYPZLMLC],			--简易铺装路面里程
		sum(case when left(K5104,1) not in ('1','2') then K0114 else 0 end)	[WPZLMLC],	--未铺装路面里程
		sum(isnull(A3101,0))	[KLHLC],		--可绿化里程
		sum(isnull(A3102,0))	[YLHLC],		--已绿化里程
		sum(isnull(A1001,0))	[YHLC],		--养护里程
		NULL	[BZ], 				--备注M
		CASE WHEN MAX(RTRIM(E.A0121)) IS NOT NULL THEN MAX(RTRIM(E.A0121)) ELSE MAX(RTRIM(F.A0121)) END		[FMDM_TBFZR],			--单位负责人
		CASE WHEN MAX(RTRIM(E.A0122)) IS NOT NULL THEN MAX(RTRIM(E.A0122)) ELSE MAX(RTRIM(F.A0122)) END		[FMDM_TJFZR],			--统计负责人
		CASE WHEN MAX(RTRIM(E.A0133)) IS NOT NULL THEN MAX(RTRIM(E.A0133)) ELSE MAX(RTRIM(F.A0133)) END		[FMDM_TBR],			--填表人
		CASE WHEN MAX(RTRIM(E.A0123)) IS NOT NULL THEN MAX(RTRIM(E.A0123)) ELSE MAX(RTRIM(F.A0123)) END		[FMDM_LXDH],			--联系电话
		CASE WHEN MAX(RTRIM(REPLACE(E.HA0102,' ',''))) IS NOT NULL THEN MAX(RTRIM(REPLACE(E.HA0102,' ',''))) ELSE MAX(RTRIM(REPLACE(F.HA0102,' ',''))) END	[FMDM_TBDW]	--填报单位
	FROM [HRP-DBMS2014]..K001 A 	LEFT JOIN [HRP-DBMS2014]..A01 E ON CASE WHEN LEFT(A.A0102,3)='342' THEN A.A0102 ELSE NULL END=E.A0102
					LEFT JOIN [HRP-DBMS2014]..A01 F ON CASE WHEN LEFT(A.A0102,3)='341' THEN A.A0102 ELSE NULL END=F.A0102
					INNER JOIN [HRP-DBMS2014]..DZ0101 G ON LEFT(A.A0103,6)=G.OBJNAME
	WHERE LEFT(A.K0101,1) IN ('X','Y','Z','C') AND (A.K0124 is null or A.K0124 = '') and isnull(A.K0123,'2') = '2'
	GROUP BY LEFT(A.A0103,6),LEFT(A.K0101,1)
) A 
LEFT JOIN
(
	SELECT
		CASE WHEN LEFT(K0101,1)='X' THEN '3' WHEN LEFT(K0101,1)='Y' THEN '4' WHEN LEFT(K0101,1)='C' THEN '5' WHEN LEFT(K0101,1)='Z' THEN '6' ELSE NULL END	[GLXZDJ],		--公路行政等级
		LEFT(A0103,6)	[XJXZQHDM],		--县级行政区划代码
		COUNT(*)	[QLZSZ],		--桥梁座数
		SUM(K6008)	[QLZSM],		--桥梁长度
		SUM(CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN 1 ELSE 0 END)	[SWLQLZ],			--四五类桥梁座数
		SUM(CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN K6008 ELSE 0.00 END)	[SWLQLM],		--四五类桥梁长度
		SUM(CASE WHEN ISNULL(K6004,'') IN ('1') THEN 1 ELSE 0 END)	[YJXQLZ],			--永久性桥梁座数
		SUM(CASE WHEN ISNULL(K6004,'') IN ('1') THEN K6008 ELSE 0.00 END)	[YJXQLM],		--永久性桥梁长度
		SUM(CASE WHEN ISNULL(K6004,'') IN ('2') THEN 1 ELSE 0 END)	[BYJXQLZ],			--半永久性桥梁座数
		SUM(CASE WHEN ISNULL(K6004,'') IN ('2') THEN K6008 ELSE 0.00 END)	[BYJXQLM],		--半永久性桥梁长度
		SUM(CASE WHEN ISNULL(K6004,'') IN ('3') THEN 1 ELSE 0 END)	[LSXQLZ],			--临时性桥梁座数
		SUM(CASE WHEN ISNULL(K6004,'') IN ('3') THEN K6008 ELSE 0.00 END)	[LSXQLM],		--临时性桥梁长度
		SUM(CASE WHEN ISNULL(K6062,'') IN ('1') THEN 1 ELSE 0 END)	[HTSQLZ],			--互通式桥梁座数
		SUM(CASE WHEN ISNULL(K6062,'') IN ('1') THEN K6008 ELSE 0.00 END)	[HTSQLM],		--互通式桥梁长度
		SUM(CASE WHEN ISNULL(K6007,'') IN ('1') THEN 1 ELSE 0 END)	[TDQLZ],			--特大桥桥梁座数
		SUM(CASE WHEN ISNULL(K6007,'') IN ('1') THEN K6008 ELSE 0.00 END)	[TDQLM],		--特大桥桥梁长度
		SUM(CASE WHEN ISNULL(K6007,'') IN ('2') THEN 1 ELSE 0 END)	[DQLZ],				--大桥桥梁座数
		SUM(CASE WHEN ISNULL(K6007,'') IN ('2') THEN K6008 ELSE 0.00 END)	[DQLM],			--大桥桥梁长度
		SUM(CASE WHEN ISNULL(K6007,'') IN ('3') THEN 1 ELSE 0 END)	[ZQLZ],				--中桥桥梁座数
		SUM(CASE WHEN ISNULL(K6007,'') IN ('3') THEN K6008 ELSE 0.00 END)	[ZQLM],			--中桥桥梁长度
		SUM(CASE WHEN ISNULL(K6007,'') IN ('4') THEN 1 ELSE 0 END)	[XQLZ],				--小桥桥梁座数
		SUM(CASE WHEN ISNULL(K6007,'') IN ('4') THEN K6008 ELSE 0.00 END)	[XQLM]			--小桥桥梁长度
	FROM [HRP-DBMS2014]..K060
	WHERE LEFT(K0101,1) IN ('X','Y','Z','C')
	GROUP BY LEFT(A0103,6),LEFT(K0101,1)
) B ON A.[GLXZDJ]=B.[GLXZDJ] AND A.[XJXZQHDM]=B.[XJXZQHDM]
LEFT JOIN 
(
	SELECT
		CASE WHEN LEFT(K0101,1)='X' THEN '3' WHEN LEFT(K0101,1)='Y' THEN '4' WHEN LEFT(K0101,1)='C' THEN '5' WHEN LEFT(K0101,1)='Z' THEN '6' ELSE NULL END	[GLXZDJ],		--公路行政等级
		LEFT(A0103,6)	[XJXZQHDM],		--县级行政区划代码
		COUNT(*)	[DKHJ],			--渡口数量
		SUM(CASE WHEN ISNULL(K6504,'') IN ('1') THEN 1 ELSE 0 END)	[JDDK]			--机动渡口数量
	FROM [HRP-DBMS2014]..K065
	WHERE LEFT(K0101,1) IN ('X','Y','Z','C')
		AND K0101 IN
			(
				 SELECT DISTINCT K0101
				 FROM [HRP-DBMS2014]..K001
				 WHERE K0101 IN (SELECT DISTINCT K0101 FROM [HRP-DBMS2014]..K065)
				 	AND ISNULL(K0123,'2')='2' AND RTRIM(ISNULL(K0124,''))=''
			)
	GROUP BY LEFT(A0103,6),LEFT(K0101,1)
) C ON A.[GLXZDJ]=C.[GLXZDJ] AND A.[XJXZQHDM]=C.[XJXZQHDM]
LEFT JOIN
(
	SELECT
		CASE WHEN LEFT(K0101,1)='X' THEN '3' WHEN LEFT(K0101,1)='Y' THEN '4' WHEN LEFT(K0101,1)='C' THEN '5' WHEN LEFT(K0101,1)='Z' THEN '6' ELSE NULL END	[GLXZDJ],		--公路行政等级
		LEFT(A0103,6)	[XJXZQHDM],		--县级行政区划代码
		COUNT(*)	[SDSLD],		--隧道数量
		SUM(K6305)	[SDSLY],		--隧道长度
		SUM(CASE WHEN ISNULL(K6304,'') IN ('1') THEN 1 ELSE 0 END)	[TCSDD],		--特长隧道道数
		SUM(CASE WHEN ISNULL(K6304,'') IN ('1') THEN K6305 ELSE 0.00 END)	[TCSDY],	--特长隧道长度
		SUM(CASE WHEN ISNULL(K6304,'') IN ('2') THEN 1 ELSE 0 END)	[CSDD],			--长隧道道数
		SUM(CASE WHEN ISNULL(K6304,'') IN ('2') THEN K6305 ELSE 0.00 END)	[CSDY],		--长隧道长度
		SUM(CASE WHEN ISNULL(K6304,'') IN ('3') THEN 1 ELSE 0 END)	[ZSDD],			--中隧道道数
		SUM(CASE WHEN ISNULL(K6304,'') IN ('3') THEN K6305 ELSE 0.00 END)	[ZSDY],		--中隧道长度
		SUM(CASE WHEN ISNULL(K6304,'') IN ('4') THEN 1 ELSE 0 END)	[DSDD],			--短隧道道数
		SUM(CASE WHEN ISNULL(K6304,'') IN ('4') THEN K6305 ELSE 0.00 END)	[DSDY]		--短隧道长度
	FROM [HRP-DBMS2014]..K063
	WHERE LEFT(K0101,1) IN ('X','Y','Z','C')
	GROUP BY LEFT(A0103,6),LEFT(K0101,1)
) D ON A.[GLXZDJ]=D.[GLXZDJ] AND A.[XJXZQHDM]=D.[XJXZQHDM]

--2-----------------------------------------------------------------------------------------------------------------
--3---------------------------------------------------------------------------------------------------------------

-- TRUNCATE TABLE T_LD

-- SELECT * FROM T_LD

INSERT INTO [T_LD]
(
	[LDBM],		--路段代码
	[LXMC],		--路线名称
	[SZXZQHDM],	--所在行政区划代码
	[QDMC],		--起点名称
	[QDZH],		--起点桩号
	[QDSFWFJD],	--起点是否为分界点
	[QDFJDLB],	--起点分界点类别
	[ZDMC],		--讫点名称
	[ZDZH],		--讫点桩号
	[ZDSFWFJD],	--讫点是否为分界点
	[ZDFJDLB],	--讫点分界点类别
	[LDJSDJ],	--路段技术等级
	[LDLMLX],	--路段路面类型
	[LJKD],		--路基宽度
	[LMKD],		--路面宽度
	[LDLC],		--路段里程
	[SFWGYLD],	--是否为共用路段
	[SGYLDBM],	--所共用路段代码
	[SGYLDQDZH],	--所共用路段起点桩号
	[SGYLDZDZH],	--所共用路段讫点桩号
	[SFWCSDLLD],	--是否为城市道路路段
	[SFWDGTLD],	--是否为待贯通路段
	[JCSJ],		--建成时间
	[ZXGJSJ],	--最新改建时间
	[HDSL],		--涵洞数量
	[BGYY],		--变更原因
	[CDSL],		--车道数量 
	[YHLC],		--养护里程
	[KLHLC],	--可绿化里程
	[YLHLC],	--已绿化里程
	[SJSS],		--设计时速
	[GYDWMC],	--管养单位名称
	[LDSFXZ],	--路段收费性质
	[ZJYCXFYHSJ],	--最近一次修复养护年度
	[YLXBM],	--原路线编码
	[YQDZH],	--原起点桩号
	[YZDZH],	--原迄点桩号
	[BZ],		--备注
	[FMDM_TBFZR],	--单位负责人
	[FMDM_TJFZR],	--统计负责人
	[FMDM_TBR],	--填表人
	[FMDM_LXDH],	--联系电话
	[FMDM_TBDW]	--填报单位
)
SELECT 
	UPPER(RTRIM(K0101))+RTRIM(K0115), 	--路段编号C
	RTRIM(K0112), 				--路线简称C
	RTRIM(A.A0103)+'000', 			--行政区划DY
	LEFT(RTRIM(K0110),25), 			--路段起点名称CY
	K0108, 					--路段起点桩号NP
	ISNULL(NULLIF(K0153,''),'2'), 		--起点是否为分界点D
	NULLIF(K0154,''), 			--起点分界点类别D
	LEFT(RTRIM(K0111),25), 			--路段止点名称CY
	K0109, 					--路段止点桩号NY
	ISNULL(NULLIF(K0157,''),'2'), 		--止点是否为分界点D
	NULLIF(K0158,''), 			--止点分界点类别D
	CASE WHEN K0304='10' THEN '1' WHEN K0304='11' THEN '2' 
		WHEN K0304='22' THEN '3' WHEN K0304='23' THEN '4' WHEN K0304='24' THEN '5' WHEN K0304='30' THEN '6' ELSE NULL END, 	--技术等级D
	CASE WHEN K5104='11' THEN '1' WHEN K5104='12' THEN '2' 
		WHEN LEFT(K5104,1)='2' THEN '3' WHEN K5104='31' THEN '4' WHEN K5104='32' THEN '5' WHEN K5104='33' THEN '6'
			WHEN K5104='34' THEN '7' WHEN K5104='35' THEN '9' WHEN K5104='36' THEN '8' ELSE NULL END, 			--面层类型D
	K4002, 		--路基宽度(米)N
	K5404, 		--路面宽度(米)N
	K0114, 		--里程(公里)NY
	CASE WHEN K0124 IS NULL OR ISNULL(K0124,'')='' THEN '2' ELSE '1' END,	--是否重复路段
	UPPER(RTRIM(LEFT(K0124,10))), 						--重复路段编号C
	CASE WHEN LEFT(K0124,1) IN ('X','Y','Z','C') THEN NULL ELSE K0162 END,	--重复路段起点桩号
	CASE WHEN LEFT(K0124,1) IN ('X','Y','Z','C') THEN NULL ELSE K0163 END,	--重复路段止点桩号
	ISNULL(K0121,'2'), 							--是否城管路段D
	CASE WHEN K0123='1' THEN '1' ELSE '2' END, 				--是否断头路路段D
	LEFT(K0180,4), 			--修建年度C
	NULLIF(LEFT(K0181,4),''), 	--改建年度C
	ISNULL(A0522,0), 		--涵洞个数N
	CASE WHEN LEFT(ISNULL(K0180,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN '11'
		WHEN LEFT(ISNULL(K0181,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END AND ISNULL(K3912,'')='' THEN '21'
	ELSE 
		CASE WHEN ISNULL(K3912,'')<>'' THEN K3912 ELSE '10' END 
	END,  			--变更原因D
	replace(replace(replace(replace(rtrim(ISNULL(k0404,'0')),'A','10'),'C','12'),'E','14'),'G','16'),	--车道数量
	ISNULL(A1001,0.000),		--养护里程
	ISNULL(a3101,0.000),		--可绿化里程
	ISNULL(a3102,0.000),		--已绿化里程
	k0306,		--设计时速
	ltrim(rtrim(replace(a0130,' ',''))),	--管养单位名称
	case when rtrim(ISNULL(k0136,'01'))='01' then '1' 
		when rtrim(ISNULL(k0136,'01'))='02' then '2' 
		when rtrim(ISNULL(k0136,'01'))='03' then '3' 
	else '' 
	end,		--路段收费性质
	rtrim(K0155),	--最近一次修复养护年度
	CASE WHEN LEFT(ISNULL(K1302,''),1) IN ('G','S') THEN RTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K1302,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')))
	ELSE K1302
	END,		--上年路线编码
	K1303,		--上年起点桩号
	K1304,		--上年止点桩号
	K0199, 		--备注M
	RTRIM(A0121),		--单位负责人
	RTRIM(A0122),		--统计负责人
	RTRIM(A0133),		--填表人
	RTRIM(A0123),		--联系电话
	RTRIM(REPLACE(A.HA0102,' ',''))		--填报单位
FROM [HRP-DBMS2014]..K001 A LEFT JOIN [HRP-DBMS2014]..A01 B ON A.A0102=B.A0102
WHERE LEFT(K0101,1) NOT IN ('G','S','H','T','W')



--断头路
UPDATE T_LD
SET LMKD=NULL,LDJSDJ=NULL,LDLMLX=NULL,LJKD=NULL,JCSJ=NULL,ZXGJSJ=NULL,HDSL=NULL,CDSL=0,YHLC=0,KLHLC=0,YLHLC=0,SJSS=NULL,GYDWMC=NULL,LDSFXZ=NULL,ZJYCXFYHSJ=NULL
WHERE SFWDGTLD ='1'



SELECT A0102,K0101,RTRIM(K0115) K0115,K0108,K0109,K0161,K0124,K0162,K0163 
INTO #CFLD 
FROM [HRP-DBMS2014]..K001
WHERE K0124 IS NOT NULL 
ORDER BY K0101

UPDATE B 
SET B.K0115=A.K0115 
FROM #CFLD B,[HRP-DBMS2014]..K001 A 
WHERE RTRIM(A.K0101)=RTRIM(B.K0124) AND A.K0108<=B.K0162 AND A.K0109>B.K0162


UPDATE A 
SET SGYLDBM=RTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')))+RTRIM(K0115) 
FROM T_LD A JOIN #CFLD B ON LEFT(RTRIM(LDBM),10)=RTRIM(K0101) AND QDZH=K0108 AND ZDZH=K0109
-----------------------------------------------------

UPDATE A
SET 
	A.SZXZQHDM	=B.SZXZQHDM, 
	A.LDJSDJ	=B.LDJSDJ, 
	A.LDLMLX	=B.LDLMLX,
	A.LMKD		=B.LMKD, 
	A.LJKD		=B.LJKD, 
	A.SFWDGTLD	=B.SFWDGTLD, 
	A.JCSJ		=B.JCSJ, 
	A.ZXGJSJ	=B.ZXGJSJ, 
	A.HDSL		=B.HDSL, 
	A.SFWCSDLLD	=B.SFWCSDLLD, 
	A.BZ		=B.BZ, 
	A.CDSL		=B.CDSL, 
	A.SJSS		=B.SJSS, 
	A.LDSFXZ	=B.LDSFXZ, 
	A.ZJYCXFYHSJ	=B.ZJYCXFYHSJ
--SELECT *
FROM T_LD A INNER JOIN T_LD B ON RTRIM(A.SGYLDBM)=B.LDBM
WHERE LEFT(A.SGYLDBM,1) IN ('X','Y','Z','C')


-------------------------------------------------
UPDATE T_LD
SET BZ='未修建'
WHERE SFWDGTLD ='1'
DELETE T_LD
FROM T_LD
WHERE LEFT(LDBM,10) NOT IN (SELECT LEFT(LDBM,10) FROM T_LD WHERE SFWDGTLD='2' GROUP BY LEFT(LDBM,10))


--4---------------------------------------------------------------------------------------------------------------

INSERT INTO [T_QL]
(
	[QLBM],		--桥梁代码
	[LXMC],		--路线名称
	[QLMC],		--桥梁名称
	[JCSJ],		--建成时间
	[ZXGJSJ],	--最新改建时间
	[QLZXZH],	--桥梁中点桩号
	[QLQC],		--桥梁全长
	[SJHZDJ],	--设计荷载等级
	[AKJFL],	--按跨径分类
	[ASYNXFL],	--按使用年限分类
	[QLSBJGLX],	--桥梁上部结构类型
	[SFHTLJ],	--是否互通立交
	[JSZKPDDJ],	--技术状况评定等级
	[KJZC],		--跨径总长
	[DKZDKJ],	--单孔最大跨径
	[QLQK],		--桥梁全宽
	[QMJK],		--桥面净宽
	[GYDWMC],	--管养单位名称
	[BGYY],		--变更原因
	[YQLBM],	--原桥梁代码
	[KJZH],		--跨径组合
	[QDLX],		--桥墩类型
	[KZDJ],		--抗震等级
	[KYDWLX],	--跨越地物类型
	[KYDWMC],	--跨越地物名称
	[THDJ],		--通航等级
	[DTFZSSLX],	--墩台防撞设施类型
	[JSDW],		--建设单位
	[SJDW],		--设计单位
	[SGDW],		--施工单位
	[JLDW],		--监理单位
	[JCTCRQ],	--建成通车日期
	[GYDWXZ],	--管养单位性质
	[JGDWMC],	--监管单位名称
	[SFXZ],		--收费性质
	[PDRQ],		--评定日期
	[PDDW],		--评定单位
	[PDWSWLQLYY],	--评定为四五类桥梁原因
	[ZXGZWGRQ],	--最新改造完工日期
	[ZXGZSFSYWQGZXM],	--最新改造是否属于危桥改造项目
	[ZXGZBW],	--最新改造部位
	[ZXGZGCXZ],	--最新改造工程性质
	[ZXGZSGDW],	--最新改造施工单位
	[ZXGZSFBBZXM],	--最新改造是否部补助项目
	[QLDQZYBHBW],	--当前主要病害部位
	[QLDQZYBHMS],	--当前主要病害描述
	[JTGZCS],	--交通管制措施
	[QLSBGZJGCL],	--桥梁上部构造结构材料
	[QLSZWZ],	--桥梁所在位置
	[SFKLZQ],	--是否宽路窄桥
	[SFKSQL],	--是否跨省桥梁
	[BZ],		--备注
	[FMDM_TBFZR],	--单位负责人
	[FMDM_TJFZR],	--统计负责人
	[FMDM_TBR],	--填表人
	[FMDM_LXDH],	--联系电话
	[FMDM_TBDW]	--填报单位
)
SELECT 
	UPPER(RTRIM(A.K0101))+'L'+LTRIM(RTRIM(A.K6001)), 	--桥梁编码NP
	RTRIM(A.K0112), 					--路线简称C
	RTRIM(A.K6002), 					--桥梁名称CY
	LEFT(A.K0180,4), 					--修建年度C
	CASE WHEN ISNULL(A.K0181,'')='' OR ISNULL(A.A1317,'')='' OR ISNULL(A.K6051,'')='' OR ISNULL(A.A1318,'')=''
		THEN NULL
	ELSE LEFT(A.K0181,4)
	END,		 					--改建年度C
	A.K6003, 						--桥梁中心桩号NY
	A.K6008, 						--桥梁全长(米)NY
	A.K6022, 						--设计荷载等级DY
	A.K6007,						--按跨径分类
	A.K6004, 						--按使用年限分DY
	A.K6016,						--桥梁上部结构类型
	CASE WHEN A.K6062='1' THEN '1' ELSE '2' END,		--是否互通立交
	A.K6028,						--技术状况评定等级
	RTRIM(A.K6065), 					--跨径总长(米)NY
	A.K6063, 						--单孔最大跨径(米)NY
	A.K6066, 						--桥梁全宽(米)NY
	A.K6009, 						--桥面净宽(米)NY
	LTRIM(RTRIM(REPLACE(A.A1314,' ',''))),			--管养单位名称
	CASE WHEN LEFT(ISNULL(A.K0180,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN '11'
		WHEN LEFT(ISNULL(A.K0181,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END AND C.KWYID IS NOT NULL  THEN '21'
		WHEN C.KWYID IS NULL THEN '14'
	ELSE 
		CASE WHEN ISNULL(A.K3912,'')<>'' THEN A.K3912 ELSE '10' END 
	END,  							--变更原因D
	CASE WHEN LEFT(ISNULL(A.K0180,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN NULL ELSE
	CASE WHEN LEFT(C.K0101,1) IN ('G','S','H','T') THEN RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(C.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+LEFT(RTRIM(C.A0103),6) 
	ELSE RTRIM(C.K0101) END+'L'+RTRIM(C.K6001)
	END,							--原桥梁代码
	rtrim(replace(A.k6064,' ','')),				--跨径组合
	A.k6017,    						--桥墩类型
	A.k6023,						--抗震等级
	A.k6005,						--跨越类型
	rtrim(ltrim(replace(replace(replace(replace(A.k6006,char(13),''),char(10),''),char(9),''),char(32),''))),	--跨越地物名称
	A.k6024,						--通航等级
	A.a1328,						--墩台防撞类型
	A.k6079,						--建设单位
	replace(A.k6030,' ',''),				--设计单位
	A.k6031,						--施工单位
	replace(A.k6032,' ',''),				--监理单位
	A.K0116,			--通车日期
	A.a1313,						--管养单位性质代码
	rtrim(replace(replace(A.k6111,' ',''),char(127),'')),	--监管单位名称
	A.a1302,						--收费性质
	A.a1305,						--评定日期
	rtrim(replace(A.K6050,' ','')),				--技术状况评定单位
	A.K6122,						--评定为四五类桥梁原因
	CASE WHEN ISNULL(A.K0181,'')=''
		THEN NULL
	ELSE A.a1316
	END,							--改造完工日期
	CASE WHEN ISNULL(A.K0181,'')=''
		THEN NULL
	ELSE ISNULL(A.a1331,'2')
	END,							--最新改造是否属于危桥改造项目
	CASE WHEN ISNULL(A.K0181,'')=''
		THEN NULL
	ELSE LEFT(A.a1317,1)+'0'
	END,							--改造部位
	CASE WHEN ISNULL(A.K0181,'')=''
		THEN NULL
	ELSE REPLACE(REPLACE(REPLACE(A.a1318,'A','6'),'B','7'),'C','8')
	END,							--工程性质代码
	CASE WHEN ISNULL(A.K0181,'')=''
		THEN NULL
	ELSE rtrim(replace(A.K6051,' ',''))
	END,							--改造施工单位
	CASE WHEN ISNULL(A.K0181,'')=''
		THEN NULL
	ELSE ISNULL(A.a1319,'2')
	END,							--是否部补助项目
	CASE WHEN ISNULL(A.K6028,'') IN ('4','5') THEN 
		CASE WHEN ISNULL(A.A1306,'')<>'' THEN LEFT(A.A1306,1)+'0' ELSE NULL END
	ELSE NULL
	END,							--主要病害位置
	CASE WHEN ISNULL(A.K6028,'') IN ('4','5') THEN rtrim(A.K6102)
	ELSE NULL
	END,							--主要病害描述
	ISNULL(REPLACE(A.a1307,'',NULL),'1'),			--采取交通管制措施
	A.K6110,						--主桥上部结构材料
	RTRIM(isnull(A.K6117,'3')),				--桥梁所在位置
	RTRIM(isnull(A.K6118,'2')),				--是否宽路窄桥
	RTRIM(isnull(A.K6120,'2')),				--是否跨省桥梁
	A.K0199, 						--备注M
	RTRIM(B.A0121),						--单位负责人
	RTRIM(B.A0122),						--统计负责人
	RTRIM(B.A0133),						--填表人
	RTRIM(B.A0123),						--联系电话
	RTRIM(REPLACE(A.HA0102,' ',''))				--填报单位
FROM [HRP-DBMS2014]..K060 A LEFT JOIN [HRP-DBMS2014]..A01 B ON A.A0102=B.A0102
	LEFT JOIN [HRP-DBMS2014]..QIAOLIANG C ON A.KWYID=C.KWYID
WHERE LEN(A.K0101)=10 AND LEFT(A.K0101,1) NOT IN ('G','S','H','T','W') 

--5---------------------------------------------------------------------------------------------------------------

INSERT INTO [T_SD]
(
	[SDBM],		--隧道代码
	[LXMC],		--路线名称
	[SDMC],		--隧道名称
	[JCSJ],		--建成时间
	[ZXGJSJ],	--最新改建时间
	[SDRKZH],	--隧道入口桩号
	[ZTJSZKPD],	--总体技术状况评定
	[ZTPDRQ],	--总体评定日期
	[ZTPDDW],	--总体评定单位
	[TJJSZKPD],	--土建结构技术状况评定
	[TJJGPDRQ],	--土建结构评定日期
	[TJJGPDDW],	--土建结构评定单位
	[JDJSZKPD],	--机电设施技术状况评定
	[JDSSPDRQ],	--机电设施评定日期
	[JDSSPDDW],	--机电设施评定单位
	[QTJSZKPD],	--其他工程设施技术状况评定
	[QTGCSSPDRQ],	--其他工程设施评定日期
	[QTGCSSPDDW],	--其他工程设施评定单位
	[SDCD],		--隧道长度
	[SDJG],		--隧道净高
	[SDJK],		--隧道净宽
	[GYDWMC],	--管养单位名称
	[BGYY],		--变更原因
	[YSDBM],	--原隧道代码
	[ASDCDFL],	--按隧道长度分类
	[SFSXSD],	--是否水下隧道
	[JSDWMC],	--建设单位名称
	[SJDWMC],	--设计单位名称
	[SGDWMC],	--施工单位名称
	[JLDWMC],	--监理单位名称
	[JCTCSJ],	--建成通车时间
	[SDYHDJ],	--隧道养护等级
	[GYDWXZ],	--管养单位性质
	[JGDWMC],	--监管单位名称
	[ZXGZWGRQ],	--最新改造完工日期
	[SDZXGZBW],	--最新改造部位
	[ZXGZGCXZ],	--最新改造工程性质
	[SDDQZYBHBW],	--当前主要病害部位
	[SDDQZYBHMS],	--当前主要病害描述
	[SDSZWZ],	--隧道所在位置
	[SFKSSD],	--是否跨省隧道
	[BZ],		--备注
	[FMDM_TBFZR],	--单位负责人
	[FMDM_TJFZR],	--统计负责人
	[FMDM_TBR],	--填表人
	[FMDM_LXDH],	--联系电话
	[FMDM_TBDW]	--填报单位
)
SELECT 
	UPPER(RTRIM(A.K0101))+'U'+RTRIM(A.K6301),	--隧道编码CY
	A.K0112, 					--路线简称C
	A.K6302, 					--隧道名称CY
	LEFT(A.K0180,4), 				--修建年度
	LEFT(A.K0181,4), 				--改建年度
	A.K6303, 					--隧道入口桩号NY
	RTRIM(A.K6336), 				--评定等级(总体)	
	RTRIM(A.K6344),  				--评定日期(总体)
	RTRIM(A.K6345),  				--评定单位(总体)
	RTRIM(A.K6346), 				--评定等级(土建)
	RTRIM(A.K6347),  				--评定日期(土建结构)
	RTRIM(A.K6348),  				--评定单位(土建结构)
	RTRIM(A.K6349), 				--评定等级(机电)
	RTRIM(A.K6350),  				--评定日期(机电设施)
	RTRIM(A.K6351),  				--评定单位(机电设施)
	RTRIM(A.K6352), 				--评定等级(其他)
	RTRIM(A.K6353),  				--评定日期(其他工程设施)
	RTRIM(A.K6354),  				--评定单位(其他工程设施)
	A.K6305, 					--隧道长度(米)NY
	A.K6307, 					--隧道净高(米)NY
	A.K6306, 					--隧道净宽(米)N
	RTRIM(REPLACE(A.A0130,' ','')),  		--管养单位名称DP
	CASE WHEN LEFT(ISNULL(A.K0180,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN '11'
		WHEN LEFT(ISNULL(A.K0181,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN '21'
		WHEN C.KWYID IS NULL THEN '14'
	ELSE 
		CASE WHEN ISNULL(A.K3912,'')<>'' THEN A.K3912 ELSE '10' END 
	END,  						--变更原因D
	CASE WHEN LEFT(ISNULL(A.K0180,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN NULL ELSE
	CASE WHEN LEFT(C.K0101,1) IN ('G','S','H','T') THEN RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(C.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+LEFT(RTRIM(C.A0103),6) 
	ELSE RTRIM(C.K0101) END+'U'+RTRIM(C.K6301)
	END,						--原隧道代码
	RTRIM(A.K6304),  				--隧道按长度分类
	ISNULL(A.K6335,'2'),				--是否水下隧道
	RTRIM(A.K6079),  				--建设单位名称
	RTRIM(REPLACE(A.K6030,CHAR(127),'')),  		--设计单位名称
	RTRIM(REPLACE(A.K6031,CHAR(127),'')),  		--施工单位名称
	RTRIM(A.K6032),  				--监理单位名称
	RTRIM(A.K0116),    				--通车时间
	RTRIM(ISNULL(A.K6343,'')),			--隧道养护等级
	RTRIM(A.A1313),    				--管养单位性质代码
	RTRIM(A.K6111),  				--监管单位名称
	RTRIM(A.A1316),  				--改造完工日期
	CASE WHEN ISNULL(A.K6337,'')<>'' THEN REPLACE(LEFT(A.K6337,1),'3','9')+'0' ELSE NULL END,			--改造部位
	REPLACE(REPLACE(REPLACE(A.a1318,'A','6'),'B','7'),'C','8'),							--工程性质代码
	CASE WHEN ISNULL(A.K6338,'')<>'' THEN REPLACE(LEFT(A.K6338,1),'3','9')+'0' ELSE NULL END,  			--病害部位
	REPLACE(RTRIM(A.K6339),' ',''),  		--病害描述
	RTRIM(ISNULL(A.K6370,'')),			--隧道所在位置
	RTRIM(ISNULL(A.K6371,'2')),			--是否跨省隧道
	A.K0199, 					--备注M
	RTRIM(B.A0121),					--单位负责人
	RTRIM(B.A0122),					--统计负责人
	RTRIM(B.A0133),					--填表人
	RTRIM(B.A0123),					--联系电话
	RTRIM(REPLACE(A.HA0102,' ',''))			--填报单位
FROM [HRP-DBMS2014]..K063 A LEFT JOIN [HRP-DBMS2014]..A01 B ON A.A0102=B.A0102
	LEFT JOIN [HRP-DBMS2014]..SUIDAO C ON A.KWYID=C.KWYID
WHERE LEFT(A.K0101,1) NOT IN ('G','S','H','T','W')


--6---------------------------------------------------------------------------------------------------------------

INSERT INTO [T_DK]
(
	[DKBM],			--渡口代码
	[LXMC],			--路线名称
	[DKMC],			--渡口名称
	[JCSJ],			--建成时间
	[ZXGJSJ],		--最新改建时间
	[QDZH],			--起点桩号
	[DKKD],			--渡口宽度
	[SFJD],			--是否机动渡口
	[DKLX],			--渡口类型
	[BGYY],			--变更原因
	[YDKBM],		--原渡口代码
	[BZ],			--备注
	[FMDM_TBFZR],		--单位负责人
	[FMDM_TJFZR],		--统计负责人
	[FMDM_TBR],		--填表人
	[FMDM_LXDH],		--联系电话
	[FMDM_TBDW]		--填报单位
)
SELECT 
	UPPER(RTRIM(A.K0101))+'D'+RTRIM(A.K6501), 	--渡口编码CY
	RTRIM(A.K0112), 				--路线简称C
	RTRIM(A.K6502), 				--渡口名称CY
	LEFT(A.K6328,4), 				--修建日期CY
	NULL, 						--改建年度CY
	A.K6503, 					--渡口桩号NY
	A.K6523*1000, 					--渡口宽度(米)N
	CASE WHEN A.K6504='1' THEN '1' 
	ELSE '2' 
	END, 						--是否机动渡口DY
	CASE WHEN A.K6504='1' THEN '1' 
	ELSE '2' 
	END, 						--渡口分类DY
	CASE WHEN LEFT(ISNULL(A.K6328,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN '11'
		WHEN C.KWYID IS NULL THEN '14'
	ELSE '10' 
	END,  						--变更原因D
	CASE WHEN LEFT(ISNULL(A.K6328,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN NULL ELSE 
	CASE WHEN LEFT(C.K0101,1) IN ('G','S','H','T') THEN RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(C.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+LEFT(RTRIM(C.A0103),6) 
	ELSE RTRIM(C.K0101) END+'D'+RTRIM(C.K6501)
	END,						--原渡口代码
	A.K0199, 					--备注M
	RTRIM(B.A0121),					--单位负责人
	RTRIM(B.A0122),					--统计负责人
	RTRIM(B.A0133),					--填表人
	RTRIM(B.A0123),					--联系电话
	RTRIM(REPLACE(A.HA0102,' ',''))			--填报单位
FROM [HRP-DBMS2014]..K065 A LEFT JOIN [HRP-DBMS2014]..A01 B ON A.A0102=B.A0102
	LEFT JOIN [HRP-DBMS2014]..DUKOU C ON A.KWYID=C.KWYID
WHERE LEFT(A.K0101,1) NOT IN ('G','S','H','T','W')
	AND A.K0101 IN
		(
		 SELECT DISTINCT K0101
		 FROM [HRP-DBMS2014]..K001
		 WHERE K0101 IN (SELECT DISTINCT K0101 FROM [HRP-DBMS2014]..K065)
		 	AND ISNULL(K0123,'2')='2' AND RTRIM(ISNULL(K0124,''))=''
		)

--7---------------------------------------------------------------------------------------------------------------

INSERT INTO [T_NCGLAFSS]
(
	[AFSSID],		--记录唯一标识
	[LXBM],			--路线代码
	[LXMC],			--路线名称
	[XJXZQHDM],		--县级行政区划代码
	[QDZH],			--起点桩号
	[ZDZH],			--讫点桩号
	[LDLX],			--路段类型
	[SFXYSSAFSS],		--是否需要实施安防工程
	[SFYSSAFSS],		--是否已实施安防工程
	[SSAFGCSJ],		--实施时间
	[BZAFSSSFQQ],		--标志安全设施是否齐全
	[BXAFSSSFQQ],		--标线安全设施是否齐全
	[HLAFSSSFQQ],		--护栏安全设施是否齐全
	[JSDAFSSSFQQ],		--减速带安全设施是否齐全
	[SJDAFSSSFQQ],		--示警墩/桩安全设施是否齐全
	[XGSSAFSSSFQQ],		--限高安全设施是否齐全
	[XKSSAFSSSFQQ],		--限宽安全设施是否齐全
	[SJSSSFQQ],		--视距设施是否齐全
	[CCDSFQQ],		--错车道是否齐全
	[QTAFSSSFQQ],		--其他安全设施是否齐全
	[LDPJLKSL],		--路段平交路口数(个)
	[LDPJLKJSDSL],		--平交路口共有减速带数量(个)
	[BZ],			--备注
	[FMDM_TBFZR],		--单位负责人
	[FMDM_TJFZR],		--统计负责人
	[FMDM_TBR],		--填表人
	[FMDM_LXDH],		--联系电话
	[FMDM_TBDW]		--填报单位
)
SELECT 
	NEWID(),				--记录唯一标识
	RTRIM(K0101),				--路线代码
	RTRIM(K0112),				--路线名称
	LEFT(A.A0103,6),			--县级行政区划代码
	K0108,					--起点桩号
	K0109,					--讫点桩号
	K0816,					--路段类型
	ISNULL(K0801,'2'),			--是否需要实施安防工程
	ISNULL(K0802,'2'),			--是否已实施安防工程
	K0803,					--实施时间
	ISNULL(K0804,'1'),			--标志安全设施是否齐全
	ISNULL(K0805,'1'),			--标线安全设施是否齐全
	ISNULL(K0806,'1'),			--护栏安全设施是否齐全
	ISNULL(K0807,'1'),			--减速带安全设施是否齐全
	ISNULL(K0808,'1'),			--示警墩/桩安全设施是否齐全
	ISNULL(K0809,'1'),			--限高安全设施是否齐全
	ISNULL(K0810,'1'),			--限宽安全设施是否齐全
	ISNULL(K0814,'1'),			--视距设施是否齐全
	ISNULL(K0815,'1'),			--错车道是否齐全
	ISNULL(K0811,'1'),			--其他安全设施是否齐全
	K0812,					--路段平交路口数(个)
	K0813,					--平交路口共有减速带数量(个)
	A.A0129, 				--备注M
	RTRIM(B.A0121),				--单位负责人
	RTRIM(B.A0122),				--统计负责人
	RTRIM(B.A0133),				--填表人
	RTRIM(B.A0123),				--联系电话
	RTRIM(REPLACE(A.HA0102,' ',''))		--填报单位
FROM [HRP-GHSS2014]..K08 A LEFT JOIN [HRP-DBMS2014]..A01 B ON A.A0102=B.A0102
WHERE LEFT(A.K0101,1) NOT IN ('G','S','H','T','W')

--8-----------------------------------------------------------------------------------------------------------------

INSERT INTO [T_XZ]
(
	[XZBM],		--乡（镇）代码
	[XZMC],		--乡（镇）名称
	[XJXZQHDM],	--县级行政区划代码
	[SSSF],		--所属省份
	[SSS],		--所属市（地、州、盟）
	[SSX],		--所属县（市、区、旗）
	[CXFL],		--城乡类别
	[SSDX],		--所属地形
	[DYSFJYMT],	--岛屿是否建有陆岛交通码头
	[MTYLDJL],	--码头与陆地距离
	[DNSFJYGL],	--岛内是否建有公路
	[TDXZ],		--通达现状
	[YXTDLXDJ],	--优选通达路线行政等级
	[YXTDLXBM],	--优选通达路线代码
	[YXTDLXMC],	--优选通达路线名称
	[SFTSJJYSGL],	--是否已通三级及以上公路
	[BGYY_XC],	--变更原因
	[YXZBM],	--原乡（镇）代码
	[BZ],		--备注
	[FMDM_TBFZR],	--单位负责人
	[FMDM_TJFZR],	--统计负责人
	[FMDM_TBR],	--填表人
	[FMDM_LXDH],	--联系电话
	[FMDM_TBDW]	--填报单位
)
SELECT
	RTRIM(A.V0501)+'000',
	RTRIM(A.HV0501), 		--乡镇DP
	LEFT(A.V0501,6),		--县级政区代码
	RTRIM(B.OBJJC),			--省级
	RTRIM(C.OBJJC),			--市级
	RTRIM(D.OBJJC),			--县级
	RTRIM(A.V0504),			--城乡类别
	A.V0506, 			--所属地形DY
	A.V0507, 			--岛屿是否建有陆岛交通码头D
	A.V0508, 			--码头与陆地距离(公里)N
	A.V0509, 			--岛内是否建有公路D
	A.V8101, 			--通达现状DY
	A.V8103, 			--优选通达路线行政等级D
	UPPER(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(A.V8104,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))), 	--路线代码CP
	A.V8105,  			--路线全称C
	CASE WHEN ISNULL(A.V0504,'') IN ('12','13') THEN RTRIM(ISNULL(A.V0502,'2')) ELSE NULL END,					--是否通三级及以上公路
	CASE WHEN RTRIM(A.V0501)=RTRIM(F.V0501) AND RTRIM(A.HV0501)=RTRIM(F.HV0501) THEN '10'
		WHEN F.V0501 IS NULL THEN '11'
	ELSE '21'
	END,				--变更原因
	RTRIM(F.V0501)+'000',		--原乡（镇）代码
	A.K0199, 			--备注M
	RTRIM(E.A0121),			--单位负责人
	RTRIM(E.A0122),			--统计负责人
	RTRIM(E.A0133),			--填表人
	RTRIM(E.A0123),			--联系电话
	RTRIM(REPLACE(E.HA0102,' ',''))	--填报单位
FROM [HRP-DBMS2014]..V51  A LEFT JOIN [HRP-DBMS2014]..DZ0101 B ON LEFT(A.V0501,2)=B.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..DZ0101 C ON LEFT(A.V0501,4)=C.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..DZ0101 D ON LEFT(A.V0501,6)=D.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..A01 E ON A.A0102=E.A0102
			LEFT JOIN [HRP-DBMS2014-2022年报]..V51 F ON A.KWYID=F.KWYID

UPDATE T_XZ SET YXTDLXBM=NULL,
			YXTDLXMC=NULL WHERE YXTDLXDJ='7'

UPDATE T_XZ SET YXTDLXDJ='G' WHERE YXTDLXDJ='1'
UPDATE T_XZ SET YXTDLXDJ='S' WHERE YXTDLXDJ='2'
UPDATE T_XZ SET YXTDLXDJ='X' WHERE YXTDLXDJ='3'
UPDATE T_XZ SET YXTDLXDJ='Y' WHERE YXTDLXDJ='4'
UPDATE T_XZ SET YXTDLXDJ='Z' WHERE YXTDLXDJ='5'
UPDATE T_XZ SET YXTDLXDJ='C' WHERE YXTDLXDJ='6'
UPDATE T_XZ SET YXTDLXDJ='D' WHERE YXTDLXDJ='7'


UPDATE T_XZ
SET 
	
	[SSDX]			=NULL,	--所属地形
	[DYSFJYMT]		=NULL,	--岛屿是否建有陆岛交通码头
	[MTYLDJL]		=NULL,	--码头与陆地距离
	[DNSFJYGL]		=NULL,	--岛内是否建有公路
	[TDXZ]			=NULL,	--通达现状
	[YXTDLXDJ]		=NULL,	--优选通达路线行政等级
	[YXTDLXBM]		=NULL,	--优选通达路线代码
	[YXTDLXMC]		=NULL,	--优选通达路线名称
	[SFTSJJYSGL]		=NULL,	--是否已通三级及以上公路
	[BGYY_XC]		='10'	--变更原因
--SELECT *
FROM T_XZ
WHERE [CXFL]='11'


--9-----------------------------------------------------------------------------------------------------------------

INSERT INTO [T_JZC]
(
	[JZCBM],		--建制村代码
	[JZCMC],		--建制村名称
	[XJXZQHDM],		--县级行政区划代码
	[SSSF],			--所属省份
	[SSS],			--所属市（地、州、盟）
	[SSX],			--所属县（市、区、旗）
	[CXFL],			--城乡类别
	[SSDX],			--所属地形
	[DYSFJYMT],		--岛屿是否建有陆岛交通码头
	[MTYLDJL],		--码头与陆地距离
	[DNSFJYGL],		--岛内是否建有公路
	[TDXZ],			--通达现状
	[YXTDLXDJ],		--优选通达路线行政等级
	[YXTDLXBM],		--优选通达路线代码
	[YXTDLXMC],		--优选通达路线名称
	[SFYTSCDJYSGL],		--是否已通双车道及以上公路
	[BGYY_XC],		--变更原因
	[YJZCBM],		--原建制村代码
	[BZ],			--备注
	[FMDM_TBFZR],		--单位负责人
	[FMDM_TJFZR],		--统计负责人
	[FMDM_TBR],		--填表人
	[FMDM_LXDH],		--联系电话
	[FMDM_TBDW]		--填报单位
)
SELECT
	RTRIM(A.V0514),
	RTRIM(A.HV0514), 		--建制村DP
	LEFT(A.V0514,6),		--县级政区代码
	RTRIM(B.OBJJC),			--省级
	RTRIM(C.OBJJC),			--市级
	RTRIM(D.OBJJC),			--县级
	RTRIM(A.V0505),			--城乡类别
	A.V0506, 			--所属地形DY
	A.V0507, 			--岛屿是否建有陆岛交通码头D
	A.V0508, 			--码头与陆地距离(公里)N
	A.V0509, 			--岛内是否建有公路D
	A.V8101, 			--通达现状DY
	A.V8103, 			--优选通达路线行政等级D
	UPPER(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(A.V8104,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))), 	--路线代码CP
	A.V8105,  			--路线全称C
	A.V0513,
	CASE WHEN RTRIM(A.V0514)=RTRIM(F.V0514) AND RTRIM(A.HV0514)=RTRIM(F.HV0514) THEN '10'
		WHEN F.V0514 IS NULL THEN '11'
	ELSE '21'
	END,				--变更原因
	RTRIM(F.V0514)	,		--原建制村代码
	A.K0199, 			--备注M
	RTRIM(E.A0121),			--单位负责人
	RTRIM(E.A0122),			--统计负责人
	RTRIM(E.A0133),			--填表人
	RTRIM(E.A0123),			--联系电话
	RTRIM(REPLACE(E.HA0102,' ',''))	--填报单位
FROM [HRP-DBMS2014]..V52  A LEFT JOIN [HRP-DBMS2014]..DZ0101 B ON LEFT(A.V0514,2)=B.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..DZ0101 C ON LEFT(A.V0514,4)=C.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..DZ0101 D ON LEFT(A.V0514,6)=D.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..A01 E ON A.A0102=E.A0102
			LEFT JOIN [HRP-DBMS2014-2022年报]..V52 F ON A.KWYID=F.KWYID


UPDATE T_JZC SET YXTDLXBM=NULL,
			YXTDLXMC=NULL WHERE YXTDLXDJ='7'


UPDATE T_JZC SET YXTDLXDJ='G' WHERE YXTDLXDJ='1'
UPDATE T_JZC SET YXTDLXDJ='S' WHERE YXTDLXDJ='2'
UPDATE T_JZC SET YXTDLXDJ='X' WHERE YXTDLXDJ='3'
UPDATE T_JZC SET YXTDLXDJ='Y' WHERE YXTDLXDJ='4'
UPDATE T_JZC SET YXTDLXDJ='Z' WHERE YXTDLXDJ='5'
UPDATE T_JZC SET YXTDLXDJ='C' WHERE YXTDLXDJ='6'
UPDATE T_JZC SET YXTDLXDJ='D' WHERE YXTDLXDJ='7'


UPDATE T_JZC
SET 
	
	[SSDX]			=NULL,	--所属地形
	[DYSFJYMT]		=NULL,	--岛屿是否建有陆岛交通码头
	[MTYLDJL]		=NULL,	--码头与陆地距离
	[DNSFJYGL]		=NULL,	--岛内是否建有公路
	[TDXZ]			=NULL,	--通达现状
	[YXTDLXDJ]		=NULL,	--优选通达路线行政等级
	[YXTDLXBM]		=NULL,	--优选通达路线代码
	[YXTDLXMC]		=NULL,	--优选通达路线名称
	[SFYTSCDJYSGL]		=NULL,	--是否已通双车道及以上公路
	[BGYY_XC]		='10'	--变更原因
--SELECT *
FROM T_JZC
WHERE [CXFL]='21'


--10-----------------------------------------------------------------------------------------------------------------

INSERT INTO [T_ZRC]
(
	[ZRCZDM],		--自然村（组）代码
	[ZRCZMC],		--自然村（组）名称
	[SSSF],			--所属省份
	[SSS],			--所属市（地、州、盟）
	[SSX],			--所属县（市、区、旗）
	[XJXZQHDM],		--县级行政区划代码
	[CZHS],			--自然村（组）户数
	[TDXZ_ZRC],		--通达现状
	[YXTDLXDJ_ZRC],		--优选通达路线行政等级
	[YXTDLXBM],		--优选通达路线代码
	[YXTDLXMC],		--优选通达路线名称
	[BGYY_XC],		--变更原因
	[YZRCZDM],		--原自然村（组）代码
	[BZ],			--备注
	[FMDM_TBFZR],		--单位负责人
	[FMDM_TJFZR],		--统计负责人
	[FMDM_TBR],		--填表人
	[FMDM_LXDH],		--联系电话
	[FMDM_TBDW]		--填报单位
)
SELECT
	RTRIM(A.V5701),
	RTRIM(A.HV5701), 			--自然村（组）DP
	RTRIM(B.OBJJC),				--省级
	RTRIM(C.OBJJC),				--市级
	RTRIM(D.OBJJC),				--县级
	LEFT(A.V5701,6),			--县级政区代码
	A.V5703, 				--自然村（组）户数NY
	REPLACE(ISNULL(A.V5708,'4'),'2','4'), 	--通达现状DY
	CASE WHEN ISNULL(A.V5708,'')='1' THEN UPPER(LEFT(REPLACE(A.V8104,'城市道路','D'),1))
	ELSE NULL
	END, 					--优选通达路线行政等级D
	CASE WHEN ISNULL(A.V5708,'')='1' THEN UPPER(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(A.V8104,'城市道路','D'),'340000',''),'000000',''),'D001',''),'D002',''),'D003','')))
	ELSE NULL
	END, 					--路线代码CP
	CASE WHEN ISNULL(A.V5708,'')='1' THEN 	CASE WHEN G.K0101 IS NULL THEN RTRIM(A.V8105) ELSE G.K0112 END
	ELSE NULL
	END,					--路线全称C
	CASE WHEN RTRIM(A.V5701)=RTRIM(F.V5701) AND RTRIM(A.HV5701)=RTRIM(F.HV5701) THEN '10'
		WHEN F.V5701 IS NULL THEN '11'
	ELSE '21'
	END,					--变更原因
	RTRIM(F.V5701),				--原自然村（组）代码
	A.A0129, 				--备注M
	RTRIM(E.A0121),				--单位负责人
	RTRIM(E.A0122),				--统计负责人
	RTRIM(E.A0133),				--填表人
	RTRIM(E.A0123),				--联系电话
	RTRIM(REPLACE(E.HA0102,' ',''))		--填报单位
FROM [HRP-DBMS2014]..V53  A LEFT JOIN [HRP-DBMS2014]..DZ0101 B ON LEFT(A.V5701,2)=B.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..DZ0101 C ON LEFT(A.V5701,4)=C.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..DZ0101 D ON LEFT(A.V5701,6)=D.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..A01 E ON A.A0102=E.A0102
			LEFT JOIN [HRP-DBMS2014-2022年报]..V53 F ON A.KWYID=F.KWYID
			LEFT JOIN 
				(
					SELECT RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101,MAX(RTRIM(K0112))K0112 
					FROM [HRP-DBMS2014]..A50 
					GROUP BY RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))
				) G ON RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(A.V8104,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=G.K0101




--11-----------------------------------------------------------------------------------------------------------------

INSERT INTO [T_ZRCTYXTDLX]
(
	[LDBM],			--路段代码
	[LXMC],			--路线名称
	[SZXZQHDM],		--所在行政区划代码
	[QDMC],			--起点名称
	[QDZH],			--起点桩号
	[ZDMC],			--讫点名称
	[ZDZH],			--讫点桩号
	[LDJSDJ],		--路段技术等级
	[LDLMLX],		--路段路面类型
	[LJKD],			--路基宽度
	[LMKD],			--路面宽度
	[LDLC],			--路段里程
	[SFWGYLD],		--是否为共用路段
	[SGYLDBM],		--所共用路段代码
	[BZ],			--备注
	[FMDM_TBFZR],		--单位负责人
	[FMDM_TJFZR],		--统计负责人
	[FMDM_TBR],		--填表人
	[FMDM_LXDH],		--联系电话
	[FMDM_TBDW]		--填报单位
)
SELECT
	UPPER(RTRIM(K0101))+RTRIM(K0115), 	--路段编号C
	RTRIM(K0112), 				--路线简称C
	RTRIM(A.A0103)+'000', 			--行政区划DY
	LEFT(RTRIM(K0110),25), 			--路段起点名称CY
	K0108, 					--路段起点桩号NP
	LEFT(RTRIM(K0111),25), 			--路段止点名称CY
	K0109, 					--路段止点桩号NY
	CASE WHEN K0304='10' THEN '1' WHEN K0304='11' THEN '2' 
		WHEN K0304='22' THEN '3' WHEN K0304='23' THEN '4' WHEN K0304='24' THEN '5' WHEN K0304='30' THEN '6' ELSE NULL END, 			--技术等级D
	CASE WHEN K5104='11' THEN '1' WHEN K5104='12' THEN '2' 
		WHEN LEFT(K5104,1)='2' THEN '3' WHEN K5104='31' THEN '4' WHEN K5104='32' THEN '5' WHEN K5104='33' THEN '6'
			WHEN K5104='34' THEN '7' WHEN K5104='35' THEN '9' WHEN K5104='36' THEN '8' ELSE NULL END, 					--面层类型D
	K4002, 			--路基宽度(米)N
	K5404, 			--路面宽度(米)N
	K0114, 			--里程(公里)NY
	CASE WHEN K0124 IS NULL OR ISNULL(K0124,'')='' THEN '2' ELSE '1' END,	--是否重复路段
	UPPER(RTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')))+RTRIM(K0115)),	--重复路段编号C
	K0199, 			--备注M
	RTRIM(A0121),		--单位负责人
	RTRIM(A0122),		--统计负责人
	RTRIM(A0133),		--填表人
	RTRIM(A0123),		--联系电话
	RTRIM(REPLACE(A.HA0102,' ',''))		--填报单位
FROM [HRP-DBMS2014]..K001 A LEFT JOIN [HRP-DBMS2014]..A01 B ON A.A0102=B.A0102
WHERE K0101 IN (SELECT V8104 FROM [HRP-DBMS2014]..V53 WHERE ISNULL(V5708,'')='1' AND LEFT(V8104,1)='W') AND ISNULL(K5104,'') IN ('11','12','21','22','23','32','34','35')


--3.2000分离NCGL数据库
EXEC sp_detach_db 'NCGL342023', 'true'
-----2000结束




-----2005开始
--在2005的数据库中进行
--4.2005附加第三步分离的数据库
CREATE DATABASE NCGL422022
    ON (FILENAME = 'F:\6078曹勇嵩\1.工作文件\2.工作文件\1.湖北2022年农村公路标准库\20230315\NCGL422022-15\NCGL422022.MDF')
    FOR ATTACH;
		
--5.2005分离数据库
EXEC sp_detach_db 'NCGL342023', 'true'
-----2005结束

--6.按照上报要求修改名称 压缩 后上报