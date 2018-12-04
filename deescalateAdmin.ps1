$LoggedInUser = Get-WMIObject -class Win32_ComputerSystem | select username

$ObjDomain = $LoggedInUser.username.Split("\")[0]

$ObjName = $LoggedInUser.username.Split("\")[1]

$group = [ADSI]"WinNT://$($env:COMPUTERNAME)/Administrators"

$group.Remove("WinNT://$($ObjDomain)/$($ObjName)") 