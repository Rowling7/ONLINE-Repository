--WHILE��������
ALTER PROCEDURE [WHILE��������]
AS

declare @temp_id INT,@temp_name varchar(15),@temp_age int
BEGIN
SET NOCOUNT ON;
--������ʱ��
CREATE TABLE #tempTable
(
tempID int identity(1,1),
name VARCHAR(15),
age int,
id INT,
)
insert into #tempTable(name,age,id)
SELECT name,age,id  FROM B

DECLARE @TOTAL_COUNT INT,--��ʱ���¼����
		@NOW_COUNT INT--���ڱ�����������¼

SELECT @TOTAL_COUNT=COUNT(*) FROM #tempTable
SET @NOW_COUNT=1;
WHILE(@NOW_COUNT<=@TOTAL_COUNT)
	BEGIN
		SELECT @temp_id=id,@temp_name=name,@temp_age=age FROM #tempTable
		WHERE tempID=@NOW_COUNT --�ؼ�������
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
DROP TABLE #tempTable	--ɾ����ʱ��

END

--�α� ��������
ALTER PROCEDURE �α� ��������
	@rtn int output
AS

declare @temp_id INT ,@temp_name varchar(15),@temp_age int

BEGIN
SET NOCOUNT ON; -->SET NOCOUNT ON������

DECLARE
	@cursor_b_val CURSOR	--�����α����
DECLARE cursor_B CURSOR scroll		--������̬�α�
FOR	SELECT name,age,id FROM B;	--�����α���ܽ����
OPEN cursor_B	--���α�
fetch First from cursor_B into @temp_name,@temp_age,@temp_id --into�ı��������������α��ѯ�������������ͬ

	--0��Fetch���ɹ���
	--1��Fetch���ʧ�ܻ��в��ڽ�����С�
	--2����ȡ���в����ڡ�
	print @@FETCH_STATUS
WHILE @@FETCH_STATUS=0 --�ж�FETCH����Ƿ�ִ�гɹ�
BEGIN
	if exists(select * from A where id=@temp_id)
		begin
			update A set name=@temp_name,age=@temp_age where id=@temp_id
			set @rtn=1 --�����֤��ͬ�����ݣ����и��´���
		end
	else
			begin
			insert into A(name,id,age) values(@temp_name,@temp_id,@temp_age)
			set @rtn=2 --û����ͬ�����ݣ����в��봦��
			end
	fetch next from cursor_B into @temp_name,@temp_age,@temp_id  --�ƶ��α�
	PRINT @RTN
END
CLOSE cursor_B --�ر��α�
DEALLOCATE cursor_B; --�ͷ��α�
END