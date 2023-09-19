title %time%
:: 打开 vscode
:: start D:\"Program Files (x86)"\"Microsoft VS Code"\code.exe
:: timeout /t 10
:: 关闭 VScode
:: taskkill /f /im code.exe
:: timeout /t 3

:: QQ
start D:\"Program Files (x86)"\Tencent\QQ\Bin\QQScLauncher.exe

:: 企业微信
start D:\"Program Files (x86)"\WXWork\WXWork.exe

:: 微信多开
:: start D:\"Program Files (x86)"\Tencent\WeChat\WeChat.exe
:: start D:\"Program Files (x86)"\Tencent\WeChat\WeChat.exe

:: Ssms
:: start C:\"Program Files (x86)"\"Microsoft SQL Server"\90\Tools\Binn\VSShell\Common7\IDE\Ssms.exe

:: Edge
:: start C:\"Program Files (x86)"\Microsoft\Edge\Application\msedge.exe

:: 此电脑
:: start C:\Users\OYDSOFT\AppData\Roaming\Microsoft\Windows\"Start Menu"\Programs\"System Tools"\computer.lnk

:: 关闭向日葵
taskkill /f /im SunloginClient.exe

:: 关闭ToDesk
taskkill /f /im ToDesk.exe
:: 关闭ToDesk服务
sc stop "ToDesk_Service"

:: 关闭edge 后台
taskkill /f /im MSEDGE.EXE

:: 关闭Chrome 后台
taskkill /f /im Chrome.EXE

pause

