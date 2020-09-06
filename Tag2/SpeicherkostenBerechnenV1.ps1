<#
.Synopsis
Speicherkostenberechnung nach SAG
#>

#requires -RunAsAdministrator

[Cmdletbinding()]
param([parameter(mandatory=$true)][string]$Verzeichnispfad, [double]$KostenMB=0.25)

$SummeBytes = 0
Get-ChildItem -Path $Verzeichnispfad -File -Recurse | ForEach-Object {

    $SummeBytes += $_.Length
    Write-Verbose "Berechne Kosten für Verzeichnis $($_.FullName)"
}

# Runden mit Hilfe der statischen Round()-Methode der Klasse Math
# aus der .NET-Laufzeit-Bibliothek

$Ergebnis = [PSCustomObject]@{   
    Pfad = $Verzeichnispfad
    KostenMB = [Math]::Round($SummeBytes / 1MB * $KostenMB,3)
    Zeitpunkt = Get-Date
}

$Ergebnis

