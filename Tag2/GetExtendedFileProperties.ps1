<# 
  .Synopsis
  Abfrage der erweiterten Datei-Attribute
#> 

param()

<#
 .Synopsis
 Extend File Properties
 .Description
 Get the extended properties of a file with a little help of a friendly COM interface and the Explorer
#>

function Get-FileProperties
{
    param([Alias("PsPath")][Parameter(ValueFromPipelineByPropertyName=$true)][String]$Path, [String[]]$PropertyName,
        [Parameter(ParametersetName="All")][Switch]$All,
        [Parameter(ParametersetName="All")][Switch]$ValuesOnly
        )

    process
    {
        $Path = Convert-Path -Path $Path
        $DirPath = Split-Path -Path $Path
        $FileName = Split-Path -Path $Path -Leaf
        $MaxProps = 300
        $ShellFolder = (New-Object -ComObject Shell.Application).NameSpace($DirPath)
        $ShellFile = $ShellFolder.ParseName($FileName)

        # Sollen alle erweiterten Eigenschaften ausgegeben werden?
        if ($PSBoundParameters.ContainsKey("All"))
        {
            $FileProps = [Ordered]@{Datei=$FileName}
            # Alle Eigenschaften durchgehen und ihre Werte abfragen
            for($i=0; $i -lt $MaxProps; $i++)
            {
                $PropName = $ShellFolder.GetDetailsOf($null,$i)
                if ($PropName -ne $null -and $PropName -ne "")
                {
                    $Value = $ShellFolder.GetDetailsOf($ShellFile, $i)
                    if ($PSBoundParameters.ContainsKey("ValuesOnly"))
                    {
                       if ($Value -ne $null -and $Value -ne "")
                       {
                            $FileProps += @{$PropName = $Value}
                       }
                    }
                    else
                    {
                        if ($Value -ne $null -and $Value -ne "")
                        {
                            $FileProps += @{$PropName = $Value}
                        }
                    }
                }
            }
            # Rückgabe eines Objekts mit allen Eigenschaften und deren Werte
            [PsCustomObject]$FileProps
        }
        else
        {
            # Es sollen nur die Eigenschaften abgefragt werden, deren Namen übergeben wurden
            $FileProps = [Ordered]@{Datei=$FileName}
         
            # Alle übergebene Eigenschaften durchgehen
            foreach($Prop in $PropertyName)
            {
                # Alle erweiterten Eigenschaften der Datei durchgehen
                for($i=0; $i -lt $MaxProps; $i++)
                {
                    # Stimmt der Name mit dem gewünschten Namen überein?
                    if($ShellFolder.GetDetailsOf($null, $i) -eq $Prop)
                    {
                        # Ja, dann Name und Wert der Eigenschaft als Objekt zur Hashtable hinzufügen
                        $FileProps += @{$Prop = $ShellFolder.GetDetailsOf($ShellFile, $i)}
                        break
                    }
                }
            }
            # Rückgabe eines Objekts mit den gesuchten Eigenschaften und deren Werte
            [PSCustomObject]$FileProps
        }
    }

}
