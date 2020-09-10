<#
 .Synopsis
 Functions für eine fiktive Benutzerverwaltung
#>

class UserInfo
{
    [String]$Username
    [String]$City
    [String]$Department
    [String]$Mail
    [DateTime]$CreateDate

    UserInfo([String]$Name)
    {
        $this.Username = $Name
        $this.Mail = $Name + "@poshkurs.local"
        $this.CreateDate = Get-Date
    }
}

$CityListe = "Erlangen","Esslingen","Essen","Erfurt","Eisenstadt","Ettlingen"
$DepartmentListe = "IT","Personal","Vertrieb","Geschaeftsfuehrung","Sonstige"
function Get-UserInfo
{
    [CmdletBinding()]
    param([Int]$Limit=100)
    (1..$Limit).ForEach{
        $u = [UserInfo]::new("User_{0:000}" -f $_)
        $u.City = $CityListe | Get-Random
        $u.Department = $DepartmentListe | Get-Random
        $u
    }
}