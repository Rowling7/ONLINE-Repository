--附加数据库
EXEC sp_attach_db @dbname = N'NCGL422022',
@filename1 = N'F:\6078曹勇嵩\1.工作文件\2.工作文件\1.湖北2022年农村公路标准库\20230315\NCGL422022-15\NCGL422022.MDF'

--附加数据库
CREATE DATABASE NCGL422022
    ON (FILENAME = 'F:\6078曹勇嵩\1.工作文件\2.工作文件\1.湖北2022年农村公路标准库\20230315\NCGL422022-15\NCGL422022.MDF')
    FOR ATTACH;


--备份数据库
backup database [NCGL422022] to disk ='F:\6078曹勇嵩\1.工作文件\2.工作文件\1.湖北2022年农村公路标准库\20230315\NCGL422022_05版0315-1'

--分离数据库
EXEC sp_detach_db 'NCGL422022', 'true'


--将原本的NCGL422022.MDF(已升级完)复制一份,改名称后发送
