<# 
 .Synopsis
 Beispiele für lokale WMI-Abfragen mit den CIM-Cmdlets
 .Notes
 Am besten in Visual Studio Code als Notebook anzeigen (wenn möglich)
#>

# Abfrage aller Klassennamen
Get-CimClass -ClassName Win32_* | Where-Object CimClassName -notlike Win32_Perf* | Out-GridView

# Details zum Betriebssystem abfragen
Get-CimInstance -ClassName Win32_OperatingSystem
# Details zum Computer abfragen
Get-CimInstance -ClassName Win32_ComputerSystem
# Details zur CPU abfragen
Get-CimInstance -ClassName Win32_Processor
# Details zur Hauptplatine abfragen
Get-CimInstance -ClassName Win32_BaseBoard
# Details zum Akku abfragen (nur auf mobilen PCs)
Get-CimInstance -ClassName Win32_Battery

# Alle Details zum Betriebssystem ausgeben
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object *

# Get-WMIObject als Alterative
Get-WmiObject -Class Win32_OperatingSystem | Select-Object *

# Die Suche nach einem Klassennamen
Get-CimClass -ClassName Win32_*Video*

# Alle Details zum BIOS ausgeben (viele sind es nicht)
Get-CimInstance -ClassName Win32_BIOS | Select-Object *

# Ausgabe des Zeitpunkt des letzten Bootens - gezielter Abruf einer Eigenschaft
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property LastBootuptime
