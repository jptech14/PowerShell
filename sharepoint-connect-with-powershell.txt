### connect to sharepoint online with powershell
### update the sharepoint powershell module

Install-Module -Name Microsoft.Online.SharePoint.PowerShell

Update-Module -Name Microsoft.Online.SharePoint.PowerShell

Connect-SPOService -Url https://testnetwork-admin.sharepoint.com/ -Credential testadmain@testnework.onmicrosoft.com
