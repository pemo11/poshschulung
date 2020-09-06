<#
  .Synopsis
  Beispiele für PS-Remoting-Verbindung mit einer Azure-VM
  .Notes
  Der Zugang zu der angegebenen Azure-VM besteht nur während der Schulung
  Es kann natürlich jeder andere Windows 10/Windows-Server-PC/VM verwendet werden
  Auch ein Windows 7-PC mit PowerShell ab Version 3.0 kommt in Frage
  Wenn es keine Remote-Alternative gibt, tut es auch Localhost;)
#>

# Die Zugangsdaten stammen aus einer Datendatei, die im aktuellen Verzeichnis vorliegt
$VMData = Import-PowerShellDataFile -Path .\AzureVMCred.psd1
$Pw = $VMData.Password | ConvertTo-SecureString
$Cred = [PSCredential]::new($VMData.Username, $Pw)
$Hostname = $VMData.Hostname

# Anlegen einer neuen Session
$S1 = New-PSSession -ComputerName $Hostname -Credential $Cred

# Ausführen einer Abfrage in der Remote-Session
Invoke-Command -ScriptBlock { Get-Service | Where-Object Status -ne "Running"} -Session $S1

# Interaktives Betreten der Session (Verlassen mit Exit)
Enter-PSSession -Session $S1

