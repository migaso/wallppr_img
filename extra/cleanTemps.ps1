# Created by @migaso - github - 202605
#
# powershell.exe -ExecutionPolicy Bypass -F ".\cleanTemps.ps1"
# OR
# Get-ExecutionPolicy -List
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#
# Important:
# Use by your own risk, this code comes with any warranty.
# This code remove files into a specific directories. 
# Activate removing the flag: -WhatIf
# Change <user> to your User's name

# Define la ruta de la carpeta temporal (%TEMP%)
$Local_dir="C:\Users\PILARES"
$RutaTemp = @(
    "$Local_dir\AppData\Local\Temp",
    "C:\Windows\Temp",
    # "C:\Windows\Prefetch" # clean every 1 or 2 months
    # [System.IO.Path]::GetTempPath(),
)

# Calcula la fecha límite (hace 1 día)
$FechaLimite = (Get-Date).AddDays(-1)

# Busca y elimina los archivos que superan 1 día
Write-Host "Limpiando temporales con más de un día de antigüedad..." -ForegroundColor Cyan
foreach ($SelectTemp in $RutaTemp) {
 Get-ChildItem -Path $SelectTemp -Recurse -File | Where-Object { $_.LastWriteTime -lt $FechaLimite } | 
 Remove-Item -Force -ErrorAction SilentlyContinue
}