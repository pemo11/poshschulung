<#
 .Synopsis
 Vergleich zweier AD-User, die per Get-ADUser geholt werden
#>

$ADUser1 = Get-ADUser -Identity Administrator -Properties *
$ADUser2 = Get-ADuser -Identity Win7 -Properties *

$PropsADUser1 = ($ADUser1 | Get-Member -MemberType Property).Name

# Die Namen aller Eigenschaften durchgehen
foreach($PropName in $PropsADUser1)
{
    $ADUser1.$PropName
}

