--Sql Server安装：此计算机存在相同实例名解决办法
1.停止所有与Sql Server相关的服务。
2.清除残留的安装
	使用windows install clean up进行清除所有带Sql Server的安装。
	用SrvInstw.exe删除所有SQL服务
3.清除注册表
	3.1将HKEY_CURRENT_USER—Software—-Microsoft下的Microsoft SQL Server文件夹全部删除
        路径复制：HKEY_CURRENT_USER\Software\Microsoft\Microsoft SQL Server
	3.2将HKEY_LOCAL_MACHINE—SOFTWARE—Microsoft下的Microsoft SQL Native Client ,Microsoft SQL ServerMicrosoft SQL Server 2005 Redist全部删除。
        路径复制：HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server
4.删除之前所有目录下Sql Server相关的文件，重新启动后重新安装即可。

--数据库无法启动
将SQLserver 64/32 文件解压复制其中的文件到"..\Microsoft SQL Server(X86)\MSSQL.1\MSSQL\Binn"并替换其中的两个文件

--无法连接数据库
打开SQL Server Configuration Manager，选择SQL Server 2005网络配置，将Named Pipes和TCP/IP打开（状态为已启用），然后重启服务再次尝试。

--修改数据库密码
C:\WINDOWS>osql -S dpe01 -E
1> sp_password null, '', 'sa'
2> go
【使用说明】
上面脚本的功能：把sa用户的密码改为''
--dpe01是数据库服务器名称   osql -S .\Sqlexpress -E
--null:原数据库的密码，如果不知道，就写null;
'':新密码 ;
'sa':数据库登陆用户名称；
--go后回车才修改


--卸载Sql Server 提示无法找到安装日志文件,无法找到安装日志文件'../Microsoft SQL Server/MSSQL/Uninst.isu 卸载过程将中断。
A:打开目的文件夹，发现mssql下面根本没有uninst.isu这个文件，复制一个替换即可，再通过控制面板里面添加删除程序就可以正常卸载该Microsoft SQL Server 2000




--数据库收缩
--注意：数据库物理文件存放盘符 需要足够空间才能执行下面操作，如数据库文件1G，则至少要1.5G的可用空间
--1、备份数据库
--2、清空oydbuild日志数据,如果日志需要察看，则先导出
--delete from OYDST_USERTABLELOGData  --数据日志
TRUNCATE table OYDST_USERTABLELOGData
--delete from OYDST_USERTABLELOGRec    --数据日志
TRUNCATE table OYDST_USERTABLELOGRec
--delete from  OYDST_USERSYSTEMLOGRec  --系统日志,有些数据库没有这个表
TRUNCATE table  OYDST_USERSYSTEMLOGRec
--3、收缩数据库
--下面 [YMJGZ] 是数据库名称，根据情况修改
--清空日志
alter database [YMJGZ] set recovery simple WITH NO_WAIT
GO
alter database [YMJGZ] set recovery simple
GO
--收缩数据库
DBCC SHRINKDATABASE([YMJGZ])
GO
alter database [YMJGZ] set recovery FULL WITH NO_WAIT
GO
alter database [YMJGZ] set recovery FULL




