<#
 .Synopsis
 Log-Dateien auswerten mit Hilfe regulärer Ausdrücke
#>

# Das Datum von Gestern holen
$Gestern = (Get-Date).AddDays(-1).ToString("d")

# Auf Select-String folgt in der Regel ein "regulärer Ausdruck" (regex)
# Ist in der Hilfe schön beschrieben: about_regular_expressions
# dir C:\Windows\*.log -Recurse -ErrorAction Ignore  | Select-String "$Gestern.*Warning"

$LogPfad = Join-Path -Path $PSScriptRoot -ChildPath IIS.log

# Aufgabe: # Suche nach Einträgen vom Typ [05/13/2020 22:54:20] Success! in IIs.log

# A: Die einfache Variante
get-content $LogPfad | select-String "(\d\d/\d\d/\d\d\d\d).*?(\w+\.dll)" |
 Select-Object { $_.Matches[0].Groups[1].Value },
               { $_.Matches[0].Groups[2].Value }

# B: Die komfortable Variante
get-content $LogPfad | select-String "(\d\d/\d\d/\d\d\d\d).*?(\w+\.dll)" |
 Select-Object @{n="Datum";e={ $_.Matches[0].Groups[1].Value }},
               @{n="Datei";e={ $_.Matches[0].Groups[2].Value }}

# Sobald Objekte vorliegen, kann jedes Cmdlet folgen, wie z.B. Sort-Object
get-content $LogPfad | select-String "(\d\d/\d\d/\d\d\d\d).*?(\w+\.dll)" |
 Select-Object @{n="Datum";e={ $_.Matches[0].Groups[1].Value }},
               @{n="Datei";e={ $_.Matches[0].Groups[2].Value }} | Sort-Object datei
