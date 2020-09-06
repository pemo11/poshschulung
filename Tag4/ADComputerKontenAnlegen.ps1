<#
 .Synopsis
 Anlegen von Computerkonten im lokalen AD mit den Daten einer CSV-Datei
 .Notes
 ADComputerkonten.csv befindet sich im aktuellen Verzeichnis
#>

$CSVPfad = "ADComputerkonten.csv"

$CSVPfad = Join-Path -Path $PSScriptRoot -Childpath "ADComputerkonten.csv"

Import-CSV -Path $CSVPfad | ForEach-Object {

    New-ADComputer -Name $_.Konto -OperatingSystem $_.OS 
    "Computerkonto $($_.Konto) wurde mit OS = $($_.OS) angelegt."

    # New-Mailbox -Identity $_.Konto 

}
