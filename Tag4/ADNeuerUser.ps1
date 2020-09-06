<#
 .Synopsis
 Benutzerkonto mit New-ADUser anlegen und mit einem Zufallskennwort aktivieren
#>

#$UserName = "Vorname2.Nachname2"
param($Username,$Vorgesetzter)

$Vorname = ($UserName -split ".")[0]
$Nachname = ($UserName -split ".")[1]
# Vorname = $UserName.split(".")[0]

# Anlegen eines Benutzerkontos mit einem generierten Passwort

# Schritt 1: Ein Zufallskennwort mit 8 Großbuchstaben zusammenstellen
$Pw = ((65..90),(97..121) | Get-Random -Count 7 | ForEach-Object { [Char] $_ }) -join ""

$Pw = "!" + $Pw

# Schritt 2: Konvertieren in einen SecureString

$PwSec = $Pw | ConvertTo-SecureString -AsPlainText -Force

# Schritt 3: ADUser mit dem Kennwort anlegen und Konto aktivieren
New-ADUser -Name $UserName -AccountPassword $PwSec -ChangePasswordAtLogon $True -Enabled $True -GivenName $Vorname -Surname $Nachname

Write-Host "Benutzerkonto $Username wurde aktiviert - das Passwort ist $Pw" -ForegroundColor black -BackgroundColor white

$Usermail = "admin@localhost.local"
# Schritt 4: Versenden einer E-Mail
if ($Vorgesetzter -ne "")
{
    Send-MailMessage -SmtpServer localhost -To $Vorgesetzter `
     -From admin@localhost `
     -Subject "Neues Passwort" `
     -Body "Wir haben ein neues Passwort vergeben"
}
else
{
    Send-MailMessage -SmtpServer localhost -To admin@localhost `
     -From admin@localhost `
     -Subject "Neues Passwort" `
     -Body "Wir haben ein neues Passwort vergeben"

}