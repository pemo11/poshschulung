<#
 .Synopsis
 Auswerten einer Ini-Datei per Regex
#>

$Muster = "(.+)=(.+)"
Get-Content -Path C:\Windows\system.ini  | Select-String -Pattern $Muster | Select-Object @{n="Name";e={$_.Matches[0].Groups[1].Value}},
                                                                                          @{n="Wert";e={$_.Matches[0].Groups[2].Value}}
