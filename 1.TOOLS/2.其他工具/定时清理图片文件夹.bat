@echo off
::����7z�������г���·��
set zip7=C:\Program Files\7-Zip\7z.exe
::����ѹ��������·��
set Save=D:\DataBackup\Pictures
::���ñ�ѹ������ʱ����·�������ļ���ռ���޷�ѹ������
set SaveTmpe=%Save%\FilesBakTemp
::�������ڣ������ļ���
set curdate=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
::����Ҫ���ѹ�����ļ���
set zipfile=D:\Pictures
::�����ļ���
xcopy %zipfile% %SaveTmpe% /e /y /h /r /q /i
 
::�������� -xr!.svn����.svn�ļ���
"%zip7%" a -tzip "%Save%\BakFile_%curdate%.zip" "%SaveTmpe%" -mx0 -xr!.svn

::ɾ����ʱĿ¼
del /f /s /q "%SaveTmpe%"\*.*
rd /s /q  "%SaveTmpe%"
 
::ɾ������180��ı���--start--
::forfiles /p "%Save%" /m *.zip -d -180 /c "cmd /c del /f @path"

::���ͼƬ�ļ���
DEL  D:\Pictures\* /f/s/q/a