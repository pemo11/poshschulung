<#
 .Synopsis
 Abfrage der .NET-Versionsnummern v4.0 und darüber
 .Notes
 Ältere Versionen (2.0 und 3.5) können nicht mit diesem Schlüssel abgefragt werden
#>
 
dir hklm:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319\SKUs | Select-Object @{name="Version";
 e={$r=$_.Name -match ".*=v(\d\.\d[.\d]*)";if($r){$Matches[1]}}} | Where-Object Version | 
  Sort-Object -Property Version -Unique
