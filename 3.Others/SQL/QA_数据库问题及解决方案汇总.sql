--Sql Server��װ���˼����������ͬʵ��������취
1.ֹͣ������Sql Server��صķ���
2.��������İ�װ
	ʹ��windows install clean up����������д�Sql Server�İ�װ��
	��SrvInstw.exeɾ������SQL����
3.���ע���
	3.1��HKEY_CURRENT_USER��Software��-Microsoft�µ�Microsoft SQL Server�ļ���ȫ��ɾ��
        ·�����ƣ�HKEY_CURRENT_USER\Software\Microsoft\Microsoft SQL Server
	3.2��HKEY_LOCAL_MACHINE��SOFTWARE��Microsoft�µ�Microsoft SQL Native Client ,Microsoft SQL ServerMicrosoft SQL Server 2005 Redistȫ��ɾ����
        ·�����ƣ�HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server
4.ɾ��֮ǰ����Ŀ¼��Sql Server��ص��ļ����������������°�װ���ɡ�

--���ݿ��޷�����
��SQLserver 64/32 �ļ���ѹ�������е��ļ���"..\Microsoft SQL Server(X86)\MSSQL.1\MSSQL\Binn"���滻���е������ļ�

--�޷��������ݿ�
��SQL Server Configuration Manager��ѡ��SQL Server 2005�������ã���Named Pipes��TCP/IP�򿪣�״̬Ϊ�����ã���Ȼ�����������ٴγ��ԡ�

--�޸����ݿ�����
C:\WINDOWS>osql -S dpe01 -E
1> sp_password null, '', 'sa'
2> go
��ʹ��˵����
����ű��Ĺ��ܣ���sa�û��������Ϊ''
--dpe01�����ݿ����������   osql -S .\Sqlexpress -E
--null:ԭ���ݿ�����룬�����֪������дnull;
'':������ ;
'sa':���ݿ��½�û����ƣ�
--go��س����޸�


--ж��Sql Server ��ʾ�޷��ҵ���װ��־�ļ�,�޷��ҵ���װ��־�ļ�'../Microsoft SQL Server/MSSQL/Uninst.isu ж�ع��̽��жϡ�
A:��Ŀ���ļ��У�����mssql�������û��uninst.isu����ļ�������һ���滻���ɣ���ͨ����������������ɾ������Ϳ�������ж�ظ�Microsoft SQL Server 2000




--���ݿ�����
--ע�⣺���ݿ������ļ�����̷� ��Ҫ�㹻�ռ����ִ����������������ݿ��ļ�1G��������Ҫ1.5G�Ŀ��ÿռ�
--1���������ݿ�
--2�����oydbuild��־����,�����־��Ҫ�쿴�����ȵ���
--delete from OYDST_USERTABLELOGData  --������־
TRUNCATE table OYDST_USERTABLELOGData
--delete from OYDST_USERTABLELOGRec    --������־
TRUNCATE table OYDST_USERTABLELOGRec
--delete from  OYDST_USERSYSTEMLOGRec  --ϵͳ��־,��Щ���ݿ�û�������
TRUNCATE table  OYDST_USERSYSTEMLOGRec
--3���������ݿ�
--���� [YMJGZ] �����ݿ����ƣ���������޸�
--�����־
alter database [YMJGZ] set recovery simple WITH NO_WAIT
GO
alter database [YMJGZ] set recovery simple
GO
--�������ݿ�
DBCC SHRINKDATABASE([YMJGZ])
GO
alter database [YMJGZ] set recovery FULL WITH NO_WAIT
GO
alter database [YMJGZ] set recovery FULL




