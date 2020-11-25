<#
  .Synopsis
  Beispiele für PS-Remoting-Verbindung mit einer Azure-VM
  .Notes
  Der Zugang zu der angegebenen Azure-VM besteht nur während der Schulung
  Es kann natürlich jeder andere Windows 10/Windows-Server-PC/VM verwendet werden
  Auch ein Windows 7-PC mit PowerShell ab Version 3.0 kommt in Frage
  Wenn es keine Remote-Alternative gibt, tut es auch Localhost;)
  !!! Nicht vergessen!!! TrustedHosts-Eintrag = "*" setzen, da kein Kerberos möglich
  Set-Item -Path Wsman:localhost/client/trustedhosts -Value "*" -Force
#>

# Die Zugangsdaten stammen aus einer Datendatei, die im aktuellen Verzeichnis vorliegt
$Psd1Pfad = Join-Path -Path $PSScriptRoot -ChildPath "AzureVMCred2.psd1"
$VMData = Import-PowerShellDataFile -Path $Psd1Pfad
$Pw = $VMData.Password | ConvertTo-SecureString
$Cred = [PSCredential]::new($VMData.Username, $Pw)
$Hostname = $VMData.Hostname

# Anlegen einer neuen Session
$S1 = New-PSSession -ComputerName $Hostname -Credential $Cred

if ($null -eq $S1)
{
  Write-Warning "!!! Keine Session - Skript wird beendet !!!"
  exit
}

# Ausführen einer Abfrage in der Remote-Session
Invoke-Command -ScriptBlock { Get-Service | Where-Object Status -ne "Running"} -Session $S1

# Interaktives Betreten der Session (Verlassen mit Exit)
Enter-PSSession -Session $S1

