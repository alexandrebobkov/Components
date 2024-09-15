<#
.SYNOPSIS
Renames files

Written by: Alexander Bobkov
Date: Sep 15, 2024

#>

# Script
Get-ChildItem -Path . -Filter "*.txt" | forEach-Object {
    Rename-Item -Path $_.Name -NewName $_.Name.Replace("txt", "bat") -Verbose
    Write-Host $_.Name
}

# One-liner
#Get-ChildItem -Path . -Recurse -Include "*.txt" | Rename-Item -NewName { $_.Name -replace ".txt", ".bat" }