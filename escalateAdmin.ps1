$logged_in_user = Get-WMIObject -class Win32_ComputerSystem | Select-Object username | Select-String "username"
$logged_in_user = [string]$logged_in_user
$logged_in_user = $logged_in_user.Trim("}").Substring(11)

$group = "Administrators";
$groupObj =[ADSI]"WinNT://./$group,group" 
$userObj = [ADSI]"WinNT://$logged_in_user,user"
$groupObj.Add($userObj.Path)
