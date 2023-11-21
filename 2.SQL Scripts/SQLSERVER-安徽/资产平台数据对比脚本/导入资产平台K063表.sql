
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ZCPT_K063]') AND type IN ('U'))
	DROP TABLE [dbo].[ZCPT_K063]
GO

CREATE TABLE [dbo].[ZCPT_K063] (
	[A0102] char(9) COLLATE Chinese_PRC_CI_AS   NULL,
	[HA0102] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6302] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [SDDM] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6303] numeric(18,3)  NULL,
  [k0101] char(15) COLLATE Chinese_PRC_CI_AS  NULL,
  [K0112] char(60) COLLATE Chinese_PRC_CI_AS  NULL,
  [k0304] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6305] numeric(18,2)  NULL,
  [K6306] numeric(18,2)  NULL,
  [K6307] numeric(18,2)  NULL,
  [K6304] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [hK6304] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6335] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [K0180] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6079] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6030] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6031] char(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6032] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [K0116] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [A1313] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [A0130] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6111] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [hK6346] char(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6344] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6345] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [hK6336] char(30) COLLATE Chinese_PRC_CI_AS NULL,
  [K6347] char(8) COLLATE Chinese_PRC_CI_AS NULL,
  [K6348] char(50) COLLATE Chinese_PRC_CI_AS NULL,
  [HK6349] char(30) COLLATE Chinese_PRC_CI_AS NULL,
  [K6350] char(8) COLLATE Chinese_PRC_CI_AS NULL,
  [K6351] char(50) COLLATE Chinese_PRC_CI_AS NULL,
  [HK6352] char(30) COLLATE Chinese_PRC_CI_AS NULL,
  [K6353] char(8) COLLATE Chinese_PRC_CI_AS NULL,
	[K6354] char(50) COLLATE Chinese_PRC_CI_AS NULL,
  [K0181] char(50) COLLATE Chinese_PRC_CI_AS NULL,
  [A1316] char(8) COLLATE Chinese_PRC_CI_AS NULL,
	[K6337] char(40) COLLATE Chinese_PRC_CI_AS NULL,
  [A1318] char(5) COLLATE Chinese_PRC_CI_AS NULL,
	[K6338] char(40) COLLATE Chinese_PRC_CI_AS NULL,
  [K6339] char(200) COLLATE Chinese_PRC_CI_AS NULL,
	[A0103] char(12) COLLATE Chinese_PRC_CI_AS NULL,
  [K6370] char(50) COLLATE Chinese_PRC_CI_AS NULL,
  [K6355] char(2) COLLATE Chinese_PRC_CI_AS NULL,
  [K6371] char(2) COLLATE Chinese_PRC_CI_AS NULL,
  [K0199] text COLLATE Chinese_PRC_CI_AS NULL,
  [SDGCS] char(6) COLLATE Chinese_PRC_CI_AS NULL,
  [K0185] numeric(12,8) NULL,
  [K0186] numeric(12,8) NULL,
  [K6343] char(4) COLLATE Chinese_PRC_CI_AS NULL	
)
GO



TRUNCATE table zcpt_k063
INSERT INTO zcpt_k063(
K6302,-- 隧道名称
SDDM,-- 隧道代码
K6303,-- 隧道入口桩号
k0101,-- 路线编号
K0112,-- 路线名称
k0304,-- 技术等级
K6305,-- 隧道长度（米）
K6306,-- 隧道净宽（米）
K6307,-- 隧道净高（米）
K6304,-- 按隧道长度分类
hK6304,-- 按隧道长度分类
K6335,-- 是否水下隧道
K0180,-- 修建年度
K6079,-- 建设单位名称
K6030,-- 设计单位名称
K6031,-- 施工单位名称
K6032,-- 监理单位名称
K0116,-- 建成通车时间
A1313,-- 单位性质代码
A0130,-- 名称
K6111,-- 监管单位名称
hK6346,-- 评定等级
K6344,-- 评定日期
K6345,-- 评定单位
hK6336,-- 评定等级
K6347,-- 评定日期
K6348,-- 评定单位
hK6349,-- 评定等级
K6350,-- 评定日期
K6351,-- 评定单位
hK6352,-- 评定等级
K6353,-- 评定日期
K6354,-- 评定单位
K0181,-- 改造年度
A1316,-- 完工日期
K6337,-- 改造部位
A1318,-- 工程性质
K6338,-- 病害部位
K6339,-- 病害描述
A0103,-- 所在政区代码
K6370,-- 隧道所在位置
K6355,-- 是否在长大隧道目录中
K6371,-- 是否跨省隧道
K0199,-- 备注
SDGCS,-- 隧道工程师
K0185,-- 经度
K0186,-- 纬度
K6343-- 隧道养护等级
)
SELECT
case when len(K6302) >0 then K6302 when len(K6302) =0 or K6302 is null then null end K6302	,
case when len(SDDM) >0 then SDDM when len(SDDM) =0 or SDDM is null then null end SDDM	,
case when len(K6303) >0 then K6303 when len(K6303) =0 or K6303 is null then null end K6303	,
case when len(rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))) >0 then rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) when len(rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))) =0 or rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) is null then null end k0101	,
case when len(K0112) >0 then K0112 when len(K0112) =0 or K0112 is null then null end K0112	,
case when len(k0304) >0 then k0304 when len(k0304) =0 or k0304 is null then null end k0304	,
case when len(K6305) >0 then K6305 when len(K6305) =0 or K6305 is null then null end K6305	,
case when len(K6306) >0 then K6306 when len(K6306) =0 or K6306 is null then null end K6306	,
case when len(K6307) >0 then K6307 when len(K6307) =0 or K6307 is null then null end K6307	,
case when len(K6304) >0 then K6304 when len(K6304) =0 or K6304 is null then null end K6304	,
case when len(hK6304) >0 then hK6304 when len(hK6304) =0 or hK6304 is null then null end hK6304	,
case when len(K6335) >0 then K6335 when len(K6335) =0 or K6335 is null then null end K6335	,
case when len(REPLACE(K0180, '-' ,'')) >0 then REPLACE(K0180, '-' ,'') when len(REPLACE(K0180, '-' ,'')) =0 or REPLACE(K0180, '-' ,'') is null then null end K0180	,
case when len(K6079) >0 then K6079 when len(K6079) =0 or K6079 is null then null end K6079	,
case when len(K6030) >0 then K6030 when len(K6030) =0 or K6030 is null then null end K6030	,
case when len(K6031) >0 then K6031 when len(K6031) =0 or K6031 is null then null end K6031	,
case when len(K6032) >0 then K6032 when len(K6032) =0 or K6032 is null then null end K6032	,
case when len(REPLACE(K0116, '-' ,'')) >0 then REPLACE(K0116, '-' ,'') when len(REPLACE(K0116, '-' ,'')) =0 or REPLACE(K0116, '-' ,'') is null then null end K0116	,
case when len(hA1313) >0 then hA1313 when len(hA1313) =0 or hA1313 is null then null end hA1313	,
case when len(A0130) >0 then A0130 when len(A0130) =0 or A0130 is null then null end A0130	,
case when len(K6111) >0 then K6111 when len(K6111) =0 or K6111 is null then null end K6111	,
case when len(hK6346) >0 then hK6346 when len(hK6346) =0 or hK6346 is null then null end hK6346	,
case when len(REPLACE(K6344, '-', '')) >0 then REPLACE(K6344, '-', '') when len(REPLACE(K6344, '-', '')) =0 or REPLACE(K6344, '-', '') is null then null end K6344	,
case when len(K6345) >0 then K6345 when len(K6345) =0 or K6345 is null then null end K6345	,
case when len(hK6336) >0 then hK6336 when len(hK6336) =0 or hK6336 is null then null end hK6336	,
case when len(REPLACE(K6347, '-', '')) >0 then REPLACE(K6347, '-', '') when len(REPLACE(K6347, '-', '')) =0 or REPLACE(K6347, '-', '') is null then null end K6347	,
case when len(K6348) >0 then K6348 when len(K6348) =0 or K6348 is null then null end K6348	,
case when len(hK6349) >0 then hK6349 when len(hK6349) =0 or hK6349 is null then null end hK6349	,
case when len(REPLACE(K6350, '-', '')) >0 then REPLACE(K6350, '-', '') when len(REPLACE(K6350, '-', '')) =0 or REPLACE(K6350, '-', '') is null then null end K6350	,
case when len(K6351) >0 then K6351 when len(K6351) =0 or K6351 is null then null end K6351	,
case when len(hK6352) >0 then hK6352 when len(hK6352) =0 or hK6352 is null then null end hK6352	,
case when len(REPLACE(K6353, '-', '') ) >0 then REPLACE(K6353, '-', '')  when len(REPLACE(K6353, '-', '') ) =0 or REPLACE(K6353, '-', '')  is null then null end K6353	,
case when len(K6354) >0 then K6354 when len(K6354) =0 or K6354 is null then null end K6354	,
case when len(K0181) >0 then K0181 when len(K0181) =0 or K0181 is null then null end K0181	,
case when len(REPLACE(A1316 ,'-' ,'')) >0 then REPLACE(A1316 ,'-' ,'') when len(REPLACE(A1316 ,'-' ,'')) =0 or REPLACE(A1316 ,'-' ,'') is null then null end  A1316	,
case when len(K6337) >0 then K6337 when len(K6337) =0 or K6337 is null then null end K6337	,
case when len(A1318) >0 then A1318 when len(A1318) =0 or A1318 is null then null end A1318	,
case when len(K6338) >0 then K6338 when len(K6338) =0 or K6338 is null then null end K6338	,
case when len(K6339) >0 then K6339 when len(K6339) =0 or K6339 is null then null end K6339	,
case when len(A0103) >0 then A0103 when len(A0103) =0 or A0103 is null then null end A0103	,
case when len(K6370) >0 then K6370 when len(K6370) =0 or K6370 is null then null end K6370	,
case when len(K6355) >0 then K6355 when len(K6355) =0 or K6355 is null then null end K6355	,
case when len(K6371) >0 then K6371 when len(K6371) =0 or K6371 is null then null end K6371	,
case when len(K0199) >0 then K0199 when len(K0199) =0 or K0199 is null then null end K0199	,
case when len(SDGCS) >0 then SDGCS when len(SDGCS) =0 or SDGCS is null then null end SDGCS	,
case when len(K0185) >0 then K0185 when len(K0185) =0 or K0185 is null then null end K0185	,
case when len(K0186) >0 then K0186 when len(K0186) =0 or K0186 is null then null end K0186	,
case when len(K6343) >0 then K6343 when len(K6343) =0 or K6343 is null then null end K6343	
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\3.安徽工作文件\20231120 安徽资产平台数据\全省隧道明细表.xls',明细表$)



-- ----------------------------
-- Indexes structure for table K063_copy1
-- ----------------------------
CREATE NONCLUSTERED INDEX [_WA_Sys_A0102_42EBA8DC] ON [dbo].[ZCPT_K063] ([A0102] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_HA0102_42EBA8DC] ON [dbo].[ZCPT_K063] ([HA0102] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6302_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6302] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_SDDM_42EBA8DC] ON [dbo].[ZCPT_K063] ([SDDM] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6303_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6303] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_k0101_42EBA8DC] ON [dbo].[ZCPT_K063] ([k0101] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K0112_42EBA8DC] ON [dbo].[ZCPT_K063] ([K0112] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_k0304_42EBA8DC] ON [dbo].[ZCPT_K063] ([k0304] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6305_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6305] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6306_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6306] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6307_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6307] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6304_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6304] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_hK6304_42EBA8DC] ON [dbo].[ZCPT_K063] ([hK6304] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6335_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6335] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K0180_42EBA8DC] ON [dbo].[ZCPT_K063] ([K0180] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6079_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6079] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6030_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6030] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6031_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6031] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6032_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6032] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K0116_42EBA8DC] ON [dbo].[ZCPT_K063] ([K0116] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_A1313_42EBA8DC] ON [dbo].[ZCPT_K063] ([A1313] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_A0130_42EBA8DC] ON [dbo].[ZCPT_K063] ([A0130] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6111_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6111] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_hK6346_42EBA8DC] ON [dbo].[ZCPT_K063] ([hK6346] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6344_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6344] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6345_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6345] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_hK6336_42EBA8DC] ON [dbo].[ZCPT_K063] ([hK6336] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6347_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6347] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6348_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6348] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_hK6349_42EBA8DC] ON [dbo].[ZCPT_K063] ([hK6349] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6350_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6350] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6351_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6351] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_hK6352_42EBA8DC] ON [dbo].[ZCPT_K063] ([hK6352] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6353_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6353] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6354_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6354] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K0181_42EBA8DC] ON [dbo].[ZCPT_K063] ([K0181] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_A1316_42EBA8DC] ON [dbo].[ZCPT_K063] ([A1316] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6337_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6337] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_A1318_42EBA8DC] ON [dbo].[ZCPT_K063] ([A1318] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6338_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6338] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6339_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6339] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_A0103_42EBA8DC] ON [dbo].[ZCPT_K063] ([A0103] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6370_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6370] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6355_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6355] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6371_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6371] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_SDGCS_42EBA8DC] ON [dbo].[ZCPT_K063] ([SDGCS] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K0185_42EBA8DC] ON [dbo].[ZCPT_K063] ([K0185] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K0186_42EBA8DC] ON [dbo].[ZCPT_K063] ([K0186] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6343_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6343] ASC)
GO


--更新管理单位字段A0102,HA0102
UPDATE zcpt_k063
SET zcpt_k063.a0102=rtrim(k001.a0102),zcpt_k063.ha0102=rtrim(k001.ha0102)
--SELECT zcpt_k063.a0102,rtrim(k001.a0102),zcpt_k063.ha0102,rtrim(k001.ha0102)
FROM zcpt_k063
left JOIN k001
on rtrim(zcpt_k063.k0101)=rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) and ISNULL(zcpt_k063.k6303,0)>=ISNULL(k001.k0108,0) and ISNULL(zcpt_k063.k6303,0)<=ISNULL(k001.k0109,0)
