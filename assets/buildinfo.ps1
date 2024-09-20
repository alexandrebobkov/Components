# Author: Alexander B.
# This PowerShell script collects information about computer hardware and saves it in a text file.

$System = Get-CimInstance CIM_ComputerSystem
$OS = Get-CimInstance CIM_OperatingSystem
$CPU = Get-CimInstance CIM_Processor
$Storage = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID = 'C:'"
$InfoFile = "pcbuildinfo.txt"

Write-Host "PC Hardware Information"
# Write computer configuration to a text file
"PC Hardware Information" > $InfoFile
" " >> $InfoFile
"This is " + $System.Model + ", and was manufactured by " + $System.Manufacturer >> $InfoFile
"The name of this computer is " + $System.Name + "." >> $InfoFile
"The operating system installed on this computer is " + $OS.caption >> $InfoFile
" " >> $InfoFile
"The CPU, RAM and free storage space are as follows: " >> $InfoFile
" " >> $InfoFile
"CPU: " +$CPU.Name >> $InfoFile
"RAM: " + "{0:N2}" -f ($System.TotalPhysicalMemory/1GB) + " GB" >> $InfoFile
"HDD Capacity: "  + "{0:N2}" -f ($Storage.Size/1GB) + " GB" >> $InfoFile

# Print hardware summary on a screen
Write-Host "Model: " $System.Model
Write-Host "Computer: " $System.Name
Write-Host "OS: " $OS.Caption
Write-Host "CPU: " $CPU.Name

#tree /f > directory.txt

# > pcbuildinfo.txt
