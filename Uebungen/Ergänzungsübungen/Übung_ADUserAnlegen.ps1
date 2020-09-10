<#
 .Synopsis
  Auf der Grundlage einer CSV-Datei mit AD-User-Daten sollen AD-Benutzerkonten angelegt werden
 .Notes
  Es soll lediglich eine Meldung ausgegeben werden
  Die CSV-Datei ADUserDaten.csv befindet sich im Verzeichnis D:\2020\Trainings\PowerShell Grundlagen\poshschulung\Material
#>

param([String]$CSVPfad)

Import-CSV -Path $CSVPfad

ForEach-Object {
	Write-Verbose "*** Das Benutzerkonto wurde angelegt ***"

}

