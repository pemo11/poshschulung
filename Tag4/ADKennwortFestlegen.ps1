<#
 .Synopsis
 Aktivieren eines Benutzerkontos mit Enable-ADAccount - Umgang mit Credentials
#>

# Credential => Kombination aus Benutzername und einem verschlüsselten Kennwort (SecureString)

# Variante A - interaktiv
$Cred = Get-Credential abc1234


# $PwSec = Read-Host -AsSecureString

$PwSec = "demo+1234" | ConvertTo-SecureString -AsPlainText -Force

# Benutzerkonto Passwort wird gesetzt - Wichtig: Passwort ist immer (!) ein SecureString
Set-ADAccountPassword -Identity Test -NewPassword $PwSec 

# Benutzerkonto wird aktiviert
Enable-ADAccount -Identity Test 


# Benutzer muss bei der nächsten Anmeldung ein neues Passwort vergeben
Set-ADuser -ChangePasswordAtLogon $true -Identity Test

# Generieren eines Zufallskennwortes

(65..90 | Get-Random -Count 8 | ForEach-Object { [Char] $_ }) -join ""