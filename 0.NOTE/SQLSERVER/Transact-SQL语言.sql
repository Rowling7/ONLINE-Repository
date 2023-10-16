Transact-SQL是SQL Server的编程语言，结构化查询语言(SQL)的增强版本。
Transact-SQL的组成元素：
数据控制语言语句：安全性管理，通过GRANT、REVOKE、DENY语句来确保数据库中的数据和操作不能被未授权的用户使用。
数据定义语言语句：通过CREATE、ALTER、DROP语句来执行数据库的任务、创建数据库以及数据库中的对象，如数据库、表、规则、视图、存储过程、函数等。
数据操纵语言语句：通过INSERT、DELETE、SELECT、UPDATE来对数据库中的各个对象的数据进行增删查改。
附加的语法与流程控制：为了数据库编程而增加的语句元素，包括：
批处理命令
注释
标识符
数据类型
常量
变量
函数
运算符
表达式
流程控制的语言元素
游标
一、批处理命令
　　批处理是指包含一条或多条T-SQL语句的语句组，这组语句从应用程序一次性地发送到SQL服务器中编译形成一个可执行单元，称为执行计划。GO命令表示批处理的结束。如果在T-SQL脚本中没有GO命令，那么它将被作为单个批处理来执行。
　　注意：
　　一个批处理如果其中有一个语法错误，那么整个批处理都无法通过编译，不会执行。
　　不能在批处理中引用其它批处理中所定义的变量。
　　批处理中可以包含多个存储过程，但是除第一个过程外，其他的存储过程前面都必须使用EXECTUE关键字。
　　用户必须遵照使用批处理的规则.例如,在同一批处理中,创建数据库之后不能直接使用其新建的数据库.局部（用户定义）变量的作用域限制在一个批处理中,不可在 GO 命令后引用.
　　关于批处理
　　批处理中的错误分为以下两类：1、语法错误2、运行时错误
　　语法错误，一般在执行前使用分析就可以查出：如果查询分析器发现一个语法错误，那么批处理的处理过程会被立即取消。因为语法检查发生在批处理编译或者执行之前，所以在语法检查期间的一个失败意味着还没有批处理被执行-不管语法错误发生在批处理中的什么位置；
　　运行时错误的工作方式有很大不同，这种情况分析是不会报错的，只有在运行的过程中遇到错误才会终止，因为任何在遇到运行时错误之前执行的语句已经完成了，所以除非是未提交事务的一部分，否则这些语句所做的任何事情都已经是现实了。
　　一般而言，运行时错误将终止从错误发生的地方到此批处理末端的批处理的执行。下一个批处理不影响。
　　https://www.cnblogs.com/shadow-ccos/p/5176186.html
二、注释
　　一种是ANSI标准的注释符“--”，它用于单行注释；另一种是与C语言相同的注释符号，即“/* */”。
三、标识符
　　1. 标准标识符：
　　　　第一个字符必须是字母（a~z 或 A~Z），第一个字符后可以是数字、字母或各种符号
　　2. 特殊标识符：当标识符的第一个字符是符号时，代表它有特殊用处
　　　　以@开头的标识符代表局部变量或参数
　　　　以@@开头的标识符代表全局变量或参数
　　　　以#开头的标识符代表临时表或存储过程
　　　　以##开头的标识符代表一个全局临时对象
　　3. 限定标识符：当对象名称包含空格时 或 当保留关键字被用作对象名或对象部分的名字时，
　　　　用中括号表示的括号标识符（[ ]）或 用双引号表示的引用标识符（“ ”）
　　命名规则：
使用短的名字
尽量使用有意义的名字
使用能够区分出对象类型的标识符
　　　　
四、数据类型
 　　1. 系统数据类型
　　　　数字型：int、tinyint、smallint、bigint等
　　　　日期型：datatime、smalldatetime等
　　　　二进制型：binary、varbinary
　　　　字符型：char、nchar、varchar、nvarchar
　　　　游标：用于存储过程的编程中，也会和底层客户接口同时使用，不用于数据定义语言中
　　　　GUID
　　　　图像文本
　　　　表
　　2. 自定义数据类型
　　　　利用系统存储过程定义用户自定义数据类型：
　　　　　　Sp_addtype [@typename=] 新数据类型名,
　　　　　　[@phystype=] 系统数据类型名
　　　　　　[,[@nulltype=] null_type]
　　　　　　[,[@owner=] owner_name]
　　　　　　系统数据类型名除了int、bigint、smallint、datetime等，其余必须用单括号括起来；null_type指新数据类型处理空值的方式，，默认为null；owner_name指新数据类型的所有者，默认当前用户
五、常量
　　是表示一个特定数据值的符号，在运行时不会改变的量。格式取决于表示的值的数据类型。
六、变量
　　局部变量：用户自己使用DECLARE语句定义，名字前要有一个标记符‘@’，赋值用SET或SELECT语句（SET只能对单个变量赋值，SELECT可以多个）
DECLARE @var1 varchar(20),@var2 varchar(40)
SET  @var1='中国'   /*一个SET语句只能给一个变量赋值*/
SET  @var2=@var1+'是一个伟大的国家'
select   @var1,@var2  --局部变量值得显示
　　全局变量：系统提供的变量，前要有两个标记符‘@@’。用户不能创建全局变量，只能使用系统提供的全局变量。
　　一些常用的全局变量：
　　　　@@CONNECTIONS：返回自上次启动SQL Server以来连接或试图连接的次数。
　　　　@@MAX_CONNECTIONS：返回SQL Server上允许的同时用户连接的最大数。
　　　　@@ERROR：返回最后执行的 T-SQL 语句的错误代码。
　　　　@@TRANCOUNT：返回当前连接的活动事务数。
　　　　@@VERSION：返回 SQL Server 当前安装的日期、版本和处理器类型。
　　　　@@SERVERNAME：返回运行 SQL Server 的本地服务器名称。
　　　　@@SERVICENAME：返回 SQL Server 正在其下运行的注册表键名。若当前实例为默认实例，则返回MSSQLServer；若当前实例是命名实例，则该函数返回实例名。
　　　　@@SPID：返回当前用户进程的服务器进程标识符 (ID)。
　　　　@@ROWCOUNT：返回受上一语句影响的行数。
　　　　@@NESTLEVEL：返回当前存储过程执行的嵌套层次(初始值为0)。
　　　　@@LANGUAGE：返回当前使用的语言名。
　　　　@@OPTIONS：返回当前 SET 选项的信息。
　　　　@@CPU_BUSY：返回自上次启动 SQL Server 以来 CPU 的工作时间,单位为毫秒(基于系统计时器的分辨率)。
　　　　@@IDLE：返回 SQL Server 自上次启动后闲置的时间，单位为毫秒(基于系统计时器的分辨率)。
　　　　@@IDENTITY：返回最后插入的标识值。
　　　　INSERT INTO jobs (job_desc,min_lvl,max_lvl) VALUES ('Accountant',12,125) SELECT @@IDENTITY AS 'Identity'
七、函数
　　(图像)（图片转自：http://www.cnblogs.com/jack-liang/archive/2011/03/25/1995466.html）
　　1. 字符串函数：
　　（1）基本字符串函数:UPPER、LOWER、SPACE、REPLICATE、STUFF、REVERSE、LTRIM、RTRIM。
　　（2)  字符串查找函数:CHARINDEX、PATINDEX。
　　  (3)  长度和分析函数:DATALENGTH、 RIGHT 、SUBSTRING。
　　  (4)  转换函数:ASCH、CHAR、STR、SOUNDEX 、 DIFFERENCE。
　　2. 日期与时间函数：
　　先上数据类型及格式如下：
　　(图像)
　　(1) GETDATE()：返回当前系统日期和时间
　　(2) DAY()：返回代表指定日期的天的日期部分的整数
　　(3) MONTH()：返回指定日期的月份的整数
　　(4) YEAR()：返回指定日期的年份的整数
　　(5) DATEADD()功能:返回一个日期加上一个指定时间间隔数后时间
　　　　SELECT DATEADD(year,1,getdate())
　　(6) DATEDIFF()功能:返回两个指定日期间时间间隔
　　　　SELECT datediff(y,’2006-1-1’,getdate())
　　(7) DATENAME()功能:返回指定日期的指定部分的字符串形式表示
　　　　SELECT datename(year,getdate())
　　(8) DATEPART()功能:返回指定日期的指定部分的整数形式表示
　　3. 数学函数：
　　(1) FLOOR()功能:返回小于或等于所给数字表达式的最大整数 。
　　　　语法 : FLOOR (numeric_expression)
　　　　举例: SELECT FLOOR(123.45), FLOOR(-123.45), FLOOR($123.45)
　　(2) ROUND()功能:返回数字表达式并四舍五入为指定的长度或精度 。
　　　　语法: ROUND(numeric_expression,length[,function ] )
　　　　举例: SELECT ROUND(123.9994, 3)
　　(3) POWER()功能:返回给定表达式乘指定次方的值。
　　　　语法 : POWER(numeric_expression,y)
　　(4) RAND()功能:返回0到1之间的随机FLOAT值。
　　　　语法 : RAND (seed)
 　　4. 转换函数：
　　(1) CAST()
　　　　语法：CAST(expression AS data_type)
　　　　AS之前是要转换的数据，之后是要转换的数据类型
/*CAST()函数的参数是一个表达式，它包括用AS关键字分隔的源值和目标数据类型。以下例子用于将文本字符串'123'转换为整型:*/
SELECT CAST('123' AS int)
/*返回值是整型值123。*/

/*如果试图将一个代表小数的字符串转换为整型值，又会出现什么情况呢？*/
SELECT CAST('123.4' AS int)
/*CAST()函数和CONVERT()函数都不能执行四舍五入或截断操作。由于123.4不能用int数据类型来表示，所以对这个函数调用将产生错误*/

/*要返回一个合法的数值，就必须使用能处理这个值的数据类型。对于这个例子，存在多个可用的数据类型。如果通过CAST()函数将这个值转换为decimal类型，需要首先定义decimal值的精度与小数位数。在本例中，精度与小数位数分别为9与2。精度是总的数字位数，包括小数点左边和右边位数的总和。而小数位数是小数点右边的位数。这表示本例能够支持的最大的整数值是9999999，而最小的小数是0.01。*/
SELECT CAST('123.4' AS decimal(9,2))
/*decimal数据类型在结果网格中将显示有效小数位:123.40*/

/*精度和小数位数的默认值分别是18与0。如果在decimal类型中不提供这两个值，SQL Server将截断数字的小数部分，而不会产生错误。*/
SELECT CAST('123.4' AS decimal)
/*结果是一个整数值：123*/
　　(2) CONVERT()
　　　　语法：CONVERT(data_type[(length)],expression)
　　　　用法和CAST()相同
　　5. 聚合函数
　　　　对一组值执行计算并返回单一的值，除COUNT()函数之外，聚合函数忽略空值。
　　　　包括：AVG()、COUNT()、MAX()、MIN()、SUM()
八、运算符
　　(图像)
九、表达式
　　各个符号和运算符的组合，表达式的结果的数据类型由表达式中的成员决定。
十、流程控制
　　(图像)
/*计算1～100之间所有能被7整除的数的总和。*/
DECLARE @sum INT , @i INT
SET @sum=0
SET @i=1
WHILE @i<=100
    BEGIN
        IF @i%7=0
            SET @sum+=@i
        SET @i+=1
    END
PRINT @sum;
/*CASE..END的使用*/
SELECT '学号'=Sno, '课程号'=Cno,
  '等级'=
    CASE
       WHEN Grade<60 THEN '不及格'
       WHEN Grade BETWEEN 60 AND 69 THEN '差'
       WHEN Grade BETWEEN 70 AND 79 THEN '中'
       WHEN Grade BETWEEN 80 AND 89 THEN '良'
       ElSE '优'
    END
FROM SC;