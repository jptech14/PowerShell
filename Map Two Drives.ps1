
$Net = New-Object -ComObject WScript.Network  
$Rename = New-Object -ComObject Shell.Application  

#### # Map the network drives  
$Net.MapNetworkDrive("J:", '\\192.168.1.1\Home')  
$Net.MapNetworkDrive("K:", '\\192.168.1.1\Department')

#### # Rename everything  
$rename.NameSpace("J:\").Self.Name = 'Home'
$rename.NameSpace("K:\").Self.Name = 'Department'  
