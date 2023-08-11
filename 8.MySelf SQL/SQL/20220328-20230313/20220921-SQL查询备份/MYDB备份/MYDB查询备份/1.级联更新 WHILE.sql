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