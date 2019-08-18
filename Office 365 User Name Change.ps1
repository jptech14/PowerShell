Connect-MsolService
$oldgetname = read-host "enter the incorrect username"
$newgetname = read-host "enter the correct username"
Set-MsolUserPrincipalName -UserPrincipalName $oldgetname -NewUserPrincipalName $newgetname