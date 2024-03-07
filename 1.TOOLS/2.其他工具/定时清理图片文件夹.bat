@echo off
::设置7z的命令行程序路径
set zip7=C:\Program Files\7-Zip\7z.exe
::设置压缩包保存路径
set Save=D:\DataBackup\Pictures
::设置被压缩包临时保存路径，防文件被占用无法压缩备份
set SaveTmpe=%Save%\FilesBakTemp
::当天日期，备份文件名
set curdate=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
::设置要打包压缩的文件夹
set zipfile=D:\Pictures
::备份文件夹
xcopy %zipfile% %SaveTmpe% /e /y /h /r /q /i

::备份命令 -xr!.svn过滤.svn文件夹
"%zip7%" a -tzip "%Save%\BakFile_%curdate%.zip" "%SaveTmpe%" -mx0 -xr!.svn

::删除临时目录
del /f /s /q "%SaveTmpe%"\*.*
rd /s /q  "%SaveTmpe%"

::删除超过180天的备份--start--
::forfiles /p "%Save%" /m *.zip -d -180 /c "cmd /c del /f @path"

::清空图片文件夹
DEL  D:\Pictures\* /f/s/q/a