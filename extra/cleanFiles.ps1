# Created by @migaso - github - 202605
#
# Important:
# Use by your own risk, this code comes with any warranty.
# This code remove files into a specific directories. 
# Activate removing the flag: -WhatIf
# Change <user> to your User's name

# Forzar codificación universal para evitar problemas con acentos
$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Define la ruta de la carpeta temporal (%TEMP%)
$Local_dir="C:\Users\PILARES"
$PathToClean = @(
  "$Local_dir\Documents",
  "$Local_dir\Pictures",
  "$Local_dir\Music",
  "$Local_dir\Videos",
  "$Local_dir\Downloads",
  "$Local_dir\Desktop"
)

foreach ($SelectLocation in $PathToClean) {
  if ($SelectLocation -ne "$Local_dir\Desktop") {
    Write-Host "Eliminando contenido de la carpeta: $($SelectLocation)" -ForegroundColor Red
    Remove-Item -Path "$SelectLocation\*" -Recurse  # -Force -ErrorAction SilentlyContinue
  }
  else {
    Write-Host "Eliminando contenido de la carpeta: $($SelectLocation)" -ForegroundColor Red
    Get-ChildItem -Path $SelectLocation -Recurse | Where-Object { $_.Name -notlike "*conservar*" -and $_.Extension -ne ".Ink" } | 
    Remove-Item # -Force -ErrorAction SilentlyContinue
  }
}
