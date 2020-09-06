<#
 .Synopsis
 Verschiedene Varianten für das Einlesen einer großen Datei
#>

$LogPfad = "C:\Windows\Logs\CBS\CbsPersist_20190114133030.log"

$Zeilen = Get-Content -Path $LogPfad
Clear-Variable Zeilen
(Measure-Command {Get-Content -Path $LogPfad}).TotalSeconds

(Measure-Command {Get-Content -Path $LogPfad -Raw}).TotalSeconds

(Get-Content -Path $LogPfad -Raw).Count

# Den Garbage Collector aufräumen lassen - alle nicht mehr referenzierten Speicherblöcke
# werden wieder freigegeben
[GC]::Collect()

(Measure-Command {[System.IO.File]::ReadAllText($LogPfad)}).TotalSeconds

(Measure-Command {[System.IO.File]::ReadLines($LogPfad)}).TotalSeconds

Get-Content -Path $LogPfad | Out-Host -Paging