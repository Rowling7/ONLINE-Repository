--WHILE联级更新
ALTER PROCEDURE [WHILE联级更新]
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

--游标 联级更新
ALTER PROCEDURE 游标 联级更新
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