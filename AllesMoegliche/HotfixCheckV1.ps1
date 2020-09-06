<#
 .Synopsis
 Hotfix-Id checken
#>

param([String[]]$HotfixId, [String]$Computername="localhost")

# Soll für eine Übung noch etwas ausgebaut werden
# Soll Remote ausgeführt werden 
# Wie wird der Rückgabewert am besten zusammengebaut?

Invoke-Command {
    Get-Hotfix -Id $using:HotfixId 
} -Computername $Computername