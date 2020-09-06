
dir Cert:\LocalMachine -Recurse | Select-Object NotBefore,NotAfter


# Gesucht ist ein Befehl, der alle Zertifikate unter Cert:\localMachine ausgibt, 
# die innerhalb des nächsten Jahres ablaufen werden - also Abfrage der NotAfter-Eigenschaft

$Vergleichsdatum = (Get-Date).AddYears(1)

dir Cert:\LocalMachine -Recurse | Where-Object NotAfter -lt $Vergleichsdatum |
 select-Object { $_.Subject.Substring(0,20)},NotAfter

dir Cert:\LocalMachine -Recurse | Where-Object NotAfter -lt $Vergleichsdatum |
 select-Object FriendlyName,NotAfter | Measure-Object

# ExpiringinDays ist ein dynamischer Parameter, der nur dann zur Verfügung steht
# wenn über den path-parameter ein Provider ausgewählt wird, der diesen Parameter
# implementiert
dir Cert:\LocalMachine -ExpiringInDays 180 -Recurse | Select NotAfter





