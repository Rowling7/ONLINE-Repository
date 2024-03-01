mklink /H "E:\Documents\Navicat\MySQL\Servers\Localhost\test\����SQL.sql" "E:\Documents\VSCode Files\0.NOTE\MYSQL\����SQL.sql"

-- ��ѯ�������������ݿ�
SELECT TABLE_NAME AS ����,table_schema AS ����
FROM information_schema.TABLES
WHERE TABLE_NAME LIKE '%S01%';

-- ����һ�δ������ݰ��Ĺ����������������ݰ���С
set global max_allowed_packet=1024*1024*1*20;
show global variables like 'max_allowed_packet';

-- �鿴�Ƿ���ȫ����־
SHOW VARIABLES LIKE "general_log%";-- ����ȫ����־
SET GLOBAL general_log = 'ON';
SET GLOBAL general_log = 'OFF';


-- ��ѯ����
select table_name,column_name,data_type,column_comment
from information_schema.columns
where column_name like 'A0102%' AND column_name like 'A0102A%' and table_schema = 'oydhrp_hb';

-- �鿴���ע�� comment
SELECT table_name, table_comment
FROM information_schema.tables
WHERE table_schema = 'oydhrp_hb'

-- �鿴���� columns ��ע�� comment
SELECT table_name,column_name, column_comment
FROM information_schema.columns
WHERE table_schema = 'oydhrp_hb'
ORDER BY table_name,column_name


-- sql_mode
select @@global.sql_mode

-- ����
#1�������������(PRIMARY KEY)
ALTER TABLE table_name ADD PRIMARY KEY ( column)
#2�������ͨ����(INDEX)
ALTER TABLE table_name ADD INDEX index_name ( column )
#3�����Ψһ����(UNIQUE)
ALTER TABLE table_name ADD UNIQUE (column)
#4�����ȫ������(FULLTEXT)
ALTER TABLE table_name ADD FULLTEXT ( column)
#5����Ӹ�������
ALTER TABLE table_name ADD INDEX index_name ( column1, column2, column3 )
#6��ɾ������
DROP INDEX index_name ON table

-- backup
mysqldump -u root -p --databases  oydhrp_hb >f:\oydhrp_hb.sql
mysql -u root -p test < f:\oydhrp_hb.sql


-- PROCEDURE
-- ����
DELIMITER $$ -- ָ��������
CREATE PROCEDURE  P1()
BEGIN

SELECT  * FROM A50 LIMIT 10 ;

END $$
DELIMITER ;

-- ����
CALL P1;
-- ��ѯ
SHOW CREATE PROCEDURE P1;
-- ɾ��
DROP PROCEDURE IF EXISTS P1;


-- ��ʼ��DATE
-- mysqld --initialize --console
-- ж�ط���
-- mysqld  --remove MYSQL
-- ע�ᰲװ����
-- mysqld  --install MYSQL
-- ����
-- net start MYSQL
-- �ر�
-- net stop MYSQL