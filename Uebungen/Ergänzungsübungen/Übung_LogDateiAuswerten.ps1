<#
 .Synopsis
  Aus einer Log-Datei sollen nur Zeilen ausgegeben werden, in denen ein +++, *** oder !!! enthalten ist
 .Notes
  Die Log-Datei EFBasis.log befindet sich im Verzeichnis D:\2020\Trainings\PowerShell Grundlagen\poshschulung\Material
#>

param([String]$Muster)

if ($Muster -eq "+++") 
{

}
elseif ($Muster -eq "!!!")
{


}
elseif ($Muster -eq "+++")
{

}
else
{
   Write-Warning "!!! Unbekannntes Muster !!!"
}