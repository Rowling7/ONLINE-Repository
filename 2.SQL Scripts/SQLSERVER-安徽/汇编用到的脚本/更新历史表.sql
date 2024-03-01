--1.ludan
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[luduan]') AND type IN ('U'))
	DROP TABLE [dbo].[luduan]
select *
into luduan
from [HRP-DBMS2014汇编基数]..k001
where not (left(k0101,1) in ('G','S','H','T') AND K0101 LIKE '%ZD%')

--2.Wluduan
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Wluduan]') AND type IN ('U'))
	DROP TABLE [dbo].[Wluduan]
select *
into Wluduan
from [HRP-DBMS2014汇编基数]..k001
where left(k0101,1) in ('W')

--3.qiaoliang
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[qiaoliang]') AND type IN ('U'))
	DROP TABLE [dbo].[qiaoliang]
select *
into qiaoliang
from [HRP-DBMS2014汇编基数]..k060

--4.suidao
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[suidao]') AND type IN ('U'))
	DROP TABLE [dbo].[suidao]
select *
into suidao
from [HRP-DBMS2014汇编基数]..k063

--5.dukou
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dukou]') AND type IN ('U'))
	DROP TABLE [dbo].[dukou]
select *
into dukou
from [HRP-DBMS2014汇编基数]..k065

---更新乡镇历史表
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[XZ]') AND type IN ('U'))
	DROP TABLE [dbo].[XZ]
GO
CREATE TABLE [dbo].[XZ] (
  [A0102] char(9) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [HA0102] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
	[A0101] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [V0501] char(12) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [V0503] numeric(12)  NULL,
  [V0506] char(2) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0506] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [V0507] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0507] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [V0508] numeric(7,3)  NULL,
  [V0509] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0509] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [V0510] numeric(12,8)  NULL,
  [V0511] numeric(12,8)  NULL,
  [V0512] numeric(12)  NULL,
  [V0516] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0516] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [V0560] char(2) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0560] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [A0129] text COLLATE Chinese_PRC_CI_AS  NULL,
  [V8101] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV8101] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [V8102] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV8102] char(25) COLLATE Chinese_PRC_CI_AS  NULL,
  [V8103] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV8103] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [V8104] char(15) COLLATE Chinese_PRC_CI_AS  NULL,
  [V8105] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [V8106] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV8106] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [K0199] text COLLATE Chinese_PRC_CI_AS  NULL,
  [InsertLogin] char(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [ModifyLogin] char(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0501] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [V0504] char(2) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0504] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [V0502] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0502] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [KWYID] char(100) COLLATE Chinese_PRC_CI_AS  NULL
)
GO
INSERT INTO [dbo].[XZ] ([A0102], [HA0102],[A0101], [V0501], [V0503], [V0506], [HV0506], [V0507], [HV0507], [V0508], [V0509], [HV0509], [V0510], [V0511], [V0512], [V0516], [HV0516], [V0560], [HV0560], [A0129], [V8101], [HV8101], [V8102], [HV8102], [V8103], [HV8103], [V8104], [V8105], [V8106], [HV8106], [K0199], [InsertLogin], [ModifyLogin], [HV0501], [V0504], [HV0504], [V0502], [HV0502], [KWYID])
select [A0102], [HA0102],'2022', [V0501], [V0503], [V0506], [HV0506], [V0507], [HV0507], [V0508], [V0509], [HV0509], [V0510], [V0511], [V0512], [V0516], [HV0516], [V0560], [HV0560], [A0129], [V8101], [HV8101], [V8102], [HV8102], [V8103], [HV8103], [V8104], [V8105], [V8106], [HV8106], [K0199], [InsertLogin], [ModifyLogin], [HV0501], [V0504], [HV0504], [V0502], [HV0502], [KWYID]
from [HRP-DBMS2014汇编基数]..V51

---更新建制村历史表
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[JZC]') AND type IN ('U'))
	DROP TABLE [dbo].[JZC]
GO
CREATE TABLE [dbo].[JZC] (
  [A0102] char(9) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [HA0102] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
	[A0101] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [V0514] char(12) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [V0519] numeric(12)  NULL,
  [V0506] char(2) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0506] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [V0507] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0507] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [V0508] numeric(7,3)  NULL,
  [V0509] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0509] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [V0520] numeric(12,8)  NULL,
  [V0521] numeric(12,8)  NULL,
  [V0524] numeric(12)  NULL,
  [V0516] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0516] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [V0561] char(2) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0561] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [A0129] text COLLATE Chinese_PRC_CI_AS  NULL,
  [V8101] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV8101] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [V8201] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV8201] char(25) COLLATE Chinese_PRC_CI_AS  NULL,
  [V8103] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV8103] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [V8104] char(15) COLLATE Chinese_PRC_CI_AS  NULL,
  [V8105] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [V8106] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV8106] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [K0199] text COLLATE Chinese_PRC_CI_AS  NULL,
  [InsertLogin] char(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [ModifyLogin] char(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0514] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [V0505] char(2) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0505] char(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [V0513] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [HV0513] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [KWYID] char(100) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

INSERT INTO [dbo].[JZC] ([A0102], [HA0102],[A0101], [V0514], [V0519], [V0506], [HV0506], [V0507], [HV0507], [V0508], [V0509], [HV0509], [V0520], [V0521], [V0524], [V0516], [HV0516], [V0561], [HV0561], [A0129], [V8101], [HV8101], [V8201], [HV8201], [V8103], [HV8103], [V8104], [V8105], [V8106], [HV8106], [K0199], [InsertLogin], [ModifyLogin], [HV0514], [V0505], [HV0505], [V0513], [HV0513], [KWYID])
select [A0102], [HA0102],'2022', [V0514], [V0519], [V0506], [HV0506], [V0507], [HV0507], [V0508], [V0509], [HV0509], [V0520], [V0521], [V0524], [V0516], [HV0516], [V0561], [HV0561], [A0129], [V8101], [HV8101], [V8201], [HV8201], [V8103], [HV8103], [V8104], [V8105], [V8106], [HV8106], [K0199], [InsertLogin], [ModifyLogin], [HV0514], [V0505], [HV0505], [V0513], [HV0513], [KWYID]
from [HRP-DBMS2014汇编基数]..v52

---更新建制村自然表
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ZRC]') AND type IN ('U'))
	DROP TABLE [dbo].[ZRC]
GO
CREATE TABLE [dbo].[ZRC] (
  [A0102] char(9) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [HA0102] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
	[A0101] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [V0514] char(12) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [HV0514] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [V5701] char(15) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [HV5701] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [V5708] char(1) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [HV5708] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [V8104] char(15) COLLATE Chinese_PRC_CI_AS  NULL,
  [V8105] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [V5703] numeric(12)  NOT NULL,
  [A0129] text COLLATE Chinese_PRC_CI_AS  NULL,
  [InsertLogin] char(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [ModifyLogin] char(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [K0185] numeric(12,8)  NULL,
  [K0186] numeric(12,8)  NULL,
  [KWYID] char(100) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

INSERT INTO [dbo].[ZRC] ([A0102], [HA0102],[A0101], [V0514], [HV0514], [V5701], [HV5701], [V5708], [HV5708], [V8104], [V8105], [V5703], [A0129], [InsertLogin], [ModifyLogin], [K0185], [K0186], [KWYID]) 
SELECT [A0102], [HA0102],'2022', [V0514], [HV0514], [V5701], [HV5701], [V5708], [HV5708], [V8104], [V8105], [V5703], [A0129], [InsertLogin], [ModifyLogin], [K0185], [K0186], [KWYID]
from [HRP-DBMS2014汇编基数]..V53


select case when a.a=b.b then'路段历史表更新完成' else '！！路段历史表更新未成功！！'  end  '更新结果' 
from 
(SELECT COUNT(*) a FROM LUDUAN where not (left(k0101,1) in ('G','S','H','T') AND K0101 LIKE '%ZD%'))a,
(SELECT COUNT(*) b FROM [HRP-DBMS2014汇编基数]..k001 where not (left(k0101,1) in ('G','S','H','T') AND K0101 LIKE '%ZD%'))b
UNION
select case when a.a=b.b then'W路段历史表更新完成' else '！！W路段历史表更新未成功！！'  end  '更新结果' 
from 
(SELECT COUNT(*) a FROM Wluduan where left(k0101,1) in ('W'))a,
(SELECT COUNT(*) b FROM [HRP-DBMS2014汇编基数]..k001 where left(k0101,1) in ('W'))b
UNION
select case when a.a=b.b then'桥梁历史表更新完成' else '！！桥梁历史表更新未成功！！'  end  '更新结果' 
from 
(SELECT COUNT(*) a FROM qiaoliang )a,
(SELECT COUNT(*) b FROM [HRP-DBMS2014汇编基数]..K060 )b
UNION
select case when a.a=b.b then'隧道历史表更新完成' else '！！隧道历史表更新未成功！！'  end  '更新结果' 
from 
(SELECT COUNT(*) a FROM suidao )a,
(SELECT COUNT(*) b FROM [HRP-DBMS2014汇编基数]..K063 )b
UNION
select case when a.a=b.b then'渡口历史表更新完成' else '！！渡口历史表更新未成功！！'  end  '更新结果' 
from 
(SELECT COUNT(*) a FROM dukou )a,
(SELECT COUNT(*) b FROM [HRP-DBMS2014汇编基数]..K065 )b
UNION
select case when a.a=b.b then'乡镇历史表更新完成' else '！！乡镇历史表更新未成功！！'  end  '更新结果' 
from 
(SELECT COUNT(*) a FROM XZ )a,
(SELECT COUNT(*) b FROM [HRP-DBMS2014汇编基数]..V51 )b
UNION
select case when a.a=b.b then'建制村历史表更新完成' else '！！建制村历史表更新未成功！！'  end  '更新结果' 
from 
(SELECT COUNT(*) a FROM JZC )a,
(SELECT COUNT(*) b FROM [HRP-DBMS2014汇编基数]..V52 )b
UNION
select case when a.a=b.b then'自然村历史表更新完成' else '！！自然村历史表更新未成功！！'  end  '更新结果' 
from 
(SELECT COUNT(*) a FROM zrc )a,
(SELECT COUNT(*) b FROM [HRP-DBMS2014汇编基数]..V53 )b
ORDER BY '更新结果'



update luduan set a0101='2022',ha0101='2022年'
update qiaoliang set a0101='2022',ha0101='2022年'
update Wluduan set a0101='2022',ha0101='2022年'
update suidao set a0101='2022',ha0101='2022年'
update dukou set a0101='2022',ha0101='2022年'


SELECT kwyid,*
from luduan 
where kwyid is null
SELECT kwyid,*
from qiaoliang 
where kwyid is null
SELECT kwyid,*
from suidao 
where kwyid is null
SELECT kwyid,*
from wluduan
where kwyid is null
