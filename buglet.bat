@echo off

title "BugLet Script"
mode con lines=30 cols=115
chcp 65001 >nul
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo. & echo -------------------------------------------------
    echo. & echo ^>^> Please use RIGHT CLICK - Run as administrator
    echo. & echo -------------------------------------------------
    color 4f & timeout /t 2 >nul
    goto goUAC 
) else (
 goto goADMIN )

:goUAC
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:goADMIN

color 07
cls & echo. & echo BugLet script is running ... & echo.

taskkill /IM Underground.exe /IM Underground.exe /F
echo Killed Underground.exe Successfully & echo.

taskkill /IM CoreTemp.exe /IM CoreTemp.exe /F
echo Killed CoreTemp.exe Successfully & echo.

taskkill /IM BarClientSafeCenter.exe /IM BarClientSafeCenter.exe /F
echo Killed BarClientSafeCenter.exe Successfully & echo.

taskkill /IM BarMonitor.exe /IM BarMonitor.exe /F
echo Killed BarMonitor.exe Successfully & echo.

taskkill /IM BarClientView.exe /IM BarClientView.exe /F
echo Killed BarClientView.exe Successfully & echo.

taskkill /IM CyberStation.exe /IM CyberStation.exe /F
echo Killed CyberStation.exe Successfully & echo.
