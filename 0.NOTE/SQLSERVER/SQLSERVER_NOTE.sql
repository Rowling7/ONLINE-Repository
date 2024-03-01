--<------------------------------<---SQLSERVER--->------------------------------>--
--/**
--<------------------------------<---NEW--->------------------------------>--

-- sqlִ��˳������
/*
where����������ִ��˳��
	1.mysql��sqlserver ��������ִ��
	2.oracle ��������ִ��
	tips��ɸѡ������Խ���������Խ�ŵ�ǰ��ִ�У�����������ݿ��ѯЧ��
	tips�������ʱ��mysql���Զ�ѡ�����ŵ�ִ��˳�򣬵�����ʱ��mysql�����������ŵ�ִ��˳�򣬾���Ҫ�����Լ��ж����ֹ������š�
*/

-- '' ��null ������
/*
	''�ǳ���Ϊ0 ��һ���ַ�������һ��ȷ����ֵ��null��һ����ֵ�����޷�ȷ����
*/
--PARTITION BY
--GROUP BY�Ƿ��麯����PARTITION BY�Ƿ���������SUM()���ǾۺϺ���
SELECT RANK()  OVER( PARTITION BY UID ORDER BY AGE DESC ) ,UID,AGE,ID
FROM INFO

--�����
--�п�
	where nullif(a0103,'') is null
--where ����
	where AND A0102 LIKE '#A0102#%' AND A0102 LIKE '#GLDW#%'
--���Ҹ��ٹ�·��ʡ�����ٹ�·�����ѵ���
	--k0304�����ȼ�-10������
	WHERE len(ltrim(rtrim(k0101)))<=9 and k0304='10'
--�������ͳ��
	--K0123���Ƕ�ͷ·��K0124û���ظ�·��
	where isnull(k0123,'2')='2' and nullif(k0124,'') is null

/*  */
update dz0101 set objjc=REPLACE(RTRIM(OBJJC), CHAR(10), '') 
--ȥ�����з�
update dz0101 set objjc=REPLACE(RTRIM(OBJJC), CHAR(13), '') 
--ȥ���س���


--<------------------------------<---SQL 0.1.1--->------------------------------>--

--WAITFOR  ֱ�����趨�ĵȴ�ʱ���ѹ������趨��ʱ���ѵ��ż�������ִ��
WAITFOR DELAY '00:00:03' --'00:00:03' �̶���ʽ���ȴ�3���ִ��
WAITFOR TIME  '16:02:50'	  --'16:02:50'	�̶���ʽ���ȵ�16ʱ02��50�뿪ʼִ��
SELECT * FROM INFO

--��ѯ SQL ���ִ��ʱ��
SET STATISTICS PROFILE ON;
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO
--���SQL�ű���ʼ
--WAITFOR DELAY '00:00:03'
--WAITFOR TIME  '16:52:20'
SELECT * FROM INFO
--���SQL�ű�����
GO
SET STATISTICS PROFILE OFF;
SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;

-- �鿴���ݿ�汾
SELECT @@VERSION


--<------------------------------<---SQL 0.1.2--->------------------------------>--

--ALL
SELECT * FROM DBO.INFO

--DISTINCT DISTINCT�ظ�ֻ��ʾһ��
SELECT DISTINCT NAME FROM DBO.INFO

--INSERT
INSERT DBO.INFO VALUES ('20','LILU','','HUNAN')

--UPDATE
UPDATE DBO.INFO SET ID=3 WHERE ID =10
		--�������
UPDATE  t01	SET T01.A6102 = A61.A6102
FROM T01
LEFT JOIN  A61 ON T01.Z0001 = A61.Z0001

---<TRUNCATE & DELETE >---
--DELETE ɾ�����е����ݿ���WHERE ����DML���ɻع�
DELETE FROM DBO.INFO WHERE ID =20
--TRUNCATE TABLE ɾ�����е������е��ǽṹ��Լ������������ɾ�������ؽ���
	--���������Զ�����ֵ��������WHERE��Ч�ʸ���DELETE
	--����DDL �����ɻع�
TRUNCATE TABLE K60

--TOP
SELECT TOP 60 PERCENT (NAME) ,ID,ADDRESS FROM DBO.INFO

--LIKE ��ͷ%����%��β
SELECT * FROM DBO.INFO
WHERE NAME  LIKE '%��%'

--[]
SELECT * FROM DBO.INFO
WHERE NAME LIKE '%[������]%'

--IN ���� ѡ���������
SELECT *FROM DBO.INFO
WHERE NAME IN ('����','����')

--BETWEEN
SELECT * FROM DBO.INFO
WHERE ID
BETWEEN '3' AND '15'

--UNION �ڲ��� SELECT ������ӵ����ͬ�������С���Ҳ����ӵ�����Ƶ��������͡�
--ͬʱ��ÿ�� SELECT ����е��е�˳�������ͬ��
--���Ͻ����������������һ��������������ж����ڵ������
SELECT * FROM INFO
UNION
SELECT * FROM INFO_COPY1

--CREATE
CREATE DATABASE INFOBACKUP

--INTO
SELECT *
INTO DBO.INFOBACKUP
FROM DBO.INFO

--��ձ������
TRUNCATE TABLE DBO.TMPTABLE

--ALTER
ALTER TABLE TABLE_NAME
DROP(ADD) COLUMN COLUMN_NAME

ALTER TABLE DBO.INFO
ALTER COLUMN ID AUTO_INCREMENT

--AUTO-INCREMENT �����¼�¼�������ʱ����һ��Ψһ�����֡�
--P_ID INT NOT NULL AUTO_INCREMENT

--ISNULL
SELECT NAME,AGE*(AGE+ISNULL(AGE,0)) AS AGE
FROM DBO.INFO

--MID/SUBSTRING ��ȡ�ַ�
SELECT SUBSTRING(NAME,1,1) AS FNAME FROM DBO.INFO

--LEN ���س���
SELECT LEN(NAME)AS ���� FROM DBO.INFO

--ROUND�������� DECIMALS λ��
SELECT ROUND(AGE,0) FROM DBO.INFO

--GETDATE()/NOW() ��ȡ��ǰʱ��
SELECT *,GETDATE()AS ��ǰʱ�� FROM DBO.INFO

--FORMAT ��ʽ����ʾ�ֶ�
SELECT *, FORMAT(NOW(),'YYYY-MM-DD') AS PERDATE
FROM DBO.INFO

--CONVERT(SQLSERVER��)��ʽ����ʾ�ֶ�
SELECT CONVERT(VARCHAR(12) , GETDATE(), 111 ) AS ����
--2023/11/08
SELECT CONVERT(VARCHAR(12) , GETDATE(), 112 ) AS ����
--20231108

--CONVERT ��CAST ����
SELECT CONVERT(VARCHAR(12) , GETDATE(), 113 ) AS ����
--08 11 2023 1
SELECT CAST( GETDATE() as VARCHAR(12) ) AS ����
--08 11 2023 1


--��ѯ���� LEN ��ѯ �ֶκ���Ŀո�������
SELECT LEN(NAME) 	LEN FROM INFO WHERE NAME LIKE 'ZZZ'
SELECT DATALENGTH(NAME) DATALENGTH FROM INFO WHERE  NAME LIKE 'ZZZ'

--CI ָ�������ִ�Сд��CS ָ�����ִ�Сд
--CHARINDEX �ҵ��ַ���CHAR����λ�ã�INDEX��  ȫƥ��
SELECT CHARINDEX('TEST','THIS TEST IS TEST') --6
SELECT CHARINDEX('TEST','THIS TEST IS TEST',7)  --14
SELECT CHARINDEX('TEST','THIS TEST IS TEST'COLLATE LATIN1_GENERAL_CS_AS)  --14
SELECT CHARINDEX('TEST','THIS TEST IS TEST'COLLATE LATIN1_GENERAL_CI_AS)  --6

--PATINDEX �ж�һ���ַ������Ƿ������һ���ַ���  ģ��ƥ��
SELECT PATINDEX('%TER%','INTERESTING DATA')  --3
SELECT PATINDEX('%T_NG%','INTERESTING DATA')  --8
SELECT PATINDEX('%ES%','THIS TEST IS TEST' COLLATE LATIN1_GENERAL_CS_AS)  --15
SELECT PATINDEX('%T_S%','THIS TEST IS TEST'COLLATE LATIN1_GENERAL_CI_AS)  --6

--ISNULL(VALUE1,VALUE2)
        --VALUE1��VALUE2���������ͱ���һ�¡�
        --���VALUE1��ֵ��ΪNULL���������VALUE1��
        --���VALUE1ΪNULL���������VAULE2��ֵ��VAULE2�����趨��ֵ��
USE [MYDB]
SELECT *,[����ֵ]=ISNULL(AGE,'999')
FROM INFO
WHERE ISNULL(AGE,'0')='0'

--REPLACE �� STUFF ��ִ�����ַ����滻
--REPLACE ������ֵ�������ַ�����STUFF ���ַ���λ�úͳ����������ַ���

--REPLACE(string_expression, string_pattern, string_replacement)
		--REPLACE(��Ҫ���滻���ַ���-ABCXYZ����Ҫ�滻���ַ���-ABC���滻�ɵ��ַ���-������ )
SELECT	replace('ABCXYZ','ABC','������'),
		replace('ABCXYZ','XYZ','������')
FROM DBO.INFO

--STUFF(string,start,length,substring)
		--STUFF(��Ҫ���滻���ַ���,��ʼλ�ã����ȣ��滻�ɵ��ַ���)
SELECT STUFF('ABC test XYZ',4,5,'������')
--�����ABC������ XYZ
SELECT STUFF('ABC test XYZ',9,0,' (������)')
--�����ABC test (������) XYZ
SELECT STUFF('ABC test XYZ',1,0,'������')
--�����������ABC test XYZ
SELECT STUFF('ABC test XYZ',4,5,'')
--�����ABC XYZ

-- NULLIF:����������ʽ������ͬ��ֵ���򷵻� NULL �ĺ��������򷵻�EXPRESSION1��
--NULLIF(EXPRESSION1,EXPRESSION2)
SELECT 	NAME ,LEFT(NAME,1),FIRSTNAME,
		NULLIF(LEFT(NAME,1), FIRSTNAME) AS 'NULLIF'
FROM INFO

--�����ݿ��ARTICLE�е�����TITLE�ֶ����SCHOOL�ַ����滻��HELLO��
UPDATE A SET AGE=REPLACE(AGE,'1','37');

-- ROUND()�������� ROUND��P1,P2,P3��;P1�������� P2 С����λ��	P3��0/1��0�������� 1�ض�
-- NUMERIC() NUMERIC��18��0���ܵ�λ��Ϊ18λ���֣�С������λ��Ϊ0λ��
SELECT	NUMBER ԭ����,
		ROUND(NUMBER,1,0) ��������,
		ROUND(NUMBER,2,1) �ض�,
		CAST(NUMBER  AS NUMERIC(8,0)) ��С��,
		CAST(NUMBER  AS NUMERIC(8,3)) ��λС��
FROM INFO

--ISDATA() ����ֵ 1�� 0��
SELECT 	TEN , ISDATE(TEN) TEN,
		NUMBER,ISDATE(NUMBER)  NUMBER
FROM INFO

--#T ��ʱ˽�˱����������������ڼ䣬�������޷����ʣ����������ӿ��ԣ���
--##T ȫ����ʱ�������˿ɷ���
--ɾ������ȷ��ʽ
IF OBJECT_ID('TEMPDB..#T') IS NOT NULL
DROP TABLE #T

if exists(select * from tempdb..sysobjects where id=object_id('tempdb..##tk001')) DROP TABLE #T

--�жϴ洢�����Ƿ����
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'Pr_sysCheckFKForPublic')
drop procedure Pr_sysCheckFKForPublic

--CASE  WHEN   ****  THEN   ****ELSE ****  END
SELECT 	[����]=CASE WHEN LEFT(NAME,1)='��'THEN '��' ELSE '��'END,
		[����]	=SUM(1)
FROM INFO
WHERE NAME<>''
GROUP BY CASE WHEN LEFT(NAME,1)='��'THEN '��' ELSE '��'END

--��ѯ����
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'NAME'

--MXT
--UPDATE TABLENAME SET COLUMNA = COLUMNB, COLUMNB = COLUMNA
--UPDATE INFO 	SET NAME =FIRSTNAME , FIRSTNAME= NAME

--ROLLUP ��������ɵĽ���������� CUBE ��������ɵĽ������
--GROUP BY AGE  WITH CUBE


--<------------------------------<---SQL 0.1.3--->------------------------------>--

--һ���ϲ���ֵ
--1.SQL���� OUTER APPLY
--replace stuff ʵ��
SELECT * FROM
(
	SELECT INFO.NAME FROM INFO
)AS I
OUTER APPLY(
SELECT [����]= --�ϲ���ֵ
--չ��
STUFF(--�滻��һ�������,
	REPLACE(--�滻AGE=
		REPLACE(--�滻AB
			REPLACE(--�滻<
				REPLACE(--�滻/>
					REPLACE(--�滻"
						(SELECT AB.AGE  FROM
							(SELECT NAME, AGE FROM INFO --WHERE INFO.NAME='����'
								UNION SELECT NAME,AGE FROM A  --WHERE A.NAME='����'
							)AS AB
						WHERE I.NAME=AB.NAME FOR XML AUTO)
					,'"','')
				,'/>','')
			,'<',',')
		,'AB','')
	,' AGE=','')
,1,1,'')

)AS  IA
--WHERE I.NAME='����'

--2.FRO XML PTAH('  ')  ���xml���ÿձ�ǩ�ﵽ��������ֵ����Ч��
USE MYDB
SELECT LEFT(NAME, LEN(NAME) - 1) NAME --����left �ض����ұߵĶ���
FROM (SELECT DISTINCT (SELECT  NAME + ','
		FROM info
		WHERE TUID = '37'
		FOR XML PATH ( '' ) --���xml ���� ''�յı�ǩ�� +','  һͬʵ�� ��������ֵ��
    ) AS NAME) AS A


--FOR XML AUTO/PATH('')/ROW
SELECT NAME FROM INFO FOR XML AUTO
SELECT NAME+',' FROM INFO FOR XML PATH ('')
SELECT NAME FROM INFO FOR XML RAW

--------------------����--------------------
begin TRANSACTION--��ʼ����
--��ʼsql
delete  from a where id=21  ;
delete  from a where id=20  ;
delete  from a where id=19  ;
--commit  --�ύ
rollback --�ع�

SELECT * FROM A  --�м�ɲ�ѯ�����Ƿ�del


--------------------ɾ���������������--------------------
drop index oydschk_a71_07 on a71;--ɾ������

--��� ��Ψһ���Ǿۼ� ����
USE [GHRHB]
GO
--�������ƣ�oydschk_a71_07
CREATE  NONCLUSTERED INDEX [oydschk_a71_07] ON [dbo].[A71]
(
	[B0111] ASC,
	[Z0001] ASC,
	[A7101] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


--------------------�����������ؽ������ã�����--------------------
USE GHRHB
--���������﷨
ALTER INDEX oydschk_a71_07 ON DBO.A71 DISABLE
--���������﷨
ALTER INDEX oydschk_a71_07 ON DBO.A71 REBUILD


--------------------�洢����--------------------
CREATE PROCEDURE PROCEDURE_NAME
--PROCEDURE_NAMEΪ�洢������(�����԰��������ֿ�ͷ)����һ�����ݿ��д���������Ψһ�ġ����ֵĳ��Ȳ��ܳ������֡�PROCEDURE���Լ�дΪPROC��
@PARAM1 DATATYPE,@PARAM2 DATATYPE
--@PARAM1��@PARAM2Ϊ�洢���̵Ĳ�����DATATYPEΪ��������,��������ö��Ÿ���,��������������
AS
--�洢����Ҫִ�еĲ���
BEGIN
--BEGIN��END���һ������飬����дҲ���Բ�д������洢������ִ�е�SQL���Ƚϸ��ӣ���BEGIN��END���ô���������룬��������⡣
END
GO
--GO�ʹ���������ϡ���
EXEC PROCEDURE_NAME [������]
--���ô洢����PROCEDURE_NAME��
DROP PROCEDURE PROCEDURE_NAME
--ɾ���洢����PROCEDURE_NAME��������һ���洢������ɾ����һ���洢���̣�ֻ�ܵ�����һ���洢����
SHOW PROCEDURE STATUS
--��ʾ���ݿ������д洢�Ĵ洢���̻�����Ϣ�������������ݿ⣬�洢�������ƣ�����ʱ���
SHOW CREATE PROCEDURE PROCEDURE_NAME
--��ʾ�洢����PROCEDURE_NAME����ϸ��Ϣ
EXEC SP_HELPTEXT PROCEDURE_NAME
--��ʾ�����PROCEDURE_NAME������󴴽��ı�


-------------------- �洢����&��������&ִ�к���--------------------
CREATE  PROCEDURE  FACTORIAL  --�����洢����,��дPROC���
@M INT
AS
BEGIN--BEGIN  END Ϊһ��
	DECLARE
		@N INT,@L INT --DECLARE����������@N @L
	SELECT
		@N = 1,@L = 1
	WHILE
			@N <@M BEGIN
				SET @L =@L *@N --���
				SET @N =@N + 1
			END PRINT @L --PRINT ��ӡ
		END

EXEC FACTORIAL 2  --ִ�к���(EXEC)  ������(FACTORIAL)  @M��ֵΪ(2)


--------------------SET & SELECT  ����-------------------

-- (�����)���ʽ<���ض��ֵ>ʱ��ʹ�� SET ��ֵ
USE MYDB
DECLARE @NAME VARCHAR(128)
SET @NAME=(SELECT NAME FROM INFO)
PRINT @NAME

--������ϢΪ
--������: ��Ϣ 512������ 16��״̬ 1���� 2
--�Ӳ�ѯ���ص�ֵ����һ�������Ӳ�ѯ������=��!=��<��<=��>��>=֮�󣬻��Ӳ�ѯ�������ʽʱ����������ǲ�����ġ�


--���ʽ<���ض��ֵ>ʱ��ʹ�� SELECT ��ֵ
USE MYDB
DECLARE @NAME VARCHAR(20)
SELECT @NAME= NAME FROM INFO
PRINT @NAME --����������һ�� USERNAME �е�ֵ
--��� ����


--���ʽ<δ����ֵ>ʱ��ʹ�� SET ��ֵ
USE MYDB
DECLARE @NAME VARCHAR(20)
SET @NAME='JACK'
SET @NAME= (SELECT NAME FROM INFO WHERE NAME='NOT')
PRINT @NAME  --NULLֵ
--��� NULL

--���ʽ<δ����ֵ>ʱ��ʹ�� SELECT ��ֵ
USE MYDB
DECLARE @NAME VARCHAR(20)
SET @NAME='JACK'
SELECT @NAME=NAME FROM INFO WHERE  NAME='����'
PRINT @NAME  --JACK,����ԭ����ֵ
--��� JACK
**/

--<------------------------------<---MYSQL--->------------------------------>--
/**
--���ֶ����� ����ͬʱ��DESC/ASC����ͬʱ����

SELECT
	C.ID AS '�γ�ID' ,
	C.NAME AS '�γ�NAME',
	MAX(SC.SCORE ) ��߷�,
	MIN(SC.SCORE)��ͷ�,
	AVG(SC.SCORE) ƽ����,
	#SUM(CASE WHEN SC.SCORE>='60' THEN 1 ELSE 0 END ) ��������,
	COUNT(SC.SCORE) ѡ������,
	CONCAT(ROUND((SUM(CASE WHEN SC.SCORE>='60' THEN 1 ELSE 0 END ) /COUNT(SC.SCORE)*100),2),'%') ������,
	CONCAT(ROUND((SUM(CASE WHEN SC.SCORE>='70' AND SC.SCORE<'80'  THEN 1 ELSE 0 END ) /COUNT(SC.SCORE)*100),2),'%') �е���,
	CONCAT(ROUND((SUM(CASE WHEN SC.SCORE>='80' AND SC.SCORE<'90'  THEN 1 ELSE 0 END ) /COUNT(SC.SCORE)*100),2),'%') ������,
	CONCAT(ROUND((SUM(CASE WHEN SC.SCORE>='90' THEN 1 ELSE 0 END ) /COUNT(SC.SCORE)*100),2),'%') ������
FROM COURSE C
LEFT JOIN SC ON C.ID=SC.C_ID
GROUP BY C.ID,C.NAME
ORDER BY COUNT(SC.SCORE) DESC ,C.ID ASC



--mysql �ɼ�ǰ�� TOP 3

SELECT T1.*,T2.S_ID,T2.SCORE
FROM  SC T1
LEFT JOIN (SELECT DISTINCT S_ID, SCORE FROM SC) T2 ON T1.S_ID = T2.S_ID AND T1.SCORE < T2.SCORE
GROUP BY T1.C_ID,T1.S_ID,T1.SCORE,T2.S_ID,T2.SCORE
HAVING	COUNT(T1.SCORE) < 3
ORDER BY T1.S_ID,T1.SCORE DESC
**/