<#
 .Synopsis
 Ein Profilskript für die Schulung
 #>
 
$Wochentag = Get-Date -Format dddd
$TxtPfad = Join-Path -Path $env:userprofile\documents\WindowsPowerShell -ChildPath "PSschulung_$Wochentag.txt"

Start-Transcript -Path $TxtPfad -Append

$Host.PrivateData.ErrorForegroundColor = "Yellow"
$Host.PrivateData.ErrorBackgroundColor = "Red"