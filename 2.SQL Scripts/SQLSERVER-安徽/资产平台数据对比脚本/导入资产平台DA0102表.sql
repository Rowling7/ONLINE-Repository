--1.����������λ����EXCEL����
--2.���������λ��
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
	ltrim(rtrim(������λ����)),
	case when ltrim(rtrim(������λ����))='����ʡ·�۹����������ι�˾'  then '����ʡ·�۹����������ι�˾����Ȫ����' else ltrim(rtrim(������λ����)) end 
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078������\1.�����ļ�\3.���չ����ļ�\20231030 ����·�α�\���չ�����λ��ϸ��.xls',sheet1$)


