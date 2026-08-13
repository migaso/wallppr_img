:: Created by @migaso 202605
::

@echo off
::set path_git="C:\Program Files\Git\bin"
set path_git="C:\Users\PILARES\AppData\Local\Programs\Git\bin"
IF EXIST "C:\wallppr_img\extra" (
    powershell.exe -ExecutionPolicy Bypass -F "C:\wallppr_img\extra\cleanTemps.ps1"
    powershell.exe -ExecutionPolicy Bypass -F "C:\wallppr_img\extra\cleanFiles.ps1"
    powershell.exe -ExecutionPolicy Bypass -F "C:\wallppr_img\extra\restoreBrowsers.ps1"
    :: call C:\wallppr_img\extra\turnoff\turnoff_task.bat
) ELSE (
    cd C:\wallppr_img
    %path_git%\git pull origin pilares_pelon
)

schtasks /query /tn "cleanCustomProcess" >nul 2>&1
IF %errorlevel% neq 0 (
  schtasks /create /tn "cleanCustomProcess" /tr "C:\wallppr_img\extra\task.bat" /sc onstart /ru System
)
exit
