IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SXZBBG]') AND type IN ('U'))
	DROP TABLE [dbo].[SXZBBG]
GO

CREATE TABLE [dbo].[SXZBBG] (
  [XZDM] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
	[XZMC] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [TDQK] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [HTDQK] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [NBTABLE] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [BEIZHU] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

EXEC sp_addextendedproperty
'MS_Description', N'�������루���ƴ���룬��Ȼ����룩',
'USER', N'dbo',
'TABLE', N'SXZBBG',
'COLUMN', N'XZDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'�������ƣ����ƴ壬��Ȼ�����ƣ�',
'USER', N'dbo',
'TABLE', N'SXZBBG',
'COLUMN', N'XZMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'�Ƿ�ͬ˫����/Ӳ��·',
'USER', N'dbo',
'TABLE', N'SXZBBG',
'COLUMN', N'TDQK'
GO

EXEC sp_addextendedproperty
'MS_Description', N'�Ƿ�ͬ˫����/Ӳ��·  ����',
'USER', N'dbo',
'TABLE', N'SXZBBG',
'COLUMN', N'HTDQK'
GO

EXEC sp_addextendedproperty
'MS_Description', N'v52/v53',
'USER', N'dbo',
'TABLE', N'SXZBBG',
'COLUMN', N'NBTABLE'
GO

EXEC sp_addextendedproperty
'MS_Description', N'��ע',
'USER', N'dbo',
'TABLE', N'SXZBBG',
'COLUMN', N'BEIZHU'
GO


CREATE NONCLUSTERED INDEX [INDEX_XZDM]
ON [dbo].[SXZBBG] (
  [XZDM] ASC
)
GO

CREATE NONCLUSTERED INDEX [INDEX_NBTABLE]
ON [dbo].[SXZBBG] (
  [NBTABLE] ASC
)
GO

--�������޸�����
INSERT INTO [dbo].[SXZBBG] 
([XZDM], [XZMC], [TDQK], [HTDQK], [NBTABLE], [BEIZHU])
SELECT  v5701,hv5701,v5708,hv5708,'BGv53','20231218���ͨ�����'
from V53

INSERT INTO [dbo].[SXZBBG] 
([XZDM], [XZMC], [TDQK], [HTDQK], [NBTABLE], [BEIZHU])
SELECT  V0514,hV0514,V0513,hV0513,'BGv52','20231218���ͨ��������޸�'
from V52



--��ѯ��Щͨ��������޸�
SELECT A.XZDM,A.TDQK,B.XZDM,B.TDQK
FROM SXZB A
LEFT JOIN SXZBBG B ON A.XZDM=B.XZDM 
WHERE A.TDQK<>B.TDQK and a.tdqk is not null and a.nbtable <>'v532'

--------------v52
SELECT A.XZDM,A.TDQK,B.V0514,B.V0513
FROM SXZB A
LEFT JOIN v52 B ON A.XZDM=B.V0514 
WHERE A.TDQK<>B.V0513 and a.tdqk is not null
--------------v53
SELECT A.XZDM,A.TDQK,B.V5701,B.V5708
FROM SXZB A
LEFT JOIN v53 B ON A.XZDM=B.V5701 
WHERE A.TDQK<>B.V5708 and a.tdqk is not null


