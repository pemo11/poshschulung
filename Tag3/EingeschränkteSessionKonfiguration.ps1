$CmdletList = "Get-Process", "Get-Service", "Get-Hotfix","Start-Service"
$ModuleListe = "Microsoft.PowerShell.Management"

New-PSSessionConfigurationFile -Path MinimalSession.pssc `
 -SessionType RestrictedRemoteServer `
 -LanguageMode NoLanguage `
 -VisibleCmdlets $CmdletList `
 -ModulesToImport $ModuleListe


Register-PSSessionConfiguration -Path .\MinimalSession.pssc -Name Minimal -Verbose -Force

Get-PSSessionConfiguration

Enter-PSSession -Computer Localhost -ConfigurationName Minimal 

Show-ControlPanelItem -Name "Geräte und Drucker" 
Get-WinEvent -ListLog Microsoft-*winrm*
Get-WinEvent -LogName Microsoft-Windows-WinRm/operational -MaxEvents 10 | 
Format-List TimeCreated,Message

Show-EventLog

$Startzeit = (Get-Date).AddHours(-1)
$Startzeit = Get-Date -Date 15.01.2019
Get-WinEvent -FilterHashTable @{LogName='Microsoft-Windows-WinRm/operational';Level=2,4;
 StartTime=$Startzeit} -ComputerName 

Get-WinEvent -FilterHashTable @{LogName='Microsoft-Windows-WinRm/operational';Level=2,4} |
 Where-Object { $_.TimeCreated -gt "01.17.2019 09:30" `
  -and $_.TimeCreated -lt "01.17.2019 09:32"} | Out-GridView



(Get-Command -Verb get | Select-Object -ExpandProperty Name) -join ","