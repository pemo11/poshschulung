<#
 .Synopsis
 Abfrage der .NET-Versionsnummern v4.0 und dar�ber
 .Notes
 �ltere Versionen (2.0 und 3.5) k�nnen nicht mit diesem Schl�ssel abgefragt werden
#>
 
dir hklm:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319\SKUs | Select-Object @{name="Version";
 e={$r=$_.Name -match ".*=v(\d\.\d[.\d]*)";if($r){$Matches[1]}}} | Where-Object Version | 
  Sort-Object -Property Version -Unique
