<#
 .Synopsis
 Einfache Beispiele für Regexe
 .Description
 Beliebige Textdaten in einem Here-String
#>

$CSVDaten = @"
Server1,PC001,"22/07/2019"
Server2,PC-002,"22/07/2019"
Server3,PC-003,"22/07/2019"
Server4,PC004,22/07/2019
"@

# Jeder Treffer basiert auf einem MatchInfo-Objekt
$CSVDaten -split "`n" | Select-String -Pattern "PC-\d+" | Get-Member

$CSVDaten -split "`n" | Select-String -Pattern "(PC-\d+).*(\d\d/\d\d/\d\d\d\d)" | 
 Select-Object @{name="PCName";expression= {$_.Matches[0].Groups[2] }}
