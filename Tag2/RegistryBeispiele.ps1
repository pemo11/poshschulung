<#
 .Synopsis
 Verschiedene Beispiele für den Zugriff auf die Registry
 .Notes
 Alle Beispiele einzelnen ausführen oder am besten als Notebook
#>

# Auflisten der Unterschlüssel des Uninstall-Schlüssels
dir HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall

# Auflisten bestimmter Einträge eines Uninstall-Unterschlüssels
dir HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall |
  Where-Object DisplayName -match "Docker"

# Get-Item, um gezielt ein "Item" zu holen
# Get-ChildItem (dir) holt die Items in einem Container
$regKey = get-item "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\docker for windows"

# Auflisten eines Eintrags eines Schlüssels
Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\docker for windows" `
    -Name DisplayName | Select-Object -ExpandProperty DisplayName

# Auflisten zweier Einträge bestimmter Schlüssel
Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" |
 Where-Object Publisher -notmatch "Microsoft" | Select-Object DisplayName,DisplayVersion

# Auflisten zweier Einträge von Schlüsseln ohne Wert für DisplayVersion
Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" |
 Where-Object DisplayVersion -ne $null | Select-Object DisplayName,DisplayVersion

# Sortieren nach dem Wert von Einträgen aller Unterschlüssel
Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" |
 Where-Object DisplayVersion -ne $null | Select-Object DisplayName,DisplayVersion | 
 Sort-Object DisplayName

# Sortieren nach dem Wert von Einträgen aller Unterschlüssel
Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" |
 Where-Object DisplayVersion -ne $null | Select-Object DisplayName,DisplayVersion | 
 Sort-Object DisplayVersion

# Anlegen eines neuen Schlüssels
New-item -path HKCU:\Software\PowerShell-Schulung
# Anlegen eines neuen Eintrags
New-ItemProperty -path HKCU:\Software\PowerShell-Schulung -Name Termin -Value "14.01.2021"
# Entfernen eines neuen Schlüssels
Remove-Item -path HKCU:\Software\PowerShell-Schulung

# Suche in der Registry nach Schlüsseln, in denen das Wort "PowerShell" vorkommt

dir HKLM:\SOFTWARE\*powershell* -Recurse | remove-item -WhatIf
 