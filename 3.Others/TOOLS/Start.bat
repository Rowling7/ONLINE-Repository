title %time%
:: �� vscode
:: start D:\"Program Files (x86)"\"Microsoft VS Code"\code.exe
:: timeout /t 10
:: �ر� VScode
:: taskkill /f /im code.exe
:: timeout /t 3

:: QQ
start D:\"Program Files (x86)"\Tencent\QQ\Bin\QQScLauncher.exe

:: ��ҵ΢��
start D:\"Program Files (x86)"\WXWork\WXWork.exe

:: ΢�Ŷ࿪
:: start D:\"Program Files (x86)"\Tencent\WeChat\WeChat.exe
:: start D:\"Program Files (x86)"\Tencent\WeChat\WeChat.exe

:: Ssms
:: start C:\"Program Files (x86)"\"Microsoft SQL Server"\90\Tools\Binn\VSShell\Common7\IDE\Ssms.exe

:: Edge
:: start C:\"Program Files (x86)"\Microsoft\Edge\Application\msedge.exe

:: �˵���
:: start C:\Users\OYDSOFT\AppData\Roaming\Microsoft\Windows\"Start Menu"\Programs\"System Tools"\computer.lnk

:: �ر����տ�
taskkill /f /im SunloginClient.exe

:: �ر�ToDesk
taskkill /f /im ToDesk.exe
:: �ر�ToDesk����
sc stop "ToDesk_Service"

:: �ر�edge ��̨
taskkill /f /im MSEDGE.EXE

:: �ر�Chrome ��̨
taskkill /f /im Chrome.EXE

pause

