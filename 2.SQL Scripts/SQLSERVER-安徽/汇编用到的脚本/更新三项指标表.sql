--�����Ŀ
/*
SELECT  'V52'+'&A0102 ='''+RTRIM(CAST(v52.A0102 AS VARCHAR))+''' AND V0514='''+RTRIM(CAST(v52.V0514 AS VARCHAR))+'''' AS �༭,
v52.a0102 a0102,v52.Ha0102 Ha0102,
v52.v0514 v0514,v52.Hv0514 Hv0514,
v52.v0513 v0513,v52.Hv0513 Hv0513,
sxzb.TDQK,sxzb.HTDQK,
jzc.v0513 '��һ��ͨ�����|����',jzc.Hv0513 '��һ��ͨ�����|����',
CASE WHEN SXZB.NBTABLE is null THEN '���ʵͨ������Ƿ���ʵ'	ELSE 'error' END '���˵��'
from V52
LEFT JOIN jzc on v52.v0514=jzc.V0514
left join sxzb on v52.v0514 =sxzb.xzdm
where  isnull(v52.v0513,'9999')<>isnull(jzc.v0513,'9999')
AND NBTABLE IS NULL  and  v52.A0102 LIKE '#A0102#%' AND v52.A0102 LIKE '#GLDW#%'

SELECT  'V53'+'&A0102 ='''+RTRIM(CAST(v53.A0102 AS VARCHAR))+''' AND V0514='''+RTRIM(CAST(v53.V0514 AS VARCHAR))+''' AND V5701='''+RTRIM(CAST(v53.V5701 AS VARCHAR))+'''' AS �༭,
v53.a0102 a0102,v53.Ha0102 Ha0102,
v53.V0514 V0514,v53.HV0514 HV0514,
v53.V5701 V5701,v53.HV5701 HV5701,
v53.v5708 v5708,v53.Hv5708 Hv5708,
zrc.v5708 '��һ��ͨ�����|����',zrc.Hv5708 '��һ��ͨ�����|����',
sxzb.TDQK '����ָ��|ͨ�����',sxzb.HTDQK '����ָ��| ͨ�����',
CASE WHEN SXZB.NBTABLE is null THEN '���ʵͨ������Ƿ���ʵ'	ELSE 'error' END '���˵��'
from V53
LEFT JOIN zrc on v53.V5701=zrc.V5701
left join sxzb on v53.V5701 =sxzb.xzdm
where  isnull(v53.v5708,'9999')<>isnull(zrc.v5708,'9999')
AND NBTABLE IS NULL  --and  v53.A0102 LIKE '#A0102#%' AND v53.A0102 LIKE '#GLDW#%'
ORDER BY A0102

*/

--��������ָ����ձ�
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SXZB]') AND type IN ('U'))
	DROP TABLE [dbo].[SXZB]
GO

CREATE TABLE [dbo].[SXZB] (
  [XZDM] varchar(255) COLLATE Chinese_PRC_CI_AS not NULL,
	[XZMC] varchar(255) COLLATE Chinese_PRC_CI_AS not NULL,
  [TDQK] varchar(255) COLLATE Chinese_PRC_CI_AS not NULL,
  [HTDQK] varchar(255) COLLATE Chinese_PRC_CI_AS not NULL,
  [NBTABLE] varchar(255) COLLATE Chinese_PRC_CI_AS not NULL,
  [NBNF] varchar(255) COLLATE Chinese_PRC_CI_AS not NULL
)
GO

EXEC sp_addextendedproperty
'MS_Description', N'�������루���ƴ���룬��Ȼ����룩',
'USER', N'dbo',
'TABLE', N'SXZB',
'COLUMN', N'XZDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'�������ƣ����ƴ壬��Ȼ�����ƣ�',
'USER', N'dbo',
'TABLE', N'SXZB',
'COLUMN', N'XZMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'�Ƿ�ͬ˫����/Ӳ��·',
'USER', N'dbo',
'TABLE', N'SXZB',
'COLUMN', N'TDQK'
GO

EXEC sp_addextendedproperty
'MS_Description', N'�Ƿ�ͬ˫����/Ӳ��·  ����',
'USER', N'dbo',
'TABLE', N'SXZB',
'COLUMN', N'HTDQK'
GO

EXEC sp_addextendedproperty
'MS_Description', N'v52/v53',
'USER', N'dbo',
'TABLE', N'SXZB',
'COLUMN', N'NBTABLE'
GO

EXEC sp_addextendedproperty
'MS_Description', N'�걨���',
'USER', N'dbo',
'TABLE', N'SXZB',
'COLUMN', N'NBNF'
GO

EXEC sp_addextendedproperty
'MS_Description', N'�˱�Ϊÿ������ָ���',
'USER', N'dbo',
'TABLE', N'SXZB'
GO

CREATE NONCLUSTERED INDEX [INDEX_XZDM]
ON [dbo].[SXZB] (
  [XZDM] ASC
)
GO

CREATE NONCLUSTERED INDEX [INDEX_NBTABLE]
ON [dbo].[SXZB] (
  [NBTABLE] ASC
)
GO


INSERT into SXZB
SELECT 
convert(varchar(255),cast(convert(float,XZDM) as decimal)),XZMC,TDQK,HTDQK,NBTABLE,nbnf
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=C:\Users\Administrator\Desktop\SXZB20231217.xls',sheet1$)

/*
update v52 set V0513=TDQK,hV0513=HTDQK
--SELECT V0513,TDQK,hV0513,HTDQK
from v52 
left join sxzb on V0514=xzdm
where tdqk is not null and v0513<>tdqk and NBTABLE ='v52' and nbnf='2023' and left(V0514,4)='3408'

update v53 set V5708=TDQK,hV5708=HTDQK
--SELECT V5708,TDQK,hV5708,HTDQK
from v53 
left join sxzb on V5701=xzdm
where tdqk is not null and V5708<>tdqk and NBTABLE ='v53' and nbnf='2023' and left(V0514,4)='3408'
*/

backup database [HRP-DBMS2014] to disk ='c:\HRP-DBMS2014-1220-1'

--������ʷ��
update jzc set V0513=TDQK,hV0513=HTDQK
--SELECT V0513,TDQK,hV0513,HTDQK
from jzc 
left join sxzb on V0514=xzdm
where tdqk is not null and RTRIM(v0513)<>RTRIM(tdqk) and nbtable='V52' 

update ZRC set V5708=TDQK,hV5708=HTDQK
--SELECT V5708,TDQK,hV5708,HTDQK
from ZRC 
left join sxzb on V5701=xzdm
where tdqk is not null and RTRIM(V5708)<>RTRIM(tdqk) and nbtable='V53' 