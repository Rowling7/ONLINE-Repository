ALTER PROCEDURE [FACTORIAL] @M INT AS BEGIN
	IF
		( @M <= 10 ) BEGIN
		DECLARE
			@N INT,@L INT SELECT
			@N = 1,@L = 1
		WHILE
				@N <@M BEGIN
					
					SET @N =@N + 1 
					SET @L =@L *@N 
				END PRINT @L 
			END ELSE BEGIN
				PRINT '输入值必须小于等于10' 
		END 
END