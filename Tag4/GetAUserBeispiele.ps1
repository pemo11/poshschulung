<#
 .Synopsis
Beispiele für das Abfragen von AD-Benutzerkonten mit Get-User
#>

Get-ADUser -Filter *

Get-ADUser -Identity Administrator

Get-ADUser -Filter { givenname -eq "Peter" }

Get-ADUser -Filter { givenname -like 'A*' -and city -eq "Donzdorf" }

$Surname = Read-Host -Prompt "Nachname?"
Get-ADUser -Filter { surname -eq $Surname } -Properties *

Get-Command -Noun Aduser
Get-Command -Noun ADAccount

