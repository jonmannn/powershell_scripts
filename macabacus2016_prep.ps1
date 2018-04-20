
#requires -version 2
<#
.SYNOPSIS
  Creates all necessary registry entries required to load Macabacus 2016 on a multi-user system
.DESCRIPTION
  Creates Registry Hierarchy and then fills in values

.NOTES
  Version:        1.0
  Author:         Jon Mann
  Creation Date:  04.20.2018
  Purpose/Change: Initial script development
#>

# Tells script to quit on any error, even passive ones
$ErrorActionPreference = “Stop”

# Registry folder creations
New-Item -Path HKCU:\SOFTWARE\Microsoft\Office -Name Excel

New-Item -Path HKCU:\SOFTWARE\Microsoft\Office\Excel -Name Addins

New-Item -Path HKCU:\SOFTWARE\Microsoft\Office\Excel\Addins -Name Macabacus2016

# Registry Key creations
New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Office\Excel\Addins\Macabacus2016 -Name Description -PropertyType String -Value 'Macabacus 2016'

New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Office\Excel\Addins\Macabacus2016 -Name FriendlyName -PropertyType String -Value 'Macabacus 2016'

New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Office\Excel\Addins\Macabacus2016 -Name LoadBehavior -PropertyType DWord -Value '2'

New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Office\Excel\Addins\Macabacus2016 -Name Manifest -PropertyType String -Value 'C:\Program Files (x86)\Macabacus\Macabacus 2016\Macabacus.Excel.vsto|vstolocal'

#Dialogue to popup to inform users that Excel is ready
$wshell = New-Object -ComObject Wscript.Shell
$wshell.Popup("Macabacus is ready! It is now safe to launch Excel.",0,"Window",0)