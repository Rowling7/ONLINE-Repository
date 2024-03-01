delimiter $$
drop procedure if exists get_count_by_limit_total_salary;
drop table if exists detail_salary;
create table detail_salary  (  id int(8)  null , salary double null default null);
create procedure get_count_by_limit_total_salary(in limit_total_salary double,out total_count int)

begin
	declare sum_salary double default 0; #��¼�ۼӵ��ܹ���
	declare cursor_salary double default 0; #��¼ĳһ������ֵ
	declare emp_count int default 0; #��¼ѭ������
	declare employees_id int ;

	#�����α�
	declare emp_cursor cursor for select employee_id,salary from employees order by salary desc;

	#���α�
	open emp_cursor;

	repeat
		#ʹ���α꣨���α��л�ȡ���ݣ�
		fetch emp_cursor into employees_id,cursor_salary;

		set sum_salary = sum_salary + cursor_salary;
		set emp_count = emp_count + 1;
		insert into  detail_salary(id,salary) values (employees_id,cursor_salary);

		until sum_salary >= limit_total_salary

	end repeat;

	set total_count = emp_count;

	#�ر��α�
	close emp_cursor;

end$$
delimiter ;


call get_count_by_limit_total_salary(300000,@total_count);
select @total_count ;
select *from detail_salary order by salary desc ;

drop table detail_salary;


