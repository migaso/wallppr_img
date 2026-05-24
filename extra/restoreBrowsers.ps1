# Created by @migaso - github - 202605
# 
# Important:
# Use by your own risk, this code comes with any warranty.
# This code remove Profile * and remove files into a specific directories. 
# Activate removing the flag: -WhatIf
# Change <user> to your User's name
# Make a copy of 'Local State' in the same folder as 'origLocal State'


# Forzar codificación universal para evitar problemas con acentos
$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# 1. Forzar el cierre total de los tres navegadores
Write-Host "Cerrando Google Chrome, Brave y Microsoft Edge..." -ForegroundColor Cyan
Stop-Process -Name "chrome" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "brave" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "msedge" -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2

# 2. Rutas de almacenamiento principal (User Data)
$Local_dir="C:\Users\PILARES\AppData\Local"
$RutasUserData = @(
    "$Local_dir\Google\Chrome\User Data",
    "$Local_dir\BraveSoftware\Brave-Browser\User Data",
    "$Local_dir\Microsoft\Edge\User Data"
)

# 3. Lista de carpetas esenciales a proteger DENTRO del perfil Default
# $CarpetasProtegidas = @("Extensions", "Local Extension Settings", "Extension State", "Local Storage", "IndexedDB", "Databases")

# 4. Procesar cada navegador de forma selectiva
foreach ($RutaUD in $RutasUserData) {
    if (Test-Path $RutaUD) {
        Write-Host "--------------------------------------------------" -ForegroundColor Gray
        Write-Host "Limpiando almacenamiento en: $RutaUD" -ForegroundColor Cyan
        
        # --- PASO A: Eliminar perfiles secundarios del disco (Profile 1, Profile 2, etc.) ---
        $PerfilesSecundarios = Get-ChildItem -Path $RutaUD -Directory | Where-Object { $_.Name -match "^Profile\s*\d+" }
        foreach ($Perfil in $PerfilesSecundarios) {
            if ($RutaUD -eq "$Local_dir\Google\Chrome\User Data") {
                if ($Perfil.Name -ne "Profile 1") {
                    Write-Host "Eliminando carpeta física de perfil: $($Perfil.Name)" -ForegroundColor Red
                    Remove-Item -Path $Perfil.FullName -Recurse -Force -ErrorAction SilentlyContinue
                } 
            } else {
                Write-Host "Eliminando carpeta física de perfil: $($Perfil.Name)" -ForegroundColor Red
                Remove-Item -Path $Perfil.FullName -Recurse -Force -ErrorAction SilentlyContinue
            }
            # else {
            #  Write-Host "Deberiamos eliminar Default?" -ForegroundColor Red
            # }
        }

        # --- PASO B: Limpiar el archivo 'Local State' para remover perfiles del menú visual ---
        $RutaLocalState = Join-Path $RutaUD "Local State"
        $RutaLocalStateOrig = Join-Path $RutaUD "origLocal State"
        if (Test-Path $RutaLocalStateOrig) {
        #  Remove-Item -Path $RutaLocalState -Recurse -Force -ErrorAction SilentlyContinue
         Copy-Item -Path $RutaLocalStateOrig -Destination $RutaLocalState -Force 
        }
       
        # --- PASO C: Limpieza ultra-específica del perfil Default ---
        $RutaPerfiles = @(
            "$RutaUD\Default",
            "$RutaUD\Profile 1"
        )
        # $RutaDefault = Join-Path $RutaUD "Default"
        foreach ($RutaDefault in $RutaPerfiles) {
            if (Test-Path $RutaDefault) {
                Write-Host "Borrando caché, historial, sesiones y cookies en Default..." -ForegroundColor Yellow
                
                $ElementosABorrar = @(
                    "Cache", "Code Cache", "GPUCache", "Media Cache",
                    "Cookies", "Cookies-journal",
                    "History", "History-journal", "Network Action Predictor",
                    "Sessions", "Session Storage",
                    "Web Data", "Web Data-journal"
                )
    
                foreach ($Elemento in $ElementosABorrar) {
                    $RutaElemento = Join-Path $RutaDefault $Elemento
                    if (Test-Path $RutaElemento) {
                        Remove-Item -Path $RutaElemento -Recurse -Force -ErrorAction SilentlyContinue
                    }
                }
            }
        }
    }
}

Write-Host "--------------------------------------------------" -ForegroundColor Gray
Write-Host "¡Limpieza exitosa! Perfil Default restablecido, perfiles secundarios eliminados del disco y del menú." -ForegroundColor Green
