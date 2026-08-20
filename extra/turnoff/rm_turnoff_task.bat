@echo off
schtasks /delete /tn "Apagar" /f

if %errorlevel% neq 0 (
    echo Error borrar la tarea. Asegúrate de ejecutar esto como Administrador.
    :: pause
    exit /b
)

echo.
echo Tarea Apagar: Eliminada

:: pause
exit /b