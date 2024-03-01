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
-- SELECT * from #K01
--select rtrim(k0101) from #k01

SELECT
RTRIM(REPLACE(K6002,' ','')),		--桥梁名称
RTRIM(K60.K6001),			--桥梁代码
K6003,					--桥梁中心桩号
RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K60.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')),			--路线编号
RTRIM(A50.K0112),			--路线名称
RTRIM(D.OBJJC) HK0304,			--技术等级
-- CASE WHEN ISNULL(K6117,'') IN ('4','5') AND ISNULL(K6121,'')<>'' THEN RTRIM(HK6121)
-- 	ELSE
-- 		CASE WHEN RTRIM(D.OBJJC) IS NULL THEN '等外' ELSE RTRIM(D.OBJJC) END 
-- END	HK0304,				--技术等级
K6008,					--桥梁全长
K6065,					--跨径总长
K6063,					--单孔最大跨径
RTRIM(REPLACE(K6064,' ','')),		--跨径组合
A6066,					--桥梁全宽
K6009,					--桥面净宽
K6007,HK6007,				--跨径分
K6004,HK6004,				--使用年限分
K6016,HK6016,				--主桥上部结构
K6110,RTRIM(HK6110),			--主桥上部结构材料
K6017,    				--桥墩类型
CASE WHEN RTRIM(HK6017)='X形墩' THEN 'X 形墩' WHEN RTRIM(HK6017)='Y形墩' THEN 'Y 形墩' WHEN RTRIM(HK6017)='V形墩' THEN 'V 形墩' WHEN RTRIM(HK6017)='H形墩' THEN 'H 形墩' ELSE RTRIM(HK6017) END,	--桥墩类型
K6022,HK6022,				--设计荷载等级
K6023,HK6023,				--抗震等级
K6005,
CASE WHEN HK6005='其它地物' THEN '其它' ELSE HK6005 END HK6005,				--跨越类型
RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(K6006,CHAR(13),''),CHAR(10),''),CHAR(9),''),CHAR(32),''))),					--跨越地物名称
RTRIM(REPLACE(HK0149,'年','')),		--防洪标准
HK6024,					--通航等级
HA1328,					--墩台防撞类型
(CASE WHEN K6062='1' THEN '是' ELSE '否' END),						--是否互通立交
K6079,					--建设单位
REPLACE(K6030,' ',''),			--设计单位
K6031,					--施工单位
REPLACE(K6032,' ',''),			--监理单位
K0180,					--修建年度
K60.K0116,				--通车日期
A1313,					--管养单位性质代码
LTRIM(RTRIM(REPLACE(A1314,' ',''))),	--管养单位名称
RTRIM(REPLACE(REPLACE(K6111,' ',''),CHAR(127),'')),					--监管单位名称
A1302,
CASE WHEN ISNULL(A1302,'1')='1' THEN '非收费' WHEN ISNULL(A1302,'1')='2' THEN '还贷' WHEN ISNULL(A1302,'1')='3' THEN '经营' END,	--收费性质
K6028,HK6028,				--评定等级
A1305,					--评定日期
RTRIM(REPLACE(K6050,' ','')),		--技术状况评定单位
K0181,					--改造年度
A1316,					--改造完工日期
HA1317,					--改造部位
HA1318,					--工程性质代码
RTRIM(REPLACE(K6051,' ','')),		--改造施工单位
NULLIF(HA1319,''),		--是否部补助项目
CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN RTRIM(HA1306) ELSE NULL END,		--主要病害位置
CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN RTRIM(K6102) ELSE NULL END,		--主要病害描述
CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN A1307 ELSE '' END,
CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN HA1307 ELSE '' END,			--采取交通管制措施
LEFT(A0103,6),				--所在政区代码
RTRIM(ISNULL(HK6117,'双向')),		--桥梁所在位置
RTRIM(ISNULL(HK6118,'否')),		--是否宽路窄桥
RTRIM(ISNULL(HK6119,'否')),		--是否在长大桥梁目录中
RTRIM(ISNULL(HK6120,'否')),		--是否跨省桥梁
RTRIM(ISNULL(HK6041,'否')),		--是否公铁两用桥梁
K60.K0199, 				--备注
CASE WHEN LEFT(K60.K0101,1) IN ('G','H') THEN RTRIM(ISNULL(K6040,'')) ELSE '' END		--国道桥梁身份码
FROM K60 
	LEFT JOIN 
		(SELECT A.A0102,A.K0101,A.K6001,MAX(B.K0304) K0304
		FROM K60 A LEFT JOIN K01 B ON A.A0102=B.A0102 AND A.K0101=B.K0101 AND A.K6003>=B.K0108 AND A.K6003<=B.K0109
		WHERE LEFT(A.K0101,1) IN ('G','H','S','T') AND A.A0102 LIKE '34%' AND A.A0101 <= '2024'
		GROUP BY A.A0102,A.K0101,A.K6001) C
	     ON K60.A0102=C.A0102 AND K60.K0101=C.K0101 AND K60.K6001=C.K6001
	LEFT JOIN D002 D  ON  D.OBJNAME=C.K0304
	LEFT JOIN A50  ON K60.A0102=A50.A0102 AND K60.K0101=A50.K0101
      LEFT JOIN DA0102 ON K60.A0102=DA0102.OBJNAME
WHERE K60.A0102 LIKE '34%' AND A0101 <= '2024'and
	LEFT(K60.K0101,1) IN ('G','S','X','Y','Z','C','h','t') and K0304='10' AND rtrim(K60.K0101) in (select rtrim(k0101) from #k01) --高速
	-- LEFT(K60.K0101,1) IN ('G','H') AND rtrim(K60.K0101) not  in (select rtrim(k0101) from #k01) --普通国道
	-- LEFT(K60.K0101,1) IN ('s','t') AND rtrim(K60.K0101) not  in (select rtrim(k0101) from #k01) --普通省道

ORDER BY REPLACE(REPLACE(REPLACE(K60.K0101,'340000',''),'000000',''),'C','ZZ'),K60.K6003












