<#
  .Synopsis
  Skript per PS-Remoting ausführen
  .Notes
  Der Zugang zu der angegebenen Azure-VM besteht nur während der Schulung
  Es kann natürlich jeder andere Windows 10/Windows-Server-PC/VM verwendet werden
  Auch ein Windows 7-PC mit PowerShell ab Version 3.0 kommt in Frage
  Wenn es keine Remote-Alternative gibt, tut es auch Localhost
#>

# Die Zugangsdaten stammen aus einer Datendatei, die im aktuellen Verzeichnis vorliegt
$VMData = Import-PowerShellDataFile -Path .\AzureVMCred.psd1
$Pw = $VMData.Password | ConvertTo-SecureString
$Cred = [PSCredential]::new($VMData.Username, $Pw)
$Hostname = $VMData.Hostname

# Anlegen einer neuen Session
$S1 = New-PSSession -Computername $Hostname -Credential $Cred
$S2 = New-PSSession -Computername $Hostname -Credential $Cred
$S3 = New-PSSession -Computername $Hostname -Credential $Cred
# Nur, wenn kein Kerberos verwendet werden kann
# Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value * -Force

# currentdocs steht für das Documents-Verzeichnis des aktuellen Users

# Reguläre Ausführung
Invoke-Command -FilePath .\SpeicherkostenBerechnenV1.ps1 `
 -ArgumentList "currentdocs",1.5 -Session $S1

# Ausführen auf mehreren Remote-Computern
Invoke-Command -FilePath .\SpeicherkostenBerechnenV1.ps1 `
 -ArgumentList "currentdocs",1.5 -Session $S2,$S3

# Ausführen als Job
$S4 = New-PSSession -Computername $Hostname -Credential $Cred

Invoke-Command -FilePath .\SpeicherkostenBerechnenV1.ps1 `
 -ArgumentList "currentdocs",1.5 -Session $S4,$S1,$S2,$S3 -AsJob

# Abholen der Daten über Receive-Job mit der Id des Remote-Jobs
# Receive-Job -Id 18

# Alle offenen Sessions wieder entfernen
Get-PSSession | Remove-PSSession -Verbose



