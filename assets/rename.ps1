<#
.SYNOPSIS
Renames files

Written by: Alexander Bobkov
Date: Sep 15, 2024

#>

# Script
# Specify path and original file extention
Get-ChildItem -Path . -Filter "*.txt" | forEach-Object {
    # Change file extention from original to a new one
    Rename-Item -Path $_.Name -NewName $_.Name.Replace("txt", "bat") -Verbose
    # Output the name of file that was renamed
    Write-Host $_.Name
}

# One-liner
#Get-ChildItem -Path . -Recurse -Include "*.txt" | Rename-Item -NewName { $_.Name -replace ".txt", ".bat" }