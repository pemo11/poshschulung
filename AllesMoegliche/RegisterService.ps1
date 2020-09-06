<#
 .Synopsis
Registrieren eines Systemdienstes
.Notes
Der Dienst ist PoshService.exe und Teil des Beispiels
#>

$ServicePath = Join-Path -Path $PSScriptRoot -ChildPath PoshService.exe

# Gibt es die Datei?
if (-Not(Test-Path -Path $ServicePath))
{
    Write-Warning "!!! $ServicePath gibt es nicht !!!"
    exit
}

New-Service -Name PoshService -DisplayName "The Posh Weather Service" `
 -Description "Just a harmless demoservice" `
 -BinaryPathName $ServicePath -Verbose 

Start-Service -Name PoshService

Get-Service -Name PoshService

Get-Content  -Path C:\temp\poshWeatherService.log -Wait -Tail 3

Stop-Service -Name PoshService

Get-Service -Name PoshService

# Entfernen des Dienstes geht nur per sc.exe - .exe ist wichtig, da es auch ein sc-Kommando gibt

# sc.exe delete poshservice

# Anfragen von Warnungen und Fehlern, die ein Dienst verursacht haben könnte
get-eventlog -LogName System -EntryType warning, error -Source "Service Control Manager" -Newest 3
get-eventlog -LogName Application -Source Service Control Manager 
# Dienste über die Registry abfragen
# HKEY_LOCAL_MACHINE \ SYSTEM \ CurrentControlSet \ Services
# PowerShell-Schreibweise
$Key = "HKLM:\System\CurrentControlSet\Services"
dir $key | Select PSChildName
dir $key | Where PSChildName -eq "PoshService"

# Entfernen auf die "Holzhammer-Methode"
dir $key | Where PSChildName -eq "PoshService" | Remove-Item -Verbose

# Den "Dienst ist zum Löschen markiert"-Fehler 1072 löst das aber auch nicht - da hilft eventuell nur ein Neustart der PowerShell bzw. von Services.msc