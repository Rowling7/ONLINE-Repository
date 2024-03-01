--1.创建管养单位表，供EXCEL导入
--2.导入管养单位表
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ZCPT_DA0102]') AND type IN ('U'))
	DROP TABLE [dbo].[ZCPT_DA0102]
create table ZCPT_DA0102(
	objid int identity(1,1),
	objname varchar(20),
	objjc varchar(100)
)
insert into ZCPT_DA0102(
	objname,
	objjc
)
select 
	ltrim(rtrim(管养单位代码)),
	case when ltrim(rtrim(管养单位名称))='安徽省路港工程有限责任公司'  then '安徽省路港工程有限责任公司、临泉安建' else ltrim(rtrim(管养单位名称)) end 
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\3.安徽工作文件\20231030 导入路段表\安徽管养单位明细表.xls',sheet1$)


