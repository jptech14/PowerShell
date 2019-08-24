## New Resource Group

## If no Resource Groups, run the command below
## New-AzResourceGroup -Name myResourceGroup -Location EastUS

## Enter credentials to remote on to the vm

$cred = Get-Credential

## New Web Server VM with IIS installed

New-AzVm `
    -ResourceGroupName "myResourceGroup" `
    -Name "myVM" `
    -Location "East US" `
    -VirtualNetworkName "myVnet" `
    -SubnetName "mySubnet" `
    -SecurityGroupName "myNetworkSecurityGroup" `
    -PublicIpAddressName "myPublicIpAddress" `
    -OpenPorts 80,3389
    -Credential $cred

## Install IIS

Install-WindowsFeature -name Web-Server -IncludeManagementTools

