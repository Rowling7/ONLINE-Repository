mklink /H "E:\Documents\Navicat\MySQL\Servers\Localhost\test\报表SQL.sql" "E:\Documents\VSCode Files\0.NOTE\MYSQL\报表SQL.sql" 

-- 调整一次传送数据包的过程中最大允许的数据包大小
set global max_allowed_packet=1024*1024*1*20;
show global variables like 'max_allowed_packet';

-- 查看是否开启全局日志
SHOW VARIABLES LIKE "general_log%";-- 开启全局日志
SET GLOBAL general_log = 'ON';
SET GLOBAL general_log = 'OFF';


-- 查询列名
select table_name,column_name,data_type,column_comment
from information_schema.columns
where column_name like 'A0102%' AND column_name like 'A0102A%' and table_schema = 'oydhrp_hb';

-- 查看表的注释 comment
SELECT table_name, table_comment
FROM information_schema.tables
WHERE table_schema = 'oydhrp_hb'

-- 查看表中 columns 的注释 comment
SELECT table_name,column_name, column_comment
FROM information_schema.columns
WHERE table_schema = 'oydhrp_hb'
ORDER BY table_name,column_name


-- sql_mode
select @@global.sql_mode

-- 索引
#1、添加主键索引(PRIMARY KEY)
ALTER TABLE table_name ADD PRIMARY KEY ( column)
#2、添加普通索引(INDEX)
ALTER TABLE table_name ADD INDEX index_name ( column )
#3、添加唯一索引(UNIQUE)
ALTER TABLE table_name ADD UNIQUE (column)
#4、添加全文索引(FULLTEXT)
ALTER TABLE table_name ADD FULLTEXT ( column)
#5、添加复合索引
ALTER TABLE table_name ADD INDEX index_name ( column1, column2, column3 )
#6、删除索引
DROP INDEX index_name ON table

-- backup
mysqldump -u root -p --databases  oydhrp_hb >f:\oydhrp_hb.sql
mysql -u root -p test < f:\oydhrp_hb.sql


-- PROCEDURE
-- 创建
DELIMITER $$ -- 指定结束符
CREATE PROCEDURE  P1()
BEGIN

SELECT  * FROM A50 LIMIT 10 ;

END $$
DELIMITER ;

-- 调用
CALL P1;
-- 查询
SHOW CREATE PROCEDURE P1;
-- 删除
DROP PROCEDURE IF EXISTS P1;

