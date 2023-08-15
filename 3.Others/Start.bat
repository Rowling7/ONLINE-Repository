title %time%
rem 打开 vscode
rem 删除rem以恢复 start D:\"Program Files (x86)"\"Microsoft VS Code"\code.exe
rem 删除rem以恢复 timeout /t 10
rem 关闭 VScode
rem 删除rem以恢复 taskkill /f /im code.exe
rem 删除rem以恢复 timeout /t 3

rem QQ
start D:\"Program Files (x86)"\Tencent\QQ\Bin\QQScLauncher.exe

rem 企业微信
start D:\"Program Files (x86)"\WXWork\WXWork.exe

rem 微信多开
start D:\"Program Files (x86)"\Tencent\WeChat\WeChat.exe
start D:\"Program Files (x86)"\Tencent\WeChat\WeChat.exe

rem Ssms
rem start C:\"Program Files (x86)"\"Microsoft SQL Server"\90\Tools\Binn\VSShell\Common7\IDE\Ssms.exe

rem Edge
rem 删除rem以恢复 start C:\"Program Files (x86)"\Microsoft\Edge\Application\msedge.exe

rem 此电脑
start C:\Users\OYDSOFT\AppData\Roaming\Microsoft\Windows\"Start Menu"\Programs\"System Tools"\computer.lnk

rem 关闭todesk
taskkill /f /im ToDesk.exe

rem 关闭向日葵
taskkill /f /im SunloginClient.exe

echo 关闭edge 后台
taskkill /f /im MSEDGE.EXE
pause