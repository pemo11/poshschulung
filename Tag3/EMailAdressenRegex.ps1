<#
 .Synopsis
 E-Mail-Adressen aus Texten extrahieren
#>

$HtmlContent = Invoke-WebRequest -Uri "https://activetraining.de"
$HtmlText = $HtmlContent.Content

$HtmlText | Select-String -Pattern "[A-Z0-9._%]+@[A-Z0-9.-]+\.[A-Z]{2,4}"  | Select-Object @{n="EMail";e={$_.Matches[0].Groups[0].Value}}
