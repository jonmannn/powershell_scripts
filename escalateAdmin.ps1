$LoggedInUser = Get-WmiObject -Class Win32_NetworkLoginProfile | 
Sort-Object -Property LastLogon -Descending | 
Select-Object -Property * -First 1 | 
Where-Object {$_.LastLogon -match "(\d{14})"} | 
Foreach-Object { New-Object PSObject -Property @{ Name=$_.Name;LastLogon=[datetime]::ParseExact($matches[0], "yyyyMMddHHmmss", $null)}} |
select name

$ObjDomain = $LoggedInUser.name.Split("\")[0]

$ObjName = $LoggedInUser.name.Split("\")[1]

$group = [ADSI]"WinNT://$($env:COMPUTERNAME)/Administrators"

$group.Add("WinNT://$($ObjDomain)/$($ObjName)") 