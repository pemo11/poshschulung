<#
 .Synopsis
 Verschiedene Abfragen von AD-Benutzerkonten mit Get-ADUser
#>

Get-ADUser -Identity Administrator -Properties * | Select-Object *logon*

Get-ADUser -Filter * -Properties LastLogonDate | Select-Object DistinguishedName, lastLogonDate | Sort-Object LastLogondate -Descending

Get-ADUser -Filter * -Properties LastLogonDate | Sort-Object LastLogondate -Descending | Select-Object DistinguishedName, lastLogonDate -First 10

Get-ADUser -Filter { enabled -eq $true}  -Properties LastLogonDate | Sort-Object LastLogondate -Descending | 
 Select-Object DistinguishedName, lastLogonDate -First 10 | Out-GridView


# Relativer Datumsvergleich 
$d1 = Get-Date 
$d2 = Get-Date 31.12.2019
($d2 - $d1).Days

# Ausgabe der Anzahl der Tage, die sich Benutzerkonten nicht mehr angemeldet haben 
Get-ADUser -Filter * -Properties LastLogonDate | Where-Object LastLogonDate -ne $null | ForEach-Object {
    # Bilden der Differenz zwischen zwei Datumswerte in Tagen - heutiges Datum und Datum der letzten Anmeldung
    ((Get-Date) - $_.LastLogonDate).Days
}

# Ausgabe als ein Objekt (immer besser)
Get-ADUser -Filter * -Properties LastLogonDate | Where-Object LastLogonDate -ne $null | ForEach-Object {
	# Über [PSCustomObject] wird ein "leeres" Objekt gebildet - die Eigenschaften werden über eine Hashtable festgelegt
    [PSCustomObject]@{
     Name = $_.Name
     AnzahlTage = ((Get-Date) - $_.LastLogonDate).Days
     }
} | Export-CSV -Path ADUserLogonTage.csv -Delimiter ";" -NoTypeInformation -Encoding Default

# Optionale Verzögerung
Start-Sleep -Seconds 1

# Festlegung der Smtp-Adresse über eine globale PowerShell-Variable
$PSEmailServer = "localhost"

# Versenden der Csv-Datei per Mail (es fehlen noch einige Angaben)
$CSVPfad = ".\ADComputerKonten.csv"
Send-MailMessage -Attachments $CSVPfad -To admin@codeclass.de -From anonymous@hacker.local `
 -Subject "Streng vertraulich..." # -SmtpServer Localhost