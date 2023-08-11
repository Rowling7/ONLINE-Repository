/*
 Navicat Premium Data Transfer

 Source Server         : SQL2008R2
 Source Server Type    : SQL Server
 Source Server Version : 10501600
 Source Host           : PC-202107091642\SQL2008R2:1433
 Source Catalog        : MYDB
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 10501600
 File Encoding         : 65001

 Date: 27/05/2022 10:36:21
*/


-- ----------------------------
-- Table structure for A
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[A]') AND type IN ('U'))
	DROP TABLE [dbo].[A]
GO

CREATE TABLE [dbo].[A] (
  [id] int  NOT NULL,
  [name] varchar(15) COLLATE Chinese_PRC_CI_AS  NULL,
  [age] int  NULL
)
GO

ALTER TABLE [dbo].[A] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of A
-- ----------------------------
INSERT INTO [dbo].[A] ([id], [name], [age]) VALUES (N'1', N'张三', N'18')
GO

INSERT INTO [dbo].[A] ([id], [name], [age]) VALUES (N'2', N'王无', N'25')
GO

INSERT INTO [dbo].[A] ([id], [name], [age]) VALUES (N'3', N'张四', N'65')
GO

INSERT INTO [dbo].[A] ([id], [name], [age]) VALUES (N'4', N'啊位', N'95')
GO

INSERT INTO [dbo].[A] ([id], [name], [age]) VALUES (N'6', N'李吕梁', N'58')
GO

INSERT INTO [dbo].[A] ([id], [name], [age]) VALUES (N'9', N'老石首', N'42')
GO

INSERT INTO [dbo].[A] ([id], [name], [age]) VALUES (N'15', N'张位', N'65')
GO

INSERT INTO [dbo].[A] ([id], [name], [age]) VALUES (N'17', N'阿要', N'1')
GO

INSERT INTO [dbo].[A] ([id], [name], [age]) VALUES (N'18', N'阿盘', N'63')
GO

INSERT INTO [dbo].[A] ([id], [name], [age]) VALUES (N'19', N'z', N'44')
GO

INSERT INTO [dbo].[A] ([id], [name], [age]) VALUES (N'20', N'z', N'78')
GO

INSERT INTO [dbo].[A] ([id], [name], [age]) VALUES (N'21', N'D', N'64')
GO


-- ----------------------------
-- Table structure for B
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[B]') AND type IN ('U'))
	DROP TABLE [dbo].[B]
GO

CREATE TABLE [dbo].[B] (
  [id] int  NOT NULL,
  [name] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [age] int  NULL
)
GO

ALTER TABLE [dbo].[B] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of B
-- ----------------------------
INSERT INTO [dbo].[B] ([id], [name], [age]) VALUES (N'2', N'王无', N'25')
GO

INSERT INTO [dbo].[B] ([id], [name], [age]) VALUES (N'3', N'张四', N'65')
GO

INSERT INTO [dbo].[B] ([id], [name], [age]) VALUES (N'4', N'啊位', N'95')
GO

INSERT INTO [dbo].[B] ([id], [name], [age]) VALUES (N'6', N'李吕梁', N'58')
GO

INSERT INTO [dbo].[B] ([id], [name], [age]) VALUES (N'9', N'老石首', N'42')
GO

INSERT INTO [dbo].[B] ([id], [name], [age]) VALUES (N'15', N'张位', N'65')
GO

INSERT INTO [dbo].[B] ([id], [name], [age]) VALUES (N'17', N'阿要', N'1')
GO

INSERT INTO [dbo].[B] ([id], [name], [age]) VALUES (N'18', N'阿盘', N'63')
GO

INSERT INTO [dbo].[B] ([id], [name], [age]) VALUES (N'19', N'z', N'44')
GO

INSERT INTO [dbo].[B] ([id], [name], [age]) VALUES (N'20', N'z', N'78')
GO

INSERT INTO [dbo].[B] ([id], [name], [age]) VALUES (N'21', N'D', N'64')
GO


-- ----------------------------
-- Table structure for info
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[info]') AND type IN ('U'))
	DROP TABLE [dbo].[info]
GO

CREATE TABLE [dbo].[info] (
  [id] int  NOT NULL,
  [name] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [age] int  NULL,
  [address] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [FIRSTNAME] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [FIR] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [SEC] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [TEN] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [UID] int  NULL
)
GO

ALTER TABLE [dbo].[info] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO [dbo].[info] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'2', N'张三', N'64', N'天津', N'王', N'2007', N'2007    ', N'20070507', N'37')
GO

INSERT INTO [dbo].[info] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'3', N'张四', N'60', N'深圳', N'张', N'2008', N'2008    ', N'20080508', N'37')
GO

INSERT INTO [dbo].[info] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'4', N'李四', N'29', N'上海', N'阿', N'2009', N'2009    ', N'20090509', N'37')
GO

INSERT INTO [dbo].[info] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'6', N'李五', N'50', N'北京', N'李', N'2010', N'2010    ', N'20100510', N'37')
GO

INSERT INTO [dbo].[info] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'9', N'李六', N'32', N'河北', N'老', N'2010', N'2011    ', N'20110511', N'52')
GO

INSERT INTO [dbo].[info] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'15', N'王五', N'26', N'', N'张', N'2013', N'2012    ', N'20120512', N'52')
GO

INSERT INTO [dbo].[info] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'18', N'王六', N'31', N'山东', N'', N'2015', N'2014    ', N'20140514', N'52')
GO

INSERT INTO [dbo].[info] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'19', N'王七', NULL, N'河南', N'z', N'2016', N'2015    ', N'20150515', N'42')
GO

INSERT INTO [dbo].[info] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'20', N'', N'99', N'美国', N'老', N'2017', N'2016    ', N'20220505', N'42')
GO

INSERT INTO [dbo].[info] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'21', N'老六', N'99', N'北京', N'老', N'2018', N'207     ', N'20220526', N'0')
GO


-- ----------------------------
-- Table structure for info_copy1
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[info_copy1]') AND type IN ('U'))
	DROP TABLE [dbo].[info_copy1]
GO

CREATE TABLE [dbo].[info_copy1] (
  [id] int  NOT NULL,
  [name] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [age] int  NULL,
  [address] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [FIRSTNAME] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [FIR] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [SEC] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [TEN] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [UID] int  NULL
)
GO

ALTER TABLE [dbo].[info_copy1] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of info_copy1
-- ----------------------------
INSERT INTO [dbo].[info_copy1] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'1', N'张三', N'18', N'湖北', N'张', N'2005', N'2006    ', N'20060506', N'37')
GO

INSERT INTO [dbo].[info_copy1] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'2', N'王无', N'64', N'天津', N'王', N'2006', N'2007    ', N'20070507', N'37')
GO

INSERT INTO [dbo].[info_copy1] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'3', N'张四', N'60', N'深圳', N'张', N'2007', N'2008    ', N'20080508', N'37')
GO

INSERT INTO [dbo].[info_copy1] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'4', N'啊位', N'29', N'上海', N'阿', N'2008', N'2009    ', N'20090509', N'37')
GO

INSERT INTO [dbo].[info_copy1] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'6', N'李吕梁', N'50', N'北京', N'李', N'2009', N'2010    ', N'20100510', N'52')
GO

INSERT INTO [dbo].[info_copy1] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'9', N'老石首', N'32', N'河北', N'老', N'2010', N'2011    ', N'20110511', N'52')
GO

INSERT INTO [dbo].[info_copy1] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'15', N'张位', N'26', N'河南', N'张', N'2011', N'2012    ', N'20120512', N'52')
GO

INSERT INTO [dbo].[info_copy1] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'17', N'阿要', N'31', N'山东', N'阿', N'2012', N'2013    ', N'20130513', N'42')
GO

INSERT INTO [dbo].[info_copy1] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'18', N'阿盘', N'31', N'山东', N'阿', N'2013', N'2014    ', N'20140514', N'42')
GO

INSERT INTO [dbo].[info_copy1] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'19', N'z', N'31', N'山东', N'z', N'2014', N'2015    ', N'20150515', N'0')
GO

INSERT INTO [dbo].[info_copy1] ([id], [name], [age], [address], [FIRSTNAME], [FIR], [SEC], [TEN], [UID]) VALUES (N'20', N'z', NULL, N'山东', N'z', N'2015', N'2016    ', N'20160516', N'1')
GO


-- ----------------------------
-- Table structure for mini
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[mini]') AND type IN ('U'))
	DROP TABLE [dbo].[mini]
GO

CREATE TABLE [dbo].[mini] (
  [uId] int  NOT NULL,
  [uName] varchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [rId] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [rName] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [zId] varchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [note] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[mini] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of mini
-- ----------------------------
INSERT INTO [dbo].[mini] ([uId], [uName], [rId], [rName], [zId], [note]) VALUES (N'14', N'山西公路局', N'S101', N'环太线', N'0K-100K', N'环城路')
GO

INSERT INTO [dbo].[mini] ([uId], [uName], [rId], [rName], [zId], [note]) VALUES (N'14', N'山西公路局', N'S102', N'太运线', N'0K-25.1K', N'高速')
GO

INSERT INTO [dbo].[mini] ([uId], [uName], [rId], [rName], [zId], [note]) VALUES (N'22', N'吉林公路局', N'G010', N'同三线', N'1110K-1130K', N'长春环线')
GO


-- ----------------------------
-- Table structure for mini_copy1
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[mini_copy1]') AND type IN ('U'))
	DROP TABLE [dbo].[mini_copy1]
GO

CREATE TABLE [dbo].[mini_copy1] (
  [uId] int  NOT NULL,
  [uName] varchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [rId] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [rName] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [zId] varchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [note] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[mini_copy1] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of mini_copy1
-- ----------------------------
INSERT INTO [dbo].[mini_copy1] ([uId], [uName], [rId], [rName], [zId], [note]) VALUES (N'14', N'山西公路局', N'S101', N'环太线', N'0K-100K', N'环城路')
GO

INSERT INTO [dbo].[mini_copy1] ([uId], [uName], [rId], [rName], [zId], [note]) VALUES (N'14', N'山西公路局', N'S102', N'太运线', N'0K-25.1K', N'高速')
GO

INSERT INTO [dbo].[mini_copy1] ([uId], [uName], [rId], [rName], [zId], [note]) VALUES (N'22', N'吉林公路局', N'G010', N'同三线', N'1110K-1130K', N'长春环线')
GO


-- ----------------------------
-- procedure structure for FACTORIAL
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[FACTORIAL]') AND type IN ('FN', 'FS', 'FT', 'IF', 'TF'))
	DROP PROCEDURE[dbo].[FACTORIAL]
GO

CREATE PROCEDURE [dbo].[FACTORIAL] 
@M INT
AS
BEGIN
IF(@M<=10)
BEGIN
DECLARE @N INT ,@L INT 
SELECT @N =1 ,@L=1
WHILE @N<@M
BEGIN 
SET @N =@N+1
SET @L =@L*@N
END 
PRINT @L
END
ELSE
BEGIN
PRINT '输入值必须小于等于10'
end
END
GO


-- ----------------------------
-- procedure structure for 游标 联级更新
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[游标 联级更新]') AND type IN ('FN', 'FS', 'FT', 'IF', 'TF'))
	DROP PROCEDURE[dbo].[游标 联级更新]
GO

CREATE PROCEDURE [dbo].[游标 联级更新]
    @rtn int output
AS

declare @temp_id INT ,@temp_name varchar(15),@temp_age int

BEGIN
	SET NOCOUNT ON; -->SET NOCOUNT ON的作用
	
	DECLARE 
		@cursor_b_val CURSOR	--创建游标变量
	DECLARE cursor_B CURSOR scroll		--创建动态游标
	FOR	SELECT name,age,id FROM B;	--创建游标接受结果集
	OPEN cursor_B	--打开游标
	fetch First from cursor_B into @temp_name,@temp_age,@temp_id --into的变量数量必须与游标查询结果集的列数相同
	
    --0，Fetch语句成功。
    --1：Fetch语句失败或行不在结果集中。
    --2：提取的行不存在。
		print @@FETCH_STATUS
	WHILE @@FETCH_STATUS=0 --判断FETCH语句是否执行成功
	BEGIN
		if exists(select * from A where id=@temp_id)
			begin
			 update A set name=@temp_name,age=@temp_age where id=@temp_id
			 set @rtn=1 --有身份证相同的数据，进行更新处理
			end
		else
			 begin
			 insert into A(name,id,age) values(@temp_name,@temp_id,@temp_age)
			 set @rtn=2 --没有相同的数据，进行插入处理
			 end
		fetch next from cursor_B into @temp_name,@temp_age,@temp_id  --移动游标
		PRINT @RTN
	END
	CLOSE cursor_B --关闭游标
	DEALLOCATE cursor_B; --释放游标
END
GO


-- ----------------------------
-- procedure structure for WHILE联级更新
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[WHILE联级更新]') AND type IN ('FN', 'FS', 'FT', 'IF', 'TF'))
	DROP PROCEDURE[dbo].[WHILE联级更新]
GO

CREATE PROCEDURE [dbo].[WHILE联级更新]
AS

declare @temp_id INT,@temp_name varchar(15),@temp_age int
BEGIN
	SET NOCOUNT ON;
	--创建临时表
	CREATE TABLE #tempTable
	( 
	tempID int identity(1,1),
	name VARCHAR(15), 
	age int,
	id INT,
	)
	insert into #tempTable(name,age,id)
	SELECT name,age,id  FROM B	
	
	DECLARE @TOTAL_COUNT INT,--临时表记录条数
			@NOW_COUNT INT--现在遍历到哪条记录

	SELECT @TOTAL_COUNT=COUNT(*) FROM #tempTable
	SET @NOW_COUNT=1;
	WHILE(@NOW_COUNT<=@TOTAL_COUNT)
	 BEGIN
	   SELECT @temp_id=id,@temp_name=name,@temp_age=age FROM #tempTable 
	   WHERE tempID=@NOW_COUNT --关键就在这
		if exists(select * from A where id=@temp_id)
			begin
			 update A set name=@temp_name,age=@temp_age where id=@temp_id
			end
		else
			 begin
			 insert into A(name,id,age) values(@temp_name,@temp_id,@temp_age)
			 end
		
	   SET @NOW_COUNT=@NOW_COUNT+1
	 END
	 --SELECT *FROM #TEMPTABLE
	DROP TABLE #tempTable	--删除临时表

END
GO


-- ----------------------------
-- Primary Key structure for table A
-- ----------------------------
ALTER TABLE [dbo].[A] ADD CONSTRAINT [PK__info__7C8480AE_copy1_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table B
-- ----------------------------
ALTER TABLE [dbo].[B] ADD CONSTRAINT [PK__info__7C8480AE_copy1_copy1_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Checks structure for table info
-- ----------------------------
ALTER TABLE [dbo].[info] ADD CONSTRAINT [oydschk_K001_16] CHECK ((left([FIR],(2))='20' OR left([FIR],(2))='19') AND isdate([FIR]+'0101')=(1) OR [FIR] IS NULL)
GO


-- ----------------------------
-- Primary Key structure for table info
-- ----------------------------
ALTER TABLE [dbo].[info] ADD CONSTRAINT [PK__info__3213E83F1273C1CD] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table info_copy1
-- ----------------------------
ALTER TABLE [dbo].[info_copy1] ADD CONSTRAINT [PK__info__7C8480AE_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table mini
-- ----------------------------
ALTER TABLE [dbo].[mini] ADD CONSTRAINT [PK__mini__CDF56BE91920BF5C] PRIMARY KEY CLUSTERED ([uId], [uName], [zId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table mini_copy1
-- ----------------------------
ALTER TABLE [dbo].[mini_copy1] ADD CONSTRAINT [PK__mini__CDF56BE91920BF5C_copy1] PRIMARY KEY CLUSTERED ([uId], [uName], [zId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

