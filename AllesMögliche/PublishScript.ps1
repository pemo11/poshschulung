<#
 .Synopsis
 Publish a Script to PSGallery
#>

$Ps1Path = Join-Path -Path $PSScriptRoot -ChildPath GetExtendedFileProperties.ps1

# $APIKey = "oy2nxhionmupukv5uocqp22zibbst4yujldeytwhknu4k4"

# Update-ScriptFileInfo -Path .\GetExtendedFileProperties.ps1 -ReleaseNotes "Bug-Fixing so it not only works with media files" -Version 1.1

# Test-ScriptFileInfo -Path $Ps1Path

# Funktioniert leider nicht???
# Publish-Script -Path $Ps1Path -NuGetApiKey $APIKey -Repository PSGallery -Force 

$MyGetKey = "d1aa07e8-d006-410a-b040-acf131460a2f"

Publish-Script -Path $Ps1Path -NuGetApiKey $MyGetKey -Repository PoshRepo -Force
