--<------------------------------<---SQLSERVER--->------------------------------>--
--/**
--<------------------------------<---NEW--->------------------------------>--

-- sql执行顺序区别
/*
where后面条件的执行顺序
	1.mysql、sqlserver 从左往右执行
	2.oracle 从右往左执行
	tips：筛选掉数据越多的条件，越放到前面执行，可以提高数据库查询效率
	tips：大多数时候，mysql会自动选择最优的执行顺序，但是有时候mysql不能做出最优的执行顺序，就需要我们自己判断哪种过滤最优。
*/

-- '' 和null 的区别
/*
	''是长度为0 的一个字符串，是一个确定的值，null是一个空值，是无法确定的
*/
--PARTITION BY
--GROUP BY是分组函数，PARTITION BY是分区函数，SUM()等是聚合函数
SELECT RANK()  OVER( PARTITION BY UID ORDER BY AGE DESC ) ,UID,AGE,ID
FROM INFO

--审核用
--判空
	where nullif(a0103,'') is null
--where 条件
	where AND A0102 LIKE '#A0102#%' AND A0102 LIKE '#GLDW#%'
--国家高速公路、省道高速公路（无匝道）
	--k0304技术等级-10：高速
	WHERE len(ltrim(rtrim(k0101)))<=9 and k0304='10'
--纳入里程统计
	--K0123不是断头路，K0124没有重复路段
	where isnull(k0123,'2')='2' and nullif(k0124,'') is null

/*  */
update dz0101 set objjc=REPLACE(RTRIM(OBJJC), CHAR(10), '') 
--去除换行符
update dz0101 set objjc=REPLACE(RTRIM(OBJJC), CHAR(13), '') 
--去除回车符


--<------------------------------<---SQL 0.1.1--->------------------------------>--

--WAITFOR  直到所设定的等待时间已过或所设定的时间已到才继续往下执行
WAITFOR DELAY '00:00:03' --'00:00:03' 固定格式，等待3秒后执行
WAITFOR TIME  '16:02:50'	  --'16:02:50'	固定格式，等到16时02分50秒开始执行
SELECT * FROM INFO

--查询 SQL 语句执行时长
SET STATISTICS PROFILE ON;
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO
--你的SQL脚本开始
--WAITFOR DELAY '00:00:03'
--WAITFOR TIME  '16:52:20'
SELECT * FROM INFO
--你的SQL脚本结束
GO
SET STATISTICS PROFILE OFF;
SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;

-- 查看数据库版本
SELECT @@VERSION


--<------------------------------<---SQL 0.1.2--->------------------------------>--

--ALL
SELECT * FROM DBO.INFO

--DISTINCT DISTINCT重复只显示一次
SELECT DISTINCT NAME FROM DBO.INFO

--INSERT
INSERT DBO.INFO VALUES ('20','LILU','','HUNAN')

--UPDATE
UPDATE DBO.INFO SET ID=3 WHERE ID =10
		--连表更新
UPDATE  t01	SET T01.A6102 = A61.A6102
FROM T01
LEFT JOIN  A61 ON T01.Z0001 = A61.Z0001

---<TRUNCATE & DELETE >---
--DELETE 删除表中的数据可用WHERE 属于DML，可回滚
DELETE FROM DBO.INFO WHERE ID =20
--TRUNCATE TABLE 删除表中的所有行但是结构、约束、索引不会删除，并重建表
	--重置所有自动增量值、不可用WHERE、效率高于DELETE
	--属于DDL ，不可回滚
TRUNCATE TABLE K60

--TOP
SELECT TOP 60 PERCENT (NAME) ,ID,ADDRESS FROM DBO.INFO

--LIKE 开头%包含%结尾
SELECT * FROM DBO.INFO
WHERE NAME  LIKE '%三%'

--[]
SELECT * FROM DBO.INFO
WHERE NAME LIKE '%[三四五]%'

--IN 备份 选择插入数据
SELECT *FROM DBO.INFO
WHERE NAME IN ('张三','李四')

--BETWEEN
SELECT * FROM DBO.INFO
WHERE ID
BETWEEN '3' AND '15'

--UNION 内部的 SELECT 语句必须拥有相同数量的列。列也必须拥有相似的数据类型。
--同时，每条 SELECT 语句中的列的顺序必须相同。
--联合结果由两个表中任意一个表或者两个表中都存在的行组成
SELECT * FROM INFO
UNION
SELECT * FROM INFO_COPY1

--CREATE
CREATE DATABASE INFOBACKUP

--INTO
SELECT *
INTO DBO.INFOBACKUP
FROM DBO.INFO

--清空表格数据
TRUNCATE TABLE DBO.TMPTABLE

--ALTER
ALTER TABLE TABLE_NAME
DROP(ADD) COLUMN COLUMN_NAME

ALTER TABLE DBO.INFO
ALTER COLUMN ID AUTO_INCREMENT

--AUTO-INCREMENT 会在新记录插入表中时生成一个唯一的数字。
--P_ID INT NOT NULL AUTO_INCREMENT

--ISNULL
SELECT NAME,AGE*(AGE+ISNULL(AGE,0)) AS AGE
FROM DBO.INFO

--MID/SUBSTRING 提取字符
SELECT SUBSTRING(NAME,1,1) AS FNAME FROM DBO.INFO

--LEN 返回长度
SELECT LEN(NAME)AS 长度 FROM DBO.INFO

--ROUND四舍五入 DECIMALS 位数
SELECT ROUND(AGE,0) FROM DBO.INFO

--GETDATE()/NOW() 获取当前时间
SELECT *,GETDATE()AS 当前时间 FROM DBO.INFO

--FORMAT 格式化显示字段
SELECT *, FORMAT(NOW(),'YYYY-MM-DD') AS PERDATE
FROM DBO.INFO

--CONVERT(SQLSERVER有)格式化显示字段
SELECT CONVERT(VARCHAR(12) , GETDATE(), 111 ) AS 日期
--2023/11/08
SELECT CONVERT(VARCHAR(12) , GETDATE(), 112 ) AS 日期
--20231108

--CONVERT 和CAST 区别
SELECT CONVERT(VARCHAR(12) , GETDATE(), 113 ) AS 日期
--08 11 2023 1
SELECT CAST( GETDATE() as VARCHAR(12) ) AS 日期
--08 11 2023 1


--查询长度 LEN 查询 字段后面的空格不算在内
SELECT LEN(NAME) 	LEN FROM INFO WHERE NAME LIKE 'ZZZ'
SELECT DATALENGTH(NAME) DATALENGTH FROM INFO WHERE  NAME LIKE 'ZZZ'

--CI 指定不区分大小写，CS 指定区分大小写
--CHARINDEX 找到字符（CHAR）的位置（INDEX）  全匹配
SELECT CHARINDEX('TEST','THIS TEST IS TEST') --6
SELECT CHARINDEX('TEST','THIS TEST IS TEST',7)  --14
SELECT CHARINDEX('TEST','THIS TEST IS TEST'COLLATE LATIN1_GENERAL_CS_AS)  --14
SELECT CHARINDEX('TEST','THIS TEST IS TEST'COLLATE LATIN1_GENERAL_CI_AS)  --6

--PATINDEX 判断一个字符串中是否包含另一个字符串  模糊匹配
SELECT PATINDEX('%TER%','INTERESTING DATA')  --3
SELECT PATINDEX('%T_NG%','INTERESTING DATA')  --8
SELECT PATINDEX('%ES%','THIS TEST IS TEST' COLLATE LATIN1_GENERAL_CS_AS)  --15
SELECT PATINDEX('%T_S%','THIS TEST IS TEST'COLLATE LATIN1_GENERAL_CI_AS)  --6

--ISNULL(VALUE1,VALUE2)
        --VALUE1与VALUE2的数据类型必须一致。
        --如果VALUE1的值不为NULL，结果返回VALUE1。
        --如果VALUE1为NULL，结果返回VAULE2的值。VAULE2是你设定的值。
USE [MYDB]
SELECT *,[返回值]=ISNULL(AGE,'999')
FROM INFO
WHERE ISNULL(AGE,'0')='0'

--REPLACE 和 STUFF 都执行子字符串替换
--REPLACE 按数据值搜索子字符串。STUFF 按字符串位置和长度搜索子字符串

--REPLACE(string_expression, string_pattern, string_replacement)
		--REPLACE(需要被替换的字符串-ABCXYZ，需要替换的字符串-ABC，替换成的字符串-啦啦啦 )
SELECT	replace('ABCXYZ','ABC','啦啦啦'),
		replace('ABCXYZ','XYZ','啦啦啦')
FROM DBO.INFO

--STUFF(string,start,length,substring)
		--STUFF(需要被替换的字符串,开始位置，长度，替换成的字符串)
SELECT STUFF('ABC test XYZ',4,5,'啦啦啦')
--结果：ABC啦啦啦 XYZ
SELECT STUFF('ABC test XYZ',9,0,' (啦啦啦)')
--结果：ABC test (啦啦啦) XYZ
SELECT STUFF('ABC test XYZ',1,0,'啦啦啦')
--结果：啦啦啦ABC test XYZ
SELECT STUFF('ABC test XYZ',4,5,'')
--结果：ABC XYZ

-- NULLIF:如果两个表达式具有相同的值，则返回 NULL 的函数，否则返回EXPRESSION1。
--NULLIF(EXPRESSION1,EXPRESSION2)
SELECT 	NAME ,LEFT(NAME,1),FIRSTNAME,
		NULLIF(LEFT(NAME,1), FIRSTNAME) AS 'NULLIF'
FROM INFO

--把数据库表ARTICLE中的所有TITLE字段里的SCHOOL字符串替换成HELLO。
UPDATE A SET AGE=REPLACE(AGE,'1','37');

-- ROUND()四舍五入 ROUND（P1,P2,P3）;P1被操作数 P2 小数点位数	P3（0/1）0四舍五入 1截断
-- NUMERIC() NUMERIC（18，0）总的位数为18位数字，小数点后的位数为0位。
SELECT	NUMBER 原数据,
		ROUND(NUMBER,1,0) 四舍五入,
		ROUND(NUMBER,2,1) 截断,
		CAST(NUMBER  AS NUMERIC(8,0)) 无小数,
		CAST(NUMBER  AS NUMERIC(8,3)) 三位小数
FROM INFO

--ISDATA() 返回值 1是 0否
SELECT 	TEN , ISDATE(TEN) TEN,
		NUMBER,ISDATE(NUMBER)  NUMBER
FROM INFO

--#T 临时私人表，生命周期是连接期间，其他人无法访问（建立表链接可以）。
--##T 全局临时表，其他人可访问
--删除的正确格式
IF OBJECT_ID('TEMPDB..#T') IS NOT NULL
DROP TABLE #T

if exists(select * from tempdb..sysobjects where id=object_id('tempdb..##tk001')) DROP TABLE #T

--判断存储过程是否存在
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'Pr_sysCheckFKForPublic')
drop procedure Pr_sysCheckFKForPublic

--CASE  WHEN   ****  THEN   ****ELSE ****  END
SELECT 	[人名]=CASE WHEN LEFT(NAME,1)='张'THEN '张' ELSE '王'END,
		[人数]	=SUM(1)
FROM INFO
WHERE NAME<>''
GROUP BY CASE WHEN LEFT(NAME,1)='张'THEN '张' ELSE '王'END

--查询列名
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'NAME'

--MXT
--UPDATE TABLENAME SET COLUMNA = COLUMNB, COLUMNB = COLUMNA
--UPDATE INFO 	SET NAME =FIRSTNAME , FIRSTNAME= NAME

--ROLLUP 运算符生成的结果集类似于 CUBE 运算符生成的结果集。
--GROUP BY AGE  WITH CUBE


--<------------------------------<---SQL 0.1.3--->------------------------------>--

--一、合并列值
--1.SQL溢用 OUTER APPLY
--replace stuff 实例
SELECT * FROM
(
	SELECT INFO.NAME FROM INFO
)AS I
OUTER APPLY(
SELECT [年龄]= --合并列值
--展开
STUFF(--替换第一个多余的,
	REPLACE(--替换AGE=
		REPLACE(--替换AB
			REPLACE(--替换<
				REPLACE(--替换/>
					REPLACE(--替换"
						(SELECT AB.AGE  FROM
							(SELECT NAME, AGE FROM INFO --WHERE INFO.NAME='张四'
								UNION SELECT NAME,AGE FROM A  --WHERE A.NAME='张四'
							)AS AB
						WHERE I.NAME=AB.NAME FOR XML AUTO)
					,'"','')
				,'/>','')
			,'<',',')
		,'AB','')
	,' AGE=','')
,1,1,'')

)AS  IA
--WHERE I.NAME='张四'

--2.FRO XML PTAH('  ')  输出xml利用空标签达到“连接列值”的效果
USE MYDB
SELECT LEFT(NAME, LEN(NAME) - 1) NAME --利用left 截断最右边的逗号
FROM (SELECT DISTINCT (SELECT  NAME + ','
		FROM info
		WHERE TUID = '37'
		FOR XML PATH ( '' ) --输出xml 利用 ''空的标签和 +','  一同实现 “连接列值”
    ) AS NAME) AS A


--FOR XML AUTO/PATH('')/ROW
SELECT NAME FROM INFO FOR XML AUTO
SELECT NAME+',' FROM INFO FOR XML PATH ('')
SELECT NAME FROM INFO FOR XML RAW

--------------------事务--------------------
begin TRANSACTION--开始事务
--开始sql
delete  from a where id=21  ;
delete  from a where id=20  ;
delete  from a where id=19  ;
--commit  --提交
rollback --回滚

SELECT * FROM A  --中间可查询数据是否del


--------------------删除索引、添加索引--------------------
drop index oydschk_a71_07 on a71;--删除索引

--添加 不唯一、非聚集 索引
USE [GHRHB]
GO
--索引名称：oydschk_a71_07
CREATE  NONCLUSTERED INDEX [oydschk_a71_07] ON [dbo].[A71]
(
	[B0111] ASC,
	[Z0001] ASC,
	[A7101] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


--------------------禁用索引、重建（启用）索引--------------------
USE GHRHB
--禁用索引语法
ALTER INDEX oydschk_a71_07 ON DBO.A71 DISABLE
--启用索引语法
ALTER INDEX oydschk_a71_07 ON DBO.A71 REBUILD


--------------------存储过程--------------------
CREATE PROCEDURE PROCEDURE_NAME
--PROCEDURE_NAME为存储过程名(不能以阿拉伯数字开头)，在一个数据库中触发器名是唯一的。名字的长度不能超过个字。PROCEDURE可以简写为PROC。
@PARAM1 DATATYPE,@PARAM2 DATATYPE
--@PARAM1和@PARAM2为存储过程的参数，DATATYPE为参数类型,多个参数用逗号隔开,最多允许个参数。
AS
--存储过程要执行的操作
BEGIN
--BEGIN跟END组成一个代码块，可以写也可以不写，如果存储过程中执行的SQL语句比较复杂，用BEGIN和END会让代码更加整齐，更容易理解。
END
GO
--GO就代表结操作完毕　　
EXEC PROCEDURE_NAME [参数名]
--调用存储过程PROCEDURE_NAME。
DROP PROCEDURE PROCEDURE_NAME
--删除存储过程PROCEDURE_NAME，不能在一个存储过程中删除另一个存储过程，只能调用另一个存储过程
SHOW PROCEDURE STATUS
--显示数据库中所有存储的存储过程基本信息，包括所属数据库，存储过程名称，创建时间等
SHOW CREATE PROCEDURE PROCEDURE_NAME
--显示存储过程PROCEDURE_NAME的详细信息
EXEC SP_HELPTEXT PROCEDURE_NAME
--显示你这个PROCEDURE_NAME这个对象创建文本


-------------------- 存储过程&声明变量&执行函数--------------------
CREATE  PROCEDURE  FACTORIAL  --创建存储过程,简写PROC亦可
@M INT
AS
BEGIN--BEGIN  END 为一组
	DECLARE
		@N INT,@L INT --DECLARE：声明变量@N @L
	SELECT
		@N = 1,@L = 1
	WHILE
			@N <@M BEGIN
				SET @L =@L *@N --相乘
				SET @N =@N + 1
			END PRINT @L --PRINT 打印
		END

EXEC FACTORIAL 2  --执行函数(EXEC)  函数名(FACTORIAL)  @M的值为(2)


--------------------SET & SELECT  区别-------------------

-- (错误的)表达式<返回多个值>时，使用 SET 赋值
USE MYDB
DECLARE @NAME VARCHAR(128)
SET @NAME=(SELECT NAME FROM INFO)
PRINT @NAME

--出错信息为
--服务器: 消息 512，级别 16，状态 1，行 2
--子查询返回的值多于一个。当子查询跟随在=、!=、<、<=、>、>=之后，或子查询用作表达式时，这种情况是不允许的。


--表达式<返回多个值>时，使用 SELECT 赋值
USE MYDB
DECLARE @NAME VARCHAR(20)
SELECT @NAME= NAME FROM INFO
PRINT @NAME --结果集中最后一个 USERNAME 列的值
--结果 老六


--表达式<未返回值>时，使用 SET 赋值
USE MYDB
DECLARE @NAME VARCHAR(20)
SET @NAME='JACK'
SET @NAME= (SELECT NAME FROM INFO WHERE NAME='NOT')
PRINT @NAME  --NULL值
--结果 NULL

--表达式<未返回值>时，使用 SELECT 赋值
USE MYDB
DECLARE @NAME VARCHAR(20)
SET @NAME='JACK'
SELECT @NAME=NAME FROM INFO WHERE  NAME='张三'
PRINT @NAME  --JACK,保存原来的值
--结果 JACK
**/

--<------------------------------<---MYSQL--->------------------------------>--
/**
--多字段排序 必须同时加DESC/ASC或者同时不加

SELECT
	C.ID AS '课程ID' ,
	C.NAME AS '课程NAME',
	MAX(SC.SCORE ) 最高分,
	MIN(SC.SCORE)最低分,
	AVG(SC.SCORE) 平均分,
	#SUM(CASE WHEN SC.SCORE>='60' THEN 1 ELSE 0 END ) 及格人数,
	COUNT(SC.SCORE) 选修人数,
	CONCAT(ROUND((SUM(CASE WHEN SC.SCORE>='60' THEN 1 ELSE 0 END ) /COUNT(SC.SCORE)*100),2),'%') 及格率,
	CONCAT(ROUND((SUM(CASE WHEN SC.SCORE>='70' AND SC.SCORE<'80'  THEN 1 ELSE 0 END ) /COUNT(SC.SCORE)*100),2),'%') 中等率,
	CONCAT(ROUND((SUM(CASE WHEN SC.SCORE>='80' AND SC.SCORE<'90'  THEN 1 ELSE 0 END ) /COUNT(SC.SCORE)*100),2),'%') 优良率,
	CONCAT(ROUND((SUM(CASE WHEN SC.SCORE>='90' THEN 1 ELSE 0 END ) /COUNT(SC.SCORE)*100),2),'%') 优秀率
FROM COURSE C
LEFT JOIN SC ON C.ID=SC.C_ID
GROUP BY C.ID,C.NAME
ORDER BY COUNT(SC.SCORE) DESC ,C.ID ASC



--mysql 成绩前三 TOP 3

SELECT T1.*,T2.S_ID,T2.SCORE
FROM  SC T1
LEFT JOIN (SELECT DISTINCT S_ID, SCORE FROM SC) T2 ON T1.S_ID = T2.S_ID AND T1.SCORE < T2.SCORE
GROUP BY T1.C_ID,T1.S_ID,T1.SCORE,T2.S_ID,T2.SCORE
HAVING	COUNT(T1.SCORE) < 3
ORDER BY T1.S_ID,T1.SCORE DESC
**/