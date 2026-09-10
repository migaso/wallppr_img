@echo off
:: SAT
schtasks /create /ru SYSTEM /tn "Apagar" /tr "shutdown /s /t 0" /sc weekly /d MON,TUE,WED,THU,FRI /st 20:00 /rl highest /f

if %errorlevel% neq 0 (
    echo Error al crear la tarea. Asegúrate de ejecutar esto como Administrador.
    :: pause
    exit /b
)

:: schtasks no tiene un switch directo para esto, usamos PowerShell incrustado.
powershell -Command "$t = Get-ScheduledTask -TaskName 'Apagar'; $t.Settings.WakeToRun = $true; $t | Set-ScheduledTask"

echo.
echo Tarea configurada exitosamente:
echo - Lunes a Viernes a las 8:00 PM
echo - Despertar equipo: Activado

:: pause
exit /b