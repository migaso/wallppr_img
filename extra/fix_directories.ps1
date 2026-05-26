# Define la ruta de la carpeta donde quieres el archivo
$rutaCarpeta = "C:\Users\PILARES\Downloads"

# Crea el contenido del archivo desktop.ini
$contenido = @"
[.ShellClassInfo]
LocalizedResourceName=@shell32.dll,-21798
IconResource=%SystemRoot%\system32\imageres.dll,-184
"@

# Crea el archivo con codificación UTF-8 o Unicode
$rutaIni = Join-Path $rutaCarpeta "desktop.ini"
Set-Content -Path $rutaIni -Value $contenido -Encoding UTF-8

# Aplica los atributos obligatorios de Windows
Set-ItemProperty -Path "$rutaCarpeta\desktop.ini" -Name Attributes -Value "Hidden, System"

# --
# Define la ruta de la carpeta donde quieres el archivo
$rutaCarpeta = "C:\Users\PILARES\Documents"

# Crea el contenido del archivo desktop.ini
$contenido = @"
[.ShellClassInfo]
LocalizedResourceName=@shell32.dll,-21770
IconResource=%SystemRoot%\system32\imageres.dll,-112
"@

# Crea el archivo con codificación UTF-8 o Unicode
$rutaIni = Join-Path $rutaCarpeta "desktop.ini"
Set-Content -Path $rutaIni -Value $contenido -Encoding UTF-8

# Aplica los atributos obligatorios de Windows
Set-ItemProperty -Path "$rutaCarpeta\desktop.ini" -Name Attributes -Value "Hidden, System"

# --
# Define la ruta de la carpeta donde quieres el archivo
$rutaCarpeta = "C:\Users\PILARES\Desktop"

# Crea el contenido del archivo desktop.ini
$contenido = @"
[.ShellClassInfo]
LocalizedResourceName=@shell32.dll,-21769
IconResource=%SystemRoot%\system32\imageres.dll,-183
"@

# Crea el archivo con codificación UTF-8 o Unicode
$rutaIni = Join-Path $rutaCarpeta "desktop.ini"
Set-Content -Path $rutaIni -Value $contenido -Encoding UTF-8

# Aplica los atributos obligatorios de Windows
Set-ItemProperty -Path "$rutaCarpeta\desktop.ini" -Name Attributes -Value "Hidden, System"


# --
# Define la ruta de la carpeta donde quieres el archivo
$rutaCarpeta = "C:\Users\PILARES\Pictures"

# Crea el contenido del archivo desktop.ini
$contenido = @"
[.ShellClassInfo]
LocalizedResourceName=@shell32.dll,-21779
IconResource=%SystemRoot%\system32\imageres.dll,-113
"@

# Crea el archivo con codificación UTF-8 o Unicode
$rutaIni = Join-Path $rutaCarpeta "desktop.ini"
Set-Content -Path $rutaIni -Value $contenido -Encoding UTF-8

# Aplica los atributos obligatorios de Windows
Set-ItemProperty -Path "$rutaCarpeta\desktop.ini" -Name Attributes -Value "Hidden, System"