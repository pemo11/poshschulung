<#
  .Synopsis
  Beispiele für CIM-Remoting mit einer Azure-VM
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

# Zwei CIM-Sessions anlegen
$CIM1 = New-CimSession -Credential $Cred -ComputerName $Hostname
$CIM2 = New-CimSession -Credential $Cred -ComputerName $Hostname

# Abfrage in beiden CIM-Sessions ausführen
Get-CIMInstance -ClassName Win32_Product -CimSession $CIM1,$CIM2 | Select-Object Name,Version,Caption,Vendor 

# Gleiche Abfrage, nur Export in CSV-Datei
# Get-CIMInstance -ClassName Win32_Product -CimSession $CIM1,$CIM2 | Select-Object Name,Version,Caption,Vendor | 
 Export-CSV -Path Produktliste.csv -Delimiter ";" -NoTypeInformation


# Beide CIM-Sessions wieder entfernen
$CIM1, $CIM2 | Remove-CimSession
