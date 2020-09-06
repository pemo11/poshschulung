<#
 .Synopsis
 Testen der Speicherkostenberechnung
#>

$CSVZeilen = Import-CSV -Path .\Verzeichnisliste.txt -Header "Verzeichnis","Kosten" 

$i = 0
$CSVZeilen | ForEach-Object {
    $Komplett = $i / $CSVZeilen.Count * 100
    $i++
    .\SpeicherkostenBerechnenV1.ps1 -Verzeichnispfad $_.Verzeichnis -KostenMB $_.Kosten
    Write-Progress -Activity "Speicherkostenberechnen" `
     -Status "Berechne $($_.Verzeichnis)" -PercentComplete $Komplett
} | Where-Object KostenMB -gt 0