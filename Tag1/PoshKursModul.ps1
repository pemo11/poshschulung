# Schritt 1

try
{
    Register-PSRepository -Name PoshRepo -SourceLocation https://www.myget.org/F/poshrepo/api/v2 -ErrorAction Stop
}
catch
{
    Write-Warning "PoshRepo kann nicht registriert werden ($_)"
}

# Schritt 2

Install-Module -Name Poshkurs -Repository PoshRepo -RequiredVersion 1.2.0 -Force -Verbose -AllowClobber

# Schritt 3

Get-Command -Module Poshkurs

# Eine kleine Kostprobe

"Herzlich Willkommen bei der PowerSchell-Schulung, mein Name ist Peter Monadjemi" | Out-Voice 