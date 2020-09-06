<#
 .Synopsis
Dot-Sourced-Aufruf einer Ps1-Datei
#>

# Dot-Sourced-Aufruf einer Ps1-Datei

# Entweder mit absoluten Pfad
# ."C:\Users\pemoadmin\Documents\WindowsPowerShell\Scripts\GetExtendedFileProperties.ps1"

# Oder mit einem relativen Pfad
."GetExtendedFileProperties.ps1"

# Aufruf der in der Datei enthaltenen Function
Get-FileProperties -Path C:\Windows\Installer\10660e.msi -All | Get-Member

Get-FileProperties -Path "FönInMünchen.png" -All

dir C:\Windows\Installer\*.msi | Get-FileProperties -PropertyName Titel, Betreff, Kommentare | 
 Get-Member Format-List