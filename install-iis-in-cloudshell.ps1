Set-AzVMExtension `
  -ResourceGroupName RGNAMEHERE `
  -ExtensionName IIS `
  -VMName VMNAMEHERE `
  -Publisher Microsoft.Compute `
  -ExtensionType CustomScriptExtension `
  -TypeHandlerVersion 1.4 `
  -SettingString '{"commandToExecute":"powershell Add-WindowsFeature Web-Server; powershell Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername)"}' `
  -Location EastUS2

Select-AzureRmSubscription -SubscriptionName 'SUBSCRIPTIONNAMEHERE'