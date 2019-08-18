#Set a new password and make it not have to change the password either.

Import-Module MSOnline

$credential = get-credential

Connect-MsolService -Credential $credential

Set-MsolUserPassword -UserPrincipalName testuser@company.onmicrosoft.com -ForceChangePassword $false -NewPassword Password123