@{
    Author="Pemo"
    ModuleVersion="1.3.0"
    Description="Enthaelt diverse Functions fuer meine PowerShell-Schulungen" 
    CompatiblePSEditions=@('Core','Desktop')
    PowerShellVersion="5.1"
    NestedModules = @('PoshKurs.psm1', 'AppVerwaltung.psm1', 'PoshChart.psm1', 'PoshUserInfo.psm1')
    Guid="6de9b649-8de5-4fbf-80cc-95294605c867"
    Copyright="None"
    FunctionsToExport=@('*')
    PrivateData = @{
        PSData = @{
            Tags="PowerShell-Schulung","Core"
            ProjectUri="https://github.com/pemo11/poshschulung"
        }
    }
    
       
}