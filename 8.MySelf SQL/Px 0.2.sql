-- P1 SELECT 结果
delimiter $$
drop procedure if exists p1;
create procedure p1 ( in num int ) 
begin
	declare result int default 0;
	
	while num > 0 do
			
		set result := result + num;
		set num := num - 1;
		
	end while;
	select result;
	
end $$
delimiter ;

call p1(100);

-- P2 OUT 结果
delimiter $$
drop procedure if exists p2;
create procedure p2(in num int, out result int)

BEGIN
	SET result := 0;
	
	WHILE num > 0 DO
			
		SET result := result + num;
		SET num := num - 1;
		
	END WHILE;
	
END $$
delimiter ;

call p2(100,@result);
select @result;


-- P3 repeat 循环 until 条件退出循环
delimiter $$
drop procedure if exists p3;
create procedure p3(in num int, out result int)

BEGIN
  set result =0;
  
  REPEAT
	set result:=result+num;
	set num:=num-1;
	
	UNTIL num<=0
	
 END REPEAT;
 END $$
delimiter ;
 
 call p3(100,@result);
 SELECT @result;


-- P4 loop 循环 leave <loop> 推出LOOP
delimiter $$
drop procedure if exists p4;
create procedure p4( in num int ,out result int )

begin 
	set result :=0;
	
	sum:LOOP
	IF num<=0 THEN
		LEAVE sum; 
	END IF; 
	
	set result := result+num;
	set num := num-1;
	
END LOOP sum;

end $$
delimiter ;

call p4(100,@result);
SELECT @result;





